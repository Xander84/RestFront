unit DiscountTypeForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dblookup, DB, kbmMemTable, Front_DataBase_Unit,
  DBCtrls, FrontData_Unit, AdvSmoothButton, ExtCtrls, AdvPanel, BaseFrontForm_Unit;

type
  TDiscountType = class(TBaseFrontForm)
    dsMain: TDataSource;
    pnlMain: TAdvPanel;
    DBLookupComboBox: TDBLookupComboBox;
    btnOK: TAdvSmoothButton;
    btnCancel: TAdvSmoothButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    FFrontBase: TFrontBase;
    FMemTable: TkbmMemTable;
  public
    property FrontBase: TFrontBase read FFrontBase write FFrontBase;
  end;

var
  DiscountType: TDiscountType;

implementation

{$R *.dfm}

procedure TDiscountType.FormCreate(Sender: TObject);
begin
  FMemTable := TkbmMemTable.Create(Self);
  FMemTable.FieldDefs.Add('ID', ftInteger, 0);
  FMemTable.FieldDefs.Add('USR$NAME', ftString, 40);
  FMemTable.CreateTable;
  FMemTable.Open;

  dsMain.DataSet := FMemTable;

  btnOK.Picture := FrontData.RestPictureContainer.FindPicture('tick');
  btnCancel.Picture := FrontData.RestPictureContainer.FindPicture('cross');
end;

procedure TDiscountType.FormShow(Sender: TObject);
begin
  if Assigned(FFrontBase) then
    FFrontBase.GetDiscountList(FMemTable);
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
