unit GuestForm_unit;

interface

uses
  Windows, SysUtils, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, AdvPanel, FrontData_Unit, AdvSmoothButton,
  Classes, BaseFrontForm_Unit;

type
  TGuestForm = class(TBaseFrontForm)
    AdvPanel1: TAdvPanel;
    Label1: TLabel;
    lblGuestCount: TLabel;
    btnOK: TAdvSmoothButton;
    btnCancel: TAdvSmoothButton;
    btnAddGuest: TAdvSmoothButton;
    btnRemoveGuest: TAdvSmoothButton;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure btnRemoveGuestClick(Sender: TObject);
    procedure btnAddGuestClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    function GetGuestCount: Integer;
    procedure SetGuestCount(const Value: Integer);
  public
     procedure AddGuestCount(const Count: Integer);
     property GuestCount: Integer read GetGuestCount write SetGuestCount;
  end;

var
  GuestForm: TGuestForm;

implementation

uses
  TouchMessageBoxForm_Unit;

{$R *.dfm}

procedure TGuestForm.FormCreate(Sender: TObject);
begin
  //по умолчанию
  lblGuestCount.Caption := '1';

  btnAddGuest.Picture := FrontData.RestPictureContainer.FindPicture('add');
  btnRemoveGuest.Picture :=  FrontData.RestPictureContainer.FindPicture('delete');
  btnOK.Picture := FrontData.RestPictureContainer.FindPicture('tick');
  btnCancel.Picture := FrontData.RestPictureContainer.FindPicture('cross');
end;

procedure TGuestForm.btnRemoveGuestClick(Sender: TObject);
var
  S: String;
begin
  S := lblGuestCount.Caption;
  if (S = '0') or (S = '') then
    exit
  else
    try
      S := IntToStr(StrToInt(S) - 1);
    except
    end;
  lblGuestCount.Caption := S;
end;

procedure TGuestForm.btnAddGuestClick(Sender: TObject);
var
  S: String;
begin
  S := lblGuestCount.Caption;
  if S = '' then
    S := '1'
  else
    try
      S := IntToStr(StrToInt(S) + 1);
    except
    end;
  lblGuestCount.Caption := S;
end;

procedure TGuestForm.AddGuestCount(const Count: Integer);
begin
  lblGuestCount.Caption := IntToStr(Count);
end;

function TGuestForm.GetGuestCount: Integer;
begin
  Result := StrToInt(lblGuestCount.Caption);
end;

procedure TGuestForm.SetGuestCount(const Value: Integer);
begin
  lblGuestCount.Caption := IntToStr(Value);
end;

procedure TGuestForm.btnOKClick(Sender: TObject);
begin
  if lblGuestCount.Caption <> '' then
  begin
    if StrToInt(lblGuestCount.Caption) >= FrontBase.Options.MinGuestCount then
      ModalResult := mrOk
    else
      Touch_MessageBox('Внимание', 'Необходимо указать кол-во гостей.', MB_OK, mtWarning);
  end else
    Touch_MessageBox('Внимание', 'Необходимо указать кол-во гостей.', MB_OK, mtWarning);
end;

procedure TGuestForm.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
