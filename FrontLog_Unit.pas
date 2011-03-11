unit FrontLog_Unit;

interface

uses
  Front_DataBase_Unit, Classes, SysUtils, Forms, Generics.Collections, IBSQL,
  IBDatabase;

type
  TLogManager = class(TObject)
  private
    FUserList: TList<Integer>; // TDictionary<Integer, Integer>
    FGoodList: TList<Integer>;
    FDataBase: TIBDataBase;
    FFrontBase: TFrontBase;

    FDataBaseName: String;
    procedure SetDatabaseName(const Value: String);
    // проверка пользователя в базе лога, если нет, то добавляем
    procedure CheckUser(const UserID: Integer);
    procedure CheckGood(const GoodID: Integer);
    procedure SetFrontBase(const Value: TFrontBase);
  public
    constructor Create;
    destructor Destroy; override;

    property DatabaseName: String read FDataBaseName write SetDatabaseName;
    property FrontBase: TFrontBase read FFrontBase write SetFrontBase;
  end;




  TFrontLog = class(TObject)
  private
    FFrontBase: TFrontBase;
    FDoLog: Boolean;
    FLinesLimit: Integer;
    FLogToFile: Boolean;
    procedure SetFrontBase(const Value: TFrontBase);
  protected
    procedure WriteLogToBase(const Str: String; const UserKey: Integer);
    procedure WriteLogToFile(const Str: String; const UserKey: Integer);
  public
    constructor Create;
    destructor Destroy; override;
//    procedure WriteLog(const LogType: TFrontLogType; const Msg: String);
    property FrontBase: TFrontBase read FFrontBase write SetFrontBase;
  end;



const
  LogFileName = 'FrontLog.log';
  cn_l_LogIn = 'Вход в систему';
  cn_l_Exit = 'Выход из системы';
  cn_l_ErrorPass = 'Неверный пароль';

{const
  TLogText: array [TFrontLogType] of String =
  ('Вход в систему', 'Выход из системы', 'Неверный пароль'
  );     }

procedure WriteLog(const FFrontBase: TFrontBase;
  const MsgType: String{TFrontLogType}; const Msg: String);

implementation

procedure WriteLogToBase(const Str: String; const UserKey: Integer);
begin
{ TODO -oAlexander : Реализовать }
end;

procedure WriteLogToFile(const Str: String; const UserKey, LinesLimit: Integer);
var
  LStrings: TStrings;
  FullFileName: String;
  I: Integer;
begin
  try
    LStrings := TStringList.Create;
    try
      FullFileName := ExtractFileDir(Application.ExeName)+ '\' + LogFileName;
      if FileExists(FullFileName) then
        LStrings.LoadFromFile(FullFileName);
      LStrings.Add('----------------'#13#10 + DateTimeToStr(Now) + #13#10 +
        'Пользователь: ' + IntToStr(UserKey) + #13#10 + Str);

      if (LinesLimit > 0) then
        for I := LStrings.Count - 1 downto LinesLimit do
          LStrings.Delete(0);
      try
        LStrings.SaveToFile(FullFileName);
      except
      end;
    finally
      LStrings.Free;
    end;
  except
    // гасим всё
  end;
end;

procedure WriteLog(const FFrontBase: TFrontBase;
  const MsgType: String {TFrontLogType}; const Msg: String);
var
  Str: String;
  UserKey: Integer;
begin
  if Assigned(FFrontBase) then
  begin
    if FFrontBase.Options.DoLog then
    begin
      // Локализуем сообщение
      Str := MsgType;
  //    Str := TLogText[LogType];
      if Msg <> '' then
        Str := Str + ' ' + Msg;
      UserKey := FFrontBase.ContactKey;
      if FFrontBase.Options.LogToFile then
        WriteLogToFile(Str, UserKey, FFrontBase.Options.LinesLimit)
      else
        WriteLogToBase(Str, UserKey);
    end;
  end;  
end;

{ TFrontLog }

constructor TFrontLog.Create;
begin
  inherited;

  FFrontBase := nil;
end;

destructor TFrontLog.Destroy;
begin
//
  inherited;
end;

procedure TFrontLog.SetFrontBase(const Value: TFrontBase);
begin
  FFrontBase := Value;
end;

{procedure TFrontLog.WriteLog(const LogType: TFrontLogType;
  const Msg: String);
begin
//
end;  }

procedure TFrontLog.WriteLogToBase(const Str: String;
  const UserKey: Integer);
begin
//
end;

procedure TFrontLog.WriteLogToFile(const Str: String;
  const UserKey: Integer);
begin
//
end;

{ TLogManager }

procedure TLogManager.CheckGood(const GoodID: Integer);
var
  FSQL: TIBSQL;
  FTransaction: TIBTransaction;
begin
  if not (FGoodList.IndexOf(GoodID) > -1) then
    if Assigned(FDataBase) then
    begin
      FSQL := TIBSQL.Create(nil);
      FTransaction := TIBTransaction.Create(nil);
      try
        FTransaction.DefaultDatabase := FDataBase;
        FTransaction.StartTransaction;
        FSQL.Transaction := FTransaction;


        FTransaction.Commit;
        FGoodList.Add(GoodID);
      finally
        FSQL.Free;
        FTransaction.Free;
      end;
    end else
      FGoodList.Add(GoodID);
end;

procedure TLogManager.CheckUser(const UserID: Integer);
var
  FSQL: TIBSQL;
  FTransaction: TIBTransaction;
begin
  if not (FUserList.IndexOf(UserID) > -1) then
    if Assigned(FDataBase) then
    begin
      FSQL := TIBSQL.Create(nil);
      FTransaction := TIBTransaction.Create(nil);
      try
        FTransaction.DefaultDatabase := FDataBase;
        FTransaction.StartTransaction;
        FSQL.Transaction := FTransaction;


        FTransaction.Commit;
        FUserList.Add(UserID);
      finally
        FSQL.Free;
        FTransaction.Free;
      end;
    end else
      FUserList.Add(UserID);
end;

constructor TLogManager.Create;
begin
  inherited;
  FUserList := TList<Integer>.Create();
  FGoodList := TList<Integer>.Create();
end;

destructor TLogManager.Destroy;
begin
  FUserList.Free;
  FGoodList.Free;
  if Assigned(FDataBase) then
    FreeAndNil(FDataBase);

  inherited;
end;

procedure TLogManager.SetDatabaseName(const Value: String);
begin
  FDataBaseName := Value;
  if FDataBaseName <> '' then
    //проверить наличие базы, если нет, тогда создаём её.

  else if Assigned(FDataBase) then
    FreeAndNil(FDataBase);
end;

procedure TLogManager.SetFrontBase(const Value: TFrontBase);
begin
  FFrontBase := Value;
end;

end.
