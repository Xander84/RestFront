unit EditReportForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrontData_Unit, ExtCtrls, AdvPanel, DB, kbmMemTable,
  Front_DataBase_Unit, Report_Unit, AdvSmoothButton, Grids,
  BaseFrontForm_Unit, AdvObj, BaseGrid, AdvGrid, DBAdvGrid;

type
  TEditReport = class(TBaseFrontForm)
    pnlMain: TAdvPanel;
    MemTable: TkbmMemTable;
    dsMain: TDataSource;
    btnExit: TAdvSmoothButton;
    btnEdit: TAdvSmoothButton;
    DBGrLeft: TDBAdvGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEditClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure DBGrLeftDblClick(Sender: TObject);
  private
    FReport: TRestReport;
  end;

var
  EditReport: TEditReport;

implementation

{$R *.dfm}

procedure TEditReport.FormCreate(Sender: TObject);
begin
  MemTable.FieldDefs.Add('ID', ftInteger, 0);
  MemTable.FieldDefs.Add('NAME', ftString, 40);
  MemTable.FieldDefs.Add('USR$TYPE', ftInteger, 0);
  MemTable.CreateTable;
  MemTable.Open;

  FReport := TRestReport.Create(Self);
  FReport.FrontBase := FFrontBase;

  SetupAdvGrid(DBGrLeft);
end;

procedure TEditReport.FormShow(Sender: TObject);
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  FReport.FrontBase := FFrontBase;
  FFrontBase.GetReportList(MemTable);
  MemTable.First;
end;

procedure TEditReport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FReport.Free;
end;

procedure TEditReport.btnEditClick(Sender: TObject);
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');
  FReport.EditTemplate(MemTable.FieldByName('ID').AsInteger,
    MemTable.FieldByName('USR$TYPE').AsInteger);
end;

procedure TEditReport.btnExitClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TEditReport.DBGrLeftDblClick(Sender: TObject);
begin
  FReport.EditTemplate(MemTable.FieldByName('ID').AsInteger,
    MemTable.FieldByName('USR$TYPE').AsInteger);
end;

end.
