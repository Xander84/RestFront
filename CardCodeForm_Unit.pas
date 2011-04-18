unit CardCodeForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FrontData_Unit, AdvSmoothButton, ExtCtrls, AdvPanel,
  BaseFrontForm_Unit, AdvSmoothTouchKeyBoard;

type
  TCardCode = class(TBaseFrontForm)
    AdvPanel1: TAdvPanel;
    edPass: TEdit;
    btnOK: TAdvSmoothButton;
    AdvSmoothTouchKeyBoard1: TAdvSmoothTouchKeyBoard;
    procedure edPassKeyPress(Sender: TObject; var Key: Char);
    procedure btnOKClick(Sender: TObject);
  private
    FNeedPassWordChar: Boolean;
    function GetInputString: String;
    procedure SetNeedPassWordChar(const Value: Boolean);
    { Private declarations }
  public
    property InputString: String read GetInputString;
    property NeedPassWordChar: Boolean read FNeedPassWordChar write SetNeedPassWordChar;
  end;

var
  CardCode: TCardCode;

implementation

uses
  Front_DataBase_Unit;

{$R *.dfm}

procedure TCardCode.edPassKeyPress(Sender: TObject; var Key: Char);
begin
  RemoveWrongPassChar(Key);
  if Key = #13 then
    ModalResult := mrOK;
  if Key = #27 then
    ModalResult := mrCancel;
end;

function TCardCode.GetInputString: String;
begin
  Result := edPass.Text;
end;

procedure TCardCode.SetNeedPassWordChar(const Value: Boolean);
begin
  FNeedPassWordChar := Value;
  if FNeedPassWordChar then
    edPass.PasswordChar := '*'
  else
    edPass.PasswordChar := #0;
end;

procedure TCardCode.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
