unit MainForm;
{$WARN SYMBOL_PLATFORM OFF}
{$I RestFront.inc}
{ Были сделаны изменения в компоненте TAdvPageControl что бы не отображалась граница }

interface

uses
  Windows, Messages, Variants, Classes, Graphics, Controls, Forms,
  DB, ActnList, ComCtrls, StdCtrls, ExtCtrls, Dialogs, Front_DataBase_Unit,
  Contnrs, kbmMemTable, DBGridEh, GridsEh, FiscalRegister_Unit,
  SplitOrderForm_Unit, Report_Unit, FrontData_Unit, BaseFrontForm_Unit,
  AdvSmoothButton, AdvPanel, AdvPageControl, AdvSmoothTouchKeyBoard,
  FrontLog_Unit, Grids, Menus, AddUserForm_unit, AdminForm_Unit,
  Buttons, RestTable_Unit, dxfDesigner, GestureMgr, AdvObj, AdvMenus, AdvMenuStylers,
  AdvSmoothToggleButton, pngimage, Generics.Collections, rfTableManager_unit,
  rfUser_unit;

const
  btnHeight = 65;
  btnWidth = 140;
  BTN_USERORDER_HEIGHT = 65;
  BTN_USERORDER_WIDTH = 90;
  BTN_USERORDER_MARGIN = 0;

  btnHalfWidth = 102;
  btnLongWidth = 215;
  btnNewLong = 155;
  btnOrderName = 'btnOrder%d';
  btnMenuName = 'btnMenu%d';
  btnGroupName = 'btnGroup%d';
  btnGoodName = 'btnGood%d';
  btnUserName = 'btnUser%d';
  btnUserOrderName = 'btnUserOrder%d';
  btnHallsName = 'btnHall%d';
  cn_dontManagerPermission = 'Данный пользователь не обладает правами менеджера!';

const
  btnFirstTop = 8;
  btnColor = $00E7DCD5;

  {
    Для удаления мерцания компонентов использую
    LockWindowUpdate(TForm(Self).Handle);
    try
    создать и показать
    finally
    LockWindowUpdate(0);
    end;
  }

type
  { TCrackScrollingWinControl = class helper for TScrollingWinControl
    protected
    procedure CreateWnd;
    end; }

  TRestState = (
    rsPass,                    // окно с паролем
    rsOrderMenu,               // окно с заказами
    rsMenuInfo,                // редактирование заказа
    rsManagerPage,             // окно менеджера
    rsManagerChooseOrder,      // окно менеджера для разделения
    rsManagerInfo,             // выручка
    rsKassirInfo,              // окно кассира для оплаты
    rsHallsPage,               // окно просмотра залов
    rsHallEdit);               // редактирование зала

  TRestMainForm = class(TBaseFrontForm)
    pnlMain: TPanel;
    pcMain: TAdvPageControl;
    sbMain: TStatusBar;
    tsPassWord: TAdvTabSheet;
    tsMain: TAdvTabSheet;
    pnlRight: TAdvPanel;
    pnlLeft: TPanel;
    pcOrder: TAdvPageControl;
    tsUserOrder: TAdvTabSheet;
    tsOrderInfo: TAdvTabSheet;
    pnlExtra: TPanel;
    actList: TActionList;
    actPassEnter: TAction;
    dsMain: TDataSource;
    pnlChoose: TPanel;
    pcMenu: TAdvPageControl;
    tsMenu: TAdvTabSheet;
    tsGroup: TAdvTabSheet;
    pcExtraButton: TAdvPageControl;
    tsMainButton: TAdvTabSheet;
    tsFunctionButton: TAdvTabSheet;
    actBackToMenu: TAction;
    Panel1: TAdvPanel;
    actScrollUp: TAction;
    actScrollDown: TAction;
    pnlGoodGroup: TAdvPanel;
    Panel4: TAdvPanel;
    pnlMainGood: TPanel;
    Panel6: TAdvPanel;
    actGoodUp: TAction;
    actGoodDown: TAction;
    actOK: TAction;
    actCancel: TAction;
    actAddQuantity: TAction;
    actRemoveQuantity: TAction;
    actDeletePosition: TAction;
    actModification: TAction;
    actKeyBoard: TAction;
    actCutCheck: TAction;
    actPreCheck: TAction;
    actCancelPreCheck: TAction;
    actDiscount: TAction;
    actPay: TAction;
    pnlMenu: TAdvPanel;
    pnlExtraGoodGroup: TAdvPanel;
    tsManagerPage: TAdvTabSheet;
    pnlManagerTop: TAdvPanel;
    pnlManagerMain: TAdvPanel;
    pnlUsers: TAdvPanel;
    pnlUserOrders: TAdvPanel;
    actUsersUp: TAction;
    actUsersDown: TAction;
    actDevide: TAction;
    pnlManagerBottom: TAdvPanel;
    actUsersLeft: TAction;
    actUsersRight: TAction;
    actExitWindows: TAction;
    actRestartRest: TAction;
    pnlGood: TAdvPanel;
    btnBackToMenu: TAdvSmoothButton;
    btnNewOrder: TAdvSmoothButton;
    TouchKeyBoard: TAdvSmoothPopupTouchKeyBoard;
    btnAddQuantity: TAdvSmoothButton;
    btnRemoveQuantity: TAdvSmoothButton;
    btnDeletePosition: TAdvSmoothButton;
    btnCutCheck: TAdvSmoothButton;
    btnPreCheck: TAdvSmoothButton;
    btnModification: TAdvSmoothButton;
    btnKeyBoard: TAdvSmoothButton;
    btnDiscount: TAdvSmoothButton;
    btnPay: TAdvSmoothButton;
    btnDevide: TAdvSmoothButton;
    btnScrollDown: TAdvSmoothButton;
    btnScrollUp: TAdvSmoothButton;
    btnExitWindows: TAdvSmoothButton;
    btnRestartRest: TAdvSmoothButton;
    btnGoodUp: TAdvSmoothButton;
    btnGoodDown: TAdvSmoothButton;
    actCashForm: TAction;
    btnUsersDown: TAdvSmoothButton;
    btnUsersUp: TAdvSmoothButton;
    btnUserLeft: TAdvSmoothButton;
    btnUserRight: TAdvSmoothButton;
    tsOrderButton: TAdvTabSheet;
    btnCashForm: TAdvSmoothButton;
    btnShowKeyBoard: TAdvSmoothButton;
    actAdminOptions: TAction;
    btnAllChecks: TAdvSmoothButton;
    actAllChecks: TAction;
    tsManagerInfo: TAdvTabSheet;
    tsManagerInfoButton: TAdvTabSheet;
    xDateBegin: TDateTimePicker;
    xDateEnd: TDateTimePicker;
    dsHeaderInfo: TDataSource;
    dsLineInfo: TDataSource;
    pnlManagerInfo: TPanel;
    pnlInfoBottom: TPanel;
    spInfo: TSplitter;
    pnlInfoTop: TPanel;
    DBGrInfoHeader: TDBGridEh;
    DBGrInfoLine: TDBGridEh;
    btnManagerInfo: TAdvSmoothButton;
    actManagerInfo: TAction;
    btnExitManagerInfo: TAdvSmoothButton;
    btnWithPrecheck: TAdvSmoothButton;
    btnWithoutPrecheck: TAdvSmoothButton;
    btnPayed: TAdvSmoothButton;
    btnNotPayed: TAdvSmoothButton;
    btnAllChec: TAdvSmoothButton;
    lblResp: TLabel;
    tsEmpty: TAdvTabSheet;
    actKassirInfo: TAction;
    btnKassa: TAdvSmoothButton;
    btnPrintIncomeReport: TAdvSmoothButton;
    tmrClose: TTimer;
    tsTablePage: TAdvTabSheet;
    sbTable: TScrollBox;
    btnCheckRegister: TAdvSmoothButton;
    btnShowKeyboard2: TAdvSmoothButton;
    btnCancel1: TAdvSmoothButton;
    btnCancel2: TAdvSmoothButton;
    tsHalls: TAdvTabSheet;
    pnlHalls: TAdvPanel;
    dxfDesigner: TdxfDesigner;
    btnAdminOptions: TAdvSmoothButton;
    gmFront: TGestureManager;
    btnOK2: TAdvSmoothButton;
    tablePopupMenu: TAdvPopupMenu;
    MenuOfficeStyler: TAdvMenuOfficeStyler;
    DBGrMain: TDBGridEh;
    tsTablesDesigner: TAdvTabSheet;
    pnlDesignerTables: TAdvPanel;
    tmrTables: TTimer;
    btnPrecheckOrders: TAdvSmoothToggleButton;
    btnWithOutPrecheckOrders: TAdvSmoothToggleButton;
    mainTouchKeyBoard: TAdvSmoothTouchKeyBoard;
    tmrTime: TTimer;
    imgHallBackground: TImage;
    btnPrintCopyCheck: TAdvSmoothButton;
    btnReturnGoodSum: TAdvSmoothButton;
    actReturnGoodSum: TAction;
    btnOK: TAdvSmoothButton;
    btnCancel3: TAdvSmoothButton;
    pnlOrderLeft: TPanel;
    pnlOrderInfo: TAdvPanel;
    lblOrderInfoUserName: TLabel;
    lblOrderInfoTableNumberLabel: TLabel;
    lblOrderInfoTableNumber: TLabel;
    actSwapWaiter: TAction;
    btnUnblockTable: TAdvSmoothToggleButton;
    grScrollBar: TScrollBar;
    btnPrintBiilsCopy: TAdvSmoothButton;
    Action1: TAction;
    actSwapTable: TAction;
    btnRealizationReport: TAdvSmoothButton;
    pnlPassword: TGridPanel;
    edPassword: TEdit;
    btnOKPass: TAdvSmoothButton;
    btnSwapWaiter: TAdvSmoothButton;
    actUnblockTable: TAction;
    btnSwapTable: TAdvSmoothToggleButton;

    // Проверка введёного пароля
    procedure actPassEnterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure actBackToMenuExecute(Sender: TObject);
    procedure actScrollDownExecute(Sender: TObject);
    procedure actScrollUpExecute(Sender: TObject);
    procedure actGoodUpExecute(Sender: TObject);
    procedure actGoodDownExecute(Sender: TObject);
    procedure btnNewOrderClick(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actAddQuantityExecute(Sender: TObject);
    procedure actRemoveQuantityExecute(Sender: TObject);
    procedure actDeletePositionExecute(Sender: TObject);
    procedure actModificationExecute(Sender: TObject);
    procedure actKeyBoardExecute(Sender: TObject);
    procedure actCutCheckExecute(Sender: TObject);
    procedure actPreCheckExecute(Sender: TObject);
    procedure actCancelPreCheckExecute(Sender: TObject);
    procedure actDiscountExecute(Sender: TObject);
    procedure actPayExecute(Sender: TObject);
    procedure actUsersUpExecute(Sender: TObject);
    procedure actUsersDownExecute(Sender: TObject);
    procedure actDevideExecute(Sender: TObject);
    procedure DBGridEh2Columns0GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure btnPredCheckClick(Sender: TObject);
    procedure actUsersLeftExecute(Sender: TObject);
    procedure actUsersRightExecute(Sender: TObject);
    procedure actExitWindowsExecute(Sender: TObject);
    procedure actRestartRestExecute(Sender: TObject);
    procedure actModificationUpdate(Sender: TObject);
    procedure actAddQuantityUpdate(Sender: TObject);
    procedure actRemoveQuantityUpdate(Sender: TObject);
    procedure actDeletePositionUpdate(Sender: TObject);
    procedure actCutCheckUpdate(Sender: TObject);
    procedure actPreCheckUpdate(Sender: TObject);
    procedure actDiscountUpdate(Sender: TObject);
    procedure actDevideUpdate(Sender: TObject);
    procedure actPayUpdate(Sender: TObject);
    procedure actCashFormExecute(Sender: TObject);
    procedure actGoodUpUpdate(Sender: TObject);
    procedure actGoodDownUpdate(Sender: TObject);
    procedure actScrollUpUpdate(Sender: TObject);
    procedure actScrollDownUpdate(Sender: TObject);
    procedure actAdminOptionsExecute(Sender: TObject);
    procedure actAllChecksExecute(Sender: TObject);
    procedure actAllChecksUpdate(Sender: TObject);
    procedure actManagerInfoExecute(Sender: TObject);
    procedure actManagerInfoUpdate(Sender: TObject);
    procedure btnExitManagerInfoClick(Sender: TObject);
    procedure DBGrInfoLineAdvDrawDataCell(Sender: TCustomDBGridEh; Cell, AreaCell: TGridCoord; Column: TColumnEh; const ARect: TRect;
      var Params: TColCellParamsEh; var Processed: Boolean);
    procedure btnAllChecClick(Sender: TObject);
    procedure btnWithPrecheckClick(Sender: TObject);
    procedure btnWithoutPrecheckClick(Sender: TObject);
    procedure btnPayedClick(Sender: TObject);
    procedure btnNotPayedClick(Sender: TObject);
    procedure DBGrInfoHeaderAdvDrawDataCell(Sender: TCustomDBGridEh; Cell, AreaCell: TGridCoord; Column: TColumnEh; const ARect: TRect;
      var Params: TColCellParamsEh; var Processed: Boolean);
    procedure actKassirInfoExecute(Sender: TObject);
    procedure actKassirInfoUpdate(Sender: TObject);
    procedure btnPrintIncomeReportClick(Sender: TObject);
    procedure tmrCloseTimer(Sender: TObject);
    procedure btnCheckRegisterClick(Sender: TObject);
    procedure tablePopupMenuPopup(Sender: TObject);
    procedure actCashFormUpdate(Sender: TObject);
    procedure sbTableGesture(Sender: TObject; const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure tmrTablesTimer(Sender: TObject);
    procedure btnPrecheckOrdersClick(Sender: TObject);
    procedure btnWithOutPrecheckOrdersClick(Sender: TObject);
    procedure DBGrMainColumns1GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure DBGrMainColumns2GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure DBGrMainColumns3GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure tmrTimeTimer(Sender: TObject);
    procedure btnPrintCopyCheckClick(Sender: TObject);
    procedure actReturnGoodSumExecute(Sender: TObject);
    procedure actSwapWaiterExecute(Sender: TObject);
    procedure actSwapWaiterUpdate(Sender: TObject);
    procedure actSwapTableExecute(Sender: TObject);
    procedure actSwapTableUpdate(Sender: TObject);
    procedure btnPrintBiilsCopyClick(Sender: TObject);
    procedure btnRealizationReportClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actUnblockTableUpdate(Sender: TObject);
  private
    // Компонент обращения к БД
    FFrontBase: TFrontBase;
    // Фискальный
    FFiscal: TFiscalRegister;
    // FR4
    FReport: TRestReport;
    FLogManager: TLogManager;
    // Наборы данных
    FOrderDataSet: TkbmMemTable;
    FMenuDataSet: TkbmMemTable;
    FGroupDataSet: TkbmMemTable;
    FGoodDataSet: TkbmMemTable;
    FHeaderTable: TkbmMemTable;
    FLineTable: TkbmMemTable;
    FHeaderInfoTable: TkbmMemTable;
    FLineInfoTable: TkbmMemTable;
    FHallsTable: TkbmMemTable;
    FTablesInfoTable: TkbmMemTable;
    // для связи позиция - модификатор
    FMasterDataSource: TDataSource;
    FModificationDataSet: TkbmMemTable;
    // ID для вставляемых позиций
    FLineID: Integer;
    //
    FWithPreCheck: Boolean;
    //
    FLastLeftButton: Integer;
    FLastTopButton: Integer;
    FOrderButtonNumber: Integer;
    //
    FHallFisrtTop: Integer;
    FHallLastTop: Integer;
    FHallButtonNumber: Integer;
    //
    FTableChooseTop: Integer;
    FTableChooseLastTop: Integer;
    //
    FMenuFirstTop: Integer;
    FMenuLastTop: Integer;
    FMenuLastLeftButton: Integer;
    FMenuButtonNumber: Integer;
    FMenuButtonCount: Integer;
    //
    FGroupFirstTop: Integer;
    FGroupLastLeftButton: Integer;
    FGroupLastTop: Integer;
    FGroupButtonNumber: Integer;
    //
    FGoodFirstTop: Integer;
    FGoodLastLeftButton: Integer;
    FGoodLastTop: Integer;
    FGoodButtonNumber: Integer;
    //
    FUserFirstTop: Integer;
    FUserLastLeftButton: Integer;
    FUserLastTop: Integer;
    FUserButtonNumber: Integer;
    //
    FUserOrderFirstTop: Integer;
    FUserOrderLastLeftButton: Integer;
    FUserOrderLastTop: Integer;
    FUserOrderButtonNumber: Integer;
    FMaxUserOrderButtonLeft: Integer;
    { TODO : Переделать не через FPayed }
    FPayed: Boolean;
    // Список объектов для уничтожения компонентов
    FMenuButtonList: TObjectList;
    FOrderButtonList: TObjectList;
    FGroupButtonList: TObjectList;
    FGoodButtonList: TObjectList;
    FUsersButtonList: TObjectList;
    FUsersOrderButtonList: TObjectList;

    FTableManager: TrfTableManager;

    FHallButtonList: TObjectList;
    FChooseTableButtonList: TObjectList;
    // режим редактирования столов
    FEditMode: Boolean;
    // Текущее выбраное меню
    FMenuKey: Integer;
    FActiveHallButton: String;
    FActiveHallKey: Integer;
    // Указатель на нажатую кнопку
    FSelectedButton: TObject;
    FMenuSelectedButton: TObject;
    { Переменная используется в режиме смена столов, для хранения стола с которого перемещается заказ }
    FSwapTableFrom: TRestTable;
    { Разница во времени между сервером и клиентом }
    FServerTimeLag: Extended;

    FRestFormState: TRestState;
    FPrevFormState: TRestState;
    FBaseFormState: TRestState;
    // Режим только просмотра (для кассира)
    FViewMode: Boolean;

    FSplitForm: TSplitOrder;

    // Создание первичных наборов данных
    procedure CreateDataSets;
    // режим заказов
    procedure CreateOrderButtonList;
    procedure AddOrderButton;
    procedure RemoveOrderButton;
    procedure CreateNewOrder(const TableKey: Integer);
    procedure CreateNewTableOrder(const Table: TRestTable);
    procedure OrderButtonOnClick(Sender: TObject);
    procedure SplitButtonOnClick(Sender: TObject);
    // режим залов
    procedure CreateHallButtonList;
    procedure AddHallButton;
    procedure RemoveHallButton;
    // Действия перед установкой нового режима окна
    procedure BeforeRestFormStateChanged;

    procedure SwapTable(const ATableFrom, ATableTo: TRestTable);
    procedure SetCloseTimerActive(const AIsActive: Boolean);
    { Получить время и дату поправленные с учетом разницы времени между сервером и клиентом }
    function GetServerDateTime: TDateTime;

    // Инициализация фона зала и столов
    procedure CreateHall(const HallKey: Integer);
    // Удаление фона зала и столов
    procedure EraseHall;

    procedure HallButtonOnClick(Sender: TObject);
    procedure ChooseTableOnClick(Sender: TObject);
    procedure RemoveChooseTable;
    procedure PopItemOnClick(Sender: TObject);
    procedure TableButtonOnClick(Sender: TObject);
    procedure SaveTablePositions;
    procedure AddChooseTables(const HallKey: Integer);
    // меню
    procedure CreateMenuButtonList;
    procedure AddMenuButton;
    procedure RemoveMenuButton;
    procedure MenuButtonOnClick(Sender: TObject);
    // группы товаров
    procedure CreateGroupButtonList(const MenuKey: Integer);
    procedure AddGroupButton;
    procedure RemoveGroupButton;
    procedure AddPopularGoods;
    procedure GroupButtonOnClick(Sender: TObject);
    // товары
    procedure CreateGoodButtonList(const MenuKey: Integer; const GroupKey: Integer);
    procedure AddGoodButton;
    procedure RemoveGoodButton;
    procedure GoodButtonOnClick(Sender: TObject);

    procedure CreateUserList;
    procedure CreateManagerPage;
    procedure CreateKassirPage;
    procedure AddUserButton(const AUser: TrfUser);
    procedure RemoveUserButton;
    procedure AddUserOrderButton(const MemTable: TkbmMemTable);
    procedure RemoveUserOrderButton;

    procedure SaveCheck;
    procedure SaveAllOrder;

    function GetCurrentUserInfo: TLogUserInfo;
    function GetUserInfo(const UserInfo: TUserInfo): TLogUserInfo;
    function GetCurrentOrderInfo: TLogOrderInfo;
    // Скроллирование
    procedure ScrollControl(const FControl: TWinControl; const Down: Boolean; var Top: Integer; var Bottom: Integer);
    procedure VertScrollControl(const FControl: TWinControl; const ToRight: Boolean; var Left: Integer; var Right: Integer);
    // FormState
    procedure SetFormState(const Value: TRestState);
    property RestFormState: TRestState read FRestFormState write SetFormState;
    procedure AfterLoadManagerInfo;
    // Display
    procedure WritePos(DataSet: TDataSet);
    procedure ClearDisplay;
    // DataSets
    procedure DeleteOrderLine(var Amount: Currency; const CauseKey: Integer);
    // procedure OnFilterLine(DataSet: TDataSet; var Accept: Boolean);
    procedure OnBeforePostLine(DataSet: TDataSet);
    procedure OnAfterPostHeader(DataSet: TDataSet);
    procedure OnAfterPost(DataSet: TDataSet);
    /// !!!!
    procedure OnAfterDelete(DataSet: TDataSet);
  public
    procedure AfterConstruction; override;
  end;

var
  RestMainForm: TRestMainForm;

implementation

uses
  SysUtils, GuestForm_unit, DeleteOrderLine_unit, OrderNumber_Unit,
  Modification_Unit, DevideForm_Unit, CommCtrl,
  SellParamForm_Unit, PercOrCardForm_Unit, DiscountTypeForm_Unit,
  ChooseDiscountCardForm_Unit, EditReportForm_Unit,
  GDIPPictureContainer, IB, GDIPFill, CashForm_Unit, IBSQL,
  TouchMessageBoxForm_Unit, Base_FiscalRegister_unit,
  ReturneyMoneyForm_Unit, frmSwapOrder_unit, rfOrder_unit, ChooseEmplFrom_Unit,
  rfChooseForm_Unit, rfUtils_unit;

{$R *.dfm}

{ TRestMainForm }

procedure TRestMainForm.actPassEnterExecute(Sender: TObject);
begin
  // Проверка введёного пароля
  if FFrontBase.LogIn(edPassword.Text) then
  begin
    if (not FFrontBase.CheckForSession) and not(FFrontBase.IsMainCash and ((FFrontBase.UserKey and FFrontBase.Options.KassaGroupMask) <> 0)
      ) then
      exit;

    FLogManager.DoSimpleLog(GetCurrentUserInfo, ev_LogIn);
    if Assigned(TouchKeyBoard) then
      TouchKeyBoard.Hide;
    if FFrontBase.Options.UseHalls then
    begin
      FFrontBase.GetHallsInfo(FHallsTable);
      if FHallsTable.RecordCount > 0 then
        RestFormState := rsHallsPage
      else
        RestFormState := rsOrderMenu;
    end
    else
      RestFormState := rsOrderMenu;
    FBaseFormState := FRestFormState;
  end
  else
  begin
    Touch_MessageBox('Внимание', 'Неверный пароль', MB_OK, mtWarning);
    if edPassword.CanFocus then
      edPassword.SetFocus;
    edPassword.Text := '';
    FLogManager.DoSimpleEvent(ev_invalidPass);
  end;
end;

procedure TRestMainForm.FormCreate(Sender: TObject);
begin
  SetupGrid(DBGrMain);
  SetupGrid(DBGrInfoHeader);
  SetupGrid(DBGrInfoLine);
{$IFDEF DEBUG}
  Height := cn_Height;
  Width := cn_Width;
  AdjustResolution(Self);
{$ENDIF}
  // восстанавливаем начальные размеры
  btnNewOrder.Top := btnFirstTop;
{$IFDEF NEW_TABCONTROL}
  btnNewOrder.Left := btnFirstTop + 6;
{$ELSE}
  btnNewOrder.Left := btnFirstTop;
{$ENDIF}
  btnNewOrder.Width := btnWidth;
  btnNewOrder.Height := btnHeight;

  // Скрываем заголовки табов
  tsMain.TabVisible := False;
  tsPassWord.TabVisible := False;
  tsMainButton.TabVisible := False;
  tsFunctionButton.TabVisible := False;
  tsOrderButton.TabVisible := False;
  tsMenu.TabVisible := False;
  tsManagerPage.TabVisible := False;
  tsTablePage.TabVisible := False;
  tsEmpty.TabVisible := False;
  tsGroup.TabVisible := False;
  tsOrderInfo.TabVisible := False;
  tsUserOrder.TabVisible := False;
  tsManagerInfo.TabVisible := False;
  tsManagerInfoButton.TabVisible := False;
  tsHalls.TabVisible := False;
  tsTablesDesigner.TabVisible := False;

  // начальные даные
  FMenuButtonList := TObjectList.Create;
  FOrderButtonList := TObjectList.Create;
  FGoodButtonList := TObjectList.Create;
  FGroupButtonList := TObjectList.Create;
  FUsersButtonList := TObjectList.Create;
  FUsersOrderButtonList := TObjectList.Create;
  FHallButtonList := TObjectList.Create;
  FChooseTableButtonList := TObjectList.Create;

  FEditMode := False;
  FWithPreCheck := True;
  FActiveHallButton := '';

  CreateDataSets;
  RestFormState := rsPass;
  try
    FFrontBase := TFrontBase.Create;
  except
    on E: Exception do
    begin
      if (E is EIBClientError) and (EIBClientError(E).SQLCode = Ord(ibxeDatabaseNameMissing)) then
        Touch_MessageBox('Внимание', 'Путь к базе данных указан неверно', MB_OK, mtError)
      else
        Touch_MessageBox('Внимание', 'Ошибка при подключении ' + E.Message, MB_OK, mtError);
      FFrontBase.Free;
      Application.Terminate;
    end;
  end;
  FFiscal := TFiscalRegister.Create;
  FFiscal.FrontBase := FFrontBase;

  FReport := TRestReport.Create(Self);
  FReport.FrontBase := FFrontBase;

  FLogManager := TLogManager.Create;
  FLogManager.FrontBase := FFrontBase;
  FLogManager.DatabaseName := cn_LodDataBasePath;
  FLogManager.DoSimpleEvent(ev_StartProgram);

  btnGoodUp.Picture := FrontData.RestPictureContainer.FindPicture('Up');
  btnScrollUp.Picture := FrontData.RestPictureContainer.FindPicture('Up');
  btnGoodDown.Picture := FrontData.RestPictureContainer.FindPicture('Down');
  btnScrollDown.Picture := FrontData.RestPictureContainer.FindPicture('Down');
  btnUsersDown.Picture := FrontData.RestPictureContainer.FindPicture('Down');
  btnUsersUp.Picture := FrontData.RestPictureContainer.FindPicture('Up');
  btnUserLeft.Picture := FrontData.RestPictureContainer.FindPicture('Left');
  btnUserRight.Picture := FrontData.RestPictureContainer.FindPicture('Right');

  btnAddQuantity.Picture := FrontData.RestPictureContainer.FindPicture('add');
  btnRemoveQuantity.Picture := FrontData.RestPictureContainer.FindPicture('delete');
  btnDeletePosition.Picture := FrontData.RestPictureContainer.FindPicture('cancel');
  btnCutCheck.Picture := FrontData.RestPictureContainer.FindPicture('document_break');
  btnPreCheck.Picture := FrontData.RestPictureContainer.FindPicture('document_info');
  btnModification.Picture := FrontData.RestPictureContainer.FindPicture('application_form_edit');
  btnKeyBoard.Picture := FrontData.RestPictureContainer.FindPicture('keyboard');
  btnDiscount.Picture := FrontData.RestPictureContainer.FindPicture('percent');
  btnPay.Picture := FrontData.RestPictureContainer.FindPicture('money');
  btnDevide.Picture := FrontData.RestPictureContainer.FindPicture('decimal');
  btnOK.Picture := FrontData.RestPictureContainer.FindPicture('tick');
  btnCancel3.Picture := FrontData.RestPictureContainer.FindPicture('cross');

  btnExitWindows.Picture := FrontData.RestPictureContainer.FindPicture('exit');
  btnRestartRest.Picture := FrontData.RestPictureContainer.FindPicture('update');
  btnShowKeyBoard.Picture := FrontData.RestPictureContainer.FindPicture('keyboard');
  btnAdminOptions.Picture := FrontData.RestPictureContainer.FindPicture('user');

  btnShowKeyboard2.Picture := FrontData.RestPictureContainer.FindPicture('keyboard');
  btnOK2.Picture := FrontData.RestPictureContainer.FindPicture('tick');
  btnCancel1.Picture := FrontData.RestPictureContainer.FindPicture('cross');

  btnCashForm.Picture := FrontData.RestPictureContainer.FindPicture('cash_register');
  btnManagerInfo.Picture := FrontData.RestPictureContainer.FindPicture('coins');
  btnKassa.Picture := FrontData.RestPictureContainer.FindPicture('master_card');
  btnCancel2.Picture := FrontData.RestPictureContainer.FindPicture('cross');

  btnExitManagerInfo.Picture := FrontData.RestPictureContainer.FindPicture('cross');
  btnOKPass.Picture := FrontData.RestPictureContainer.FindPicture('tick');

  MenuOfficeStyler.SetComponentStyle(GetFrontStyle);
  mainTouchKeyBoard.SetComponentStyle(GetFrontStyle);
{$IFNDEF DEBUG}
  if Screen.Width > 1024 then
  begin
    pnlRight.Width := pnlRight.Width * 2;

    btnScrollDown.Width := btnScrollDown.Width * 2;
    btnScrollUp.Left := btnScrollUp.Left * 2;
    btnScrollUp.Width := btnScrollUp.Width * 2;
  end;
{$ENDIF}
  if Screen.Height > 768 then
  begin
    pnlMainGood.Height := pnlMainGood.Height + btnHeight;
  end;

  // Менеджер столов зала
  FTableManager := TrfTableManager.Create(FFrontBase, sbTable);
  FTableManager.TableButtonOnClick := TableButtonOnClick;
  FTableManager.TableButtonPopupMenu := tablePopupMenu;

  FActiveHallKey := -1;
  // Получим разницу локального времени и серверного
  FServerTimeLag := FFrontBase.GetServerDateTime - Now;
end;

procedure TRestMainForm.FormDestroy(Sender: TObject);
begin
  FLogManager.DoSimpleEvent(ev_TerminateProgram);
  if Assigned(FFrontBase) then
    FFrontBase.Free;
  if Assigned(FFiscal) then
    FFiscal.Free;
  if Assigned(FSplitForm) then
    FSplitForm.Free;

  FReport.Free;
  FLogManager.Free;
  // инчае будет AV при уничтожения грида
  if Assigned(dsMain.DataSet) then
    dsMain.DataSet := nil;
  if Assigned(dsHeaderInfo.DataSet) then
    dsHeaderInfo.DataSet := nil;
  if Assigned(dsLineInfo.DataSet) then
    dsLineInfo.DataSet := nil;

  FreeAndNil(FOrderDataSet);
  FreeAndNil(FMenuDataSet);
  FreeAndNil(FGoodDataSet);
  FreeAndNil(FGroupDataSet);

  FreeAndNil(FModificationDataSet);
  FreeAndNil(FMasterDataSource);
  FreeAndNil(FLineTable);
  FreeAndNil(FHeaderTable);

  if Assigned(FHeaderInfoTable) then
    FreeAndNil(FHeaderInfoTable);
  if Assigned(FLineInfoTable) then
    FreeAndNil(FLineInfoTable);
  if Assigned(FHallsTable) then
    FHallsTable.Free;
  if Assigned(FTablesInfoTable) then
    FTablesInfoTable.Free;

  FMenuButtonList.Free;
  FOrderButtonList.Free;
  FGroupButtonList.Free;
  FGoodButtonList.Free;
  FUsersButtonList.Free;
  FUsersOrderButtonList.Free;
  FHallButtonList.Free;
  FChooseTableButtonList.Free;

  // Менеджер столов зала
  FTableManager.Free;
end;

procedure TRestMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (RestFormState = rsPass) and (not edPassword.Focused) and
    (edPassword.CanFocus) then
  begin
    edPassword.SetFocus;
    PostMessage(edPassword.Handle, WM_KEYUP, Key, 0);
  end;
end;

procedure TRestMainForm.edPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  RemoveWrongPassChar(Key);
  if Key = #13 then
    actPassEnterExecute(Sender)
  else
    inherited;
end;

procedure TRestMainForm.EraseHall;
begin
  // Удалим фон зала
  imgHallBackground.Picture := nil;
  // Удалим столы
  FTableManager.ClearTables;
  // Укажем что ни один зал не выбран, чтобы при следующем входе зал отрисовался заново
  FActiveHallKey := -1;
end;

procedure TRestMainForm.CreateDataSets;
begin
  FOrderDataSet := TkbmMemTable.Create(nil);
  FOrderDataSet.FieldDefs.Add('TableName', ftString, 20);
  FOrderDataSet.FieldDefs.Add('GuestNumbers', ftInteger, 0);
  FOrderDataSet.FieldDefs.Add('OpenTime', ftDateTime, 0);
  FOrderDataSet.FieldDefs.Add('Summ', ftCurrency, 0);
  FOrderDataSet.FieldDefs.Add('Status', ftInteger, 0);
  FOrderDataSet.FieldDefs.Add('ID', ftInteger, 0);
  FOrderDataSet.FieldDefs.Add('ISLOCKED', ftInteger, 0);
  FOrderDataSet.FieldDefs.Add('USR$COMPUTERNAME', ftString, 20);
  FOrderDataSet.CreateTable;
  FOrderDataSet.Open;

  FMenuDataSet := TkbmMemTable.Create(nil);
  FMenuDataSet.FieldDefs.Add('ID', ftInteger, 0);
  FMenuDataSet.FieldDefs.Add('NAME', ftString, 60);
  FMenuDataSet.CreateTable;
  FMenuDataSet.Open;

  FGroupDataSet := TkbmMemTable.Create(nil);
  FGroupDataSet.FieldDefs.Add('ID', ftInteger, 0);
  FGroupDataSet.FieldDefs.Add('NAME', ftString, 60);
  FGroupDataSet.FieldDefs.Add('ALIAS', ftString, 16);
  FGroupDataSet.CreateTable;
  FGroupDataSet.Open;

  FGoodDataSet := TkbmMemTable.Create(nil);
  FGoodDataSet.FieldDefs.Add('ID', ftInteger, 0);
  FGoodDataSet.FieldDefs.Add('NAME', ftString, 60);
  FGoodDataSet.FieldDefs.Add('ALIAS', ftString, 16);
  FGoodDataSet.FieldDefs.Add('COST', ftCurrency, 0);
  FGoodDataSet.FieldDefs.Add('MODIFYGROUPKEY', ftInteger, 0);
  FGoodDataSet.FieldDefs.Add('ISNEEDMODIFY', ftInteger, 0);
  FGoodDataSet.FieldDefs.Add('BEDIVIDE', ftInteger, 0);
  FGoodDataSet.FieldDefs.Add('PRNGROUPKEY', ftInteger, 0);
  FGoodDataSet.CreateTable;
  FGoodDataSet.Open;

  FHallsTable := TkbmMemTable.Create(nil);
  FHallsTable.FieldDefs.Add('ID', ftInteger, 0);
  FHallsTable.FieldDefs.Add('USR$NAME', ftString, 80);
  FHallsTable.FieldDefs.Add('USR$LENGTH', ftFloat, 0);
  FHallsTable.FieldDefs.Add('USR$WIDTH', ftFloat, 0);
  FHallsTable.FieldDefs.Add('USR$RESTAURANTKEY', ftInteger, 0);
  FHallsTable.CreateTable;
  FHallsTable.Open;

  FTablesInfoTable := TkbmMemTable.Create(nil);
  FTablesInfoTable.FieldDefs.Add('ID', ftInteger, 0);
  FTablesInfoTable.FieldDefs.Add('USR$NUMBER', ftString, 80);
  FTablesInfoTable.FieldDefs.Add('USR$POSX', ftFloat, 0);
  FTablesInfoTable.FieldDefs.Add('USR$POSY', ftFloat, 0);
  FTablesInfoTable.FieldDefs.Add('USR$WIDTH', ftFloat, 0);
  FTablesInfoTable.FieldDefs.Add('USR$LENGTH', ftFloat, 0);
  FTablesInfoTable.FieldDefs.Add('USR$HALLKEY', ftInteger, 0);
  FTablesInfoTable.FieldDefs.Add('USR$TYPE', ftInteger, 0);
  FTablesInfoTable.FieldDefs.Add('USR$MAINTABLEKEY', ftInteger, 0);
  FTablesInfoTable.FieldDefs.Add('USR$RESPKEY', ftInteger, 0);
  FTablesInfoTable.FieldDefs.Add('ORDERKEY', ftInteger, 0);
  FTablesInfoTable.FieldDefs.Add('ISLOCKED', ftInteger, 0);
  FTablesInfoTable.FieldDefs.Add('USR$COMPUTERNAME', ftString, 20);
  FTablesInfoTable.FieldDefs.Add('NUMBER', ftString, 20);
  FTablesInfoTable.FieldDefs.Add('RESPNAME', ftString, 60);
  FTablesInfoTable.CreateTable;
  FTablesInfoTable.Open;

  // шапка и позиция
  GetHeaderTable(FHeaderTable);
  FHeaderTable.AfterPost := OnAfterPostHeader;
  FHeaderTable.Open;

  GetLineTable(FLineTable);
  // FLineTable.OnFilterRecord := OnFilterLine;
  FLineTable.BeforePost := OnBeforePostLine;
  FLineTable.AfterDelete := OnAfterDelete;
  // FLineTable.Filter := '([usr$quantity] > 0) AND ([usr$causedeletekey] IS NULL) ';
  // FLineTable.Filtered := True;
  FLineTable.Open;

  FMasterDataSource := TDataSource.Create(nil);
  FMasterDataSource.DataSet := FLineTable;

  GetModificationTable(FModificationDataSet);
  FModificationDataSet.Common.EnableVersioning := True;
  FModificationDataSet.Common.VersioningMode := mtvmAllSinceCheckPoint;
  FModificationDataSet.MasterSource := FMasterDataSource;
  FModificationDataSet.MasterFields := 'LINEKEY';
  FModificationDataSet.DetailFields := 'MASTERKEY';
  FModificationDataSet.AfterPost := OnAfterPost;
  /// !!!!
  FModificationDataSet.Open;
end;

procedure TRestMainForm.AddOrderButton;
var
  FButton: TAdvSmoothButton;
begin
  // Создание кнопки
  FButton := TAdvSmoothButton.Create(tsUserOrder);
  FButton.Appearance.BeginUpdate;
  try
    SetButtonStyle(FButton);
    FButton.Color := btnColor;
    FButton.Appearance.Font.Size := cn_ButtonFontSize;
    FButton.Parent := tsUserOrder;
    FButton.OnClick := OrderButtonOnClick;
    FButton.Name := Format(btnOrderName, [FOrderButtonNumber]);
    FButton.Height := btnHeight;
    FButton.Width := btnWidth;
    // проверяем, есть ли ещё место в ряду
    if (FLastLeftButton + btnWidth) > tsUserOrder.Width then
    begin
      FLastTopButton := FLastTopButton + btnHeight + btnFirstTop;
      FLastLeftButton := btnFirstTop {$IFDEF NEW_TABCONTROL} + 4 {$ENDIF};

      FButton.Left := FLastLeftButton;
      FButton.Top := FLastTopButton;
    end
    else
    begin
      FButton.Left := FLastLeftButton;
      FButton.Top := FLastTopButton;
    end;
    FButton.Tag := FOrderDataSet.FieldByName('ID').AsInteger;
    FButton.Caption := Format('№ %s', [FOrderDataSet.FieldByName('TableName').AsString]);
    FButton.Status.Caption := FormatFloat('#,##0', FOrderDataSet.FieldByName('Summ').AsFloat);
    FButton.Status.Visible := True;
    FButton.Status.Appearance.Font.Size := cn_ButtonSmallFontSize;
    FButton.Status.OffsetTop := -2;
    FButton.VerticalSpacing := 10;
    if FOrderDataSet.FieldByName('Status').AsInteger = Integer(osOrderClose) then
    begin
      FButton.Status.Appearance.Fill.Color := clRed;
      FButton.Status.Appearance.Fill.ColorTo := clRed;
    end;
    FLastLeftButton := FLastLeftButton + btnWidth + 10;
  finally
    FButton.Appearance.EndUpdate;
  end;
  FOrderButtonList.Add(FButton);
  Inc(FOrderButtonNumber);
end;

procedure TRestMainForm.AddPopularGoods;
var
  FButton: TComponent;
begin
  if FFrontBase.GetPopularGoodList(FGoodDataSet) then
  begin
    if (FGoodDataSet.Active) and (not FGoodDataSet.Eof) then
    begin
      FGoodLastTop := btnFirstTop;
      FGoodFirstTop := btnFirstTop;
      FGoodLastLeftButton := btnFirstTop;
      pnlMainGood.Visible := True;

      FGoodDataSet.First;
      while not FGoodDataSet.Eof do
      begin
        AddGoodButton;

        FGoodDataSet.Next;
      end;
    end;
  end
  else
  begin
    FButton := pnlGood.FindComponent(Format(btnMenuName, [1]));
    if Assigned(FButton) then
      TAdvSmoothButton(FButton).Click;
    FButton := pnlGood.FindComponent(Format(btnGroupName, [1]));
    if Assigned(FButton) then
      TAdvSmoothButton(FButton).Click;
  end;
end;

procedure TRestMainForm.CreateOrderButtonList;
begin
  if FOrderDataSet.Active then
  begin
    FOrderDataSet.First;
    while not FOrderDataSet.Eof do
    begin
      AddOrderButton;

      FOrderDataSet.Next;
    end;
  end;
end;

procedure TRestMainForm.AddChooseTables(const HallKey: Integer);
var
  IBSQL: TIBSQL;
  FButton: TChooseTable;
begin
  IBSQL := TIBSQL.Create(nil);
  try
    IBSQL.Transaction := FFrontBase.ReadTransaction;
    IBSQL.SQL.Text := ' SELECT ID, USR$NAME, usr$width, usr$length FROM USR$MN_TABLETYPE ';
    IBSQL.ExecQuery;
    while not IBSQL.Eof do
    begin
      FButton := TChooseTable.Create(pnlDesignerTables);
      FButton.Parent := pnlDesignerTables;
      FButton.OnClick := ChooseTableOnClick;
      FButton.TableTypeKey := IBSQL.FieldByName('ID').AsInteger;
      FButton.RelativeWidth := IBSQL.FieldByName('usr$width').AsFloat;
      FButton.RelativeHeight := IBSQL.FieldByName('usr$length').AsFloat;
      FButton.HallKey := HallKey;
      // Изображение стола
      FButton.Graphic := FTableManager.GetImageForType(FButton.TableTypeKey);

      FButton.Height := btnHeight;
{$IFNDEF DEBUG}
      if Screen.Width > 1024 then
        FButton.Width := 4 * btnNewLong + 4
      else
{$ENDIF}
        FButton.Width := 2 * btnNewLong;

      FTableChooseLastTop := FTableChooseLastTop + btnHeight + btnFirstTop;

      FButton.Left := btnFirstTop {$IFDEF NEW_TABCONTROL} + 4 {$ENDIF};
      FButton.Top := FTableChooseLastTop;
      FButton.Tag := IBSQL.FieldByName('ID').AsInteger;

      FChooseTableButtonList.Add(FButton);

      IBSQL.Next;
    end;
    IBSQL.Close;
  finally
    IBSQL.Free;
  end;
end;

procedure TRestMainForm.AddGoodButton;
var
  FButton: TAdvSmoothButton;
  S: String;
begin
  // Создание кнопки
  FButton := TAdvSmoothButton.Create(pnlGood);
  FButton.Appearance.BeginUpdate;
  try
    SetButtonStyle(FButton);
    FButton.Appearance.Font.Size := 7;
    FButton.Color := btnColor;
    FButton.Parent := pnlGood;
    FButton.OnClick := GoodButtonOnClick;
    FButton.Name := Format(btnGoodName, [FGoodButtonNumber]);
    FButton.Height := 80; // btnHeight;
    FButton.Width := 111; // btnHalfWidth;

    // проверяем, есть ли ещё место в ряду
    if (FGoodLastLeftButton + btnHalfWidth) > pnlGood.Width then
    begin
      FGoodLastTop := FGoodLastTop + btnHeight + 8;
      FGoodLastLeftButton := btnFirstTop;

      FButton.Left := FGoodLastLeftButton;
      FButton.Top := FGoodLastTop;
    end
    else
    begin
      FButton.Left := FGoodLastLeftButton;
      FButton.Top := FGoodLastTop;
    end;

    FButton.Tag := FGoodDataSet.FieldByName('ID').AsInteger;

    S := FGoodDataSet.FieldByName('NAME').AsString;
    if Length(S) > 60 then
      Delete(S, 60, Length(S));
    FButton.Caption := S;
    FButton.Status.Caption := FormatFloat('#,##0', FGoodDataSet.FieldByName('COST').AsFloat);
    FButton.Status.OffsetTop := -3;
    FButton.VerticalSpacing := 4;
    FButton.HorizontalSpacing := 1;
    FButton.Status.Visible := True;
  finally
    FButton.Appearance.EndUpdate;
  end;
  FGoodLastLeftButton := FGoodLastLeftButton + btnHalfWidth + 8;
  FGoodButtonList.Add(FButton);
  Inc(FGoodButtonNumber);
end;

procedure TRestMainForm.AddGroupButton;
var
  FButton: TAdvSmoothButton;
  FPanel: TAdvPanel;
begin
  if FMenuButtonCount <= 6 then
    FPanel := pnlExtraGoodGroup
  else
    FPanel := pnlGoodGroup;

  // Создание кнопки
  FButton := TAdvSmoothButton.Create(pnlGood);
  FButton.Appearance.BeginUpdate;
  try
    SetButtonStyle(FButton);
    FButton.Color := btnColor;
    FButton.Parent := FPanel;
    FButton.OnClick := GroupButtonOnClick;
    FButton.Name := Format(btnGroupName, [FGroupButtonNumber]);
    FButton.Height := btnHeight;
    FButton.Width := btnHalfWidth;

    // проверяем, есть ли ещё место в ряду
    if (FGroupLastLeftButton + btnHalfWidth) > FPanel.Width then
    begin
      FGroupLastTop := FGroupLastTop + btnHeight + 2 { btnFirstTop } ;
      FGroupLastLeftButton := { btnFirstTop } 2 {$IFDEF NEW_TABCONTROL} + 4 {$ENDIF};

      FButton.Left := FGroupLastLeftButton;
      FButton.Top := FGroupLastTop;
    end
    else
    begin
      FButton.Left := FGroupLastLeftButton;
      FButton.Top := FGroupLastTop;
    end;

    FButton.Tag := FGroupDataSet.FieldByName('ID').AsInteger;
    { if Length(FGroupDataSet.FieldByName('NAME').AsString) > 16 then
      FButton.Appearance.Font.Size := cn_ButtonSmallFontSize
      else }
    FButton.Appearance.Font.Size := cn_ButtonSmallFontSize;
    FButton.Caption := FGroupDataSet.FieldByName('NAME').AsString;
  finally
    FButton.Appearance.EndUpdate;
  end;
  FGroupLastLeftButton := FGroupLastLeftButton + btnHalfWidth + 2 { AdjustWidth(10) } ;
  FGroupButtonList.Add(FButton);
  Inc(FGroupButtonNumber);
end;

procedure TRestMainForm.AddHallButton;
var
  FButton: TAdvSmoothButton;
begin
  // Создание кнопки
  FButton := TAdvSmoothButton.Create(pnlHalls);
  FButton.Appearance.BeginUpdate;
  try
    SetButtonStyle(FButton);
    FButton.Appearance.Font.Size := cn_ButtonFontSize;
    FButton.Color := btnColor;
    FButton.Parent := pnlHalls;
    FButton.OnClick := HallButtonOnClick;
    FButton.Name := Format(btnHallsName, [FHallButtonNumber]);
    FButton.Height := btnHeight;
{$IFNDEF DEBUG}
    if Screen.Width > 1024 then
      FButton.Width := 4 * btnNewLong + 4
    else
{$ENDIF}
      FButton.Width := 2 * btnNewLong;

    FHallLastTop := FHallLastTop + btnHeight + btnFirstTop;

    FButton.Left := btnFirstTop {$IFDEF NEW_TABCONTROL} + 4 {$ENDIF};
    FButton.Top := FHallLastTop;

    FButton.Tag := FHallsTable.FieldByName('ID').AsInteger;
    FButton.Caption := FHallsTable.FieldByName('USR$NAME').AsString;
  finally
    FButton.Appearance.EndUpdate;
  end;
  FHallButtonList.Add(FButton);
  Inc(FHallButtonNumber);
end;

procedure TRestMainForm.AddMenuButton;
var
  FButton: TAdvSmoothButton;
begin
  // Создание кнопки
  FButton := TAdvSmoothButton.Create(pnlGood);
  FButton.Appearance.BeginUpdate;
  try
    SetButtonStyle(FButton);
    FButton.Appearance.Font.Size := cn_ButtonFontSize;
    FButton.Color := btnColor;
    FButton.Parent := pnlMenu;
    FButton.OnClick := MenuButtonOnClick;
    FButton.Name := Format(btnMenuName, [FMenuButtonNumber]);
    FButton.Height := btnHeight;
    FButton.Width := btnNewLong;

    // проверяем, есть ли ещё место в ряду
    if (FMenuLastLeftButton + btnNewLong) > pnlRight.Width then
    begin
      FMenuLastTop := FMenuLastTop + btnHeight + 2;
      FMenuLastLeftButton := 2 {$IFDEF NEW_TABCONTROL} + 4 {$ENDIF};

      FButton.Left := FMenuLastLeftButton;
      FButton.Top := FMenuLastTop;
    end
    else
    begin
      FButton.Left := FMenuLastLeftButton;
      FButton.Top := FMenuLastTop;
    end;

    FButton.Tag := FMenuDataSet.FieldByName('ID').AsInteger;
    FButton.Caption := FMenuDataSet.FieldByName('NAME').AsString;
  finally
    FButton.Appearance.EndUpdate;
  end;
  FMenuLastLeftButton := FMenuLastLeftButton + btnNewLong + 2;
  FMenuButtonList.Add(FButton);
  Inc(FMenuButtonNumber);
end;

procedure TRestMainForm.CreateGoodButtonList(const MenuKey: Integer; const GroupKey: Integer);
begin
  FFrontBase.GetGoodList(FGoodDataSet, MenuKey, GroupKey);
  if FGoodDataSet.Active then
  begin
    FGoodDataSet.First;
    while not FGoodDataSet.Eof do
    begin
      AddGoodButton;

      FGoodDataSet.Next;
    end;
  end;
end;

procedure TRestMainForm.CreateGroupButtonList(const MenuKey: Integer);
begin
  FFrontBase.GetGroupList(FGroupDataSet, MenuKey);
  if FGroupDataSet.Active then
  begin
    FGroupDataSet.First;
    while not FGroupDataSet.Eof do
    begin
      AddGroupButton;

      FGroupDataSet.Next;
    end;
  end;
end;

procedure TRestMainForm.CreateHall(const HallKey: Integer);

  procedure LoadHallBackGround(const HallKey: Integer);
  var
    Str: TStream;
    FImage: TPngImage;
  begin
    Str := TMemoryStream.Create;
    try
      if FFrontBase.GetHallBackGround(Str, HallKey) then
      begin
        if Str.Size > 0 then
        begin
          Str.Position := 0;
          FImage := TPngImage.Create;
          try
            FImage.LoadFromStream(Str);
            imgHallBackground.Picture.Assign(FImage);
          finally
            FImage.Free;
          end;
        end;
      end;
    finally
      Str.Free;
    end;
  end;

begin
  if FRestFormState = rsHallsPage then
  begin
    if FActiveHallKey <> HallKey then
    begin
      // Загрузим фон зала
      LoadHallBackGround(HallKey);
      // Загрузить столы из датасета
      FTableManager.LoadTables(HallKey);
      FActiveHallKey := HallKey;
    end;
    // Обновим информацию о заказах по списку столов
    FTableManager.RefreshOrderData;
  end
  else
  begin
    LoadHallBackGround(HallKey);
    FTableManager.LoadTables(HallKey);
    FActiveHallKey := -1;
  end;
end;

procedure TRestMainForm.CreateHallButtonList;
var
  FButton: TComponent;
begin
  if FHallsTable.Active then
  begin
    FHallsTable.First;
    while not FHallsTable.Eof do
    begin
      AddHallButton;

      FHallsTable.Next;
    end;
    if (FActiveHallButton <> '') and (FRestFormState = rsHallsPage) then
    begin
      FButton := pnlHalls.FindComponent(FActiveHallButton);
      if Assigned(FButton) then
        TAdvSmoothButton(FButton).Click;
    end;
  end;
end;

procedure TRestMainForm.CreateKassirPage;
var
  FTempFormState: TRestState;
begin
  RestFormState := rsOrderMenu;
  FTempFormState := FPrevFormState;
  RestFormState := rsKassirInfo;
  FPrevFormState := FTempFormState;
  CreateUserList;
end;

procedure TRestMainForm.CreateManagerPage;
var
  FTempFormState: TRestState;
begin
  RestFormState := rsOrderMenu;
  FTempFormState := FPrevFormState;
  RestFormState := rsManagerPage;
  FPrevFormState := FTempFormState;
  CreateUserList;
end;

procedure TRestMainForm.CreateMenuButtonList;
begin
  FFrontBase.GetMenuList(FMenuDataSet);
  if FMenuDataSet.Active then
  begin
    FMenuDataSet.First;
    while not FMenuDataSet.Eof do
    begin
      AddMenuButton;
      Inc(FMenuButtonCount);

      FMenuDataSet.Next;
    end;
  end;
  if FMenuButtonCount <= 6 then
  begin
    pnlExtraGoodGroup.Visible := True;
    if Screen.Width >= 1024 then
      pnlExtraGoodGroup.Height := tsMenu.Height - (FMenuLastTop + btnHeight + btnFirstTop);
  end
  else
    pnlExtraGoodGroup.Visible := False;
  // если только одно меню, то:
  // 1.делаем панель с ним невидимым
  // 2.вызываем сразу построение групп
  if FMenuButtonCount = 1 then
  begin
    pnlMenu.Visible := False;
    pnlExtraGoodGroup.Align := alClient;
    FMenuKey := TButton(FMenuButtonList.Items[0]).Tag;
    CreateGroupButtonList(FMenuKey);
  end;
end;

procedure TRestMainForm.CreateNewOrder(const TableKey: Integer);
var
  FOrderForm: TOrderNumber;
  FGuestForm: TGuestForm;
  FOrderNumber: String;
  FGuestCount: Integer;
begin
  ClearDisplay;

  if not FFrontBase.CheckForSession then
    exit;

  { TODO : Проверка на Max кол-во гостей }
  if (FFrontBase.UserKey and FFrontBase.Options.ManagerGroupMask) = 0 then
  begin
    if FFrontBase.CheckCountOrderByResp(FFrontBase.ContactKey) then
    begin
      Touch_MessageBox('Внимание', 'Превышено максимально возможное число открытых заказов!', MB_OK, mtWarning);
      exit;
    end;
  end;

  FOrderNumber := '';
  FFrontBase.GetOrder(FHeaderTable, FLineTable, FModificationDataSet, -1);
  if FFrontBase.Options.NoPassword then
    FOrderNumber := IntToStr(FFrontBase.GetNextOrderNum)
  else
  begin
    FOrderForm := TOrderNumber.Create(nil);
    try
      FOrderForm.ShowModal;
      if FOrderForm.ModalResult = mrOK then
        FOrderNumber := FOrderForm.Number;
    finally
      FOrderForm.Free;
    end;
  end;

  if FOrderNumber = '' then
    exit;

  if FFrontBase.Options.MinGuestCount < 0 then
    FGuestCount := 1
  else
  begin
    FGuestForm := TGuestForm.Create(nil);
    try
      FGuestForm.ShowModal;
      if FGuestForm.ModalResult = mrOK then
        FGuestCount := FGuestForm.GuestCount
      else
        exit;
    finally
      FGuestForm.Free;
    end;
  end;

  if (FGuestCount >= FFrontBase.Options.MinGuestCount) then
  begin
    if not Assigned(dsMain.DataSet) then
      dsMain.DataSet := FLineTable;

    FHeaderTable.Insert;
    FHeaderTable.FieldByName('NUMBER').AsString := FOrderNumber;
    FHeaderTable.FieldByName('USR$GUESTCOUNT').AsInteger := FGuestCount;
    FHeaderTable.FieldByName('USR$TIMEORDER').Value := Time;
    if TableKey > 0 then
      FHeaderTable.FieldByName('USR$TABLEKEY').AsInteger := TableKey;
    FHeaderTable.FieldByName('USR$COMPUTERNAME').AsString := GetLocalComputerName;
    FHeaderTable.Post;

    btnPreCheck.Action := actPreCheck;
    RestFormState := rsMenuInfo;
  end;
  FLogManager.DoSimpleEvent(ev_CreateNewOrder);
end;

procedure TRestMainForm.CreateNewTableOrder(const Table: TRestTable);
var
  FGuestForm: TGuestForm;
  FOrderNumber: String;
  FGuestCount: Integer;
begin
  SetCloseTimerActive(False);
  try
    ClearDisplay;
    { TODO : Проверка на Max кол-во гостей }
    if (FFrontBase.UserKey and FFrontBase.Options.ManagerGroupMask) = 0 then
    begin
      if FFrontBase.CheckCountOrderByResp(FFrontBase.ContactKey) then
      begin
        Touch_MessageBox('Внимание', 'Превышено максимально возможное число открытых заказов!', MB_OK, mtWarning);
        exit;
      end;
    end;

    FFrontBase.GetOrder(FHeaderTable, FLineTable, FModificationDataSet, -1);
    FOrderNumber := Table.Number + '.' + IntToStr(Table.GetMaxOrderNumber + 1);

    if FOrderNumber = '' then
      exit;

    if FFrontBase.Options.MinGuestCount < 0 then
      FGuestCount := 1
    else
    begin
      FGuestForm := TGuestForm.Create(nil);
      try
        FGuestForm.ShowModal;
        if FGuestForm.ModalResult = mrOK then
          FGuestCount := FGuestForm.GuestCount
        else
          exit;
      finally
        FGuestForm.Free;
      end;
    end;

    if (FGuestCount >= FFrontBase.Options.MinGuestCount) then
    begin
      if not Assigned(dsMain.DataSet) then
        dsMain.DataSet := FLineTable;

      FHeaderTable.Insert;
      FHeaderTable.FieldByName('NUMBER').AsString := FOrderNumber;
      FHeaderTable.FieldByName('USR$GUESTCOUNT').AsInteger := FGuestCount;
      FHeaderTable.FieldByName('USR$TIMEORDER').Value := Time;
      if Table.ID > 0 then
        FHeaderTable.FieldByName('USR$TABLEKEY').AsInteger := Table.ID;
      FHeaderTable.FieldByName('USR$COMPUTERNAME').AsString := GetLocalComputerName;
      FHeaderTable.FieldByName('usr$respkey').AsInteger := FFrontBase.ContactKey;
      FHeaderTable.Post;

      btnPreCheck.Action := actPreCheck;
      RestFormState := rsMenuInfo;

      SaveCheck;
    end;
    FLogManager.DoSimpleEvent(ev_CreateNewOrder);
  finally
    SetCloseTimerActive(not FFrontBase.Options.NoPassword);
  end;
end;

procedure TRestMainForm.RemoveChooseTable;
begin
  FChooseTableButtonList.Clear;
end;

procedure TRestMainForm.RemoveGoodButton;
begin
  FGoodButtonList.Clear;
  FGoodButtonNumber := 1;
end;

procedure TRestMainForm.RemoveGroupButton;
begin
  FGroupButtonList.Clear;
  FGroupButtonNumber := 1;
end;

procedure TRestMainForm.RemoveHallButton;
begin
  FHallButtonList.Clear;
  FHallButtonNumber := 1;
end;

procedure TRestMainForm.RemoveMenuButton;
begin
  FMenuButtonList.Clear;
  FMenuButtonNumber := 1;
end;

procedure TRestMainForm.RemoveOrderButton;
begin
  FOrderButtonList.Clear;
  FOrderButtonNumber := 1;
end;

procedure TRestMainForm.MenuButtonOnClick(Sender: TObject);
var
  FButton: TAdvSmoothButton;
  FGroupButton: TComponent;
begin
  if FMenuSelectedButton <> nil then
  begin
    TAdvSmoothButton(FMenuSelectedButton).Enabled := True;
  end;
  FMenuSelectedButton := Sender;
  FButton := TAdvSmoothButton(Sender);
  FButton.Enabled := False;
  // FButton.Appearance.Font.Color := clLime;

  FGroupLastTop := btnFirstTop;
  FGroupFirstTop := btnFirstTop;
  FGroupLastLeftButton := 2 {$IFDEF NEW_TABCONTROL} + 4 {$ENDIF};
  RemoveGroupButton;
  FMenuKey := FButton.Tag;
  CreateGroupButtonList(FMenuKey);
  if FMenuButtonCount > 6 then
    pcMenu.ActivePage := tsGroup;

  FGroupButton := pnlGood.FindComponent(Format(btnGroupName, [1]));
  if Assigned(FGroupButton) then
    TAdvSmoothButton(FGroupButton).Click;
end;

procedure TRestMainForm.GroupButtonOnClick(Sender: TObject);
var
  FButton: TAdvSmoothButton;
begin
  LockWindowUpdate(Handle);
  try
    if FSelectedButton <> nil then
    begin
      TAdvSmoothButton(FSelectedButton).Enabled := True;
    end;
    FSelectedButton := Sender;
    FButton := TAdvSmoothButton(Sender);
    FButton.Enabled := False;

    RemoveGoodButton;
    FGoodLastTop := btnFirstTop;
    FGoodFirstTop := btnFirstTop;
    FGoodLastLeftButton := btnFirstTop;
    pnlMainGood.Visible := True;
    CreateGoodButtonList(FMenuKey, FButton.Tag);
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TRestMainForm.HallButtonOnClick(Sender: TObject);
var
  FButton: TButton;
begin
  LockWindowUpdate(Handle);
  try
    FButton := TButton(Sender);

    RemoveChooseTable;
    // План зала
    CreateHall(FButton.Tag);

    FActiveHallButton := FButton.Name;

    if FRestFormState = rsHallEdit then
    begin
      pcMenu.ActivePage := tsTablesDesigner;
      AddChooseTables(FButton.Tag);
    end
    else
      tmrTables.Enabled := True;
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TRestMainForm.actBackToMenuExecute(Sender: TObject);
begin
  // Очищаем кнопки, возращаемся в меню
  pnlMainGood.Visible := False;
  FMenuKey := -1;
  RemoveGoodButton;
  RemoveGroupButton;
  pcMenu.ActivePage := tsMenu;
end;

function TRestMainForm.GetCurrentOrderInfo: TLogOrderInfo;
begin
  Result.OrderID := FHeaderTable.FieldByName('ID').AsInteger;
  Result.OrderNumber := FHeaderTable.FieldByName('NUMBER').AsString;
end;

function TRestMainForm.GetCurrentUserInfo: TLogUserInfo;
begin
  Result.UserID := FFrontBase.ContactKey;
  Result.UserName := FFrontBase.UserName;
end;

{ Получить время и дату поправленные с учетом разницы времени между сервером и клиентом }
function TRestMainForm.GetServerDateTime: TDateTime;
begin
  Result := Now + FServerTimeLag;
end;

function TRestMainForm.GetUserInfo(const UserInfo: TUserInfo): TLogUserInfo;
begin
  Result.UserID := UserInfo.UserKey;
  Result.UserName := UserInfo.UserName;
end;

procedure TRestMainForm.GoodButtonOnClick(Sender: TObject);
var
  GoodKey: Integer;
  FForm: TModificationForm;
  S, ES: String;
  FGoodInfo: TLogGoodInfo;
  FChooseForm: TChooseForm;

const
  cn_prnSQL = 'SELECT ID, USR$NAME FROM USR$MN_PRNGROUP';
  cn_modSQL = ' SELECT ID, USR$NAME FROM USR$MN_MODIFY ' +
    ' WHERE USR$ISGROUP = 1 ';

begin
  if not FHeaderTable.FieldByName('usr$timecloseorder').IsNull then
  begin
    Touch_MessageBox('Внимание', 'По данному заказу пречек уже был распечатан!', MB_OK, mtWarning);
    exit;
  end;
  if FViewMode then
  begin
    Touch_MessageBox('Внимание', 'Из формы оплаты нельзя добавлять товар!', MB_OK, mtWarning);
    exit;
  end;

  GoodKey := TButton(Sender).Tag;
  S := '';
  ES := '';
  if FGoodDataSet.Locate('ID', GoodKey, []) then
  begin
    FLineTable.Append;
    FLineTable.FieldByName('LINEKEY').AsInteger := FLineID;
    FLineTable.FieldByName('STATEFIELD').AsInteger := cn_StateInsert;
    FLineTable.FieldByName('usr$quantity').AsInteger := 1;
    FLineTable.FieldByName('CREATIONDATE').AsDateTime := FFrontBase.GetServerDateTime;
    FLineTable.Post;

    Inc(FLineID);
    //Issue 97
    if (FGoodDataSet.FieldByName('PRNGROUPKEY').AsInteger = 0) and (FFrontBase.Options.NeedPrnGroup) then
    begin
      if Touch_MessageBox('Внимание', 'Для блюда не установлена группа сервис-печати. Установить?',
        MB_YESNO, mtConfirmation) = IDYES then
      begin
        FChooseForm := TChooseForm.Create(nil);
        try
          FChooseForm.SQLText := cn_prnSQL;
          FChooseForm.KeyField := 'ID';
          FChooseForm.ListField := 'USR$NAME';
          FChooseForm.FrontBase := FFrontBase;
          FChooseForm.ChooseName := 'Группа сервис-печати';
          FChooseForm.ShowModal;
          if FChooseForm.ModalResult = mrOK then
          begin
            FGoodDataSet.Edit;
            FGoodDataSet.FieldByName('PRNGROUPKEY').AsInteger := FChooseForm.ID;
            FGoodDataSet.Post;
            if FChooseForm.ID <> -1 then
              FFrontBase.UpdateGoodPrnGroup(GoodKey, FChooseForm.ID);
          end;
        finally
          FChooseForm.Free;
        end;
      end;
    end;

    if (FGoodDataSet.FieldByName('MODIFYGROUPKEY').AsInteger = 0) and (FFrontBase.Options.NeedModGroup) then
    begin
      if Touch_MessageBox('Внимание', 'Для блюда не установлена группа модификаторов. Установить?',
        MB_YESNO, mtConfirmation) = IDYES then
      begin
        FChooseForm := TChooseForm.Create(nil);
        try
          FChooseForm.SQLText := cn_modSQL;
          FChooseForm.KeyField := 'ID';
          FChooseForm.ListField := 'USR$NAME';
          FChooseForm.FrontBase := FFrontBase;
          FChooseForm.ChooseName := 'Группа модификаторов';
          FChooseForm.ShowModal;
          if FChooseForm.ModalResult = mrOK then
          begin
            FGoodDataSet.Edit;
            FGoodDataSet.FieldByName('MODIFYGROUPKEY').AsInteger := FChooseForm.ID;
            FGoodDataSet.Post;
            if FChooseForm.ID <> -1 then
              FFrontBase.UpdateGoodModifyGroup(GoodKey, FChooseForm.ID);
          end;
        finally
          FChooseForm.Free;
        end;
      end;
    end;

    // проверяем сначала на модификаторы
    if FGoodDataSet.FieldByName('ISNEEDMODIFY').AsInteger = 1 then
    begin
      FForm := TModificationForm.CreateWithFrontBase(nil, FFrontBase);
      try
        FForm.GoodKey := GoodKey;
        FForm.LineModifyTable := FModificationDataSet;
        FForm.ShowModal;
        if FForm.ModalResult = mrOK then
        begin
          FModificationDataSet.First;
          while not FModificationDataSet.Eof do
          begin
            if S > '' then
              S := S + ', ';
            S := S + FModificationDataSet.FieldByName('NAME').AsString;
            FModificationDataSet.Next;
          end;
          ES := FForm.ExtraModifyString;
          if ES <> '' then
          begin
            if S = '' then
              S := ES
            else
              S := S + ', ' + ES;
          end;
        end;
      finally
        FForm.Free;
      end;
    end;
    FLineTable.Edit;
    FLineTable.FieldByName('usr$goodkey').AsInteger := GoodKey;
    FLineTable.FieldByName('GOODNAME').AsString := FGoodDataSet.FieldByName('NAME').AsString;
    FLineTable.FieldByName('usr$quantity').AsInteger := 1;
    FLineTable.FieldByName('usr$costncu').AsCurrency := FGoodDataSet.FieldByName('COST').AsCurrency;
    FLineTable.FieldByName('MODIFYSTRING').AsString := S;
    FLineTable.FieldByName('EXTRAMODIFY').AsString := ES;
    FLineTable.FieldByName('USR$COMPUTERNAME').AsString := GetLocalComputerName;
    FLineTable.Post;

    FGoodInfo.GoodID := GoodKey;
    FGoodInfo.GoodName := FLineTable.FieldByName('GOODNAME').AsString;
    FGoodInfo.Quantity := 1;
    FGoodInfo.Sum := FGoodDataSet.FieldByName('COST').AsCurrency;
    FLogManager.DoOrderGoodLog(GetCurrentUserInfo, GetCurrentOrderInfo, FGoodInfo, ev_AddGoodToOrder);
    WritePos(FLineTable);
  end;
  SaveAllOrder;
end;

procedure TRestMainForm.SaveAllOrder;
begin
  if FFrontBase.Options.SaveAllOrder then
    SaveCheck;
end;

procedure TRestMainForm.SaveCheck;
var
  OrderKey: Integer;
begin
  OrderKey := FHeaderTable.FieldByName('ID').AsInteger;
  DBGrMain.DataSource := nil;
  try
    FFrontBase.SaveAndReloadOrder(FHeaderTable, FLineTable, FModificationDataSet, OrderKey);
  finally
    DBGrMain.DataSource := dsMain;
  end;
end;

procedure TRestMainForm.SaveTablePositions;
begin
  dxfDesigner.EditControl := nil;
  dxfDesigner.Active := False;
  // Сохраним данные столов в БД
  FTableManager.SaveTables;
end;

procedure TRestMainForm.sbTableGesture(Sender: TObject; const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  { if EventInfo.GestureID = sgiLeft then
    sbTable.ScrollBy(-20, 0)
    else if  EventInfo.GestureID = sgiRight then
    sbTable.ScrollBy(20, 0)
    else if  EventInfo.GestureID = sgiUp then
    sbTable.ScrollBy(0, 20)
    else if EventInfo.GestureID = sgiDown then
    sbTable.ScrollBy(0, -20); }
end;

procedure TRestMainForm.ScrollControl(const FControl: TWinControl; const Down: Boolean; var Top: Integer; var Bottom: Integer);
var
  Step: Integer;
begin
  Step := 0;
  if Down then
  begin
    while (Step < btnHeight + 8) and (Bottom + btnHeight > FControl.Height) do
    begin
      FControl.ScrollBy(0, -1);

      Dec(Bottom);
      Inc(Top);
      Inc(Step);
    end;
  end
  else
  begin
    while (Step < btnHeight + 8) and (Top > 8) do
    begin
      FControl.ScrollBy(0, 1);

      Inc(Bottom);
      Dec(Top);
      Inc(Step);
    end;
  end;
end;

procedure TRestMainForm.actScrollDownExecute(Sender: TObject);
begin
  LockWindowUpdate(Handle);
  try
    if pcMenu.ActivePage = tsMenu then
      if FMenuButtonCount > 6 then
        ScrollControl(pnlMenu, True, FMenuFirstTop, FMenuLastTop)
      else
        ScrollControl(pnlExtraGoodGroup, True, FGroupFirstTop, FGroupLastTop)
      else
        ScrollControl(pnlGoodGroup, True, FGroupFirstTop, FGroupLastTop);
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TRestMainForm.actScrollUpExecute(Sender: TObject);
begin
  LockWindowUpdate(Handle);
  try
    if pcMenu.ActivePage = tsMenu then
      if FMenuButtonCount > 6 then
        ScrollControl(pnlMenu, False, FMenuFirstTop, FMenuLastTop)
      else
        ScrollControl(pnlExtraGoodGroup, False, FGroupFirstTop, FGroupLastTop)
      else
        ScrollControl(pnlGoodGroup, False, FGroupFirstTop, FGroupLastTop);
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TRestMainForm.actGoodUpExecute(Sender: TObject);
begin
  LockWindowUpdate(Handle);
  try
    ScrollControl(pnlGood, False, FGoodFirstTop, FGoodLastTop);
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TRestMainForm.actGoodDownExecute(Sender: TObject);
begin
  LockWindowUpdate(Handle);
  try
    ScrollControl(pnlGood, True, FGoodFirstTop, FGoodLastTop);
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TRestMainForm.PopItemOnClick(Sender: TObject);
var
  FButton: TRestTable;
begin
  FButton := TRestTable(TAdvPopupMenu(TMenuItem(Sender).Owner).PopupComponent);
  if Assigned(FButton) then
    CreateNewTableOrder(FButton);
end;

procedure TRestMainForm.btnExitManagerInfoClick(Sender: TObject);
begin
  actOK.Execute;
end;

procedure TRestMainForm.btnNewOrderClick(Sender: TObject);
begin
  SetCloseTimerActive(False);
  try
    CreateNewOrder(-1);
  finally
    SetCloseTimerActive(not FFrontBase.Options.NoPassword);
  end;
end;

procedure TRestMainForm.actOKExecute(Sender: TObject);
var
  OrderKey: Integer;
begin
  IsActionRun := True;
  btnOK.Enabled := False;
  btnCancel3.Enabled := False;
  try
    FSelectedButton := nil;
    FMenuSelectedButton := nil;
    case FRestFormState of
      rsPass:
        ;

      rsOrderMenu, rsManagerPage, rsManagerChooseOrder, rsKassirInfo:
        begin
          // переходим на форму с паролем
          RestFormState := rsPass;
          FLogManager.DoSimpleLog(GetCurrentUserInfo, ev_Exit);
        end;

      rsHallsPage:
        begin
          RemoveHallButton;
          RemoveChooseTable;
          FFrontBase.ClearCache;

          RestFormState := rsPass;
          FLogManager.DoSimpleLog(GetCurrentUserInfo, ev_Exit);
        end;

      rsHallEdit:
        begin
          if Touch_MessageBox('Внимание', 'Сохранить изменения?', MB_YESNO, mtConfirmation) = IDYES then
          begin
            SaveTablePositions;
            RemoveHallButton;
            // Удалим зал
            EraseHall;
            RemoveChooseTable;
            FFrontBase.ClearCache;
            dxfDesigner.EditControl := nil;
            dxfDesigner.Active := False;

            RestFormState := rsPass;
            FLogManager.DoSimpleLog(GetCurrentUserInfo, ev_Exit);
          end;
        end;

      rsManagerInfo:
        begin
          dsHeaderInfo.DataSet := nil;
          dsLineInfo.DataSet := nil;
          FHeaderInfoTable.Close;
          FLineInfoTable.Close;

          RestFormState := FBaseFormState;
        end;

      rsMenuInfo:
        begin
          // сохраняем чек
          if Touch_MessageBox('Внимание', 'Закрыть заказ?', MB_YESNO, mtConfirmation) = IDYES then
          begin
            DBGrMain.DataSource := nil;
            FSelectedButton := nil;
            FMenuSelectedButton := nil;
            try
              if FFrontBase.CreateNewOrder(FHeaderTable, FLineTable, FModificationDataSet, OrderKey) then
              begin
                if FFrontBase.Options.LastPrintOrder <> OrderKey then
                begin
                  if FReport.ServiceCheckOptions(OrderKey) then
                  begin
                    FFrontBase.SavePrintDate(OrderKey);
                    FFrontBase.CloseModifyTable(FModificationDataSet);
                  end;
                end;
                FLogManager.DoOrderLog(GetCurrentUserInfo, GetCurrentOrderInfo, ev_SaveOrder);
                case FPrevFormState of
                  rsManagerPage:
                    CreateManagerPage;

                  rsKassirInfo:
                    CreateKassirPage;

                  rsHallsPage:
                    RestFormState := rsHallsPage;

                else
                  RestFormState := rsOrderMenu;
                end;
              end;
            finally
              DBGrMain.DataSource := dsMain;
            end;
          end;
        end;
    end;
  finally
    IsActionRun := False;
    btnOK.Enabled := True;
    btnCancel3.Enabled := True;
  end;
end;

procedure TRestMainForm.actCancelExecute(Sender: TObject);
begin
  IsActionRun := True;
  btnOK.Enabled := False;
  btnCancel3.Enabled := False;
  try
    FSelectedButton := nil;
    FMenuSelectedButton := nil;
    case FRestFormState of
      rsPass:
        ;

      rsOrderMenu, rsManagerChooseOrder:
        begin
          RestFormState := rsPass;
          FFrontBase.ClearCache;
          FLogManager.DoSimpleLog(GetCurrentUserInfo, ev_Exit);
        end;

      rsKassirInfo, rsManagerPage:
        begin
          RestFormState := FBaseFormState;
        end;

      rsHallsPage, rsHallEdit:
        begin
          RemoveHallButton;
          RemoveChooseTable;
          FFrontBase.ClearCache;
          dxfDesigner.EditControl := nil;
          dxfDesigner.Active := False;

          RestFormState := rsPass;
          FLogManager.DoSimpleLog(GetCurrentUserInfo, ev_Exit);
        end;

      rsManagerInfo:
        begin
          dsHeaderInfo.DataSet := nil;
          dsLineInfo.DataSet := nil;
          FHeaderInfoTable.Close;
          FLineInfoTable.Close;
          FSelectedButton := nil;
          FMenuSelectedButton := nil;

          RestFormState := rsPass;
          FLogManager.DoSimpleLog(GetCurrentUserInfo, ev_Exit);
        end;

      rsMenuInfo:
        begin
          if FPayed or (Touch_MessageBox('Внимание', 'Выйти из заказа?', MB_YESNO, mtConfirmation) = IDYES) then
          begin
            if not FHeaderTable.IsEmpty then
            begin
              if FFrontBase.UnLockUserOrder(FHeaderTable.FieldByName('ID').AsInteger) then
              begin
                FLogManager.DoOrderLog(GetCurrentUserInfo, GetCurrentOrderInfo, ev_ExitOrder);
                case FPrevFormState of
                  rsManagerPage:
                    CreateManagerPage;

                  rsKassirInfo:
                    CreateKassirPage;

                  rsHallsPage:
                    begin
                      if FLineTable.IsEmpty then
                        FFrontBase.DeleteOrder(FHeaderTable.FieldByName('ID').AsInteger);
                      RestFormState := rsHallsPage;
                    end;

                else
                  RestFormState := rsOrderMenu;
                end;
              end;
            end
            else
            begin
              FLogManager.DoOrderLog(GetCurrentUserInfo, GetCurrentOrderInfo, ev_ExitOrder);
              case FPrevFormState of
                rsManagerPage:
                  CreateManagerPage;

                rsKassirInfo:
                  CreateKassirPage;

                rsHallsPage:
                  RestFormState := rsHallsPage;

              else
                RestFormState := rsOrderMenu;
              end;
            end;
          end;
        end;
    end;
  finally
    IsActionRun := False;
    btnOK.Enabled := True;
    btnCancel3.Enabled := True;
  end;
end;

procedure TRestMainForm.actAddQuantityExecute(Sender: TObject);
var
  FGoodInfo: TLogGoodInfo;
  GoodKey: Integer;
  FForm: TModificationForm;
  S: String;
  ES: String;
begin
  IsActionRun := True;
  btnOK.Enabled := False;
  btnCancel3.Enabled := False;
  try
    if (not FLineTable.IsEmpty) and (RestFormState = rsMenuInfo) then
    begin
      if not FLineTable.FieldByName('usr$mn_printdate').IsNull then
      begin
        GoodKey := FLineTable.FieldByName('usr$goodkey').AsInteger;
        if not FGoodDataSet.Locate('ID', GoodKey, []) then
          FFrontBase.GetGoodByID(FGoodDataSet, GoodKey);

        if FGoodDataSet.Locate('ID', GoodKey, []) then
        begin
          FLineTable.Append;
          FLineTable.FieldByName('LINEKEY').AsInteger := FLineID;
          FLineTable.FieldByName('STATEFIELD').AsInteger := cn_StateInsert;
          FLineTable.FieldByName('usr$quantity').AsInteger := 1;
          FLineTable.FieldByName('CREATIONDATE').AsDateTime := FFrontBase.GetServerDateTime;
          FLineTable.Post;

          Inc(FLineID);
          // проверяем сначала на модификаторы
          if FGoodDataSet.FieldByName('ISNEEDMODIFY').AsInteger = 1 then
          begin
            FForm := TModificationForm.CreateWithFrontBase(nil, FFrontBase);
            try
              FForm.GoodKey := GoodKey;
              FForm.LineModifyTable := FModificationDataSet;
              FForm.ShowModal;
              if FForm.ModalResult = mrOK then
              begin
                FModificationDataSet.First;
                while not FModificationDataSet.Eof do
                begin
                  if S > '' then
                    S := S + ', ';
                  S := S + FModificationDataSet.FieldByName('NAME').AsString;
                  FModificationDataSet.Next;
                end;
                ES := FForm.ExtraModifyString;
                if ES <> '' then
                begin
                  if S = '' then
                    S := ES
                  else
                    S := S + ', ' + ES;
                end;
              end;
            finally
              FForm.Free;
            end;
          end;
          FLineTable.Edit;
          FLineTable.FieldByName('usr$goodkey').AsInteger := GoodKey;
          FLineTable.FieldByName('GOODNAME').AsString := FGoodDataSet.FieldByName('NAME').AsString;
          FLineTable.FieldByName('usr$quantity').AsInteger := 1;
          FLineTable.FieldByName('usr$costncu').AsCurrency := FGoodDataSet.FieldByName('COST').AsCurrency;
          FLineTable.FieldByName('MODIFYSTRING').AsString := S;
          FLineTable.FieldByName('EXTRAMODIFY').AsString := ES;
          FLineTable.FieldByName('USR$COMPUTERNAME').AsString := GetLocalComputerName;
          FLineTable.Post;

          FGoodInfo.GoodID := GoodKey;
          FGoodInfo.GoodName := FLineTable.FieldByName('GOODNAME').AsString;
          FGoodInfo.Quantity := 1;
          FGoodInfo.Sum := FGoodDataSet.FieldByName('COST').AsCurrency;
          FLogManager.DoOrderGoodLog(GetCurrentUserInfo, GetCurrentOrderInfo, FGoodInfo, ev_AddGoodToOrder);
          WritePos(FLineTable);
        end;
      end
      else
      begin
        FLineTable.Edit;
        FLineTable.FieldByName('USR$QUANTITY').AsCurrency := FLineTable.FieldByName('USR$QUANTITY').AsCurrency + 1;
        if FLineTable.FieldByName('STATEFIELD').AsInteger = cn_StateNothing then
          FLineTable.FieldByName('STATEFIELD').AsInteger := cn_StateUpdate;
        FLineTable.Post;

        FGoodInfo.GoodID := FLineTable.FieldByName('usr$goodkey').AsInteger;
        FGoodInfo.GoodName := FLineTable.FieldByName('GOODNAME').AsString;
        FGoodInfo.Quantity := FLineTable.FieldByName('USR$QUANTITY').AsCurrency;
        FLogManager.DoOrderGoodLog(GetCurrentUserInfo, GetCurrentOrderInfo, FGoodInfo, ev_AddQuantity);

        WritePos(FLineTable);
      end;
    end;
    SaveAllOrder;
  finally
    IsActionRun := False;
    btnOK.Enabled := True;
    btnCancel3.Enabled := True;
  end;
end;

procedure TRestMainForm.actRemoveQuantityExecute(Sender: TObject);
var
  Quantity: Currency;
  FDeleteForm: TDeleteOrderLine;
  Amount: Currency;
  FUserInfo: TUserInfo;
  FGoodInfo: TLogGoodInfo;
begin
  IsActionRun := True;
  btnOK.Enabled := False;
  btnCancel3.Enabled := False;
  try
    if (not FLineTable.IsEmpty) and (RestFormState = rsMenuInfo) then
    begin
      Quantity := FLineTable.FieldByName('USR$QUANTITY').AsCurrency - 1;
      if (Quantity >= FLineTable.FieldByName('OLDQUANTITY').AsCurrency) and (FHeaderTable.FieldByName('USR$MN_PRINTDATE').IsNull) then
      begin
        FGoodInfo.GoodID := FLineTable.FieldByName('usr$goodkey').AsInteger;
        FGoodInfo.GoodName := FLineTable.FieldByName('GOODNAME').AsString;
        FGoodInfo.Quantity := Quantity;
        if Quantity > 0 then
        begin
          FLineTable.Edit;
          FLineTable.FieldByName('USR$QUANTITY').AsCurrency := Quantity;
          if FLineTable.FieldByName('STATEFIELD').AsInteger = cn_StateNothing then
            FLineTable.FieldByName('STATEFIELD').AsInteger := cn_StateUpdate;
          FLineTable.Post;
        end
        else
        begin
          if Touch_MessageBox('Внимание', 'Удалить позицию?', MB_YESNO, mtConfirmation) = IDYES then
            FLineTable.Delete;
        end;

        FLogManager.DoOrderGoodLog(GetCurrentUserInfo, GetCurrentOrderInfo, FGoodInfo, ev_RemoveQuantity);

        WritePos(FLineTable);
        // update grid footer
        DBGrMain.SumList.RecalcAll;
      end
      else
      begin
        // удалять может только пользователь с правами менеджера
        FUserInfo := FFrontBase.CheckUserPasswordWithForm;
        if FUserInfo.CheckedUserPassword then
        begin
          if (FUserInfo.UserInGroup and FFrontBase.Options.ManagerGroupMask) = 0 then
          begin
            Touch_MessageBox('Внимание', cn_dontManagerPermission, MB_OK, mtWarning);
            exit;
          end;

          FDeleteForm := TDeleteOrderLine.CreateWithFrontBase(nil, FFrontBase);
          try
            FDeleteForm.Quantity := FLineTable.FieldByName('USR$QUANTITY').AsCurrency;
            FDeleteForm.ShowModal;
            if FDeleteForm.ModalResult = mrOK then
            begin
              Amount := FDeleteForm.RemoveQuantity;
              FFrontBase.SaveOrderLog(FFrontBase.ContactKey, FUserInfo.UserKey, FHeaderTable.FieldByName('ID').AsInteger,
                FLineTable.FieldByName('ID').AsInteger, 3);

              FGoodInfo.GoodID := FLineTable.FieldByName('usr$goodkey').AsInteger;
              FGoodInfo.GoodName := FLineTable.FieldByName('GOODNAME').AsString;
              FGoodInfo.Quantity := Amount;
              FLogManager.DoOrderGoodLog(GetUserInfo(FUserInfo), GetCurrentOrderInfo, FGoodInfo, ev_RemoveGood);

              DeleteOrderLine(Amount, FDeleteForm.DeleteClauseID);
              WritePos(FLineTable);
            end;
          finally
            FDeleteForm.Free;
          end;
        end;
      end;
    end;
    SaveAllOrder;
  finally
    IsActionRun := False;
    btnOK.Enabled := True;
    btnCancel3.Enabled := True;
  end;
end;

procedure TRestMainForm.actDeletePositionExecute(Sender: TObject);
var
  FDeleteForm: TDeleteOrderLine;
  Amount: Currency;
  FUserInfo: TUserInfo;
  FGoodInfo: TLogGoodInfo;
begin
  IsActionRun := True;
  btnOK.Enabled := False;
  btnCancel3.Enabled := False;
  try
    if (not FLineTable.IsEmpty) and (RestFormState = rsMenuInfo) then
    begin
      if (FLineTable.FieldByName('OLDQUANTITY').IsNull) and (FHeaderTable.FieldByName('USR$MN_PRINTDATE').IsNull) then
        FLineTable.Delete

      else
      begin
        // удалять может только пользователь с правами менеджера
        FUserInfo := FFrontBase.CheckUserPasswordWithForm;
        if FUserInfo.CheckedUserPassword then
        begin
          if (FUserInfo.UserInGroup and FFrontBase.Options.ManagerGroupMask) = 0 then
          begin
            Touch_MessageBox('Внимание', cn_dontManagerPermission, MB_OK, mtWarning);
            exit;
          end;
          FDeleteForm := TDeleteOrderLine.CreateWithFrontBase(nil, FFrontBase);
          try
            FDeleteForm.Quantity := FLineTable.FieldByName('USR$QUANTITY').AsCurrency;
            FDeleteForm.ShowModal;
            if FDeleteForm.ModalResult = mrOK then
            begin
              Amount := FDeleteForm.RemoveQuantity;
              FFrontBase.SaveOrderLog(FFrontBase.ContactKey, FUserInfo.UserKey, FHeaderTable.FieldByName('ID').AsInteger,
                FLineTable.FieldByName('ID').AsInteger, 3);

              FGoodInfo.GoodID := FLineTable.FieldByName('usr$goodkey').AsInteger;
              FGoodInfo.GoodName := FLineTable.FieldByName('GOODNAME').AsString;
              FGoodInfo.Quantity := Amount;
              FLogManager.DoOrderGoodLog(GetUserInfo(FUserInfo), GetCurrentOrderInfo, FGoodInfo, ev_RemoveGood);

              DeleteOrderLine(Amount, FDeleteForm.DeleteClauseID);
              WritePos(FLineTable);
            end;
          finally
            FDeleteForm.Free;
          end;
        end;
      end;
    end;
    SaveAllOrder;
  finally
    IsActionRun := False;
    btnOK.Enabled := True;
    btnCancel3.Enabled := True;
  end;
end;

procedure TRestMainForm.actManagerInfoExecute(Sender: TObject);
begin
  RestFormState := rsManagerInfo;
end;

procedure TRestMainForm.actManagerInfoUpdate(Sender: TObject);
begin
  actManagerInfo.Enabled := ((FFrontBase.UserKey and FFrontBase.Options.ManagerGroupMask) <> 0)
    and (not btnSwapTable.Down);
end;

procedure TRestMainForm.actModificationExecute(Sender: TObject);
var
  GoodKey: Integer;
  FForm: TModificationForm;
  S, ES: String;
  FGoodInfo: TLogGoodInfo;
begin
  IsActionRun := True;
  btnOK.Enabled := False;
  btnCancel3.Enabled := False;
  try
    S := '';
    ES := FLineTable.FieldByName('EXTRAMODIFY').AsString;
    if (not FLineTable.IsEmpty) and (RestFormState = rsMenuInfo) then
    begin
      GoodKey := FLineTable.FieldByName('usr$goodkey').AsInteger;
      if not FGoodDataSet.Locate('ID', GoodKey, []) then
        FFrontBase.GetGoodByID(FGoodDataSet, GoodKey);

      if FGoodDataSet.Locate('ID', GoodKey, []) then
      begin
        if FGoodDataSet.FieldByName('MODIFYGROUPKEY').AsInteger <> 0 then
        begin
          FForm := TModificationForm.CreateWithFrontBase(nil, FFrontBase);
          try
            FForm.ModifyGroupKey := FGoodDataSet.FieldByName('MODIFYGROUPKEY').AsInteger;
            FForm.LineModifyTable := FModificationDataSet;
            FForm.GoodName := FGoodDataSet.FieldByName('NAME').AsString;
            if ES <> '' then
              FForm.ExtraModifyString := ES;
            FForm.ShowModal;
            if FForm.ModalResult = mrOK then
            begin
              FModificationDataSet.First;
              while not FModificationDataSet.Eof do
              begin
                if S > '' then
                  S := S + ', ';
                S := S + FModificationDataSet.FieldByName('NAME').AsString;
                FModificationDataSet.Next;
              end;

              ES := FForm.ExtraModifyString;
              if ES <> '' then
              begin
                if S = '' then
                  S := ES
                else
                  S := S + ', ' + ES;
              end;

              FLineTable.Edit;
              FLineTable.FieldByName('MODIFYSTRING').AsString := S;
              FLineTable.FieldByName('EXTRAMODIFY').AsString := ES;
              if FLineTable.FieldByName('STATEFIELD').AsInteger = cn_StateNothing then
                FLineTable.FieldByName('STATEFIELD').AsInteger := cn_StateUpdate;
              FLineTable.Post;

              FGoodInfo.GoodID := GoodKey;
              FGoodInfo.GoodName := FLineTable.FieldByName('GOODNAME').AsString;
              FLogManager.DoOrderGoodLog(GetCurrentUserInfo, GetCurrentOrderInfo, FGoodInfo, ev_ModifyGood);
            end;
          finally
            FForm.Free;
          end;
        end;
      end;
    end;
  finally
    IsActionRun := False;
    btnOK.Enabled := True;
    btnCancel3.Enabled := True;
  end;
end;

procedure TRestMainForm.actKeyBoardExecute(Sender: TObject);
begin
  // TouchKeyBoard.Show;
  // TouchKeyBoard.Keyboard.SetComponentStyle(GetFrontStyle);
  WinExec('osk.exe', 1);
end;

procedure TRestMainForm.actCutCheckExecute(Sender: TObject);
var
  FUserInfo: TUserInfo;
  MainOrderKey: Integer;
begin
  IsActionRun := True;
  btnOK.Enabled := False;
  btnCancel3.Enabled := False;
  try
    // 1. Проверяем пароль менеджера
    FUserInfo := FFrontBase.CheckUserPasswordWithForm;
    if FUserInfo.CheckedUserPassword then
    begin
      if (FUserInfo.UserInGroup and FFrontBase.Options.ManagerGroupMask) = 0 then
      begin
        Touch_MessageBox('Внимание', cn_dontManagerPermission, MB_OK, mtWarning);
        exit;
      end;
      FLogManager.DoOrderLog(GetUserInfo(FUserInfo), GetCurrentOrderInfo, ev_DevideOrder);
      // 2. сохраняем заказ, получаем его ID
      DBGrMain.DataSource := nil;
      try
        FFrontBase.CreateNewOrder(FHeaderTable, FLineTable, FModificationDataSet, MainOrderKey);
      finally
        DBGrMain.DataSource := dsMain;
      end;

      // 3. переход на форму менеджера
      FWithPreCheck := True;
      RestFormState := rsManagerChooseOrder;
      CreateUserList;

      if not Assigned(FSplitForm) then
        FSplitForm := TSplitOrder.Create(nil);
      FSplitForm.MainOrderKey := MainOrderKey;
      FSplitForm.ManagerKey := FUserInfo.UserKey;
    end;
    SaveAllOrder;
  finally
    IsActionRun := False;
    btnOK.Enabled := True;
    btnCancel3.Enabled := True;
  end;
end;

procedure TRestMainForm.actPreCheckExecute(Sender: TObject);
var
  Order: TrfOrder;
begin
  IsActionRun := True;
  btnOK.Enabled := False;
  btnCancel3.Enabled := False;
  try
    if FHeaderTable.FieldByName('usr$timecloseorder').IsNull then
    begin
      ClearDisplay;
      SaveCheck;
      if FReport.ServiceCheckOptions(FHeaderTable.FieldByName('ID').AsInteger) then
      begin
        FFrontBase.SavePrintDate(FHeaderTable.FieldByName('ID').AsInteger);
        FFrontBase.CloseModifyTable(FModificationDataSet);
      end;

      if FReport.PrintPreCheck(1, FHeaderTable.FieldByName('ID').AsInteger) then
      begin
        if FHeaderTable.State = dsBrowse then
          FHeaderTable.Edit;
        FHeaderTable.FieldByName('usr$timecloseorder').AsDateTime := GetServerDateTime;
        FHeaderTable.Post;
        // Укажем в заказе стола что был распечатен пречек
        Order := FTableManager.GetOrder(FHeaderTable.FieldByName('usr$tablekey').AsInteger, FHeaderTable.FieldByName('ID').AsInteger);
        if Assigned(Order) then
          Order.TimeCloseOrder := FHeaderTable.FieldByName('usr$timecloseorder').AsDateTime;

        SaveCheck;
        FPayed := True;
        actCancel.Execute;
      end;
      FLogManager.DoOrderLog(GetCurrentUserInfo, GetCurrentOrderInfo, ev_PrintPreCheck);
    end
    else
      Touch_MessageBox('Внимание', 'Пречек уже был распечатан!', MB_OK, mtWarning);
  finally
    IsActionRun := False;
    btnOK.Enabled := True;
    btnCancel3.Enabled := True;
  end;
end;

procedure TRestMainForm.actCancelPreCheckExecute(Sender: TObject);
var
  FUserInfo: TUserInfo;
  Order: TrfOrder;
begin
  IsActionRun := True;
  btnOK.Enabled := False;
  btnCancel3.Enabled := False;
  try
    FUserInfo := FFrontBase.CheckUserPasswordWithForm;
    if FUserInfo.CheckedUserPassword then
    begin
      if (FUserInfo.UserInGroup and FFrontBase.Options.ManagerGroupMask) <> 0 then
      begin
        if FFrontBase.OrderIsPayed(FHeaderTable.FieldByName('ID').AsInteger) then
          Touch_MessageBox('Внимание', 'Этот заказ уже был оплачен', MB_OK, mtWarning)
        else
        begin
          FHeaderTable.Edit;
          FHeaderTable.FieldByName('usr$timecloseorder').Clear;
          FHeaderTable.Post;

          // Укажем в заказе стола что пречек был отменен
          Order := FTableManager.GetOrder(FHeaderTable.FieldByName('usr$tablekey').AsInteger, FHeaderTable.FieldByName('ID').AsInteger);
          if Assigned(Order) then
            Order.TimeCloseOrder := 0;
        end;
        SaveCheck;

        FFrontBase.SaveOrderLog(FFrontBase.ContactKey, FUserInfo.UserKey, FHeaderTable.FieldByName('ID').AsInteger, 0, 1);
        btnPreCheck.Action := actPreCheck;

        FLogManager.DoOrderLog(GetUserInfo(FUserInfo), GetCurrentOrderInfo, ev_CancelPreCheck);
      end
      else
        Touch_MessageBox('Внимание', cn_dontManagerPermission, MB_OK, mtWarning);
    end;
  finally
    IsActionRun := False;
    btnOK.Enabled := True;
    btnCancel3.Enabled := True;
  end;
end;

procedure TRestMainForm.actDiscountExecute(Sender: TObject);
var
  DiscountType: Integer;
  FSelectForm: TPercOrCard;
  FDiscountTypeForm: TDiscountType;
  FUserInfo: TUserInfo;
  DiscountKey: Integer;
  FChooseDiscountForm: TChooseDiscountCard;
begin
  IsActionRun := True;
  btnOK.Enabled := False;
  btnCancel3.Enabled := False;
  try
    DiscountType := FFrontBase.Options.DiscountType;
    if DiscountType = 0 then
      exit;
    {
      '0 'Нет скидок
      '1 'Процент
      '2 'Карточка
      '3 'Процент + Карточка
      }
    if DiscountType = 3 then
    begin
      FSelectForm := TPercOrCard.Create(nil);
      try
        FSelectForm.ShowModal;
        if FSelectForm.ModalResult = mrOK then
          DiscountType := FSelectForm.DiscountType;

      finally
        FSelectForm.Free;
      end;
    end;

    // Скидка процентом
    if DiscountType = 1 then
    begin
      FUserInfo := FFrontBase.CheckUserPasswordWithForm;
      if FUserInfo.CheckedUserPassword then
      begin
        if (FUserInfo.UserInGroup and FFrontBase.Options.ManagerGroupMask) <> 0 then
        begin
          FLogManager.DoOrderLog(GetUserInfo(FUserInfo), GetCurrentOrderInfo, ev_DiscountPercent);
          FDiscountTypeForm := TDiscountType.Create(nil);
          try
            FDiscountTypeForm.FrontBase := FFrontBase;
            FDiscountTypeForm.ShowModal;
            if FDiscountTypeForm.ModalResult = mrOK then
            begin
              if FDiscountTypeForm.DBLookupComboBox.KeyValue = Null then
                DiscountKey := 0
              else
                DiscountKey := FDiscountTypeForm.DBLookupComboBox.KeyValue;

              if DiscountKey > 0 then
              begin
                if FHeaderTable.State = dsBrowse then
                  FHeaderTable.Edit;

                FHeaderTable.FieldByName('USR$DISCCARDKEY').Clear;
                FHeaderTable.FieldByName('USR$DISCOUNTKEY').AsInteger := DiscountKey;
                FHeaderTable.FieldByName('USR$USERDISCKEY').AsInteger := FUserInfo.UserKey;
                FHeaderTable.Post;
              end;
            end;
          finally
            FDiscountTypeForm.Free;
          end;
        end
        else
        begin
          Touch_MessageBox('Внимание', cn_dontManagerPermission, MB_OK, mtWarning);
          exit;
        end;
      end;
    end
    // Скидка карточкой
    else if DiscountType = 2 then
    begin
      FLogManager.DoOrderLog(GetCurrentUserInfo, GetCurrentOrderInfo, ev_DiscountCard);
      FChooseDiscountForm := TChooseDiscountCard.Create(nil);
      try
        FChooseDiscountForm.UserID := FFrontBase.ContactKey;
        FChooseDiscountForm.FrontBase := FFrontBase;
        FChooseDiscountForm.HeaderTable := FHeaderTable;
        FChooseDiscountForm.Diskid := FHeaderTable.FieldByName('USR$DISCOUNTKEY').AsInteger;
        FChooseDiscountForm.Cardid := FHeaderTable.FieldByName('USR$DISCCARDKEY').AsInteger;
        FChooseDiscountForm.ShowModal;
        if FChooseDiscountForm.ModalResult = mrOK then
          if FChooseDiscountForm.Cardid > 0 then
          begin
            if FHeaderTable.State = dsBrowse then
              FHeaderTable.Edit;

            FHeaderTable.FieldByName('USR$DISCCARDKEY').AsInteger := FChooseDiscountForm.Cardid;
            FHeaderTable.FieldByName('USR$DISCOUNTKEY').AsInteger := FChooseDiscountForm.Diskid;
            FHeaderTable.FieldByName('USR$USERDISCKEY').AsInteger := FFrontBase.ContactKey;

            if Trim(FChooseDiscountForm.usrg_lbBonusPay.Caption) > '' then
              FHeaderTable.FieldByName('USR$BONUSSUM').AsCurrency := StrToCurr(FChooseDiscountForm.usrg_lbBonusPay.Caption)
            else
              FHeaderTable.FieldByName('USR$BONUSSUM').Clear;

            FHeaderTable.Post;
          end
          else
          begin
            if FHeaderTable.State = dsBrowse then
              FHeaderTable.Edit;

            FHeaderTable.FieldByName('USR$DISCCARDKEY').Clear;
            FHeaderTable.FieldByName('USR$DISCOUNTKEY').Clear;
            FHeaderTable.FieldByName('USR$USERDISCKEY').Clear;
            FHeaderTable.Post;
          end;
      finally
        FChooseDiscountForm.Free;
      end;
    end;
  finally
    IsActionRun := False;
    btnOK.Enabled := True;
    btnCancel3.Enabled := True;
  end;
end;

procedure TRestMainForm.actPayExecute(Sender: TObject);
var
  FForm: TSellParamForm;
  SumToPay: Currency;
begin
  IsActionRun := True;
  btnOK.Enabled := False;
  btnCancel3.Enabled := False;
  try
    if FFrontBase.CashCode <> -1 then
    begin
      SaveCheck;
      if FReport.ServiceCheckOptions(FHeaderTable.FieldByName('ID').AsInteger) then
      begin
        FFrontBase.SavePrintDate(FHeaderTable.FieldByName('ID').AsInteger);
        FFrontBase.CloseModifyTable(FModificationDataSet);
      end;
      SumToPay := 0;
      FLineTable.DisableControls;
      try
        FLineTable.First;
        while not FLineTable.Eof do
        begin
          SumToPay := SumToPay + FLineTable.FieldByName('usr$sumncuwithdiscount').AsCurrency;
          FLineTable.Next;
        end;
      finally
        FLineTable.EnableControls;
      end;

      FLogManager.DoOrderLog(GetCurrentUserInfo, GetCurrentOrderInfo, ev_PayOrder);
      if (FFrontBase.Options.NoPrintEmptyCheck) and (SumToPay = 0) then
        exit;

      FForm := TSellParamForm.CreateWithFrontBase(nil, FFrontBase);
      SetCloseTimerActive(false);
      try
        FForm.FiscalRegistry := FFiscal;
        FForm.Doc := FHeaderTable;
        FForm.DocLine := FLineTable;
        FForm.SumToPay := SumToPay;
        FForm.ShowModal;
        if FForm.ModalResult = mrOK then
        begin
          // сохранить и выйти
          SaveCheck;
          FPayed := True;
          actCancel.Execute;
        end;
      finally
        SetCloseTimerActive(not FFrontBase.Options.NoPassword);
        FForm.Free;
      end;
    end
    else
      Touch_MessageBox('Внимание', 'Для данной рабочей станции не указан кассовый терминал!', MB_OK, mtWarning);
  finally
    IsActionRun := False;
    btnOK.Enabled := True;
    btnCancel3.Enabled := True;
  end;
end;

procedure TRestMainForm.SetCloseTimerActive(const AIsActive: Boolean);
begin
  tmrClose.Enabled := AIsActive;
  tmrClose.Tag := 1;
end;

procedure TRestMainForm.SetFormState(const Value: TRestState);
begin
  // Сохраним предыдущий режим окна
  FPrevFormState := FRestFormState;
  FRestFormState := Value;
  // Выполним необходимые действия перед установкой нового режима окна
  BeforeRestFormStateChanged;

  if (FRestFormState = rsKassirInfo) or (FPrevFormState = rsKassirInfo) then
    FViewMode := True
  else
    FViewMode := False;

  case Value of
    rsPass:
      begin
        LockWindowUpdate(Handle);
        try
          // 2.Становимся на окно с пассом
          pcMain.ActivePage := tsPassWord;
          pcMenu.ActivePage := tsMenu;
          pcExtraButton.ActivePage := tsMainButton;
          pcOrder.ActivePage := tsUserOrder;
          // 3.Активый эдит
          ActiveControl := edPassword;
          edPassword.Text := '';
          // 4.
          pnlMainGood.Visible := False;
          pnlChoose.Visible := False;
          pnlExtraGoodGroup.Visible := False;
          // 5. установки кнопок
          FMenuButtonCount := 0;

          FLastLeftButton := 18 + btnWidth {$IFDEF NEW_TABCONTROL} + 4 {$ENDIF}; ;
          FGroupLastLeftButton := btnFirstTop;
          FMenuLastLeftButton := { btnFirstTop } 2 {$IFDEF NEW_TABCONTROL} + 4 {$ENDIF};
          FLastTopButton := btnFirstTop;
          FGroupLastTop := btnFirstTop;
          FGoodLastTop := btnFirstTop;
          FGoodLastLeftButton := btnFirstTop;
          FMenuLastTop := btnFirstTop; // -(btnHeight);
          FHallLastTop := -(btnHeight);
          FTableChooseLastTop := -(btnHeight);

          FOrderButtonNumber := 1;
          FMenuButtonNumber := 1;
          FGroupButtonNumber := 1;
          FHallButtonNumber := 1;
          FUserButtonNumber := 1;

          FMenuFirstTop := btnFirstTop;
          FGoodFirstTop := btnFirstTop;
          FGroupFirstTop := btnFirstTop;
          FHallFisrtTop := btnFirstTop;
          FTableChooseTop := btnFirstTop;

          FUserFirstTop := btnFirstTop;
          FUserLastLeftButton := btnFirstTop;
          FUserLastTop := btnFirstTop;

          FUserOrderFirstTop := btnFirstTop;
          FUserOrderLastLeftButton := btnFirstTop;
          FUserOrderLastTop := btnFirstTop;
          FUserOrderButtonNumber := btnFirstTop;

          FMenuKey := -1;
          FLineID := 1;
          FWithPreCheck := True;

          FHeaderTable.Close;
          FHeaderTable.CreateTable;
          FHeaderTable.Open;

          FLineTable.Close;
          FLineTable.CreateTable;
          FLineTable.Open;

          RemoveOrderButton;
          RemoveMenuButton;
          RemoveUserButton;
          RemoveUserOrderButton;
          RemoveHallButton;

          tmrTables.Enabled := False;
          // ClearDisplay;
        finally
          LockWindowUpdate(0);
        end;
      end;

    rsOrderMenu:
      begin
        LockWindowUpdate(Handle);
        try
          pcMain.ActivePage := tsMain;
          pcOrder.ActivePage := tsUserOrder;
          pcExtraButton.ActivePage := tsOrderButton;
          pcMenu.ActivePage := tsMenu;
          pnlChoose.Visible := False;
          pnlMainGood.Visible := False;
          tsManagerPage.Visible := False;
          tsTablePage.Visible := False;
          pnlRight.Visible := False;
          btnSwapTable.Visible := False;
          btnUnblockTable.Visible := False;
          RemoveGoodButton;
          RemoveGroupButton;
          RemoveOrderButton;
          RemoveMenuButton;
          RemoveHallButton;
          RemoveChooseTable;
          //
          FTablesInfoTable.Close;
          FTablesInfoTable.CreateTable;
          FTablesInfoTable.Open;
          //

          FLastLeftButton := 18 + btnWidth {$IFDEF NEW_TABCONTROL} + 4 {$ENDIF};
          FMenuLastLeftButton := { btnFirstTop } 2 {$IFDEF NEW_TABCONTROL} + 4 {$ENDIF};
          FLastTopButton := btnFirstTop;
          // FMenuLastTop    := -(btnHeight);
          FMenuButtonCount := 0;
          FGroupLastTop := btnFirstTop;
          FMenuLastTop := btnFirstTop;

          FUserFirstTop := btnFirstTop;
          FUserLastLeftButton := btnFirstTop;
          FUserLastTop := btnFirstTop;
          FUserButtonNumber := 1;

          FUserOrderFirstTop := btnFirstTop;
          FUserOrderLastLeftButton := btnFirstTop;
          FUserOrderLastTop := btnFirstTop;
          FUserOrderButtonNumber := 1;

          FLineID := 1;
          // FWithPreCheck := True;

          FFrontBase.GetUserOrders(-1, FOrderDataSet);

          CreateOrderButtonList;
          CreateMenuButtonList;
          AddPopularGoods;

          SetCloseTimerActive(not FFrontBase.Options.NoPassword);
          tmrTables.Enabled := False;

          ClearDisplay;
        finally
          LockWindowUpdate(0);
        end;
      end;

    rsHallsPage:
      begin
        LockWindowUpdate(Handle);
        try
          FHallButtonNumber := 1;
          FHallLastTop := -(btnHeight);
          FTableChooseLastTop := -(btnHeight);

          pcMain.ActivePage := tsMain;
          pcOrder.ActivePage := tsTablePage;
          // Панель управления слева
          pcExtraButton.ActivePage := tsOrderButton;
          pcMenu.ActivePage := tsHalls;
          pnlChoose.Visible := True;
          pnlMainGood.Visible := False;
          tsManagerPage.Visible := False;
          tsTablePage.Visible := True;
          pnlRight.Visible := True;
          btnSwapTable.Visible := True;
          btnUnblockTable.Visible := True;
          RemoveGoodButton;
          RemoveGroupButton;
          RemoveOrderButton;
          RemoveMenuButton;
          RemoveHallButton;
          // Удалить зал
          EraseHall;
          RemoveChooseTable;
          //
          FTablesInfoTable.Close;
          FTablesInfoTable.CreateTable;
          FTablesInfoTable.Open;
          //

          FLastLeftButton := 18 + btnWidth {$IFDEF NEW_TABCONTROL} + 4 {$ENDIF};
          FMenuLastLeftButton := { btnFirstTop } 2 {$IFDEF NEW_TABCONTROL} + 4 {$ENDIF};
          FLastTopButton := btnFirstTop;
          // FMenuLastTop    := -(btnHeight);
          FMenuButtonCount := 0;
          FGroupLastTop := btnFirstTop;
          FMenuLastTop := btnFirstTop;

          FUserFirstTop := btnFirstTop;
          FUserLastLeftButton := btnFirstTop;
          FUserLastTop := btnFirstTop;
          FUserButtonNumber := 1;

          FUserOrderFirstTop := btnFirstTop;
          FUserOrderLastLeftButton := btnFirstTop;
          FUserOrderLastTop := btnFirstTop;
          FUserOrderButtonNumber := 1;

          FLineID := 1;
          FWithPreCheck := True;
          tmrTables.Enabled := False;

          FFrontBase.GetHallsInfo(FHallsTable);
          if FHallsTable.RecordCount = 1 then
          begin
            pnlRight.Visible := False;

            RemoveChooseTable;
            // План зала
            CreateHall(FHallsTable.FieldByName('ID').AsInteger);

            if FRestFormState = rsHallEdit then
            begin
              pcMenu.ActivePage := tsTablesDesigner;
              AddChooseTables(FHallsTable.FieldByName('ID').AsInteger);
            end
            else
              tmrTables.Enabled := True;
          end
          else
            CreateHallButtonList;
          CreateMenuButtonList;
          AddPopularGoods;

          dxfDesigner.EditControl := nil;
          dxfDesigner.Active := False;

          SetCloseTimerActive(not FFrontBase.Options.NoPassword);

          ClearDisplay;
        finally
          LockWindowUpdate(0);
        end;
      end;

    // Редактирование зала
    rsHallEdit:
      begin
        LockWindowUpdate(Handle);
        try
          FHallButtonNumber := 1;
          FHallLastTop := -(btnHeight);
          FTableChooseLastTop := -(btnHeight);

          pcMain.ActivePage := tsMain;
          pcOrder.ActivePage := tsTablePage;
          // Панель управления слева
          pcExtraButton.ActivePage := tsEmpty;
          pcMenu.ActivePage := tsHalls;
          pnlChoose.Visible := True;
          pnlMainGood.Visible := False;
          tsManagerPage.Visible := False;
          tsTablePage.Visible := True;
          pnlRight.Visible := True;
          btnOK2.Visible := True;
          btnReturnGoodSum.Visible := False;
          RemoveGoodButton;
          RemoveGroupButton;
          RemoveOrderButton;
          RemoveMenuButton;
          RemoveHallButton;
          // Удалить зал
          EraseHall;
          RemoveChooseTable;
          //
          FTablesInfoTable.Close;
          FTablesInfoTable.CreateTable;
          FTablesInfoTable.Open;
          //

          FLastLeftButton := 18 + btnWidth {$IFDEF NEW_TABCONTROL} + 4 {$ENDIF};
          FMenuLastLeftButton := { btnFirstTop } 2 {$IFDEF NEW_TABCONTROL} + 4 {$ENDIF};
          FLastTopButton := btnFirstTop;
          // FMenuLastTop    := -(btnHeight);
          FMenuButtonCount := 0;
          FGroupLastTop := btnFirstTop;
          FMenuLastTop := btnFirstTop;

          FUserFirstTop := btnFirstTop;
          FUserLastLeftButton := btnFirstTop;
          FUserLastTop := btnFirstTop;
          FUserButtonNumber := 1;

          FUserOrderFirstTop := btnFirstTop;
          FUserOrderLastLeftButton := btnFirstTop;
          FUserOrderLastTop := btnFirstTop;
          FUserOrderButtonNumber := 1;

          FLineID := 1;
          FWithPreCheck := True;

          FFrontBase.GetHallsInfo(FHallsTable);
          CreateHallButtonList;

          dxfDesigner.EditControl := sbTable;
          dxfDesigner.Active := True;

          SetCloseTimerActive(not FFrontBase.Options.NoPassword);
          tmrTables.Enabled := False;

          ClearDisplay;
        finally
          LockWindowUpdate(0);
        end;
      end;

    rsMenuInfo:
      begin
        RemoveHallButton;
        RemoveChooseTable;

        pcMenu.ActivePage := tsMenu;

        pnlRight.Visible := True;
        // Панель управления слева
        pcExtraButton.ActivePage := tsFunctionButton;
        pcOrder.ActivePage := tsOrderInfo;
        pnlChoose.Visible := True;
        FPayed := False;
        tmrTables.Enabled := False;

        // Информация о заказе
        lblOrderInfoUserName.Caption := FFrontBase.GetNameWaiterOnID(FHeaderTable.FieldByName('usr$respkey').AsInteger, True, False);
        if not FHeaderTable.Eof then
          lblOrderInfoTableNumber.Caption := FHeaderTable.FieldByName('number').AsString;
      end;

    rsManagerInfo:
      begin
        pcMain.ActivePage := tsManagerInfo;
        // Панель управления слева
        pcExtraButton.ActivePage := tsManagerInfoButton;
        pnlRight.Visible := False;
        // 1. создаем структуры шапки и позиции
        if not Assigned(FHeaderInfoTable) then
          FHeaderInfoTable := TkbmMemTable.Create(nil);
        if not Assigned(FLineInfoTable) then
          FLineInfoTable := TkbmMemTable.Create(nil);
        // 2. проставить начальное значение кнопок выбора
        xDateBegin.Date := GetServerDateTime;
        xDateEnd.Date := GetServerDateTime;
        // 3. загрузить данные
        FFrontBase.GetOrdersInfo(FHeaderInfoTable, FLineInfoTable, xDateBegin.Date, xDateEnd.Date, False, False, False, False);

        AfterLoadManagerInfo;
        DBGrInfoHeader.DataSource := dsHeaderInfo;
        DBGrInfoLine.DataSource := dsLineInfo;
        tmrTables.Enabled := False;

        ClearDisplay;
      end;

    rsManagerPage:
      begin
        LockWindowUpdate(Handle);
        try
          RemoveUserButton;
          RemoveUserOrderButton;

          pnlRight.Visible := False;
          btnPrecheckOrders.Visible := False;
          btnWithOutPrecheckOrders.Visible := False;
          FWithPreCheck := False;

          pcOrder.ActivePage := tsManagerPage;
          // Панель управления слева
          pcExtraButton.ActivePage := tsEmpty;
          btnOK2.Visible := False;
          btnReturnGoodSum.Visible := False;

          FUserFirstTop := btnFirstTop;
          FUserLastLeftButton := btnFirstTop;
          FUserLastTop := -(btnHeight - 6);
          FUserButtonNumber := 1;

          FUserOrderFirstTop := btnFirstTop;
          FUserOrderLastLeftButton := btnFirstTop;
          FUserOrderLastTop := btnFirstTop;
          FUserOrderButtonNumber := btnFirstTop;
          FMaxUserOrderButtonLeft := btnFirstTop;

          FLineID := 1;

          lblResp.Caption := FFrontBase.GetNameWaiterOnID(FFrontBase.ContactKey, True, False);

          tmrTables.Enabled := False;
          ClearDisplay;
        finally
          LockWindowUpdate(0);
        end;
      end;

    rsManagerChooseOrder:
      begin
        LockWindowUpdate(Handle);
        try
          RemoveUserButton;
          RemoveUserOrderButton;

          pcMenu.ActivePage := tsMenu;
          pnlChoose.Visible := False;
          pnlMainGood.Visible := False;
          pnlRight.Visible := False;

          btnPrecheckOrders.Visible := True;
          btnWithOutPrecheckOrders.Visible := True;
          if FWithPreCheck then
          begin
            btnPrecheckOrders.Down := True;
            btnWithOutPrecheckOrders.Down := False;
          end
          else
          begin
            btnWithOutPrecheckOrders.Down := True;
            btnPrecheckOrders.Down := False;
          end;

          pcOrder.ActivePage := tsManagerPage;
          // Панель управления слева
          pcExtraButton.ActivePage := tsEmpty;
          btnOK2.Visible := False;
          btnReturnGoodSum.Visible := False;

          FUserFirstTop := btnFirstTop;
          FUserLastLeftButton := btnFirstTop;
          FUserLastTop := -(btnHeight - 6);
          FUserButtonNumber := 1;

          FUserOrderFirstTop := btnFirstTop;
          FUserOrderLastLeftButton := btnFirstTop;
          FUserOrderLastTop := btnFirstTop;
          FUserOrderButtonNumber := btnFirstTop;
          FMaxUserOrderButtonLeft := btnFirstTop;

          FLineID := 1;

          lblResp.Caption := FFrontBase.GetNameWaiterOnID(FFrontBase.ContactKey, True, False);

          tmrTables.Enabled := False;
          ClearDisplay;
        finally
          LockWindowUpdate(0);
        end;
      end;

    rsKassirInfo:
      begin
        LockWindowUpdate(Handle);
        try
          RemoveUserButton;
          RemoveUserOrderButton;

          pcMenu.ActivePage := tsMenu;
          pnlChoose.Visible := False;
          pnlMainGood.Visible := False;
          pnlRight.Visible := False;

          btnPrecheckOrders.Visible := True;
          btnWithOutPrecheckOrders.Visible := True;
          if FWithPreCheck then
          begin
            btnPrecheckOrders.Down := True;
            btnWithOutPrecheckOrders.Down := False;
          end
          else
          begin
            btnWithOutPrecheckOrders.Down := True;
            btnPrecheckOrders.Down := False;
          end;

          pcOrder.ActivePage := tsManagerPage;
          // Панель управления слева
          pcExtraButton.ActivePage := tsEmpty;
          btnOK2.Visible := False;
          btnReturnGoodSum.Visible := True;

          FUserFirstTop := btnFirstTop;
          FUserLastLeftButton := btnFirstTop;
          FUserLastTop := -(btnHeight - 6);
          FUserButtonNumber := 1;

          FUserOrderFirstTop := btnFirstTop;
          FUserOrderLastLeftButton := btnFirstTop;
          FUserOrderLastTop := btnFirstTop;
          FUserOrderButtonNumber := btnFirstTop;
          FMaxUserOrderButtonLeft := btnFirstTop;

          FLineID := 1;

          lblResp.Caption := FFrontBase.GetNameWaiterOnID(FFrontBase.ContactKey, True, False);

          tmrTables.Enabled := False;
          ClearDisplay;
        finally
          LockWindowUpdate(0);
        end;
      end;

  end;
end;

procedure TRestMainForm.AddUserButton(const AUser: TrfUser);
var
  FButton: TAdvSmoothButton;
begin
  // Создание кнопки
  FButton := TAdvSmoothButton.Create(pnlUsers);
  FButton.Appearance.BeginUpdate;
  try
    SetButtonStyle(FButton);
    FButton.Color := btnColor;
    FButton.Appearance.Font.Size := cn_ButtonFontSize;
    FButton.Parent := pnlUsers;
    FButton.Name := Format(btnUserName, [FUserButtonNumber]);
    FButton.Height := btnHeight;
    FButton.Width := btnLongWidth - 40;

    FUserLastTop := FUserLastTop + btnHeight + 2;

    FButton.Left := btnFirstTop;
    FButton.Top := FUserLastTop;

    FButton.Tag := AUser.ID;
    FButton.Caption := AUser.Name;
  finally
    FButton.Appearance.EndUpdate;
  end;
  FUsersButtonList.Add(FButton);
  Inc(FUserButtonNumber);
end;

procedure TRestMainForm.CreateUserList;
var
  UserList: TList<TrfUser>;
  User: TrfUser;
  OrderTable: TkbmMemTable;
begin
  LockWindowUpdate(Handle);
  try
    UserList := TList<TrfUser>.Create;
    try
      FFrontBase.GetActiveWaiterList(UserList, FWithPreCheck);
      if UserList.Count > 0 then
      begin
        OrderTable := TkbmMemTable.Create(nil);
        OrderTable.FieldDefs.Add('TableName', ftString, 20);
        OrderTable.FieldDefs.Add('GuestNumbers', ftInteger, 0);
        OrderTable.FieldDefs.Add('OpenTime', ftDateTime, 0);
        OrderTable.FieldDefs.Add('Summ', ftCurrency, 0);
        OrderTable.FieldDefs.Add('Status', ftInteger, 0);
        OrderTable.FieldDefs.Add('ID', ftInteger, 0);
        OrderTable.FieldDefs.Add('ISLOCKED', ftInteger, 0);
        OrderTable.FieldDefs.Add('USR$COMPUTERNAME', ftString, 20);
        OrderTable.CreateTable;
        OrderTable.Open;
        try
          for User in UserList do
          begin
            // if (UserTable.FieldByName('InGroup').AsInteger and FFrontBase.Options.WaiterGroupMask) <> 0 then
            // begin
            // 1. Отрисовываем кнопку
            AddUserButton(User);
            // 2. Смотрим для контакта список заказов
            // FFrontBase.GetUserOrders(UserTable.FieldByName('ID').AsInteger, OrderTable);
            FFrontBase.GetUserOrdersPrecheck(User.ID, OrderTable, FWithPreCheck);
            OrderTable.First;
            // 3. Отрисовываем заказы
            FUserOrderLastTop := FUserLastTop;
            FUserOrderLastLeftButton := btnFirstTop;
            while not OrderTable.Eof do
            begin
              AddUserOrderButton(OrderTable);

              OrderTable.Next;
            end;
            if FMaxUserOrderButtonLeft < FUserOrderLastLeftButton then
              FMaxUserOrderButtonLeft := FUserOrderLastLeftButton;
          end;
          FUserOrderLastLeftButton := btnFirstTop;
        finally
          OrderTable.Free;
        end;
      end;
    finally
      for User in UserList do
        User.Free;
      FreeAndNil(UserList);
    end;
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TRestMainForm.RemoveUserButton;
begin
  FUsersButtonList.Clear;
end;

procedure TRestMainForm.AddUserOrderButton(const MemTable: TkbmMemTable);
var
  FButton: TAdvSmoothButton;
begin
  // Создание кнопки
  FButton := TAdvSmoothButton.Create(pnlUserOrders);
  FButton.Appearance.BeginUpdate;
  try
    SetButtonStyle(FButton);
    FButton.Color := btnColor;
    FButton.Appearance.Font.Size := cn_ButtonFontSize;
    FButton.Parent := pnlUserOrders;
    if (RestFormState = rsManagerPage) or (RestFormState = rsKassirInfo) then
      FButton.OnClick := OrderButtonOnClick
    else
      FButton.OnClick := SplitButtonOnClick;
    FButton.Name := Format(btnUserOrderName, [FUserOrderButtonNumber]);
    FButton.Height := BTN_USERORDER_HEIGHT;
    FButton.Width := BTN_USERORDER_WIDTH;

    FButton.Left := FUserOrderLastLeftButton;
    FButton.Top := FUserOrderLastTop;

    FButton.Tag := MemTable.FieldByName('ID').AsInteger;
    FButton.Caption := MemTable.FieldByName('TableName').AsString;
    FButton.Status.Caption := MemTable.FieldByName('Summ').AsString;
    FButton.Status.Visible := True;
    FButton.Status.Appearance.Font.Size := cn_ButtonSmallFontSize;
    if MemTable.FieldByName('Status').AsInteger = Integer(osOrderClose) then
    begin
      FButton.Status.Appearance.Fill.Color := clRed;
      FButton.Status.Appearance.Fill.ColorTo := clRed;
    end;
  finally
    FButton.Appearance.EndUpdate;
  end;

  FUserOrderLastLeftButton := FUserOrderLastLeftButton + FButton.Width + BTN_USERORDER_MARGIN;

  FUsersOrderButtonList.Add(FButton);
  Inc(FUserOrderButtonNumber);
end;

procedure TRestMainForm.btnAllChecClick(Sender: TObject);
begin
  dsHeaderInfo.DataSet := nil;
  dsLineInfo.DataSet := nil;
  try
    FFrontBase.GetOrdersInfo(FHeaderInfoTable, FLineInfoTable, xDateBegin.Date, xDateEnd.Date, False, False, False, False);
  finally
    AfterLoadManagerInfo;
  end;
end;

procedure TRestMainForm.btnCheckRegisterClick(Sender: TObject);
var
  FForm: TChooseEmpl;
begin
//  FReport.PrintCheckRegister(xDateBegin.Date, xDateEnd.Date);
  FForm := TChooseEmpl.Create(nil);
  SetCloseTimerActive(False);
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
    SetCloseTimerActive(not FFrontBase.Options.NoPassword);
    FForm.Free;
  end;
end;

procedure TRestMainForm.btnWithPrecheckClick(Sender: TObject);
begin
  dsHeaderInfo.DataSet := nil;
  dsLineInfo.DataSet := nil;
  try
    FFrontBase.GetOrdersInfo(FHeaderInfoTable, FLineInfoTable, xDateBegin.Date, xDateEnd.Date, True, False, False, False);
  finally
    AfterLoadManagerInfo;
  end;
end;

procedure TRestMainForm.btnWithoutPrecheckClick(Sender: TObject);
begin
  dsHeaderInfo.DataSet := nil;
  dsLineInfo.DataSet := nil;
  try
    FFrontBase.GetOrdersInfo(FHeaderInfoTable, FLineInfoTable, xDateBegin.Date, xDateEnd.Date, False, True, False, False);
  finally
    AfterLoadManagerInfo;
  end;
end;

procedure TRestMainForm.btnWithOutPrecheckOrdersClick(Sender: TObject);
var
  FState: TRestState;
begin
  if btnWithOutPrecheckOrders.Down then
  begin
    FState := RestFormState;
    RestFormState := rsOrderMenu;
    FWithPreCheck := False;
    RestFormState := FState;
    CreateUserList;
  end;
end;

procedure TRestMainForm.btnPayedClick(Sender: TObject);
begin
  dsHeaderInfo.DataSet := nil;
  dsLineInfo.DataSet := nil;
  try
    FFrontBase.GetOrdersInfo(FHeaderInfoTable, FLineInfoTable, xDateBegin.Date, xDateEnd.Date, False, False, True, False);
  finally
    AfterLoadManagerInfo;
  end;
end;

procedure TRestMainForm.btnNotPayedClick(Sender: TObject);
begin
  dsHeaderInfo.DataSet := nil;
  dsLineInfo.DataSet := nil;
  try
    FFrontBase.GetOrdersInfo(FHeaderInfoTable, FLineInfoTable, xDateBegin.Date, xDateEnd.Date, False, False, False, True);
  finally
    AfterLoadManagerInfo;
  end;
end;

procedure TRestMainForm.AfterConstruction;
{$IFNDEF DEBUG}
var
  SysMenu: HMenu;
{$ENDIF}
begin
  inherited;
{$IFNDEF DEBUG}
  WindowState := wsMaximized;
  BorderIcons := BorderIcons + [biSystemMenu, biMaximize];
  SysMenu := GetSystemMenu(Handle, False);
  Windows.EnableMenuItem(SysMenu, SC_CLOSE, MF_DISABLED or MF_GRAYED);
  GetSystemMenu(Handle, False);
  Perform(WM_NCPAINT, Handle, 0);
{$ENDIF}
end;

procedure TRestMainForm.AfterLoadManagerInfo;
begin
  dsHeaderInfo.DataSet := FHeaderInfoTable;
  dsLineInfo.DataSet := FLineInfoTable;
  FLineInfoTable.MasterSource := dsHeaderInfo;
  FLineInfoTable.MasterFields := 'ID';
  FLineInfoTable.DetailFields := 'PARENT';
  FHeaderInfoTable.First;
  if DBGrInfoHeader.CanFocus then
    DBGrInfoHeader.SetFocus;
end;

procedure TRestMainForm.BeforeRestFormStateChanged;
begin
  if FPrevFormState = rsHallsPage then
  begin
    // Очистим переменные используемые для смены стола
    if Assigned(FSwapTableFrom) then
    begin
      FSwapTableFrom.Checked := False;
      FSwapTableFrom := nil;
    end;
    btnSwapTable.Down := False;
    btnUnblockTable.Down := False;
  end;
end;

procedure TRestMainForm.RemoveUserOrderButton;
begin
  FUsersOrderButtonList.Clear;
end;

procedure TRestMainForm.actUsersUpExecute(Sender: TObject);
var
  TempLastTop, TempFirstTop: Integer;
begin
  LockWindowUpdate(Handle);
  try
    TempLastTop := FUserLastTop;
    TempFirstTop := FUserFirstTop;
    ScrollControl(pnlUsers, False, FUserFirstTop, FUserLastTop);
    ScrollControl(pnlUserOrders, False, TempFirstTop, TempLastTop);
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TRestMainForm.actUnblockTableUpdate(Sender: TObject);
begin
  actSwapTable.Enabled := ((FFrontBase.UserKey and FFrontBase.Options.ManagerGroupMask) <> 0);
  btnUnblockTable.Enabled := actSwapTable.Enabled;
end;

procedure TRestMainForm.actUsersDownExecute(Sender: TObject);
var
  TempLastTop, TempFirstTop: Integer;
begin
  LockWindowUpdate(Handle);
  try
    TempLastTop := FUserLastTop;
    TempFirstTop := FUserFirstTop;
    ScrollControl(pnlUsers, True, FUserFirstTop, FUserLastTop);
    ScrollControl(pnlUserOrders, True, TempFirstTop, TempLastTop);
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TRestMainForm.actDevideExecute(Sender: TObject);
var
  FForm: TDevideForm;
  GoodKey: Integer;
  FGoodInfo: TLogGoodInfo;
begin
  IsActionRun := True;
  btnOK.Enabled := False;
  btnCancel3.Enabled := False;
  try
    if (not FLineTable.IsEmpty) and (RestFormState = rsMenuInfo) then
    begin
      GoodKey := FLineTable.FieldByName('usr$goodkey').AsInteger;
      if FGoodDataSet.Locate('ID', GoodKey, []) then
      begin
        // if FGoodDataSet.FieldByName('BEDIVIDE').AsInteger = 1 then
        // begin
        FForm := TDevideForm.Create(nil);
        FForm.LabelCaption := 'Количество';
        FForm.CanDevided := (FGoodDataSet.FieldByName('BEDIVIDE').AsInteger = 1);
        try
          FForm.ShowModal;
          if FForm.ModalResult = mrOK then
          begin
            try
              if StrToCurr(FForm.Number) > 0 then
              begin
                FLineTable.Edit;
                FLineTable.FieldByName('usr$quantity').AsCurrency := StrToCurr(FForm.Number);
                FLineTable.Post;

                FGoodInfo.GoodID := GoodKey;
                FGoodInfo.GoodName := FLineTable.FieldByName('GOODNAME').AsString;
                FGoodInfo.Quantity := FLineTable.FieldByName('usr$quantity').AsCurrency;
                FLogManager.DoOrderGoodLog(GetCurrentUserInfo, GetCurrentOrderInfo, FGoodInfo, ev_DevideQuantityGood);
              end;
            except
              on E: Exception do
              begin
                if E is EConvertError then
                  Touch_MessageBox('Внимание', 'Введено неверное число', MB_OK, mtWarning)
                else
                  Touch_MessageBox('Внимание', 'Ошибка ' + E.Message, MB_OK, mtError);
              end;
            end;
          end;
        finally
          FForm.Free;
        end;
        // end;
      end;
    end;
    SaveAllOrder;
  finally
    IsActionRun := False;
    btnOK.Enabled := True;
    btnCancel3.Enabled := True;
  end;
end;

procedure TRestMainForm.WritePos(DataSet: TDataSet);
begin
  FFrontBase.Display.WritePos(DataSet.FieldByName('GOODNAME').AsString, DataSet.FieldByName('usr$quantity').AsCurrency,
    DataSet.FieldByName('usr$costncu').AsCurrency);
end;

procedure TRestMainForm.ChooseTableOnClick(Sender: TObject);
var
  FForm: TDevideForm;
  FChooseButton: TChooseTable;
begin
  FForm := TDevideForm.Create(nil);
  try
    FForm.Caption := 'Номер стола';
    FForm.CanDevided := False;
    FForm.LabelCaption := 'Введите номер стола';
    FForm.ShowModal;
    if FForm.ModalResult = mrOK then
    begin
      FChooseButton := TChooseTable(Sender);
      // Добавим новый стол
      FTableManager.AddTable(FForm.Number, FChooseButton);
    end;
  finally
    FForm.Free;
  end;
end;

procedure TRestMainForm.ClearDisplay;
begin
  FFrontBase.Display.Clear;
end;

procedure TRestMainForm.DeleteOrderLine(var Amount: Currency; const CauseKey: Integer);
var
  OldQuantity: Currency;
  OldDetailID, MasterKey: Integer;
  V: Array of Variant;
  I: Integer;
  PrnGrid, DocumentKey: Integer;
  PrinterName: String;
  PrinterID: Integer;
begin
  OldQuantity := FLineTable.FieldByName('usr$quantity').AsCurrency;
  OldDetailID := FLineTable.FieldByName('ID').AsInteger;

  if (OldQuantity - Amount) < 0 then
    Amount := OldQuantity;

  FLineTable.Edit;
  FLineTable.FieldByName('usr$quantity').AsCurrency := OldQuantity - Amount;
  if FLineTable.FieldByName('STATEFIELD').AsInteger = cn_StateNothing then
    FLineTable.FieldByName('STATEFIELD').AsInteger := cn_StateUpdate;
  FLineTable.Post;

  SetLength(V, FLineTable.FieldCount);
  for I := 0 to FLineTable.FieldCount - 1 do
  begin
    if FLineTable.Fields[I].IsNull then
      V[I] := FLineTable.Fields[I].Value
    else
      V[I] := FLineTable.Fields[I].AsString;
  end;

  // скопируем запись
  FLineTable.Append;
  for I := 0 to FLineTable.FieldCount - 1 do
    if VarIsNull(V[I]) then
      FLineTable.Fields[I].Clear
    else
      FLineTable.Fields[I].AsString := V[I];
  DocumentKey := FFrontBase.GetNextID;
  FLineTable.FieldByName('ID').AsInteger := DocumentKey;
  FLineTable.FieldByName('LINEKEY').AsInteger := FLineID;
  FLineTable.FieldByName('USR$QUANTITY').AsCurrency := Amount;
  FLineTable.FieldByName('STATEFIELD').AsInteger := cn_StateInsert;
  FLineTable.FieldByName('usr$causedeletekey').AsInteger := CauseKey;
  FLineTable.Post;

  Inc(FLineID);

  MasterKey := FHeaderTable.FieldByName('ID').AsInteger;
  SaveCheck;

  // update grid footer
  DBGrMain.SumList.RecalcAll;

  if FFrontBase.GetDeleteServiceCheckOptions(OldDetailID, MasterKey, PrinterName, PrnGrid, PrinterID) then
    FReport.PrintDeleteServiceCheck(1, PrnGrid, MasterKey, DocumentKey, PrinterName, PrinterID);
end;

{ procedure TRestMainForm.OnFilterLine(DataSet: TDataSet;
  var Accept: Boolean);
  begin
  Accept := ((DataSet.FieldByName('usr$quantity').AsCurrency > 0)
  and (DataSet.FieldByName('usr$causedeletekey').AsInteger = 0));
  end; }

procedure TRestMainForm.DBGridEh2Columns0GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  S: String;
  Width: Integer;
begin
  if FLineTable.FieldByName('MODIFYSTRING').AsString <> '' then
  begin
    Width := DBGrMain.Columns[0].Width div 10;
    S := Params.Text;
    if Length(S) > Width then
    begin
      Delete(S, Width, Length(S));
      Params.Text := S;
    end;

    S := FLineTable.FieldByName('MODIFYSTRING').AsString;
    if S > '' then
      Params.Text := Params.Text + #13#10 + S
  end;
  if FLineTable.FieldByName('usr$mn_printdate').AsString = '' then
  begin
    Params.Font.Color := clGreen;
    Params.Font.Style := [fsBold];
  end
  else
    Params.Font.Color := clGrayText;
end;

procedure TRestMainForm.DBGrInfoHeaderAdvDrawDataCell(Sender: TCustomDBGridEh; Cell, AreaCell: TGridCoord; Column: TColumnEh;
  const ARect: TRect; var Params: TColCellParamsEh; var Processed: Boolean);
begin
  inherited;
  if Sender.DataSource.DataSet.FieldByName('USR$PAY').AsInteger = 1 then
    Params.Font.Color := clFuchsia;
  if Sender.DataSource.DataSet.FieldByName('USR$VIP').AsInteger = 1 then
    Params.Font.Color := clTeal;
  if Sender.DataSource.DataSet.FieldByName('DISABLED').AsInteger = 1 then
    Params.Font.Color := clRed;
end;

procedure TRestMainForm.DBGrInfoLineAdvDrawDataCell(Sender: TCustomDBGridEh; Cell, AreaCell: TGridCoord; Column: TColumnEh;
  const ARect: TRect; var Params: TColCellParamsEh; var Processed: Boolean);
begin
  inherited;
  if Sender.DataSource.DataSet.FieldByName('U_USR$CAUSEDELETEKEY_USR$NAME').AsString > '' then
    Params.Font.Color := clRed;
end;

procedure TRestMainForm.DBGrMainColumns1GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if FLineTable.FieldByName('usr$mn_printdate').AsString = '' then
  begin
    Params.Font.Color := clGreen;
    Params.Font.Style := [fsBold];
  end
  else
    Params.Font.Color := clGrayText;
end;

procedure TRestMainForm.DBGrMainColumns2GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if FLineTable.FieldByName('USR$PERSDISCOUNT').AsCurrency > 0 then
    Params.Text := Params.Text + #13#10 +
      FLineTable.FieldByName('USR$PERSDISCOUNT').AsString + '%';

  if FLineTable.FieldByName('usr$mn_printdate').AsString = '' then
  begin
    Params.Font.Color := clGreen;
    Params.Font.Style := [fsBold];
  end
  else
    Params.Font.Color := clGrayText;
end;

procedure TRestMainForm.DBGrMainColumns3GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if FLineTable.FieldByName('usr$mn_printdate').AsString = '' then
  begin
    Params.Font.Color := clGreen;
    Params.Font.Style := [fsBold];
  end
  else
    Params.Font.Color := clGrayText;
end;

procedure TRestMainForm.btnPrecheckOrdersClick(Sender: TObject);
var
  FState: TRestState;
begin
  if btnPrecheckOrders.Down then
  begin
    FState := RestFormState;
    RestFormState := rsOrderMenu;
    FWithPreCheck := True;
    RestFormState := FState; // KassirInfo;
    CreateUserList;
  end;
end;

procedure TRestMainForm.btnPredCheckClick(Sender: TObject);
var
  WithPreCheck: Boolean;
begin
  WithPreCheck := not FWithPreCheck;
  RestFormState := rsOrderMenu;
  FWithPreCheck := WithPreCheck;
  RestFormState := rsKassirInfo;
  CreateUserList;
end;

procedure TRestMainForm.btnPrintBiilsCopyClick(Sender: TObject);
begin
  FReport.PrintCopyChecks(xDateBegin.Date, xDateEnd.Date);
end;

procedure TRestMainForm.btnPrintCopyCheckClick(Sender: TObject);
var
  FSum: TSaleSums;
begin
  with FSum do
  begin
    FCashSum := FHeaderInfoTable.FieldByName('USR$SUMNCUWITHDISCOUNT').AsCurrency;
    FCardSum := 0;
    FCreditSum := 0;
    FPersonalCardSum := 0;
  end;
  FReport.PrintAfterSalePreCheck(FHeaderInfoTable.FieldByName('ID').AsInteger, FSum);
end;

procedure TRestMainForm.btnPrintIncomeReportClick(Sender: TObject);
begin
  FReport.PrintIncomeReport(xDateBegin.Date, xDateEnd.Date);
end;

procedure TRestMainForm.btnRealizationReportClick(Sender: TObject);
begin
  FReport.PrintRealization(xDateBegin.Date, xDateEnd.Date);
end;

procedure TRestMainForm.SplitButtonOnClick(Sender: TObject);
begin
  if Assigned(FSplitForm) then
  begin
    FSplitForm.OrderKey := TButton(Sender).Tag;
    FSplitForm.FrontBase := FFrontBase;
    try
      FSplitForm.ShowModal;
      RestFormState := FBaseFormState;
    finally
      FreeAndNil(FSplitForm);
    end;
  end;
end;

procedure TRestMainForm.SwapTable(const ATableFrom, ATableTo: TRestTable);
var
  frmSwap: TfrmSwapOrder;
  Order: TrfOrder;
  ItemListFrom: TList<TrfOrder>;
  ItemListTo: TList<TrfOrder>;
  BlockedOrderListStr: String;

  procedure EditOrderInfo(OrderList: TList<TrfOrder>; Table: TRestTable);
  var
    Order, OrderInTable: TrfOrder;
  begin
    // Пройдем по списку заказов
    for Order in OrderList do
    begin
      // Обратимся к БД и обновим инфу в шапке заказа
      FFrontBase.GetOrder(FHeaderTable, FLineTable, FModificationDataSet, Order.ID);
      if FHeaderTable.FieldByName('usr$tablekey').AsInteger <> Table.ID then
      begin
        // Проверим не заблокирован ли заказ
        if not FFrontBase.OrderIsLocked(Order.ID) then
        begin

          FHeaderTable.Edit;
          FHeaderTable.FieldByName('usr$tablekey').AsInteger := Table.ID;
          FHeaderTable.Post;
          // Сохраним в БД и перезагрузим заказ, не забудем анлочить заказ
          FFrontBase.SaveAndReloadOrder(FHeaderTable, FLineTable, FModificationDataSet, Order.ID);
          FFrontBase.UnLockUserOrder(Order.ID);
        end
        else
        begin
          if BlockedOrderListStr <> '' then
            BlockedOrderListStr := BlockedOrderListStr + ', ';
          BlockedOrderListStr := BlockedOrderListStr + Order.Number;
        end;
      end;
    end;
  end;

begin
  SetCloseTimerActive(False);

  frmSwap := TfrmSwapOrder.Create(Self);
  ItemListFrom := TList<TrfOrder>.Create;
  ItemListTo := TList<TrfOrder>.Create;
  try
    // Заполнение списка заказов FROM
    for Order in ATableFrom.OrderList do
      ItemListFrom.Add(Order);
    // Заполнение списка заказов TO
    for Order in ATableTo.OrderList do
      ItemListTo.Add(Order);

    // Инициализация диалога
    frmSwap.ItemListFrom := ItemListFrom;
    frmSwap.ItemListTo := ItemListTo;
    // Покажем пользователю форму перемещения заказов, ждем его подтверждения
    if frmSwap.ShowModalForTable('Стол №' + ATableFrom.Number, 'Стол №' + ATableTo.Number) = mrOK then
    begin
      BlockedOrderListStr := '';
      // Пройдем по списку заказов FROM
      EditOrderInfo(ItemListFrom, ATableFrom);
      // Обновим информацию по текущему столу
      FTableManager.RefreshOrderData(ATableFrom);

      // Пройдем по списку заказов TO
      EditOrderInfo(ItemListTo, ATableTo);
      // Обновим информацию по текущему столу
      FTableManager.RefreshOrderData(ATableTo);

      if BlockedOrderListStr <> '' then
        Touch_MessageBox('Столы заблокированы', 'Заказы ' + BlockedOrderListStr + ' заблокированы и не перемещены.',
          MB_OK, mtWarning);
    end;
  finally
    FreeAndNil(ItemListFrom);
    FreeAndNil(ItemListTo);
    FreeAndNil(frmSwap);

    SetCloseTimerActive(not FFrontBase.Options.NoPassword);
  end;
end;

procedure TRestMainForm.TableButtonOnClick(Sender: TObject);
var
  CurrentRestTable: TRestTable;
  Pt: TPoint;
  UserInfo: TUserInfo;
  Order: TrfOrder;
begin
  if not FFrontBase.CheckForSession then
    exit;

  if dxfDesigner.Active then
    exit;

  // Сбросим таймер выхода из окна зала
  SetCloseTimerActive(not FFrontBase.Options.NoPassword);

  CurrentRestTable := TRestTable(Sender);

  if btnUnblockTable.Down then      // Если активен режим разблокировки стола
  begin
    // Запросим ввод пароля пользователем
    UserInfo := FFrontBase.CheckUserPasswordWithForm;
    if UserInfo.CheckedUserPassword then
    begin
      if (UserInfo.UserInGroup and FFrontBase.Options.ManagerGroupMask) <> 0 then
      begin
        // Разблокируем все заказы в столе
        for Order in CurrentRestTable.OrderList do
          FFrontBase.UnLockUserOrder(Order.ID);
        Touch_MessageBox('Разблокировка стола', Format('Стол %s разблокирован.', [CurrentRestTable.Number]), MB_OK, mtInformation);
      end
      else
        // Сообщим о недостатке прав пользователя
        Touch_MessageBox('Внимание', cn_dontManagerPermission, MB_OK, mtWarning);
    end;
    btnUnblockTable.Down := False;
  end
  else if btnSwapTable.Down then    // Если активен режим смены стола
  begin
    // Если первый стол выделен
    if Assigned(FSwapTableFrom) and (FSwapTableFrom <> CurrentRestTable) then
    begin
      CurrentRestTable.Checked := True;
      // Вызовем операцию замены столов
      SwapTable(FSwapTableFrom, CurrentRestTable);
      // Очистим ссылки на заменяемые столы
      FSwapTableFrom.Checked := False;
      CurrentRestTable.Checked := False;
      FSwapTableFrom := nil;
      btnSwapTable.Down := False;
    end
    else
    begin
      // Выделим первый стол
      FSwapTableFrom := CurrentRestTable;
      FSwapTableFrom.Checked := True;
    end;
  end
  else
  begin
    Pt := CurrentRestTable.ClientToScreen(Point(0, 0));
    CurrentRestTable.PopupMenu.PopupComponent := CurrentRestTable;
    CurrentRestTable.PopupMenu.Popup(Pt.X + 64, Pt.Y + 32);
  end;
end;

procedure TRestMainForm.tablePopupMenuPopup(Sender: TObject);
var
  Table: TRestTable;
  Item: TMenuItem;
  Order: TrfOrder;
begin
  inherited;
  Table := TRestTable(TAdvPopupMenu(Sender).PopupComponent);
  // Обновим информацию по текущему столу
  FTableManager.RefreshOrderData(Table);

  if Table.Tag = 0 then
  begin
    Table.Tag := 1;
    if (tablePopupMenu.Items.Count = 0) and (Table.OrderList.Count > 0) then
      Touch_MessageBox('Внимание', 'Стол занят'#13#10 + FFrontBase.GetNameWaiterOnID(Table.RespKey, True, False), MB_OK, mtWarning);
    exit;
  end;

  tablePopupMenu.Items.Clear;
  if Table.OrderList.Count = 0 then
  begin
    CreateNewTableOrder(Table);
    exit;
  end;
  // Пункт меню для нового заказа
  if (Table.RespKey <= 0) or (Table.RespKey = FFrontBase.ContactKey) or
    ((FFrontBase.UserKey and FFrontBase.Options.ManagerGroupMask) <> 0) then
  begin
    Item := TMenuItem.Create(tablePopupMenu);
    Item.Caption := 'Новый заказ';
    Item.OnClick := PopItemOnClick;
    Item.Tag := Table.ID;
    tablePopupMenu.Items.Add(Item);
  end;

  for Order in Table.OrderList do
  begin
    // если заказ не свой или не менеджер, то не добавляем меню
    if (FFrontBase.ContactKey = Table.RespKey) or ((FFrontBase.UserKey and FFrontBase.Options.ManagerGroupMask) <> 0) then
    begin
      Item := TMenuItem.Create(tablePopupMenu);
      Item.Tag := Order.ID;
      Item.Caption := 'Заказ ' + Order.Number;
      Item.OnClick := OrderButtonOnClick;
      tablePopupMenu.Items.Add(Item);
    end;
  end;

  if (tablePopupMenu.Items.Count = 0) and (Table.OrderList.Count > 0) then
    Touch_MessageBox('Внимание', 'Стол занят'#13#10 + FFrontBase.GetNameWaiterOnID(Table.RespKey, True, False), MB_OK, mtWarning);
end;

procedure TRestMainForm.OrderButtonOnClick(Sender: TObject);
var
  FUserInfo: TUserInfo;
  MenuOrderButton: TButton;
  Order: TrfOrder;
begin
  // Если смена не открыта не даем редактировать заказ
  if not FFrontBase.CheckForSession then
    exit;

  // В поле Tag храним ID связанного заказа
  MenuOrderButton := TButton(Sender);

  Order := FFrontBase.GetOrderInfo(MenuOrderButton.Tag);
  // Если заказ заблокирован, то позволяем зайти в него только с того же компьютера
  if Order.IsLocked {and (Order.ComputerName <> FFrontBase.GetLocalComputerName)} then
  begin
    Touch_MessageBox('Внимание', 'Заказ редактируется на другом рабочем месте!', MB_OK, mtWarning);
    Exit;
  end;

  FFrontBase.GetOrder(FHeaderTable, FLineTable, FModificationDataSet, MenuOrderButton.Tag);
  FFrontBase.LockUserOrder(MenuOrderButton.Tag);
  if not Assigned(dsMain.DataSet) then
    dsMain.DataSet := FLineTable
  else
  begin
    // для обнулений значений в гриде
    dsMain.DataSet := nil;
    dsMain.DataSet := FLineTable;
  end;
  RestFormState := rsMenuInfo;
  // если заказ закрыт, то оставляем отмену пречека, иначе просто пречек
  if FHeaderTable.FieldByName('usr$timecloseorder').IsNull then
    btnPreCheck.Action := actPreCheck
  else
    btnPreCheck.Action := actCancelPreCheck;
  FLogManager.DoOrderLog(GetCurrentUserInfo, GetCurrentOrderInfo, ev_EnterOrder);
end;

procedure TRestMainForm.tmrCloseTimer(Sender: TObject);
begin
  if not Assigned(FFrontBase) then
    exit;

  if (not FFrontBase.Options.NoPassword)
    and (FRestFormState in [rsOrderMenu, rsHallsPage, rsManagerPage, rsManagerInfo, rsKassirInfo]) then
  begin
    if tmrClose.Tag = 10 then
    begin
      // Для скрытия контекстного меню стола симулируем клик
      if FRestFormState = rsHallsPage then
      begin
        PostMessage(Handle, WM_LBUTTONDOWN, MK_LBUTTON, 0);
        PostMessage(Handle, WM_LBUTTONUP, MK_LBUTTON, 0);
      end;
      // Запустим обработчик кнопки Отмена
      //actCancel.Execute;
      RestFormState := rsPass;
    end;
    tmrClose.Tag := tmrClose.Tag + 1;
  end;
end;

procedure TRestMainForm.tmrTablesTimer(Sender: TObject);
var
  FButton: TComponent;
begin
  LockWindowUpdate(Handle);
  try
    if (FActiveHallButton <> '') and (FRestFormState = rsHallsPage) then
    begin
      FButton := pnlHalls.FindComponent(FActiveHallButton);
      if Assigned(FButton) then
        TAdvSmoothButton(FButton).Click;
    end
    else if FHallsTable.RecordCount = 1 then
    begin
      // Обновим информацию о заказах по списку столов
      FTableManager.RefreshOrderData;
    end;
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TRestMainForm.tmrTimeTimer(Sender: TObject);
var
  S: String;
begin
  case FRestFormState of
    rsPass:
      S := ' ' + DateToStr(Date) + ' ' + TimeToStr(GetServerDateTime);

    rsOrderMenu, rsManagerPage, rsManagerChooseOrder, rsManagerInfo, rsKassirInfo, rsHallsPage, rsHallEdit:
      S := ' ' + DateToStr(Date) + ' ' + TimeToStr(GetServerDateTime) + ' пользователь: ' + FFrontBase.UserName;

    rsMenuInfo:
      begin
        S := ' ' + DateToStr(Date) + ' ' + TimeToStr(GetServerDateTime) + ' пользователь: ' + FFrontBase.UserName + ', дата создания заказа: ' +
          FHeaderTable.FieldByName('creationdate').AsString;
        if FLineTable.FieldByName('usr$mn_printdate').AsString <> '' then
          S := S + ', дата печати: ' + FLineTable.FieldByName('usr$mn_printdate').AsString;
      end;
  end;
  sbMain.SimpleText := S;
end;

procedure TRestMainForm.actUsersLeftExecute(Sender: TObject);
begin
  LockWindowUpdate(Handle);
  try
    VertScrollControl(pnlUserOrders, False, FUserOrderLastLeftButton, FMaxUserOrderButtonLeft) finally LockWindowUpdate(0);
  end;
end;

procedure TRestMainForm.actUsersRightExecute(Sender: TObject);
begin
  LockWindowUpdate(Handle);
  try
    VertScrollControl(pnlUserOrders, True, FUserOrderLastLeftButton, FMaxUserOrderButtonLeft);
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TRestMainForm.VertScrollControl(const FControl: TWinControl; const ToRight: Boolean; var Left, Right: Integer);
var
  Step: Integer;
begin
  Step := 0;
  if ToRight then
  begin
    if Right < FControl.Width then
      exit;
    while (Step < btnWidth + 8) and (Right + btnWidth > FControl.Width) do
    begin
      FControl.ScrollBy(-1, 0);

      Dec(Right);
      Inc(Left);
      Inc(Step);
    end;
  end
  else
  begin
    while (Step < btnWidth + 8) and (Left > 8) do
    begin
      FControl.ScrollBy(1, 0);

      Inc(Right);
      Dec(Left);
      Inc(Step);
    end;
  end;
end;

procedure TRestMainForm.actExitWindowsExecute(Sender: TObject);
var
  FUserInfo: TUserInfo;
begin
  FUserInfo := FFrontBase.CheckUserPasswordWithForm;
  if FUserInfo.CheckedUserPassword then
  begin
    if (FUserInfo.UserInGroup and FFrontBase.Options.ManagerGroupMask) = 0 then
    begin
      Touch_MessageBox('Внимание', cn_dontManagerPermission, MB_OK, mtWarning);
      exit;
    end;

    if Touch_MessageBox('Внимание', 'Выключить рабочую станцию?', MB_YESNO, mtConfirmation) = IDYES then
    begin
      if cn_ShutDownOnExit then
        Windows.ExitWindows(0, 0)
      else
        Application.Terminate;
    end;
  end;
end;

procedure TRestMainForm.actRestartRestExecute(Sender: TObject);
var
  FUserInfo: TUserInfo;
begin
  FUserInfo := FFrontBase.CheckUserPasswordWithForm;
  if FUserInfo.CheckedUserPassword then
  begin
    if (FUserInfo.UserInGroup and FFrontBase.Options.ManagerGroupMask) = 0 then
    begin
      Touch_MessageBox('Внимание', cn_dontManagerPermission, MB_OK, mtWarning);
      exit;
    end;
{$IFDEF MSWINDOWS}
    if Touch_MessageBox('Внимание', 'Перезапустить приложение?', MB_YESNO, mtConfirmation) = IDYES then
    begin
      if AppHandle <> 0 then
        CloseHandle(AppHandle); //ReleaseMutex(AppHandle);
      WinExec32(CmdLine, 1);
      Application.Terminate;
    end;
{$ENDIF MSWINDOWS}
  end;
end;

procedure TRestMainForm.actReturnGoodSumExecute(Sender: TObject);
var
  FForm: TReturnMoneyForm;
begin
  if FFrontBase.CashCode <> -1 then
  begin
    FForm := TReturnMoneyForm.CreateWithFrontBase(nil, FFrontBase);
    try
      FForm.FiscalRegistry := FFiscal;
      FForm.FrontBase := FFrontBase;
      FForm.Doc := FHeaderTable;
      FForm.DocLine := FLineTable;
      FForm.ShowModal;
    finally
      FForm.Free;
    end;
  end
  else
    Touch_MessageBox('Внимание', 'Для данной рабочей станции не указан кассовый терминал!', MB_OK, mtWarning);
end;

procedure TRestMainForm.OnBeforePostLine(DataSet: TDataSet);
begin
  // 1. Проверяем на скидку
  // if FHeaderTable.FieldByName('USR$DISCOUNTKEY').AsInteger > 0 then
  DataSet.FieldByName('USR$PERSDISCOUNT').AsCurrency := FFrontBase.GetDiscount(FHeaderTable.FieldByName('USR$DISCOUNTKEY').AsInteger,
    DataSet.FieldByName('usr$goodkey').AsInteger, FHeaderTable.FieldByName('usr$logicdate').AsDateTime,
    DataSet.FieldByName('usr$persdiscount').AsCurrency, DataSet.FieldByName('creationdate').AsDateTime);
  // else
  // DataSet.FieldByName('USR$PERSDISCOUNT').AsCurrency := 0;

  { TODO : Двойной бонус? }
  if DataSet.FieldByName('STATEFIELD').AsInteger = cn_StateNothing then
    DataSet.FieldByName('STATEFIELD').AsInteger := cn_StateUpdate;

  DataSet.FieldByName('USR$SUMNCU').AsCurrency := FFrontBase.RoundCost(DataSet.FieldByName('USR$COSTNCU').AsCurrency * DataSet.FieldByName
      ('USR$QUANTITY').AsCurrency);

  DataSet.FieldByName('USR$SUMNCUWITHDISCOUNT').AsCurrency := FFrontBase.RoundCost
    (DataSet.FieldByName('USR$SUMNCU').AsCurrency * (1 - DataSet.FieldByName('USR$PERSDISCOUNT').AsCurrency / 100.00));

  if DataSet.FieldByName('USR$QUANTITY').AsCurrency <> 0 then
    DataSet.FieldByName('USR$COSTNCUWITHDISCOUNT').AsCurrency := DataSet.FieldByName('USR$SUMNCUWITHDISCOUNT')
      .AsCurrency / DataSet.FieldByName('USR$QUANTITY').AsCurrency
  else
    DataSet.FieldByName('USR$COSTNCUWITHDISCOUNT').AsCurrency := DataSet.FieldByName('USR$COSTNCU').AsCurrency;

  DataSet.FieldByName('USR$SUMDISCOUNT').AsCurrency := DataSet.FieldByName('USR$SUMNCU').AsCurrency - DataSet.FieldByName
    ('USR$SUMNCUWITHDISCOUNT').AsCurrency;
end;

procedure TRestMainForm.OnAfterPostHeader(DataSet: TDataSet);
var
  Bonus: Boolean;
  PercDisc: Currency;
begin
  if DataSet.FieldByName('USR$BONUSSUM').AsCurrency > 0 then
    FFrontBase.CalcBonusSum(DataSet, FLineTable, Bonus, PercDisc);

  FLineTable.First;
  while not FLineTable.Eof do
  begin
    FLineTable.Edit;
    if Bonus then
      FLineTable.FieldByName('USR$PERSDISCOUNT').AsCurrency := PercDisc;
    FLineTable.Post;

    FLineTable.Next;
  end;
end;

procedure TRestMainForm.actModificationUpdate(Sender: TObject);
begin
  actModification.Enabled := FHeaderTable.FieldByName('usr$timecloseorder').IsNull and (not FViewMode) and (not IsActionRun);
end;

procedure TRestMainForm.actAddQuantityUpdate(Sender: TObject);
begin
  actAddQuantity.Enabled := FHeaderTable.FieldByName('usr$timecloseorder').IsNull
  { and FLineTable.FieldByName('usr$mn_printdate').IsNull } and (not FViewMode) and (not IsActionRun);
end;

procedure TRestMainForm.actAdminOptionsExecute(Sender: TObject);
var
  FUserInfo: TUserInfo;
  FForm: TAdminForm;
begin
  FUserInfo := FFrontBase.CheckUserPasswordWithForm;
  if FUserInfo.CheckedUserPassword then
  begin
    if (FUserInfo.UserInGroup and FFrontBase.Options.ManagerGroupMask) = 0 then
    begin
      Touch_MessageBox('Внимание', cn_dontManagerPermission, MB_OK, mtWarning);
      exit;
    end;
    FForm := TAdminForm.Create(Self);
    try
      FForm.FrontBase := FFrontBase;
      FForm.ShowModal;
      // Редактор залов
      if FForm.ModalResult = mrOK then
        RestFormState := rsHallEdit;
    finally
      FForm.Free;
    end;
  end;
  if edPassword.CanFocus then
    edPassword.SetFocus;
end;

procedure TRestMainForm.actAllChecksExecute(Sender: TObject);
begin
  FLogManager.DoSimpleLog(GetCurrentUserInfo, ev_EnterAllOrder);
  CreateManagerPage;
end;

procedure TRestMainForm.actAllChecksUpdate(Sender: TObject);
begin
  actAllChecks.Enabled := ((FFrontBase.UserKey and FFrontBase.Options.ManagerGroupMask) <> 0)
    and (not btnSwapTable.Down);
end;

procedure TRestMainForm.actKassirInfoExecute(Sender: TObject);
begin
  FLogManager.DoSimpleLog(GetCurrentUserInfo, ev_EnterPays);
  CreateKassirPage;
end;

procedure TRestMainForm.actKassirInfoUpdate(Sender: TObject);
begin
  actKassirInfo.Enabled := (((FFrontBase.UserKey and FFrontBase.Options.KassaGroupMask) <> 0) or
    ((FFrontBase.UserKey and FFrontBase.Options.ManagerGroupMask) <> 0))
    and (not btnSwapTable.Down);
end;

procedure TRestMainForm.actRemoveQuantityUpdate(Sender: TObject);
begin
  actRemoveQuantity.Enabled := FHeaderTable.FieldByName('usr$timecloseorder').IsNull and (not FViewMode) and (not IsActionRun);
end;

procedure TRestMainForm.actDeletePositionUpdate(Sender: TObject);
begin
  actDeletePosition.Enabled := FHeaderTable.FieldByName('usr$timecloseorder').IsNull and (not FViewMode) and (not IsActionRun);
end;

procedure TRestMainForm.actCutCheckUpdate(Sender: TObject);
begin
  actCutCheck.Enabled := FHeaderTable.FieldByName('usr$timecloseorder').IsNull and (not FViewMode) and (not IsActionRun);
end;

procedure TRestMainForm.actPreCheckUpdate(Sender: TObject);
begin
  actPreCheck.Enabled := FHeaderTable.FieldByName('usr$timecloseorder').IsNull and (not FViewMode) and (not IsActionRun);
end;

procedure TRestMainForm.actDiscountUpdate(Sender: TObject);
begin
  actDiscount.Enabled := FHeaderTable.FieldByName('usr$timecloseorder').IsNull and (not FViewMode) and (not IsActionRun);
end;

procedure TRestMainForm.actDevideUpdate(Sender: TObject);
begin
  actDevide.Enabled := FLineTable.FieldByName('usr$mn_printdate').IsNull and (not FViewMode) and (not IsActionRun);
end;

procedure TRestMainForm.actPayUpdate(Sender: TObject);
begin
  actPay.Enabled := (not FLineTable.IsEmpty) and ((FFrontBase.UserKey and FFrontBase.Options.KassaGroupMask) <> 0) and (not IsActionRun);
end;

procedure TRestMainForm.OnAfterPost(DataSet: TDataSet);
begin
  // так надо
end;

procedure TRestMainForm.OnAfterDelete(DataSet: TDataSet);
begin
  // update grid footer
  DBGrMain.SumList.RecalcAll;
end;

procedure TRestMainForm.actCashFormExecute(Sender: TObject);
var
  FForm: TCashForm;
begin
  FForm := TCashForm.Create(Self);
  FForm.FrontBase := FFrontBase;
  try
    FForm.FiscalRegistry := FFiscal;
    FForm.IsManager := ((FFrontBase.UserKey and FFrontBase.Options.ManagerGroupMask) <> 0);

    // Отключим таймер выхода из зала
    SetCloseTimerActive(False);
    try
      FForm.ShowModal;
    finally
      SetCloseTimerActive(not FFrontBase.Options.NoPassword);
    end;
  finally
    FForm.Free;
  end;
end;

procedure TRestMainForm.actCashFormUpdate(Sender: TObject);
begin
  actCashForm.Enabled := (((FFrontBase.UserKey and FFrontBase.Options.KassaGroupMask) <> 0) or
    ((FFrontBase.UserKey and FFrontBase.Options.ManagerGroupMask) <> 0))
    and (not btnSwapTable.Down);
end;

procedure TRestMainForm.actGoodUpUpdate(Sender: TObject);
begin
  actGoodUp.Enabled := (FGoodFirstTop > 8);
end;

procedure TRestMainForm.actGoodDownUpdate(Sender: TObject);
begin
  actGoodDown.Enabled := (FGoodLastTop + btnHeight > pnlGood.Height);
end;

procedure TRestMainForm.actScrollUpUpdate(Sender: TObject);
begin
  if pcMenu.ActivePage = tsMenu then
    if FMenuButtonCount > 6 then
      actScrollUp.Enabled := (FMenuFirstTop > 8)
    else
      actScrollUp.Enabled := (FGroupFirstTop > 8)
    else
      actScrollUp.Enabled := (FGroupFirstTop > 8);
end;

procedure TRestMainForm.actSwapTableExecute(Sender: TObject);
begin
  if Assigned(FSwapTableFrom) then
  begin
    FSwapTableFrom.Checked := False;
    FSwapTableFrom := nil;
  end;
end;

procedure TRestMainForm.actSwapTableUpdate(Sender: TObject);
begin
  actSwapTable.Enabled := ((FFrontBase.UserKey and FFrontBase.Options.ManagerGroupMask) <> 0);
  btnSwapTable.Enabled := actSwapTable.Enabled;
end;

procedure TRestMainForm.actSwapWaiterExecute(Sender: TObject);
var
  frmSwap: TfrmSwapOrder;
  Order: TrfOrder;
  UserFrom, UserTo: TrfUser;
  ItemListFrom: TList<TrfOrder>;
  ItemListTo: TList<TrfOrder>;
  BlockedOrderListStr: String;

  procedure EditOrderInfo(OrderList: TList<TrfOrder>; AUser: TrfUser);
  var
    Order: TrfOrder;
    Table: TRestTable;
    OrderInTable: TrfOrder;
  begin
    // Пройдем по списку заказов
    for Order in OrderList do
    begin
      // Обратимся к БД и обновим инфу в шапке заказа
      FFrontBase.GetOrder(FHeaderTable, FLineTable, FModificationDataSet, Order.ID);
      if FHeaderTable.FieldByName('usr$respkey').AsInteger <> AUser.ID then
      begin
        // Проверим не заблокирован ли заказ
        if not FFrontBase.OrderIsLocked(Order.ID) then
        begin
          FHeaderTable.Edit;
          FHeaderTable.FieldByName('usr$respkey').AsInteger := AUser.ID;
          FHeaderTable.Post;
          // Сохраним в БД и перезагрузим заказ, не забудем анлочить заказ
          FFrontBase.SaveAndReloadOrder(FHeaderTable, FLineTable, FModificationDataSet, Order.ID);
          FFrontBase.UnLockUserOrder(Order.ID);

          // Обновим пользователя в заказе на столе зала
          Table := FTableManager.GetTable(FHeaderTable.FieldByName('usr$tablekey').AsInteger);
          if Assigned(Table) then
          begin
            OrderInTable := Table.GetOrder(Order.ID);
            if Assigned(OrderInTable) then
              OrderInTable.ResponsibleKey := AUser.ID;
            Table.RefreshTableCondition(FFrontBase.ContactKey);
          end;
        end
        else
        begin
          if BlockedOrderListStr <> '' then
            BlockedOrderListStr := BlockedOrderListStr + ', ';
          BlockedOrderListStr := BlockedOrderListStr + Order.Number;
        end;
      end;
    end;
  end;

begin
  SetCloseTimerActive(False);

  frmSwap := TfrmSwapOrder.Create(Self);
  ItemListFrom := TList<TrfOrder>.Create;
  ItemListTo := TList<TrfOrder>.Create;
  try
    // Инициализация диалога
    frmSwap.ItemListFrom := ItemListFrom;
    frmSwap.ItemListTo := ItemListTo;
    // Покажем пользователю форму перемещения заказов, ждем его подтверждения
    if frmSwap.ShowModalForWaiter(FFrontBase) = mrOK then
    begin
      UserFrom := frmSwap.UserFrom;
      UserTo := frmSwap.UserTo;
      // Если в форме были выбраны пользователи
      if Assigned(UserFrom) and Assigned(UserTo) then
      begin
        BlockedOrderListStr := '';

        // Пройдем по списку заказов FROM
        EditOrderInfo(ItemListFrom, UserFrom);

        // Пройдем по списку заказов TO
        EditOrderInfo(ItemListTo, UserTo);

        if BlockedOrderListStr <> '' then
          Touch_MessageBox('Столы заблокированы', 'Заказы ' + BlockedOrderListStr + ' заблокированы и не перемещены.',
            MB_OK, mtWarning);
      end;
    end;
  finally
    for Order in ItemListFrom do
      Order.Free;
    FreeAndNil(ItemListFrom);
    for Order in ItemListTo do
      Order.Free;
    FreeAndNil(ItemListTo);

    FreeAndNil(frmSwap);

    SetCloseTimerActive(not FFrontBase.Options.NoPassword);
  end;
end;

procedure TRestMainForm.actSwapWaiterUpdate(Sender: TObject);
begin
  actSwapWaiter.Enabled := ((FFrontBase.UserKey and FFrontBase.Options.ManagerGroupMask) <> 0)
    and (not btnSwapTable.Down);
end;

procedure TRestMainForm.actScrollDownUpdate(Sender: TObject);
begin
  if pcMenu.ActivePage = tsMenu then
  begin
    if FMenuButtonCount > 6 then
      actScrollDown.Enabled := (FMenuLastTop + btnHeight > pnlMenu.Height)
    else
      actScrollDown.Enabled := (FGroupLastTop + btnHeight > pnlExtraGoodGroup.Height)
  end else
    actScrollDown.Enabled := (FGroupLastTop + btnHeight > pnlGoodGroup.Height);
end;

end.
