unit BaseFrontForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrontData_Unit, AdvAppStyler, AdvPanel, AdvPageControl, ExtCtrls,
  Front_DataBase_Unit, AdvSmoothButton, FrontLog_Unit;

type
  TBaseFrontForm = class(TForm)
    AdvFormStyler: TAdvFormStyler;
  protected
    FLogManager: TLogManager;
    FFrontBase: TFrontBase;
    FIsActionRun: Boolean;
  public
    procedure AfterConstruction; override;
    property FrontBase: TFrontBase read FFrontBase write FFrontBase;
    property LogManager: TLogManager read FLogManager write FLogManager;
    property IsActionRun: Boolean read FIsActionRun write FIsActionRun;
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
  inherited;

  FIsActionRun := False;
  Color := FrontData.PanelColorTo;
  AdvFormStyler.Style := GetFrontStyle;
  for I := 0 to ComponentCount - 1 do
  begin
    if (Components[I] is TAdvPanel) then
    begin
      TAdvPanel(Components[I]).Styler := FrontData.FrontPanelStyler;
      TAdvPanel(Components[I]).Buffered := False;
      TAdvPanel(Components[I]).BevelOuter := bvNone;
    end else
    if (Components[I] is TPanel) then
      TPanel(Components[I]).Color := FrontData.PanelColorTo
    else if (Components[I] is TAdvTabSheet) then
    begin
      TAdvTabSheet(Components[I]).Color := FrontData.PanelColor;
      TAdvTabSheet(Components[I]).ColorTo := FrontData.PanelColorTo;
    end else
    if (Components[I] is TAdvSmoothButton) then
      SetButtonStyle(TAdvSmoothButton(Components[I]))
    else if (Components[I] is TGridPanel) or (Components[I] is TScrollBox) then
      TPanel(Components[I]).Color := FrontData.PanelColor
    else if (Components[I] is TAdvPageControl) then
      TAdvPageControl(Components[I]).TabBackGroundColor := FrontData.PanelColor;
  end;
  BorderIcons := [];
  BorderStyle := bsSingle;
end;

end.
