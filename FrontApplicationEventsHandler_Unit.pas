unit FrontApplicationEventsHandler_Unit;

interface

uses
  Sysutils, Messages, Forms, Windows;

type
  TApplicationEventsHandler = class(TObject)
  private
    //
  public
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
  end;

implementation

uses
  TouchMessageBoxForm_Unit, Dialogs, rfUtils_unit;

{ TApplicationEventsHandler }

procedure TApplicationEventsHandler.ApplicationEventsException(
  Sender: TObject; E: Exception);
begin
{ TODO : ���������� ��� ������ � ��� }
{���� ������ - ������ ����������, ������� ��������������}
  Touch_MessageBox('��������', '������ ' + E.Message, MB_OK, mtError);
  WriteToEventLog(E.Message);
end;

end.
