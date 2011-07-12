unit rfContactForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrontForm_Unit, FrontData_Unit, Front_DataBase_Unit, ExtCtrls,
  AdvPanel, DBCtrlsEh, StdCtrls, AdvGroupBox, DB, kbmMemTable, Mask, DBCtrls,
  AdvSmoothTouchKeyBoard, AdvSmoothButton;

type
  TrfContact = class(TBaseFrontForm)
    pnlMain: TAdvPanel;
    AdvTouchKeyBoard: TAdvSmoothTouchKeyBoard;
    Label1: TLabel;
    dbeSurName: TDBEdit;
    Label2: TLabel;
    dbeFirstName: TDBEdit;
    Label3: TLabel;
    dbeMiddleName: TDBEdit;
    dsMain: TDataSource;
    MainTable: TkbmMemTable;
    Label4: TLabel;
    dbeAddress: TDBEdit;
    Label5: TLabel;
    dbePhone: TDBEdit;
    Label6: TLabel;
    dbeHPhone: TDBEdit;
    avdGroupBox: TAdvGroupBox;
    Label7: TLabel;
    dbePassportNumber: TDBEdit;
    dbePassportExpDate: TDBDateTimeEditEh;
    Label8: TLabel;
    Label9: TLabel;
    dbePassportIssDate: TDBDateTimeEditEh;
    Label10: TLabel;
    dbePassportIssuer: TDBEdit;
    dbePassportIssCity: TDBEdit;
    Label11: TLabel;
    pnlRight: TAdvPanel;
    btnOK: TAdvSmoothButton;
    btnCancel: TAdvSmoothButton;
    procedure FormCreate(Sender: TObject);
  private
    FInsertMode: Boolean;
    FUserKey: Integer;
  public
    property InsertMode: Boolean read FInsertMode write FInsertMode;
    property UserKey: Integer read FUserKey write FUserKey;
  end;

var
  rfContact: TrfContact;

implementation

{$R *.dfm}

procedure TrfContact.FormCreate(Sender: TObject);
begin
  FInsertMode := True;
  FUserKey := -1;

  MainTable.FieldDefs.Add('ID', ftInteger, 0);
  MainTable.FieldDefs.Add('FIRSTNAME', ftString, 20);
  MainTable.FieldDefs.Add('SURNAME', ftString, 20);
  MainTable.FieldDefs.Add('MIDDLENAME', ftString, 20);
  MainTable.FieldDefs.Add('ADDRESS', ftString, 60);
  MainTable.FieldDefs.Add('PHONE', ftString, 20);
  MainTable.FieldDefs.Add('HPHONE', ftString, 20);
  MainTable.FieldDefs.Add('PASSPORTNUMBER', ftString, 40);
  MainTable.FieldDefs.Add('PASSPORTISSDATE', ftDate, 0);
  MainTable.FieldDefs.Add('PASSPORTEXPDATE', ftDate, 0);
  MainTable.FieldDefs.Add('PASSPORTISSCITY', ftString, 20);
  MainTable.FieldDefs.Add('PASSPORTISSUER', ftString, 40);
  MainTable.CreateTable;
  MainTable.Open;
end;

end.
