unit ReturneyMoneyForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SellParamForm_Unit, ActnList, DB, Grids, AdvObj, BaseGrid, AdvGrid,
  DBAdvGrid, AdvSmoothToggleButton, AdvSmoothButton, AdvSmoothTouchKeyBoard,
  StdCtrls, ExtCtrls, AdvPanel;

type
  TReturnMoneyForm = class(TSellParamForm)
    procedure actPayExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReturnMoneyForm: TReturnMoneyForm;

implementation

uses
  TouchMessageBoxForm_Unit;

{$R *.dfm}

procedure TReturnMoneyForm.actPayExecute(Sender: TObject);
var
  Ev: TAdvSmoothTouchKeyEvent;
begin
  CalcSums;
  if ((Sums.FCardSum + Sums.FCreditSum + Sums.FCashSum) <= 0) then
  begin
    Touch_MessageBox('Внимание', 'Сумма возврата должна быть положительной!', MB_OK, mtWarning);
    exit;
  end;

  FPrinting := True;
  Ev := TouchKeyBoard.OnKeyClick;
  TouchKeyBoard.OnKeyClick := nil;
  DBAdvGrMain.Enabled := False;
  try
    if Assigned(FiscalRegistry) then
    begin
      FiscalRegistry.InitFiscalRegister(FFrontBase.CashCode);
      FiscalRegistry.OpenDrawer;
      if FiscalRegistry.ReturnGoodMoney(Sums) then
        Self.ModalResult := mrOk;
    end else
      Touch_MessageBox('Внимание', 'Для данной рабочей станции не указан кассовый терминал!', MB_OK, mtWarning);
  finally
    FPrinting := False;
    TouchKeyBoard.OnKeyClick := Ev;
    DBAdvGrMain.Enabled := True;
  end;
end;

end.
