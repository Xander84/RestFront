unit frmReportList_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, BaseFrontForm_Unit, FrontData_Unit,
  AdvSmoothButton, ComCtrls, StdCtrls, Report_Unit;

type
  TReportForm = class(TBaseFrontForm)
    pnlBottom: TAdvPanel;
    pnlMain: TAdvPanel;
    btnPrintIncomeReport: TAdvSmoothButton;
    btnCheckRegister: TAdvSmoothButton;
    btnPrintBiilsCopy: TAdvSmoothButton;
    btnRealizationReport: TAdvSmoothButton;
    pnlTop: TAdvPanel;
    xDateBegin: TDateTimePicker;
    lblDateBegin: TLabel;
    Label1: TLabel;
    xDateEnd: TDateTimePicker;
    btnOK: TAdvSmoothButton;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPrintIncomeReportClick(Sender: TObject);
    procedure btnCheckRegisterClick(Sender: TObject);
    procedure btnPrintBiilsCopyClick(Sender: TObject);
    procedure btnRealizationReportClick(Sender: TObject);
  private
    FReport: TRestReport;

    function GetDateBegin: TDate;
    procedure SetGetDateBegin(const Value: TDate);
    function GetDateEnd: TDate;
    procedure SetGetDateEnd(const Value: TDate);
  public
    property DateBegin: TDate read GetDateBegin write SetGetDateBegin;
    property DateEnd: TDate read GetDateEnd write SetGetDateEnd;
  end;

var
  ReportForm: TReportForm;

implementation

{$R *.dfm}

uses
  ChooseEmplFrom_Unit;

{ TReportForm }

procedure TReportForm.btnCheckRegisterClick(Sender: TObject);
var
  FForm: TChooseEmpl;
begin
  FForm := TChooseEmpl.Create(nil);
  try
    FForm.FrontBase := FFrontBase;
    FForm.FillEmployees;
    FForm.ShowModal;
    if FForm.ModalResult = mrOk then
    begin
      FReport.PrintCheckRegisterEmpl(xDateBegin.Date, xDateEnd.Date, FForm.EmplKey,
        FForm.RespKey);
    end;
  finally
    FForm.Free;
  end;
end;

procedure TReportForm.btnPrintBiilsCopyClick(Sender: TObject);
begin
  FReport.PrintCopyChecks(xDateBegin.Date, xDateEnd.Date);
end;

procedure TReportForm.btnPrintIncomeReportClick(Sender: TObject);
begin
  FReport.PrintIncomeReport(xDateBegin.Date, xDateEnd.Date);
end;

procedure TReportForm.btnRealizationReportClick(Sender: TObject);
begin
  FReport.PrintRealization(xDateBegin.Date, xDateEnd.Date);
end;

procedure TReportForm.FormCreate(Sender: TObject);
begin
  btnOK.Picture := FrontData.RestPictureContainer.FindPicture('tick');
end;

procedure TReportForm.FormDestroy(Sender: TObject);
begin
  FReport.Free;
end;

procedure TReportForm.FormShow(Sender: TObject);
begin
  FReport := TRestReport.Create(nil);
  FReport.FrontBase := FrontBase;
end;

function TReportForm.GetDateBegin: TDate;
begin
  Result := xDateBegin.Date;
end;

function TReportForm.GetDateEnd: TDate;
begin
  Result := xDateEnd.Date;
end;

procedure TReportForm.SetGetDateBegin(const Value: TDate);
begin
  xDateBegin.Date := Value;
end;

procedure TReportForm.SetGetDateEnd(const Value: TDate);
begin
  xDateEnd.Date := Value;
end;

end.
