unit rfReservForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrontForm_Unit, FrontData_Unit, Front_DataBase_Unit, ExtCtrls,
  AdvPanel, AdvSmoothButton, AdvSmoothTouchKeyBoard, StdCtrls, Mask, DBCtrls,
  DB, kbmMemTable, ActnList, ComCtrls, AdvDateTimePicker, AdvDBDateTimePicker,
  rfContactForm_Unit;

type
  TReservForm = class(TBaseFrontForm)
    pnlMain: TAdvPanel;
    btnOK: TAdvSmoothButton;
    btnCancel: TAdvSmoothButton;
    MainTable: TkbmMemTable;
    dsMain: TDataSource;
    Label1: TLabel;
    dbeNumber: TDBEdit;
    AdvTouchKeyBoard: TAdvSmoothTouchKeyBoard;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    acMain: TActionList;
    actOK: TAction;
    dbeReservDate: TAdvDBDateTimePicker;
    dbeReservTime: TAdvDBDateTimePicker;
    dbeDocumentDate: TAdvDBDateTimePicker;
    ClientTable: TkbmMemTable;
    DBLookupComboBox: TDBLookupComboBox;
    dsClient: TDataSource;
    Label5: TLabel;
    btnAddContact: TAdvSmoothButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actOKUpdate(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure btnAddContactClick(Sender: TObject);
  private
    FDocumentKey: Integer;
    FTableKey: Integer;
    procedure SetTableKey(const Value: Integer);
  public
    property DocumentKey: Integer read FDocumentKey write FDocumentKey;
    property TableKey: Integer read FTableKey write SetTableKey;
  end;

var
  ReservForm: TReservForm;

implementation

{$R *.dfm}

procedure TReservForm.actOKExecute(Sender: TObject);
begin
  if DBLookupComboBox.KeyValue <> Null then
  begin
    if MainTable.State = dsBrowse then
      MainTable.Edit;
    MainTable.FieldByName('USR$CONTACTKEY').AsInteger := DBLookupComboBox.KeyValue;
  end;
  if FrontBase.SaveReserv(MainTable) then
    ModalResult := mrOK;
end;

procedure TReservForm.actOKUpdate(Sender: TObject);
begin
  actOK.Enabled := (not MainTable.FieldByName('USR$RESERVDATE').IsNull) and
    (not MainTable.FieldByName('USR$RESERVTIME').IsNull)
end;

procedure TReservForm.btnAddContactClick(Sender: TObject);
var
  FForm: TrfContact;
begin
  FForm := TrfContact.Create(nil);
  try
    FForm.FrontBase := FrontBase;
    FForm.ShowModal;
    if FForm.ModalResult = mrOk then
      FrontBase.GetContactList(ClientTable);
  finally
    FForm.Free;
  end;
end;

procedure TReservForm.FormCreate(Sender: TObject);
begin
  FDocumentKey := -1;
  FTableKey := -1;

  MainTable.FieldDefs.Add('ID', ftInteger, 0);
  MainTable.FieldDefs.Add('USR$TABLEKEY', ftInteger, 0);
  MainTable.FieldDefs.Add('USR$RESERVTIME', ftTime, 0);
  MainTable.FieldDefs.Add('USR$RESERVDATE', ftDate, 0);
  MainTable.FieldDefs.Add('USR$DOCUMENTDATE', ftDate, 0);
  MainTable.FieldDefs.Add('USR$DOCUMENTNUMBER', ftString, 120);
  MainTable.FieldDefs.Add('USR$CONTACTKEY', ftInteger, 0);
  MainTable.CreateTable;
  MainTable.Open;

  ClientTable.FieldDefs.Add('ID', ftInteger, 0);
  ClientTable.FieldDefs.Add('NAME', ftString, 180);
  ClientTable.CreateTable;
  ClientTable.Open;

  btnAddContact.Picture := FrontData.RestPictureContainer.FindPicture('user');
end;

procedure TReservForm.FormShow(Sender: TObject);
begin
  Assert(Assigned(FrontBase), 'FrontBase not assigned');

  FDocumentKey := FrontBase.GetNextID;
  if MainTable.State = dsBrowse then
    MainTable.Edit;
  MainTable.FieldByName('ID').AsInteger := FDocumentKey;
  MainTable.FieldByName('USR$DOCUMENTDATE').AsDateTime := Date;
  MainTable.FieldByName('USR$RESERVDATE').AsDateTime := Date;
  dbeDocumentDate.Date := Date;
  dbeReservDate.Date := Date;

  FrontBase.GetContactList(ClientTable);
end;

procedure TReservForm.SetTableKey(const Value: Integer);
begin
  FTableKey := Value;
  if MainTable.State = dsBrowse then
    MainTable.Edit;
  MainTable.FieldByName('USR$TABLEKEY').AsInteger := FTableKey;
end;

end.
