unit FrontLog_Unit;

interface

uses
  Front_DataBase_Unit, Classes, SysUtils, Forms, Generics.Collections, IBSQL,
  IBDatabase, IB, IBScript;

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
  ev_DiscountCard     = 15;
  ev_DiscountPercent  = 16;
  ev_DevideOrder      = 17;
  // event's with good
  ev_AddGoodToOrder   = 18;
  ev_AddQuantity      = 19;
  ev_RemoveQuantity   = 20;
  ev_RemoveGood       = 21;
  ev_DevideQuantityGood  = 22;
  ev_ModifyGood       = 23;

const
  DataSQL =
    ' EXECUTE BLOCK '#13#10 +
    ' AS BEGIN '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (1, ''Вход в программу пользователя''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (2, ''Выход из программы пользователя''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (3, ''Введен неверный пароль''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (4, ''Запуск программы''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (5, ''Закрытие программы''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (6, ''Создание нового заказа''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (7, ''Вход в просмотр заказов для оплаты''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (8, ''Вход в просмотр всех заказов (режим менеджера)''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (9, ''Вход в заказ''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (10, ''Сохранение заказа''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (11, ''Выход из заказа без сохранения''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (12, ''Печать пречека''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (13, ''Отмена пречека''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (14, ''Оплата заказа''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (15, ''Скидка карточкой''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (16, ''Скидка из справочника''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (17, ''Разделение заказа''); '#13#10 +
    ' END; ';

  DataBaseSQL =
    ' CREATE DOMAIN DCURRENCY AS '#13#10 +
    ' DECIMAL(15,4); '#13#10 +
    ' CREATE DOMAIN DEDITIONDATE AS '#13#10 +
    ' TIMESTAMP '#13#10 +
    ' DEFAULT CURRENT_TIMESTAMP; '#13#10 +
    ' '#13#10 +
    ' CREATE DOMAIN DFOREIGNKEY AS '#13#10 +
    ' INTEGER; '#13#10 +
    ' '#13#10 +
    ' CREATE DOMAIN DINTEGER_NOTNULL AS '#13#10 +
    ' INTEGER '#13#10 +
    ' NOT NULL; '#13#10 +
    ' '#13#10 +
    ' CREATE DOMAIN DINTKEY AS '#13#10 +
    ' INTEGER '#13#10 +
    ' NOT NULL '#13#10 +
    ' CHECK (VALUE > 0); '#13#10 +
    ' '#13#10 +
    ' CREATE DOMAIN DNAME AS '#13#10 +
    ' VARCHAR(60) '#13#10 +
    ' NOT NULL '#13#10 +
    ' COLLATE PXW_CYRL; '#13#10 +
    ' '#13#10 +
    ' CREATE DOMAIN DTEXT40 AS '#13#10 +
    ' VARCHAR(40) '#13#10 +
    ' COLLATE PXW_CYRL; '#13#10 +
    ' '#13#10 +
    ' CREATE GENERATOR GD_G_UNIQUE; '#13#10 +
    ' SET GENERATOR GD_G_UNIQUE TO 100; '#13#10 +
    ' '#13#10 +
    ' CREATE TABLE GD_EVENT ( '#13#10 +
    '     ID         DINTKEY NOT NULL, '#13#10 +
    '     EVENTNAME  DNAME '#13#10 +
    ' ); '#13#10 +
    ' '#13#10 +
    ' CREATE TABLE GD_EVENTLOG ( '#13#10 +
    '     ID           DINTKEY NOT NULL, '#13#10 +
    '     USERKEY      DFOREIGNKEY, '#13#10 +
    '     EVENTKEY     DFOREIGNKEY, '#13#10 +
    '     EDITIONDATE  DEDITIONDATE, '#13#10 +
    '     ORDERKEY     DFOREIGNKEY, '#13#10 +
    '     GOODLOGKEY   DFOREIGNKEY '#13#10 +
    ' ); '#13#10 +
    ' '#13#10 +
    ' CREATE TABLE GD_GOOD ( '#13#10 +
    '     ID        DINTKEY NOT NULL, '#13#10 +
    '     GOODNAME  DNAME, '#13#10 +
    '     GOODKEY   DINTEGER_NOTNULL '#13#10 +
    ' ); '#13#10 +
    ' '#13#10 +
    ' CREATE TABLE GD_GOODLOG ( '#13#10 +
    '     ID        DINTKEY NOT NULL, '#13#10 +
    '     GOODKEY   DFOREIGNKEY, '#13#10 +
    '     SUMM      DCURRENCY, '#13#10 +
    '     QUANTITY  DCURRENCY '#13#10 +
    ' ); '#13#10 +
    ' '#13#10 +
    ' CREATE TABLE GD_ORDER ( '#13#10 +
    '     ID        DINTKEY NOT NULL, '#13#10 +
    '     NUMBER    DNAME, '#13#10 +
    '     ORDERKEY  DINTEGER_NOTNULL '#13#10 +
    ' ); '#13#10 +
    ' '#13#10 +
    ' CREATE TABLE GD_USER ( '#13#10 +
    '     ID        DINTKEY NOT NULL, '#13#10 +
    '     USERNAME  DTEXT40, '#13#10 +
    '     USERKEY   DINTEGER_NOTNULL '#13#10 +
    ' ); '#13#10 +
    ' '#13#10 +
    ' ALTER TABLE GD_EVENT ADD CONSTRAINT GD_PK_EVENT PRIMARY KEY (ID); '#13#10 +
    ' ALTER TABLE GD_EVENTLOG ADD CONSTRAINT GD_PK_EVENTLOG PRIMARY KEY (ID); '#13#10 +
    ' ALTER TABLE GD_GOOD ADD CONSTRAINT GD_PK_GOOD PRIMARY KEY (ID); '#13#10 +
    ' ALTER TABLE GD_GOODLOG ADD CONSTRAINT GD_PK_GOODLOG PRIMARY KEY (ID); '#13#10 +
    ' ALTER TABLE GD_ORDER ADD CONSTRAINT GD_PK_ORDER PRIMARY KEY (ID); '#13#10 +
    ' ALTER TABLE GD_USER ADD CONSTRAINT GD_PK_USER PRIMARY KEY (ID); '#13#10 +
    ' '#13#10 +
    ' ALTER TABLE GD_EVENTLOG ADD CONSTRAINT FK_GD_EVENTLOG_EVENTKEY FOREIGN KEY (EVENTKEY) REFERENCES GD_EVENT (ID) ON UPDATE CASCADE; '#13#10 +
    ' ALTER TABLE GD_EVENTLOG ADD CONSTRAINT FK_GD_EVENTLOG_GOODLOGKEY FOREIGN KEY (GOODLOGKEY) REFERENCES GD_GOODLOG (ID) ON UPDATE CASCADE; '#13#10 +
    ' ALTER TABLE GD_EVENTLOG ADD CONSTRAINT FK_GD_EVENTLOG_ORDERKEY FOREIGN KEY (ORDERKEY) REFERENCES GD_ORDER (ID) ON UPDATE CASCADE; '#13#10 +
    ' ALTER TABLE GD_EVENTLOG ADD CONSTRAINT FK_GD_EVENTLOG_USERKEY FOREIGN KEY (USERKEY) REFERENCES GD_USER (ID) ON UPDATE CASCADE; '#13#10 +
    ' ALTER TABLE GD_GOODLOG ADD CONSTRAINT FK_GD_GOODLOG_GOODKEY FOREIGN KEY (GOODKEY) REFERENCES GD_GOOD (ID) ON UPDATE CASCADE; '#13#10 +
    ' '#13#10 +
    ' CREATE INDEX GD_GOOD_IDX1 ON GD_GOOD (GOODKEY); '#13#10 +
    ' CREATE INDEX GD_ORDER_IDX1 ON GD_ORDER (ORDERKEY); '#13#10 +
    ' CREATE INDEX GD_USER_IDX1 ON GD_USER (USERKEY); '#13#10 +
    ' '#13#10 +
    ' SET TERM ^ ; '#13#10 +
    ' '#13#10 +
    ' /* Trigger: GD_BI_EVENTLOG */ '#13#10 +
    ' CREATE TRIGGER GD_BI_EVENTLOG FOR GD_EVENTLOG '#13#10 +
    ' ACTIVE BEFORE INSERT POSITION 0 '#13#10 +
    ' AS '#13#10 +
    ' BEGIN '#13#10 +
    '   IF (NEW.ID IS NULL) THEN '#13#10 +
    '     NEW.ID = GEN_ID(gd_g_unique, 1); '#13#10 +
    ' END '#13#10 +
    ' ^  '#13#10 +
    ' '#13#10 +
    ' /* Trigger: GD_BI_GOOD */ '#13#10 +
    ' CREATE TRIGGER GD_BI_GOOD FOR GD_GOOD '#13#10 +
    ' ACTIVE BEFORE INSERT POSITION 0 '#13#10 +
    ' AS '#13#10 +
    ' BEGIN '#13#10 +
    '   IF (NEW.ID IS NULL) THEN '#13#10 +
    '     NEW.ID = GEN_ID(gd_g_unique, 1); '#13#10 +
    ' END '#13#10 +
    ' ^ '#13#10 +
    ' '#13#10 +
    ' /* Trigger: GD_BI_GOODLOG */ '#13#10 +
    ' CREATE TRIGGER GD_BI_GOODLOG FOR GD_GOODLOG '#13#10 +
    ' ACTIVE BEFORE INSERT POSITION 0 '#13#10 +
    ' AS '#13#10 +
    ' BEGIN '#13#10 +
    '   IF (NEW.ID IS NULL) THEN '#13#10 +
    '     NEW.ID = GEN_ID(gd_g_unique, 1); '#13#10 +
    ' END '#13#10 +
    ' ^ '#13#10 +
    ' '#13#10 +
    ' /* Trigger: GD_BI_ORDER */ '#13#10 +
    ' CREATE TRIGGER GD_BI_ORDER FOR GD_ORDER '#13#10 +
    ' ACTIVE BEFORE INSERT POSITION 0 '#13#10 +
    ' AS '#13#10 +
    ' BEGIN '#13#10 +
    '   IF (NEW.ID IS NULL) THEN '#13#10 +
    '     NEW.ID = GEN_ID(gd_g_unique, 1); '#13#10 +
    ' END '#13#10 +
    ' ^ '#13#10 +
    ' '#13#10 +
    ' /* Trigger: GD_BI_USER */ '#13#10 +
    ' CREATE TRIGGER GD_BI_USER FOR GD_USER '#13#10 +
    ' ACTIVE BEFORE INSERT POSITION 0 '#13#10 +
    ' AS '#13#10 +
    ' BEGIN '#13#10 +
    '   IF (NEW.ID IS NULL) THEN '#13#10 +
    '     NEW.ID = GEN_ID(gd_g_unique, 1); '#13#10 +
    ' END '#13#10 +
    ' ^ '#13#10 +
    ' '#13#10 +
    ' SET TERM ; ^ '#13#10 +
    ' '#13#10 +
    ' GRANT ALL ON GD_EVENT TO ADMINISTRATOR; '#13#10 +
    ' GRANT ALL ON GD_EVENTLOG TO ADMINISTRATOR; '#13#10 +
    ' GRANT ALL ON GD_GOOD TO ADMINISTRATOR; '#13#10 +
    ' GRANT ALL ON GD_GOODLOG TO ADMINISTRATOR; '#13#10 +
    ' GRANT ALL ON GD_ORDER TO ADMINISTRATOR; '#13#10 +
    ' GRANT ALL ON GD_USER TO ADMINISTRATOR; ';


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
    procedure DoOrderGoodLog(const UserInfo: TLogUserInfo; OrderInfo: TLogOrderInfo;
      GoodInfo: TLogGoodInfo; Event: Integer);
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
        raise;
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
        raise;
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
        raise;
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

procedure TLogManager.DoOrderGoodLog(const UserInfo: TLogUserInfo;
  OrderInfo: TLogOrderInfo; GoodInfo: TLogGoodInfo; Event: Integer);
var
  FSQL: TIBSQL;
  FTransaction: TIBTransaction;
  FID: Integer;
begin
  if not FInit then
    exit;

  try
    CheckUser(UserInfo);
    CheckOrder(OrderInfo);
    CheckGood(GoodInfo);

    FSQL := TIBSQL.Create(nil);
    FTransaction := TIBTransaction.Create(nil);
    try
      FTransaction.DefaultDatabase := FDataBase;
      FTransaction.StartTransaction;
      FSQL.Transaction := FTransaction;
      FSQL.SQL.Text := ' INSERT INTO GD_GOODLOG(ID, GOODKEY, SUMM, QUANTITY) ' +
        ' VALUES(:ID, :GOODKEY, :SUMM, :QUANTITY) ';
      FID := GetNextID;
      FSQL.ParamByName('ID').AsInteger := FID;
      FSQL.ParamByName('GOODKEY').AsInteger := FGoodList.Items[GoodInfo.GoodID];
      FSQL.ParamByName('SUMM').AsCurrency := GoodInfo.Sum;
      FSQL.ParamByName('QUANTITY').AsCurrency := GoodInfo.Quantity;
      FSQL.ExecQuery;

      FSQL.Close;
      FSQL.SQL.Text := ' INSERT INTO GD_EVENTLOG(USERKEY, EVENTKEY, ORDERKEY, GOODLOGKEY, EDITIONDATE) ' +
        ' VALUES(:USERKEY, :EVENTKEY, :ORDERKEY, :GOODLOGKEY, :ED) ';
      FSQL.ParamByName('USERKEY').AsInteger := FUserList.Items[UserInfo.UserID];
      FSQL.ParamByName('EVENTKEY').AsInteger := Event;
      FSQL.ParamByName('GOODLOGKEY').AsInteger := FID;
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
var
  FScript: TIBScript;
  FSQL: TIBSQL;
  FTransaction: TIBTransaction;
begin
  FDataBaseName := Value;
  if FDataBaseName <> '' then
  begin
    // проверить наличие базы, если нет, тогда создаём её.
    FDataBase.DatabaseName := FDataBaseName;
    FDatabase.Params.Add('user_name=SYSDBA');
    FDatabase.Params.Add('password=masterkey');
    FDatabase.Params.Add('lc_ctype=WIN1251');
    FDatabase.SQLDialect := 3;
    try
      FDataBase.Open;

      FInit := True;
    except
      on E: Exception do
      begin
        if (E is EIBInterBaseError) and ((EIBInterBaseError(E).SQLCode = - 902) and (EIBInterBaseError(E).IBErrorCode = 335544344)) then
        begin
          FDataBase.ForceClose;
          try
            //Create DB
            FDataBase.Params.Clear;
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

              FScript.Script.Text := DataBaseSQL;
              FScript.ExecuteScript;
              if FTransaction.InTransaction then
                FTransaction.Commit;

              FTransaction.StartTransaction;
              FSQL.ParamCheck := False;
              FSQL.SQL.Text := DataSQL;
              FSQL.ExecQuery;
              FSQL.Close;

              if FTransaction.InTransaction then
                FTransaction.Commit;
              FInit := True;
            finally
              FSQL.Free;
              FScript.Free;
              FTransaction.Free;
            end;
          except
            FInit := False;
          end;
        end else
          FInit := False;
      end;
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
