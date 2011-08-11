unit rfMetadata_unit;

interface

uses
  Classes, SysUtils, Windows, IBSQL, IBDatabase, IB, IBScript;

type
  TDataBaseCreator = class(TObject)
  private
    FDataSQL: String;
    FMetaDataSQL: String;
    FDataBaseName: String;
    FShowMessages: Boolean;
  public
    constructor Create;

    function CreateDataBase: Boolean;
    property DataSQL: String read FDataSQL write FDataSQL;
    property MetaDataSQL: String read FMetaDataSQL write FMetaDataSQL;
    property DataBaseName: String read FDataBaseName write FDataBaseName;
    //выводить сообщения или нет
    property ShowMessages: Boolean read FShowMessages write FShowMessages;
  end;

implementation

uses
  TouchMessageBoxForm_Unit, Dialogs, rfUtils_unit;

{ TDataBaseCreator }

constructor TDataBaseCreator.Create;
begin
  inherited;
  FDataSQL := '';
  FMetaDataSQL := '';
  FDataBaseName := '';
  FShowMessages := False;
end;

function TDataBaseCreator.CreateDataBase: Boolean;
var
  FDataBase: TIBDatabase;
  FScript: TIBScript;
  FSQL: TIBSQL;
  FTransaction: TIBTransaction;
begin
  Result := False;

  if FDataBaseName = '' then
  begin
    if FShowMessages then
      Touch_MessageBox('Внимание', 'Не указан путь к базе данных', MB_OK, mtWarning); ;
    exit;
  end;

  FDataBase := TIBDatabase.Create(nil);
  try
    try
      //Create DB
      FDataBase.LoginPrompt := False;
      FDataBase.DatabaseName := FDataBaseName;
      FDataBase.Params.Add('user ''SYSDBA'' password ''masterkey'' ');
      FDataBase.Params.Add('page_size 8192');
      FDataBase.Params.Add('default character set win1251');
      FDatabase.SQLDialect := 3;
      FDataBase.CreateDatabase;
      FDataBase.Connected := False;

      //Connect to DB
      FDataBase.DatabaseName := FDataBaseName;
      FDatabase.Params.Add('user_name=SYSDBA');
      FDatabase.Params.Add('password=masterkey');
      FDatabase.Params.Add('lc_ctype=WIN1251');
      FDatabase.SQLDialect := 3;
      FDataBase.Open;
      //Create structure
      FScript := TIBScript.Create(nil);
      FTransaction := TIBTransaction.Create(nil);
      FSQL := TIBSQL.Create(nil);
      try
        FSQL.Transaction := FTransaction;
        FScript.Database := FDataBase;
        FScript.Transaction := FTransaction;
        FTransaction.DefaultDatabase := FDataBase;
        FTransaction.StartTransaction;

        if FMetaDataSQL <> '' then
        begin
          FScript.Script.Text := FMetaDataSQL;
          FScript.ExecuteScript;
          if FTransaction.InTransaction then
            FTransaction.Commit;
        end;

        if FDataSQL <> '' then
        begin
          if not FTransaction.InTransaction then
            FTransaction.StartTransaction;
          FSQL.ParamCheck := False;
          FSQL.SQL.Text := DataSQL;
          FSQL.ExecQuery;
          FSQL.Close;
        end;

        if FTransaction.InTransaction then
          FTransaction.Commit;
        Result := True;
      finally
        FSQL.Free;
        FScript.Free;
        FTransaction.Free;
      end;
    except
      on E: Exception do
      begin
        Result := False;
        if FShowMessages then
          Touch_MessageBox('Внимание', 'Ошибка при подключении ' + Trim(E.Message), MB_OK, mtError)
        else
          WriteToEventLog(E.Message);
      end;
    end;
  finally
    FDataBase.Free;
  end;

end;

end.
