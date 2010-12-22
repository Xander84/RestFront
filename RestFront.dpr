program RestFront;

uses
{$IFDEF VER150}
  FastMM4,
  RtlVclOptimize,
{$ELSE}
  {$WEAKLINKRTTI ON}
  {$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$ENDIF}
  Forms,
  AppEvnts,
  MainForm in 'MainForm.pas' {RestMainForm},
  GuestForm_unit in 'GuestForm_unit.pas' {GuestForm},
  DeleteOrderLine_unit in 'DeleteOrderLine_unit.pas' {DeleteOrderLine},
  OrderNumber_Unit in 'OrderNumber_Unit.pas' {OrderNumber},
  Report_Unit in 'Report_Unit.pas',
  Base_Display_unit in 'Display\Base_Display_unit.pas',
  Modification_Unit in 'Modification_Unit.pas' {ModificationForm},
  DevideForm_Unit in 'DevideForm_Unit.pas' {DevideForm},
  SellParamForm_Unit in 'SellParamForm_Unit.pas' {SellParamForm},
  PayForm_Unit in 'PayForm_Unit.pas' {PayForm},
  SplitOrderForm_Unit in 'SplitOrderForm_Unit.pas' {SplitOrder},
  PercOrCardForm_Unit in 'PercOrCardForm_Unit.pas' {PercOrCard},
  DiscountTypeForm_Unit in 'DiscountTypeForm_Unit.pas' {DiscountType},
  ChooseDiscountCardForm_Unit in 'ChooseDiscountCardForm_Unit.pas' {ChooseDiscountCard},
  FrontData_Unit in 'FrontData_Unit.pas' {FrontData: TDataModule},
  EditReportForm_Unit in 'EditReportForm_Unit.pas' {EditReport},
  FrontLog_Unit in 'FrontLog_Unit.pas',
  FrontApplicationEventsHandler_Unit in 'FrontApplicationEventsHandler_Unit.pas',
  Base_FiscalRegister_unit in 'Base_FiscalRegister_unit.pas',
  FiscalRegister_Unit in 'FiscalRegister_Unit.pas',
  MercFP_Unit in 'Merc\MercFP_Unit.pas',
  CashForm_Unit in 'CashForm_Unit.pas' {CashForm},
  BaseFrontForm_Unit in 'BaseFrontForm_Unit.pas' {BaseFrontForm},
  CardCodeForm_Unit in 'CardCodeForm_Unit.pas' {CardCode},
  ShtrihFR_Unit in 'Shtrih\ShtrihFR_Unit.pas',
  RKCardCodeForm_Unit in 'RKCardCodeForm_Unit.pas' {RKCardCode};

{$R *.res}

var
  ApplicationEventsHandler: TApplicationEventsHandler;
  FApplicationEvents: TApplicationEvents;

begin
  ApplicationEventsHandler := TApplicationEventsHandler.Create;
  try
    FApplicationEvents := TApplicationEvents.Create(Application);
    FApplicationEvents.OnException := ApplicationEventsHandler.ApplicationEventsException;

    Application.Initialize;
    Application.CreateForm(TFrontData, FrontData);
    Application.CreateForm(TRestMainForm, RestMainForm);
    Application.Run;
  finally
    ApplicationEventsHandler.Free;
  end;
end.
