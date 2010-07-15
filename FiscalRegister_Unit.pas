unit FiscalRegister_Unit;

interface

uses
  Classes, Windows, Base_FiscalRegister_unit, Front_DataBase_Unit, SysUtils;

type
  TFiscalRegister = class(TObject)
  private
    FFiscalRegister: IBaseFiscalRegister;
    FFrontBase: TFrontBase;
  public
    constructor Create;
    destructor Destroy; override;

    procedure InitFiscalRegister;

    property FrontBase: TFrontBase read FFrontBase write FFrontBase;
    property FiscalRegister: IBaseFiscalRegister read FFiscalRegister;
  end;

implementation

{ TFiscalRegister }

constructor TFiscalRegister.Create;
begin
  FFiscalRegister := nil;
end;

destructor TFiscalRegister.Destroy;
begin
  if Assigned(FFiscalRegister) then
    FreeAndNil(FFiscalRegister);
  inherited;
end;

procedure TFiscalRegister.InitFiscalRegister;
begin
//
end;

end.
