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
    procedure FormCreate(Sender: TObject);
    procedure btnRemoveGuestClick(Sender: TObject);
    procedure btnAddGuestClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    function GetGuestCount: Integer;
  public
     procedure AddGuestCount(const Count: Integer);
     property GuestCount: Integer read GetGuestCount;
  end;

var
  GuestForm: TGuestForm;

implementation


{$R *.dfm}

procedure TGuestForm.FormCreate(Sender: TObject);
begin
  //по умолчанию
  lblGuestCount.Caption := '1';

  btnAddGuest.Picture := FrontData.RestPictureContainer.FindPicture('AddPicture');
  btnRemoveGuest.Picture :=  FrontData.RestPictureContainer.FindPicture('RemovePicture');
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

procedure TGuestForm.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TGuestForm.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
