unit rfTableManager_unit;

interface

uses
  SysUtils, Classes, Contnrs, Controls, Generics.Collections, Graphics, jpeg,
  Front_DataBase_Unit, RestTable_Unit, AdvMenus, pngimage, AdvGDIP, rfOrder_unit,
  ExtCtrls;

type
  TrfTableManager = class(TObject)
  private
    FTableParent: TWinControl;
    FDataBase: TFrontBase;

    // ������� ���������� �� ������� �����
    FTableImageDictionary: TDictionary<Integer, TGraphic>;
    FBackGroundImageDictionary: TDictionary<Integer, TGraphic>;
    FConditionImageDictionary: TDictionary<TRestTableCondition, TAdvGDIPPicture>;
    FTableButtonOnClick: TNotifyEvent;
    FTableButtonPopupMenu: TAdvPopupMenu;
    // ������ ������
    FTablesList: TDictionary<Integer,TRestTable>;
    // ������ �� ������ ������� ����� ������� �� �� ��� ����������
    FToDeleteList: TList<Integer>;

    { ������� �� ������� ����� �������� � �������� }
    FServerTimeLag: Extended;
    FBackGroundImage: TImage;

    procedure LoadImages;
    { �������� ����� � ���� ������������ � ������ ������� ������� ����� �������� � �������� }
    function GetServerDateTime: TDateTime;
  public
    constructor Create(const Database: TFrontBase; const TableParent: TWinControl);
    destructor Destroy; override;

    { ��������� ��� �� }
    procedure LoadHallBackGround(const HallKey: Integer);
    { ��������� ����� �� �������� }
    procedure LoadTables(const HallKey: Integer);
    { �������� ���������� � ������� �� ������ }
    // 1. ���������� ������ �����
    // 2. ���������� ������ ����
    procedure RefreshOrderData(const ATable: TRestTable = nil); overload;
    procedure RefreshOrderData(const HallKey: Integer); overload;
    { ��������� ����� � �� }
    procedure SaveTables;
    { �������� ������ ������ }
    procedure ClearTables;

    function GetImageForType(const ATableType: Integer): TGraphic;
    function GetBackGroundImage(const HallKey: Integer): TGraphic;
    function GetImageForCondition(const ATableCondition: TRestTableCondition): TAdvGDIPPicture;

    { �������� ���� }
    function AddTable(const ATableNumber: String; const ADesignerTable: TRestTable): TRestTable;
    { ������� ���� �� �������������� }
    procedure DropTable(ATable: TRestTable);
    procedure ClearDropList;
    { ������� ������ ����� �� �� }
    function GetTable(const ATableKey: Integer): TRestTable;

    function GetOrder(const ATableKey, AOrderKey: Integer): TrfOrder;

    // ������ ������
    property TablesList: TDictionary<Integer,TRestTable> read FTablesList;

    // ������� ���������� �� ������� �����
    property TableButtonOnClick: TNotifyEvent read FTableButtonOnClick write FTableButtonOnClick;
    property TableButtonPopupMenu: TAdvPopupMenu read FTableButtonPopupMenu write FTableButtonPopupMenu;
    property ServerTimeLag: Extended read FServerTimeLag write FServerTimeLag;
    property BackGroundImage: TImage read FBackGroundImage write FBackGroundImage;
  end;

const
  jpeg_sig = $D8FF;
  png_sig = $5089;


implementation

uses
  ibsql, ibdatabase, FrontData_Unit;

{ TrfTableManager }

procedure TrfTableManager.ClearDropList;
begin
  FToDeleteList.Clear;
end;

procedure TrfTableManager.ClearTables;
var
  Table: TRestTable;
begin
  for Table in FTablesList.Values do
    if Assigned(Table) then
      Table.Free;
  FTablesList.Clear;
end;

constructor TrfTableManager.Create(const Database: TFrontBase; const TableParent: TWinControl);
begin
  FDataBase := Database;
  FTableParent := TableParent;
  FTablesList := TDictionary<Integer,TRestTable>.Create;
  FToDeleteList := TList<Integer>.Create;
  // ������ ����� ������ � �������������
  FTableImageDictionary := TDictionary<Integer, TGraphic>.Create;
  FBackGroundImageDictionary := TDictionary<Integer, TGraphic>.Create;
  // ������ �������� ��� ��������� ������
  FConditionImageDictionary := TDictionary<TRestTableCondition,TAdvGDIPPicture>.Create;

  // �������� �����������
  LoadImages;
end;

destructor TrfTableManager.Destroy;
var
  FImage: TGraphic;
begin
  // ������ ����� ������ � �������������
  for FImage in FTableImageDictionary.Values do
    if Assigned(FImage) then
      FImage.Free;
  for FImage in FBackGroundImageDictionary.Values do
    if Assigned(FImage) then
      FImage.Free;

  FreeAndNil(FTableImageDictionary);
  FreeAndNil(FBackGroundImageDictionary);
  // ������ �������� ��� ��������� ������ (����������� �� ���� ����������, �.�. ��� ��������� � ����������)
  FreeAndNil(FConditionImageDictionary);

  FreeAndNil(FToDeleteList);
  ClearTables;
  FreeAndNil(FTablesList);
  inherited;
end;

function TrfTableManager.AddTable(const ATableNumber: String; const ADesignerTable: TRestTable): TRestTable;
begin
  // �������� ����� ����, ����� ����������� �����
  Result := TRestTable.Create(FTableParent);
  Result.ID := FDataBase.GetNextID;
  Result.Parent := FTableParent;
  Result.Manager := Self;

  Result.TableTypeKey := ADesignerTable.TableTypeKey;
  Result.HallKey := ADesignerTable.HallKey;
  Result.OrderKey := 0;
  Result.IsLocked := False;
  Result.Number := ATableNumber;
  Result.NeedToInsert := True;

  // ������������� ������� � ������� �����
  Result.PosX := 50;
  Result.PosY := 50;
  Result.RelativeWidth := ADesignerTable.RelativeWidth;
  Result.RelativeHeight := ADesignerTable.RelativeHeight;
  // ����������� �����
  Result.Graphic := ADesignerTable.Graphic;

  FTablesList.Add(Result.ID, Result);
end;

procedure TrfTableManager.DropTable(ATable: TRestTable);
begin
  // �������� �� ����� � ������ �� �������� �� ��
  FToDeleteList.Add(ATable.ID);
  // ������ ������
  FTablesList.Remove(ATable.ID);
end;

function TrfTableManager.GetBackGroundImage(const HallKey: Integer): TGraphic;
begin
  if not FBackGroundImageDictionary.TryGetValue(HallKey, Result) then
    Result := nil;
end;

function TrfTableManager.GetImageForCondition(const ATableCondition: TRestTableCondition): TAdvGDIPPicture;
begin
  if not FConditionImageDictionary.TryGetValue(ATableCondition, Result) then
    Result := nil;
end;

function TrfTableManager.GetImageForType(const ATableType: Integer): TGraphic;
begin
  // ����������� �����
  if not FTableImageDictionary.TryGetValue(ATableType, Result) then
    Result := nil;
end;

function TrfTableManager.GetOrder(const ATableKey, AOrderKey: Integer): TrfOrder;
var
  Table: TRestTable;
begin
  Result := nil;
  Table := GetTable(ATableKey);
  if Assigned(Table) then
    Result := Table.GetOrder(AOrderKey);
end;

function TrfTableManager.GetServerDateTime: TDateTime;
begin
  Result := Now + FServerTimeLag;
end;

function TrfTableManager.GetTable(const ATableKey: Integer): TRestTable;
begin
  if not FTablesList.TryGetValue(ATableKey, Result) then
    Result := nil;
end;

procedure TrfTableManager.LoadHallBackGround(const HallKey: Integer);
begin
  if Assigned(FBackGroundImage) then
    FBackGroundImage.Picture.Assign(GetBackGroundImage(HallKey));
end;

procedure TrfTableManager.LoadImages;
var
  FSQL: TIBSQL;
  FpngImage: TPngImage;
  FImage: TBitmap;
  FjpgImage: TJPEGImage;
  Sig: Word;
  Str: TStream;
begin
  // �������� ����������� ������
  if Assigned(FTableImageDictionary) then
  begin
    FSQL := TIBSQL.Create(nil);
    try
      FSQL.Transaction := FDataBase.ReadTransaction;
      FSQL.SQL.Text :=
        ' SELECT id, usr$picture1 AS img FROM usr$mn_tabletype ';
      FSQL.ExecQuery;
      while not FSQL.Eof do
      begin
        Str := TMemoryStream.Create;
        try
          FSQL.FieldByName('img').SaveToStream(Str);
          if Str.Size > 2 then
          begin
            Str.Position := 0;
            Str.Read(Sig, 2);

            case Sig of
              jpeg_sig:
                begin
                  Str.Position := 0;
                  FjpgImage := TJPEGImage.Create;
                  FjpgImage.LoadFromStream(Str);
                  FTableImageDictionary.Add(FSQL.FieldByName('id').AsInteger, FjpgImage);
                end;
              png_sig:
                begin
                  Str.Position := 0;
                  FpngImage := TPngImage.Create;
                  FpngImage.LoadFromStream(Str);
                  FTableImageDictionary.Add(FSQL.FieldByName('id').AsInteger, FpngImage);
                end;
            else
              Str.Position := 0;
              FImage := TBitmap.Create;
              FImage.LoadFromStream(Str);
              FTableImageDictionary.Add(FSQL.FieldByName('id').AsInteger, FImage);
            end;
          end;
        finally
          Str.Free;
        end;
        FSQL.Next;
      end;
    finally
      FSQL.Free;
    end;
  end;

  if Assigned(FBackGroundImageDictionary) then
  begin
    FSQL := TIBSQL.Create(nil);
    try
      FSQL.Transaction := FDataBase.ReadTransaction;
      FSQL.SQL.Text :=
        'SELECT ID, USR$BACKGROUNDPICTURE AS backgroundpicture '  +
        'FROM USR$MN_HALL  ';
      FSQL.ExecQuery;
      while not FSQL.Eof do
      begin
        Str := TMemoryStream.Create;
        try
          FSQL.FieldByName('backgroundpicture').SaveToStream(Str);
          if Str.Size > 2 then
          begin
            Str.Position := 0;
            Str.Read(Sig, 2);

            case Sig of
              jpeg_sig:
                begin
                  Str.Position := 0;
                  FjpgImage := TJPEGImage.Create;
                  FjpgImage.LoadFromStream(Str);
                  FBackGroundImageDictionary.Add(FSQL.FieldByName('id').AsInteger, FjpgImage);
                end;
              png_sig:
                begin
                  Str.Position := 0;
                  FpngImage := TPngImage.Create;
                  FpngImage.LoadFromStream(Str);
                  FBackGroundImageDictionary.Add(FSQL.FieldByName('id').AsInteger, FpngImage);
                end;
            else
              Str.Position := 0;
              FImage := TBitmap.Create;
              FImage.LoadFromStream(Str);
              FBackGroundImageDictionary.Add(FSQL.FieldByName('id').AsInteger, FImage);
            end;
          end;
        finally
          Str.Free;
        end;
        FSQL.Next;
      end;
    finally
      FSQL.Free;
    end;
  end;

  // �������� ����������� ��������� ������
  FConditionImageDictionary.Add(rtcUnknown, nil);
  FConditionImageDictionary.Add(rtcFree, nil{FrontData.RestPictureContainer.FindPicture('bullet_green_small')});
  FConditionImageDictionary.Add(rtcFreeOther, nil{FrontData.RestPictureContainer.FindPicture('bullet_green_small')});
  FConditionImageDictionary.Add(rtcOccupied, FrontData.RestPictureContainer.FindPicture('user_small'));
  FConditionImageDictionary.Add(rtcOccupiedOther, FrontData.RestPictureContainer.FindPicture('bullet_delete'));
  FConditionImageDictionary.Add(rtcPreCheck, FrontData.RestPictureContainer.FindPicture('money_dollar_small'));
  FConditionImageDictionary.Add(rtcReservation, FrontData.RestPictureContainer.FindPicture('session_idle_time'));
end;

procedure TrfTableManager.LoadTables(const HallKey: Integer);
var
  NewTable: TRestTable;
  FSQL: TIBSQL;
  ParentDoubleBuffered: Boolean;
begin
  ParentDoubleBuffered := FTableParent.DoubleBuffered;
  FTableParent.DoubleBuffered := False;
  try
    // ������� ������ ������
    ClearTables;

    FSQL := TIBSQL.Create(nil);
    try
      FSQL.Transaction := FDataBase.ReadTransaction;
      FSQL.SQL.Text :=
        ' SELECT ' +
        '   t.id, t.usr$type, t.usr$number, ' +
        '   t.usr$posx, t.usr$posy, tt.usr$width, tt.usr$length ' +
        ' FROM ' +
        '   usr$mn_table t ' +
        '   LEFT JOIN usr$mn_tabletype tt ON tt.id = t.usr$type ' +
        ' WHERE ' +
        '   t.usr$hallkey = :id ';
      FSQL.Params[0].AsInteger := HallKey;
      FSQL.ExecQuery;

      // �������� ����� �� ������ �������
      while not FSQL.Eof do
      begin
        NewTable := TRestTable.Create(FTableParent);
        NewTable.Parent := FTableParent;
        NewTable.Manager := Self;

        NewTable.HallKey := HallKey;
        NewTable.ID := FSQL.FieldByName('ID').AsInteger;
        NewTable.TableTypeKey := FSQL.FieldByName('USR$TYPE').AsInteger;
        // ������������� ������� ������ � ��������
        NewTable.PosX := FSQL.FieldByName('USR$POSX').AsFloat;
        NewTable.PosY := FSQL.FieldByName('USR$POSY').AsFloat;
        // ������ ������ ������������ ������������ ������
        NewTable.RelativeWidth := FSQL.FieldByName('USR$WIDTH').AsFloat;
        NewTable.RelativeHeight := FSQL.FieldByName('USR$LENGTH').AsFloat;
        // ����� ����� � ��� �����
        NewTable.Number := FSQL.FieldByName('USR$NUMBER').AsString;
        //NewTable.ComputerName := ibsql.FieldByName('USR$COMPUTERNAME').AsString;
        // FButton.RespName := ibsql.FieldByName('RESPNAME').AsString;

        // ���������� �������� �� ����� �� ����
        if Assigned(TableButtonOnClick) then
          NewTable.OnClick := TableButtonOnClick;
        // ����������� ���� ��� �����
        if Assigned(TableButtonPopupMenu) then
          NewTable.PopupMenu := TableButtonPopupMenu;

        // ���������� ����������� ����� �� ������ ����������� ����� ������
        NewTable.Graphic := GetImageForType(NewTable.TableTypeKey);

        FTablesList.Add(NewTable.ID, NewTable);
        FSQL.Next;
      end;
      FSQL.Close;
    finally
      FSQL.Free;
    end;
  finally
    FTableParent.DoubleBuffered := ParentDoubleBuffered;
  end;
end;

procedure TrfTableManager.SaveTables;
var
  I: Integer;
  Table: TRestTable;
  FSQLUpdate, FSQLInsert, FSQLDelete: TIBSQL;
  FTransaction: TIBTransaction;
  Key: Integer;

  procedure UpdateTable(const TableObj: TRestTable);
  begin
    FSQLUpdate.ParamByName('POSY').AsFloat := TableObj.PosY;
    FSQLUpdate.ParamByName('POSX').AsFloat := TableObj.PosX;
    FSQLUpdate.ParamByName('ID').AsInteger := TableObj.ID;
    FSQLUpdate.ExecQuery;
    FSQLUpdate.Close;
  end;

  procedure InsertTable(const TableObj: TRestTable);
  begin
    FSQLInsert.ParamByName('ID').AsInteger := TableObj.ID;
    FSQLInsert.ParamByName('NUMBER').AsString := TableObj.Number;
    FSQLInsert.ParamByName('POSY').AsFloat := TableObj.PosY;
    FSQLInsert.ParamByName('POSX').AsFloat := TableObj.PosX;
    FSQLInsert.ParamByName('HALLKEY').AsInteger := TableObj.HallKey;
    FSQLInsert.ParamByName('TYPEKEY').AsInteger := TableObj.TableTypeKey;
    // ibsqlInsert.ParamByName('MAINTABLEKEY').AsInteger := TableObj.MainTableKey;
    FSQLInsert.ExecQuery;
    FSQLInsert.Close;
  end;

  procedure DeleteTable(const ID: Integer);
  begin
    FSQLDelete.ParamByName('id').AsInteger := ID;
    FSQLDelete.ExecQuery;
    FSQLDelete.Close;
  end;

begin
  FTransaction := TIBTransaction.Create(nil);
  FSQLUpdate := TIBSQL.Create(nil);
  FSQLInsert := TIBSQL.Create(nil);
  FSQLDelete := TIBSQL.Create(nil);
  try
    FTransaction.DefaultDatabase := FDataBase.ReadTransaction.DefaultDatabase;
    FTransaction.StartTransaction;
    try
      FSQLUpdate.Transaction := FTransaction;
      FSQLUpdate.SQL.Text :=
        ' UPDATE usr$mn_table t ' +
        ' SET t.usr$posy = :posy, ' +
        '     t.usr$posx = :posx  ' +
        ' WHERE t.id = :id ';

      FSQLInsert.Transaction := FTransaction;
      FSQLInsert.SQL.Text :=
        ' INSERT INTO usr$mn_table(id, usr$number, usr$posy, usr$posx, usr$hallkey, usr$type, usr$maintablekey) ' +
        ' VALUES (:id, :number, :posy, :posx, :hallkey, :typekey, null) ';

      FSQLDelete.Transaction := FTransaction;
      FSQLDelete.SQL.Text :=
        ' DELETE FROM usr$mn_table t WHERE t.id = :id ';

      // ���������� ��� ������� ������
      for Key in FTablesList.Keys do
      begin
        Table := TRestTable(FTablesList.Items[Key]);
        if Table.NeedToInsert then
          InsertTable(Table)
        else
          UpdateTable(Table);
      end;

      // �������� ������
      for I in FToDeleteList do
        DeleteTable(I);
      FToDeleteList.Clear;

      if FTransaction.InTransaction then
        FTransaction.Commit;
    except
      if FTransaction.InTransaction then
        FTransaction.Rollback;
    end;
  finally
    FSQLDelete.Free;
    FSQLInsert.Free;
    FSQLUpdate.Free;
    FTransaction.Free;
  end;
end;

procedure TrfTableManager.RefreshOrderData(const ATable: TRestTable = nil);
var
  FSQL: TIBSQL;
  Table: TRestTable;
  Reserv: TrfReservation;

  procedure RefreshSingleTable(CurTable: TRestTable);
  var
    Order: TrfOrder;
  begin
    // ���� �� ���� ������� �� ����� � ��� � �������, �� �� ����� ��������������
    if (CurTable.OrderList.Count <> 0) or (not FSQL.Eof) then
    begin
      // ������ ��� ������ �� �����
      CurTable.ClearOrders;
      while not FSQL.Eof do
      begin
        // ������� ����� � ������ ������� �����
        Order := CurTable.AddOrder(FSQL.FieldByName('DOCUMENTKEY').AsInteger,
          FSQL.FieldByName('NUMBER').AsString);
        Order.TimeCloseOrder := FSQL.FieldByName('usr$timecloseorder').AsDateTime;
        Order.ResponsibleKey := FSQL.FieldByName('usr$respkey').AsInteger;
        Order.ComputerName := FSQL.FieldByName('usr$computername').AsString;
        Order.IsLocked := (FSQL.FieldByName('islocked').AsInteger = 1);

        if CurTable.OrderKey <> Order.ID then
          CurTable.OrderKey := Order.ID;

        if CurTable.ComputerName <> Order.ComputerName then
          CurTable.ComputerName := Order.ComputerName;

        FSQL.Next;
      end;
    end;
    // ������� ��������� �����
    CurTable.RefreshTableCondition(FDataBase.ContactKey);
  end;

begin
  FSQL := TIBSQL.Create(nil);
  try
    FSQL.Transaction := FDataBase.ReadTransaction;
    // ������ ������� ��� ���������� �����
    FSQL.SQL.Text :=
      ' SELECT ' +
      '   u.usr$respkey, ' +
      '   u.documentkey, ' +
      '   u.usr$timecloseorder, ' +
      '   u.usr$computername, ' +
      '   u.usr$islocked AS islocked, ' +
      '   doc.number, ' +
      '   con.name ' +
      ' FROM ' +
      '   usr$mn_table t ' +
      '   JOIN usr$mn_order u ON u.usr$tablekey = t.id AND u.usr$pay <> 1 ' +
      '   LEFT JOIN gd_document doc ON doc.id = u.documentkey ' +
      '   LEFT JOIN gd_contact con ON con.id = u.usr$respkey ' +
      ' WHERE ' +
      '   t.id = :id ';

    // ��������� ���������� ����, ��� ��� �����
    if Assigned(ATable) then
    begin
      FSQL.ParamByName('id').AsInteger := ATable.ID;
      ATable.Date := GetServerDateTime;
      FSQL.ExecQuery;
      RefreshSingleTable(ATable);
      FSQL.Close;

      FSQL.SQL.Text :=
        ' SELECT ' +
        '   R.ID, ' +
        '   R.USR$RESERVDATE, ' +
        '   R.USR$RESERVTIME, ' +
        '   R.USR$DOCUMENTNUMBER ' +
        ' FROM USR$MN_RESERVATION R ' +
        ' WHERE R.USR$TABLEKEY = :ID  ' +
        '  AND R.USR$PAYED <> 1 ';
      FSQL.ParamByName('id').AsInteger := ATable.ID;
      FSQL.ExecQuery;
      while not FSQL.Eof do
      begin
        Reserv := ATable.AddReservation(FSQL.FieldByName('ID').AsInteger,
          FSQL.FieldByName('USR$DOCUMENTDATE').AsString);
        Reserv.ReservDate := FSQL.FieldByName('USR$RESERVDATE').AsDate;
        Reserv.ReservTime := FSQL.FieldByName('USR$RESERVTIME').AsTime;

        FSQL.Next;
      end;
    end
    else
    begin
      // ������ ��� ������ �� ������������
      // ������� �� ���� ������ � ������� ������ ��� ���
      for Table in FTablesList.Values do
      begin
        Table.Date := GetServerDateTime;
        FSQL.ParamByName('id').AsInteger := Table.ID;
        FSQL.ExecQuery;
        RefreshSingleTable(Table);
        FSQL.Close;
      end;
    end;
  finally
    FSQL.Free;
  end;
end;

procedure TrfTableManager.RefreshOrderData(const HallKey: Integer);
var
  FSQL: TIBSQL;
  Table: TRestTable;
  Order: TrfOrder;
  Reserv: TrfReservation;
begin
  FSQL := TIBSQL.Create(nil);
  try
    for Table in FTablesList.Values do
    begin
      if Table.HallKey = HallKey then
        Table.ClearOrders;
    end;

    FSQL.Transaction := FDataBase.ReadTransaction;
    FSQL.SQL.Text :=
      ' SELECT ' +
      '   u.usr$respkey, ' +
      '   u.documentkey, ' +
      '   u.usr$timecloseorder, ' +
      '   u.usr$computername, ' +
      '   u.usr$islocked AS islocked, ' +
      '   doc.number, ' +
      '   con.name, t.id ' +
      ' FROM ' +
      '   usr$mn_table t ' +
      '   JOIN usr$mn_order u ON u.usr$tablekey = t.id AND u.usr$pay <> 1 ' +
      '   LEFT JOIN gd_document doc ON doc.id = u.documentkey ' +
      '   LEFT JOIN gd_contact con ON con.id = u.usr$respkey ' +
      ' WHERE ' +
      '   t.usr$hallkey = :id ';
    FSQL.Params[0].AsInteger := HallKey;
    FSQL.ExecQuery;
    while not FSQL.Eof do
    begin
      Table := GetTable(FSQL.FieldByName('ID').AsInteger);
      if Assigned(Table) then
      begin
        Table.Date := GetServerDateTime;

        // ������� ����� � ������ ������� �����
        Order := Table.AddOrder(FSQL.FieldByName('DOCUMENTKEY').AsInteger,
          FSQL.FieldByName('NUMBER').AsString);
        Order.TimeCloseOrder := FSQL.FieldByName('usr$timecloseorder').AsDateTime;
        Order.ResponsibleKey := FSQL.FieldByName('usr$respkey').AsInteger;
        Order.ComputerName := FSQL.FieldByName('usr$computername').AsString;
        Order.IsLocked := (FSQL.FieldByName('islocked').AsInteger = 1);

        if Table.OrderKey <> Order.ID then
          Table.OrderKey := Order.ID;

        if Table.ComputerName <> Order.ComputerName then
          Table.ComputerName := Order.ComputerName;
      end;
      FSQL.Next;
    end;
    FSQL.Close;

    FSQL.SQL.Text :=
    ' SELECT ' +
    '   R.ID, ' +
    '   R.USR$RESERVDATE, ' +
    '   R.USR$RESERVTIME, ' +
    '   R.USR$DOCUMENTNUMBER, ' +
    '   R.USR$TABLEKEY ' +
    ' FROM USR$MN_RESERVATION R ' +
    ' JOIN USR$MN_TABLE T ON T.ID = R.USR$TABLEKEY ' +
    ' WHERE T.USR$HALLKEY = :ID ' +
    '   AND R.USR$PAYED <> 1 ';
    FSQL.Params[0].AsInteger := HallKey;
    FSQL.ExecQuery;
    while not FSQL.Eof do
    begin
      Table := GetTable(FSQL.FieldByName('USR$TABLEKEY').AsInteger);
      if Assigned(Table) then
      begin
        Reserv := Table.AddReservation(FSQL.FieldByName('ID').AsInteger,
          FSQL.FieldByName('USR$DOCUMENTDATE').AsString);
        Reserv.ReservDate := FSQL.FieldByName('USR$RESERVDATE').AsDate;
        Reserv.ReservTime := FSQL.FieldByName('USR$RESERVTIME').AsTime;
      end;
      FSQL.Next;
    end;
    FSQL.Close;

    //������� ��������� ���� ������
    for Table in FTablesList.Values do
    begin
      if Table.HallKey = HallKey then
        Table.RefreshTableCondition(FDataBase.ContactKey);
    end;
  finally
    FSQL.Free;
  end;
end;

end.
