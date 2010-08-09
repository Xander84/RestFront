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
    procedure EndSession;
    function PrintCheck(const Doc, DocLine, PayLine: TkbmMemTable): Boolean;      

    property FrontBase: TFrontBase read FFrontBase write FFrontBase;
    property FiscalRegister: IBaseFiscalRegister read FFiscalRegister;
  end;

implementation

uses
  Spark617_Unit, MercFP_Unit;

{ TFiscalRegister }

constructor TFiscalRegister.Create;
begin
  FLastFiscalType := -1;
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

  if FiscalType <> FLastFiscalType then
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
        Assert(False, '������ ��� ����� �� ��������������');
      end;

      2: //��������-Epson 220U
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

    else
      Assert(False, '������ ��� ����� �� ��������������');
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
  PayLine: TkbmMemTable): Boolean;
begin
  if Assigned(FFiscalRegister) then
    Result := FFiscalRegister.PrintCheck(Doc, DocLine, PayLine)
  else
{ TODO : �������� ��� ����������� }
    Result := True;
end;

end.
