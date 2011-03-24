unit RestTable_Unit;

interface

uses
  SysUtils, Classes, Controls, Front_DataBase_Unit, Graphics, IBSQL, Messages,
  IBDatabase, PngSpeedButton, pngimage, Buttons, Generics.Collections, Types,
  Windows, Menus;


type
  TRestTable = class(TPngSpeedButton)
  private
    FNumber: String;
    FPosX: Integer;
    FPosY: Integer;
    FHallKey: Integer;
    FTableTypeKey: Integer;
    FMainTableKey: Integer;
    FIsEmpty: Boolean;
    FFrontBase: TFrontBase;
    FTransparent: Boolean;
    FTransparentColor: TColor;
    FID: Integer;
    FOrderKey: Integer;
    FRespKey: Integer;
    FIsLocked: Boolean;
    FComputerName: String;
    FOrderList: TDictionary<Integer, String>;
    FRespName: String;
    procedure SetPosX(const Value: Integer);
    procedure SetPosY(const Value: Integer);
    procedure SetHallKey(const Value: Integer);
    procedure SetTableType(const Value: Integer);

    procedure ReadTableType;
    procedure SetMainTableKey(const Value: Integer);
    procedure SetIsEmpty(const Value: Boolean);
    procedure SetFrontBase(const Value: TFrontBase);
    procedure SetTransparent(const Value: Boolean);
    procedure SetTransparentColor(const Value: TColor);
    procedure SetID(const Value: Integer);
    function GetPosX: Integer;
    function GetPosY: Integer;
    procedure SetOrderKey(const Value: Integer);
    procedure SetRespKey(const Value: Integer);
    procedure SetIsLocked(const Value: Boolean);
    procedure SetNumber(const Value: String);
    procedure SetComputerName(const Value: String);
    function GetOrderCount: Integer;

    procedure WMContextMenu(var Message: TWMContextMenu); message WM_CONTEXTMENU;
    procedure SetRespName(const Value: String);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure SaveTableToDB;
    procedure SaveTablePositionToDB;
    // ссылка на зал
    property HallKey: Integer read FHallKey write SetHallKey;
    // тип стола
    property TableTypeKey: Integer read FTableTypeKey write SetTableType;
    // ссылка на главный стол
    property MainTableKey: Integer read FMainTableKey write SetMainTableKey;
    // занят или нет
    property IsEmpty: Boolean read FIsEmpty write SetIsEmpty;
    property IsLocked: Boolean read FIsLocked write SetIsLocked;
    property ComputerName: String read FComputerName write SetComputerName;
    property ID: Integer read FID write SetID;
    property OrderKey: Integer read FOrderKey write SetOrderKey;
    property RespKey: Integer read FRespKey write SetRespKey;
    property FrontBase: TFrontBase read FFrontBase write SetFrontBase;
    property OrderCount: Integer read GetOrderCount;
    property OrderList: TDictionary<Integer, String> read FOrderList;
    property RespName: String read FRespName write SetRespName;
  published
    // номер стола
    property Number: String read FNumber write SetNumber;
    property PosX: Integer read GetPosX write SetPosX;
    property PosY: Integer read GetPosY write SetPosY;
    property Transparent: Boolean read FTransparent write SetTransparent;
    property TransparentColor: TColor read FTransparentColor write SetTransparentColor;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RestFront', [TRestTable]);
end;

{ TRestTable }

constructor TRestTable.Create;
begin
  inherited Create(AOwner);
  FTableTypeKey := -1;
  FIsEmpty := True;
  FID := -1;
  Flat := True;
  FOrderList := TDictionary<Integer, String>.Create();
  FRespName := '';
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

function TRestTable.GetPosX: Integer;
begin
  Result := Top;
end;

function TRestTable.GetPosY: Integer;
begin
  Result := Left;
end;

procedure TRestTable.ReadTableType;
var
  FSQL: TIBSQL;
  FPng: TPngImage;
  Str: TStream;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not Assigned');
  if FTableTypeKey > -1 then
  begin
    FSQL := TIBSQL.Create(nil);
    Str := TMemoryStream.Create;
    try
      FSQL.Transaction := FFrontBase.ReadTransaction;
      if not FSQL.Transaction.InTransaction then
        FSQL.Transaction.StartTransaction;

      FSQL.SQL.Text :=
        ' SELECT * FROM USR$MN_TABLETYPE T ' +
        ' WHERE T.ID = :ID ';
      FSQL.Params[0].AsInteger := FTableTypeKey;
      FSQL.ExecQuery;
      if not FSQL.Eof then
      begin
        Width := FSQL.FieldByName('USR$WIDTH').AsInteger;
        Height := FSQL.FieldByName('USR$LENGTH').AsInteger;
        FTransparent := FSQL.FieldByName('USR$TRANSPARENT').AsInteger = 1;
        FTransparentColor := FSQL.FieldByName('USR$TRANSPARENTCOLOR').AsInteger;
        if FIsEmpty and (not FSQL.FieldByName('USR$PICTURE1').IsNull) then
        begin
          FPng := TPngImage.Create;
          try
            FSQL.FieldByName('USR$PICTURE1').SaveToStream(Str);
            Str.Position := 0;
            FPng.LoadFromStream(Str);
            PngImage := FPng;
          finally
            FPng.Free;
          end;
        end else
        if not IsEmpty and (not FSQL.FieldByName('USR$PICTURE2').IsNull) then
        begin
          FPng := TPngImage.Create;
          try
            FSQL.FieldByName('USR$PICTURE2').SaveToStream(Str);
            Str.Position := 0;
            FPng.LoadFromStream(Str);
            PngImage := FPng;
          finally
            FPng.Free;
          end;
        end;
      end;
      FSQL.Close;
    finally
      FSQL.Free;
      Str.Free;
    end;
  end;
end;

procedure TRestTable.SaveTablePositionToDB;
var
  FSQL: TIBSQL;
  FTransaction: TIBTransaction;
begin
  Assert(FID <> -1, 'ID not Assigned');
  Assert(Assigned(FFrontBase), 'FrontBase not Assigned');

  FSQL := TIBSQL.Create(nil);
  FTransaction := TIBTransaction.Create(nil);
  try
    FTransaction.DefaultDatabase := FFrontBase.ReadTransaction.DefaultDatabase;
    FTransaction.StartTransaction;
    FSQL.Transaction := FTransaction;
    FSQL.SQL.Text :=
      'UPDATE USR$MN_TABLE T ' +
      'SET T.USR$POSY = :POSY, ' +
      '    T.USR$POSX = :POSX  ' +
      'WHERE T.ID = :ID ';
    FSQL.ParamByName('POSY').AsInteger := PosY;
    FSQL.ParamByName('POSX').AsInteger := PosX;
    FSQL.ParamByName('ID').AsInteger := FID;
    FSQL.ExecQuery;
    FSQL.Close;

    FTransaction.Commit;
  finally
    FSQL.Free;
    FTransaction.Free;
  end;
end;

procedure TRestTable.SaveTableToDB;
var
  FSQL: TIBSQL;
  FTransaction: TIBTransaction;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not Assigned');

  FSQL := TIBSQL.Create(nil);
  FTransaction := TIBTransaction.Create(nil);
  try
    FTransaction.DefaultDatabase := FFrontBase.ReadTransaction.DefaultDatabase;
    FTransaction.StartTransaction;
    FSQL.Transaction := FTransaction;

    FID := FFrontBase.GetNextID;

    FSQL.SQL.Text :=
      'INSERT INTO USR$MN_TABLE(ID, USR$NUMBER, USR$POSY, USR$POSX, USR$HALLKEY, ' +
      '  USR$TYPE, USR$MAINTABLEKEY) ' +
      'VALUES (:ID, :NUMBER, :POSY, :POSX, :HALLKEY, :TYPEKEY, :MAINTABLEKEY) ';
    FSQL.ParamByName('ID').AsInteger := FID;
    FSQL.ParamByName('USR$NUMBER').AsString := Number;
    FSQL.ParamByName('POSY').AsInteger := PosY;
    FSQL.ParamByName('POSX').AsInteger := PosX;
    FSQL.ParamByName('HALLKEY').AsInteger := HallKey;
    FSQL.ParamByName('TYPEKEY').AsInteger := TableTypeKey;
    FSQL.ParamByName('MAINTABLEKEY').AsInteger := MainTableKey;
    FSQL.ExecQuery;
    FSQL.Close;

    FTransaction.Commit;
  finally
    FSQL.Free;
    FTransaction.Free;
  end;
end;

procedure TRestTable.SetComputerName(const Value: String);
begin
  FComputerName := Value;
end;

procedure TRestTable.SetFrontBase(const Value: TFrontBase);
begin
  FFrontBase := Value;
end;

procedure TRestTable.SetHallKey(const Value: Integer);
begin
  FHallKey := Value;
end;

procedure TRestTable.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TRestTable.SetIsEmpty(const Value: Boolean);
begin
  FIsEmpty := Value;
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
var
  bm: Graphics.TBitmap;
begin
  FNumber := Value;
  if Assigned(PngImage) then
  begin
    bm := Graphics.TBitmap.Create;
    try
      bm.Width := PngImage.Width;
      bm.Height := PngImage.Height;
      bm.Canvas.Draw(0, 0, PngImage);
      bm.Transparent := true;
      bm.Canvas.Brush.Style := bsClear;
      if FRespName <> '' then
        bm.Canvas.TextOut(0, 0, FNumber + '(' + FRespName + ')')
      else
        bm.Canvas.TextOut(0, 0, FNumber);

      PngImage.Assign(bm);
    finally
      bm.Free;
    end;
  end;
end;

procedure TRestTable.SetOrderKey(const Value: Integer);
begin
  FOrderKey := Value;
end;

procedure TRestTable.SetPosX(const Value: Integer);
begin
  FPosX := Value;
  Top := Value;
end;

procedure TRestTable.SetPosY(const Value: Integer);
begin
  FPosY := Value;
  Left := Value;
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

procedure TRestTable.SetTableType(const Value: Integer);
begin
  if FTableTypeKey <> Value then
  begin
    FTableTypeKey := Value;
    ReadTableType;
  end;
end;

procedure TRestTable.SetTransparent(const Value: Boolean);
begin
  FTransparent := Value;
end;

procedure TRestTable.SetTransparentColor(const Value: TColor);
begin
  FTransparentColor := Value;
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

  if Message.Result <> 0 then Exit;
  if csDesigning in ComponentState then
  begin
    inherited;
    Exit;
  end;
  Temp := Pt;

  Handled := False;
  DoContextPopup(Temp, Handled);
  Message.Result := Ord(Handled);
  if Handled then Exit;

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

end.
