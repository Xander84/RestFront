unit DiscountTypeForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dblookup, DB, kbmMemTable, Front_DataBase_Unit,
  DBCtrls, FrontData_Unit, AdvSmoothButton, ExtCtrls, AdvPanel;

type
  TDiscountType = class(TForm)
    memTableDiscount: TkbmMemTable;
    dsMain: TDataSource;
    AdvPanel1: TAdvPanel;
    DBLookupComboBox: TDBLookupComboBox;
    btnOK: TAdvSmoothButton;
    btnCancel: TAdvSmoothButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    FFrontBase: TFrontBase;
    { Private declarations }
  public
    property FrontBase: TFrontBase read FFrontBase write FFrontBase;
  end;

var
  DiscountType: TDiscountType;

implementation

{$R *.dfm}

procedure TDiscountType.FormCreate(Sender: TObject);
begin
  memTableDiscount.FieldDefs.Add('ID', ftInteger, 0);
  memTableDiscount.FieldDefs.Add('USR$NAME', ftString, 40);
  memTableDiscount.CreateTable;
  memTableDiscount.Open;
end;

procedure TDiscountType.FormShow(Sender: TObject);
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');
  FFrontBase.GetDiscountList(memTableDiscount);
end;

procedure TDiscountType.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TDiscountType.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
