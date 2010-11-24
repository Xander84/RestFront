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
    btnOK: TAdvSmoothButton;
    btnEdit: TAdvSmoothButton;
    DBGrLeft: TDBAdvGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEditClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure DBGrLeftDblClick(Sender: TObject);
  private
    FFrontBase: TFrontBase;
    FReport: TRestReport;
    procedure SetFrontBase(const Value: TFrontBase);
  public
    property FrontBase: TFrontBase read FFrontBase write SetFrontBase;
  end;

var
  EditReport: TEditReport;

implementation

{$R *.dfm}

procedure TEditReport.FormCreate(Sender: TObject);
begin
  MemTable.FieldDefs.Add('ID', ftInteger, 0);
  MemTable.FieldDefs.Add('NAME', ftString, 40);
  MemTable.CreateTable;
  MemTable.Open;

  FReport := TRestReport.Create(Self);
  FReport.FrontBase := FFrontBase;

  SetupAdvGrid(DBGrLeft);
end;

procedure TEditReport.FormShow(Sender: TObject);
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  FFrontBase.GetReportList(MemTable);
  MemTable.First;
end;

procedure TEditReport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FReport.Free;
end;

procedure TEditReport.btnEditClick(Sender: TObject);
begin
  FReport.EditTemplate(MemTable.FieldByName('ID').AsInteger);
end;

procedure TEditReport.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TEditReport.SetFrontBase(const Value: TFrontBase);
begin
  FFrontBase := Value;
  FReport.FrontBase := Value;
end;

procedure TEditReport.DBGrLeftDblClick(Sender: TObject);
begin
  FReport.EditTemplate(MemTable.FieldByName('ID').AsInteger);
end;

end.
