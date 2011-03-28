unit FiscalRegister_Unit;

interface

uses
  Classes, Windows, Base_FiscalRegister_unit, Front_DataBase_Unit, SysUtils,
  kbmMemTable;

{
  ����� ������ � ������������.
  ������ ������ �����, ����� �������� � ���
}


type
  TFiscalRegister = class(TObject)
  private
    FFiscalRegister: IBaseFiscalRegister;
    FFrontBase: TFrontBase;
    FInit: Boolean;
    FLastFiscalType: Integer;
  public
    constructor Create;
    destructor Destroy; override;

    procedure InitFiscalRegister(const FiscalType: Integer);
    procedure MoneyIn;
    procedure MoneyOut;    
    procedure OpenDrawer;
    procedure PrintReportWithCleaning;
    procedure PrintReportWithOutCleaning;
    procedure StartDay;
    procedure StartSession;
    procedure EndDay;
    procedure EndSession;

    function PrintCheck(const Doc, DocLine, PayLine: TkbmMemTable; const FSums: TSaleSums): Boolean;

    property FrontBase: TFrontBase read FFrontBase write FFrontBase;
    property FiscalRegister: IBaseFiscalRegister read FFiscalRegister;
  end;

implementation

uses
  Spark617_Unit, MercFP_Unit, ShtrihFR_Unit, TouchMessageBoxForm_Unit, Dialogs;

{ TFiscalRegister }

constructor TFiscalRegister.Create;
begin
  inherited;

  FLastFiscalType := 0;
  FFiscalRegister := nil;
  FInit := False;
end;

destructor TFiscalRegister.Destroy;
var
  Obj: TObject;
begin
  if Assigned(FFiscalRegister) then
  begin
    Obj := TObject(FFiscalRegister.Self);
    if Assigned(Obj) then
      FreeAndNil(Obj);
  end;
  inherited;
end;

procedure TFiscalRegister.EndDay;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not Assigned');

  if FFrontBase.IsMainCash then
  begin
    if Touch_MessageBox('��������',  '������� ����?', MB_YESNO) = IDYES then
      FFrontBase.CanCloseDay;

  end else
    Touch_MessageBox('��������', '������� ���� ����� ������ �� ������� �����', MB_OK);
end;

procedure TFiscalRegister.EndSession;
begin
  if Assigned(FFiscalRegister) then
    FFiscalRegister.EndSession;
end;

procedure TFiscalRegister.InitFiscalRegister(const FiscalType: Integer);
var
  Obj: TObject;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not Assigned');

  if (FiscalType <> FLastFiscalType) or (FiscalType < 0) then
  begin
    FLastFiscalType := FiscalType;
    if Assigned(FFiscalRegister) then
    begin
      Obj := TObject(FFiscalRegister.Self);
      if Assigned(Obj) then
        FreeAndNil(Obj);
    end;

    case FiscalType of
      0: //�����-��
      begin
        FFiscalRegister := TShtrihFR.Create(nil);
        FFiscalRegister.FrontBase := FFrontBase;
        FFiscalRegister.Init;
      end;

      2: //������
      begin
        FFiscalRegister := TMercuryRegister.Create(nil);
        FFiscalRegister.FrontBase := FFrontBase;
        FFiscalRegister.Init;
      end;

      3: //����� 617 ��
      begin
        FFiscalRegister := TSpark617Register.Create(nil);
        FFiscalRegister.FrontBase := FFrontBase;
        FFiscalRegister.Init;
      end;

      4: // ��� ������
      begin
        FFiscalRegister := TAbstractFiscalRegister.Create;
        FFiscalRegister.FrontBase := FFrontBase;
      end;

    else
      raise Exception.Create('������ ��� ����� �� ��������������');
    end;

    FInit := True;  
  end else
    FInit := True;
end;

procedure TFiscalRegister.MoneyIn;
begin
  if Assigned(FFiscalRegister) then
    FFiscalRegister.MoneyIn;
end;

procedure TFiscalRegister.MoneyOut;
begin
  if Assigned(FFiscalRegister) then
    FFiscalRegister.MoneyOut;
end;

procedure TFiscalRegister.OpenDrawer;
begin
  if Assigned(FFiscalRegister) then
    FFiscalRegister.OpenDrawer;
end;

function TFiscalRegister.PrintCheck(const Doc, DocLine,
  PayLine: TkbmMemTable; const FSums: TSaleSums): Boolean;
begin
  if Assigned(FFiscalRegister) then
    Result := FFiscalRegister.PrintCheck(Doc, DocLine, PayLine, FSums)
  else
{ TODO : �������� ��� ����������� }
    Result := True;
end;

procedure TFiscalRegister.PrintReportWithCleaning;
begin
  if Assigned(FFiscalRegister) then
    FFiscalRegister.PrintZ1ReportWithCleaning;
end;

procedure TFiscalRegister.PrintReportWithOutCleaning;
begin
  if Assigned(FFiscalRegister) then
    FFiscalRegister.PrintX1ReportWithOutCleaning;
end;

procedure TFiscalRegister.StartDay;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not Assigned');

  if FFrontBase.IsMainCash then
  begin
    if Touch_MessageBox('��������',  '������� ����?', MB_YESNO) = IDYES then
      FFrontBase.CanOpenDay;

  end else
    Touch_MessageBox('��������', '������� ���� ����� ������ �� ������� �����', MB_OK);
end;

procedure TFiscalRegister.StartSession;
begin
  InitFiscalRegister(FFrontBase.CashCode);
  if FFrontBase.CashCode = 2 then
    if Assigned(FFiscalRegister) then
      FFiscalRegister.OpenDay;
end;

end.
