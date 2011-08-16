unit FrontLog_Unit;

interface

uses
  Front_DataBase_Unit, Classes, SysUtils, Forms, Generics.Collections, IBSQL,
  IBDatabase, IB, IBScript, rfMetadata_unit, TouchMessageBoxForm_Unit, Dialogs,
  Windows;

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
  // работа с чеками
  // печать чека
  ev_PrintCheck  = 24;
  // возврат чека
  ev_ReturnCheck = 25;
  // отмена чека
  ev_CancelCheck = 26;
  // внесение денег
  ev_MoneyIn     = 27;
  //изьятие денег
  ev_MoneyOut    = 28;
  //печать X отчета
  ev_PrintXReport = 29;
  //печать Z отчета
  ev_PrintZReport = 30;

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
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (18, ''Добавление товара в заказ''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (19, ''Увеличение количества товара в заказе''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (20, ''Уменьшение количества товара в заказе''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (21, ''Удаление товара из заказа''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (22, ''Ввод дробного количества товара''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (23, ''Ввод модификатора для товара''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (24, ''Печать чека''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (25, ''Возврат чека''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (26, ''Отмена чека''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (27, ''Внесение денег''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (28, ''Изьятие денег''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (29, ''Печать X отчета''); '#13#10 +
    ' INSERT INTO GD_EVENT (ID, EVENTNAME) VALUES (30, ''Печать Z отчета''); '#13#10 +
    ' END; ';

  DataBaseSQL =
    ' CREATE DOMAIN DBLOBTEXT80 AS '#13#10 +
    ' BLOB SUB_TYPE 1 SEGMENT SIZE 80; '#13#10 +
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
    ' CREATE TABLE GD_ACTIONLOG ( '#13#10 +
    '     ID           DINTKEY NOT NULL, '#13#10 +
    '     USERKEY      DFOREIGNKEY, '#13#10 +
    '     DESCRIPTION  DBLOBTEXT80, '#13#10 +
    '     EDITIONDATE  DEDITIONDATE, '#13#10 +
    '     COMPUTERNAME DTEXT40 '#13#10 +
    ' ); '#13#10 +
    ' '#13#10 +
    ' CREATE TABLE GD_CHECKLOG ( '#13#10 +
    '     ID           DINTKEY NOT NULL, '#13#10 +
    '     ORDERKEY     DFOREIGNKEY, '#13#10 +
    '     GOODKEY      DFOREIGNKEY, '#13#10 +
    '     QUANTITY     DCURRENCY, '#13#10 +
    '     COSTNCU      DCURRENCY, '#13#10 +
    '     SUMNCU       DCURRENCY, '#13#10 +
    '     SUMDISCOUNT  DCURRENCY '#13#10 +
    ' ); '#13#10 +
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
    '     GOODLOGKEY   DFOREIGNKEY, '#13#10 +
    '     COMPUTERNAME DTEXT40, '#13#10 +
    '     CHECKLOGKEY  DFOREIGNKEY, '#13#10 +
    '     DESCRIPTION  DBLOBTEXT80, '#13#10 +
    '     SUMM         DCURRENCY '#13#10 +
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
    ' ALTER TABLE GD_ACTIONLOG ADD CONSTRAINT PK_GD_ACTIONLOG PRIMARY KEY (ID); '#13#10 +
    ' ALTER TABLE GD_CHECKLOG ADD CONSTRAINT PK_GD_CHECKLOG PRIMARY KEY (ID); '#13#10 +
    ' ALTER TABLE GD_EVENT ADD CONSTRAINT GD_PK_EVENT PRIMARY KEY (ID); '#13#10 +
    ' ALTER TABLE GD_EVENTLOG ADD CONSTRAINT GD_PK_EVENTLOG PRIMARY KEY (ID); '#13#10 +
    ' ALTER TABLE GD_GOOD ADD CONSTRAINT GD_PK_GOOD PRIMARY KEY (ID); '#13#10 +
    ' ALTER TABLE GD_GOODLOG ADD CONSTRAINT GD_PK_GOODLOG PRIMARY KEY (ID); '#13#10 +
    ' ALTER TABLE GD_ORDER ADD CONSTRAINT GD_PK_ORDER PRIMARY KEY (ID); '#13#10 +
    ' ALTER TABLE GD_USER ADD CONSTRAINT GD_PK_USER PRIMARY KEY (ID); '#13#10 +
    ' '#13#10 +
    ' ALTER TABLE GD_ACTIONLOG ADD CONSTRAINT FK_GD_ACTIONLOG_USERKEY FOREIGN KEY (USERKEY) REFERENCES GD_USER (ID) ON UPDATE CASCADE; '#13#10 +
    ' ALTER TABLE GD_CHECKLOG ADD CONSTRAINT FK_GD_CHECKLOG_GOODKEY FOREIGN KEY (GOODKEY) REFERENCES GD_GOOD (ID) ON UPDATE CASCADE; '#13#10 +
    ' ALTER TABLE GD_CHECKLOG ADD CONSTRAINT FK_GD_CHECKLOG_ORDERKEY FOREIGN KEY (ORDERKEY) REFERENCES GD_ORDER (ID) ON UPDATE CASCADE; '#13#10 +
    ' ALTER TABLE GD_EVENTLOG ADD CONSTRAINT FK_GD_EVENTLOG_CHECKLOGKEY FOREIGN KEY (CHECKLOGKEY) REFERENCES GD_CHECKLOG (ID) ON UPDATE CASCADE; '#13#10 +
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
    ' /* Trigger: GD_ACTIONLOG_BI */ '#13#10 +
    ' CREATE TRIGGER GD_ACTIONLOG_BI FOR GD_ACTIONLOG '#13#10 +
    ' ACTIVE BEFORE INSERT POSITION 0 '#13#10 +
    ' AS '#13#10 +
    '  BEGIN '#13#10 +
    '    IF (NEW.ID IS NULL) THEN '#13#10 +
    '      NEW.ID = GEN_ID(gd_g_unique, 1); '#13#10 +
    '  END '#13#10 +
    ' ^ '#13#10 +
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
    ' /* Trigger: GD_CHECKLOG_BI */ '#13#10 +
    ' CREATE TRIGGER GD_CHECKLOG_BI FOR GD_CHECKLOG  '#13#10 +
    ' ACTIVE BEFORE INSERT POSITION 0  '#13#10 +
    ' AS  '#13#10 +
    ' BEGIN  '#13#10 +
    '    IF (NEW.ID IS NULL) THEN  '#13#10 +
    '      NEW.ID = GEN_ID(gd_g_unique, 1);  '#13#10 +
    ' END  '#13#10 +
    ' ^  '#13#10 +
    ' '#13#10 +
    ' SET TERM ; ^ '#13#10 +
    ' '#13#10 +
    ' GRANT ALL ON GD_ACTIONLOG TO ADMINISTRATOR; '#13#10 +
    ' GRANT ALL ON GD_CHECKLOG TO ADMINISTRATOR; '#13#10 +
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

  TLogCheckInfo = packed record
    OrderID: Integer;
    OrderNumber: String;
    GoodID: Integer;
    GoodName: String;
    Quantity: Currency;
    CostNCU: Currency;
    SumNCU: Currency;
    SumDiscount: Currency;
  end;

  TFrontLog = class(TObject)
  private
    FUserList: TDictionary<Integer, Integer>;
    FGoodList: TDictionary<Integer, Integer>;
    FOrderList: TDictionary<Integer, Integer>;
    FDataBase: TIBDataBase;
    FFrontBase: TFrontBase;

    FInit: Boolean;
    FShowMsg: Boolean;
    procedure SetFrontBase(const Value: TFrontBase);
  protected
    procedure CheckUser(const UserInfo: TLogUserInfo);
    procedure CheckGood(const GoodInfo: TLogGoodInfo); overload;
    procedure CheckGood(const CheckInfo: TLogCheckInfo); overload;
    procedure CheckOrder(const OrderInfo: TLogOrderInfo); overload;
    procedure CheckOrder(const CheckInfo: TLogCheckInfo); overload;
  public
    constructor Create;
    destructor Destroy; override;

    procedure DoSimpleEvent(const Event: Integer);
    procedure DoSimpleLog(const UserInfo: TLogUserInfo; const Event: Integer);

    property DataBase: TIBDataBase read FDataBase write FDataBase;
    property FrontBase: TFrontBase read FFrontBase write SetFrontBase;
    property Init: Boolean read FInit write FInit;
    property ShowMsg: Boolean read FShowMsg write FShowMsg;
  end;

  TEventLog = class(TFrontLog)
  public
    procedure DoOrderLog(const UserInfo: TLogUserInfo;
      const OrderInfo: TLogOrderInfo; Event: Integer);
    procedure DoOrderGoodLog(const UserInfo: TLogUserInfo; const OrderInfo: TLogOrderInfo;
      const GoodInfo: TLogGoodInfo; Event: Integer);
  end;

  TCheckLog = class(TFrontLog)
  public
    procedure DoFiscalReportLog(const UserInfo: TLogUserInfo; const Event: Integer);
    procedure DoMoneyLog(const UserInfo: TLogUserInfo; const Summ: Currency;
      const Event: Integer);
    procedure DoCheckLog(const UserInfo: TLogUserInfo; const CheckInfo: TLogCheckInfo;
      const Event: Integer);
    procedure DoCancelCheckLog(const UserInfo: TLogUserInfo; const CheckInfo: TLogCheckInfo;
      const Msg: String);
  end;

  TActionLog = class(TFrontLog)
  public
    procedure DoActionLog(const UserInfo: TLogUserInfo; const Msg: String);
  end;

  TLogManager = class(TObject)
  private
    FFrontBase: TFrontBase;

    FEventDataBaseName: String;
    FEventDataBase: TIBDataBase;
    FEventLog: TEventLog;

    FFiscalDataBaseName: String;
    FFiscalDataBase: TIBDataBase;
    FFiscalLog: TCheckLog;

    FActionDataBaseName: String;
    FActionDataBase: TIBDatabase;
    FActionLog: TActionLog;
    FShowMsg: Boolean;

    procedure SetFrontBase(const Value: TFrontBase);
    procedure SetEventDatabaseName(const Value: String);
    procedure SetFiscalDataBaseName(const Value: String);
    procedure SetActionDataBaseName(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;

    procedure DoSimpleEvent(const Event: Integer);
    procedure DoSimpleLog(const UserInfo: TLogUserInfo; Event: Integer);
    procedure DoOrderLog(const UserInfo: TLogUserInfo;
      const OrderInfo: TLogOrderInfo; Event: Integer);
    procedure DoOrderGoodLog(const UserInfo: TLogUserInfo; const OrderInfo: TLogOrderInfo;
      const GoodInfo: TLogGoodInfo; Event: Integer);

    procedure DoActionLog(const UserInfo: TLogUserInfo; const Msg: String);

    procedure DoFiscalReportLog(const UserInfo: TLogUserInfo; const Event: Integer);
    procedure DoMoneyLog(const UserInfo: TLogUserInfo; const Summ: Currency;
      const Event: Integer);
    procedure DoCheckLog(const UserInfo: TLogUserInfo; const CheckInfo: TLogCheckInfo;
      const Event: Integer);
    procedure DoCancelCheckLog(const UserInfo: TLogUserInfo; const CheckInfo: TLogCheckInfo;
      const Text: String);

    property EventDataBaseName: String read FEventDataBaseName write SetEventDatabaseName;
    property FiscalDataBaseName: String read FFiscalDataBaseName write SetFiscalDataBaseName;
    property ActionDataBaseName: String read FActionDataBaseName write SetActionDataBaseName;
    property FrontBase: TFrontBase read FFrontBase write SetFrontBase;
    property ShowMsg: Boolean read FShowMsg write FShowMsg;
  end;

implementation

{ TLogManager }

constructor TLogManager.Create;
begin
  inherited;
  FShowMsg := True;
end;

destructor TLogManager.Destroy;
begin
  if Assigned(FEventDataBase) then
    FreeAndNil(FEventDataBase);
  if Assigned(FEventLog) then
    FreeAndNil(FEventLog);

  if Assigned(FFiscalDataBase) then
    FreeAndNil(FFiscalDataBase);
  if Assigned(FFiscalLog) then
    FreeAndNil(FFiscalLog);

  if Assigned(FActionDataBase) then
    FreeAndNil(FActionDataBase);
  if Assigned(FActionLog) then
    FreeAndNil(FActionLog);

  inherited;
end;

procedure TLogManager.DoActionLog(const UserInfo: TLogUserInfo;
  const Msg: String);
begin
  if Assigned(FActionLog) then
  begin
    if FActionLog.DataBase.Connected then
      FActionLog.DoActionLog(UserInfo, Msg);
  end;
end;

procedure TLogManager.DoCancelCheckLog(const UserInfo: TLogUserInfo;
  const CheckInfo: TLogCheckInfo; const Text: String);
begin
  if Assigned(FFiscalLog) then
  begin
    if FFiscalLog.DataBase.Connected then
      FFiscalLog.DoCancelCheckLog(UserInfo, CheckInfo, Text);
  end;
end;

procedure TLogManager.DoCheckLog(const UserInfo: TLogUserInfo;
  const CheckInfo: TLogCheckInfo; const Event: Integer);
begin
  if Assigned(FFiscalLog) then
  begin
    if FFiscalLog.DataBase.Connected then
      FFiscalLog.DoCheckLog(UserInfo, CheckInfo, Event);
  end;
end;

procedure TLogManager.DoFiscalReportLog(const UserInfo: TLogUserInfo;
  const Event: Integer);
begin
  if Assigned(FFiscalLog) then
  begin
    if FFiscalLog.DataBase.Connected then
      FFiscalLog.DoFiscalReportLog(UserInfo, Event);
  end;
end;

procedure TLogManager.DoMoneyLog(const UserInfo: TLogUserInfo;
  const Summ: Currency; const Event: Integer);
begin
  if Assigned(FFiscalLog) then
  begin
    if FFiscalLog.DataBase.Connected then
      FFiscalLog.DoMoneyLog(UserInfo, Summ, Event);
  end;
end;

procedure TLogManager.DoOrderGoodLog(const UserInfo: TLogUserInfo;
  const OrderInfo: TLogOrderInfo; const GoodInfo: TLogGoodInfo; Event: Integer);
begin
  if Assigned(FEventLog) then
  begin
    if FEventLog.DataBase.Connected then
      FEventLog.DoOrderGoodLog(UserInfo, OrderInfo, GoodInfo, Event);
  end;
end;

procedure TLogManager.DoOrderLog(const UserInfo: TLogUserInfo;
  const OrderInfo: TLogOrderInfo; Event: Integer);
begin
  if Assigned(FEventLog) then
  begin
    if FEventLog.DataBase.Connected then
      FEventLog.DoOrderLog(UserInfo, OrderInfo, Event);
  end;
end;

procedure TLogManager.DoSimpleEvent(const Event: Integer);
begin
  if Assigned(FEventLog) then
  begin
    if FEventLog.DataBase.Connected then
      FEventLog.DoSimpleEvent(Event);
  end;
end;

procedure TLogManager.DoSimpleLog(const UserInfo: TLogUserInfo; Event: Integer);
begin
  if Assigned(FEventLog) then
  begin
    if FEventLog.DataBase.Connected then
      FEventLog.DoSimpleLog(UserInfo, Event);
  end;
end;

procedure TLogManager.SetActionDataBaseName(const Value: String);
var
  FDBCreator: TDataBaseCreator;
  FInit: Boolean;
begin
  FActionDataBaseName := Value;
  if FActionDataBaseName <> '' then
  begin
    if (Value = FEventDataBaseName) and Assigned(FEventDataBase) then
    begin
      FActionLog := TActionLog.Create;
      FActionLog.FrontBase := FFrontBase;
      FActionLog.DataBase := FEventDataBase;
      FActionLog.ShowMsg := FShowMsg;
      exit;
    end
    else if (Value = FFiscalDataBaseName) and Assigned(FFiscalDataBase) then
    begin
      FActionLog := TActionLog.Create;
      FActionLog.FrontBase := FFrontBase;
      FActionLog.DataBase := FFiscalDataBase;
      FActionLog.ShowMsg := FShowMsg;
      exit;
    end;

    FActionDataBase := TIBDataBase.Create(nil);
    FActionDataBase.LoginPrompt := False;
    // проверить наличие базы, если нет, тогда создаём её.
    FActionDataBase.DatabaseName := FActionDataBaseName;
    FActionDataBase.Params.Add('user_name=SYSDBA');
    FActionDataBase.Params.Add('password=masterkey');
    FActionDataBase.Params.Add('lc_ctype=WIN1251');
    FActionDataBase.SQLDialect := 3;
    try
      FActionDataBase.Open;

      FInit := True;
    except
      on E: Exception do
      begin
        if (E is EIBInterBaseError) and ((EIBInterBaseError(E).SQLCode = - 902) and (EIBInterBaseError(E).IBErrorCode = 335544344)) then
        begin
          FActionDataBase.ForceClose;

          FDBCreator := TDataBaseCreator.Create;
          try
            FDBCreator.DataBaseName := FActionDataBaseName;
            FDBCreator.MetaDataSQL := DataBaseSQL;
            FDBCreator.DataSQL := DataSQL;
            FDBCreator.ShowMessages := False;
            if FDBCreator.CreateDataBase then
            begin
              try
                FActionDataBase.Open;
                FInit := True;
              except
                FInit := False;
              end;
            end else
              FInit := False;
          finally
            FDBCreator.Free;
          end;
        end else
          FInit := False;
      end;
    end;
  end else
  begin
    FInit := False;
  end;

  if FInit then
  begin
    FActionLog := TActionLog.Create;
    FActionLog.FrontBase := FFrontBase;
    FActionLog.DataBase := FActionDataBase;
    FActionLog.ShowMsg := FShowMsg;
  end;
end;

procedure TLogManager.SetEventDatabaseName(const Value: String);
var
  FDBCreator: TDataBaseCreator;
  FInit: Boolean;
begin
  FEventDataBaseName := Value;
  if FEventDataBaseName <> '' then
  begin
    FEventDataBase := TIBDataBase.Create(nil);
    FEventDataBase.LoginPrompt := False;
    // проверить наличие базы, если нет, тогда создаём её.
    FEventDataBase.DatabaseName := FEventDataBaseName;
    FEventDataBase.Params.Add('user_name=SYSDBA');
    FEventDataBase.Params.Add('password=masterkey');
    FEventDataBase.Params.Add('lc_ctype=WIN1251');
    FEventDataBase.SQLDialect := 3;
    try
      FEventDataBase.Open;

      FInit := True;
    except
      on E: Exception do
      begin
        if (E is EIBInterBaseError) and ((EIBInterBaseError(E).SQLCode = - 902) and (EIBInterBaseError(E).IBErrorCode = 335544344)) then
        begin
          FEventDataBase.ForceClose;

          FDBCreator := TDataBaseCreator.Create;
          try
            FDBCreator.DataBaseName := FEventDataBaseName;
            FDBCreator.MetaDataSQL := DataBaseSQL;
            FDBCreator.DataSQL := DataSQL;
            FDBCreator.ShowMessages := False;
            if FDBCreator.CreateDataBase then
            begin
              try
                FEventDataBase.Open;
                FInit := True;
              except
                FInit := False;
              end;
            end else
              FInit := False;
          finally
            FDBCreator.Free;
          end;
        end else
          FInit := False;
      end;
    end;
  end else
  begin
    FInit := False;
  end;

  if FInit then
  begin
    FEventLog := TEventLog.Create;
    FEventLog.FrontBase := FFrontBase;
    FEventLog.DataBase := FEventDataBase;
    FEventLog.ShowMsg := FShowMsg;
  end;
end;

procedure TLogManager.SetFiscalDataBaseName(const Value: String);
var
  FDBCreator: TDataBaseCreator;
  FInit: Boolean;
begin
  FFiscalDataBaseName := Value;
  if FFiscalDataBaseName <> '' then
  begin
    if (FFiscalDataBaseName = FEventDataBaseName) and Assigned(FEventDataBase) then
    begin
      FFiscalLog := TCheckLog.Create;
      FFiscalLog.FrontBase := FrontBase;
      FFiscalLog.DataBase := FEventDataBase;
      FFiscalLog.ShowMsg := FShowMsg;
      exit;
    end;

    FFiscalDataBase := TIBDataBase.Create(nil);
    FFiscalDataBase.LoginPrompt := False;
    // проверить наличие базы, если нет, тогда создаём её.
    FFiscalDataBase.DatabaseName := FFiscalDataBaseName;
    FFiscalDataBase.Params.Add('user_name=SYSDBA');
    FFiscalDataBase.Params.Add('password=masterkey');
    FFiscalDataBase.Params.Add('lc_ctype=WIN1251');
    FFiscalDataBase.SQLDialect := 3;
    try
      FFiscalDataBase.Open;

      FInit := True;
    except
      on E: Exception do
      begin
        if (E is EIBInterBaseError) and ((EIBInterBaseError(E).SQLCode = - 902) and (EIBInterBaseError(E).IBErrorCode = 335544344)) then
        begin
          FFiscalDataBase.ForceClose;

          FDBCreator := TDataBaseCreator.Create;
          try
            FDBCreator.DataBaseName := FFiscalDataBaseName;
            FDBCreator.MetaDataSQL := DataBaseSQL;
            FDBCreator.DataSQL := DataSQL;
            FDBCreator.ShowMessages := False;
            if FDBCreator.CreateDataBase then
            begin
              try
                FFiscalDataBase.Open;
                FInit := True;
              except
                FInit := False;
              end;
            end else
              FInit := False;
          finally
            FDBCreator.Free;
          end;
        end else
          FInit := False;
      end;
    end;
  end else
  begin
    FInit := False;
  end;

  if FInit then
  begin
    FFiscalLog := TCheckLog.Create;
    FFiscalLog.FrontBase := FrontBase;
    FFiscalLog.DataBase := FFiscalDataBase;
    FFiscalLog.ShowMsg := FShowMsg;
  end;
end;

procedure TLogManager.SetFrontBase(const Value: TFrontBase);
begin
  FFrontBase := Value;
end;

{ TFrontLog }

procedure TFrontLog.CheckGood(const GoodInfo: TLogGoodInfo);
var
  FSQL: TIBSQL;
  FTransaction: TIBTransaction;
  FID: Integer;
begin
  if not FDataBase.Connected then
    exit;
  if not FGoodList.ContainsKey(GoodInfo.GoodID) then
  begin
    FSQL := TIBSQL.Create(nil);
    FTransaction := TIBTransaction.Create(nil);
    try
      FTransaction.DefaultDatabase := FDataBase;
      FTransaction.StartTransaction;
      FSQL.Transaction := FTransaction;
      try
        // проверяем, если данный товар в базе лога
        FSQL.SQL.Text := ' SELECT ID FROM GD_GOOD WHERE GOODKEY = :ID ';
        FSQL.Params[0].AsInteger := GoodInfo.GoodID;
        FSQL.ExecQuery;
        if not FSQL.Eof then
          FGoodList.Add(GoodInfo.GoodID, FSQL.FieldByName('ID').AsInteger)
        else
        begin
          FSQL.Close;
          FSQL.SQL.Text := 'INSERT INTO GD_GOOD(ID, GOODKEY, GOODNAME) ' +
            ' VALUES(GEN_ID(GD_G_UNIQUE, 1), :GOODKEY, :GOODNAME) ' +
            ' RETURNING ID ';
          FSQL.ParamByName('GOODKEY').AsInteger := GoodInfo.GoodID;
          FSQL.ParamByName('GOODNAME').AsString := GoodInfo.GoodName;
          FSQL.ExecQuery;
          FID := FSQL.FieldByName('ID').AsInteger;
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

procedure TFrontLog.CheckGood(const CheckInfo: TLogCheckInfo);
var
  FSQL: TIBSQL;
  FTransaction: TIBTransaction;
  FID: Integer;
begin
  if not FDataBase.Connected then
    exit;
  if not FGoodList.ContainsKey(CheckInfo.GoodID) then
  begin
    FSQL := TIBSQL.Create(nil);
    FTransaction := TIBTransaction.Create(nil);
    try
      FTransaction.DefaultDatabase := FDataBase;
      FTransaction.StartTransaction;
      FSQL.Transaction := FTransaction;
      try
        // проверяем, если данный товар в базе лога
        FSQL.SQL.Text := ' SELECT ID FROM GD_GOOD WHERE GOODKEY = :ID ';
        FSQL.Params[0].AsInteger := CheckInfo.GoodID;
        FSQL.ExecQuery;
        if not FSQL.Eof then
          FGoodList.Add(CheckInfo.GoodID, FSQL.FieldByName('ID').AsInteger)
        else
        begin
          FSQL.Close;
          FSQL.SQL.Text := 'INSERT INTO GD_GOOD(ID, GOODKEY, GOODNAME) ' +
            ' VALUES(GEN_ID(GD_G_UNIQUE, 1), :GOODKEY, :GOODNAME) ' +
            ' RETURNING ID ';
          FSQL.ParamByName('GOODKEY').AsInteger := CheckInfo.GoodID;
          FSQL.ParamByName('GOODNAME').AsString := CheckInfo.GoodName;
          FSQL.ExecQuery;
          FID := FSQL.FieldByName('ID').AsInteger;
          FTransaction.Commit;
          FGoodList.Add(CheckInfo.GoodID, FID);
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

procedure TFrontLog.CheckOrder(const CheckInfo: TLogCheckInfo);
var
  FSQL: TIBSQL;
  FTransaction: TIBTransaction;
  FID: Integer;
begin
  // не храним информацию более чем 100 заказов
  if FOrderList.Count > 100 then
    FOrderList.Clear;

  if not FOrderList.ContainsKey(CheckInfo.OrderID) then
  begin
    FSQL := TIBSQL.Create(nil);
    FTransaction := TIBTransaction.Create(nil);
    try
      FTransaction.DefaultDatabase := FDataBase;
      FTransaction.StartTransaction;
      FSQL.Transaction := FTransaction;
      try
        // проверяем, если данный заказ в базе лога
        FSQL.SQL.Text := ' SELECT ID FROM GD_ORDER WHERE ORDERKEY = :ID ';
        FSQL.Params[0].AsInteger := CheckInfo.OrderID;
        FSQL.ExecQuery;
        if not FSQL.Eof then
          FOrderList.Add(CheckInfo.OrderID, FSQL.FieldByName('ID').AsInteger)
        else
        begin
          FSQL.Close;
          FSQL.SQL.Text := 'INSERT INTO GD_ORDER(ID, ORDERKEY, NUMBER) ' +
            ' VALUES(GEN_ID(GD_G_UNIQUE, 1), :ORDERKEY, :NUMBER) ' +
            ' RETURNING ID ';
          FSQL.ParamByName('ORDERKEY').AsInteger := CheckInfo.OrderID;
          FSQL.ParamByName('NUMBER').AsString := CheckInfo.OrderNumber;
          FSQL.ExecQuery;
          FID := FSQL.FieldByName('ID').AsInteger;
          FTransaction.Commit;
          FOrderList.Add(CheckInfo.OrderID, FID);
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

procedure TFrontLog.CheckOrder(const OrderInfo: TLogOrderInfo);
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
        // проверяем, если данный заказ в базе лога
        FSQL.SQL.Text := ' SELECT ID FROM GD_ORDER WHERE ORDERKEY = :ID ';
        FSQL.Params[0].AsInteger := OrderInfo.OrderID;
        FSQL.ExecQuery;
        if not FSQL.Eof then
          FOrderList.Add(OrderInfo.OrderID, FSQL.FieldByName('ID').AsInteger)
        else
        begin
          FSQL.Close;
          FSQL.SQL.Text := 'INSERT INTO GD_ORDER(ID, ORDERKEY, NUMBER) ' +
            ' VALUES(GEN_ID(GD_G_UNIQUE, 1), :ORDERKEY, :NUMBER) ' +
            ' RETURNING ID ';
          FSQL.ParamByName('ORDERKEY').AsInteger := OrderInfo.OrderID;
          FSQL.ParamByName('NUMBER').AsString := OrderInfo.OrderNumber;
          FSQL.ExecQuery;
          FID := FSQL.FieldByName('ID').AsInteger;
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

procedure TFrontLog.CheckUser(const UserInfo: TLogUserInfo);
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
          FSQL.SQL.Text := 'INSERT INTO GD_USER(ID, USERKEY, USERNAME) ' +
            ' VALUES(GEN_ID(GD_G_UNIQUE, 1), :USERKEY, :USERNAME) ' +
            ' RETURNING ID ';
          FSQL.ParamByName('USERKEY').AsInteger := UserInfo.UserID;
          FSQL.ParamByName('USERNAME').AsString := UserInfo.UserName;
          FSQL.ExecQuery;
          FID := FSQL.FieldByName('ID').AsInteger;
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

constructor TFrontLog.Create;
begin
  inherited;
  FUserList := TDictionary<Integer, Integer>.Create();
  FGoodList := TDictionary<Integer, Integer>.Create();
  FOrderList := TDictionary<Integer, Integer>.Create();

  FInit := True;
end;

destructor TFrontLog.Destroy;
begin
  FUserList.Free;
  FGoodList.Free;
  FOrderList.Free;

  inherited;
end;


procedure TFrontLog.DoSimpleEvent(const Event: Integer);
var
  FSQL: TIBSQL;
  FTransaction: TIBTransaction;
begin
  if not FInit then
    exit;
  if not FDataBase.Connected then
    exit;
  try
    FSQL := TIBSQL.Create(nil);
    FTransaction := TIBTransaction.Create(nil);
    try
      FTransaction.DefaultDatabase := FDataBase;
      FTransaction.StartTransaction;
      FSQL.Transaction := FTransaction;
      FSQL.SQL.Text := ' INSERT INTO GD_EVENTLOG(EVENTKEY, EDITIONDATE, COMPUTERNAME) ' +
        ' VALUES(:EVENTKEY, CURRENT_TIMESTAMP, :COMPUTERNAME) ';
      FSQL.ParamByName('EVENTKEY').AsInteger := Event;
      FSQL.ParamByName('COMPUTERNAME').AsString := FrontBase.ComputerName;
      FSQL.ExecQuery;
      FTransaction.Commit;
    finally
      FSQL.Free;
      FTransaction.Free;
    end;
  except
    on E: Exception do
      if FShowMsg then
        Touch_MessageBox('Внимание', 'Ошибка логирования ' + E.Message, MB_OK, mtError);
  end;
end;

procedure TFrontLog.DoSimpleLog(const UserInfo: TLogUserInfo;
  const Event: Integer);
var
  FSQL: TIBSQL;
  FTransaction: TIBTransaction;
begin
  if not FInit then
    exit;
  if not FDataBase.Connected then
    exit;
  try
    CheckUser(UserInfo);

    FSQL := TIBSQL.Create(nil);
    FTransaction := TIBTransaction.Create(nil);
    try
      FTransaction.DefaultDatabase := FDataBase;
      FTransaction.StartTransaction;
      FSQL.Transaction := FTransaction;
      FSQL.SQL.Text := ' INSERT INTO GD_EVENTLOG(USERKEY, EVENTKEY, EDITIONDATE, COMPUTERNAME) ' +
        ' VALUES(:USERKEY, :EVENTKEY, CURRENT_TIMESTAMP, :COMPUTERNAME) ';
      FSQL.ParamByName('USERKEY').AsInteger := FUserList.Items[UserInfo.UserID];
      FSQL.ParamByName('EVENTKEY').AsInteger := Event;
      FSQL.ParamByName('COMPUTERNAME').AsString := FrontBase.ComputerName;
      FSQL.ExecQuery;
      FTransaction.Commit;
    finally
      FSQL.Free;
      FTransaction.Free;
    end;
  except
    on E: Exception do
      if FShowMsg then
        Touch_MessageBox('Внимание', 'Ошибка логирования ' + E.Message, MB_OK, mtError);
  end;
end;

procedure TFrontLog.SetFrontBase(const Value: TFrontBase);
begin
  FFrontBase := Value;
end;

{ TEventLog }

procedure TEventLog.DoOrderGoodLog(const UserInfo: TLogUserInfo;
  const OrderInfo: TLogOrderInfo; const GoodInfo: TLogGoodInfo; Event: Integer);
var
  FSQL: TIBSQL;
  FTransaction: TIBTransaction;
  FID: Integer;
begin
  if not FInit then
    exit;
  if not FDataBase.Connected then
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
        ' VALUES(GEN_ID(GD_G_UNIQUE, 1), :GOODKEY, :SUMM, :QUANTITY) ' +
        ' RETURNING ID ';
      FSQL.ParamByName('GOODKEY').AsInteger := FGoodList.Items[GoodInfo.GoodID];
      FSQL.ParamByName('SUMM').AsCurrency := GoodInfo.Sum;
      FSQL.ParamByName('QUANTITY').AsCurrency := GoodInfo.Quantity;
      FSQL.ExecQuery;
      FID := FSQL.FieldByName('ID').AsInteger;

      FSQL.Close;
      FSQL.SQL.Text := ' INSERT INTO GD_EVENTLOG(USERKEY, EVENTKEY, ORDERKEY, GOODLOGKEY, ' +
        '   EDITIONDATE, COMPUTERNAME) ' +
        ' VALUES(:USERKEY, :EVENTKEY, :ORDERKEY, :GOODLOGKEY, CURRENT_TIMESTAMP, ' +
        '   :COMPUTERNAME) ';
      FSQL.ParamByName('USERKEY').AsInteger := FUserList.Items[UserInfo.UserID];
      FSQL.ParamByName('EVENTKEY').AsInteger := Event;
      FSQL.ParamByName('GOODLOGKEY').AsInteger := FID;
      FSQL.ParamByName('ORDERKEY').AsInteger := FOrderList.Items[OrderInfo.OrderID];
      FSQL.ParamByName('COMPUTERNAME').AsString := FFrontBase.ComputerName;
      FSQL.ExecQuery;
      FTransaction.Commit;
    finally
      FSQL.Free;
      FTransaction.Free;
    end;
  except
    on E: Exception do
      if FShowMsg then
        Touch_MessageBox('Внимание', 'Ошибка логирования ' + E.Message, MB_OK, mtError);
  end;
end;

procedure TEventLog.DoOrderLog(const UserInfo: TLogUserInfo;
  const OrderInfo: TLogOrderInfo; Event: Integer);
var
  FSQL: TIBSQL;
  FTransaction: TIBTransaction;
begin
  if not FInit then
    exit;
  if not FDataBase.Connected then
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
      FSQL.SQL.Text := ' INSERT INTO GD_EVENTLOG(USERKEY, EVENTKEY, ORDERKEY, EDITIONDATE, ' +
        '   COMPUTERNAME) ' +
        ' VALUES(:USERKEY, :EVENTKEY, :ORDERKEY, CURRENT_TIMESTAMP, :COMPUTERNAME) ';
      FSQL.ParamByName('USERKEY').AsInteger := FUserList.Items[UserInfo.UserID];
      FSQL.ParamByName('EVENTKEY').AsInteger := Event;
      FSQL.ParamByName('ORDERKEY').AsInteger := FOrderList.Items[OrderInfo.OrderID];
      FSQL.ParamByName('COMPUTERNAME').AsString := FrontBase.ComputerName;
      FSQL.ExecQuery;
      FTransaction.Commit;
    finally
      FSQL.Free;
      FTransaction.Free;
    end;
  except
    on E: Exception do
      if FShowMsg then
        Touch_MessageBox('Внимание', 'Ошибка логирования ' + E.Message, MB_OK, mtError);
  end;
end;

{ TCheckLog }

procedure TCheckLog.DoCancelCheckLog(const UserInfo: TLogUserInfo;
  const CheckInfo: TLogCheckInfo; const Msg: String);
var
  FSQL: TIBSQL;
  FTransaction: TIBTransaction;
begin
  if not FInit then
    exit;
  if not FDataBase.Connected then
    exit;
  try
    FSQL := TIBSQL.Create(nil);
    FTransaction := TIBTransaction.Create(nil);
    try
      FTransaction.DefaultDatabase := FDataBase;
      FTransaction.StartTransaction;
      FSQL.Transaction := FTransaction;
      if CheckInfo.OrderID <> -1 then
      begin
        CheckUser(UserInfo);
        CheckOrder(CheckInfo);

        FSQL.SQL.Text := ' INSERT INTO GD_EVENTLOG(USERKEY, EVENTKEY, ORDERKEY, EDITIONDATE, ' +
          '   COMPUTERNAME, DESCRIPTION) ' +
          ' VALUES(:USERKEY, :EVENTKEY, :ORDERKEY, CURRENT_TIMESTAMP, :COMPUTERNAME, :DESCRIPTION) ';
        FSQL.ParamByName('USERKEY').AsInteger := FUserList.Items[UserInfo.UserID];
        FSQL.ParamByName('EVENTKEY').AsInteger := ev_CancelCheck;
        FSQL.ParamByName('ORDERKEY').AsInteger := FOrderList.Items[CheckInfo.OrderID];
        FSQL.ParamByName('COMPUTERNAME').AsString := FrontBase.ComputerName;
        FSQL.ParamByName('DESCRIPTION').AsString := Msg;
      end else
      begin
        FSQL.SQL.Text := ' INSERT INTO GD_EVENTLOG(USERKEY, EVENTKEY, EDITIONDATE, ' +
          '   COMPUTERNAME, DESCRIPTION) ' +
          ' VALUES(:USERKEY, :EVENTKEY, CURRENT_TIMESTAMP, :COMPUTERNAME, :DESCRIPTION) ';
        FSQL.ParamByName('USERKEY').AsInteger := FUserList.Items[UserInfo.UserID];
        FSQL.ParamByName('EVENTKEY').AsInteger := ev_CancelCheck;
        FSQL.ParamByName('COMPUTERNAME').AsString := FrontBase.ComputerName;
        FSQL.ParamByName('DESCRIPTION').AsString := Msg;
      end;
      FSQL.ExecQuery;
      FTransaction.Commit;
    finally
      FSQL.Free;
      FTransaction.Free;
    end;
  except
    on E: Exception do
      if FShowMsg then
        Touch_MessageBox('Внимание', 'Ошибка логирования ' + E.Message, MB_OK, mtError);
  end;
end;

procedure TCheckLog.DoCheckLog(const UserInfo: TLogUserInfo;
  const CheckInfo: TLogCheckInfo; const Event: Integer);
var
  FSQL: TIBSQL;
  FTransaction: TIBTransaction;
  FID: Integer;
begin
  if not FInit then
    exit;
  if not FDataBase.Connected then
    exit;
  try
    CheckUser(UserInfo);
    CheckOrder(CheckInfo);
    CheckGood(CheckInfo);

    FSQL := TIBSQL.Create(nil);
    FTransaction := TIBTransaction.Create(nil);
    try
      FTransaction.DefaultDatabase := FDataBase;
      FTransaction.StartTransaction;
      FSQL.Transaction := FTransaction;

      FSQL.Transaction := FTransaction;
      FSQL.SQL.Text :=
        ' INSERT INTO GD_CHECKLOG(ID, GOODKEY, ORDERKEY, QUANTITY, COSTNCU, ' +
        '   SUMNCU, SUMDISCOUNT) ' +
        ' VALUES (GEN_ID(GD_G_UNIQUE, 1), :GOODKEY, :ORDERKEY, :QUANTITY, :COSTNCU, ' +
        '   :SUMNCU, :SUMDISCOUNT) ' +
        ' RETURNING ID ';
      FSQL.ParamByName('GOODKEY').AsInteger := FGoodList.Items[CheckInfo.GoodID];
      FSQL.ParamByName('ORDERKEY').AsInteger := FOrderList.Items[CheckInfo.OrderID];
      FSQL.ParamByName('QUANTITY').AsCurrency := CheckInfo.Quantity;
      FSQL.ParamByName('COSTNCU').AsCurrency := CheckInfo.CostNCU;
      FSQL.ParamByName('SUMNCU').AsCurrency := CheckInfo.SumNCU;
      FSQL.ParamByName('SUMDISCOUNT').AsCurrency := CheckInfo.SumDiscount;
      FSQL.ExecQuery;
      FID := FSQL.FieldByName('ID').AsInteger;

      FSQL.Close;
      FSQL.SQL.Text := ' INSERT INTO GD_EVENTLOG(USERKEY, EVENTKEY, ORDERKEY, CHECKLOGKEY, ' +
        '   EDITIONDATE, COMPUTERNAME) ' +
        ' VALUES(:USERKEY, :EVENTKEY, :ORDERKEY, :CHECKLOGKEY, CURRENT_TIMESTAMP, ' +
        '   :COMPUTERNAME) ';
      FSQL.ParamByName('USERKEY').AsInteger := FUserList.Items[UserInfo.UserID];
      FSQL.ParamByName('EVENTKEY').AsInteger := Event;
      FSQL.ParamByName('CHECKLOGKEY').AsInteger := FID;
      FSQL.ParamByName('ORDERKEY').AsInteger := FOrderList.Items[CheckInfo.OrderID];
      FSQL.ParamByName('COMPUTERNAME').AsString := FFrontBase.ComputerName;
      FSQL.ExecQuery;
      FTransaction.Commit;
    finally
      FSQL.Free;
      FTransaction.Free;
    end;
  except
    on E: Exception do
      if FShowMsg then
        Touch_MessageBox('Внимание', 'Ошибка логирования ' + E.Message, MB_OK, mtError);
  end;
end;

procedure TCheckLog.DoFiscalReportLog(const UserInfo: TLogUserInfo;
  const Event: Integer);
begin
  DoSimpleLog(UserInfo, Event);
end;

procedure TCheckLog.DoMoneyLog(const UserInfo: TLogUserInfo;
  const Summ: Currency; const Event: Integer);
var
  FSQL: TIBSQL;
  FTransaction: TIBTransaction;
begin
  if not FInit then
    exit;
  if not FDataBase.Connected then
    exit;
  try
    CheckUser(UserInfo);

    FSQL := TIBSQL.Create(nil);
    FTransaction := TIBTransaction.Create(nil);
    try
      FTransaction.DefaultDatabase := FDataBase;
      FTransaction.StartTransaction;
      FSQL.Transaction := FTransaction;
      FSQL.SQL.Text := ' INSERT INTO GD_EVENTLOG(USERKEY, EVENTKEY, EDITIONDATE, SUMM, COMPUTERNAME) ' +
        ' VALUES(:USERKEY, :EVENTKEY, CURRENT_TIMESTAMP, :SUMM, :COMPUTERNAME) ';
      FSQL.ParamByName('USERKEY').AsInteger := FUserList.Items[UserInfo.UserID];
      FSQL.ParamByName('EVENTKEY').AsInteger := Event;
      FSQL.ParamByName('SUMM').AsCurrency := Summ;
      FSQL.ParamByName('COMPUTERNAME').AsString := FrontBase.ComputerName;
      FSQL.ExecQuery;
      FTransaction.Commit;
    finally
      FSQL.Free;
      FTransaction.Free;
    end;
  except
    on E: Exception do
      if FShowMsg then
        Touch_MessageBox('Внимание', 'Ошибка логирования ' + E.Message, MB_OK, mtError);
  end;
end;

{ TActionLog }

procedure TActionLog.DoActionLog(const UserInfo: TLogUserInfo;
  const Msg: String);
var
  FSQL: TIBSQL;
  FTransaction: TIBTransaction;
begin
  if not FInit then
    exit;
  if not FDataBase.Connected then
    exit;
  try
    CheckUser(UserInfo);

    FSQL := TIBSQL.Create(nil);
    FTransaction := TIBTransaction.Create(nil);
    try
      FTransaction.DefaultDatabase := FDataBase;
      FTransaction.StartTransaction;
      FSQL.Transaction := FTransaction;
      FSQL.SQL.Text := ' INSERT INTO GD_ACTIONLOG(USERKEY, EDITIONDATE, COMPUTERNAME, DESCRIPTION) ' +
        ' VALUES(:USERKEY, CURRENT_TIMESTAMP, :COMPUTERNAME, :DESCRIPTION) ';
      FSQL.ParamByName('USERKEY').AsInteger := FUserList.Items[UserInfo.UserID];
      FSQL.ParamByName('COMPUTERNAME').AsString := FrontBase.ComputerName;
      FSQL.ParamByName('DESCRIPTION').AsString := Msg;
      FSQL.ExecQuery;
      FTransaction.Commit;
    finally
      FSQL.Free;
      FTransaction.Free;
    end;
  except
    on E: Exception do
      if FShowMsg then
        Touch_MessageBox('Внимание', 'Ошибка логирования ' + E.Message, MB_OK, mtError);
  end;
end;

end.
