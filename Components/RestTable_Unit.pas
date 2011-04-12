unit RestTable_Unit;

interface

uses
  SysUtils, Classes, Controls, Graphics, Messages,
  PngSpeedButton, pngimage, Buttons, Generics.Collections, Types,
  Windows, Menus;

type
  TRestTableCondition = (rtcUnknown, rtcFree, rtcFreeOther, rtcOccupied, rtcOccupiedOther, rtcPreCheck);

  TrfOrder = class(TObject)
    FID: Integer;
    FNumber: String;
    FTimeClodeOrder: TDateTime;
  public
    constructor Create(const AID: Integer; const ANumber: String);

    property ID: Integer read FID write FID;
    property Number: String read FNumber write FNumber;
    property TimeCloseOrder: TDateTime read FTimeClodeOrder write FTimeClodeOrder;
  end;

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
    FOrderList: TDictionary<Integer, TrfOrder>;
    FRespName: String;
    FNeedToInsert: Boolean;

    FManager: TObject;

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

    procedure RefreshTableCondition(const AContactKey: Integer);
    function AddOrder(const AID: Integer; const ANumber: String): TrfOrder;
    function GetOrder(const AOrderKey: Integer): TrfOrder;

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
    property OrderList: TDictionary<Integer, TrfOrder> read FOrderList;
    property RespName: String read FRespName write SetRespName;
    property NeedToInsert: Boolean read FNeedToInsert write FNeedToInsert;

    property TableCondition: TRestTableCondition read FTableCondition write SetTableCondition;
    property Manager: TObject read FManager write FManager;
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

uses
  FrontData_Unit, AdvGDIP, rfTableManager_unit;

const
  POS_MULTIPLIER = 100;

procedure Register;
begin
  RegisterComponents('RestFront', [TRestTable]);
end;

{ TRestTable }

function TRestTable.AddOrder(const AID: Integer; const ANumber: String): TrfOrder;
begin
  Result := TrfOrder.Create(AID, ANumber);
  FOrderList.Add(AID, Result);
end;

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
  FOrderList := TDictionary<Integer, TrfOrder>.Create();

  Flat := True;
  Tag := 1;
  Font.Style := [fsBold];
end;

destructor TRestTable.Destroy;
var
  Order: TrfOrder;
begin
  for Order in FOrderList.Values do
    if Assigned(Order) then
      Order.Free;
  FOrderList.Free;
  inherited;
end;

function TRestTable.GetOrder(const AOrderKey: Integer): TrfOrder;
begin
  Result := nil;
  if FOrderList.ContainsKey(AOrderKey) then
    Result := FOrderList.Items[AOrderKey];
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

procedure TRestTable.RefreshTableCondition(const AContactKey: Integer);
var
  Order: TrfOrder;
begin
  try
    // Пуст или нет
    if FOrderList.Count = 0 then
    begin
      // Свой или нет
      if AContactKey = FRespKey then
        FTableCondition := TRestTableCondition.rtcFree
      else
        FTableCondition := TRestTableCondition.rtcFreeOther;
    end
    else
    begin
      // Проверим есть ли пречек
      for Order in FOrderList.Values do
        if Order.TimeCloseOrder <> 0 then
        begin
          FTableCondition := TRestTableCondition.rtcPreCheck;
          Exit;
        end;
      // Свой или нет
      if AContactKey = FRespKey then
        FTableCondition := TRestTableCondition.rtcOccupied
      else
        FTableCondition := TRestTableCondition.rtcOccupiedOther;
    end;
  finally
    // Перерисуем стол после обновления состояния
    Repaint;
  end;
end;

procedure TRestTable.DrawTableCondition;
const
  MARK_MARGIN = 5;
var
  ImgCanvas: TCanvas;
  MarkRect: TRect;
  ConditionPicture: TAdvGDIPPicture;
  TableManager: TrfTableManager;

  function GetImageRect(const Image: TAdvGDIPPicture): TRect;
  begin
    Result := Rect(Self.Width - Image.Width - MARK_MARGIN, MARK_MARGIN, Self.Width - MARK_MARGIN, Image.Height + MARK_MARGIN)
  end;

begin
  ImgCanvas := Self.Canvas;

  if Assigned(FManager) then
  begin
    TableManager := TrfTableManager(FManager);
    ConditionPicture := TableManager.GetImageForCondition(FTableCondition);

    if Assigned(ConditionPicture) then
    begin
      // Расчет размеров значка состояния
      MarkRect := GetImageRect(ConditionPicture);
      ConditionPicture.Draw(ImgCanvas, MarkRect);
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

{ TrfOrder }

constructor TrfOrder.Create(const AID: Integer; const ANumber: String);
begin
  FID := AID;
  FNumber := ANumber;
  FTimeClodeOrder := 0;
end;

end.
