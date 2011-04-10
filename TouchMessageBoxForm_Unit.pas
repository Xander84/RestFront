unit TouchMessageBoxForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrontForm_Unit, ExtCtrls, AdvPanel,
  AdvSmoothButton, StdCtrls, ImgList, PngImageList;

type
  TTouchMessageBox = class(TBaseFrontForm)
    pnlMain: TAdvPanel;
    pnlBottom: TAdvPanel;
    lblText: TLabel;
    btnOK: TAdvSmoothButton;
    btnYes: TAdvSmoothButton;
    btnNo: TAdvSmoothButton;
    imgList: TPngImageList;
    pngImage: TImage;
    procedure FormCreate(Sender: TObject);
  private
    FMessageType: Integer;
    FText: String;
    procedure SetMessageType(const Value: Integer);
    procedure SetText(const Value: String);
    procedure SetDlgType(const Value: TMsgDlgType);
    { Private declarations }
  public
    property MessageType: Integer read FMessageType write SetMessageType;
    property Text: String read FText write SetText;
    property DlgType: TMsgDlgType write SetDlgType;
  end;

function Touch_MessageBox(const FCaption, FText: String; FMessageType: Integer): Integer; overload;
function Touch_MessageBox(const FCaption, FText: String; FMessageType: Integer;
  DlgType: TMsgDlgType): Integer; overload;


var
  TouchMessageBox: TTouchMessageBox;

implementation

{$R *.dfm}

{ TTTouchMessageBox }

procedure TTouchMessageBox.FormCreate(Sender: TObject);
begin
  MessageType := MB_OK;
  pngImage.Picture.Assign(ImgList.PngImages[Integer(mtInformation)].PngImage);
end;

procedure TTouchMessageBox.SetDlgType(const Value: TMsgDlgType);
begin
  pngImage.Picture.Assign(ImgList.PngImages[Integer(Value)].PngImage);
end;

procedure TTouchMessageBox.SetMessageType(const Value: Integer);
begin
  FMessageType := Value;
  case FMessageType of
    MB_OK:
      begin
        btnOK.Visible := True;
        btnYes.Visible := False;
        btnNo.Visible := False;
      end;

    MB_YESNO:
      begin
        btnOK.Visible := False;
        btnYes.Visible := True;
        btnNo.Visible := True;
      end;

    else begin
      btnOK.Visible := True;
      btnYes.Visible := False;
      btnNo.Visible := False;
    end;
  end;
end;

procedure TTouchMessageBox.SetText(const Value: String);
begin
  FText := Value;
  lblText.Caption := FText;
end;

function Touch_MessageBox(const FCaption, FText: String; FMessageType: Integer): Integer;
var
  FForm: TTouchMessageBox;
begin
  FForm := TTouchMessageBox.Create(nil);
  try
    FForm.Caption := FCaption;
    FForm.Text := FText;
    FForm.MessageType := FMessageType;
    Result := FForm.ShowModal;
  finally
    FForm.Free;
  end;
end;

function Touch_MessageBox(const FCaption, FText: String; FMessageType: Integer;
  DlgType: TMsgDlgType): Integer;
var
  FForm: TTouchMessageBox;
begin
  FForm := TTouchMessageBox.Create(nil);
  try
    FForm.Caption := FCaption;
    FForm.Text := FText;
    FForm.MessageType := FMessageType;
    FForm.DlgType := DlgType;
    Result := FForm.ShowModal;
  finally
    FForm.Free;
  end;
end;

end.
