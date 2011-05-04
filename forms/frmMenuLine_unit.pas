unit frmMenuLine_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrontForm_Unit, FrontData_Unit, Front_DataBase_Unit, Grids,
  AdvObj, BaseGrid, AdvGrid, DBAdvGrid, ExtCtrls, AdvPanel, DB, kbmMemTable,
  Generics.Collections, AdvSmoothButton;

type
  TMenuLine = class(TBaseFrontForm)
    pnlMain: TAdvPanel;
    pnlRight: TAdvPanel;
    dbrgMain: TDBAdvGrid;
    Memtable: TkbmMemTable;
    dsMain: TDataSource;
    MemtableID: TIntegerField;
    MemtableDISABLE: TIntegerField;
    MemtableNAME: TStringField;
    MemtableCOST: TFloatField;
    btnOK: TAdvSmoothButton;
    btnCancel: TAdvSmoothButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MemtableAfterEdit(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
  private
    FMenuKey: Integer;
    FChangeList: TList<Integer>;
  public
    property MenuKey: Integer read FMenuKey write FMenuKey;
  end;

var
  MenuLine: TMenuLine;

implementation

{$R *.dfm}

procedure TMenuLine.btnOKClick(Sender: TObject);
begin
  FFrontBase.UpdateMenuStopList(Memtable, FChangeList);
  ModalResult := mrOk;
end;

procedure TMenuLine.FormCreate(Sender: TObject);
begin
  FChangeList := TList<Integer>.Create;
  SetupAdvGrid(dbrgMain);
end;

procedure TMenuLine.FormDestroy(Sender: TObject);
begin
  FChangeList.Free;
end;

procedure TMenuLine.FormShow(Sender: TObject);
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');
  FFrontBase.GetGoodByMenu(Memtable, FMenuKey);
  Memtable.First;
end;

procedure TMenuLine.MemtableAfterEdit(DataSet: TDataSet);
var
  ID: Integer;
begin
  ID := DataSet.FieldByName('ID').AsInteger;
  if not FChangeList.Contains(ID) then
    FChangeList.Add(ID);
end;

end.
