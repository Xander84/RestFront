unit rfOrder_unit;

interface

uses
  SysUtils;

type
  //Класс заказа по столу
  TrfOrder = class(TObject)
  private
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

  //бронирование по столу
  TrfReservation = class(TObject)
  private
    FID: Integer;
    FNumber: String;
    FReservTime: TTime;
    FReservDate: TDate;
    FOrderKey: Integer;
    FAvansSum: Currency;
  public
    constructor Create(const AID: Integer; const ANumber: String); overload;

    property ID: Integer read FID write FID;
    property Number: String read FNumber write FNumber;
    property ReservDate: TDate read FReservDate write FReservDate;
    property ReservTime: TTime read FReservTime write FReservTime;
    property OrderKey: Integer read FOrderKey write FOrderKey;
    property AvansSum: Currency read FAvansSum write FAvansSum;
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

{ TrfReservation }

constructor TrfReservation.Create(const AID: Integer; const ANumber: String);
begin
  FID := AID;
  FNumber := ANumber;
  FOrderKey := -1;
  FAvansSum := 0;
end;

end.
