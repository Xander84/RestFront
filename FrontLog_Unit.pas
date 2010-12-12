unit FrontLog_Unit;

interface

uses
  Front_DataBase_Unit, Classes, SysUtils, Forms;

{
Что должен уметь лог:
1. Лог ошибок, писать все ошибки и время, когда это случалось. Время брать локальное или сервера?
2. Лог операций.
3. Лог позиций чека.

Работать с логом должен объект работы с БД TFrontBase
При подлючении создаём класс, при отключении - убиваем.

 }
{type
  TFrontLogType = (LogIn, Exit, ErrorPass);     }

type
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
    if FFrontBase.MN_Options.DoLog then
    begin
      // Локализуем сообщение
      Str := MsgType;
  //    Str := TLogText[LogType];
      if Msg <> '' then
        Str := Str + ' ' + Msg;
      UserKey := FFrontBase.ContactKey;
      if FFrontBase.MN_Options.LogToFile then
        WriteLogToFile(Str, UserKey, FFrontBase.MN_Options.LinesLimit)
      else
        WriteLogToBase(Str, UserKey);
    end;
  end;  
end;

{ TFrontLog }

constructor TFrontLog.Create;
begin
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

end.
