unit DevideForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OrderNumber_Unit, StdCtrls, AdvSmoothButton,
  AdvSmoothTouchKeyBoard, ExtCtrls, AdvPanel;

type
  TDevideForm = class(TOrderNumber)
  private
    function GetLabelCaption: String;
    procedure SetLabelCaption(const Value: String);
    { Private declarations }
  public
    property Number;
    property LabelCaption: String read GetLabelCaption write SetLabelCaption;
  end;

var
  DevideForm: TDevideForm;

implementation

{$R *.dfm}

{ TDevideForm }

function TDevideForm.GetLabelCaption: String;
begin
  Result := lblMain.Caption;
end;

procedure TDevideForm.SetLabelCaption(const Value: String);
begin
  lblMain.Caption := Value;
  Caption := Value;
end;

end.
