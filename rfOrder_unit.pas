unit rfOrder_unit;

interface

uses
  SysUtils;

type
  TrfOrder = class(TObject)
    FID: Integer;
    FNumber: String;
    FTimeClodeOrder: TDateTime;
    FResponsibleKey: Integer;
  public
    constructor Create(const AID: Integer; const ANumber: String);

    property ID: Integer read FID write FID;
    property Number: String read FNumber write FNumber;
    property TimeCloseOrder: TDateTime read FTimeClodeOrder write FTimeClodeOrder;
    property ResponsibleKey: Integer read FResponsibleKey write FResponsibleKey;
  end;
  
implementation

{ TrfOrder }

constructor TrfOrder.Create(const AID: Integer; const ANumber: String);
begin
  FID := AID;
  FNumber := ANumber;
  FTimeClodeOrder := 0;
end;

end.
