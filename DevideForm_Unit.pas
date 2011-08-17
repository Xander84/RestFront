unit DevideForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OrderNumber_Unit, StdCtrls, AdvSmoothButton,
  AdvSmoothTouchKeyBoard, ExtCtrls, AdvPanel;

type
  TDevideForm = class(TOrderNumber)
    procedure FormCreate(Sender: TObject);
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
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

uses
  FrontData_Unit;

{ TDevideForm }

procedure TDevideForm.edtNumberKeyPress(Sender: TObject; var Key: Char);
var
  D: Double;
begin
  if (Key = '.') or (Key = ',') then
    Key := SysUtils.DecimalSeparator;
  if Key <> #8 then
  begin
    if not TryStrToFloat(edtNumber.Text + Key, D) then
    begin
      Key := #0;
      Beep;
    end;
  end;
  inherited;
end;

procedure TDevideForm.FormCreate(Sender: TObject);
begin
  inherited;
  FCanDevided := False;

  btnOK.Picture := FrontData.RestPictureContainer.FindPicture('tick');
  btnCancel.Picture := FrontData.RestPictureContainer.FindPicture('cross');
end;

function TDevideForm.GetLabelCaption: String;
begin
  Result := lblMain.Caption;
end;

procedure TDevideForm.SetCanDevided(const Value: Boolean);
begin
  FCanDevided := Value;
  if not Value then
    TouchKeyBoard.Keys[9].Caption := ''
  else
    TouchKeyBoard.Keys[9].Caption := FFormatSettings.DecimalSeparator;
end;

procedure TDevideForm.SetLabelCaption(const Value: String);
begin
  lblMain.Caption := Value;
  Caption := Value;
end;

end.
