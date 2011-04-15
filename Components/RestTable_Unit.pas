unit RestTable_Unit;

interface

uses
  SysUtils, Classes, Controls, Graphics, Messages,
  pngimage, Buttons, Generics.Collections, Types,
  Windows, Menus, rfOrder_unit;

type
  TRestTableCondition = (
    rtcUnknown,
    rtcFree,
    rtcFreeOther,
    rtcOccupied,
    rtcOccupiedOther,
    rtcPreCheck);

  TRestTable = class(TGraphicControl)
  private
    { �������� ����������� ����� }
    FPosX: Double;
    FPosY: Double;
    FRelativeWidth: Double;
    FRelativeHeight: Double;
    FChecked: Boolean;
    { ����������� ����� (������ �� ����������� � ���������� ������) }
    FGraphic: TGraphic;

    { ������-�������� ����� }
    FID: Integer;
    FNumber: String;
    FOrderKey: Integer;
    FIsLocked: Boolean;
    FComputerName: String;
    FOrderList: TList<TrfOrder>;
    FRespName: String;
    FNeedToInsert: Boolean;
    FHallKey: Integer;
    FTableTypeKey: Integer;
    FMainTableKey: Integer;
    { ��������� ����� }
    FTableConditionList: TList<TRestTableCondition>;

    { �������� ������ (��� ����� ��������� � ����� ������ ���������) }
    FManager: TObject;

    procedure SetPosX(const Value: Double);
    procedure SetPosY(const Value: Double);
    function GetPosX: Double;
    function GetPosY: Double;
    procedure SetRelativeHeight(const Value: Double);
    procedure SetRelativeWidth(const Value: Double);
    function GetRelativeHeight: Double;
    function GetRelativeWidth: Double;
    procedure SetChecked(const Value: Boolean);

    procedure SetID(const Value: Integer);
    procedure SetHallKey(const Value: Integer);
    procedure SetTableType(const Value: Integer);
    procedure SetMainTableKey(const Value: Integer);
    procedure SetOrderKey(const Value: Integer);
    procedure SetIsLocked(const Value: Boolean);
    procedure SetNumber(const Value: String);
    procedure SetComputerName(const Value: String);
    procedure SetRespName(const Value: String);
    function GetRespKey: Integer;

    procedure WMContextMenu(var Message: TWMContextMenu); message WM_CONTEXTMENU;
    function GetOrderCount: Integer;
  protected
    procedure Paint; override;
    procedure DrawTableCondition;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    { �������� ��������� ����� ������������ ����������� �������� }
    procedure RefreshTableCondition(const AContactKey: Integer);
    { �������� ����� }
    function AddOrder(const AID: Integer; const ANumber: String): TrfOrder; overload;
    function AddOrder(AOrder: TrfOrder): TrfOrder; overload;
    { �������� ����� �� �� }
    function GetOrder(const AOrderKey: Integer): TrfOrder;
    { ���������� ��� ������� ������� � �������� ������ }
    procedure ClearOrders;

    procedure SetTableCondition(const Value: TRestTableCondition);

    // ������ �� ���
    property HallKey: Integer read FHallKey write SetHallKey;
    // ��� �����
    property TableTypeKey: Integer read FTableTypeKey write SetTableType;
    // ������ �� ������� ����
    property MainTableKey: Integer read FMainTableKey write SetMainTableKey;
    // ����� ��� ���
    property IsLocked: Boolean read FIsLocked write SetIsLocked;
    property ComputerName: String read FComputerName write SetComputerName;
    property ID: Integer read FID write SetID;
    property OrderKey: Integer read FOrderKey write SetOrderKey;
    property RespKey: Integer read GetRespKey;
    property OrderCount: Integer read GetOrderCount;
    // ����� �����
    property Number: String read FNumber write SetNumber;
    property OrderList: TList<TrfOrder>read FOrderList;
    property RespName: String read FRespName write SetRespName;
    property NeedToInsert: Boolean read FNeedToInsert write FNeedToInsert;

    property TableConditionList: TList<TRestTableCondition> read FTableConditionList;
    property Manager: TObject read FManager write FManager;

    property Graphic: TGraphic read FGraphic write FGraphic;

    property OnClick;
    property PopupMenu;
  published
    property PosX: Double read GetPosX write SetPosX;
    property PosY: Double read GetPosY write SetPosY;
    property RelativeWidth: Double read GetRelativeWidth write SetRelativeWidth;
    property RelativeHeight: Double read GetRelativeHeight write SetRelativeHeight;
    property Checked: Boolean read FChecked write SetChecked;
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
  FrontData_Unit, AdvGDIP, rfTableManager_unit, Generics.Defaults;

const
  POS_MULTIPLIER = 100;
  MARK_MARGIN = 2;
  IMAGE_MARGIN = 6;

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
  // �� ��������� ���� �������� ������ ����������, �������� ������ �� ��������
  FTableConditionList := TList<TRestTableCondition>.Create;
  // ������ ������� ��� ����� �����
  FOrderList := TList<TrfOrder>.Create();

  Tag := 1;
  Self.Canvas.Font.Style := [fsBold];
  FChecked := false;
end;

destructor TRestTable.Destroy;
begin
  FreeAndNil(FTableConditionList);
  ClearOrders;
  FreeAndNil(FOrderList);
  inherited;
end;

function TRestTable.AddOrder(const AID: Integer; const ANumber: String): TrfOrder;
begin
  Result := Self.AddOrder(TrfOrder.Create(AID, ANumber));
end;

function TRestTable.AddOrder(AOrder: TrfOrder): TrfOrder;
begin
  Result := AOrder;
  // ������� ����� � ������
  FOrderList.Add(AOrder);
  FOrderList.Sort(
    TComparer<TrfOrder>.Construct(
      function (const L, R: TrfOrder): integer
      begin
        Result := L.ID - R.ID;
      end
    ));
end;

procedure TRestTable.ClearOrders;
var
  Order: TrfOrder;
begin
  for Order in FOrderList do
    if Assigned(Order) then
      Order.Free;
  FOrderList.Clear;

  FOrderKey := -1;
  FComputerName := '';
end;

function TRestTable.GetOrder(const AOrderKey: Integer): TrfOrder;
var
  Order: TrfOrder;
begin
  Result := nil;

  for Order in FOrderList do
    if Order.ID = AOrderKey then
      Result := Order;
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

function TRestTable.GetRespKey: Integer;
begin
  // ������ ���� �������� � ��������� ������
  if FOrderList.Count > 0 then
    Result := FOrderList.Items[FOrderList.Count - 1].ResponsibleKey
  else
    Result := -1;
end;

procedure TRestTable.Paint;
var
  ImgCanvas: TCanvas;
begin
  ImgCanvas := Self.Canvas;

  // ���� ���� �������, ������ ���
  if FChecked then
  begin
    ImgCanvas.Brush.Style := bsSolid;
    ImgCanvas.Brush.Color := TColor($0035C2FF);
    ImgCanvas.Pen.Color := TColor($0005A2DF);

    ImgCanvas.RoundRect(MARK_MARGIN, MARK_MARGIN, Self.Width - MARK_MARGIN, Self.Height - MARK_MARGIN, MARK_MARGIN, MARK_MARGIN);
  end;

  // ������������ ���������
  inherited;
  // ����������� �����
  if FGraphic is TPngImage then
    TPngImage(FGraphic).Draw(ImgCanvas, Rect(IMAGE_MARGIN, IMAGE_MARGIN, Self.Width - IMAGE_MARGIN, Self.Height - IMAGE_MARGIN));

  // ������ ����� �����
  ImgCanvas.Brush.Style := bsClear;
  if FRespName <> '' then
    ImgCanvas.TextOut(MARK_MARGIN, MARK_MARGIN, FNumber + '(' + FRespName + ')')
  else
    ImgCanvas.TextOut(MARK_MARGIN, MARK_MARGIN, FNumber);

  // ������������ ������ ��������� �����
  DrawTableCondition;
end;

procedure TRestTable.RefreshTableCondition(const AContactKey: Integer);
var
  Order: TrfOrder;
  LocalResponsibleKey: Integer;
begin
  try
    FTableConditionList.Clear;
    LocalResponsibleKey := GetRespKey;
    // ���� ��� ���
    if FOrderList.Count = 0 then
    begin
      // ���� ��� ���
      if AContactKey = LocalResponsibleKey then
        FTableConditionList.Add(TRestTableCondition.rtcFree)
      else
        FTableConditionList.Add(TRestTableCondition.rtcFreeOther);
    end
    else
    begin
      // ���� ���� ����� � ����, ��� ���� �� ��� ���� ������, �� ���������� �� ������ ��� ������� ������
      for Order in FOrderList do
      begin
        if Order.TimeCloseOrder <> 0 then
        begin
          FTableConditionList.Add(TRestTableCondition.rtcPreCheck);
        end
        else
        begin
          // ���� ��� ���
          if AContactKey = LocalResponsibleKey then
            FTableConditionList.Add(TRestTableCondition.rtcOccupied)
          else
            FTableConditionList.Add(TRestTableCondition.rtcOccupiedOther);
        end;
      end;
    end;
  finally
    // ���������� ���� ����� ���������� ���������
    Repaint;
  end;
end;

procedure TRestTable.DrawTableCondition;
var
  ImgCanvas: TCanvas;
  MarkRect: TRect;
  ConditionPicture: TAdvGDIPPicture;
  TableManager: TrfTableManager;
  Condition: TRestTableCondition;
  ConditionTop, ConditionLeft: Integer;
begin
  ImgCanvas := Self.Canvas;
  ConditionTop := MARK_MARGIN;
  ConditionLeft := 0;

  if Assigned(FManager) then
  begin
    TableManager := TrfTableManager(FManager);
    // ������� �� ������ ��������� � �������� ��� ��� �����������
    for Condition in FTableConditionList do
    begin
      ConditionPicture := TableManager.GetImageForCondition(Condition);

      if Assigned(ConditionPicture) then
      begin
        if ConditionLeft = 0 then
          ConditionLeft := Self.Width - ConditionPicture.Width - MARK_MARGIN;
        // ������� �����������
        if (ConditionTop + ConditionPicture.Height) > Self.Height then
        begin
          ConditionTop := MARK_MARGIN;
          ConditionLeft := ConditionLeft - ConditionPicture.Width;
        end;

        // ������ �������� ������ ���������
        MarkRect := Rect(
          ConditionLeft,
          ConditionTop,
          ConditionLeft + ConditionPicture.Width,
          ConditionTop + ConditionPicture.Height);
        // ������ �������� ���������
        ConditionPicture.Draw(ImgCanvas, MarkRect);

        ConditionTop := ConditionTop + ConditionPicture.Height + MARK_MARGIN;
      end;
    end;
  end;
end;

procedure TRestTable.SetChecked(const Value: Boolean);
begin
  FChecked := Value;
  Repaint;
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

procedure TRestTable.SetRespName(const Value: String);
begin
  FRespName := Value;
  if FRespName <> '' then
    SetNumber(FNumber);
end;

procedure TRestTable.SetTableCondition(const Value: TRestTableCondition);
begin
  FTableConditionList.Clear;
  FTableConditionList.Add(Value);
  // ��� ��� ��������� ����� ���������� ���� ������������ ������
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

    // ������ ��� �����
    ImgCanvas.TextOut(0, 0, FTableName);
  end;
end;

end.
