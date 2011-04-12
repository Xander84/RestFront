unit rfTableManager_unit;

interface

uses
  SysUtils, Classes, Contnrs, Controls, Generics.Collections, Front_DataBase_Unit, RestTable_Unit, AdvMenus, pngimage, AdvGDIP;

type
  TrfTableManager = class(TObject)
  private
    FTableParent: TWinControl;
    FDataBase: TFrontBase;

    // ������� ���������� �� ������� �����
    FTableImageDictionary: TDictionary<Integer, TPngImage>;
    FConditionImageDictionary: TDictionary<TRestTableCondition, TAdvGDIPPicture>;
    FTableButtonOnClick: TNotifyEvent;
    FTableButtonPopupMenu: TAdvPopupMenu;
    // ������ ������
    FTablesList: TList<TRestTable>;
    // ������ �� ������ ������� ����� ������� �� �� ��� ����������
    FToDeleteList: TList<Integer>;

    procedure LoadImages;
  public
    constructor Create(const Database: TFrontBase; const TableParent: TWinControl);
    destructor Destroy; override;

    { ��������� ����� �� �������� }
    procedure LoadTables(const HallKey: Integer);
    { �������� ���������� � ������� �� ������ }
    procedure RefreshOrderData;
    { ��������� ����� � �� }
    procedure SaveTables;
    { �������� ������ ������ }
    procedure Clear;

    function GetImageForType(const ATableType: Integer): TPngImage;
    function GetImageForCondition(const ATableCondition: TRestTableCondition): TAdvGDIPPicture;

    { �������� ���� }
    function AddTable(const ATableNumber: String; const ADesignerTable: TRestTable): TRestTable;
    { ������� ���� �� �������������� }
    procedure DropTable(ATable: TRestTable);
    { ������� ������ ����� �� �� }
    function GetTable(const ATableKey: Integer): TRestTable;

    function GetOrder(const ATableKey, AOrderKey: Integer): TrfOrder;

    // ������ ������
    property TablesList: TList<TRestTable> read FTablesList;

    // ������� ���������� �� ������� �����
    property TableButtonOnClick: TNotifyEvent read FTableButtonOnClick write FTableButtonOnClick;
    property TableButtonPopupMenu: TAdvPopupMenu read FTableButtonPopupMenu write FTableButtonPopupMenu;
  end;

implementation

uses
  ibsql, ibdatabase, FrontData_Unit;

{ TrfTableManager }

procedure TrfTableManager.Clear;
begin
  FTablesList.Clear;
end;

constructor TrfTableManager.Create(const Database: TFrontBase; const TableParent: TWinControl);
begin
  FDataBase := Database;
  FTableParent := TableParent;
  FTablesList := TList<TRestTable>.Create;
  FToDeleteList := TList<Integer>.Create;
  // ������ ����� ������ � �������������
  FTableImageDictionary := TDictionary<Integer, TPngImage>.Create;
  // ������ �������� ��� ��������� ������
  FConditionImageDictionary := TDictionary<TRestTableCondition,TAdvGDIPPicture>.Create;

  // �������� �����������
  LoadImages;
end;

destructor TrfTableManager.Destroy;
var
  TableImage: TPngImage;
  Table: TRestTable;
begin
  // ������ ����� ������ � �������������
  for TableImage in FTableImageDictionary.Values do
    if Assigned(TableImage) then
      TableImage.Free;
  FreeAndNil(FTableImageDictionary);
  // ������ �������� ��� ��������� ������ (����������� �� ���� ����������, �.�. ��� ��������� � ����������)
  FreeAndNil(FConditionImageDictionary);

  FreeAndNil(FToDeleteList);
  for Table in FTablesList do
    if Assigned(Table) then
      Table.Free;
  FreeAndNil(FTablesList);
  inherited;
end;

function TrfTableManager.AddTable(const ATableNumber: String; const ADesignerTable: TRestTable): TRestTable;
begin
  // �������� ����� ����, ����� ����������� �����
  Result := TRestTable.Create(FTableParent);
  Result.Parent := FTableParent;
  Result.Manager := Self;

  Result.TableTypeKey := ADesignerTable.TableTypeKey;
  Result.HallKey := ADesignerTable.HallKey;
  Result.OrderKey := 0;
  Result.RespKey := 0;
  Result.IsLocked := False;
  Result.Number := ATableNumber;
  Result.NeedToInsert := true;

  // ������������� ������� � ������� �����
  Result.PosX := 50;
  Result.PosY := 50;
  Result.RelativeWidth := ADesignerTable.RelativeWidth;
  Result.RelativeHeight := ADesignerTable.RelativeHeight;
  // ����������� �����
  Result.pngimage := ADesignerTable.pngimage;

  FTablesList.Add(Result);
end;

procedure TrfTableManager.DropTable(ATable: TRestTable);
var
  ibsql: TIBSQL;
  WriteTransaction: TIBTransaction;
begin
  // �������� �� ����� � ������ �� �������� �� ��
  FToDeleteList.Add(ATable.ID);
  // ������ ������
  FTablesList.Remove(ATable);
end;

function TrfTableManager.GetImageForCondition(const ATableCondition: TRestTableCondition): TAdvGDIPPicture;
begin
  Result := nil;
  if FConditionImageDictionary.ContainsKey(ATableCondition) then
    Result := FConditionImageDictionary.Items[ATableCondition];
end;

function TrfTableManager.GetImageForType(const ATableType: Integer): TPngImage;
begin
  // ����������� �����
  Result := nil;
  if FTableImageDictionary.ContainsKey(ATableType) then
    Result := FTableImageDictionary.Items[ATableType];
end;

function TrfTableManager.GetOrder(const ATableKey, AOrderKey: Integer): TrfOrder;
var
  Table: TRestTable;
begin
  Table := GetTable(ATableKey);
  if Assigned(Table) then
    Result := Table.GetOrder(AOrderKey);
end;

function TrfTableManager.GetTable(const ATableKey: Integer): TRestTable;
var
  Table: TRestTable;
begin
  for Table in FTablesList do
    if Table.ID = ATableKey then
    begin
      Result := Table;
      Exit;
    end;
  Result := nil;
end;

procedure TrfTableManager.LoadImages;
var
  ibsql: TIBSQL;
  PngImage: TPngImage;
  Str: TStream;
begin
  // �������� ����������� ������
  if Assigned(FTableImageDictionary) then
  begin
    ibsql := TIBSQL.Create(nil);
    try
      ibsql.Transaction := FDataBase.ReadTransaction;
      ibsql.SQL.Text :=
        ' SELECT id, usr$picture1 AS img FROM usr$mn_tabletype ';
      ibsql.ExecQuery;

      while not ibsql.Eof do
      begin
        Str := TMemoryStream.Create;
        try
          ibsql.FieldByName('img').SaveToStream(Str);
          Str.Position := 0;
          PngImage := TPngImage.Create;
          PngImage.LoadFromStream(Str);
        finally
          FreeAndNil(Str);
        end;

        FTableImageDictionary.Add(ibsql.FieldByName('id').AsInteger, PngImage);
        ibsql.Next;
      end;
    finally
      FreeAndNil(ibsql);
    end;
  end;

  // �������� ����������� ��������� ������
  FConditionImageDictionary.Add(rtcUnknown, nil);
  FConditionImageDictionary.Add(rtcFree, nil{FrontData.RestPictureContainer.FindPicture('bullet_green_small')});
  FConditionImageDictionary.Add(rtcFreeOther, nil{FrontData.RestPictureContainer.FindPicture('bullet_green_small')});
  FConditionImageDictionary.Add(rtcOccupied, FrontData.RestPictureContainer.FindPicture('user_small'));
  FConditionImageDictionary.Add(rtcOccupiedOther, FrontData.RestPictureContainer.FindPicture('bullet_yellow_small'));
  FConditionImageDictionary.Add(rtcPreCheck, FrontData.RestPictureContainer.FindPicture('money'));
end;

procedure TrfTableManager.LoadTables(const HallKey: Integer);
var
  NewTable: TRestTable;
  ibsql: TIBSQL;
  ParentDoubleBuffered: Boolean;
begin
  ParentDoubleBuffered := FTableParent.DoubleBuffered;
  FTableParent.DoubleBuffered := False;
  try
    // ������� ������ ������
    for NewTable in FTablesList do
      if Assigned(NewTable) then
        NewTable.Free;
    FTablesList.Clear;

    ibsql := TIBSQL.Create(nil);
    try
      ibsql.Transaction := FDataBase.ReadTransaction;
      ibsql.SQL.Text :=
        ' SELECT ' +
        '   t.id, t.usr$type, t.usr$number, ' +
        '   t.usr$posx, t.usr$posy, tt.usr$width, tt.usr$length ' +
        ' FROM ' +
        '   usr$mn_table t ' +
        '   LEFT JOIN usr$mn_tabletype tt ON tt.id = t.usr$type ' +
        ' WHERE ' +
        '   t.usr$hallkey = :id ';
      ibsql.Params[0].AsInteger := HallKey;
      ibsql.ExecQuery;

      // �������� ����� �� ������ �������
      while not ibsql.Eof do
      begin
        NewTable := TRestTable.Create(FTableParent);
        NewTable.Parent := FTableParent;
        NewTable.Manager := Self;

        NewTable.ID := ibsql.FieldByName('ID').AsInteger;
        NewTable.TableTypeKey := ibsql.FieldByName('USR$TYPE').AsInteger;
        // ������������� ������� ������ � ��������
        NewTable.PosX := ibsql.FieldByName('USR$POSX').AsFloat;
        NewTable.PosY := ibsql.FieldByName('USR$POSY').AsFloat;
        // ������ ������ ������������ ������������ ������
        NewTable.RelativeWidth := ibsql.FieldByName('USR$WIDTH').AsFloat;
        NewTable.RelativeHeight := ibsql.FieldByName('USR$LENGTH').AsFloat;
        // ����� ����� � ��� �����
        NewTable.Number := ibsql.FieldByName('USR$NUMBER').AsString;
        //NewTable.ComputerName := ibsql.FieldByName('USR$COMPUTERNAME').AsString;
        // FButton.RespName := ibsql.FieldByName('RESPNAME').AsString;

        // ���������� �������� �� ����� �� ����
        if Assigned(TableButtonOnClick) then
          NewTable.OnClick := TableButtonOnClick;
        // ����������� ���� ��� �����
        if Assigned(TableButtonPopupMenu) then
          NewTable.PopupMenu := TableButtonPopupMenu;

        // ���������� ����������� ����� �� ������ ����������� ����� ������
        NewTable.pngimage := GetImageForType(NewTable.TableTypeKey);

        FTablesList.Add(NewTable);
        ibsql.Next;
      end;
      ibsql.Close;
    finally
      FreeAndNil(ibsql);
    end;
  finally
    FTableParent.DoubleBuffered := ParentDoubleBuffered;
  end;
end;

procedure TrfTableManager.SaveTables;
var
  I: Integer;
  Table: TRestTable;
  ibsqlUpdate, ibsqlInsert, ibsqlDelete: TIBSQL;
  WriteTransaction: TIBTransaction;

  procedure UpdateTable(const TableObj: TRestTable);
  begin
    ibsqlUpdate.ParamByName('POSY').AsFloat := TableObj.PosY;
    ibsqlUpdate.ParamByName('POSX').AsFloat := TableObj.PosX;
    ibsqlUpdate.ParamByName('ID').AsInteger := TableObj.ID;
    ibsqlUpdate.ExecQuery;
    ibsqlUpdate.Close;
  end;

  procedure InsertTable(const TableObj: TRestTable);
  begin
    TableObj.ID := FDataBase.GetNextID;

    ibsqlInsert.ParamByName('ID').AsInteger := TableObj.ID;
    ibsqlInsert.ParamByName('NUMBER').AsString := TableObj.Number;
    ibsqlInsert.ParamByName('POSY').AsFloat := TableObj.PosY;
    ibsqlInsert.ParamByName('POSX').AsFloat := TableObj.PosX;
    ibsqlInsert.ParamByName('HALLKEY').AsInteger := TableObj.HallKey;
    ibsqlInsert.ParamByName('TYPEKEY').AsInteger := TableObj.TableTypeKey;
    // ibsqlInsert.ParamByName('MAINTABLEKEY').AsInteger := TableObj.MainTableKey;
    ibsqlInsert.ExecQuery;
    ibsqlInsert.Close;
  end;

  procedure DeleteTable(const ID: Integer);
  begin
    ibsqlDelete.ParamByName('id').AsInteger := ID;
    ibsqlDelete.ExecQuery;
    ibsqlDelete.Close;
  end;

begin
  WriteTransaction := TIBTransaction.Create(nil);
  ibsqlUpdate := TIBSQL.Create(nil);
  ibsqlInsert := TIBSQL.Create(nil);
  ibsqlDelete := TIBSQL.Create(nil);
  try
    WriteTransaction.DefaultDatabase := FDataBase.ReadTransaction.DefaultDatabase;
    WriteTransaction.StartTransaction;
    try
      ibsqlUpdate.Transaction := WriteTransaction;
      ibsqlUpdate.SQL.Text :=
        ' UPDATE usr$mn_table t ' +
        ' SET t.usr$posy = :posy, ' +
        '     t.usr$posx = :posx  ' +
        ' WHERE t.id = :id ';

      ibsqlInsert.Transaction := WriteTransaction;
      ibsqlInsert.SQL.Text :=
        'INSERT INTO usr$mn_table(id, usr$number, usr$posy, usr$posx, usr$hallkey, usr$type, usr$maintablekey) ' +
        ' VALUES (:id, :number, :posy, :posx, :hallkey, :typekey, null) ';

      ibsqlDelete.Transaction := WriteTransaction;
      ibsqlDelete.SQL.Text :=
        'DELETE FROM usr$mn_table t WHERE t.id = :id ';

      // ���������� ��� ������� ������
      for I := 0 to FTablesList.Count - 1 do
      begin
        Table := TRestTable(FTablesList.Items[I]);
        if Table.NeedToInsert then
          InsertTable(Table)
        else
          UpdateTable(Table);
      end;

      // �������� ������
      for I in FToDeleteList do
        DeleteTable(I);
      FToDeleteList.Clear;

      if WriteTransaction.InTransaction then
        WriteTransaction.Commit;
    except
      if WriteTransaction.InTransaction then
        WriteTransaction.Rollback;
    end;
  finally
    FreeAndNil(ibsqlDelete);
    FreeAndNil(ibsqlInsert);
    FreeAndNil(ibsqlUpdate);
    FreeAndNil(WriteTransaction);
  end;
end;

procedure TrfTableManager.RefreshOrderData;
var
  ibsql: TIBSQL;
  Table: TRestTable;
  Order: TrfOrder;
begin
  ibsql := TIBSQL.Create(nil);
  try
    ibsql.Transaction := FDataBase.ReadTransaction;
    // ������ ������� ��� ���������� �����
    ibsql.SQL.Text :=
      ' SELECT ' +
      '   u.usr$respkey, ' +
      '   u.documentkey, ' +
      '   u.usr$timecloseorder, ' +
      '   u.usr$computername, ' +
      '   doc.number, ' +
      '   con.name ' +
      ' FROM ' +
      '   usr$mn_table t ' +
      '   JOIN usr$mn_order u ON u.usr$tablekey = t.id AND u.usr$pay <> 1 ' +
      '   LEFT JOIN gd_document doc ON doc.id = u.documentkey ' +
      '   LEFT JOIN gd_contact con ON con.id = u.usr$respkey ' +
      ' WHERE ' +
      '   t.id = :id ';

    // ������� �� ���� ������ � ������� ������ ��� ���
    for Table in FTablesList do
    begin
      ibsql.ParamByName('id').AsInteger := Table.ID;
      ibsql.ExecQuery;

      // ���� �� ���� ������� �� ����� � ��� � �������, �� �� ����� ��������������
      if (Table.OrderList.Count <> 0) or (not ibsql.Eof) then
      begin
        Table.OrderList.Clear;
        while not ibsql.Eof do
        begin
          if Table.OrderKey <> ibsql.FieldByName('DOCUMENTKEY').AsInteger then
            Table.OrderKey := ibsql.FieldByName('DOCUMENTKEY').AsInteger;

          if Table.RespKey <> ibsql.FieldByName('USR$RESPKEY').AsInteger then
            Table.RespKey := ibsql.FieldByName('USR$RESPKEY').AsInteger;

          Order := Table.AddOrder(ibsql.FieldByName('DOCUMENTKEY').AsInteger,
            ibsql.FieldByName('NUMBER').AsString);
          Order.TimeCloseOrder := ibsql.FieldByName('usr$timecloseorder').AsDateTime;

          ibsql.Next;
        end;
      end;
      // ������� ��������� �����
      Table.RefreshTableCondition(FDataBase.ContactKey);

      ibsql.Close;
    end;
  finally
    FreeAndNil(ibsql);
  end;
end;

end.
