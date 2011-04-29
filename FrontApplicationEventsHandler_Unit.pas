unit FrontApplicationEventsHandler_Unit;

interface

uses
  Sysutils, Messages, Forms, Windows;

type
  TApplicationEventsHandler = class(TObject)
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
end;

end.
