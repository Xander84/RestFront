unit CashForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, FrontData_Unit, AdvSmoothButton, FiscalRegister_Unit,
  ActnList, Front_DataBase_Unit;

const
  cn_noFR = 'В системе не установлен фискальный регистратор!';

type
  TCashForm = class(TForm)
    pnlMain: TAdvPanel;
    btnStartDay: TAdvSmoothButton;
    btnStartSession: TAdvSmoothButton;
    btnReportWithoutCleaning: TAdvSmoothButton;
    btnReportWithCleaning: TAdvSmoothButton;
    btnEndSession: TAdvSmoothButton;
    btnEndDay: TAdvSmoothButton;
    btnMoneyIN: TAdvSmoothButton;
    btnMoneyOUT: TAdvSmoothButton;
    btnOpenMoney: TAdvSmoothButton;
    alMain: TActionList;
    actStartDay: TAction;
    actStartSession: TAction;
    actReportWithoutCleaning: TAction;
    actReportWithCleaning: TAction;
    actEndSession: TAction;
    actEndDay: TAction;
    actMoneyIN: TAction;
    actMoneyOUT: TAction;
    actOpenMoney: TAction;
    procedure actStartDayExecute(Sender: TObject);
    procedure actStartSessionExecute(Sender: TObject);
    procedure actReportWithoutCleaningExecute(Sender: TObject);
    procedure actReportWithCleaningExecute(Sender: TObject);
    procedure actEndSessionExecute(Sender: TObject);
    procedure actEndDayExecute(Sender: TObject);
    procedure actMoneyINExecute(Sender: TObject);
    procedure actMoneyOUTExecute(Sender: TObject);
    procedure actOpenMoneyExecute(Sender: TObject);
  private
    FFiscalRegiter: TFiscalRegister;

    procedure SetFiscalRegister(const Value: TFiscalRegister);
  public
    property FiscalRegistry: TFiscalRegister read FFiscalRegiter write SetFiscalRegister;
  end;

var
  CashForm: TCashForm;

implementation

{$R *.dfm}

{ TCashForm }

procedure TCashForm.SetFiscalRegister(const Value: TFiscalRegister);
begin
  FFiscalRegiter := Value;
end;

procedure TCashForm.actStartDayExecute(Sender: TObject);
begin
//
end;

procedure TCashForm.actStartSessionExecute(Sender: TObject);
begin
//
end;

procedure TCashForm.actReportWithoutCleaningExecute(Sender: TObject);
begin
//
end;

procedure TCashForm.actReportWithCleaningExecute(Sender: TObject);
begin
//
end;

procedure TCashForm.actEndSessionExecute(Sender: TObject);
begin
  if Assigned(FFiscalRegiter) then
    FFiscalRegiter.EndSession
  else
    MessageBox(Application.Handle, cn_noFR,
     'Внимание', MB_OK or MB_ICONEXCLAMATION);
end;

procedure TCashForm.actEndDayExecute(Sender: TObject);
begin
//
end;

procedure TCashForm.actMoneyINExecute(Sender: TObject);
begin
  if Assigned(FFiscalRegiter) then
    FFiscalRegiter.MoneyIn
  else
    MessageBox(Application.Handle, cn_noFR,
     'Внимание', MB_OK or MB_ICONEXCLAMATION);
end;

procedure TCashForm.actMoneyOUTExecute(Sender: TObject);
begin
  if Assigned(FFiscalRegiter) then
    FFiscalRegiter.MoneyOut
  else
    MessageBox(Application.Handle, cn_noFR,
     'Внимание', MB_OK or MB_ICONEXCLAMATION);
end;

procedure TCashForm.actOpenMoneyExecute(Sender: TObject);
begin
  if Assigned(FFiscalRegiter) then
    FFiscalRegiter.OpenDrawer
  else
    MessageBox(Application.Handle, cn_noFR,
     'Внимание', MB_OK or MB_ICONEXCLAMATION);
end;

end.
