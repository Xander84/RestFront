
{++

  Copyright (c) 2001 - 2010 by Golden Software of Belarus

  Module

    obj_QueryList_unit.pas

  Abstract

    Gedemin project. It is COM-object for Report System.
    Include List of Query (IB or ClientDataSet).
    Uses for obtaining start selection.

--}


 { TODO : Заменить TClientDataSet }
unit obj_QueryList;

interface

uses
  IBDatabase, SysUtils, Contnrs, IBQuery, Windows, Db, Classes,
  gd_MultiStringList, IBCustomDataSet, DBClient;

const
  QueryNotAssigned = 'Query not assigned';
  FieldNotAssigned = 'Field not assigned';
  OnlyForIBQuery = 'Method only for Query';
  OnlyForClientDataSet = 'Method only for MemTable';
  MDPrefix = 'MDP';
  IndexPrefix = 'INP';

type
  TDnByteArray = array of Byte;

type
  TgsDataSet = class(TObject)
  private
    FFetchBlob: Boolean;
    FIndexFields: String;
    FDataSet: TDataSet;

    function GetIBQuery: TIBQuery;
    function GetClientDataSet: TClientDataSet;
    procedure SetDatabase(const AnValue: TIBDatabase);
    procedure SetTransaction(const AnValue: TIBTransaction);
    function GetDataSet: TDataSet;
    function Get_Tag: Integer;
    procedure Set_Tag(const Value: Integer);

  protected
    function GetStrFromFieldType(const AnFieldType: TFieldType): String;
  protected

//    FCurrentField: TField;

//    procedure AssignFields(const ADataSet: TDataSet);
    procedure CopyRecord(const ADataSet: TDataSet);
    procedure ClearFields;
    function  Get_Transaction: TIBTransaction;
    procedure Set_Transaction(const Value: TIBTransaction);

    function  Get_Fields(Index: Integer): TField;
    function  Get_FieldByName(const FieldName: String): TField;
    function  Get_IsResult: Boolean;
    procedure Set_IsResult(Value: Boolean);
    function  Get_SQL: String;
    procedure Set_SQL(const Value: String);
    function  Get_Params(Index: Integer): TParam;
    function  Get_ParamByName(const ParamName: String): TParam;
    function  Get_FieldCount: Integer;
    function  Get_ParamCount: Integer;
    function  Get_FetchBlob: Boolean;
    procedure Set_FetchBlob(Value: Boolean);
    function  Get_IndexFields: String;
    procedure Set_IndexFields(const Value: String);
    function  Get_RecordCount: Integer;
    function  Get_Active: Boolean;
    function  CreateBlobStream(const Field: TField; Mode: TBlobStreamMode): TStream;
    function  Get_Self: Integer;
  public
    constructor Create(const AnMemTable: Boolean; const AnChildClass: Boolean = False);
    destructor Destroy; override;

    procedure Open;
    procedure ExecSQL;
    procedure Close;
    procedure First;
    procedure Last;
    function  Eof: Boolean;
    function  Bof: Boolean;
    procedure Next;
    procedure Prior;
    procedure Append;
    procedure Edit;
    procedure Delete;
    procedure Post;
    procedure Cancel;
    procedure Insert;
    function  Locate(const KeyFields: string; const KeyValues: Variant;
      Options: TLocateOptions): Boolean;
    procedure AddField(const FieldName: String; const FieldType: String;
                       FieldSize: Integer; Required: Boolean);

    property Database: TIBDatabase write SetDatabase;
    property Transaction: TIBTransaction write SetTransaction;
    property DataSet: TDataSet read GetDataSet;

    property Fields[Index: Integer]: TField read Get_Fields;
    property FieldByName[const FieldName: String]: TField read Get_FieldByName;
    property IsResult: Boolean read Get_IsResult write Set_IsResult;
    property SQL: String read Get_SQL write Set_SQL;
    property Params[Index: Integer]: TParam read Get_Params;
    property ParamByName[const ParamName: String]: TParam read Get_ParamByName;
    property FieldCount: Integer read Get_FieldCount;
    property ParamCount: Integer read Get_ParamCount;
//    property OnCalcField: LongWord read Get_OnCalcField write Set_OnCalcField;
    property FetchBlob: Boolean read Get_FetchBlob write Set_FetchBlob;
    property IndexFields: String read Get_IndexFields write Set_IndexFields;
    property RecordCount: Integer read Get_RecordCount;
    property Active: Boolean read Get_Active;
    property Self: Integer read Get_Self;
    property Tag: Integer read Get_Tag write Set_Tag;
  end;

type
  TgsQueryList = class(TObject)
  private
    FDatabase: TIBDatabase;
    FTransaction: TIBTransaction;
    FQueryList: TList;
//    FCurrentField: TField;
    FMasterDetail: TFourStringList;
    FTempMasterDetail: TFourStringList;
    FWasCreateTransaction: Boolean;
    FDataSourceList: TObjectList;

    function GetQuery(Index: Integer): TDataSet;
    function GetCount: Integer;
    function GetIndexQueryByName(const Name: String): Integer;
  protected
    procedure Delete(Index: Integer);
    function  Get_Query(Index: Integer): TgsDataSet;
    function  Get_Count: Integer;
    function  Get_QueryByName(const Name: String): TgsDataSet;
    function  ResultStream: OleVariant;
    procedure AddMasterDetail(const MasterTable: String; const MasterField: String;
                              const DetailTable: String; const DetailField: String);
    procedure ResultMasterDetail;
    procedure DeleteByName(const AName: String);
    procedure MainInitialize;
    procedure Commit;
    function Get_Self: Integer;
  public
    constructor Create(const AnDatabase: TIBDatabase; const AnTransaction: TIBTransaction;
      const AnIsRealList: Boolean = False);
    destructor Destroy; override;

    function  Add(const QueryName: String; MemQuery: Boolean): Integer;
    procedure Clear;

    property Count: Integer read GetCount;

    property DSQuery[Index: Integer]: TDataSet read GetQuery;
    property Query[Index: Integer]: TgsDataSet read Get_Query;
    property QueryByName[const Name: String]: TgsDataSet read Get_QueryByName;
    property Self: Integer read Get_Self;

    function  AddRealQuery(const AnRealQuery: TgsDataSet): Integer;
    procedure ClearObjectList;
  end;

type
  TReportResult = class(TStringList)
  private
    FMasterDetail: TFourStringList;
    FTempStream: TMemoryStream;
    FIsStreamData: Boolean;
    FBaseQueryList: TgsQueryList;

    function GetDataSet(const AnIndex: Integer): TDataSet;
  public
    constructor Create;
    destructor Destroy; override;

    procedure ViewResult;

    property DataSet[const AnIndex: Integer]: TDataSet read GetDataSet;
    function DataSetByName(const AnName: String): TDataSet;
    property TempStream: TMemoryStream read FTempStream;
    property IsStreamData: Boolean read FIsStreamData write FIsStreamData;

    procedure Assign(const AnReportResult: TReportResult); reintroduce;
    procedure AssignTempStream(const AnStream: TStream);
    procedure Clear; override;

    function AddDataSet(const AnName: String): Integer; overload;
    function AddDataSet(const AnName: String; const AnDataSet: TDataSet): Integer; overload;
    procedure AddDataSetList(const AnBaseQueryList: Variant);
    procedure DeleteDataSet(const AnIndex: Integer);
    procedure AddMasterDetail(const AnMasterTable, AnMasterField, AnDetailTable,
     AnDetailField: String);

    procedure LoadFromStream(AnStream: TStream); reintroduce;
    procedure SaveToStream(AnStream: TStream); reintroduce;

    property _MasterDetail: TFourStringList read FMasterDetail;
    property QueryList: TgsQueryList read FBaseQueryList write FBaseQueryList;
  end;


procedure CompliteDataSetStream(const AnStream: TStream;
  const AnDataSet: TDataSet; const AnFetchBlob: Boolean = False);
function GetFieldTypeFromStr(const AnTypeName: String): TFieldType;

var
  gsQueryList: TgsQueryList;

implementation

uses
  IBSQL, TypInfo, IB, rp_dlgViewResult_unit, Variants;

type
  TFieldCracker = class(TField);
  TCrackIBCustomDataSet = class(TIBCustomDataSet);

constructor TgsDataSet.Create(const AnMemTable: Boolean; const AnChildClass: Boolean = False);
begin
  inherited Create;

  if not AnChildClass then
  begin
    if AnMemTable then
      FDataSet := TClientDataSet.Create(nil)
    else
      FDataSet := TIBQuery.Create(nil);
    FDataSet.Tag := 0;
//    FCurrentField := nil;
  end;
  FFetchBlob := False;
  FIndexFields := '';
end;

destructor TgsDataSet.Destroy;
begin
  if Assigned(FDataSet) then
  begin
    FDataSet.Close;
    FreeAndNil(FDataSet);
  end;

  inherited Destroy;
end;

function TgsDataSet.GetIBQuery: TIBQuery;
begin
  if not (FDataSet is TIBQuery) then
    raise Exception.Create(OnlyForIBQuery);
  Result := FDataSet as TIBQuery;
end;

function TgsDataSet.GetClientDataSet: TClientDataSet;
begin
  if not (FDataSet is TClientDataSet) then
    raise Exception.Create(OnlyForClientDataSet);
  Result := FDataSet as TClientDataSet;
end;

procedure TgsDataSet.SetDatabase(const AnValue: TIBDatabase);
begin
  GetIBQuery.Database := AnValue;
end;

procedure TgsDataSet.SetTransaction(const AnValue: TIBTransaction);
begin
  GetIBQuery.Transaction := AnValue;
end;

function TgsDataSet.GetDataSet: TDataSet;
begin
  Result := FDataSet;
end;

function GetFieldTypeFromStr(const AnTypeName: String): TFieldType;
var
  I: Integer;
begin
  if AnTypeName > '' then
  begin
    I := GetEnumValue(TypeInfo(TFieldType), AnTypeName);
    if I <> -1 then
    begin
      Result := TFieldType(I);
      exit;
    end;
  end;

  raise Exception.Create('Invalid type specified.');
end;

procedure TgsDataSet.ExecSQL;
begin
  if not (FDataSet is TIBQuery) then
    raise Exception.Create(OnlyForIBQuery);
  GetIBQuery.ExecSQL;
end;

procedure TgsDataSet.Open;
begin
  try
    if FDataSet is TIBQuery then
      FDataSet.Open
    else
      GetClientDataSet.CreateDataSet;
  except
    on E: Exception do
      raise Exception.Create(FDataSet.Name + ': ' + E.Message);
  end;
end;

procedure TgsDataSet.Close;
begin
  FDataSet.Close;
end;

procedure TgsDataSet.First;
begin
  FDataSet.First;
end;

procedure TgsDataSet.Last;
begin
  FDataSet.Last;
end;

function TgsDataSet.Eof: Boolean;
begin
  Result := FDataSet.Eof;
end;

function TgsDataSet.Get_Fields(Index: Integer): TField;
begin
  Result := FDataSet.Fields[Index];
end;

function TgsDataSet.Get_FieldByName(const FieldName: String): TField;
begin
  Result := FDataSet.FieldByName(FieldName);
end;

function TgsDataSet.Bof: Boolean;
begin
  Result := FDataSet.Bof;
end;

procedure TgsDataSet.Next;
begin
  FDataSet.Next;
end;

procedure TgsDataSet.Prior;
begin
  FDataSet.Prior;
end;

function TgsDataSet.Get_IsResult: Boolean;
begin
  Result := FDataSet.Tag <> 0;
end;

procedure TgsDataSet.Set_IsResult(Value: Boolean);
begin
  if Value then
    FDataSet.Tag := 1
  else
    FDataSet.Tag := 0;
end;

function TgsDataSet.Get_SQL: String;
begin
  Result := GetIBQuery.SQL.Text;
end;

procedure TgsDataSet.Set_SQL(const Value: String);
begin
  GetIBQuery.SQL.Text := Value;
end;

procedure TgsDataSet.AddField(const FieldName: String; const FieldType: String;
  FieldSize: Integer; Required: Boolean);
begin
  if FDataSet is TClientDataSet then
    FDataSet.FieldDefs.Add(FieldName, GetFieldTypeFromStr(FieldType), FieldSize,
      Required)
end;

procedure TgsDataSet.ClearFields;
begin
  GetClientDataSet.Close;
  GetClientDataSet.FieldDefs.Clear;
end;

procedure TgsDataSet.Append;
begin
  GetClientDataSet.Append;
end;

procedure TgsDataSet.Edit;
begin
  GetClientDataSet.Edit;
end;

procedure TgsDataSet.Delete;
begin
  GetClientDataSet.Delete;
end;

procedure TgsDataSet.Post;
begin
  GetClientDataSet.Post;
end;

procedure TgsDataSet.Cancel;
begin
  GetClientDataSet.Cancel;
end;

function TgsDataSet.Get_FieldCount: Integer;
begin
  Result := FDataSet.FieldCount;
end;

function TgsDataSet.Get_ParamCount: Integer;
begin
  if FDataSet is TIBQuery then
    Result := GetIBQuery.ParamCount
  else
    Result := GetClientDataSet.Params.Count;
end;

function TgsDataSet.Get_ParamByName(const ParamName: String): TParam;
begin
  if FDataSet is TIBQuery then
    Result := GetIBQuery.ParamByName(ParamName)
  else
    Result := GetClientDataSet.Params.ParamByName(ParamName);
end;

function TgsDataSet.Get_Params(Index: Integer): TParam;
begin
  if FDataSet is TIBQuery then
    Result := GetIBQuery.Params[Index]
  else
    Result := GetClientDataSet.Params[Index];
end;

{TgsQueryList}

constructor TgsQueryList.Create(const AnDatabase: TIBDatabase; const AnTransaction: TIBTransaction;
 const AnIsRealList: Boolean = False);
var
  InternalTransaction: TIBTransaction;
begin
  inherited Create;

  if not AnIsRealList and ((AnTransaction = nil) or (AnDatabase = nil)) then
    raise Exception.Create('Database or Transaction not assigned');
  FDatabase := AnDatabase;
  if Assigned(AnTransaction) then
  begin
    FTransaction := AnTransaction;
    FWasCreateTransaction := False;
  end
  else
  begin
    InternalTransaction := TIBTransaction.Create(nil);
    InternalTransaction.DefaultDatabase :=  FDatabase;
    InternalTransaction.Params.Add('read_committed');
    InternalTransaction.Params.Add('rec_version');
    InternalTransaction.Params.Add('nowait');
    FTransaction := InternalTransaction;
    FWasCreateTransaction := True;
  end;
  FQueryList := TList.Create;
  FMasterDetail := TFourStringList.Create;
  FTempMasterDetail := TFourStringList.Create;
  FDataSourceList := TObjectList.Create;
end;

destructor TgsQueryList.Destroy;
begin
  ClearObjectList;
  if FWasCreateTransaction then
    FTransaction.Free;
  try
    FreeAndNil(FQueryList);
  except
  end;
  FreeAndNil(FMasterDetail);
  FreeAndNil(FTempMasterDetail);
  FreeAndNil(FDataSourceList);

  inherited Destroy;
end;

function TgsQueryList.Add(const QueryName: String; MemQuery: Boolean): Integer;
var
  Index: Integer;
begin
  Result := -1;
  Index := GetIndexQueryByName(QueryName);
  if Index = - 1 then
  try
    Result := FQueryList.Add(nil);
    FQueryList.Items[Result] := TgsDataSet.Create(MemQuery);
    TgsDataSet(FQueryList.Items[Result]).DataSet.Name := QueryName;
    TgsDataSet(FQueryList.Items[Result]).Set_IsResult(True);
    if not MemQuery then
    begin
      TgsDataSet(FQueryList.Items[Result]).Database := FDatabase;
      TgsDataSet(FQueryList.Items[Result]).Transaction := FTransaction;
    end;
  except
    on E: Exception do
    begin
      Delete(Result);
      Result := -1;
      raise Exception.Create('Произошла ошибка при создании нового объекта.'#13#10 +
        E.Message);
    end;
  end
  else
    raise Exception.Create(Format('Объект с именем "%s" уже имеется в списке', [QueryName]));
end;

function TgsQueryList.Get_Query(Index: Integer): TgsDataSet;
begin
  Result := FQueryList.Items[Index];
end;

function  TgsQueryList.Get_Count: Integer;
begin
  Result := FQueryList.Count;
end;

procedure TgsQueryList.Clear;
begin
  MainInitialize;
  Commit;
end;

procedure TgsQueryList.Delete(Index: Integer);
begin
  FQueryList.Items[Index] := nil;
  FQueryList.Delete(Index);
end;

procedure TgsQueryList.ClearObjectList;
begin
  Clear;
end;

function TgsQueryList.Get_QueryByName(const Name: String): TgsDataSet;
var
  I: Integer;
begin
  Result := nil;
  I := GetIndexQueryByName(Name);
  if I > -1 then
    Result := FQueryList.Items[I];
  if Result = nil then
    raise Exception.Create('Query not found');
end;

{TODO переделать результат в TStream}
function TgsQueryList.ResultStream: OleVariant;
var
  J: Integer;
  LocReportResult: TReportResult;
  MStr: TMemoryStream;
  DS: TClientDataSet;
begin
  LocReportResult := TReportResult.Create;
  try
    MStr := TMemoryStream.Create;
    try
      for J := 0 to Count - 1 do
        if (DSQuery[J].Tag <> 0) and (DSQuery[J].Active) then
        begin
          DSQuery[J].DisableControls;
          try
            //TClientDataSet уничтожится в LocReportResult.Free
            DS := TClientDataSet.Create(nil);
            CompliteDataSetStream(MStr, DSQuery[J], Get_Query(J).FetchBlob);
            MStr.Position := 0;
            DS.LoadFromStream(MStr);
            LocReportResult.AddDataSet(DSQuery[J].Name, DS);
          finally
            DSQuery[J].EnableControls;
          end;
        end;

      for J := 0 to FMasterDetail.Count - 1 do
        LocReportResult._MasterDetail.AddRecord(FMasterDetail.MasterTable[J],
         FMasterDetail.MasterField[J], FMasterDetail.DetailTable[J],
         FMasterDetail.DetailField[J]);

      MStr.Clear;
      LocReportResult.SaveToStream(MStr);
      Result := VarArrayCreate([0, MStr.Size - 1], varByte);
      CopyMemory(VarArrayLock(Result), MStr.Memory, MStr.Size);
      VarArrayUnLock(Result);
    finally
      MStr.Free;
    end;
  finally
    LocReportResult.Free;
  end;
end;

function TgsQueryList.GetQuery(Index: Integer): TDataSet;
begin
  Result := TgsDataSet(FQueryList.Items[Index]).DataSet;
end;

function TgsQueryList.GetCount: Integer;
begin
  Result := FQueryList.Count;
end;

procedure TgsQueryList.AddMasterDetail(const MasterTable, MasterField,
  DetailTable, DetailField: String);
var
  I: Integer;
  TempDS: TDataSet;
begin
  I := GetIndexQueryByName(MasterTable);
  if I > -1 then
  begin
    TempDS := TgsDataSet(FQueryList.Items[I]).DataSet;
    TempDS.Active := True;
    if not CheckFieldNames(TempDS, MasterField) then
      raise Exception.Create('Specified master field not found.');
  end;

  I := GetIndexQueryByName(DetailTable);
  if I > -1 then
  begin
    TempDS := TgsDataSet(FQueryList.Items[I]).DataSet;
    TempDS.Active := True;
    if not CheckFieldNames(TempDS, DetailField) then
      raise Exception.Create('Specified detail field not found.');
  end;

  if not (TgsDataSet(FQueryList.Items[I]).DataSet is TClientDataSet) then
    FTempMasterDetail.AddRecord(MasterTable, MasterField, DetailTable, DetailField);

  FMasterDetail.AddRecord(MasterTable, MasterField, DetailTable, DetailField);
end;

function TgsQueryList.GetIndexQueryByName(const Name: String): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to FQueryList.Count - 1 do
    if AnsiUpperCase(TgsDataSet(FQueryList.Items[I]).DataSet.Name) = AnsiUpperCase(Name) then
    begin
      Result := I;
      Break;
    end;
end;

function TgsQueryList.AddRealQuery(const AnRealQuery: TgsDataSet): Integer;
begin
  Result := FQueryList.Add(nil);
  try
    FQueryList.Items[Result] := AnRealQuery;
    TgsDataSet(FQueryList.Items[Result]).Set_IsResult(True);
  except
    on E: Exception do
    begin
      Delete(Result);
      raise Exception.Create('Произошла ошибка при создании нового объекта.'#13#10 +
       E.Message);
    end;
  end;
end;

procedure TgsQueryList.DeleteByName(const AName: String);
begin
  Delete(GetIndexQueryByName(AName));
end;

procedure TgsQueryList.Commit;
begin
  if (FTransaction <> nil) and FTransaction.InTransaction then
    FTransaction.Commit;
end;

procedure TgsQueryList.MainInitialize;
var
  I: Integer;
begin
  for I := 0 to FQueryList.Count - 1 do
  begin
    FQueryList.Items[I] := nil;
  end;
  FQueryList.Clear;
  FMasterDetail.Clear;
  FTempMasterDetail.Clear;
  FDataSourceList.Clear;
//  FCurrentField := nil;
end;

function TgsQueryList.Get_Self: Integer;
begin
  Result := Integer(Self);
end;

procedure TgsQueryList.ResultMasterDetail;
var
  I, J, Index: Integer;
  MemTable: TgsDataSet;
  DS: TClientDataSet;
  IsResult: Boolean;
  IndexFields: String;
  MStr: TMemoryStream;

  procedure AddMasterDetail(const AnMasterTable, AnMasterField,
    AnDetailTable, AnDetailField: String);
  var
    TempDs: TClientDataSet;
  begin
    TempDs := (TgsDataSet(FQueryList.Items[GetIndexQueryByName(AnDetailTable)]).DataSet as TClientDataSet);
    if TempDs.MasterSource = nil then
    begin
      TempDs.MasterSource := TDataSource.Create(nil);
      FDataSourceList.Add(TempDs.MasterSource);
    end;
    TempDs.MasterSource.DataSet := TgsDataSet(FQueryList.Items[GetIndexQueryByName(AnMasterTable)]).DataSet;
    TempDs.IndexFieldNames := AnDetailField;
    TempDs.MasterFields := AnMasterField;
  end;

begin
  MStr := TMemoryStream.Create;
  try
  //заменим TIBQuery на memtable при необходимости
    for J := 0 to FTempMasterDetail.Count - 1 do
    begin
      I := GetIndexQueryByName(FTempMasterDetail.DetailTable[J]);
      if I > -1 then
      begin
        //1. Создаем MemTable и заполняем его
        IsResult := TgsDataSet(FQueryList.Items[I]).Get_IsResult;
        IndexFields := TgsDataSet(FQueryList.Items[I]).Get_IndexFields;
        MemTable := TgsDataSet.Create(True);
        try
          DS := MemTable.GetClientDataSet;

          CompliteDataSetStream(MStr, TgsDataSet(FQueryList.Items[I]).DataSet, TgsDataSet(FQueryList.Items[I]).Get_FetchBlob);
          MStr.Position := 0;
          DS.LoadFromStream(MStr);
          MStr.Clear;
          DS.Name := TgsDataSet(FQueryList.Items[I]).DataSet.Name;
        except
          on E: Exception do
          begin
            MemTable.Free;
            raise Exception.Create('Произошла ошибка при создании нового объекта.'#13#10 +
              E.Message);
          end;
        end;
        //2. Уничтожаем исходный TIBQuery
        DeleteByName(TgsDataSet(FQueryList.Items[I]).DataSet.Name);
        //3. Добавляем MemTable в список
        Index := FQueryList.Add(nil);
        FQueryList.Items[Index] := MemTable;
        TgsDataSet(FQueryList.Items[Index]).DataSet.Name := DS.Name;
        TgsDataSet(FQueryList.Items[Index]).Set_IsResult(IsResult);
        if IndexFields <> '' then
          TgsDataSet(FQueryList.Items[Index]).Set_IndexFields(IndexFields);
      end;
    end;
  finally
    MStr.Free;
  end;

  //4. Создаем связь M-D
  for I := 0 to FMasterDetail.Count - 1 do
    AddMasterDetail(FMasterDetail.MasterTable[I], FMasterDetail.MasterField[I],
     FMasterDetail.DetailTable[I], FMasterDetail.DetailField[I]);
end;

procedure CompliteDataSetStream(const AnStream: TStream;
  const AnDataSet: TDataSet; const AnFetchBlob: Boolean = False);
const
  LEmptyByte = 1;
  LEmptyFormat = SizeOf(Byte) * 8 div 2;
  SizePosition = 14;
  FreeBufferDelta = $A00000;
var
  TempClientDS: TClientDataSet;
  I, L, OldPosition: Integer;
  BArray: array of Byte;
  LBArray: Word;
  Buffer: Pointer;
  BufferSize: Integer;
  FiedNameSize: Byte;
  FRecordCount: Integer;

  // Процедура одной записи в поток данных
  procedure WriteRecord;
  var
    J, K : Integer;
    TempStr: TStream;
    TempField: TField;
  begin
    Inc(FRecordCount);
    // Заполняем структуру NULL-полей
    FillChar(BArray[0], LBArray, 0);
    for K := 0 to AnDataSet.FieldCount - 1 do
    begin
      TempField := AnDataSet.Fields[K];
      if (TempField.IsNull) or (not AnFetchBlob and
       (TempField.DataType in [ftBlob, ftMemo, ftGraphic, ftFmtMemo])) then
      begin
        J := (K div LEmptyFormat + 1);
        BArray[J] := BArray[J] or (1 shl (K mod 4 * 2));
      end;
    end;

    // Сохраняем структуру
    AnStream.Write(BArray[0], LBArray);

    // Сохраняем данные из поля
    for K := 0 to AnDataSet.FieldCount - 1 do
    begin
      TempField := AnDataSet.Fields[K];
      if not TempField.IsNull then
        case TempField.DataType of
          ftBlob, ftMemo, ftGraphic, ftFmtMemo:
          begin
            if AnFetchBlob then
            begin
              TempStr := AnDataSet.CreateBlobStream(TempField, bmRead);
              try
                J := TempStr.Size;
                AnStream.Write(J, TempField.Tag);
                if J > 0 then
                  AnStream.CopyFrom(TempStr, J);
              finally
                TempStr.Free;
              end;
            end;
          end;
          ftBCD:
          begin
            TempClientDS.Fields[K].Assign(TempField);
            if TempField.Tag > BufferSize then
            begin
              BufferSize := TempField.Tag;
              ReallocMem(Buffer, BufferSize);
            end;
            TempClientDS.Fields[K].GetData(Buffer);
            AnStream.Write(Buffer^, TempField.Tag);
          end;
          ftWideString, ftString:
          begin
            J := Length(TempField.AsString);
            if J > BufferSize then
            begin
              BufferSize := J;
              ReallocMem(Buffer, BufferSize);
            end;
            TempField.GetData(Buffer);
            AnStream.Write(J, TempField.Tag);
            AnStream.Write(Buffer^, J);
          end
        else
          if TempField.Tag > BufferSize then
          begin
            BufferSize := TempField.Tag;
            ReallocMem(Buffer, BufferSize);
          end;
          TempField.GetData(Buffer);
          AnStream.Write(Buffer^, TempField.Tag);
        end;
    end;
  end;
begin
  AnStream.Position := 0;
  AnStream.Size := 0;
  if not AnDataSet.Active then
    Exit;

  AnDataSet.DisableControls;
  try
    // Вытягиваем все записи
    AnDataSet.Last;
    // Нужен КлиентДатаСет для создания заголовка
    TempClientDS := TClientDataSet.Create(nil);
    try
      LBArray := LEmptyByte + (AnDataSet.FieldCount - 1) div LEmptyFormat + 1;
      SetLength(BArray, LBArray);

      // Заполняем поля
      for I := 0 to AnDataSet.FieldCount - 1 do
        TempClientDS.FieldDefs.Add(AnDataSet.Fields[I].FieldName, AnDataSet.Fields[I].DataType,
         AnDataSet.Fields[I].Size, AnDataSet.Fields[I].Required);
        //TempClientDS.Fields.Add(AnDataSet.Fields[I]);

      // Создаем КлиентДатаСет и сохраняем заголовок
      TempClientDS.CreateDataSet;
      TempClientDS.SaveToStream(AnStream);

      // Выделяем память для перекачки данных из обычных полей
      BufferSize := 10000;
      if AnStream.Size > BufferSize then
        BufferSize := AnStream.Size;

      GetMem(Buffer, BufferSize);
      FillChar(Buffer^, BufferSize, 0);
      try
        // Вытягиваем размеры полей из потока. Не соответствуют данным из КлиентДатаСет.
        AnStream.Position := 0;
        AnStream.ReadBuffer(Buffer^, AnStream.Size);
        for I := 0 to AnDataSet.FieldCount - 1 do
        begin
          FiedNameSize := Length(AnDataSet.Fields[I].FieldName);
          L := Pos(Char(FiedNameSize) + AnDataSet.Fields[I].FieldName, PString(@Buffer)^);
          AnDataSet.Fields[I].Tag := SmallInt(TDnByteArray(Buffer)[L + FiedNameSize + SizeOf(FiedNameSize) - 1]);
        end;

        // Для перегонки decimal полей
        TempClientDS.Append;
        AnDataSet.First;
        FRecordCount := 0;
        // Сохраняем по одной записи
        while not AnDataSet.Eof do
        begin
          // Выделяем сразу много памяти, иначе много времени тратится.
          if AnStream.Size = AnStream.Position then
          begin
            OldPosition := AnStream.Position;
            AnStream.Size := AnStream.Size + FreeBufferDelta;
            AnStream.Position := OldPosition;
          end;
          WriteRecord;

          AnDataSet.Next;
        end;
        TempClientDS.Cancel;
        // Устанавливаем реальный размер потока
        AnStream.Size := AnStream.Position;
        // Сохраняем количество записей
        AnStream.Position := SizePosition;
        AnStream.Write(FRecordCount, SizeOf(FRecordCount));
      finally
        FreeMem(Buffer);
      end;
    finally
      TempClientDS.Close;
      TempClientDS.FieldDefs.Clear;
      TempClientDS.Free;
    end;
  finally
    AnDataSet.EnableControls;
  end;
end;

function TgsDataSet.Get_FetchBlob: Boolean;
begin
  Result := FFetchBlob;
end;

procedure TgsDataSet.Set_FetchBlob(Value: Boolean);
begin
  FFetchBlob := Value;
end;

function TgsDataSet.GetStrFromFieldType(const AnFieldType: TFieldType): String;
begin
  Result := GetEnumName(TypeInfo(TFieldType), Integer(AnFieldType));
end;

function TgsDataSet.Get_IndexFields: String;
begin
  Result := FIndexFields;
end;

procedure TgsDataSet.Set_IndexFields(const Value: String);
begin
  if (Trim(Value) > '') and not CheckFieldNames(FDataSet, Value) then
    raise Exception.Create('Some index fields is absence');
  FIndexFields := Value;
  if FDataSet is TClientDataSet then
    GetClientDataSet.IndexFieldNames := FIndexFields;
end;

function TgsDataSet.Get_RecordCount: Integer;
begin
  Result := FDataSet.RecordCount;
end;

procedure TgsDataSet.Insert;
begin
  FDataSet.Insert;
end;

function TgsDataSet.Get_Active: Boolean;
begin
  Result := FDataSet.Active;
end;

function TgsDataSet.Get_Tag: Integer;
begin
  Result := FDataSet.Tag;
end;

function TgsDataSet.Get_Transaction: TIBTransaction;
begin
  Result := nil;
  try
    if FDataSet is TIBQuery then
      Result := TIBQuery(FDataSet).Transaction;
  except
    on E: Exception do
      raise Exception.Create(FDataSet.Name + ': ' + E.Message);
  end;
end;

procedure TgsDataSet.Set_Tag(const Value: Integer);
begin
  FDataSet.Tag := Value;
end;

procedure TgsDataSet.Set_Transaction(const Value: TIBTransaction);
begin
  try
    if FDataSet is TIBQuery then
      TIBQuery(FDataSet).Transaction := Value;
  except
    on E: Exception do
      raise Exception.Create(FDataSet.Name + ': ' + E.Message);
  end;
end;

{procedure TgsDataSet.AssignFields(const ADataSet: TDataSet);
var
  I: Integer;
begin
  if FDataSet is TClientDataSet then
    for I := 0 to ADataSet.FieldCount - 1 do
      AddField(ADataSet.Fields[I].FieldName, ADataSet.Fields[I].DataType,
        ADataSet.Fields[I].DataSize, ADataSet.Fields[I].Required)
  else
    raise Exception.Create('Method not supported for real dataset.');
end;}

procedure TgsDataSet.CopyRecord(const ADataSet: TDataSet);
var
  I: Integer;
begin
  if FDataSet is TClientDataSet then
    for I := 0 to ADataSet.FieldCount - 1 do
      FDataSet.FieldByName(ADataSet.Fields[I].FieldName).Value := ADataSet.Fields[I].Value
  else
    raise Exception.Create('Method not supported for real dataset.');
end;

function TgsDataSet.CreateBlobStream(const Field: TField;
  Mode: TBlobStreamMode): TStream;
begin
  Result := FDataSet.CreateBlobStream(Field, Mode);
end;

function TgsDataSet.Locate(const KeyFields: string; const KeyValues: Variant;
  Options: TLocateOptions): Boolean;
begin
  Result := FDataSet.Locate(KeyFields, KeyValues, Options);
end;

function TgsDataSet.Get_Self: Integer;
begin
  Result := Integer(DataSet);
end;

{TReportResult}

constructor TReportResult.Create;
begin
  inherited Create;

  Sorted := True;
  FIsStreamData := False;
  FMasterDetail := TFourStringList.Create;
  FTempStream := TMemoryStream.Create;
end;

destructor TReportResult.Destroy;
begin
  Clear;
  FreeAndNil(FMasterDetail);
  FreeAndNil(FTempStream);
  if Assigned(FBaseQueryList) then
    FBaseQueryList.Clear;

  inherited Destroy;
end;

function TReportResult.AddDataSet(const AnName: String): Integer;
begin
  Result := AddObject(AnsiUpperCase(AnName), TClientDataSet.Create(nil));
  DataSet[Result].Name := Strings[Result];
end;

function TReportResult.DataSetByName(const AnName: String): TDataSet;
var
  I: Integer;
begin
  Result := nil;
  if Find(AnName, I) then
    Result := DataSet[I];
end;

procedure TReportResult.ViewResult;
var
  I: Integer;
begin
  with TdlgViewResult.Create(nil) do
  try
    for I := 0 to Count - 1 do
      AddPage(DataSet[I]);
    if PageCount > 0 then
    begin
      pcDataSet.ActivePageIndex := pcDataSet.PageCount - 1;
      ShowModal;
    end;
  finally
    Free;
  end;
end;

procedure TReportResult.Clear;
var
  I: Integer;
begin
  for I := Count - 1 downto 0 do
    DeleteDataSet(I);
  inherited;
end;

procedure TReportResult.Assign(const AnReportResult: TReportResult);
var
  MemStr: TMemoryStream;
begin
  MemStr := TMemoryStream.Create;
  try
    AnReportResult.SaveToStream(MemStr);
    MemStr.Position := 0;
    LoadFromStream(MemStr);
  finally
    MemStr.Free;
  end;
end;

procedure TReportResult.DeleteDataSet(const AnIndex: Integer);
begin
  Assert((AnIndex >= 0) and (AnIndex < Count));
//  Object free in BaseQuery
  if not Assigned(QueryList) then
  begin
    if TClientDataSet(Objects[AnIndex]).MasterSource <> nil then
    begin
      TClientDataSet(Objects[AnIndex]).MasterFields := '';
      TClientDataSet(Objects[AnIndex]).MasterSource.Free;
      TClientDataSet(Objects[AnIndex]).MasterSource := nil;
    end;
    TClientDataSet(Objects[AnIndex]).Free;
  end;
  Delete(AnIndex);
end;

function TReportResult.GetDataSet(const AnIndex: Integer): TDataSet;
begin
  Assert((AnIndex >= 0) and (AnIndex < Count));
  Result := TDataSet(Objects[AnIndex]);
end;

procedure TReportResult.LoadFromStream(AnStream: TStream);
var
  I, J, LocCount, LocSize: Integer;
  SName: String;
  TempStream: TMemoryStream;
  LocMasterDetail: TFourStringList;
  PrefixData: array[0..2] of Char;
  IndexSL: TStringList;
  TempDataSet: TClientDataSet;
begin
  Clear;
  AnStream.Position := 0;
  if AnStream.Position >= AnStream.Size then
    Exit;
  AnStream.ReadBuffer(LocCount, SizeOf(LocCount));
  TempStream := TMemoryStream.Create;
  try
    for I := 0 to LocCount - 1 do
    begin
      AnStream.ReadBuffer(LocSize, SizeOf(LocSize));
      SetLength(SName, LocSize);
      AnStream.ReadBuffer(SName[1], LocSize);
      J := AddDataSet(SName);
      AnStream.ReadBuffer(LocSize, SizeOf(LocSize));
      TempStream.Clear;
      TempStream.Size := LocSize;
      AnStream.ReadBuffer(TempStream.Memory^, LocSize);
      if TempStream.Size <> 0 then
        TClientDataSet(DataSet[J]).LoadFromStream(TempStream);
    end;
  finally
    TempStream.Free;
  end;

  FMasterDetail.Clear;
  if AnStream.Position < AnStream.Size then
  begin
    AnStream.ReadBuffer(PrefixData, SizeOf(MDPrefix));
    if PrefixData = MDPrefix then
    begin
      LocMasterDetail := TFourStringList.Create;
      try
        LocMasterDetail.LoadFromStream(AnStream);
        for I := 0 to LocMasterDetail.Count - 1 do
          AddMasterDetail(LocMasterDetail.MasterTable[I], LocMasterDetail.MasterField[I],
           LocMasterDetail.DetailTable[I], LocMasterDetail.DetailField[I]);
      finally
        LocMasterDetail.Free;
      end;
      if AnStream.Position < AnStream.Size then
        AnStream.ReadBuffer(PrefixData, SizeOf(IndexPrefix));
    end;

    if PrefixData = IndexPrefix then
    begin
      IndexSL := TStringList.Create;
      try
        IndexSL.LoadFromStream(AnStream);
        for I := 0 to IndexSL.Count - 1 do
        begin
          TempDataSet := (DataSetByName(IndexSL.Names[I]) as TClientDataSet);
          if TempDataSet <> nil then
            TempDataSet.IndexFieldNames := IndexSL.Values[IndexSL.Names[I]];
        end;
      finally
        IndexSL.Free;
      end;
    end;
  end;
end;

procedure TReportResult.SaveToStream(AnStream: TStream);
var
  LocSize, I: Integer;
  SName: String;
  TempStream: TMemoryStream;
  IndexSL: TStringList;
begin
  LocSize := Count;
  AnStream.Write(LocSize, SizeOf(LocSize));
  IndexSL := TStringList.Create;
  try
    TempStream := TMemoryStream.Create;
    try
      for I := 0 to Count - 1 do
      begin
        SName := Strings[I];
        LocSize := Length(SName);
        if TClientDataSet(DataSet[I]).IndexFieldNames > '' then
          IndexSL.Add(SName + '=' + TClientDataSet(DataSet[I]).IndexFieldNames);
        AnStream.Write(LocSize, SizeOf(LocSize));
        AnStream.Write(SName[1], LocSize);
        TempStream.Clear;
        TClientDataSet(DataSet[I]).SaveToStream(TempStream);
        LocSize := TempStream.Size;
        TempStream.Position := 0;
        AnStream.Write(LocSize, SizeOf(LocSize));
        if TempStream.Size <> 0 then
          AnStream.Write(TempStream.Memory^, LocSize);
      end;
    finally
      TempStream.Free;
    end;

    if FMasterDetail.Count > 0 then
    begin
      AnStream.Write(MDPrefix, SizeOf(MDPrefix));
      FMasterDetail.SaveToStream(AnStream);
    end;
    if IndexSL.Count > 0 then
    begin
      AnStream.Write(IndexPrefix, SizeOf(IndexPrefix));
      IndexSL.SaveToStream(AnStream);
    end;
  finally
    IndexSL.Free;
  end;
end;

procedure TReportResult.AddMasterDetail(const AnMasterTable, AnMasterField,
  AnDetailTable, AnDetailField: String);
var
  TempDs: TClientDataSet;
begin
  Assert(CheckFieldNames(DataSetByName(AnMasterTable), AnMasterField)
    and CheckFieldNames(DataSetByName(AnDetailTable), AnDetailField),
    'Some field of master - detail relation is absent.');

  TempDs := (DataSetByName(AnDetailTable) as TClientDataSet);
  if TempDs.MasterSource = nil then
    TempDs.MasterSource := TDataSource.Create(nil);
  TempDs.MasterSource.DataSet := DataSetByName(AnMasterTable);
  TempDs.IndexFieldNames := AnDetailField;
  TempDs.MasterFields := AnMasterField;

  FMasterDetail.AddRecord(AnMasterTable, AnMasterField,
    AnDetailTable, AnDetailField);
end;

procedure TReportResult.AssignTempStream(const AnStream: TStream);
begin
  FTempStream.Clear;
  AnStream.Position := 0;
  FTempStream.CopyFrom(AnStream, AnStream.Size);
end;

procedure TReportResult.AddDataSetList(const AnBaseQueryList: Variant);
var
  LocDispatch: IDispatch;
  LocReportResult: TgsQueryList;
  J: Integer;
  DS: TDataSet;
begin
  LocDispatch := AnBaseQueryList;
  LocReportResult := LocDispatch as TgsQueryList;
  QueryList := LocReportResult;
  for J := LocReportResult.Count - 1 downto 0 do
  begin
    DS := TDataSet(LocReportResult.Query[J]);
    AddDataSet(DS.Name, DS);
  end;
end;

function TReportResult.AddDataSet(const AnName: String;
  const AnDataSet: TDataSet): Integer;
begin
  Result := AddObject(AnsiUpperCase(AnName), AnDataSet);
  DataSet[Result].Name := Strings[Result];
end;

end.
