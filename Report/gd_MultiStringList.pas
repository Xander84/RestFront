unit gd_MultiStringList;

interface

uses
  Classes, DB;

const
  mslStartMultiStr = 'SMS^';
  mslEndMultiStr = 'EMS^';

type
  TMultiString = class(TStringList)
  private
    procedure SetParam(const Index: Integer; const Value: String);
    function GetParam(const Index: Integer): String;
  public
    constructor Create(const AnFieldCount: Integer);

    property Params[const Index: Integer]: String read GetParam write SetParam;
  end;

type
  TMultiStringList = class(TList)
  private
    FFieldCount: Integer;

    function GetMultiString(Index: Integer): TMultiString;
  public
    constructor Create(const AnFieldCount: Integer);
    destructor Destroy; override;

    function AddLine: Integer; overload;
    function AddLine(const AnParamCount: Integer): Integer; overload;
    procedure DeleteLine(Index: Integer);
    procedure Clear; override;

    procedure SaveToStream(AnStream: TStream);
    procedure LoadFromStream(AnStream: TStream);

    property MultiString[Index: Integer]: TMultiString read GetMultiString;
    property FieldCount: Integer read FFieldCount;
  end;

type
  TFourStringList = class(TMultiStringList)
  private
    function GetMasterTable(const Index: Integer): String;
    procedure SetMasterTable(const Index: Integer; const Value: String);
    function GetMasterField(const Index: Integer): String;
    procedure SetMasterField(const Index: Integer; const Value: String);
    function GetDetailTable(const Index: Integer): String;
    procedure SetDetailTable(const Index: Integer; const Value: String);
    function GetDetailField(const Index: Integer): String;
    procedure SetDetailField(const Index: Integer; const Value: String);
  public
    constructor Create;

    function AddRecord(const AnMasterTable, AnMasterField, AnDetailTable,
     AnDetailField: String): Integer;

    function IndexOfMasterTable(const AnMasterTable: String): Integer;
    function IndexOfMasterField(const AnMasterField: String): Integer;
    function IndexOfDetailTable(const AnDetailTable: String): Integer;
    function IndexOfDetailField(const AnDetailField: String): Integer;

    property MasterTable[const Index: Integer]: String read GetMasterTable
     write SetMasterTable;
    property MasterField[const Index: Integer]: String read GetMasterField
     write SetMasterField;
    property DetailTable[const Index: Integer]: String read GetDetailTable
     write SetDetailTable;
    property DetailField[const Index: Integer]: String read GetDetailField
     write SetDetailField;
  end;

function CheckFieldNames(const AnDataSet: TDataSet; AnFieldNames: String): Boolean;

implementation

uses
  SysUtils;

{ TMultiString }

constructor TMultiString.Create(const AnFieldCount: Integer);
var
  I: Integer;
begin
  inherited Create;

  for I := 0 to AnFieldCount - 1 do
    Add('');
end;

function TMultiString.GetParam(const Index: Integer): String;
begin
  Result := Strings[Index];
end;

procedure TMultiString.SetParam(const Index: Integer; const Value: String);
begin
  Strings[Index] := Value;
end;

{ TMultiStringList }

constructor TMultiStringList.Create(const AnFieldCount: Integer);
begin
  Assert(AnFieldCount > 0, 'Count of field must be great than zero.');

  inherited Create;

  FFieldCount := AnFieldCount;
end;

destructor TMultiStringList.Destroy;
begin
  Clear;

  inherited Destroy;
end;

function TMultiStringList.AddLine: Integer;
begin
  Result := AddLine(FFieldCount);
end;

function TMultiStringList.AddLine(const AnParamCount: Integer): Integer;
begin
  Assert(AnParamCount > 0, 'Count of field must be great than zero.');
  Result := Add(TMultiString.Create(AnParamCount));
end;

procedure TMultiStringList.Clear;
begin
  while Count > 0 do
    DeleteLine(0);
  inherited;
end;

procedure TMultiStringList.DeleteLine(Index: Integer);
begin
  Assert((Index >= 0) and (Index < Count));
  TMultiString(Items[Index]).Free;
  Delete(Index);
end;

function TMultiStringList.GetMultiString(Index: Integer): TMultiString;
begin
  Assert((Index >= 0) and (Index < Count));
  Result := TMultiString(Items[Index]);
end;

procedure TMultiStringList.LoadFromStream(AnStream: TStream);
const
  ErrorMsg = 'Stream format error.';
  MaxStringLength = $FFFF;
var
  I, J, K, L, StrSize: Integer;
  Bf: array[0..MaxStringLength] of Char;
begin
  Clear;
  AnStream.ReadBuffer(Bf[0], SizeOf(mslStartMultiStr));
  Bf[SizeOf(mslStartMultiStr)] := #0;
  Assert(PChar(@Bf) = mslStartMultiStr, ErrorMsg);
  AnStream.ReadBuffer(K, SizeOf(K));
  for I := 0 to K - 1 do
  begin
    AnStream.ReadBuffer(L, SizeOf(L));
    AddLine(L);
    for J := 0 to L - 1 do
    begin
      AnStream.ReadBuffer(StrSize, SizeOf(StrSize));
      AnStream.ReadBuffer(Bf[0], StrSize);
      Bf[StrSize] := #0;
      MultiString[I].Params[J] := PChar(@Bf);
    end;
  end;
  AnStream.ReadBuffer(Bf[0], SizeOf(mslEndMultiStr));
  Bf[SizeOf(mslEndMultiStr)] := #0;
  Assert(PChar(@Bf) = mslEndMultiStr, ErrorMsg);
end;

procedure TMultiStringList.SaveToStream(AnStream: TStream);
var
  I, J, K: Integer;
begin
  AnStream.Write(mslStartMultiStr, SizeOf(mslStartMultiStr));
  K := Count;
  AnStream.Write(K, SizeOf(K));
  for I := 0 to Count - 1 do
  begin
    AnStream.Write(FFieldCount, SizeOf(FFieldCount));
    for J := 0 to FFieldCount - 1 do
    begin
      K := Length(MultiString[I].Params[J]);
      AnStream.Write(K, SizeOf(K));
      AnStream.Write(MultiString[I].Params[J][1], K);
    end;
  end;
  AnStream.Write(mslEndMultiStr, SizeOf(mslEndMultiStr));
end;

{ TFourStringList }

function TFourStringList.AddRecord(const AnMasterTable, AnMasterField,
  AnDetailTable, AnDetailField: String): Integer;
begin
  Result := AddLine;
  SetMasterTable(Result, AnMasterTable);
  SetMasterField(Result, AnMasterField);
  SetDetailTable(Result, AnDetailTable);
  SetDetailField(Result, AnDetailField);
end;

constructor TFourStringList.Create;
begin
  inherited Create(4);
end;

function TFourStringList.GetMasterField(const Index: Integer): String;
begin
  Result := GetMultiString(Index).Params[1];
end;

function TFourStringList.GetMasterTable(const Index: Integer): String;
begin
  Result := GetMultiString(Index).Params[0];
end;

function TFourStringList.GetDetailField(const Index: Integer): String;
begin
  Result := GetMultiString(Index).Params[3];
end;

function TFourStringList.GetDetailTable(const Index: Integer): String;
begin
  Result := GetMultiString(Index).Params[2];
end;

procedure TFourStringList.SetMasterField(const Index: Integer; const Value: String);
begin
  GetMultiString(Index).Params[1] := Value;
end;

procedure TFourStringList.SetMasterTable(const Index: Integer; const Value: String);
begin
  GetMultiString(Index).Params[0] := Value;
end;

procedure TFourStringList.SetDetailField(const Index: Integer; const Value: String);
begin
  GetMultiString(Index).Params[3] := Value;
end;

procedure TFourStringList.SetDetailTable(const Index: Integer; const Value: String);
begin
  GetMultiString(Index).Params[2] := Value;
end;

function CheckFieldNames(const AnDataSet: TDataSet; AnFieldNames: String): Boolean;
var
  I, J: Integer;
begin
  Result := False;
  if AnDataSet <> nil then
  begin
    J := 0;
    I := Pos(';', AnFieldNames);
    while I > 0 do
    begin
      if AnDataSet.FieldByName(Copy(AnFieldNames, J + 1, I - J - 1)) = nil then
        exit;
      J := I;
      AnFieldNames[J] := '_';
      I := Pos(';', AnFieldNames);
    end;
    I := Length(AnFieldNames);
    Result := AnDataSet.FieldByName(Copy(AnFieldNames, J + 1, I - J)) <> nil;
  end;
end;

function TFourStringList.IndexOfDetailField(const AnDetailField: String): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to Count - 1 do
    if AnsiUpperCase(GetMultiString(I).Strings[3]) = AnsiUpperCase(AnDetailField) then
    begin
      Result := I;
      Break;
    end;
end;

function TFourStringList.IndexOfDetailTable(const AnDetailTable: String): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to Count - 1 do
    if AnsiUpperCase(GetMultiString(I).Strings[2]) = AnsiUpperCase(AnDetailTable) then
    begin
      Result := I;
      Break;
    end;
end;

function TFourStringList.IndexOfMasterField(const AnMasterField: String): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to Count - 1 do
    if AnsiUpperCase(GetMultiString(I).Strings[1]) = (AnMasterField) then
    begin
      Result := I;
      Break;
    end;
end;

function TFourStringList.IndexOfMasterTable(const AnMasterTable: String): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to Count - 1 do
    if AnsiUpperCase(GetMultiString(I).Strings[0]) = AnsiUpperCase(AnMasterTable) then
    begin
      Result := I;
      Break;
    end;
end;

end.
