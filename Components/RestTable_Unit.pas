unit RestTable_Unit;

interface

uses
  SysUtils, Classes, Controls, AdvToolBtn, Front_DataBase_Unit, Graphics, IBSQL,
  IBDatabase;

type
  TRestTable = class(TAdvToolButton)
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
    FImageList: TImageList;
    FID: Integer;
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
    property ID: Integer read FID write SetID;
    property FrontBase: TFrontBase read FFrontBase write SetFrontBase;
  published
    // номер стола
    property Number: String read FNumber write FNumber;
    property PosX: Integer read GetPosX write SetPosX;
    property PosY: Integer read GetPosY write SetPosY;
    property Transparent: Boolean read FTransparent write SetTransparent;
    property TransparentColor: TColor read FTransparentColor write SetTransparentColor;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RF Components', [TRestTable]);
end;

{ TRestTable }

constructor TRestTable.Create;
begin
  inherited Create(AOwner);
  FTableTypeKey := -1;
  FIsEmpty := True;
  FID := -1;
  FImageList := TImageList.Create(nil);
end;

destructor TRestTable.Destroy;
begin
  FImageList.Free;
  inherited;
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
  ResBmp: TBitmap;
  Str: TStream;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not Assigned');
  if FTableTypeKey > -1 then
  begin
    FImageList.Clear;
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
          ResBmp := TBitmap.Create;
          try
            FSQL.FieldByName('USR$PICTURE1').SaveToStream(Str);
            Str.Position := 0;
            ResBmp.LoadFromStream(Str);
            ResBmp.Transparent := FTransparent;
            if FTransparentColor <> 0 then
              ResBmp.TransparentColor := FTransparentColor;
          except
            ResBmp.Free;
          end;
          FImageList.Add(ResBmp, nil);
          Images := FImageList;
          ImageIndex := 1;
        end else
        if not IsEmpty and (not FSQL.FieldByName('USR$PICTURE2').IsNull) then
        begin
          ResBmp := TBitmap.Create;
          try
            FSQL.FieldByName('USR$PICTURE2').SaveToStream(Str);
            Str.Position := 0;
            ResBmp.LoadFromStream(Str);
            ResBmp.Transparent := FTransparent;
            if FTransparentColor <> 0 then
              ResBmp.TransparentColor := FTransparentColor;
          except
            ResBmp.Free;
          end;
          FImageList.Add(ResBmp, nil);
          Images := FImageList;
          ImageIndex := 1;
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

procedure TRestTable.SetMainTableKey(const Value: Integer);
begin
  FMainTableKey := Value;
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

end.
