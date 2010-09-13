unit ShtrihFR_Unit;

interface

uses
  Classes, Windows, Forms, DrvFRLib_TLB, Front_DataBase_Unit, kbmMemTable, DB,
  Base_FiscalRegister_unit;

type
  TShtrihFR = class(TDrvFR, IBaseFiscalRegister)
  private
    FFrontBase: TFrontBase;
    FDriverInit: Boolean;
    IsInit: Boolean;

    function SetParams: Boolean;
    procedure ErrMessage(Err: Integer);
    procedure SetFrontBase(const Value: TFrontBase);
    function GetFrontBase: TFrontBase;
    function Get_Self: Integer;
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

{ TShtrihFR }

function TShtrihFR.CheckDeviceInfo: Boolean;
begin
  Result := True;
end;

constructor TShtrihFR.Create(AOwner: TComponent);
begin
  FDriverInit := True;
  try
    inherited Create(AOwner);
  except
    MessageBox(Application.Handle, PChar('Не установлен драйвер для ФР ''Штрих ФР''!'),
     'Внимание', MB_OK or MB_ICONEXCLAMATION);
    FDriverInit := False;
  end;
  IsInit := False;
end;

destructor TShtrihFR.Destroy;
begin

  inherited;
end;

procedure TShtrihFR.EndSession;
begin
  if FDriverInit then
    Init;
end;

procedure TShtrihFR.ErrMessage(Err: Integer);
var
  ErrStr: String;
begin
  if Err <> 0 then
    ErrStr := WideCharToString(PWideChar(ResultCodeDescription));
    MessageBox(Application.Handle, PChar(ErrStr),
      'Внимание', MB_OK or MB_ICONEXCLAMATION);
end;

function TShtrihFR.Get_Self: Integer;
begin
  Result := Integer(Self);
end;

function TShtrihFR.GetDocumentNumber: Integer;
begin
  Result := 0;
//  if FDriverInit then
end;

function TShtrihFR.GetFrontBase: TFrontBase;
begin
  Result := FFrontBase;
end;

function TShtrihFR.Init: Boolean;
begin
  Result := True;
  IsInit := True;
end;

procedure TShtrihFR.MoneyIn;
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
        Summ1 := StrToCurr(Form.Number);
        Res := CashIncome;
        if ResultCode <> 0 then
          ErrMessage(Res);
      end;
  finally
    Form.Free;
  end;
end;

procedure TShtrihFR.MoneyOut;
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
        Summ1 := StrToCurr(Form.Number);
        Res := CashOutCome;
        if ResultCode <> 0 then
          ErrMessage(Res);
      end;
  finally
    Form.Free;
  end;
end;

function TShtrihFR.OpenDay: Boolean;
begin
//
  Result := True;
end;

procedure TShtrihFR.OpenDrawer;
var
  Res: Integer;
begin
  if FDriverInit then
  begin
    Res := Inherited OpenDrawer;
    if ResultCode <> 0 then
      ErrMessage(Res);
  end;
end;

function TShtrihFR.PrintCheck(const Doc, DocLine,
  PayLine: TkbmMemTable): Boolean;
var
  Res: Integer;
  DocNumber, WaiterName: String;
  WasDiscount: Boolean;
  TotalDiscount: Currency;
  GoodName, DiscName: String;
  Quantity, Price, SumDiscount: Currency;
begin
  Result := False;
  Assert(Assigned(FFrontBase), 'FrontBase not Assigned');

  if FDriverInit then
  begin
    if Init then
    begin
      GetShortECRStatus;
      Sleep(250);
      if ECRAdvancedMode = 3 then
      begin
        ContinuePrint;
        if ResultCode <> 0 then
        begin
          CancelCheck;
          ErrMessage(ResultCode);
        end else
          Result := True;

        exit;
      end;

      DocNumber := Doc.FieldByName('NUMBER').AsString;
      DocNumber := StringReplace(DocNumber, '.', '', [rfReplaceAll]);
      DocNumber := StringReplace(DocNumber, ',', '', [rfReplaceAll]);
      if Length(DocNumber) > 5 then
        Delete(DocNumber, 5, Length(DocNumber));

      WaiterName := FFrontBase.GetNameWaiterOnID(Doc.FieldByName('usr$respkey').AsInteger, False, False);

      UseReceiptRibbon := True;
      StringForPrinting := 'Открыт - ' + DateToStr(Date) + ' ' + TimeToStr(Time);
      PrintString;
      StringForPrinting := 'Закрыт - ' + DateToStr(Date) + ' ' + TimeToStr(Time);
      PrintString;
      StringForPrinting := 'Кассир - ' + WaiterName;
      PrintString;
      Res := ResultCode;

      if Res <> 0 then
      begin
        CancelCheck;
        ErrMessage(Res);
        exit;
      end;

      TotalDiscount := 0;
      WasDiscount := False;

      DocLine.First;
      while not DocLine.Eof do
      begin
        GoodName := DocLine.FieldByName('GOODNAME').AsString;
        Quantity := DocLine.FieldByName('usr$quantity').AsCurrency;
        Price := DocLine.FieldByName('usr$costncu').AsCurrency;
        SumDiscount := Round(DocLine.FieldByName('usr$sumdiscount').AsCurrency  + 0.0001);
        TotalDiscount := TotalDiscount + SumDiscount;

        if Quantity >= 0 then
        begin
          Self.Quantity := Quantity;
          Self.Price := Price;

          Delete(GoodName, 40, Length(GoodName) - 40);
          StringForPrinting := GoodName;
          Sale;

          Res := ResultCode;
          if Res <> 0 then
          begin
            CancelCheck;
            ErrMessage(Res);
            exit;
          end;
          if DocLine.FieldByName('usr$persdiscount').AsCurrency <> 0 then
            WasDiscount := True;
        end;
        DocLine.Next;
      end;

      if TotalDiscount <> 0 then
      begin
        if WasDiscount then
          DiscName := 'Скидка'
        else
          DiscName := 'Округление';

        StringForPrinting := DiscName + ' ' + CurrToStr(TotalDiscount);
        Summ1 := Abs(TotalDiscount);
        if TotalDiscount > 0 then
          Discount
        else
          Charge;

        if Res <> 0 then
        begin
          CancelCheck;
          ErrMessage(Res);
          exit;
        end;
      end;


      CheckSubTotal;
      // сначала кредитка
      PayLine.DisableControls;
      try
        PayLine.First;
        while not PayLine.Eof do
        begin
          if (PayLine.FieldByName('PAYTYPE').AsInteger = 1) and
            (PayLine.FieldByName('SUM').AsInteger > 0) then
          begin
            Self.Summ3 := Self.Summ3 + PayLine.FieldByName('SUM').AsInteger;
          end;
          PayLine.Next;
        end;
      finally
        PayLine.EnableControls;
      end;

      // Безнал
      PayLine.DisableControls;
      try
        PayLine.First;
        while not PayLine.Eof do
        begin
          if (PayLine.FieldByName('PAYTYPE').AsInteger = 2) and
            (PayLine.FieldByName('SUM').AsInteger > 0) then
          begin
            Self.Summ2 := Self.Summ2 + PayLine.FieldByName('SUM').AsInteger;
          end;
          PayLine.Next;
        end;
      finally
        PayLine.EnableControls;
      end;

      // наличные
      PayLine.DisableControls;
      try
        PayLine.First;
        while not PayLine.Eof do
        begin
          if (PayLine.FieldByName('PAYTYPE').AsInteger = 0) and
            (PayLine.FieldByName('SUM').AsInteger > 0) then
          begin
            Self.Summ1 := Self.Summ1 + PayLine.FieldByName('SUM').AsInteger;
          end;
          PayLine.Next;
        end;
      finally
        PayLine.EnableControls;
      end;

      StringForPrinting := '';
      CloseCheck;
      Res := ResultCode;
      if Res <> 0 then
      begin
        CancelCheck;
        ErrMessage(Res);
      end else
        Result := True;
    end;
  end;
end;

function TShtrihFR.PrintX1ReportWithOutCleaning: Boolean;
begin
  Result := False;
  if FDriverInit then
  begin
    if MessageBox(Application.Handle, 'Вы действительно хотите снять отчет X1?',
      'Внимание', MB_YESNO) = IDYES then
    begin
      PrintReportWithoutCleaning;
      if ResultCode = 0 then
        Result := True
      else
        ErrMessage(ResultCode);
    end;
  end;
end;

function TShtrihFR.PrintX2ReportWithOutCleaning: Boolean;
begin
  Result := False;
  MessageBox(Application.Handle, PChar('Данный вид отчёта не поддерживается'),
    'Внимание', MB_OK or MB_ICONEXCLAMATION);
end;

function TShtrihFR.PrintZ1ReportWithCleaning: Boolean;
begin
  Result := False;
  if FDriverInit then
  begin
    if MessageBox(Application.Handle, 'Вы действительно хотите снять отчет с гашением Z1??',
      'Внимание', MB_YESNO) = IDYES then
    begin
      PrintReportWithCleaning;
      if ResultCode = 0 then
        Result := True
      else
        ErrMessage(ResultCode);
    end;
  end;
end;

function TShtrihFR.PrintZ2ReportWithCleaning: Boolean;
begin
  Result := False;
  MessageBox(Application.Handle, PChar('Данный вид отчёта не поддерживается'),
    'Внимание', MB_OK or MB_ICONEXCLAMATION);
end;

procedure TShtrihFR.SetFrontBase(const Value: TFrontBase);
begin
  FFrontBase := Value;
end;

function TShtrihFR.SetParams: Boolean;
begin
  Result := True;
end;

end.
