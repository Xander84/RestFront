unit TouchMessageBoxForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrontForm_Unit, FrontData_Unit, ExtCtrls, AdvPanel,
  AdvSmoothButton, StdCtrls;

type
  TTouchMessageBox = class(TBaseFrontForm)
    pnlMain: TAdvPanel;
    pnlBottom: TAdvPanel;
    lblText: TLabel;
    btnOK: TAdvSmoothButton;
    btnYes: TAdvSmoothButton;
    btnNo: TAdvSmoothButton;
    procedure FormCreate(Sender: TObject);
  private
    FMessageType: Integer;
    FText: String;
    procedure SetMessageType(const Value: Integer);
    procedure SetText(const Value: String);
    { Private declarations }
  public
    property MessageType: Integer read FMessageType write SetMessageType;
    property Text: String read FText write SetText;
  end;

function Touch_MessageBox(const FCaption, FText: String; FMessageType: Integer): Integer;


var
  TouchMessageBox: TTouchMessageBox;

implementation

{$R *.dfm}

{ TTTouchMessageBox }

procedure TTouchMessageBox.FormCreate(Sender: TObject);
begin
  MessageType := MB_OK;
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

end.
