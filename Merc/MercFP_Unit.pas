unit MercFP_Unit;

interface

uses
  Classes, Windows, Forms, Front_DataBase_Unit, kbmMemTable, DB, MercFPrtX_TLB,
  Base_FiscalRegister_unit;

const
  cn_FontFlagHeaderLine1 = 3;   // 1-� ������ ���������
  cn_FontFlagHeaderLine2 = 3;   // 2-� ������ ���������
  cn_FontFlagHeaderLine3 = 3;   // 3-� ������ ���������
  cn_FontFlagHeaderLine4 = 3;   // 4-� ������ ���������

  cn_FontFlagCashier = 3;       // ������
  cn_FontFlagSerialNumber = 3;  // �������� ����� ���
  cn_FontFlagDateTime = 3;      // ������� ���� � �����
  cn_FontFlagDocNumber = 3;     // ����� ���������
  cn_FontFlagReceiptNumber = 3; // ����� ����
  cn_FontFlagTaxPayerNumber = 3;// ��� ���������

  cn_FontFlagGoodName = 16;     // ������������ ���
  cn_FontFlagPosition = 3;      // �������
  cn_FontFlagTotal = 2;         // ������ ����� ����
  cn_FontFlagPay = 2;           // ���������� �����
  cn_FontFlagChange = 2;        // �����
  cn_FontFlagDiscount = 2;      // ������

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
    //������������ �������� ������ �� ������� �����
    FIV: Integer;

    // �������� ��������� ������
    procedure ClearLastError;
    // ���������, ���� �� ������, � ���� ����,
    // ����������� ��������� ������ �� ��������
    function SetLastError: Boolean;
    procedure ShowLastError;

    //�������� ����, ��������� ������������� ���������� OpenFiscalDoc
    function OpenCheck(const CheckType: Integer): Boolean;
    // ������ ��������� ����
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
      FLastWarning := '���������� ������ ������ � ����� (�������� ����� 30 �������)';
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
      AddToWarning('��� ������ �� ������ ������� �������� ����������� �����', NoError);
    if CheckDevStatus(17) > 0 then
      AddToWarning('��� ������ �� ������ ������� ������� ����������� �����', NoError);
    if CheckDevStatus(22) > 0 then
      AddToWarning('����� ������ ��� ������� ���������� �������', NoError);
    if CheckDevStatus(24) > 0 then
      AddToWarning('������� �����, ��������� � ��������� offline ��� ��������� ������ ��������', NoError);

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
  // �� ����� ������ �������� ����������
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
              '��������', MB_OK or MB_ICONEXCLAMATION);
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
  // ��������� �������� ���� ������� ������� ������ 200�� �� ������ �����
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
  MessageBox(Application.Handle, PChar('������ ��� ������ �� ��������������'),
    '��������', MB_OK or MB_ICONEXCLAMATION);
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
  MessageBox(Application.Handle, PChar('������ ��� ������ �� ��������������'),
    '��������', MB_OK or MB_ICONEXCLAMATION);
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
    MessageBox(Application.Handle, PChar('�� ���������� ������� ��� ��!'),
      '��������', MB_OK or MB_ICONEXCLAMATION);
    FDriverInit := False;
    FLastErrorNumber := -1;
    FLastErrorDescription := '�� ������� ������� ���-������ ��� ������ � ��';
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
      '��������', MB_OK or MB_ICONEXCLAMATION);
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
    Form.LabelCaption := '�����';
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
          { TODO : �������� }

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
      // �����
      if not PrintTop then
        exit;
      FIV := 5;
      // ������ ��������� ������ ���
      AddSerialNumber(cn_FontFlagSerialNumber, 0, FIV);
      if SetLastError then
        exit;
      Inc(FIV);
      // ������ ������� ���� � �������
      AddDateTime(cn_FontFlagDateTime, 0, FIV);
      if SetLastError then
        exit;
      Inc(FIV);
      // ������ ���������� �� ���������
      AddOperInfo(1, cn_FontFlagCashier, 0, FIV);
      if SetLastError then
        exit;

      if not PrintCashier then
        exit;
      Inc(FIV);
      // ������ ������ ���������
      AddDocNumber(cn_FontFlagDocNumber, 0, FIV);
      if SetLastError then
        exit;
      Inc(FIV);
      // ������ ������ ����
      AddReceiptNumber(cn_FontFlagReceiptNumber, 0, FIV);
      if SetLastError then
        exit;
      Inc(FIV);
      // ������ ���
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
