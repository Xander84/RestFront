unit BaseFrontForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrontData_Unit, AdvAppStyler, AdvPanel, AdvPageControl, ExtCtrls;

type
  TBaseFrontForm = class(TForm)
    AdvFormStyler: TAdvFormStyler;
  public
    procedure AfterConstruction; override;
  end;

var
  BaseFrontForm: TBaseFrontForm;

implementation

{$R *.dfm}

{ TBaseFrontForm }

procedure TBaseFrontForm.AfterConstruction;
var
  I : Integer;
begin
  AdvFormStyler.Style := GetFrontStyle;
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

  inherited;
end;

end.
