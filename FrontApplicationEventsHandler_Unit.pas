unit FrontApplicationEventsHandler_Unit;

interface

uses
  Sysutils, Messages, Forms;

type
  TApplicationEventsHandler = class(TObject)
  public
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
  end;

implementation

{ TApplicationEventsHandler }

procedure TApplicationEventsHandler.ApplicationEventsException(
  Sender: TObject; E: Exception);
begin
{ TODO : ���������� ��� ������ � ��� }
{���� ������ - ������ ����������, ������� ��������������}
  Application.ShowException(E);
end;

end.
