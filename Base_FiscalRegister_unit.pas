unit Base_FiscalRegister_unit;

{
  базовый интерфейс, который реальзует ф-ционал абстрактного
  фискального регистратора
}

interface

uses
  Classes, Windows, kbmMemTable, DB, Front_DataBase_Unit;

const
  // тип оплаты
  // 0 нал
  // 1 карта
  // 2 безнал
  cn_paytype_cash = 0;
  cn_paytype_credit = 1;
  cn_paytype_noncash = 2;
  cn_paytype_personalcard = 3;

type
  // структура оплаты
  TSaleSums = record
    // сумма наличных
    FCashSum: Currency;
    // сумма по карточке
    FCardSum: Currency;
    // сумма по безналу
    FCreditSum: Currency;
    // сумма сдачи
    FChangeSum: Currency;
    // по личной карточке
    FPersonalCardSum: Currency;
  end;

  // структура регистров накопления ФР
  TRegisterStucture = record
    //денежные средства на счетчиках
    Summ1: Currency;
    Summ2: Currency;
    Summ3: Currency;
    Summ4: Currency;
    SummReturn1: Currency;
    SummReturn2: Currency;
    SummReturn3: Currency;
    SummReturn4: Currency;
    //сумма внесений
    PayInSumm: Currency;
    //сумма выплат
    PayOutSumm: Currency;
  end;

  IBaseFiscalRegister = interface
  ['{308C2D25-B5F7-4801-B8E4-F09E92B7AFBA}']
    // Проверка устройства
    function CheckDeviceInfo: Boolean;
    // Инициализация
    function Init: Boolean;
    // Печать чека
    function PrintCheck(const Doc, DocLine, PayLine: TkbmMemTable; const FSums: TSaleSums): Boolean;
    // возврат чека
    // при возврате создаётся заказ с отрицательным кол-вом товара
    // в таблицу оплаты идёт оплата с отрицательным значением
    function ReturnCheck(const Doc, DocLine, PayLine: TkbmMemTable; const FSums: TSaleSums): Boolean;
    //Выплата за возвращенный товар. Печатается чек возврата с указанием суммы и вида оплаты.
    //Никакой информации о возвращенном товаре чек не содержит.
    function ReturnGoodMoney(const FSums: TSaleSums): Boolean;
    // Установка рабочей базы
    procedure SetFrontBase(const Value: TFrontBase);
    function GetFrontBase: TFrontBase;
    property FrontBase: TFrontBase read GetFrontBase write SetFrontBase;

    //отчет Z1 с гашением
    function PrintZ1ReportWithCleaning: Boolean;
    //отчет X1 без гашения
    function PrintX1ReportWithOutCleaning: Boolean;
    // открытие денежного ящика
    procedure OpenDrawer;
    // закрытие сессии (печать Z отчета)
    procedure EndSession;
    // открыте смены
    function OpenDay: Boolean;
    //деньги в кассу
    procedure MoneyIn(const Sum: Currency);
    //деньги из кассы
    procedure MoneyOut(const Sum: Currency);
    function GetDocumentNumber: Integer;
    //информация по счетчикам
    function GetRegisterInfo: TRegisterStucture;

    function Get_Self: Integer;
    property Self: Integer read Get_Self;
  end;

  TAbstractFiscalRegister = class(TObject, IBaseFiscalRegister)
  private
    FFrontBase: TFrontBase;

    function Get_Self: Integer;
    function GetFrontBase: TFrontBase;
    procedure SetFrontBase(const Value: TFrontBase);
  public
    function CheckDeviceInfo: Boolean;
    function Init: Boolean;
    function PrintCheck(const Doc, DocLine, PayLine: TkbmMemTable; const FSums: TSaleSums): Boolean;
    function ReturnCheck(const Doc, DocLine, PayLine: TkbmMemTable; const FSums: TSaleSums): Boolean;
    function ReturnGoodMoney(const FSums: TSaleSums): Boolean;
    function PrintZ1ReportWithCleaning: Boolean;
    function PrintX1ReportWithOutCleaning: Boolean;
    function OpenDay: Boolean;
    procedure MoneyIn(const Sum: Currency);
    procedure MoneyOut(const Sum: Currency);
    function GetDocumentNumber: Integer;
    procedure OpenDrawer;
    procedure EndSession;
    function GetRegisterInfo: TRegisterStucture;

    { IInterface }
    function QueryInterface(const IID: TGUID; out Obj): HResult; virtual; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;

    property Self: Integer read Get_Self;
    property FrontBase: TFrontBase read GetFrontBase write SetFrontBase;
  end;

  procedure SavePayment(const ContactKey, DocID: Integer; const PayLine: TkbmMemTable;
    const FrontBase: TFrontBase; const FSums: TSaleSums; Revert: Boolean = False);
  procedure SaveRegisters(const RegStruct: TRegisterStucture; const FrontBase: TFrontBase);

  procedure WriteLogToFile(const Str, UserName: String);

implementation

uses
  SysUtils, Forms, TouchMessageBoxForm_Unit, Dialogs;

procedure WriteLogToFile(const Str, UserName: String);
const
  LogFileName = 'FiscalLog.txt';

var
  LStrings: TStrings;
  FullFileName: String;
begin
  try
    LStrings := TStringList.Create;
    try
      FullFileName := ExtractFileDir(Application.ExeName)+ '\' + LogFileName;
//      if FileExists(FullFileName) then
//        LStrings.LoadFromFile(FullFileName);
      LStrings.Add('----------------'#13#10 + DateTimeToStr(Now) + #13#10 +
        'Пользователь: ' + UserName + #13#10 + Str);
      try
        LStrings.SaveToFile(FullFileName);
      except
      end;
    finally
      LStrings.Free;
    end;
  except
    //
  end;
end;

procedure SaveRegisters(const RegStruct: TRegisterStucture; const FrontBase: TFrontBase);
begin
  with RegStruct do
  begin
    FrontBase.SaveRegisters(Summ1, Summ2, Summ3, Summ4, SummReturn1, SummReturn2,
      SummReturn3, SummReturn4, PayInSumm, PayOutSumm);
  end;
end;

procedure SavePayment(const ContactKey, DocID: Integer; const PayLine: TkbmMemTable;
  const FrontBase: TFrontBase; const FSums: TSaleSums; Revert: Boolean);
var
  FRubPayTypeKey: Integer;
begin
  FRubPayTypeKey := FrontBase.GetIDByRUID(mn_RUBpaytypeXID, mn_RUBpaytypeDBID);

  PayLine.DisableControls;
  try
    PayLine.First;
    try
      while not PayLine.Eof do
      begin
        if PayLine.FieldByName('USR$PAYTYPEKEY').AsInteger <> FRubPayTypeKey then
          FrontBase.SavePayment(ContactKey, DocID,
            PayLine.FieldByName('USR$PAYTYPEKEY').AsInteger,
            PayLine.FieldByName('USR$PERSONALCARDKEY').AsInteger, PayLine.FieldByName('SUM').AsCurrency, Revert)
        else
          FrontBase.SavePayment(ContactKey, DocID,
            PayLine.FieldByName('USR$PAYTYPEKEY').AsInteger,
            PayLine.FieldByName('USR$PERSONALCARDKEY').AsInteger, (PayLine.FieldByName('SUM').AsCurrency - FSums.FChangeSum), Revert);

        PayLine.Next;
      end;
    except
      raise;
    end;
  finally
    PayLine.EnableControls;
  end;
end;

{ TAbstractFiscalRegister }

function TAbstractFiscalRegister.CheckDeviceInfo: Boolean;
begin
  Result := True;
end;

procedure TAbstractFiscalRegister.EndSession;
begin

end;

function TAbstractFiscalRegister.GetDocumentNumber: Integer;
begin
  Result := 0;
end;

function TAbstractFiscalRegister.GetFrontBase: TFrontBase;
begin
  Result := FFrontBase;
end;

function TAbstractFiscalRegister.GetRegisterInfo: TRegisterStucture;
begin

end;

function TAbstractFiscalRegister.Get_Self: Integer;
begin
  Result := Integer(Self);
end;

function TAbstractFiscalRegister.Init: Boolean;
begin
  Result := True;
end;

procedure TAbstractFiscalRegister.MoneyIn(const Sum: Currency);
begin

end;

procedure TAbstractFiscalRegister.MoneyOut(const Sum: Currency);
begin

end;

function TAbstractFiscalRegister.OpenDay: Boolean;
begin
  Result := True;
end;

procedure TAbstractFiscalRegister.OpenDrawer;
begin

end;

function TAbstractFiscalRegister.PrintCheck(const Doc, DocLine,
  PayLine: TkbmMemTable; const FSums: TSaleSums): Boolean;
begin
  try
    if Doc.State <> dsEdit then
      Doc.Edit;
    Doc.FieldByName('USR$WHOPAYOFFKEY').AsInteger := FFrontBase.ContactKey;
    Doc.FieldByName('USR$PAY').AsInteger := 1;
    Doc.FieldByName('USR$LOGICDATE').AsDateTime := FFrontBase.GetLogicDate;
    Doc.FieldByName('USR$SYSNUM').AsInteger := 0;
    if Doc.FieldByName('usr$timecloseorder').IsNull then
      Doc.FieldByName('usr$timecloseorder').AsDateTime := Now;

    SavePayment(FFrontBase.ContactKey, Doc.FieldByName('ID').AsInteger,
      PayLine, FFrontBase, FSums);

    Doc.Post;

    Result := True;
  except
    on E: Exception do
    begin
      Touch_MessageBox('Внимание', 'Ошибка при сохранении чека ' + E.Message, MB_OK, mtError);
      Result := False;
    end;
  end;
end;

function TAbstractFiscalRegister.PrintX1ReportWithOutCleaning: Boolean;
begin
  Result := True;
end;

function TAbstractFiscalRegister.PrintZ1ReportWithCleaning: Boolean;
begin
  Result := True;
end;

function TAbstractFiscalRegister.QueryInterface(const IID: TGUID;
  out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

function TAbstractFiscalRegister.ReturnCheck(const Doc, DocLine,
  PayLine: TkbmMemTable; const FSums: TSaleSums): Boolean;
begin
  try
    if Doc.State <> dsEdit then
      Doc.Edit;
    Doc.FieldByName('USR$WHOPAYOFFKEY').AsInteger := FFrontBase.ContactKey;
    Doc.FieldByName('USR$PAY').AsInteger := 1;
    Doc.FieldByName('USR$LOGICDATE').AsDateTime := FFrontBase.GetLogicDate;
    Doc.FieldByName('USR$SYSNUM').AsInteger := 0;
    if Doc.FieldByName('usr$timecloseorder').IsNull then
      Doc.FieldByName('usr$timecloseorder').AsDateTime := Now;

    SavePayment(FFrontBase.ContactKey, Doc.FieldByName('ID').AsInteger,
      PayLine, FFrontBase, FSums, True);

    Doc.Post;
    Result := True;
  except
    on E: Exception do
    begin
      Touch_MessageBox('Внимание', 'Ошибка при сохранении чека ' + E.Message, MB_OK, mtError);
      Result := False;
    end;
  end;
end;

function TAbstractFiscalRegister.ReturnGoodMoney(const FSums: TSaleSums): Boolean;
begin
  Result := True;
end;

procedure TAbstractFiscalRegister.SetFrontBase(const Value: TFrontBase);
begin
  FFrontBase := Value;
end;

function TAbstractFiscalRegister._AddRef: Integer;
begin
  Result := -1;
end;

function TAbstractFiscalRegister._Release: Integer;
begin
  Result := -1;
end;

end.
