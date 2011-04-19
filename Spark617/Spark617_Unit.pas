unit Spark617_Unit;

interface

uses
  Classes, Windows, Forms, SPARKAX3Lib_TLB, Front_DataBase_Unit, kbmMemTable, DB,
  Base_FiscalRegister_unit;

type
  TSpark617Register = class(TSpark617TF, IBaseFiscalRegister)
  private
    FFrontBase: TFrontBase;
    FDriverInit: Boolean;
    IsInit: Boolean;
    FLastErr: Integer;

    function SetParams: Boolean;
    procedure ErrMessage(Err: Integer);
    procedure SetFrontBase(const Value: TFrontBase);
    procedure MoneyOperation(const Param: Integer; Sum: Currency);
    function GetFrontBase: TFrontBase;
    function Get_Self: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function CheckDeviceInfo: Boolean;
    function Init: Boolean;
    function PrintCheck(const Doc, DocLine, PayLine: TkbmMemTable; const FSums: TSaleSums): Boolean;
    function ReturnGoodMoney(const FSums: TSaleSums): Boolean;

    function PrintZ1ReportWithCleaning: Boolean;
 //   function PrintZ2ReportWithCleaning: Boolean;
    function PrintX1ReportWithOutCleaning: Boolean;
 //   function PrintX2ReportWithOutCleaning: Boolean;
    procedure OpenDrawer;
    procedure EndSession;
    function OpenDay: Boolean;
    procedure MoneyIn(const Sum: Currency);
    procedure MoneyOut(const Sum: Currency);
    function GetDocumentNumber: Integer;

    property FrontBase: TFrontBase read GetFrontBase write SetFrontBase;
    property Self: Integer read Get_Self;
  end;


implementation

uses SysUtils, Math, Controls, TouchMessageBoxForm_Unit;

const
  Spark_Cash   = 8;  // ��������
  Spark_NoCash = 7;  // ������
  Spark_Credit = 1;  // �����

 { TSpark617Register }

function TSpark617Register.CheckDeviceInfo: Boolean;
var
  Res: Integer;
begin
  Result := False;
  Assert(Assigned(FFrontBase), 'FrontBase not Assigned');

  if FDriverInit then
  begin
    if GetDeviceInfo(5) = 0 then
      SetClerk(FFrontBase.UserName);
    if GetDeviceInfo(1) = 1 then
      Touch_MessageBox('��������', '����������� ����� ������!', MB_OK or MB_ICONEXCLAMATION);
    if GetDeviceInfo(8) = 1 then
    begin
      Touch_MessageBox('��������', '������� �����!', MB_OK or MB_ICONEXCLAMATION);
      exit;
    end;
    if GetDeviceInfo(9) = 1 then
    begin
      Touch_MessageBox('��������', '������ ��������!', MB_OK or MB_ICONEXCLAMATION);
      exit;
    end;
    if GetDeviceInfo(10) = 1 then
    begin
      Touch_MessageBox('��������', '������ �����������!', MB_OK or MB_ICONEXCLAMATION);
      exit;
    end;
    if GetDeviceInfo(11) = 1 then
    begin
      Touch_MessageBox('��������', '���������� ������ ���������!', MB_OK or MB_ICONEXCLAMATION);
      exit;
    end;
    if GetDeviceInfo(12) = 1 then
    begin
      Touch_MessageBox('��������', '������ ���������� ������!', MB_OK or MB_ICONEXCLAMATION);
      exit;
    end;
    if GetDeviceInfo(13) = 1 then
    begin
      Touch_MessageBox('��������', '������ � ���������� ��������!', MB_OK or MB_ICONEXCLAMATION);

      exit;
    end;
    if GetDeviceInfo(14) = 1 then
    begin
      Touch_MessageBox('��������', '���������� ������ ������� ����� (24 ����)!', MB_OK or MB_ICONEXCLAMATION);
      exit;
    end;

    // ���� ����� �������
    if GetDeviceInfo(4) = 0 then
    begin
      // ����������� ������ ������� �� ���� ���������
      Res := SetDeviceOpt(3, 0);
      ErrMessage(Res);
      // ������ �� ���� �� �.�. ��ѻ ���������
      Res := SetDeviceOpt(4, 0);
      ErrMessage(Res);
      // ������ �� ���� ������ ������� ���������
      Res := SetDeviceOpt(5, 0);
      ErrMessage(Res);
      // ������ ������ ������� � ������������ ������� �� X � Z ������� ���������
      Res := SetDeviceOpt(6, 0);
      ErrMessage(Res);
      // �� ������������ ��������� ������� ��� ���������� �������
      Res := SetDeviceOpt(7, 0);
      ErrMessage(Res);
      // �������� �� ���� ���������� �������
      Res := SetDeviceOpt(8, 1);
      ErrMessage(Res);
      // �� �������� ����� ������ ����� ������������� ������
      Res := SetDeviceOpt(9, 0);
      ErrMessage(Res);
      // ������ ����� ����
      Res := SetDeviceOpt(10, 1);
      ErrMessage(Res);
      // ������������ �����
      Res := SetDeviceOpt(11, 1);
      ErrMessage(Res);
      // �������� ����� ����� ����������� �� ������ ������� � ��������� � ��������������� �������
      Res := SetDeviceOpt(12, 1);
      ErrMessage(Res);
      // �������� ����� ����� ��������� ������� ������
      Res := SetDeviceOpt(13, 1);
      ErrMessage(Res);
      // �������� �*� ����� ������
      Res := SetDeviceOpt(14, 1);
      ErrMessage(Res);
      // �� ��������� ������� ����� � ����� ��� �������� �����
      Res := SetDeviceOpt(15, 0);
      ErrMessage(Res);
      // ������������ ��������� ��������� ����� ��� ����������� ������
      Res := SetDeviceOpt(18, 0);
      ErrMessage(Res);
      // �� ��������� ��� �������� �������� ����
      Res := SetDeviceOpt(20, 0);
      ErrMessage(Res);
      // ������� ������� ������������ ����� ����������
      Res := SetDeviceOpt(21, 1);
      ErrMessage(Res);
      // ���� � ������� ����-�����-���
      Res := SetDeviceOpt(22, 0);
      ErrMessage(Res);
      // �������� ������ - ����������� ����� ���������� ���� � ��� ������������
      Res := SetDeviceOpt(25, 1);
      ErrMessage(Res);
      // ��������� ������, ������������� � ��������� ����
      // 0	������� �����
      // 1	����� ����������� ������ ������� �������
      Res := SetOrderHeader(1, FrontBase.Options.CheckLine1, 0);
      ErrMessage(Res);

      Res := SetOrderHeader(2, FrontBase.Options.CheckLine2, 0);
      ErrMessage(Res);

      Res := SetOrderHeader(3, FrontBase.Options.CheckLine3, 0);
      ErrMessage(Res);

      Res := SetOrderHeader(4, FrontBase.Options.CheckLine4, 0);
      ErrMessage(Res);

      Res := SetOrderHeader(5, FrontBase.Options.CheckLine5, 0);
      ErrMessage(Res);

      Res := SetOrderHeader(6, FrontBase.Options.CheckLine6, 0);
      ErrMessage(Res);

      Res := SetOrderHeader(7, FrontBase.Options.CheckLine7, 0);
      ErrMessage(Res);

      Res := SetOrderHeader(8, FrontBase.Options.CheckLine8, 0);
      ErrMessage(Res);
      // ��������� �������� ���������� �����������
      // ����� �����������      ����������      �������� �� ���������
      // 42                     ����� ������    ����� �
      // 80                     ������. ����    ������
      Res := SetDescriptorText(42, '���� �');
      ErrMessage(Res);

      Res := SetDescriptorText(80, '��������:');
      ErrMessage(Res);
      // ������� ���������� ��������� �������
      // Spark_Cash   = 8;  ��������
      // Spark_NoCash = 7;  ������
      // Spark_Credit = 1;  �����
      Res := SetPaymentMean(Spark_Credit, '�����. �����', 0, 1, 1, 1);
      ErrMessage(Res);

      Res := SetPaymentMean(Spark_NoCash, '�����������', 0, 1, 1, 1);
      ErrMessage(Res);

      Res := SetPaymentMean(Spark_Cash, '��������', 0, 1, 1, 1);
      ErrMessage(Res);
      //�������� ������
      Res := StartSession(FFrontBase.UserName, FFrontBase.CashNumber);
      if Res <> 0 then
      begin
        ErrMessage(Res);
        exit;
      end;
    end;
    Result := True;
  end;
end;

constructor TSpark617Register.Create(AOwner: TComponent);
begin
  FDriverInit := True;
  FLastErr := 0;
  try
    inherited Create(AOwner);
  except
    Touch_MessageBox('��������', '�� ���������� ������� ��� �� ''����� 617��''!', MB_OK or MB_ICONEXCLAMATION);
    FDriverInit := False;
  end;
  IsInit := False;
end;

destructor TSpark617Register.Destroy;
begin
  if FDriverInit and IsInit then
    DeinitDevice;

  inherited;
end;

procedure TSpark617Register.EndSession;
var
  Res: Integer;
begin
  if FDriverInit then
  begin
    Init;
    Res := Inherited EndSession;
    ErrMessage(Res);
  end;
end;

procedure TSpark617Register.ErrMessage(Err: Integer);
var
  ErrStr: String;
begin
  if Err <> 0 then
  begin
    ErrStr := WideCharToString(PWideChar(GetErrorComment(Err)));
    Touch_MessageBox('��������', ErrStr, MB_OK or MB_ICONEXCLAMATION);
  end;
end;

function TSpark617Register.GetDocumentNumber: Integer;
begin
  Result := 0;
  if FDriverInit then
    Result := GetDeviceInfo(26);
end;

function TSpark617Register.Init: Boolean;
begin
  Result := False;
  if FDriverInit then
  begin
    if IsInit then
    begin
      CheckDeviceInfo;
      Init := True;
      exit;
    end;

    if not SetParams then
      exit;
    if not CheckDeviceInfo then
      exit;
  end;
  Result := True;
  IsInit := True;
end;

procedure TSpark617Register.MoneyIn(const Sum: Currency);
begin
  MoneyOperation(4, Sum);
end;

procedure TSpark617Register.MoneyOut(const Sum: Currency);
begin
  MoneyOperation(5, Sum);
end;

procedure TSpark617Register.OpenDrawer;
var
  Res: Integer;
begin
  if FDriverInit then
  begin
    Init;
    Res := Inherited OpenDrawer;
    ErrMessage(Res);
  end;
end;

function TSpark617Register.PrintCheck(const Doc, DocLine, PayLine: TkbmMemTable;
  const FSums: TSaleSums): Boolean;
var
  Res: Integer;
  DocNumber, WaiterName: String;
  DocStr: Integer;
//  WasDiscount: Boolean;
  TotalDiscount: Currency;
  GoodName{, DiscName}: String;
  Quantity, Price, SumDiscount: Currency;
  QuantityStr: String;
  PriceStr: String;
begin
  Result := False;
  Assert(Assigned(FFrontBase), 'FrontBase not Assigned');

  if FDriverInit then
  begin
    if Init then
    begin
      SetClerk(FFrontBase.UserName);

      DocNumber := Doc.FieldByName('NUMBER').AsString;
      DocNumber := StringReplace(DocNumber, '.', '', [rfReplaceAll]);
      DocNumber := StringReplace(DocNumber, ',', '', [rfReplaceAll]);
      if Length(DocNumber) > 5 then
        Delete(DocNumber, 5, Length(DocNumber));
      try
        DocStr := StrToInt(DocNumber);
      except
        DocStr := 0;
      end;
      WaiterName := FFrontBase.GetNameWaiterOnID(Doc.FieldByName('usr$respkey').AsInteger, False, False);
      Res := SetExtraDocData(DocStr, 0, 0, WaiterName);
      ErrMessage(Res);

      Res := StartDocument(1, 1, StrToInt(DocNumber), FFrontBase.UserName);
      if Res <> 0 then
      begin
        ErrMessage(Res);
        CancelDocument;
        exit;
      end;

      TotalDiscount := 0;

      DocLine.First;
      while not DocLine.Eof do
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
        GoodName := GoodName +  QuantityStr + 'x' + PriceStr;

        Quantity := 1000;
        Price := DocLine.FieldByName('usr$sumncu').AsCurrency;
        SumDiscount := DocLine.FieldByName('usr$sumncu').AsCurrency -
          DocLine.FieldByName('usr$sumncuwithdiscount').AsCurrency;
        TotalDiscount := TotalDiscount + SumDiscount;

        if Quantity >= 0 then
        begin
          Res := Item(Round(Quantity), Round(Price), GoodName, 0);
          if Res <> 0 then
          begin
            ErrMessage(Res);
            CancelDocument;
            exit;
          end;
        end;

        if (SumDiscount > 0)  then
          begin
            Res := AbsoluteCorrectionText(-Round(SumDiscount), '');
            if Res <> 0 then
            begin
              ErrMessage(Res);
              CancelDocument;
              exit;
            end;
        end;
        DocLine.Next;
      end;

      // ��������� �����
      if FSums.FCardSum > 0 then
      begin
        Res := Tender2(FSums.FCardSum, Spark_Credit, '', '');
        if res <> 0 then
        begin
          ErrMessage(Res);
          Res := CancelDocument;
          if Res = 0 then
            exit;
        end;
      end;
      // ������
      if (FSums.FCreditSum + FSums.FPersonalCardSum) > 0 then
      begin
        Res := Tender2(FSums.FCreditSum + FSums.FPersonalCardSum, Spark_NoCash, '', '');
        if res <> 0 then
        begin
          ErrMessage(Res);
          Res := CancelDocument;
          if Res = 0 then
            exit;
        end;
      end;
      Res := GetDeviceInfo(102);   //��������� �������� ��� ������ ?
      if Res <> 0 then
      begin
        // ��������
        if FSums.FCashSum > 0 then
        begin
          Res := Tender2(FSums.FCashSum, Spark_Cash, '', '');
          if res <> 0 then
          begin
            ErrMessage(Res);
            Res := CancelDocument;
            if Res = 0 then
              exit;
          end;
        end;

        Res := EndDocument;
        if Res = 0 then
        begin
          Res := GetDeviceInfo(102);
          if Res <> 0 then
          begin
            StartDocument(1, 1, StrToInt(DocNumber), FFrontBase.UserName);
            Res := CancelDocument;
          end
        end;
      end;
      if Res = 0 then
        Result := True
      else begin
        ErrMessage(Res);
        Res := GetDeviceInfo(102);
        if Res = 0 then
          Result := True
        else begin
          Res := EndDocument;
          if Res <> 0 then
          begin
            ErrMessage(Res);
            Res := GetDeviceInfo(102);
          end;

          if Res <> 0 then
          begin
            ErrMessage(Res);
            Res := EndDocument;
            if Res = 0 then
              Result := True
            else begin
               Res := GetDeviceInfo(102);
               if Res <> 0 then
               begin
                 CancelDocument;
                 Result := False;
               end else
                 Result := True;
            end;
          end;
        end;
      end;

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
          {TODO: Issue 50}
        end;
        Doc.Post;
      end;
    end else
      Touch_MessageBox('��������', '������ ������������� �� ''����� 617��''!', MB_OK or MB_ICONEXCLAMATION);
  end else
    Touch_MessageBox('��������', '�� ���������� ������� ��� �� ''����� 617��''!', MB_OK or MB_ICONEXCLAMATION);
end;

function TSpark617Register.PrintZ1ReportWithCleaning: Boolean;
var
  Res: Integer;
begin
  Result := False;
  if FDriverInit then
  begin
    Init;
    if Touch_MessageBox('��������', '�� ������������� ������ ����� ����� � �������� Z1?', MB_YESNO) = IDYES then
    begin
      Res := PrintReport(3);
      if Res = 0 then
        Result := True
      else
        ErrMessage(Res);
    end;
    CheckDeviceInfo;
  end;
end;

function TSpark617Register.ReturnGoodMoney(const FSums: TSaleSums): Boolean;
var
  Res: Integer;
begin
  Result := False;
  Assert(Assigned(FFrontBase), 'FrontBase not Assigned');

  if FDriverInit then
  begin
    if Init then
    begin
      SetClerk(FFrontBase.UserName);

      Res := StartDocument(6, 1, 0, FFrontBase.UserName);
      if Res <> 0 then
      begin
        ErrMessage(Res);
        CancelDocument;
        exit;
      end;
      // ��������� �����
      if FSums.FCardSum > 0 then
      begin
        Res := Tender2(FSums.FCardSum, Spark_Credit, '', '');
        if res <> 0 then
        begin
          ErrMessage(Res);
          Res := CancelDocument;
          if Res = 0 then
            exit;
        end;
      end;
      // ������
      if (FSums.FCreditSum + FSums.FPersonalCardSum) > 0 then
      begin
        Res := Tender2(FSums.FCreditSum + FSums.FPersonalCardSum, Spark_NoCash, '', '');
        if res <> 0 then
        begin
          ErrMessage(Res);
          Res := CancelDocument;
          if Res = 0 then
            exit;
        end;
      end;
      Res := GetDeviceInfo(102);   //��������� �������� ��� ������ ?
      if Res <> 0 then
      begin
        // ��������
        if FSums.FCashSum > 0 then
        begin
          Res := Tender2(FSums.FCashSum, Spark_Cash, '', '');
          if res <> 0 then
          begin
            ErrMessage(Res);
            Res := CancelDocument;
            if Res = 0 then
              exit;
          end;
        end;

        Res := EndDocument;
        if Res = 0 then
        begin
          Res := GetDeviceInfo(102);
          if Res <> 0 then
          begin
            ErrMessage(Res);
            Res := CancelDocument;
          end
        end;
      end;
      if Res = 0 then
        Result := True;

      CheckDeviceInfo;
    end;
  end;
end;

{
  function TSpark617Register.PrintZ2ReportWithCleaning: Boolean;
  var
    Res: Integer;
  begin
    Result := False;
    if FDriverInit then
    begin
      Init;
      if MessageBox(Application.Handle, '�� ������������� ������ ����� ����� � �������� Z2?',
        '��������', MB_YESNO) = IDYES then
      begin
        Res := PrintReport(4);
        if Res = 0 then
          Result := True
        else
          ErrMessage(Res);
      end;
      CheckDeviceInfo;
    end;
  end;
}

function TSpark617Register.PrintX1ReportWithOutCleaning: Boolean;
var
  Res: Integer;
begin
  Result := False;
  if FDriverInit then
  begin
    Init;
    if Touch_MessageBox('��������', '�� ������������� ������ ����� ����� X1?', MB_YESNO) = IDYES then
    begin
      Res := PrintReport(1);
      if Res = 0 then
        Result := True
      else
        ErrMessage(Res);
    end;
    CheckDeviceInfo;
  end;
end;

{
  function TSpark617Register.PrintX2ReportWithOutCleaning: Boolean;
  var
    Res: Integer;
  begin
    Result := False;
    if FDriverInit then
    begin
      Init;
      if MessageBox(Application.Handle, '�� ������������� ������ ����� ����� X2?',
        '��������', MB_YESNO) = IDYES then
      begin
        Res := PrintReport(2);
        if Res = 0 then
          Result := True
        else
          ErrMessage(Res);
      end;
      CheckDeviceInfo;
    end;
  end;
}

function TSpark617Register.SetParams: Boolean;
var
  Res: Integer;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not Assigned');

  Result := False;

  if not FFrontBase.Options.PrintFiscalChek then
    Res := SetAccessKey('000000')
  else
    Res := SetAccessKey('111111');
  ErrMessage(Res);

  Res := SetDeviceOpt(1, FFrontBase.FiscalComPort);
  ErrMessage(Res);

  Res := SetDeviceOpt(2, 0);
  ErrMessage(Res);

  Res := InitDevice;
  if Res <> 0 then
  begin
    if (Res = 20) and (FLastErr = 20) then
      //��������� ������ Z1-������ (������� ������������)
    else
      ErrMessage(Res);

    if Res = 20 then
      FLastErr := 20
    else
      FLastErr := 0;
    exit;
  end;
  FLastErr := 0;
  Result := True;
end;

procedure TSpark617Register.SetFrontBase(const Value: TFrontBase);
begin
  FFrontBase := Value;
end;

function TSpark617Register.GetFrontBase: TFrontBase;
begin
  Result := FFrontBase;
end;

function TSpark617Register.Get_Self: Integer;
begin
  Result := Integer(Self);
end;

procedure TSpark617Register.MoneyOperation(const Param: Integer; Sum: Currency);
var
  Res: Integer;
begin
  if FDriverInit then
  begin
    Init;
    Res := StartDocument(Param, 1, 0, FFrontBase.UserName);
    if Res <> 0 then
      ErrMessage(Res);
    Res := Tender2(Sum, 8, '', '');
    if Res <> 0 then
      ErrMessage(Res);
    Res := EndDocument;
    if Res <> 0 then
      ErrMessage(Res);
    CheckDeviceInfo;
  end;
end;

function TSpark617Register.OpenDay: Boolean;
begin
 { TODO : � ������ �������� ����� ���������� � CheckDeviceInfo (StartSession)
   �������� ����� ������� � ��������� �-��� � ���������}
  Result := True;
end;

end.
