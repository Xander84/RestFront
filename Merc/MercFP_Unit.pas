unit MercFP_Unit;

interface

uses
  Classes, Windows, Forms, Front_DataBase_Unit, kbmMemTable, DB, MercFPrtX_TLB,
  Base_FiscalRegister_unit;

const
  cn_FontFlagHeaderLine1 = 3;   // 1-я строка заголовка
  cn_FontFlagHeaderLine2 = 3;   // 2-я строка заголовка
  cn_FontFlagHeaderLine3 = 3;   // 3-я строка заголовка
  cn_FontFlagHeaderLine4 = 3;   // 4-я строка заголовка

  cn_FontFlagCashier = 3;       // кассир
  cn_FontFlagSerialNumber = 3;  // серийный номер ККМ
  cn_FontFlagDateTime = 3;      // текущие дата и время
  cn_FontFlagDocNumber = 3;     // номер документа
  cn_FontFlagReceiptNumber = 3; // номер чека
  cn_FontFlagTaxPayerNumber = 3;// ИНН владельца

  cn_FontFlagGoodName = 16;     // наименование ТМЦ
  cn_FontFlagPosition = 3;      // продажа
  cn_FontFlagTotal = 2;         // полная сумма чека
  cn_FontFlagPay = 2;           // уплаченная сумма
  cn_FontFlagChange = 2;        // сдача
  cn_FontFlagDiscount = 2;      // скидка

  FPrintEachPart = True;

type
  TMercuryRegister = class(TMercuryFPrtX, IBaseFiscalRegister)
  private
    FFrontBase: TFrontBase;
    FDriverInit: Boolean;  
    IsInit: Boolean;

    FLastErrorNumber: Integer;
    FLastErrorDescription: String;
    FLastWarning: String;
    //вертикальное смещение строки на чековой ленте
    FIV: Integer;

    // очищение последней ошибки
    procedure ClearLastError;
    // проверяет, была ли ошибка, и если была,
    // присваивает последней ошибке ее значение
    function SetLastError: Boolean;
    procedure ShowLastError;

    //открытие чека, параметры соответствуют параметрам OpenFiscalDoc
    function OpenCheck(const CheckType: Integer): Boolean;
    // Отмена открытого чека
    function Cancel: Boolean;
    function PrintHeader: Boolean;
    function PrintTop: Boolean;
    function PrintCashier: Boolean;
    function Print: Boolean;

    procedure MoneyOperation(const Param: Integer; const Summ: Currency);    

    function GetFrontBase: TFrontBase;
    function Get_Self: Integer;
    procedure SetFrontBase(const Value: TFrontBase);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function CheckDeviceInfo: Boolean;
    function Init: Boolean;
    function PrintCheck(const Doc, DocLine, PayLine: TkbmMemTable): Boolean;

    function PrintZ1ReportWithCleaning: Boolean;
    function PrintZ2ReportWithCleaning: Boolean;
    function PrintX1ReportWithOutCleaning: Boolean;
    function PrintX2ReportWithOutCleaning: Boolean;
    procedure OpenDrawer;
    procedure EndSession;
    function OpenDay: Boolean;
    procedure MoneyIn;
    procedure MoneyOut;

    function GetDocumentNumber: Integer;

    property FrontBase: TFrontBase read GetFrontBase write SetFrontBase;
    property Self: Integer read Get_Self;
  end;

implementation

uses SysUtils, Math, DevideForm_Unit, Controls;

{ TMercuryRegister }

function TMercuryRegister.CheckDeviceInfo: Boolean;
const
  Cr = ';'#1310;
var
  NoError: Boolean;

  procedure AddToWarning(const Msg: String; var NoErr: Boolean);
  begin
    if FLastWarning <> '' then
      FLastWarning := FLastWarning + Cr;
    FLastWarning := FLastWarning + Msg;
    NoErr := False;
  end;

begin
  NoError := True;
  try
    FLastWarning := '';

    if CheckEcrStatus(3) > 0 then
      FLastWarning := 'Фискальная память близка к концу (осталось менее 30 записей)';
    if CheckEcrStatus(4) > 0 then
      AddToWarning('Фискальная память заполнена', NoError);
    if CheckDevStatus(1) > 0 then
      AddToWarning('Принтер находится в состоянии offline', NoError);
    if CheckDevStatus(5) > 0 then
      AddToWarning('Наличие ошибки принтера', NoError);
    if CheckDevStatus(6) > 0 then
      AddToWarning('наличие ошибки механики принтера', NoError);
    if CheckDevStatus(7) > 0 then
      AddToWarning('наличие ошибки авторезчика', NoError);
    if CheckDevStatus(8) > 0 then
      AddToWarning('критическая ошибка принтера', NoError);
    if CheckDevStatus(9) > 0 then
      AddToWarning('перегрев печатающей головки', NoError);
    if CheckDevStatus(10) > 0 then
    begin
      if FLastWarning <> '' then
        FLastWarning := FLastWarning + Cr;
      FLastWarning := FLastWarning + 'контрольная лента близка к завершению';
    end;
    if CheckDevStatus(11) > 0 then
    begin
      if FLastWarning <> '' then
        FLastWarning := FLastWarning + Cr;
      FLastWarning := FLastWarning + 'чековая лента близка к завершению';
    end;
    if CheckDevStatus(12) > 0 then
      AddToWarning('закончилась контрольная лента', NoError);
    if CheckDevStatus(13) > 0 then
      AddToWarning('закончилась чековая лента', NoError);
    if CheckDevStatus(15) > 0 then
      AddToWarning('принтер ожидает подкладной лист', NoError);
    if CheckDevStatus(16) > 0 then
      AddToWarning('нет бумаги по данным датчика заправки подкладного листа', NoError);
    if CheckDevStatus(17) > 0 then
      AddToWarning('нет бумаги по данным датчика выброса подкладного листа', NoError);
    if CheckDevStatus(22) > 0 then
      AddToWarning('конец бумаги или поднята печатающая головка', NoError);
    if CheckDevStatus(24) > 0 then
      AddToWarning('принтер занят, находится в состоянии offline или произошла ошибка принтера', NoError);

    Result := NoError;
  except
    Result := False;
  end
end;

procedure TMercuryRegister.EndSession;
begin
  PrintZ1ReportWithCleaning;
end;

function TMercuryRegister.Get_Self: Integer;
begin
  Result := Integer(Self);
end;

function TMercuryRegister.GetDocumentNumber: Integer;
begin
  // не нашёл общего счетчика документов
  Result := 0;
end;

function TMercuryRegister.GetFrontBase: TFrontBase;
begin
  Result := FFrontBase;
end;

function TMercuryRegister.Init: Boolean;
begin
  if not IsInit then
  begin
    Result := False;
    if FDriverInit then
    begin
      ClearLastError;
      try
        Open;
        
        if SetLastError then
          exit;

        if not CheckDeviceInfo then
        begin
          if FLastWarning <> '' then
            MessageBox(Application.Handle, PChar(FLastWarning),
              'Внимание', MB_OK or MB_ICONEXCLAMATION);
          exit;
        end;

        Result := True;
        IsInit := True;
      except
        SetLastError;
      end;
    end;
  end else
    Result := True;
end;

procedure TMercuryRegister.MoneyIn;
begin

end;

procedure TMercuryRegister.MoneyOut;
begin

end;

procedure TMercuryRegister.OpenDrawer;
begin
  // Открываем денежный ящик подавая импульс длиной 200мс на первый канал
  try
    ExternalPulse(1, 20, 10, 1);
  except
    ShowLastError;
  end;
end;

function TMercuryRegister.PrintCheck(const Doc, DocLine,
  PayLine: TkbmMemTable): Boolean;
begin



end;

function TMercuryRegister.PrintX1ReportWithOutCleaning: Boolean;
begin
  Result := False;
  if FDriverInit then
  begin
    ClearLastError;
    try
      XReport(0);
      if SetLastError then
        exit;
      Result := True;  
    except
      ShowLastError;
    end;
  end;
end;

function TMercuryRegister.PrintX2ReportWithOutCleaning: Boolean;
begin
  Result := False;
  MessageBox(Application.Handle, PChar('Данный вид отчёта не поддерживается'),
    'Внимание', MB_OK or MB_ICONEXCLAMATION);
end;

function TMercuryRegister.PrintZ1ReportWithCleaning: Boolean;
begin
  Result := False;
  if FDriverInit then
  begin
    ClearLastError;
    try
      ZReport(1);
      if SetLastError then
        exit;
      Result := True;  
    except
      ShowLastError;
    end;
  end;
end;

function TMercuryRegister.PrintZ2ReportWithCleaning: Boolean;
begin
  Result := False;
  MessageBox(Application.Handle, PChar('Данный вид отчёта не поддерживается'),
    'Внимание', MB_OK or MB_ICONEXCLAMATION);
end;

procedure TMercuryRegister.SetFrontBase(const Value: TFrontBase);
begin
  FFrontBase := Value;
end;

constructor TMercuryRegister.Create(AOwner: TComponent);
begin
  FDriverInit := True;
  IsInit := False;
  try
    inherited Create(AOwner);

    FLastErrorNumber := 0;
    FLastErrorDescription := ErrMessage;
    FLastWarning := '';
    FIV := 1;
  except
    MessageBox(Application.Handle, PChar('Не установлен драйвер для ФР!'),
      'Внимание', MB_OK or MB_ICONEXCLAMATION);
    FDriverInit := False;
    FLastErrorNumber := -1;
    FLastErrorDescription := 'Не удалось создать СОМ-объект для работы с ФР';
  end;
  IsInit := False;
end;

destructor TMercuryRegister.Destroy;
begin
  if FDriverInit and IsInit then
    Close(True);

  inherited;
end;

procedure TMercuryRegister.ClearLastError;
begin
  FLastErrorNumber := 0;
  FLastErrorDescription := '';
end;

function TMercuryRegister.SetLastError: Boolean;
begin
  if ErrCode <> 0 then
  begin
    FLastErrorNumber := ErrCode;
    FLastErrorDescription := ErrMessage;
  end;
  ShowLastError;
  Result := (ErrCode <> 0);
end;

procedure TMercuryRegister.ShowLastError;
begin
  if FLastErrorNumber <> 0 then
    MessageBox(Application.Handle, PChar(FLastErrorDescription),
      'Внимание', MB_OK or MB_ICONEXCLAMATION);
end;

function TMercuryRegister.OpenCheck(const CheckType: Integer): Boolean;
begin
  ClearLastError;
  Result := False;
  if FDriverInit then
  begin
    try
      if (DocStatus <> 0) and (DocStatus <> 1) then
        if not Cancel then
          exit;

      OpenFiscalDoc(CheckType);

      if SetLastError then
        exit;

      if not PrintHeader then
        exit;

      Result := True;
    except
      ShowLastError;
    end;
  end;
end;

function TMercuryRegister.Cancel: Boolean;
begin
  ClearLastError;
  Result := False;
  if FDriverInit then
  begin
    try
      CancelFiscalDoc(False);
      if SetLastError then
        exit;
      FIV := 1;

      Result := True;
    except
      ShowLastError;
    end;
  end;
end;

function TMercuryRegister.OpenDay: Boolean;
begin
  ClearLastError;
  Result := False;
  if FDriverInit then
  begin
    try
      inherited OpenDay(1, FFrontBase.UserName, False, 0);
      if SetLastError then
        exit;

      Result := True;
    except
      ShowLastError;
    end;
  end;
end;

procedure TMercuryRegister.MoneyOperation(const Param: Integer;
  const Summ: Currency);
var
  Form: TDevideForm;
  Res: Integer;
begin
  Form := TDevideForm.Create(nil);
  try
    Form.LabelCaption := 'Сумма';
    Form.ShowModal;
    if Form.ModalResult = mrOK then
      if FDriverInit then
      begin
        if not OpenCheck(Param) then
          exit;

        ClearLastError;
        try
          AddItem(0, Summ, False, 0, 0,
                  0, 0, 0, 0, '', cn_FontFlagPosition, 0, FIV, 0);
          { TODO : доделать }

        except
          ShowLastError;
        end;
      end;
  finally
    Form.Free;
  end;
end;

function TMercuryRegister.PrintHeader: Boolean;
begin
  Result := False;
  ClearLastError;
  if FDriverInit then
  begin
    try
      FIV := 1;
      // клише
      if not PrintTop then
        exit;
      FIV := 5;
      // печать серийного номера ККМ
      AddSerialNumber(cn_FontFlagSerialNumber, 0, FIV);
      if SetLastError then
        exit;
      Inc(FIV);
      // печать текущих даты и времени
      AddDateTime(cn_FontFlagDateTime, 0, FIV);
      if SetLastError then
        exit;
      Inc(FIV);
      // печать информации об операторе
      AddOperInfo(1, cn_FontFlagCashier, 0, FIV);
      if SetLastError then
        exit;

      if not PrintCashier then
        exit;
      Inc(FIV);
      // печать номера документа
      AddDocNumber(cn_FontFlagDocNumber, 0, FIV);
      if SetLastError then
        exit;
      Inc(FIV);
      // печать номера чека
      AddReceiptNumber(cn_FontFlagReceiptNumber, 0, FIV);
      if SetLastError then
        exit;
      Inc(FIV);
      // печать ИНН
      AddTaxPayerNumber(cn_FontFlagTaxPayerNumber, 0, FIV);
      if SetLastError then
        exit;
      FIV := FIV + 2;

      if not Print then
        exit;

      Result := True;
    except
      ShowLastError;
    end;
  end;
end;

function TMercuryRegister.PrintTop: Boolean;
begin
//
end;

function TMercuryRegister.PrintCashier: Boolean;
begin
  ClearLastError;
  Result := False;
  if FDriverInit then
  begin
    try
      AddCustom(FFrontBase.UserName, cn_FontFlagCashier, 8, FIV);
      Result := not SetLastError;
    except
      ShowLastError;
    end;
  end;
end;

function TMercuryRegister.Print: Boolean;
begin
  if FPrintEachPart then
  begin
    Result := False;
    ClearLastError;
    if FDriverInit then
    begin
      try
        PrintFiscalDocBuffer;
        if SetLastError then
          exit;
        FIV := 0;
        Result := True;
      except
        ShowLastError;
      end;
    end;
  end else
    Result := True;
end;

end.
