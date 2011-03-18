unit DevideForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OrderNumber_Unit, StdCtrls, AdvSmoothButton,
  AdvSmoothTouchKeyBoard, ExtCtrls, AdvPanel;

type
  TDevideForm = class(TOrderNumber)
    procedure FormCreate(Sender: TObject);
  private
    FCanDevided: Boolean;
    function GetLabelCaption: String;
    procedure SetLabelCaption(const Value: String);
    procedure SetCanDevided(const Value: Boolean);
    { Private declarations }
  public
    property Number;
    property LabelCaption: String read GetLabelCaption write SetLabelCaption;
    property CanDevided: Boolean read FCanDevided write SetCanDevided;
  end;

var
  DevideForm: TDevideForm;

implementation

{$R *.dfm}

{ TDevideForm }

procedure TDevideForm.FormCreate(Sender: TObject);
begin
  inherited;
  FCanDevided := False;
end;

function TDevideForm.GetLabelCaption: String;
begin
  Result := lblMain.Caption;
end;

procedure TDevideForm.SetCanDevided(const Value: Boolean);
begin
  FCanDevided := Value;
  if not Value then
    TouchKeyBoard.Keys[9].Caption := '';
end;

procedure TDevideForm.SetLabelCaption(const Value: String);
begin
  lblMain.Caption := Value;
  Caption := Value;
end;

end.
