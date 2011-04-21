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
    FComputerName: String;
    FIsLocked: Boolean;
  public
    constructor Create(const AID: Integer; const ANumber: String); overload;
    constructor Create(AFromOrder: TrfOrder); overload;

    property ID: Integer read FID write FID;
    property Number: String read FNumber write FNumber;
    property TimeCloseOrder: TDateTime read FTimeClodeOrder write FTimeClodeOrder;
    property ResponsibleKey: Integer read FResponsibleKey write FResponsibleKey;
    property ComputerName: String read FComputerName write FComputerName;
    property IsLocked: Boolean read FIsLocked write FIsLocked;
  end;
  
implementation

{ TrfOrder }

constructor TrfOrder.Create(const AID: Integer; const ANumber: String);
begin
  FID := AID;
  FNumber := ANumber;
  FTimeClodeOrder := 0;
  FResponsibleKey := -1;
  ComputerName := '';
  IsLocked := False;
end;

constructor TrfOrder.Create(AFromOrder: TrfOrder);
begin
  FID := AFromOrder.ID;
  FNumber := AFromOrder.Number;
  FTimeClodeOrder := AFromOrder.TimeCloseOrder;
  FResponsibleKey := AFromOrder.ResponsibleKey;
  ComputerName := AFromOrder.ComputerName;
  IsLocked := AFromOrder.IsLocked;
end;

end.
