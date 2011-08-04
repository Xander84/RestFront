unit frmReportList_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, BaseFrontForm_Unit, FrontData_Unit,
  AdvSmoothButton, ComCtrls, StdCtrls, Report_Unit, kbmMemTable, DB,
  AdvSmoothEdit, AdvSmoothEditButton, AdvSmoothDatePicker;

type
  TReportForm = class(TBaseFrontForm)
    pnlBottom: TAdvPanel;
    pnlMain: TAdvPanel;
    btnPrintIncomeReport: TAdvSmoothButton;
    btnCheckRegister: TAdvSmoothButton;
    btnPrintBiilsCopy: TAdvSmoothButton;
    btnRealizationReport: TAdvSmoothButton;
    pnlTop: TAdvPanel;
    lblDateBegin: TLabel;
    Label1: TLabel;
    btnOK: TAdvSmoothButton;
    xDateEnd: TAdvSmoothDatePicker;
    xDateBegin: TAdvSmoothDatePicker;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPrintIncomeReportClick(Sender: TObject);
    procedure btnCheckRegisterClick(Sender: TObject);
    procedure btnPrintBiilsCopyClick(Sender: TObject);
    procedure btnRealizationReportClick(Sender: TObject);
  private
    FReport: TRestReport;
    FTable: TkbmMemTable;

    FLastLeftButton : Integer;
    FLastTopButton  : Integer;
    FReportButtonNumber: Integer;

    function GetDateBegin: TDate;
    procedure SetGetDateBegin(const Value: TDate);
    function GetDateEnd: TDate;
    procedure SetGetDateEnd(const Value: TDate);

    procedure AddReportButton;
    procedure ReportButtonOnClick(Sender: TObject);
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

procedure TReportForm.AddReportButton;
var
  FButton: TAdvSmoothButton;
begin
  FButton := TAdvSmoothButton.Create(pnlMain);
  FButton.Appearance.BeginUpdate;
  try
    SetButtonStyle(FButton);
    FButton.Parent := pnlMain;
    FButton.OnClick := ReportButtonOnClick;
    FButton.Name := Format('btnReport%d', [FReportButtonNumber]);
    FButton.Height := btnPrintIncomeReport.Height;
    FButton.Width  := btnPrintIncomeReport.Width;
    FButton.Appearance.Font.Name := cn_FontType;
    FButton.Appearance.Font.Size := cn_ButtonFontSize;

    //проверяем, есть ли ещё место в ряду
    if (FLastLeftButton + btnPrintIncomeReport.Width) > pnlMain.Width then
    begin
      FLastTopButton := FLastTopButton + btnPrintIncomeReport.Height + 15;
      FLastLeftButton := btnPrintIncomeReport.Left;

      FButton.Left := FLastLeftButton;
      FButton.Top  := FLastTopButton;
    end else
    begin
      FButton.Left := FLastLeftButton;
      FButton.Top  := FLastTopButton;
    end;

    FButton.Tag := FTable.FieldByName('ID').AsInteger;
    FButton.Caption := FTable.FieldByName('USR$NAME').AsString;

    FLastLeftButton := FLastLeftButton + btnPrintIncomeReport.Width + 15;
    Inc(FReportButtonNumber);
  finally
    FButton.Appearance.EndUpdate;
  end;
end;

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

  FTable := TkbmMemTable.Create(nil);
  FTable.FieldDefs.Add('ID', ftInteger, 0);
  FTable.FieldDefs.Add('USR$NAME', ftString, 60);
  FTable.CreateTable;
  FTable.Open;

  FLastTopButton := 2 * btnPrintIncomeReport.Top + btnPrintIncomeReport.Height;
  FLastLeftButton := btnPrintIncomeReport.Left;
  FReportButtonNumber := 1;

  xDateEnd.SetComponentStyle(GetFrontStyle);
  xDateBegin.SetComponentStyle(GetFrontStyle);
end;

procedure TReportForm.FormDestroy(Sender: TObject);
begin
  FReport.Free;
  FTable.Free;
end;

procedure TReportForm.FormShow(Sender: TObject);
begin
  FReport := TRestReport.Create(nil);
  FReport.FrontBase := FrontBase;
  //добавление пользовательских отчетов
  FrontBase.GetCustomReportList(FTable);
  FTable.First;
  while not FTable.Eof do
  begin
    AddReportButton;

    FTable.Next;
  end;
end;

function TReportForm.GetDateBegin: TDate;
begin
  Result := xDateBegin.Date;
end;

function TReportForm.GetDateEnd: TDate;
begin
  Result := xDateEnd.Date;
end;

procedure TReportForm.ReportButtonOnClick(Sender: TObject);
begin
  FReport.PrintCustomReport(xDateBegin.Date, xDateEnd.Date,
    TAdvSmoothButton(Sender).Tag);
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
