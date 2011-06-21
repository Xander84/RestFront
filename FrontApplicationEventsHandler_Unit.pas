unit FrontApplicationEventsHandler_Unit;

interface

uses
  Sysutils, Messages, Forms, Windows;

type
  TApplicationEventsHandler = class(TObject)
  private
    // code from http://stackoverflow.com/questions/397934/writing-to-the-event-log-in-delphi
    procedure WriteToEventLog(const Msg: string);
  public
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
  end;

implementation

uses
  TouchMessageBoxForm_Unit, Dialogs;

{ TApplicationEventsHandler }

procedure TApplicationEventsHandler.ApplicationEventsException(
  Sender: TObject; E: Exception);
begin
{ TODO : Записывать все ошибки в лог }
{если ошибка - потеря соединения, сделать переподлючение}
  Touch_MessageBox('Внимание', 'Ошибка ' + E.Message, MB_OK, mtError);
  WriteToEventLog(E.Message);
end;

procedure TApplicationEventsHandler.WriteToEventLog(const Msg: string);
var
  h: THandle;
  ss: array [0..0] of PChar;
begin
  ss[0] := PChar(Msg);
  // uses local computer
  // source name
  h := RegisterEventSource(nil, 'RestFront');
  try
    if h <> 0 then
      ReportEvent(h,              // event log handle
            EVENTLOG_ERROR_TYPE,  // event type
            0,                    // category zero
            0,                    // event identifier
            nil,                  // no user security identifier
            1,                    // one substitution string
            0,                    // no data
            @ss,                  // pointer to string array
            nil);                 // pointer to data
  finally
    DeregisterEventSource(h);
  end;
end;

end.
