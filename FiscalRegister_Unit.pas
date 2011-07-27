unit FiscalRegister_Unit;

interface

uses
  Classes, Windows, Base_FiscalRegister_unit, Front_DataBase_Unit, SysUtils,
  kbmMemTable, Controls;

{
  ����� ������ � ������������.
  ������ ������ �����, ����� �������� � ���
}

const
  Reg_Shtrih = 0;
  Reg_Merc = 2;
  Reg_Spark617 = 3;
  Reg_Test = 4;
  Reg_Unknown = 100;

type
  TFiscalRegister = class(TObject)
  private
    FFiscalRegister: IBaseFiscalRegister;
    FFrontBase: TFrontBase;
    FInit: Boolean;
    FLastFiscalType: Integer;
    procedure SetFrontBase(const Value: TFrontBase);
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


    function PrintCheck(const Doc, DocLine, PayLine: TkbmMemTable;
      const FSums: TSaleSums): Boolean;
    function ReturnCheck(const Doc, DocLine, PayLine: TkbmMemTable;
      const FSums: TSaleSums): Boolean;
    function ReturnGoodMoney(const FSums: TSaleSums): Boolean;

    property FrontBase: TFrontBase read FFrontBase write SetFrontBase;
    property FiscalRegister: IBaseFiscalRegister read FFiscalRegister;
  end;

implementation

uses
  Spark617_Unit, MercFP_Unit, ShtrihFR_Unit, TouchMessageBoxForm_Unit, Dialogs,
  DevideForm_Unit;

{ TFiscalRegister }

constructor TFiscalRegister.Create;
begin
  inherited;

  FLastFiscalType := Reg_Unknown;
  FFiscalRegister := nil;
  FInit := False;
end;

destructor TFiscalRegister.Destroy;
begin
  if Assigned(FFiscalRegister) then
    FreeAndNil(FFiscalRegister);

  inherited;
end;

procedure TFiscalRegister.EndDay;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not Assigned');

  if FFrontBase.IsMainCash then
  begin
    if Touch_MessageBox('��������', '������� ����?', MB_YESNO, mtConfirmation)
      = IDYES then
      FFrontBase.CanCloseDay;
  end
  else
    Touch_MessageBox('��������', '������� ���� ����� ������ �� ������� �����',
      MB_OK, mtWarning);
end;

procedure TFiscalRegister.EndSession;
begin
  if Assigned(FFiscalRegister) then
  begin
    if Touch_MessageBox('��������',
      '�� ������������� ������ ����� ����� � �������� Z1?', MB_YESNO, mtConfirmation) = IDYES then
    begin
      FFiscalRegister.EndSession;
    end;
  end;
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
      FreeAndNil(FFiscalRegister);
    end;

    case FiscalType of
      Reg_Shtrih: // �����-��
        begin
          FFiscalRegister := TShtrihFR.Create(nil);
          FFiscalRegister.FrontBase := FFrontBase;
          FFiscalRegister.Init;
        end;

      Reg_Merc: // ������
        begin
          FFiscalRegister := TMercuryRegister.Create(nil);
          FFiscalRegister.FrontBase := FFrontBase;
          FFiscalRegister.Init;
        end;

      Reg_Spark617: // ����� 617 ��
        begin
          FFiscalRegister := TSpark617Register.Create(nil);
          FFiscalRegister.FrontBase := FFrontBase;
          FFiscalRegister.Init;
        end;

      Reg_Test: // ��� ������
        begin
          FFiscalRegister := TAbstractFiscalRegister.Create;
          FFiscalRegister.FrontBase := FFrontBase;
        end;

    else
      Touch_MessageBox('��������', '������ ��� ����� �� ��������������', MB_OK, mtWarning);
    end;

    FInit := True;
  end
  else
    FInit := True;
end;

procedure TFiscalRegister.MoneyIn;
var
  Form: TDevideForm;
begin
  if Assigned(FFiscalRegister) then
  begin
    Form := TDevideForm.Create(nil);
    try
      Form.LabelCaption := '�����';
      Form.ShowModal;
      if Form.ModalResult = mrOK then
        FFiscalRegister.MoneyIn(StrToCurr(Form.Number));
    finally
      Form.Free;
    end;
  end;
end;

procedure TFiscalRegister.MoneyOut;
var
  Form: TDevideForm;
begin
  if Assigned(FFiscalRegister) then
  begin
    Form := TDevideForm.Create(nil);
    try
      Form.LabelCaption := '�����';
      Form.ShowModal;
      if Form.ModalResult = mrOK then
        FFiscalRegister.MoneyOut(StrToCurr(Form.Number));
    finally
      Form.Free;
    end;
  end;
end;

procedure TFiscalRegister.OpenDrawer;
begin
  if Assigned(FFiscalRegister) then
    FFiscalRegister.OpenDrawer;
end;

function TFiscalRegister.PrintCheck(const Doc, DocLine, PayLine: TkbmMemTable;
  const FSums: TSaleSums): Boolean;
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
  begin
    if Touch_MessageBox('��������',
      '�� ������������� ������ ����� ����� � �������� Z1?', MB_YESNO, mtConfirmation) = IDYES then
    begin
      FFiscalRegister.PrintZ1ReportWithCleaning;
    end;
  end;
end;

procedure TFiscalRegister.PrintReportWithOutCleaning;
begin
  if Assigned(FFiscalRegister) then
  begin
    if Touch_MessageBox('��������', '�� ������������� ������ ����� ����� X1?', MB_YESNO) = IDYES then
    begin
      FFiscalRegister.PrintX1ReportWithOutCleaning;
    end;
  end;
end;

function TFiscalRegister.ReturnCheck(const Doc, DocLine, PayLine: TkbmMemTable;
  const FSums: TSaleSums): Boolean;
begin
  if Assigned(FFiscalRegister) then
    Result := FFiscalRegister.ReturnCheck(Doc, DocLine, PayLine, FSums)
  else
    { TODO : �������� ��� ����������� }
    Result := True;
end;

function TFiscalRegister.ReturnGoodMoney(const FSums: TSaleSums): Boolean;
begin
  if Assigned(FFiscalRegister) then
    Result := FFiscalRegister.ReturnGoodMoney(FSums)
  else
    Result := True;
end;

procedure TFiscalRegister.SetFrontBase(const Value: TFrontBase);
begin
  FFrontBase := Value;
end;

procedure TFiscalRegister.StartDay;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not Assigned');

  if FFrontBase.IsMainCash then
  begin
    if Touch_MessageBox('��������', '������� ����?', MB_YESNO, mtConfirmation) = IDYES then
      FFrontBase.CanOpenDay;
  end
  else
    Touch_MessageBox('��������', '������� ���� ����� ������ �� ������� �����',
      MB_OK, mtWarning);
end;

procedure TFiscalRegister.StartSession;
begin
  InitFiscalRegister(FFrontBase.CashCode);
  if Assigned(FFiscalRegister) then
  begin
    if FFrontBase.CashCode = Reg_Merc then
      FFiscalRegister.OpenDay
    else if (FFrontBase.CashCode = Reg_Spark617) or
      (FFrontBase.CashCode = Reg_Shtrih) then
        FFiscalRegister.Init;
  end;
end;

end.
