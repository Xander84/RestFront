unit rfTableManager_unit;

interface

uses
  SysUtils, Classes, Contnrs, Controls, Generics.Collections, Front_DataBase_Unit, kbmMemTable, RestTable_Unit, AdvMenus, pngimage;

type
  TrfTableManager = class(TObject)
  private
    FTableParent: TWinControl;
    FDataBase: TFrontBase;

    // ������� ���������� �� ������� �����
    FTableImageDictionary: TDictionary<Integer, TPngImage>;
    FTableButtonOnClick: TNotifyEvent;
    FTableButtonPopupMenu: TAdvPopupMenu;
    // ������ ������
    FTablesList: TObjectList;
  public
    constructor Create(const Database: TFrontBase; const TableParent: TWinControl);
    destructor Destroy; override;

    { ��������� ����� �� �������� }
    procedure LoadTables(const DataTable: TkbmMemTable);
    { �������� ���������� � ������� �� ������ }
    procedure RefreshOrderData;
    { ��������� ����� � �� }
    procedure SaveTables;
    { �������� ������ ������ }
    procedure Clear;

    { �������� ���� }
    function AddTable(const ATableNumber: String; const ADesignerTable: TRestTable): TRestTable;
    { ������� ���� �� �������������� }
    procedure DropTable(const ID: Integer);

    // ������ ������
    property TablesList: TObjectList read FTablesList;

    // ������� ���������� �� ������� �����
    property TableImageDictionary: TDictionary<Integer, TPngImage>read FTableImageDictionary write FTableImageDictionary;
    property TableButtonOnClick: TNotifyEvent read FTableButtonOnClick write FTableButtonOnClick;
    property TableButtonPopupMenu: TAdvPopupMenu read FTableButtonPopupMenu write FTableButtonPopupMenu;
  end;

implementation

uses
  ibsql, ibdatabase;

{ TrfTableManager }

procedure TrfTableManager.Clear;
begin
  FTablesList.Clear;
end;

constructor TrfTableManager.Create(const Database: TFrontBase; const TableParent: TWinControl);
begin
  FDataBase := Database;
  FTableParent := TableParent;
  FTablesList := TObjectList.Create(true);
end;

destructor TrfTableManager.Destroy;
begin
  FTablesList.Free;
  inherited;
end;

function TrfTableManager.AddTable(const ATableNumber: String; const ADesignerTable: TRestTable): TRestTable;
begin
  // �������� ����� ����, ����� ����������� �����
  Result := TRestTable.Create(FTableParent);
  Result.Parent := FTableParent;

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

procedure TrfTableManager.DropTable(const ID: Integer);
var
  ibsql: TIBSQL;
  WriteTransaction: TIBTransaction;
begin
  Assert(ID <> -1, 'ID not Assigned');
  Assert(Assigned(FDataBase), 'FrontBase not Assigned');

  ibsql := TIBSQL.Create(nil);
  WriteTransaction := TIBTransaction.Create(nil);
  try
    WriteTransaction.DefaultDatabase := FDataBase.ReadTransaction.DefaultDatabase;
    WriteTransaction.StartTransaction;

    ibsql.Transaction := WriteTransaction;
    ibsql.SQL.Text := 'DELETE FROM usr$mn_table t WHERE t.id = :id ';
    ibsql.ParamByName('id').AsInteger := ID;
    ibsql.ExecQuery;
    ibsql.Close;

    WriteTransaction.Commit;
  finally
    ibsql.Free;
    WriteTransaction.Free;
  end;
end;

procedure TrfTableManager.LoadTables(const DataTable: TkbmMemTable);
var
  NewTable: TRestTable;
  PrevTableID: Integer;

  // ���������� ��������� �����
  procedure SetTableCondition;
  begin
    // ���� ��� ���
    if DataTable.FieldByName('ORDERKEY').AsInteger = 0 then
    begin
      // ���� ��� ���
      if FDataBase.ContactKey = DataTable.FieldByName('USR$RESPKEY').AsInteger then
        NewTable.TableCondition := TRestTableCondition.rtcFree
      else
        NewTable.TableCondition := TRestTableCondition.rtcFreeOther;
    end
    else
    begin
      // ���� ��� ���
      if FDataBase.ContactKey = DataTable.FieldByName('USR$RESPKEY').AsInteger then
        NewTable.TableCondition := TRestTableCondition.rtcOccupied
      else
        NewTable.TableCondition := TRestTableCondition.rtcOccupiedOther;
    end;
  end;

begin
  // ������� ������ ������
  FTablesList.Clear;

  // �������� ����� �� ����������� ��������
  if DataTable.Active then
  begin
    PrevTableID := -1;

    DataTable.First;
    while not DataTable.Eof do
    begin
      // ���� ������ ���� ��� ����� �����, ��
      if (DataTable.FieldByName('ORDERKEY').AsInteger = 0) or (PrevTableID <> DataTable.FieldByName('ID').AsInteger) then
      begin
        NewTable := TRestTable.Create(FTableParent);
        NewTable.Parent := FTableParent;

        NewTable.ID := DataTable.FieldByName('ID').AsInteger;
        NewTable.TableTypeKey := DataTable.FieldByName('USR$TYPE').AsInteger;
        // ������������� ������� ������ � ��������
        NewTable.PosX := DataTable.FieldByName('USR$POSX').AsFloat;
        NewTable.PosY := DataTable.FieldByName('USR$POSY').AsFloat;
        // ������ ������ ������������ ������������ ������
        NewTable.RelativeWidth := DataTable.FieldByName('USR$WIDTH').AsFloat;
        NewTable.RelativeHeight := DataTable.FieldByName('USR$LENGTH').AsFloat;
        // �����
        NewTable.OrderKey := DataTable.FieldByName('ORDERKEY').AsInteger;
        NewTable.IsLocked := (DataTable.FieldByName('ISLOCKED').AsInteger = 1);
        // ���������� ��������� �����
        NewTable.RespKey := DataTable.FieldByName('USR$RESPKEY').AsInteger;
        // ����� ����� � ��� �����
        NewTable.Number := DataTable.FieldByName('USR$NUMBER').AsString;
        NewTable.ComputerName := DataTable.FieldByName('USR$COMPUTERNAME').AsString;
        // FButton.RespName := FTablesInfoTable.FieldByName('RESPNAME').AsString;

        // ���������� �������� �� ����� �� ����
        if Assigned(TableButtonOnClick) then
          NewTable.OnClick := TableButtonOnClick;
        // ����������� ���� ��� �����
        if Assigned(TableButtonPopupMenu) then
          NewTable.PopupMenu := TableButtonPopupMenu;
        // ���������� ��������� �����
        SetTableCondition;

        if NewTable.OrderKey <> 0 then
          NewTable.OrderList.Add(DataTable.FieldByName('ORDERKEY').AsInteger, DataTable.FieldByName('NUMBER').AsString);

        // ���������� ����������� ����� �� ������ ����������� ����� ������
        if Assigned(TableImageDictionary) and TableImageDictionary.ContainsKey(NewTable.TableTypeKey) then
          NewTable.pngimage := TableImageDictionary.Items[NewTable.TableTypeKey];

        FTablesList.Add(NewTable);
        PrevTableID := NewTable.ID;
      end
      else if PrevTableID = DataTable.FieldByName('ID').AsInteger then
      begin
        // � �������� ����� ���� ��������� ������� ������ � ���������� ������, ��� ������ ��������� ������� �� ���� ����
        if Assigned(NewTable) then
          NewTable.OrderList.Add(DataTable.FieldByName('ORDERKEY').AsInteger, DataTable.FieldByName('NUMBER').AsString);
      end;

      DataTable.Next;
    end;
  end;
end;

procedure TrfTableManager.SaveTables;
var
  I: Integer;
  Table: TRestTable;
  ibsqlUpdate, ibsqlInsert: TIBSQL;
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

begin
  WriteTransaction := TIBTransaction.Create(nil);
  ibsqlUpdate := TIBSQL.Create(nil);
  ibsqlInsert := TIBSQL.Create(nil);
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

      for I := 0 to FTablesList.Count - 1 do
      begin
        Table := TRestTable(FTablesList.Items[I]);
        if Table.NeedToInsert then
          InsertTable(Table)
        else
          UpdateTable(Table);
      end;

      if WriteTransaction.InTransaction then
        WriteTransaction.Commit;
    except
      if WriteTransaction.InTransaction then
        WriteTransaction.Rollback;
    end;
  finally
    FreeAndNil(ibsqlInsert);
    FreeAndNil(ibsqlUpdate);
    FreeAndNil(WriteTransaction);
  end;
end;

procedure TrfTableManager.RefreshOrderData;
begin

end;

end.
