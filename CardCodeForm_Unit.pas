unit CardCodeForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FrontData_Unit, AdvSmoothButton, ExtCtrls, AdvPanel,
  BaseFrontForm_Unit;

type
  TCardCode = class(TBaseFrontForm)
    AdvPanel1: TAdvPanel;
    edPass: TEdit;
    btnOK: TAdvSmoothButton;
    procedure edPassKeyPress(Sender: TObject; var Key: Char);
    procedure btnOKClick(Sender: TObject);
  private
    function GetPassword: String;
    { Private declarations }
  public
    property PassWord: String read GetPassword;
  end;

var
  CardCode: TCardCode;

implementation

{$R *.dfm}

procedure TCardCode.edPassKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    ModalResult := mrOK;
  if Key = #27 then
    ModalResult := mrCancel;
end;

function TCardCode.GetPassword: String;
begin
  Result := edPass.Text;
end;

procedure TCardCode.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
