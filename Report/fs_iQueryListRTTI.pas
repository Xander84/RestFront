unit fs_iQueryListRTTI;

interface

uses
  SysUtils, Classes, fs_iinterpreter, fs_itools, fs_idbrtti,
  DB, obj_QueryList, FrontData_Unit;

type
  TfsQueryListRTTI = class(TComponent); // fake component

implementation

type
  BaseQueryList = class(TgsQueryList);

type
  TFunctions = class(TfsRTTIModule)
  private
    function CallMethod(Instance: TObject; ClassType: TClass;
      const MethodName: String; Caller: TfsMethodHelper): Variant;
    function GetProp(Instance: TObject; ClassType: TClass;
      const PropName: String): Variant;
    procedure SetProp(Instance: TObject; ClassType: TClass;
      const PropName: String; Value: Variant);
    function GetActiveQueryList(Instance: TObject; ClassType: TClass;
      const MethodName: String; Caller: TfsMethodHelper): Variant;

  public
    constructor Create(AScript: TfsScript); override;
  end;

{ TFunctions }

constructor TFunctions.Create(AScript: TfsScript);
begin
  inherited Create(AScript);
  with AScript do
  begin
    AddMethod('function GetBaseQueryList: BaseQueryList', GetActiveQueryList);
    with AddClass(TgsDataSet, 'TObject') do
    begin
      AddMethod('procedure Open', CallMethod);
      AddMethod('procedure Close', CallMethod);
      AddMethod('procedure First', CallMethod);
      AddMethod('procedure Last', CallMethod);
      AddMethod('procedure Next', CallMethod);
      AddMethod('procedure Prior', CallMethod);
      AddMethod('procedure Cancel', CallMethod);
      AddMethod('procedure Delete', CallMethod);
      AddMethod('procedure Post', CallMethod);
      AddMethod('procedure Append', CallMethod);
      AddMethod('procedure Insert', CallMethod);
      AddMethod('procedure Edit', CallMethod);

      AddMethod('function Eof: Boolean', CallMethod);
      AddMethod('function Bof: Boolean', CallMethod);

      AddMethod('function Locate(const KeyFields: String; const KeyValues: Variant;' +
        'Options: TLocateOptions): Boolean', CallMethod);
      AddMethod('procedure AddField(const FieldName: String; const FieldType: String;' +
        'FieldSize: Integer; Required: Boolean)', CallMethod);

      AddMethod('function FieldByName(const FieldName: String): TField', CallMethod);
      AddMethod('function Fields(const Value: Integer): TField', CallMethod);
      AddMethod('function ParamByName(const Value: String): TParam', CallMethod);
      AddMethod('function Params(const Value: Integer): TParam', CallMethod);

      AddProperty('FetchBlob', 'Boolean', GetProp, SetProp);
      AddProperty('IsResult', 'Boolean', GetProp, SetProp);
      AddProperty('SQL', 'String', GetProp, SetProp);
      AddProperty('IndexFields', 'String', GetProp, SetProp);
      AddProperty('FieldCount', 'Integer', GetProp, nil);
      AddProperty('ParamCount', 'Integer', GetProp, nil);
      AddProperty('Active', 'Boolean', GetProp, nil);
      AddProperty('RecordCount', 'Integer', GetProp, nil);
      AddProperty('Self', 'Integer', GetProp, nil);
      AddProperty('Tag', 'Integer', GetProp, SetProp);
    end;

    with AddClass(BaseQueryList, 'TObject') do
    begin
      AddProperty('Count', 'Integer', GetProp, nil);
      AddProperty('Self', 'Integer', GetProp, nil);
      AddMethod('procedure Clear', CallMethod);
      AddMethod('function Add(const QueryName: String; MemQuery: Boolean): Integer', CallMethod);
      AddDefaultProperty('Query', 'Integer', 'TgsDataSet', CallMethod, True);
    end;
  end;
end;

function TFunctions.CallMethod(Instance: TObject; ClassType: TClass;
  const MethodName: String; Caller: TfsMethodHelper): Variant;
var
  _TgsQueryList: BaseQueryList;
  _TgsDataSet: TgsDataSet;

  function IntToLocateOptions(i: Integer): TLocateOptions;
  begin
    Result := [];
    if (i and 1) <> 0 then
      Result := Result + [loCaseInsensitive];
    if (i and 2) <> 0 then
      Result := Result + [loPartialKey];
  end;

begin
  Result := 0;

  if ClassType = BaseQueryList then
  begin
    _TgsQueryList := BaseQueryList(Instance);
    if MethodName = 'QUERY.GET' then
      Result := Integer(_TgsQueryList.Query[Integer(Caller.Params[0])])
    else if MethodName = 'CLEAR' then
      _TgsQueryList.Clear
    else if MethodName = 'ADD' then
      Result := _TgsQueryList.Add(Caller.Params[0], Caller.Params[1]);
  end else
  if ClassType = TgsDataSet then
  begin
    _TgsDataSet := TgsDataSet(Instance);
    if MethodName = 'OPEN' then
      _TgsDataSet.Open
    else if MethodName = 'CLOSE' then
      _TgsDataSet.Close
    else if MethodName = 'FIRST' then
      _TgsDataSet.First
    else if MethodName = 'LAST' then
      _TgsDataSet.Last
    else if MethodName = 'NEXT' then
      _TgsDataSet.Next
    else if MethodName = 'PRIOR' then
      _TgsDataSet.Prior
    else if MethodName = 'CANCEL' then
      _TgsDataSet.Cancel
    else if MethodName = 'DELETE' then
      _TgsDataSet.Delete
    else if MethodName = 'POST' then
      _TgsDataSet.Post
    else if MethodName = 'APPEND' then
      _TgsDataSet.Append
    else if MethodName = 'INSERT' then
      _TgsDataSet.Insert
    else if MethodName = 'EDIT' then
      _TgsDataSet.Edit
    else if MethodName = 'EOF' then
      Result := _TgsDataSet.Eof
    else if MethodName = 'BOF' then
      Result := _TgsDataSet.Bof
    else if MethodName = 'LOCATE' then
      Result := _TgsDataSet.Locate(Caller.Params[0], Caller.Params[1], IntToLocateOptions(Caller.Params[2]))
    else if MethodName = 'ADDFIELD' then
      _TgsDataSet.AddField(Caller.Params[0], Caller.Params[1], Caller.Params[2], Caller.Params[3])
    else if MethodName = 'FIELDBYNAME' then
      Result := Integer(_TgsDataSet.FieldByName(Caller.Params[0]))
    else if MethodName = 'PARAMBYNAME' then
      Result := Integer(_TgsDataSet.ParamByName(Caller.Params[0]))
    else if MethodName = 'PARAMS' then
      Result := Integer(_TgsDataSet.Params[Caller.Params[0]])
    else if MethodName = 'FIELDS' then
      Result := Integer(_TgsDataSet.Fields[Caller.Params[0]]);
  end;
end;

function TFunctions.GetActiveQueryList(Instance: TObject; ClassType: TClass;
  const MethodName: String; Caller: TfsMethodHelper): Variant;
begin
  Result := Integer(FrontData.BaseQueryList);
end;

function TFunctions.GetProp(Instance: TObject; ClassType: TClass;
  const PropName: String): Variant;
var
  _TgsQueryList: BaseQueryList;
  _TgsDataSet: TgsDataSet;
begin
  Result := 0;

  if ClassType = BaseQueryList then
  begin
    _TgsQueryList := BaseQueryList(Instance);
    if PropName = 'COUNT' then
      Result := _TgsQueryList.Count
    else if PropName = 'SELF' then
      Result := _TgsQueryList.Self;
  end else
  if ClassType = TgsDataSet then
  begin
    _TgsDataSet := TgsDataSet(Instance);
    if PropName = 'FIELDCOUNT' then
      Result := _TgsDataSet.FieldCount
    else if PropName = 'PARAMCOUNT' then
      Result := _TgsDataSet.ParamCount
    else if PropName = 'ACTIVE' then
      Result := _TgsDataSet.Active
    else if PropName = 'PARAMCOUNT' then
      Result := _TgsDataSet.ParamCount
    else if PropName = 'RECORDCOUNT' then
      Result := _TgsDataSet.RecordCount
    else if PropName = 'SELF' then
      Result := _TgsDataSet.Self
    else if PropName = 'TAG' then
      Result := _TgsDataSet.Tag
    else if PropName = 'INDEXFIELDS' then
      Result := _TgsDataSet.IndexFields
    else if PropName = 'SQL' then
      Result := _TgsDataSet.SQL
    else if PropName = 'ISRESULT' then
      Result := _TgsDataSet.IsResult
    else if PropName = 'FETCHBLOB' then
      Result := _TgsDataSet.FetchBlob;
  end;
end;

procedure TFunctions.SetProp(Instance: TObject; ClassType: TClass;
  const PropName: String; Value: Variant);
var
  _TgsDataSet: TgsDataSet;
begin
  if ClassType = TgsDataSet then
  begin
    _TgsDataSet := TgsDataSet(Instance);
    if PropName = 'TAG' then
      _TgsDataSet.Tag := Value
    else if PropName = 'INDEXFIELDS' then
      _TgsDataSet.IndexFields := Value
    else if PropName = 'SQL' then
      _TgsDataSet.SQL := Value
    else if PropName = 'ISRESULT' then
      _TgsDataSet.IsResult := Value
    else if PropName = 'FETCHBLOB' then
      _TgsDataSet.FetchBlob := Value;
  end;
end;

initialization
  fsRTTIModules.Add(TFunctions);

finalization
  if fsRTTIModules <> nil then
    fsRTTIModules.Remove(TFunctions);

end.
