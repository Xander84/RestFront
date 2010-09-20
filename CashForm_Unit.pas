unit CashForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, FrontData_Unit, AdvSmoothButton, FiscalRegister_Unit,
  ActnList, Front_DataBase_Unit, BaseFrontForm_Unit;

type
  TActionType = (atStartDay, atStartSession, atReportWithoutCleaning,
    atReportWithCleaning, atEndSession, atEndDay, atMoneyIn, atMoneyOut, atOpenMoney);

type
  TCashForm = class(TBaseFrontForm)
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
    procedure actStartDayUpdate(Sender: TObject);
    procedure actStartSessionUpdate(Sender: TObject);
    procedure actEndSessionUpdate(Sender: TObject);
    procedure actEndDayUpdate(Sender: TObject);
  private
    FFiscalRegiter: TFiscalRegister;
    FIsManager: Boolean;

    procedure Run(const Act: TActionType);

    procedure SetFiscalRegister(const Value: TFiscalRegister);
  public
    property FiscalRegistry: TFiscalRegister read FFiscalRegiter write SetFiscalRegister;
    property IsManager: Boolean read FIsManager write FIsManager;
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
  Run(atStartDay);
end;

procedure TCashForm.actStartSessionExecute(Sender: TObject);
begin
  Run(atStartSession);
end;

procedure TCashForm.actReportWithoutCleaningExecute(Sender: TObject);
begin
  Run(atReportWithoutCleaning);
end;

procedure TCashForm.actReportWithCleaningExecute(Sender: TObject);
begin
  Run(atReportWithCleaning);
end;

procedure TCashForm.actEndSessionExecute(Sender: TObject);
begin
  Run(atEndSession);
end;

procedure TCashForm.actEndDayExecute(Sender: TObject);
begin
  Run(atEndDay);
end;

procedure TCashForm.actMoneyINExecute(Sender: TObject);
begin
  Run(atMoneyIn);
end;

procedure TCashForm.actMoneyOUTExecute(Sender: TObject);
begin
  Run(atMoneyOut);
end;

procedure TCashForm.actOpenMoneyExecute(Sender: TObject);
begin
  Run(atOpenMoney);
end;

procedure TCashForm.Run(const Act: TActionType);
begin
  if Assigned(FFiscalRegiter) then
  begin
    case Act of
      atOpenMoney:
        FFiscalRegiter.OpenDrawer;

      atMoneyOut:
        FFiscalRegiter.MoneyOut;

      atMoneyIn:
        FFiscalRegiter.MoneyIn;

      atEndSession:
        FFiscalRegiter.EndSession;

      atReportWithCleaning:
        FFiscalRegiter.PrintReportWithCleaning;

      atReportWithoutCleaning:
        FFiscalRegiter.PrintReportWithOutCleaning;

      atStartDay:
        FFiscalRegiter.StartDay;

      atStartSession:
        FFiscalRegiter.StartSession;

      atEndDay:
        FFiscalRegiter.EndDay;
    else
      Assert(False, 'Операция не поддерживается');
    end;
  end else
    MessageBox(Application.Handle, 'В системе не установлен фискальный регистратор!',
     'Внимание', MB_OK or MB_ICONEXCLAMATION);
end;

procedure TCashForm.actStartDayUpdate(Sender: TObject);
begin
  actStartDay.Enabled := FIsManager;
end;

procedure TCashForm.actStartSessionUpdate(Sender: TObject);
begin
  actStartSession.Enabled := FIsManager;
end;

procedure TCashForm.actEndSessionUpdate(Sender: TObject);
begin
  actEndSession.Enabled := FIsManager;
end;

procedure TCashForm.actEndDayUpdate(Sender: TObject);
begin
  actEndDay.Enabled := FIsManager;
end;

end.
