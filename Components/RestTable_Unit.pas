unit RestTable_Unit;

interface

uses
  SysUtils, Classes, Controls, Graphics, Messages,
  PngSpeedButton, pngimage, Buttons, Generics.Collections, Types,
  Windows, Menus;

type
  TRestTableCondition = (rtcUnknown, rtcFree, rtcFreeOther, rtcOccupied, rtcOccupiedOther, rtcPreCheck);

  TRestTable = class(TPngSpeedButton)
  private
    FNumber: String;
    FPosX: Double;
    FPosY: Double;
    FRelativeWidth: Double;
    FRelativeHeight: Double;
    FHallKey: Integer;
    FTableTypeKey: Integer;
    FMainTableKey: Integer;
    // Состояние стола
    FTableCondition: TRestTableCondition;

    FID: Integer;
    FOrderKey: Integer;
    FRespKey: Integer;
    FIsLocked: Boolean;
    FComputerName: String;
    FOrderList: TDictionary<Integer, String>;
    FRespName: String;
    FNeedToInsert: Boolean;
    procedure SetPosX(const Value: Double);
    procedure SetPosY(const Value: Double);
    procedure SetHallKey(const Value: Integer);
    procedure SetTableType(const Value: Integer);

    procedure SetMainTableKey(const Value: Integer);
    procedure SetID(const Value: Integer);
    function GetPosX: Double;
    function GetPosY: Double;
    procedure SetOrderKey(const Value: Integer);
    procedure SetRespKey(const Value: Integer);
    procedure SetIsLocked(const Value: Boolean);
    procedure SetNumber(const Value: String);
    procedure SetComputerName(const Value: String);
    function GetOrderCount: Integer;

    procedure WMContextMenu(var Message: TWMContextMenu); message WM_CONTEXTMENU;
    procedure SetRespName(const Value: String);
    function GetRelativeHeight: Double;
    function GetRelativeWidth: Double;
    procedure SetRelativeHeight(const Value: Double);
    procedure SetRelativeWidth(const Value: Double);
    procedure SetTableCondition(const Value: TRestTableCondition);
  protected
    procedure Paint; override;
    procedure DrawTableCondition;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    // ссылка на зал
    property HallKey: Integer read FHallKey write SetHallKey;
    // тип стола
    property TableTypeKey: Integer read FTableTypeKey write SetTableType;
    // ссылка на главный стол
    property MainTableKey: Integer read FMainTableKey write SetMainTableKey;
    // занят или нет
    property IsLocked: Boolean read FIsLocked write SetIsLocked;
    property ComputerName: String read FComputerName write SetComputerName;
    property ID: Integer read FID write SetID;
    property OrderKey: Integer read FOrderKey write SetOrderKey;
    property RespKey: Integer read FRespKey write SetRespKey;
    property OrderCount: Integer read GetOrderCount;
    property OrderList: TDictionary<Integer, String>read FOrderList;
    property RespName: String read FRespName write SetRespName;
    property NeedToInsert: Boolean read FNeedToInsert write FNeedToInsert;

    property TableCondition: TRestTableCondition read FTableCondition write SetTableCondition;
  published
    // номер стола
    property Number: String read FNumber write SetNumber;
    property PosX: Double read GetPosX write SetPosX;
    property PosY: Double read GetPosY write SetPosY;
    property RelativeWidth: Double read GetRelativeWidth write SetRelativeWidth;
    property RelativeHeight: Double read GetRelativeHeight write SetRelativeHeight;
  end;

  TChooseTable = class(TRestTable)
  private
    FTableName: String;
    procedure SetTableName(const Value: String);
  protected
    procedure Paint; override;
  public
    property MainTableKey;
    property ID;
    property TableName: String read FTableName write SetTableName;
  end;

procedure Register;

implementation

const
  POS_MULTIPLIER = 100;

procedure Register;
begin
  RegisterComponents('RestFront', [TRestTable]);
end;

{ TRestTable }

constructor TRestTable.Create;
begin
  inherited Create(AOwner);
  FTableTypeKey := -1;
  FID := -1;
  FRespName := '';
  FNeedToInsert := False;
  // По умолчанию стол обладает пустым состоянием, никакого значка не рисуется
  FTableCondition := TRestTableCondition.rtcUnknown;
  // Список заказов для этого стола
  FOrderList := TDictionary<Integer, String>.Create();

  Flat := True;
  Tag := 1;
end;

destructor TRestTable.Destroy;
begin
  FOrderList.Free;
  inherited;
end;

function TRestTable.GetOrderCount: Integer;
begin
  Result := FOrderList.Count;
end;

function TRestTable.GetPosX: Double;
begin
  if Assigned(Parent) and (Parent.Width > 0) then
    Result := POS_MULTIPLIER * Left / Parent.Width
  else
    Result := 0;
end;

function TRestTable.GetPosY: Double;
begin
  if Assigned(Parent) and (Parent.Height > 0) then
    Result := POS_MULTIPLIER * Top / Parent.Height
  else
    Result := 0;
end;

function TRestTable.GetRelativeHeight: Double;
begin
  Result := FRelativeHeight;
end;

function TRestTable.GetRelativeWidth: Double;
begin
  Result := FRelativeWidth;
end;

procedure TRestTable.Paint;
var
  ImgCanvas: TCanvas;
begin
  inherited;

  ImgCanvas := Self.Canvas;
  ImgCanvas.Brush.Style := bsClear;

  // Рисуем номер стола
  if FRespName <> '' then
    ImgCanvas.TextOut(0, 0, FNumber + '(' + FRespName + ')')
  else
    ImgCanvas.TextOut(0, 0, FNumber);

  // Отрисовываем значок состояния стола
  DrawTableCondition;
end;

procedure TRestTable.DrawTableCondition;
const
  MARK_SIZE_PX = 25;
var
  ImgCanvas: TCanvas;
  MarkX, MarkY, MarkWidth, MarkHeight: Integer;
  MarkRect: TRect;
  OrderCount: String;

  procedure CalcMarkProps;
  begin
    MarkWidth := MARK_SIZE_PX;
    MarkHeight := MARK_SIZE_PX;
    MarkX := (Self.Width - MARK_SIZE_PX) div 2;
    MarkY := (Self.Height - MARK_SIZE_PX) div 2;
  end;

begin
  // Расчет размеров значка состояния
  CalcMarkProps;

  ImgCanvas := Self.Canvas;
  ImgCanvas.Brush.Style := bsSolid;
  ImgCanvas.Pen.Color := clBlack;
  MarkRect := Rect(MarkX, MarkY, MarkX + MarkWidth, MarkY + MarkHeight);
  OrderCount := IntToStr(FOrderList.Count);

  case FTableCondition of
    rtcFree:
      begin
      end;

    rtcFreeOther:
      begin
      end;

    rtcOccupied:
      begin
        ImgCanvas.Brush.Color := clGreen;
        ImgCanvas.Rectangle(MarkX, MarkY, MarkX + MarkWidth, MarkY + MarkHeight);
        // Кол-во заказов
        // ImgCanvas.TextRect(MarkRect, OrderCount, [tfCenter, tfVerticalCenter, tfSingleLine]);
      end;

    rtcOccupiedOther:
      begin
        ImgCanvas.Brush.Color := clYellow;
        ImgCanvas.Rectangle(MarkX, MarkY, MarkX + MarkWidth, MarkY + MarkHeight);
        // Кол-во заказов
        // ImgCanvas.TextRect(MarkRect, OrderCount, [tfCenter, tfVerticalCenter, tfSingleLine]);
      end;

    rtcPreCheck:
      begin
        ImgCanvas.Brush.Color := clRed;
        ImgCanvas.Rectangle(MarkX, MarkY, MarkX + MarkWidth, MarkY + MarkHeight);
        // Кол-во заказов
        // ImgCanvas.TextRect(MarkRect, OrderCount, [tfCenter, tfVerticalCenter, tfSingleLine]);
      end;
  end;
end;

procedure TRestTable.SetComputerName(const Value: String);
begin
  FComputerName := Value;
end;

procedure TRestTable.SetHallKey(const Value: Integer);
begin
  FHallKey := Value;
end;

procedure TRestTable.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TRestTable.SetIsLocked(const Value: Boolean);
begin
  FIsLocked := Value;
end;

procedure TRestTable.SetMainTableKey(const Value: Integer);
begin
  FMainTableKey := Value;
end;

procedure TRestTable.SetNumber(const Value: String);
begin
  FNumber := Value;
end;

procedure TRestTable.SetOrderKey(const Value: Integer);
begin
  FOrderKey := Value;
end;

procedure TRestTable.SetPosX(const Value: Double);
begin
  FPosX := Value;
  if Assigned(Parent) then
    Left := Round(Parent.Width / POS_MULTIPLIER * Value)
  else
    Left := Round(Value);
end;

procedure TRestTable.SetPosY(const Value: Double);
begin
  FPosY := Value;
  if Assigned(Parent) then
    Top := Round(Parent.Height / POS_MULTIPLIER * Value)
  else
    Top := Round(Value);
end;

procedure TRestTable.SetRelativeHeight(const Value: Double);
begin
  FRelativeHeight := Value;
  if Assigned(Parent) then
    Height := Round(Parent.Height / POS_MULTIPLIER * Value)
  else
    Height := Round(Value);
end;

procedure TRestTable.SetRelativeWidth(const Value: Double);
begin
  FRelativeWidth := Value;
  if Assigned(Parent) then
    Width := Round(Parent.Width / POS_MULTIPLIER * Value)
  else
    Width := Round(Value);
end;

procedure TRestTable.SetRespKey(const Value: Integer);
begin
  FRespKey := Value;
end;

procedure TRestTable.SetRespName(const Value: String);
begin
  FRespName := Value;
  if FRespName <> '' then
    SetNumber(FNumber);
end;

procedure TRestTable.SetTableCondition(const Value: TRestTableCondition);
begin
  FTableCondition := Value;
  // Так как состояние стола изменилось надо перерисовать кнопку
  Self.Repaint;
end;

procedure TRestTable.SetTableType(const Value: Integer);
begin
  if FTableTypeKey <> Value then
    FTableTypeKey := Value;
end;

procedure TRestTable.WMContextMenu(var Message: TWMContextMenu);
var
  Pt, Temp: TPoint;
  Handled: Boolean;
  PopupMenu: TPopupMenu;
begin
  Pt := SmallPointToPoint(Message.Pos);
  Pt.X := Pt.X + 8;
  Pt.Y := Pt.Y + 8;
  Message.Pos := PointToSmallPoint(Pt);

  if Message.Result <> 0 then
    Exit;
  if csDesigning in ComponentState then
  begin
    inherited;
    Exit;
  end;
  Temp := Pt;

  Handled := False;
  DoContextPopup(Temp, Handled);
  Message.Result := Ord(Handled);
  if Handled then
    Exit;

  PopupMenu := GetPopupMenu;
  if (PopupMenu <> nil) and PopupMenu.AutoPopup then
  begin
    SendCancelMode(Self);
    PopupMenu.PopupComponent := Self;
    if InvalidPoint(Pt) then
      Pt := ClientToScreen(Point(0, 0));
    PopupMenu.Popup(Pt.X, Pt.Y);
    Message.Result := 1;
  end;

  if Message.Result = 0 then
    inherited;
end;

{ TChooseTable }

procedure TChooseTable.SetTableName(const Value: String);
begin
  FTableName := Value;
end;

procedure TChooseTable.Paint;
var
  ImgCanvas: TCanvas;
begin
  inherited;

  if FTableName <> '' then
  begin
    ImgCanvas := Self.Canvas;
    ImgCanvas.Brush.Style := bsClear;

    // Рисуем имя стола
    ImgCanvas.TextOut(0, 0, FTableName);
  end;
end;

end.
