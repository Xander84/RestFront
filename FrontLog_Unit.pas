unit FrontLog_Unit;

interface

uses
  Front_DataBase_Unit, Classes, SysUtils, Forms, Generics.Collections, IBSQL,
  IBDatabase;

const
  // simple event's UserKey, DateTime, Event
  ev_LogIn            = 1;
  ev_Exit             = 2;
  ev_invalidPass      = 3;
  ev_StartProgram     = 4;
  ev_TerminateProgram = 5;
  ev_CreateNewOrder   = 6;
  ev_EnterPays        = 7;
  ev_EnterAllOrder    = 8;
  // event's with order
  // UserKey, OrderKey, DateTime, Event
  ev_EnterOrder       = 9;
  ev_SaveOrder        = 10;
  ev_ExitOrder        = 11;
  ev_PrintPreCheck    = 12;
  ev_CancelPreCheck   = 13;
  ev_PayOrder         = 14;
  // event's with good
  ev_AddGood          = 15;
  ev_RemoveGood       = 16;

type
  TLogUserInfo = packed record
    UserID: Integer;
    UserName: String;
  end;

  TLogGoodInfo = packed record
    GoodID: Integer;
    GoodName: String;
    Quantity: Currency;
    Sum: Currency;
  end;

  TLogOrderInfo = packed record
    OrderID: Integer;
    OrderNumber: String;
  end;

  TLogManager = class(TObject)
  private
    FUserList: TDictionary<Integer, Integer>;
    FGoodList: TDictionary<Integer, Integer>;
    FOrderList: TDictionary<Integer, Integer>;
    FDataBase: TIBDataBase;
    FReadTransaction: TIBTransaction;
    FFrontBase: TFrontBase;
    FIDSQL: TIBSQL;

    FDataBaseName: String;
    FInit: Boolean;
    // проверка пользователя в базе лога, если нет, то добавляем
    procedure CheckUser(const UserInfo: TLogUserInfo);
    procedure CheckGood(const GoodInfo: TLogGoodInfo);
    procedure CheckOrder(const OrderInfo: TLogOrderInfo);

    function GetNextID: Integer;

    procedure SetDatabaseName(const Value: String);
    procedure SetFrontBase(const Value: TFrontBase);
  public
    constructor Create;
    destructor Destroy; override;

    procedure DoSimpleEvent(const Event: Integer);
    procedure DoSimpleLog(const UserInfo: TLogUserInfo; Event: Integer);
    procedure DoOrderLog(const UserInfo: TLogUserInfo;
      OrderInfo: TLogOrderInfo; Event: Integer);
    procedure WriteLog(const UserInfo: TLogUserInfo; OrderInfo: TLogOrderInfo;
      Event: Integer);

    property DatabaseName: String read FDataBaseName write SetDatabaseName;
    property FrontBase: TFrontBase read FFrontBase write SetFrontBase;
    property Init: Boolean read FInit write FInit;
  end;

implementation

{ TLogManager }

procedure TLogManager.CheckGood(const GoodInfo: TLogGoodInfo);
var
  FSQL: TIBSQL;
  FTransaction: TIBTransaction;
  FID: Integer;
begin
  if not FGoodList.ContainsKey(GoodInfo.GoodID) then
  begin
    FSQL := TIBSQL.Create(nil);
    FTransaction := TIBTransaction.Create(nil);
    try
      FTransaction.DefaultDatabase := FDataBase;
      FTransaction.StartTransaction;
      FSQL.Transaction := FTransaction;
      try
        // проверяем, если данный пользователь в базе лога
        FSQL.SQL.Text := ' SELECT ID FROM GD_GOOD WHERE GOODKEY = :ID ';
        FSQL.Params[0].AsInteger := GoodInfo.GoodID;
        FSQL.ExecQuery;
        if not FSQL.Eof then
          FGoodList.Add(GoodInfo.GoodID, FSQL.FieldByName('ID').AsInteger)
        else
        begin
          FSQL.Close;
          FID := GetNextID;
          FSQL.SQL.Text := 'INSERT INTO GD_GOOD(ID, GOODKEY, GOODNAME) ' +
            ' VALUES(:ID, :GOODKEY, :GOODNAME) ';
          FSQL.ParamByName('ID').AsInteger := FID;
          FSQL.ParamByName('GOODKEY').AsInteger := GoodInfo.GoodID;
          FSQL.ParamByName('GOODNAME').AsString := GoodInfo.GoodName;
          FSQL.ExecQuery;
          FTransaction.Commit;
          FGoodList.Add(GoodInfo.GoodID, FID);
        end;
        FSQL.Close;
      except
        raise ;
      end;
    finally
      FSQL.Free;
      FTransaction.Free;
    end;
  end;
end;

procedure TLogManager.CheckOrder(const OrderInfo: TLogOrderInfo);
var
  FSQL: TIBSQL;
  FTransaction: TIBTransaction;
  FID: Integer;
begin
  // не храним информацию более чем 100 заказов
  if FOrderList.Count > 100 then
    FOrderList.Clear;

  if not FOrderList.ContainsKey(OrderInfo.OrderID) then
  begin
    FSQL := TIBSQL.Create(nil);
    FTransaction := TIBTransaction.Create(nil);
    try
      FTransaction.DefaultDatabase := FDataBase;
      FTransaction.StartTransaction;
      FSQL.Transaction := FTransaction;
      try
        // проверяем, если данный пользователь в базе лога
        FSQL.SQL.Text := ' SELECT ID FROM GD_ORDER WHERE ORDERKEY = :ID ';
        FSQL.Params[0].AsInteger := OrderInfo.OrderID;
        FSQL.ExecQuery;
        if not FSQL.Eof then
          FOrderList.Add(OrderInfo.OrderID, FSQL.FieldByName('ID').AsInteger)
        else
        begin
          FSQL.Close;
          FID := GetNextID;
          FSQL.SQL.Text := 'INSERT INTO GD_ORDER(ID, ORDERKEY, NUMBER) ' +
            ' VALUES(:ID, :ORDERKEY, :NUMBER) ';
          FSQL.ParamByName('ID').AsInteger := FID;
          FSQL.ParamByName('ORDERKEY').AsInteger := OrderInfo.OrderID;
          FSQL.ParamByName('NUMBER').AsString := OrderInfo.OrderNumber;
          FSQL.ExecQuery;
          FTransaction.Commit;
          FOrderList.Add(OrderInfo.OrderID, FID);
        end;
        FSQL.Close;
      except
        raise ;
      end;
    finally
      FSQL.Free;
      FTransaction.Free;
    end;
  end;
end;

procedure TLogManager.CheckUser(const UserInfo: TLogUserInfo);
var
  FSQL: TIBSQL;
  FTransaction: TIBTransaction;
  FID: Integer;
begin
  if not FUserList.ContainsKey(UserInfo.UserID) then
  begin
    FSQL := TIBSQL.Create(nil);
    FTransaction := TIBTransaction.Create(nil);
    try
      FTransaction.DefaultDatabase := FDataBase;
      FTransaction.StartTransaction;
      FSQL.Transaction := FTransaction;
      try
        // проверяем, если данный пользователь в базе лога
        FSQL.SQL.Text := ' SELECT ID FROM GD_USER WHERE USERKEY = :ID ';
        FSQL.Params[0].AsInteger := UserInfo.UserID;
        FSQL.ExecQuery;
        if not FSQL.Eof then
          FUserList.Add(UserInfo.UserID, FSQL.FieldByName('ID').AsInteger)
        else
        begin
          FSQL.Close;
          FID := GetNextID;
          FSQL.SQL.Text := 'INSERT INTO GD_USER(ID, USERKEY, USERNAME) ' +
            ' VALUES(:ID, :USERKEY, :USERNAME) ';
          FSQL.ParamByName('ID').AsInteger := FID;
          FSQL.ParamByName('USERKEY').AsInteger := UserInfo.UserID;
          FSQL.ParamByName('USERNAME').AsString := UserInfo.UserName;
          FSQL.ExecQuery;
          FTransaction.Commit;
          FUserList.Add(UserInfo.UserID, FID);
        end;
        FSQL.Close;
      except
        raise ;
      end;
    finally
      FSQL.Free;
      FTransaction.Free;
    end;
  end;
end;

constructor TLogManager.Create;
begin
  inherited;
  FUserList := TDictionary<Integer, Integer>.Create();
  FGoodList := TDictionary<Integer, Integer>.Create();
  FOrderList := TDictionary<Integer, Integer>.Create();

  FReadTransaction := TIBTransaction.Create(nil);
  FReadTransaction.Params.Add('read_committed');
  FReadTransaction.Params.Add('read');
  FReadTransaction.Params.Add('rec_version');
  FReadTransaction.Params.Add('nowait');

  FDataBase := TIBDataBase.Create(nil);
  FDataBase.LoginPrompt := False;
  FDataBase.DefaultTransaction := FReadTransaction;
  FReadTransaction.DefaultDatabase := FDataBase;

  FIDSQL := TIBSQL.Create(nil);
  FIDSQL.Transaction := FReadTransaction;
  FIDSQL.SQL.Text := 'SELECT gen_id(gd_g_unique, 1) as id FROM rdb$database';

  FInit := False;
end;

destructor TLogManager.Destroy;
begin
  FUserList.Free;
  FGoodList.Free;
  FOrderList.Free;
  if Assigned(FDataBase) then
    FreeAndNil(FDataBase);
  if Assigned(FReadTransaction) then
    FreeAndNil(FReadTransaction);
  FIDSQL.Free;

  inherited;
end;

procedure TLogManager.DoOrderLog(const UserInfo: TLogUserInfo;
  OrderInfo: TLogOrderInfo; Event: Integer);
var
  FSQL: TIBSQL;
  FTransaction: TIBTransaction;
begin
  if not FInit then
    exit;

  try
    CheckUser(UserInfo);
    CheckOrder(OrderInfo);

    FSQL := TIBSQL.Create(nil);
    FTransaction := TIBTransaction.Create(nil);
    try
      FTransaction.DefaultDatabase := FDataBase;
      FTransaction.StartTransaction;
      FSQL.Transaction := FTransaction;
      FSQL.SQL.Text := ' INSERT INTO GD_EVENTLOG(USERKEY, EVENTKEY, ORDERKEY, EDITIONDATE) ' +
        ' VALUES(:USERKEY, :EVENTKEY, :ORDERKEY, :ED) ';
      FSQL.ParamByName('USERKEY').AsInteger := FUserList.Items[UserInfo.UserID];
      FSQL.ParamByName('EVENTKEY').AsInteger := Event;
      FSQL.ParamByName('ORDERKEY').AsInteger := FOrderList.Items[OrderInfo.OrderID];
      FSQL.ParamByName('ED').AsDateTime := Now;
      FSQL.ExecQuery;
      FTransaction.Commit;
    finally
      FSQL.Free;
      FTransaction.Free;
    end;
  except
    on E: Exception do
      raise Exception.Create('Ошибка логирования ' + E.Message);
  end;
end;

procedure TLogManager.DoSimpleEvent(const Event: Integer);
var
  FSQL: TIBSQL;
  FTransaction: TIBTransaction;
begin
  if not FInit then
    exit;

  try
    FSQL := TIBSQL.Create(nil);
    FTransaction := TIBTransaction.Create(nil);
    try
      FTransaction.DefaultDatabase := FDataBase;
      FTransaction.StartTransaction;
      FSQL.Transaction := FTransaction;
      FSQL.SQL.Text := ' INSERT INTO GD_EVENTLOG(EVENTKEY, EDITIONDATE) ' +
        ' VALUES(:EVENTKEY, :ED) ';
      FSQL.ParamByName('EVENTKEY').AsInteger := Event;
      FSQL.ParamByName('ED').AsDateTime := Now;
      FSQL.ExecQuery;
      FTransaction.Commit;
    finally
      FSQL.Free;
      FTransaction.Free;
    end;
  except
    on E: Exception do
      raise Exception.Create('Ошибка логирования ' + E.Message);

  end;
end;

procedure TLogManager.DoSimpleLog(const UserInfo: TLogUserInfo; Event: Integer);
var
  FSQL: TIBSQL;
  FTransaction: TIBTransaction;
begin
  if not FInit then
    exit;

  try
    CheckUser(UserInfo);

    FSQL := TIBSQL.Create(nil);
    FTransaction := TIBTransaction.Create(nil);
    try
      FTransaction.DefaultDatabase := FDataBase;
      FTransaction.StartTransaction;
      FSQL.Transaction := FTransaction;
      FSQL.SQL.Text := ' INSERT INTO GD_EVENTLOG(USERKEY, EVENTKEY, EDITIONDATE) ' +
        ' VALUES(:USERKEY, :EVENTKEY, :ED) ';
      FSQL.ParamByName('USERKEY').AsInteger := FUserList.Items[UserInfo.UserID];
      FSQL.ParamByName('EVENTKEY').AsInteger := Event;
      FSQL.ParamByName('ED').AsDateTime := Now;
      FSQL.ExecQuery;
      FTransaction.Commit;
    finally
      FSQL.Free;
      FTransaction.Free;
    end;
  except
    on E: Exception do
      raise Exception.Create('Ошибка логирования ' + E.Message);
  end;
end;

function TLogManager.GetNextID: Integer;
begin
  if not FIDSQL.Transaction.InTransaction then
    FIDSQL.Transaction.StartTransaction;

  FIDSQL.Close;
  FIDSQL.ExecQuery;
  Result := FIDSQL.FieldByName('ID').AsInteger;
end;

procedure TLogManager.SetDatabaseName(const Value: String);
begin
  FDataBaseName := Value;
  if FDataBaseName <> '' then
  begin
    // проверить наличие базы, если нет, тогда создаём её.
    try
      FDataBase.DatabaseName := FDataBaseName;
      FDatabase.Params.Add('user_name=SYSDBA');
      FDatabase.Params.Add('password=masterkey');
      FDatabase.Params.Add('lc_ctype=WIN1251');
      FDatabase.SQLDialect := 3;
      FDataBase.Open;

      FInit := True;
    except
      FInit := False;
    end;
  end  else
  begin
    FInit := False;
  end;
end;

procedure TLogManager.SetFrontBase(const Value: TFrontBase);
begin
  FFrontBase := Value;
end;

procedure TLogManager.WriteLog(const UserInfo: TLogUserInfo;
  OrderInfo: TLogOrderInfo; Event: Integer);
begin
  //
end;

end.
