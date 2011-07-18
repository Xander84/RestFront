unit MercFP_Unit;

interface

uses
  Classes, Windows, Forms, Front_DataBase_Unit, kbmMemTable, DB, MercFPrtX_TLB,
  Base_FiscalRegister_unit;

const
  cn_FontFlagHeaderLine1 = 3; // 1-я строка заголовка
  cn_FontFlagHeaderLine2 = 3; // 2-я строка заголовка
  cn_FontFlagHeaderLine3 = 3; // 3-я строка заголовка
  cn_FontFlagHeaderLine4 = 3; // 4-я строка заголовка

  cn_FontFlagCashier = 0; // кассир
  cn_FontFlagSerialNumber = 0; // серийный номер ККМ
  cn_FontFlagDateTime = 0; // текущие дата и время
  cn_FontFlagDocNumber = 0; // номер документа
  cn_FontFlagReceiptNumber = 0; // номер чека
  cn_FontFlagTaxPayerNumber = 0; // ИНН владельца

  cn_FontFlagGoodName = 0; // наименование ТМЦ
  cn_FontFlagPosition = 0; // продажа
  cn_FontFlagTotal = 2; // полная сумма чека
  cn_FontFlagPay = 2; // уплаченная сумма
  cn_FontFlagChange = 2; // сдача
  cn_FontFlagDiscount = 2; // скидка

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
    // вертикальное смещение строки на чековой ленте
    FIV: Integer;
    FFRRoundOption: Integer;

    // очищение последней ошибки
    procedure ClearLastError;
    // проверяет, была ли ошибка, и если была,
    // присваивает последней ошибке ее значение
    function SetLastError: Boolean;
    procedure ShowLastError;

    // открытие чека, параметры соответствуют параметрам OpenFiscalDoc
    function OpenCheck(const CheckType: Integer): Boolean;
    // Отмена открытого чека
    function Cancel: Boolean;
    function PrintHeader: Boolean;
    function PrintTop: Boolean;
    function PrintCashier: Boolean;
    function Print: Boolean;

    procedure MoneyOperation(const Param: Integer; Sum: Currency);

    function GetFrontBase: TFrontBase;
    function Get_Self: Integer;
    procedure SetFrontBase(const Value: TFrontBase);

    function Close(const Summ: Currency): Boolean; overload;
    function Close(const Summ1, Summ2, Summ3: Currency): Boolean; overload;
    // прогон ленты на LineCount строк
    function Feed(const LineCount: Integer): Boolean;
    function Cut(const LineCount: Integer): Boolean;

    { позиция чека
      Quantity - кол-во (допускает 3 знака после запятой)
      Price - цена
      GoodName - наименование ТМЦ
      Summ = Quantity * Price, округленная по правилам, установленным в кассовой системе
      DepNumber - номер отдела
      BarCode - шифр товара
      ValueName - единица измерения }
    function Sale(const Quantity, Price: Currency; const GoodName: String;
      const Summ: Currency; const DepNumber, BarCode: Integer;
      const ValueName: String; const SumDiscount: Currency): Boolean;
    procedure SetFRRoundOption(const Value: Integer);
    function GetFRRoundOption: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function CheckDeviceInfo: Boolean;
    function Init: Boolean;
    function PrintCheck(const Doc, DocLine, PayLine: TkbmMemTable;
      const FSums: TSaleSums): Boolean;
    function ReturnCheck(const Doc, DocLine, PayLine: TkbmMemTable;
      const FSums: TSaleSums): Boolean;
    function ReturnGoodMoney(const FSums: TSaleSums): Boolean;

    function PrintZ1ReportWithCleaning: Boolean;
    function PrintX1ReportWithOutCleaning: Boolean;
    procedure OpenDrawer;
    procedure EndSession;
    function OpenDay: Boolean;
    procedure MoneyIn(const Sum: Currency);
    procedure MoneyOut(const Sum: Currency);

    function GetDocumentNumber: Integer;
    function GetRegisterInfo: TRegisterStucture;

    property FrontBase: TFrontBase read GetFrontBase write SetFrontBase;
    property Self: Integer read Get_Self;

    property FRRoundOption
      : Integer read GetFRRoundOption write SetFRRoundOption;
  end;

implementation

uses
  SysUtils, TouchMessageBoxForm_Unit, Dialogs;

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
      FLastWarning :=
        'Фискальная память близка к концу (осталось менее 30 записей)';
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
      AddToWarning('нет бумаги по данным датчика заправки подкладного листа',
        NoError);
    if CheckDevStatus(17) > 0 then
      AddToWarning('нет бумаги по данным датчика выброса подкладного листа',
        NoError);
    if CheckDevStatus(22) > 0 then
      AddToWarning('конец бумаги или поднята печатающая головка', NoError);
    if CheckDevStatus(24) > 0 then
      AddToWarning(
        'принтер занят, находится в состоянии offline или произошла ошибка принтера'
          , NoError);

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
  try
    QueryLastDocInfo;
    Result := LastDocNumber;
  except
    Result := 0;
  end;
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
        PortNum := FFrontBase.FiscalComPort;
        BaudRate := FFrontBase.BaudRate;
        Password := '0000';
        InternalTimeout := 1000;
        ExternalTimeout := 1000;
        // Active := 0;
        RetryOperation := False;
        Open;

        if SetLastError then
          exit;

        if not CheckDeviceInfo then
        begin
          if FLastWarning <> '' then
            Touch_MessageBox('Внимание', FLastWarning, MB_OK, mtWarning);
          exit;
        end;

        Result := True;
        IsInit := True;
      except
        SetLastError;
      end;
    end;
  end
  else
    Result := True;
end;

procedure TMercuryRegister.MoneyIn(const Sum: Currency);
begin
  MoneyOperation(motCashIn, Sum);
//  Cut(0)
end;

procedure TMercuryRegister.MoneyOut(const Sum: Currency);
begin
  MoneyOperation(motCashOut, Sum);
//  Cut(0)
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

function TMercuryRegister.PrintCheck(const Doc, DocLine, PayLine: TkbmMemTable;
  const FSums: TSaleSums): Boolean;
var
  TotalDiscount: Currency;
  GoodName: String;
  Quantity, Price, SumDiscount, Summ: Currency;
  QuantityStr: String;
  PriceStr: String;
begin
  FIV := 0;
  Result := False;
  Assert(Assigned(FFrontBase), 'FrontBase not Assigned');

  if FDriverInit then
  begin
    try
      OpenCheck(motSale);
    except
      SetLastError;
    end;

    DocLine.First;
    TotalDiscount := 0;
    while not DocLine.Eof do
    begin
      if DocLine.FieldByName('USR$NOPRINT').AsInteger <> 1 then
      begin
        GoodName := DocLine.FieldByName('GOODNAME').AsString;

        QuantityStr := CurrToStr(DocLine.FieldByName('usr$quantity').AsCurrency);
        PriceStr := CurrToStr(DocLine.FieldByName('usr$costncu').AsCurrency);
        if Length(GoodName) > 35 then
          Delete(GoodName, 36, Length(GoodName))
        else
        begin
          while Length(GoodName) < 34 do
            GoodName := GoodName + ' ';
          GoodName := GoodName + '.';
        end;
        GoodName := GoodName + QuantityStr + 'x' + PriceStr;

        Quantity := 1; //DocLine.FieldByName('usr$quantity').AsCurrency;
        Price := DocLine.FieldByName('usr$sumncu').AsCurrency;
        Summ := DocLine.FieldByName('usr$sumncuwithdiscount').AsCurrency;
        SumDiscount := DocLine.FieldByName('usr$sumncu').AsCurrency -
          DocLine.FieldByName('usr$sumncuwithdiscount').AsCurrency;
        TotalDiscount := TotalDiscount + SumDiscount;

        Sale(Quantity, Price, GoodName, Summ, 1, 0, '', SumDiscount);
      end;
      DocLine.Next;
    end;

    Close(FSums.FCashSum, FSums.FCardSum,
      (FSums.FCreditSum + FSums.FPersonalCardSum));
    if SetLastError then
      exit;
    // Cut(0);
    Result := True;

    if Result then
    begin
      // сохраняем чек
      if Doc.State <> dsEdit then
        Doc.Edit;
      Doc.FieldByName('USR$WHOPAYOFFKEY').AsInteger := FFrontBase.ContactKey;
      Doc.FieldByName('USR$PAY').AsInteger := 1;
      Doc.FieldByName('USR$REGISTER').AsString := IntToStr(FFrontBase.CashNumber);
      Doc.FieldByName('USR$LOGICDATE').AsDateTime := FFrontBase.GetLogicDate;
      Doc.FieldByName('USR$SYSNUM').AsInteger := GetDocumentNumber;
      if Doc.FieldByName('usr$timecloseorder').IsNull then
        Doc.FieldByName('usr$timecloseorder').AsDateTime := Now;
      try
        SavePayment(FFrontBase.ContactKey, Doc.FieldByName('ID').AsInteger,
          PayLine, FFrontBase, FSums);
      except
        { TODO: Issue 50 }
      end;
      Doc.Post;
    end;

  end
  else
    Touch_MessageBox('Внимание', 'Не установлен драйвер для ФР!', MB_OK, mtError);
end;

function TMercuryRegister.PrintX1ReportWithOutCleaning: Boolean;
begin
  Result := False;
  if FDriverInit then
  begin
    ClearLastError;
    try
      XReport(1);
      if SetLastError then
        exit;
      Result := True;
    except
      ShowLastError;
    end;
  end;
end;

function TMercuryRegister.PrintZ1ReportWithCleaning: Boolean;
begin
  Result := False;
  if FDriverInit then
  begin
    ClearLastError;
    try
      SaveRegisters(GetRegisterInfo, FrontBase);
      ZReport(1);
      if SetLastError then
        exit;
      Result := True;
    except
      ShowLastError;
    end;
  end;
end;

function TMercuryRegister.ReturnCheck(const Doc, DocLine,
  PayLine: TkbmMemTable; const FSums: TSaleSums): Boolean;
var
  TotalDiscount: Currency;
  GoodName: String;
  Quantity, Price, SumDiscount, Summ: Currency;
  QuantityStr: String;
  PriceStr: String;
begin
  FIV := 0;
  Result := False;
  Assert(Assigned(FFrontBase), 'FrontBase not Assigned');

  if FDriverInit then
  begin
    try
      if (FSums.FCardSum + FSums.FCreditSum + FSums.FPersonalCardSum) <> 0 then
        OpenCheck(motRefundCashless)
      else
        OpenCheck(motRefund);
    except
      SetLastError;
    end;

    DocLine.First;
    TotalDiscount := 0;
    while not DocLine.Eof do
    begin
      GoodName := DocLine.FieldByName('GOODNAME').AsString;

      QuantityStr := CurrToStr(-DocLine.FieldByName('usr$quantity').AsCurrency);
      PriceStr := CurrToStr(DocLine.FieldByName('usr$costncu').AsCurrency);
      if Length(GoodName) > 35 then
        Delete(GoodName, 36, Length(GoodName))
      else
      begin
        while Length(GoodName) < 34 do
          GoodName := GoodName + ' ';
        GoodName := GoodName + '.';
      end;
      GoodName := GoodName + QuantityStr + 'x' + PriceStr;

      Quantity := 1; //-DocLine.FieldByName('usr$quantity').AsCurrency;
      Price := -DocLine.FieldByName('usr$sumncu').AsCurrency;
      Summ := -DocLine.FieldByName('usr$sumncuwithdiscount').AsCurrency;
      SumDiscount := -DocLine.FieldByName('usr$sumncu').AsCurrency +
        DocLine.FieldByName('usr$sumncuwithdiscount').AsCurrency;
      TotalDiscount := TotalDiscount + SumDiscount;

      Sale(Quantity, Price, GoodName, Summ, 1, 0, '', SumDiscount);

      DocLine.Next;
    end;

    Close(FSums.FCashSum, FSums.FCardSum,
      (FSums.FCreditSum + FSums.FPersonalCardSum));
    if SetLastError then
      exit;
    // Cut(0);
    Result := True;

    if Result then
    begin
      // сохраняем чек
      if Doc.State <> dsEdit then
        Doc.Edit;
      Doc.FieldByName('USR$WHOPAYOFFKEY').AsInteger := FFrontBase.ContactKey;
      Doc.FieldByName('USR$PAY').AsInteger := 1;
      Doc.FieldByName('USR$REGISTER').AsString := IntToStr(FFrontBase.CashNumber);
      Doc.FieldByName('USR$LOGICDATE').AsDateTime := FFrontBase.GetLogicDate;
      Doc.FieldByName('USR$SYSNUM').AsInteger := GetDocumentNumber;
      if Doc.FieldByName('usr$timecloseorder').IsNull then
        Doc.FieldByName('usr$timecloseorder').AsDateTime := Now;
      try
        SavePayment(FFrontBase.ContactKey, Doc.FieldByName('ID').AsInteger,
          PayLine, FFrontBase, FSums);
      except
        { TODO: Issue 50 }
      end;
      Doc.Post;
    end;
  end
  else
    Touch_MessageBox('Внимание', 'Не установлен драйвер для ФР!', MB_OK, mtError);
end;

function TMercuryRegister.ReturnGoodMoney(const FSums: TSaleSums): Boolean;
begin
  { TODO : Реализовать }
  Result := True;
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
    Touch_MessageBox('Внимание', 'Не установлен драйвер для ФР!', MB_OK, mtError);
    FDriverInit := False;
    FLastErrorNumber := -1;
    FLastErrorDescription := 'Не удалось создать СОМ-объект для работы с ФР';
  end;
  IsInit := False;
end;

destructor TMercuryRegister.Destroy;
begin
  if FDriverInit and IsInit then
    inherited Close(True);

  inherited;
end;

procedure TMercuryRegister.ClearLastError;
begin
  FLastErrorNumber := 0;
  FLastErrorDescription := '';
end;

function TMercuryRegister.Close(const Summ1, Summ2, Summ3: Currency): Boolean;
begin
  ClearLastError;
  Result := False;
  if FDriverInit then
  begin
    try
      AddTotal(cn_FontFlagTotal, 0, FIV, 0);
      if SetLastError then
        exit;

      Inc(FIV);
      if CurrentOper = motSale then
      begin
        // печать уплаченной суммы
        if Summ3 > 0 then
          AddPay(mptCashCard, Summ1, Summ3, '', cn_FontFlagPay, 0, FIV, 0)
        else if Summ2 > 0 then
          AddPay(mptCashCredit, Summ1, Summ2, '', cn_FontFlagPay, 0, FIV, 0)
        else
          AddPay(mptCash, Summ1, 0, '', cn_FontFlagPay, 0, FIV, 0);
        if SetLastError then
          exit;
        Inc(FIV);
        // печать уплаченной суммы
        AddChange(cn_FontFlagChange, 0, FIV, 0);
        if SetLastError then
          exit;
        Inc(FIV);
      end;
      CloseFiscalDoc;
      if SetLastError then
        exit;
      // if not Feed(5) then
      // exit;
      Result := True;
    except
      ShowLastError;
      // отменяем фискальный документ
      Cancel;
    end;
  end
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
  begin
    Touch_MessageBox('Внимание', FLastErrorDescription, MB_OK, mtWarning);
    WriteLogToFile(FLastErrorDescription, FFrontBase.UserName);
  end;
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

procedure TMercuryRegister.MoneyOperation(const Param: Integer; Sum: Currency);
begin
  if FDriverInit then
  begin
    if not OpenCheck(Param) then
      exit;

    ClearLastError;
    try
      AddItem(0, Sum, False, 0, 0, 0, 0, 0, 0, '', cn_FontFlagPosition, 0, FIV,
        0);

      if SetLastError then
        exit;
      Inc(FIV);

      if Param = motCashIn then
        Close(0)
      else
        Close(Sum);
    except
      ShowLastError;
    end;
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
      FIV := 2;
      // печать информации об операторе
      AddOperInfo(0, cn_FontFlagCashier, 0, FIV);
      if SetLastError then
        exit;
      Inc(FIV);
      // печать серийного номера ККМ
      AddSerialNumber(cn_FontFlagSerialNumber, 0, FIV);
      if SetLastError then
        exit;
      Inc(FIV);
      // печать ИНН
      AddTaxPayerNumber(cn_FontFlagTaxPayerNumber, 0, FIV);
      if SetLastError then
        exit;
      Inc(FIV);

      // печать текущих даты и времени
      AddDateTime(cn_FontFlagDateTime, 0, FIV);
      if SetLastError then
        exit;
      Inc(FIV);

      // if not PrintCashier then
      // exit;
      // Inc(FIV);
      // печать номера документа

      AddDocNumber(cn_FontFlagDocNumber, 0, FIV);
      if SetLastError then
        exit;
      Inc(FIV);
      // печать номера чека
      AddReceiptNumber(cn_FontFlagReceiptNumber, 0, FIV);
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
{ var
  I : Integer;
  Res: Boolean; }
begin
  ClearLastError;
  Result := False;
  if FDriverInit then
  begin
    try
      AddHeaderLine(1, 1, 0, 1);
      {
        AddHeaderLine(2, 2, 0, 2);
        AddHeaderLine(3, 3, 0, 3);
        AddHeaderLine(4, 4, 0, 4);
        }
      Result := not SetLastError;
    except
      ShowLastError;
    end;
  end;
end;

function TMercuryRegister.PrintCashier: Boolean;
begin
  ClearLastError;
  Result := False;
  if FDriverInit then
  begin
    try
      AddCustom(Copy(FFrontBase.UserName, 1, 39), cn_FontFlagCashier, 8, FIV);
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
  end
  else
    Result := True;
end;

function TMercuryRegister.Close(const Summ: Currency): Boolean;
begin
  ClearLastError;
  Result := False;
  if FDriverInit then
  begin
    try
      AddTotal(cn_FontFlagTotal, 0, FIV, 0);
      if SetLastError then
        exit;

      Inc(FIV);
      if CurrentOper = motSale then
      begin
        AddPay(mptCash, Summ, 0, '', cn_FontFlagPay, 0, FIV, 0);
        if SetLastError then
          exit;
        Inc(FIV);
        // печать уплаченной суммы
        AddChange(cn_FontFlagChange, 0, FIV, 0);
        if SetLastError then
          exit;
        Inc(FIV);
      end;
      CloseFiscalDoc;
      if SetLastError then
        exit;
      // if not Feed(5) then
      // exit;
      Result := True;
    except
      ShowLastError;
      // отменяем фискальный документ
      Cancel;
    end;
  end
end;

function TMercuryRegister.Feed(const LineCount: Integer): Boolean;
begin
  ClearLastError;
  Result := False;
  if FDriverInit then
  begin
    try
      FeedAndCut(LineCount, False);
      if SetLastError then
        exit;
      FIV := FIV + LineCount;
      Result := True;
    except
      ShowLastError;
    end;
  end;
end;

function TMercuryRegister.Sale(const Quantity, Price: Currency;
  const GoodName: String; const Summ: Currency;
  const DepNumber, BarCode: Integer; const ValueName: String;
  const SumDiscount: Currency): Boolean;
var
  { ToQuantity, ToSumm, ToAdd: Currency; }
  FValueName: String;
  TempGood: String;
  { R: Integer; }
begin
  ClearLastError;
  Result := False;
  if FDriverInit then
  begin
    try
      // ToQuantity := 1;
      FValueName := Copy(ValueName, 1, 5);
      // R := FRRoundOption;
      if SetLastError then
        exit;
      TempGood := ' ' + CurrToStr(Price) + 'x' + CurrToStr(Quantity);
      TempGood := Copy(GoodName, 1, 39 - Length(TempGood)) + TempGood;
      // ToSumm := Round(ToQuantity * Price / R + 0.0000000001) * R;
      // ToAdd := Summ - ToSumm;
      // print goodname
      AddCustom(TempGood, cn_FontFlagGoodName, 0, FIV);
      if SetLastError then
        exit;
      Inc(FIV);

      if CurrentOper = motSale then // продажа
        if Quantity >= 0 then
        begin
          if SumDiscount = 0 then
          begin
            AddItem(mitItem, Summ, False, 1, BarCode, 0, -1, 0, 0, '',
              cn_FontFlagPosition, 0, FIV, 0);
            if SetLastError then
              exit;
          end;

          if SumDiscount <> 0 then
          begin
            AddItem(mitItem, Summ + SumDiscount, False, 1, BarCode, 0, -1, 0,
              0, '', cn_FontFlagPosition, 0, FIV, 0);
            if SetLastError then
              exit;
            Inc(FIV);
            // скидка
            AddItem(mitAmountAdj, -SumDiscount, False, 1, BarCode, 0, 0, 3, 0,
              '', cn_FontFlagPosition, 0, FIV, 0);
            if SetLastError then
              exit;
          end;
        end
        else // отмена позиции
        begin
          AddItem(mitVoidItem, Summ, False, 1, BarCode, 0, -1, 0, 0, '',
            cn_FontFlagPosition, 0, FIV, 0);
          if SetLastError then
            exit;
        end
        else if (CurrentOper = motRefund) or (CurrentOper = motRefundCashless) then // возврат
        begin
          AddItem(mitItem, Summ, False, 1, BarCode, 0, -1, 0, 0, '',
            cn_FontFlagPosition, 0, FIV, 0);
          if SetLastError then
            exit;
        end;
      Inc(FIV);

      if CurrentOper = motSale then
      begin
        if not Print then
          exit;
      end;
      Result := True;
    except
      ShowLastError;
    end;
  end;
end;

procedure TMercuryRegister.SetFRRoundOption(const Value: Integer);
begin
  if FDriverInit then
  begin
    ClearLastError;
    if Value = 0 then
      SetParameterInt(13, 0)
    else if Value = 5 then
      SetParameterInt(13, 1)
    else if Value = 10 then
      SetParameterInt(13, 2)
    else if Value = 100 then
      SetParameterInt(13, 3)
    else
      SetParameterInt(13, 0);

    SetLastError;
  end;
  FFRRoundOption := Value;
end;

function TMercuryRegister.GetFRRoundOption: Integer;
var
  TempRO: Integer;
begin
  if FDriverInit then
  begin
    TempRO := QueryParameterInt(13);
    if TempRO = 0 then
      FRRoundOption := 0
    else if TempRO = 1 then
      FRRoundOption := 5
    else if TempRO = 2 then
      FRRoundOption := 10
    else if TempRO = 3 then
      FRRoundOption := 100;

    Result := FFRRoundOption;
  end
  else
    Result := 0;
end;

function TMercuryRegister.GetRegisterInfo: TRegisterStucture;

  function GetRegister(const RegNumber: Integer): Currency;
  begin
    try
      Result := QueryCounter(RegNumber, True);
    except
      Result := 0;
    end;
  end;

begin
  Result.Summ1 := GetRegister(0);
  Result.Summ2 := GetRegister(1);
  Result.Summ3 := GetRegister(2);
  Result.Summ4 := GetRegister(3);
  Result.SummReturn1 := GetRegister(6);
  Result.SummReturn2 := GetRegister(7);
  Result.SummReturn3 := 0;
  Result.SummReturn4 := 0;
  Result.PayInSumm := GetRegister(9);
  Result.PayOutSumm := GetRegister(10);
end;

function TMercuryRegister.Cut(const LineCount: Integer): Boolean;
begin
  ClearLastError;
  Result := False;
  if FDriverInit then
  begin
    try
      FeedAndCut(LineCount, True);
      if SetLastError then
        exit;
      FIV := FIV + LineCount;
      Result := True;
    except
      ShowLastError;
    end;
  end;
end;

end.
