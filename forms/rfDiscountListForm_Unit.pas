unit rfDiscountListForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EditReportForm_Unit, DB, kbmMemTable, Grids, AdvObj, BaseGrid,
  AdvGrid, DBAdvGrid, AdvSmoothButton, ExtCtrls, AdvPanel, FrontData_Unit;

type
  TDiscountList = class(TEditReport)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure DBGrLeftDblClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    FCardCode: String;
  public
    property CardCode: String read FCardCode;
  end;

var
  DiscountList: TDiscountList;

implementation

{$R *.dfm}

procedure TDiscountList.btnEditClick(Sender: TObject);
begin
  if not MemTable.IsEmpty then
    FCardCode := MemTable.FieldByName('USR$CODE').AsString;
  ModalResult := mrOk;
end;

procedure TDiscountList.btnExitClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TDiscountList.DBGrLeftDblClick(Sender: TObject);
begin
  if not MemTable.IsEmpty then
    FCardCode := MemTable.FieldByName('USR$CODE').AsString;
  ModalResult := mrOk;
end;

procedure TDiscountList.FormCreate(Sender: TObject);
begin
  FCardCode := '';

  MemTable.FieldDefs.Add('NAME', ftString, 120);
  MemTable.FieldDefs.Add('USR$CODE', ftString, 32);
  MemTable.FieldDefs.Add('USR$PERCENT', ftString, 20);
  MemTable.CreateTable;
  MemTable.Open;

  SetupAdvGrid(DBGrLeft);
end;

procedure TDiscountList.FormShow(Sender: TObject);
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  FFrontBase.GetDiscountCardList(MemTable);
  MemTable.First;
end;

end.
