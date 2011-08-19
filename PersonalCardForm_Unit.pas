unit PersonalCardForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Front_DataBase_Unit, BaseFrontForm_Unit, AdvSmoothButton, StdCtrls,
  ExtCtrls, AdvPanel, kbmMemTable, DB;

type
  TPersonalCardForm = class(TBaseFrontForm)
    AdvPanel1: TAdvPanel;
    Label1: TLabel;
    Label2: TLabel;
    usrg_lblCustomer: TLabel;
    usrg_lblCardCode: TEdit;
    btnCancel: TAdvSmoothButton;
    btnOK: TAdvSmoothButton;
    btnDelete: TAdvSmoothButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure usrg_lblCardCodeKeyPress(Sender: TObject; var Key: Char);
  private
    FHeaderTable: TkbmMemTable;
  public
    property HeaderTable: TkbmMemTable read FHeaderTable write FHeaderTable;
  end;

var
  PersonalCardForm: TPersonalCardForm;

implementation

uses
  rfUtils_unit;

{$R *.dfm}

procedure TPersonalCardForm.btnDeleteClick(Sender: TObject);
begin
  FHeaderTable.Close;
  FHeaderTable.CreateTable;
  FHeaderTable.Open;
  usrg_lblCustomer.Caption := '';
  usrg_lblCardCode.Text := '';
end;

procedure TPersonalCardForm.btnOKClick(Sender: TObject);
begin
 if not FHeaderTable.Eof then
   ModalResult := mrOK
 else
   ModalResult := mrCancel;
end;

procedure TPersonalCardForm.FormCreate(Sender: TObject);
begin
  FHeaderTable := TkbmMemTable.Create(nil);
  FHeaderTable.FieldDefs.Add('ID', ftInteger, 0);
  FHeaderTable.FieldDefs.Add('kindtypekey', ftInteger, 0);
  FHeaderTable.FieldDefs.Add('USR$CODE', ftString, 80);
  FHeaderTable.FieldDefs.Add('USR$NAME', ftString, 80);
  FHeaderTable.FieldDefs.Add('USR$DISABLED', ftInteger, 0);
  FHeaderTable.FieldDefs.Add('USR$NOFISCAL', ftInteger, 0);
  FHeaderTable.CreateTable;
  FHeaderTable.Open;
end;

procedure TPersonalCardForm.FormDestroy(Sender: TObject);
begin
  FHeaderTable.Free;
end;

procedure TPersonalCardForm.usrg_lblCardCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  RemoveWrongPassChar(Key);
  if (Key = #13) then
  begin
    if FFrontBase.GetPersonalCardInfo(FHeaderTable, usrg_lblCardCode.Text) then
    begin
      FHeaderTable.First;
      if not FHeaderTable.Eof then
        usrg_lblCustomer.Caption := FHeaderTable.FieldByName('USR$NAME').AsString
      else begin
        usrg_lblCardCode.Text := '';
        usrg_lblCustomer.Caption := '';
      end;
    end else
    begin
      usrg_lblCardCode.Text := '';
      usrg_lblCustomer.Caption := '';
    end;
  end;
end;

end.
