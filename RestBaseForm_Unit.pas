unit RestBaseForm_Unit;

interface

uses
  Forms, FrontData_Unit, AdvPanel;

type
  TRestBaseForm = class(TForm)
  protected

  public
    procedure AfterConstruction; override;
  end;

implementation

uses
  Classes, AdvPageControl, ExtCtrls;

{ RestBaseForm }

procedure TRestBaseForm.AfterConstruction;
var
  I: Integer;
begin
  inherited;

  for I := 0 to ComponentCount - 1 do
  begin
    if (Components[I] is TAdvPanel) then
      TAdvPanel(Components[I]).Styler := FrontData.FrontPanelStyler
    else if (Components[I] is TPanel) then
      TPanel(Components[I]).Color := FrontData.PanelColorTo
    else if (Components[I] is TAdvTabSheet) then
    begin
       TAdvTabSheet(Components[I]).Color := FrontData.PanelColor;
       TAdvTabSheet(Components[I]).ColorTo := FrontData.PanelColorTo;
    end;
  end;
end;

end.
