unit MercFP_Unit;

interface

uses
  Classes, Windows, Forms, Front_DataBase_Unit, kbmMemTable, DB, MercFPrtX_TLB,
  Base_FiscalRegister_unit;

const
  cn_FontFlagHeaderLine1 = 3; // 1-� ������ ���������
  cn_FontFlagHeaderLine2 = 3; // 2-� ������ ���������
  cn_FontFlagHeaderLine3 = 3; // 3-� ������ ���������
  cn_FontFlagHeaderLine4 = 3; // 4-� ������ ���������

  cn_FontFlagCashier = 0; // ������
  cn_FontFlagSerialNumber = 0; // �������� ����� ���
  cn_FontFlagDateTime = 0; // ������� ���� � �����
  cn_FontFlagDocNumber = 0; // ����� ���������
  cn_FontFlagReceiptNumber = 0; // ����� ����
  cn_FontFlagTaxPayerNumber = 0; // ��� ���������

  cn_FontFlagGoodName = 0; // ������������ ���
  cn_FontFlagPosition = 0; // �������
  cn_FontFlagTotal = 2; // ������ ����� ����
  cn_FontFlagPay = 2; // ���������� �����
  cn_FontFlagChange = 2; // �����
  cn_FontFlagDiscount = 2; // ������

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
    // ������������ �������� ������ �� ������� �����
    FIV: Integer;
    FFRRoundOption: Integer;

    // �������� ��������� ������
    procedure ClearLastError;
    // ���������, ���� �� ������, � ���� ����,
    // ����������� ��������� ������ �� ��������
    function SetLastError: Boolean;
    procedure ShowLastError;

    // �������� ����, ��������� ������������� ���������� OpenFiscalDoc
    function OpenCheck(const CheckType: Integer): Boolean;
    // ������ ��������� ����
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
    // ������ ����� �� LineCount �����
    function Feed(const LineCount: Integer): Boolean;
    function Cut(const LineCount: Integer): Boolean;

    { ������� ����
      Quantity - ���-�� (��������� 3 ����� ����� �������)
      Price - ����
      GoodName - ������������ ���
      Summ = Quantity * Price, ����������� �� ��������, ������������� � �������� �������
      DepNumber - ����� ������
      BarCode - ���� ������
      ValueName - ������� ��������� }
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
        '���������� ������ ������ � ����� (�������� ����� 30 �������)';
    if CheckEcrStatus(4) > 0 then
      AddToWarning('���������� ������ ���������', NoError);
    if CheckDevStatus(1) > 0 then
      AddToWarning('������� ��������� � ��������� offline', NoError);
    if CheckDevStatus(5) > 0 then
      AddToWarning('������� ������ ��������', NoError);
    if CheckDevStatus(6) > 0 then
      AddToWarning('������� ������ �������� ��������', NoError);
    if CheckDevStatus(7) > 0 then
      AddToWarning('������� ������ �����������', NoError);
    if CheckDevStatus(8) > 0 then
      AddToWarning('����������� ������ ��������', NoError);
    if CheckDevStatus(9) > 0 then
      AddToWarning('�������� ���������� �������', NoError);
    if CheckDevStatus(10) > 0 then
    begin
      if FLastWarning <> '' then
        FLastWarning := FLastWarning + Cr;
      FLastWarning := FLastWarning + '����������� ����� ������ � ����������';
    end;
    if CheckDevStatus(11) > 0 then
    begin
      if FLastWarning <> '' then
        FLastWarning := FLastWarning + Cr;
      FLastWarning := FLastWarning + '������� ����� ������ � ����������';
    end;
    if CheckDevStatus(12) > 0 then
      AddToWarning('����������� ����������� �����', NoError);
    if CheckDevStatus(13) > 0 then
      AddToWarning('����������� ������� �����', NoError);
    if CheckDevStatus(15) > 0 then
      AddToWarning('������� ������� ���������� ����', NoError);
    if CheckDevStatus(16) > 0 then
      AddToWarning('��� ������ �� ������ ������� �������� ����������� �����',
        NoError);
    if CheckDevStatus(17) > 0 then
      AddToWarning('��� ������ �� ������ ������� ������� ����������� �����',
        NoError);
    if CheckDevStatus(22) > 0 then
      AddToWarning('����� ������ ��� ������� ���������� �������', NoError);
    if CheckDevStatus(24) > 0 then
      AddToWarning(
        '������� �����, ��������� � ��������� offline ��� ��������� ������ ��������'
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
            Touch_MessageBox('��������', FLastWarning, MB_OK, mtWarning);
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
  // ��������� �������� ���� ������� ������� ������ 200�� �� ������ �����
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
      // ��������� ���
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
    Touch_MessageBox('��������', '�� ���������� ������� ��� ��!', MB_OK, mtError);
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
      // ��������� ���
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
    Touch_MessageBox('��������', '�� ���������� ������� ��� ��!', MB_OK, mtError);
end;

function TMercuryRegister.ReturnGoodMoney(const FSums: TSaleSums): Boolean;
begin
  { TODO : ����������� }
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
    Touch_MessageBox('��������', '�� ���������� ������� ��� ��!', MB_OK, mtError);
    FDriverInit := False;
    FLastErrorNumber := -1;
    FLastErrorDescription := '�� ������� ������� ���-������ ��� ������ � ��';
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
        // ������ ���������� �����
        if Summ3 > 0 then
          AddPay(mptCashCard, Summ1, Summ3, '', cn_FontFlagPay, 0, FIV, 0)
        else if Summ2 > 0 then
          AddPay(mptCashCredit, Summ1, Summ2, '', cn_FontFlagPay, 0, FIV, 0)
        else
          AddPay(mptCash, Summ1, 0, '', cn_FontFlagPay, 0, FIV, 0);
        if SetLastError then
          exit;
        Inc(FIV);
        // ������ ���������� �����
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
      // �������� ���������� ��������
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
    Touch_MessageBox('��������', FLastErrorDescription, MB_OK, mtWarning);
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
      // �����
      if not PrintTop then
        exit;
      FIV := 2;
      // ������ ���������� �� ���������
      AddOperInfo(0, cn_FontFlagCashier, 0, FIV);
      if SetLastError then
        exit;
      Inc(FIV);
      // ������ ��������� ������ ���
      AddSerialNumber(cn_FontFlagSerialNumber, 0, FIV);
      if SetLastError then
        exit;
      Inc(FIV);
      // ������ ���
      AddTaxPayerNumber(cn_FontFlagTaxPayerNumber, 0, FIV);
      if SetLastError then
        exit;
      Inc(FIV);

      // ������ ������� ���� � �������
      AddDateTime(cn_FontFlagDateTime, 0, FIV);
      if SetLastError then
        exit;
      Inc(FIV);

      // if not PrintCashier then
      // exit;
      // Inc(FIV);
      // ������ ������ ���������

      AddDocNumber(cn_FontFlagDocNumber, 0, FIV);
      if SetLastError then
        exit;
      Inc(FIV);
      // ������ ������ ����
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
        // ������ ���������� �����
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
      // �������� ���������� ��������
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

      if CurrentOper = motSale then // �������
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
            // ������
            AddItem(mitAmountAdj, -SumDiscount, False, 1, BarCode, 0, 0, 3, 0,
              '', cn_FontFlagPosition, 0, FIV, 0);
            if SetLastError then
              exit;
          end;
        end
        else // ������ �������
        begin
          AddItem(mitVoidItem, Summ, False, 1, BarCode, 0, -1, 0, 0, '',
            cn_FontFlagPosition, 0, FIV, 0);
          if SetLastError then
            exit;
        end
        else if (CurrentOper = motRefund) or (CurrentOper = motRefundCashless) then // �������
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
