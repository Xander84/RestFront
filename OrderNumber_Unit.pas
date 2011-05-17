unit OrderNumber_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvSmoothTouchKeyBoard, ExtCtrls, AdvPanel, FrontData_Unit,
  AdvSmoothButton, BaseFrontForm_Unit;

type
  TOrderNumber = class(TBaseFrontForm)
    pnlMain: TAdvPanel;
    lblMain: TLabel;
    edtNumber: TEdit;
    TouchKeyBoard: TAdvSmoothTouchKeyBoard;
    btnOK: TAdvSmoothButton;
    btnCancel: TAdvSmoothButton;
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure TouchKeyBoardKeyClick(Sender: TObject;
      Index: Integer);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure SetNumber(const Value: String);

  protected
    function GetNumber: String;

  public
    property Number: String read GetNumber write SetNumber;

  end;

var
  OrderNumber: TOrderNumber;

implementation

{$R *.dfm}

procedure TOrderNumber.edtNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = 'þ') or (Key = 'Þ') or (Key = 'á') or (Key = 'Á') or (Key = ',') or (Key = '<') then
    Key := FFormatSettings.DecimalSeparator;
end;

function TOrderNumber.GetNumber: String;
begin
  Result := edtNumber.Text;
end;

procedure TOrderNumber.TouchKeyBoardKeyClick(Sender: TObject;
  Index: Integer);
begin
  edtNumber.SetFocus;
end;

procedure TOrderNumber.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TOrderNumber.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TOrderNumber.SetNumber(const Value: String);
begin
  edtNumber.Text := Value;
end;

procedure TOrderNumber.FormCreate(Sender: TObject);
begin
  edtNumber.Color := pnlMain.Color;

  btnOK.Picture := FrontData.RestPictureContainer.FindPicture('tick');
  btnCancel.Picture := FrontData.RestPictureContainer.FindPicture('cross');
end;

end.
