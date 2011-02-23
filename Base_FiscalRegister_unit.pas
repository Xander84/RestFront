unit Base_FiscalRegister_unit;

{
  ������� ���������, ������� ��������� �-������ ������������
  ����������� ������������
}

interface

uses
  Classes, Windows, kbmMemTable, DB, Front_DataBase_Unit;

const
  // ��� ������
  // 0 ���
  // 1 �����
  // 2 ������
  cn_paytype_cash = 0;
  cn_paytype_credit = 1;
  cn_paytype_noncash = 2;

type
  IBaseFiscalRegister = interface
  ['{308C2D25-B5F7-4801-B8E4-F09E92B7AFBA}']
    // �������� ����������
    function CheckDeviceInfo: Boolean;
    // �������������
    function Init: Boolean;
    // ������ ����
    function PrintCheck(const Doc, DocLine, PayLine: TkbmMemTable): Boolean;

    // ��������� ������� ����
    procedure SetFrontBase(const Value: TFrontBase);
    function GetFrontBase: TFrontBase;
    property FrontBase: TFrontBase read GetFrontBase write SetFrontBase;

    //����� Z1 � ��������
    function PrintZ1ReportWithCleaning: Boolean;
    //����� Z2 � ��������
    function PrintZ2ReportWithCleaning: Boolean;
    //����� X1 ��� �������
    function PrintX1ReportWithOutCleaning: Boolean;
    //����� X2 ��� �������
    function PrintX2ReportWithOutCleaning: Boolean;
    // �������� ��������� �����    
    procedure OpenDrawer;
    // �������� ������ (������ Z ������)
    procedure EndSession;
    // ������� �����
    function OpenDay: Boolean;
    //������ � �����
    procedure MoneyIn;
    //������ �� �����
    procedure MoneyOut;
    function GetDocumentNumber: Integer;
    //������� ������
//    procedure ErrMessage(Err: Integer);

    function Get_Self: Integer;    
    property Self: Integer read Get_Self;
  end;

  TAbstractFiscalRegister = class(TObject, IBaseFiscalRegister)
  private
    FFrontBase: TFrontBase;

    function Get_Self: Integer;
    procedure SetFrontBase(const Value: TFrontBase);
    function GetFrontBase: TFrontBase;
  public
    function CheckDeviceInfo: Boolean;
    function Init: Boolean;
    function PrintCheck(const Doc, DocLine, PayLine: TkbmMemTable): Boolean;

    function PrintZ1ReportWithCleaning: Boolean;
    function PrintZ2ReportWithCleaning: Boolean;
    function PrintX1ReportWithOutCleaning: Boolean;
    function PrintX2ReportWithOutCleaning: Boolean;
    function OpenDay: Boolean;
    procedure MoneyIn;
    procedure MoneyOut;
    function GetDocumentNumber: Integer;
    procedure OpenDrawer;
    procedure EndSession;

    { IInterface }
    function QueryInterface(const IID: TGUID; out Obj): HResult; virtual; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;

    property Self: Integer read Get_Self;
    property FrontBase: TFrontBase read GetFrontBase write SetFrontBase;
  end;

  // ��������� ������
  TSaleSums = packed record
    // ����� ��������
    FCashSum: Currency;
    // ����� �� ��������
    FCardSum: Currency;
    // ����� �� �������
    FCreditSum: Currency;
    // ����� �����
    FChangeSum: Currency;
  end;

implementation

uses
  SysUtils;


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

function TAbstractFiscalRegister.Get_Self: Integer;
begin
  Result := Integer(Self);
end;

function TAbstractFiscalRegister.Init: Boolean;
begin
  Result := True;
end;

procedure TAbstractFiscalRegister.MoneyIn;
begin

end;

procedure TAbstractFiscalRegister.MoneyOut;
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
  PayLine: TkbmMemTable): Boolean;
begin
  if Doc.State <> dsEdit then
    Doc.Edit;
  Doc.FieldByName('USR$WHOPAYOFFKEY').AsInteger := FFrontBase.ContactKey;
  Doc.FieldByName('USR$PAY').AsInteger := 1;
  Doc.FieldByName('USR$LOGICDATE').AsDateTime := FFrontBase.GetLogicDate;
  Doc.FieldByName('USR$SYSNUM').AsInteger := 0;
  if Doc.FieldByName('usr$timecloseorder').IsNull then
    Doc.FieldByName('usr$timecloseorder').AsDateTime := Now;

  PayLine.DisableControls;
  try
    PayLine.First;
    while not PayLine.Eof do
    begin
      FFrontBase.SavePayment(FFrontBase.ContactKey, Doc.FieldByName('ID').AsInteger,
        PayLine.FieldByName('USR$PAYTYPEKEY').AsInteger, PayLine.FieldByName('SUM').AsCurrency);

      PayLine.Next;
    end;
  finally
    PayLine.EnableControls;
  end;
  Doc.Post;

  Result := True;
end;

function TAbstractFiscalRegister.PrintX1ReportWithOutCleaning: Boolean;
begin
  Result := True;
end;

function TAbstractFiscalRegister.PrintX2ReportWithOutCleaning: Boolean;
begin
  Result := True;
end;

function TAbstractFiscalRegister.PrintZ1ReportWithCleaning: Boolean;
begin
  Result := True;
end;

function TAbstractFiscalRegister.PrintZ2ReportWithCleaning: Boolean;
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
