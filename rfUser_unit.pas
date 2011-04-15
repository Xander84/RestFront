unit rfUser_unit;

interface

uses
  SysUtils;

type
  TrfUser = class(TObject)
    FID: Integer;
    FName: String;
  public
    constructor Create(const AID: Integer; const AName: String);

    property ID: Integer read FID write FID;
    property Name: String read FName write FName;
  end;

implementation

{ TrfUser }

constructor TrfUser.Create(const AID: Integer; const AName: String);
begin
  FID := AID;
  FName := AName;
end;

end.
