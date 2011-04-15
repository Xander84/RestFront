program RestFront;

{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}

uses
  Forms,
  AppEvnts,
  MidasLib,
  Windows,
  MainForm in 'MainForm.pas' {RestMainForm},
  GuestForm_unit in 'GuestForm_unit.pas' {GuestForm},
  DeleteOrderLine_unit in 'DeleteOrderLine_unit.pas' {DeleteOrderLine},
  OrderNumber_Unit in 'OrderNumber_Unit.pas' {OrderNumber},
  Report_Unit in 'Report\Report_Unit.pas',
  Front_DataBase_Unit in 'Front_DataBase_Unit.pas',
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
  Spark617_Unit in 'Spark617\Spark617_Unit.pas',
  CashForm_Unit in 'CashForm_Unit.pas' {CashForm},
  BaseFrontForm_Unit in 'BaseFrontForm_Unit.pas' {BaseFrontForm},
  CardCodeForm_Unit in 'CardCodeForm_Unit.pas' {CardCode},
  ShtrihFR_Unit in 'Shtrih\ShtrihFR_Unit.pas',
  RKCardCodeForm_Unit in 'RKCardCodeForm_Unit.pas' {RKCardCode},
  AddUserForm_unit in 'AddUserForm_unit.pas' {AddUserForm},
  AdminForm_Unit in 'AdminForm_Unit.pas' {AdminForm},
  gd_MultiStringList in 'Report\gd_MultiStringList.pas',
  obj_QueryList in 'Report\obj_QueryList.pas',
  rp_dlgViewResult_unit in 'Report\rp_dlgViewResult_unit.pas' {dlgViewResult},
  rp_frmGrid_unit in 'Report\rp_frmGrid_unit.pas' {frmGrid: TFrame},
  fs_iQueryListRTTI in 'Report\fs_iQueryListRTTI.pas',
  PersonalCardForm_Unit in 'PersonalCardForm_Unit.pas' {PersonalCardForm},
  TouchMessageBoxForm_Unit in 'TouchMessageBoxForm_Unit.pas' {TTouchMessageBox},
  ReturneyMoneyForm_Unit in 'ReturneyMoneyForm_Unit.pas' {ReturnMoneyForm},
  ChooseEmplFrom_Unit in 'ChooseEmplFrom_Unit.pas' {ChooseEmpl};

{$R *.res}

const
  UniqString = 'RestFrontMutex';

var
  ApplicationEventsHandler: TApplicationEventsHandler;
  FApplicationEvents: TApplicationEvents;
  hMutex: THandle;
begin
  ApplicationEventsHandler := TApplicationEventsHandler.Create;
  try
    FApplicationEvents := TApplicationEvents.Create(Application);
    FApplicationEvents.OnException := ApplicationEventsHandler.ApplicationEventsException;

    hMutex := CreateMutex(nil, False, UniqString);
    if GetLastError = ERROR_ALREADY_EXISTS then
    begin
      CloseHandle(hMutex);
      {$IFNDEF DEBUG}
      Exit;
      {$ENDIF}
    end;

    Application.Initialize;
    Application.Title := 'Ресторан';
    Application.CreateForm(TFrontData, FrontData);
    Application.CreateForm(TRestMainForm, RestMainForm);
    Application.Run;
  finally
    ApplicationEventsHandler.Free;
  end;
end.
