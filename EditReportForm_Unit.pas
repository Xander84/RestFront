unit EditReportForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrontData_Unit, ExtCtrls, AdvPanel, DB, kbmMemTable, GridsEh,
  DBGridEh, Front_DataBase_Unit, Report_Unit, AdvSmoothButton;

type
  TEditReport = class(TForm)
    pnlMain: TAdvPanel;
    DBGrMain: TDBGridEh;
    MemTable: TkbmMemTable;
    dsMain: TDataSource;
    btnOK: TAdvSmoothButton;
    btnEdit: TAdvSmoothButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrMainDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEditClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
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

  with DBGrMain do
  begin
    Font.Size := cn_FontSize;
    TitleFont.Size := cn_TitleFontSize;
    OddRowColor := cn_OddRowColor;
    EvenRowColor := cn_EvenRowColor;
  end;
end;

procedure TEditReport.FormShow(Sender: TObject);
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  FFrontBase.GetReportList(MemTable);
end;

procedure TEditReport.DBGrMainDblClick(Sender: TObject);
begin
  FReport.EditTemplate(MemTable.FieldByName('ID').AsInteger);
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

end.
