unit MainForm;

{$WARN SYMBOL_PLATFORM OFF}
{$I RestFront.Inc}
{Были сделаны изменения в компоненте TAdvPageControl что бы не отображалась граница}

interface

uses
  Windows, Messages, Variants, Classes, Graphics, Controls, Forms,
  DB, ActnList, ComCtrls, StdCtrls, ExtCtrls, Dialogs, Front_DataBase_Unit,
  Contnrs, kbmMemTable, DBGridEh, GridsEh, FiscalRegister_Unit,
  SplitOrderForm_Unit, Report_Unit, FrontData_Unit, BaseFrontForm_Unit,
  AdvSmoothButton, AdvPanel, AdvPageControl, AdvSmoothTouchKeyBoard,
  TaskDialog, FrontLog_Unit, Grids, Menus;

const
  btnHeight = 65;
  btnWidth  = 140;
  btnHalfWidth = 102;
  btnLongWidth = 215;
  btnOrderName = 'btnOrder%d';
  btnMenuName  = 'btnMenu%d';
  btnGroupName = 'btnGroup%d';
  btnGoodName  = 'btnGood%d';
  btnUserName  = 'btnUser%d';
  btnUserOrderName = 'btnUserOrder%d';
  cn_dontManagerPermission = 'Данный пользователь не обладает правами менеджера!';

const
  btnFirstTop = 8;
  btnColor = $00E7DCD5;


{ TODO -oAlexander :
Сейчас размеры кнопок заданы константами, посмотреть,
может их определять в зависимости от размера экрана. }
{ TODO -oAlexander -cInterface : 
Для форм с выбором (модификаторы, выбор оплаты, отказы)
создать базовую форму где будет реализовано скроллирование 
панелей, будут кнопки ОК и Отмена }
{ TODO -oAlexander : Реализовать форму выбора параметров }
{ TODO -oAlexander : Реализовать форму добавления сотрудника }

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
  //окно с паролем
  //окно с со заказами
  //редактирование заказа
  //окно менеджера
  //окно менеджера для разделения
  TRestState = (Pass, OrderMenu, MenuInfo, ManagerPage, ManagerChooseOrder);

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
    edPassword: TEdit;
    actList: TActionList;
    actPassEnter: TAction;
    dsMain: TDataSource;
    pnlChoose: TPanel;
    pcMenu: TAdvPageControl;
    tsMenu: TAdvTabSheet;
    tsGroup: TAdvTabSheet;
    Panel3: TAdvPanel;
    pcExtraButton: TAdvPageControl;
    tsMainButton: TAdvTabSheet;
    tsFunctionButton: TAdvTabSheet;
    Button14: TButton;
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
    DBGrMain: TDBGridEh;
    tsManagerPage: TAdvTabSheet;
    pnlManagerTop: TAdvPanel;
    pnlManagerMain: TAdvPanel;
    pnlUsers: TAdvPanel;
    pnlUserOrders: TAdvPanel;
    actUsersUp: TAction;
    actUsersDown: TAction;
    actDevide: TAction;
    pnlManagerBottom: TAdvPanel;
    actUserLeft: TAction;
    actUserRight: TAction;
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
    btnCancelPreCheck: TAdvSmoothButton;
    btnModification: TAdvSmoothButton;
    btnKeyBoard: TAdvSmoothButton;
    btnDiscount: TAdvSmoothButton;
    btnPay: TAdvSmoothButton;
    btnDevide: TAdvSmoothButton;
    btnOKPass: TAdvSmoothButton;
    btnScrollDown: TAdvSmoothButton;
    btnScrollUp: TAdvSmoothButton;
    btnOK: TAdvSmoothButton;
    btnCancel: TAdvSmoothButton;
    btnExitWindows: TAdvSmoothButton;
    btnRestartRest: TAdvSmoothButton;
    actEditReport: TAction;
    btnGoodUp: TAdvSmoothButton;
    btnGoodDown: TAdvSmoothButton;
    actCashForm: TAction;
    btnPredCheck: TAdvSmoothButton;
    btnUsersDown: TAdvSmoothButton;
    btnUsersUp: TAdvSmoothButton;
    btnUserLeft: TAdvSmoothButton;
    btnUserRight: TAdvSmoothButton;
    tsOrderButton: TAdvTabSheet;
    btnEditReport: TAdvSmoothButton;
    btnCashForm: TAdvSmoothButton;
    btnShowKeyBoard: TAdvSmoothButton;

    //Проверка введёного пароля
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
    procedure Button14Click(Sender: TObject);
    procedure actUsersUpExecute(Sender: TObject);
    procedure actUsersDownExecute(Sender: TObject);
    procedure actDevideExecute(Sender: TObject);
    procedure DBGridEh2Columns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure btnPredCheckClick(Sender: TObject);
    procedure actUserLeftExecute(Sender: TObject);
    procedure actUserRightExecute(Sender: TObject);
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
    procedure actEditReportExecute(Sender: TObject);
    procedure actPayUpdate(Sender: TObject);
    procedure actCashFormExecute(Sender: TObject);
    procedure actGoodUpUpdate(Sender: TObject);
    procedure actGoodDownUpdate(Sender: TObject);
    procedure actScrollUpUpdate(Sender: TObject);
    procedure actScrollDownUpdate(Sender: TObject);

  private
    //Компонент обращения к БД
    FFrontBase: TFrontBase;
    //Фискальный
    FFiscal: TFiscalRegister;
    // FR4
    FReport: TRestReport;

    //Наборы данных
    FOrderDataSet: TkbmMemTable;
    FMenuDataSet : TkbmMemTable;
    FGroupDataSet: TkbmMemTable;
    FGoodDataSet : TkbmMemTable;

    FHeaderTable : TkbmMemTable;
    FLineTable   : TkbmMemTable;
    //для связи позиция - модификатор
    FMasterDataSource: TDataSource;
    FModificationDataSet: TkbmMemTable;
    //ID для вставляемых позиций
    FLineID: Integer;
    //
    FWithPreCheck: Boolean;
    //
    FLastLeftButton   : Integer;
    FLastTopButton    : Integer;
    FOrderButtonNumber: Integer;
    //
    FMenuFirstTop     : Integer;
    FMenuLastTop      : Integer;
    FMenuButtonNumber : Integer;
    FMenuButtonCount  : Integer;
    //
    FGroupFirstTop      : Integer;
    FGroupLastLeftButton: Integer;
    FGroupLastTop       : Integer;
    FGroupButtonNumber  : Integer;
    //
    FGoodFirstTop       : Integer;
    FGoodLastLeftButton : Integer;
    FGoodLastTop        : Integer;
    FGoodButtonNumber   : Integer;
    //
    FUserFirstTop       : Integer;
    FUserLastLeftButton : Integer;
    FUserLastTop        : Integer;
    FUserButtonNumber   : Integer;
    //
    FUserOrderFirstTop       : Integer;
    FUserOrderLastLeftButton : Integer;
    FUserOrderLastTop        : Integer;
    FUserOrderButtonNumber   : Integer;
    FMaxUserOrderButtonLeft  : Integer;

    //Список объектов для уничтожения компонентов
    FMenuButtonList   : TObjectList;
    FOrderButtonList  : TObjectList;
    FGroupButtonList  : TObjectList;
    FGoodButtonList   : TObjectList;
    FUsersButtonList  : TObjectList;
    FUsersOrderButtonList: TObjectList;

    //Текущее выбраное меню
    FMenuKey: Integer;
    //Указатель на нажатую кнопку
    FSelectedButton: TObject;

    FFormState: TRestState;

    FUpdateCount: Integer;

    FSplitForm: TSplitOrder;

  //  FFrontLog: TFrontLog;

    //Создание первичных наборов данных
    procedure CreateDataSets;

    //нужно расчитывать сколько button-ов может поместится на закладке
    //отрисовываем btn от датасета
    procedure CreateOrderButtonList;
    procedure AddOrderButton;
    procedure RemoveOrderButton;
    //нажатие на кнопку с заказом
    procedure OrderButtonOnClick(Sender: TObject);
    //
    procedure SplitButtonOnClick(Sender: TObject);

    procedure CreateMenuButtonList;
    procedure AddMenuButton;
    procedure RemoveMenuButton;
    //нажатие на кнопку Меню
    procedure MenuButtonOnClick(Sender: TObject);

    procedure CreateGroupButtonList(const MenuKey: Integer);
    procedure AddGroupButton;
    procedure RemoveGroupButton;
    procedure AddPopularGoods;
    //нажатие на кнопку Группы
    procedure GroupButtonOnClick(Sender: TObject);

    procedure CreateGoodButtonList(const MenuKey: Integer; const GroupKey: Integer);
    procedure AddGoodButton;
    procedure RemoveGoodButton;
    //нажатие на кнопку Группы
    procedure GoodButtonOnClick(Sender: TObject);

    procedure CreateUserList;
    procedure AddUserButton(const MemTable: TkbmMemTable);
    procedure RemoveUserButton;
    procedure AddUserOrderButton(const MemTable: TkbmMemTable);
    procedure RemoveUserOrderButton;

    //Скроллирование
    procedure ScrollControl(const FControl: TWinControl; const Down: Boolean;
      var Top: Integer; var Bottom: Integer);

    procedure VertScrollControl(const FControl: TWinControl; const ToRight: Boolean;
      var Left: Integer; var Right: Integer);
    //

    procedure SetFormState(const Value: TRestState);
    property FormState: TRestState read FFormState write SetFormState;

    procedure WritePos(DataSet: TDataSet);
    procedure ClearDisplay;

    procedure DeleteOrderLine(var Amount: Currency; const CauseKey: Integer);
    procedure OnFilterLine(DataSet: TDataSet; var Accept: Boolean);
    procedure OnBeforePostLine(DataSet: TDataSet);
    procedure OnAfterPostHeader(DataSet: TDataSet);
    procedure OnAfterPost(DataSet: TDataSet); ///!!!!
    procedure OnAfterDelete(DataSet: TDataSet);
  public


  end;

var
  RestMainForm: TRestMainForm;

implementation

uses
  SysUtils, GuestForm_unit, DeleteOrderLine_unit, OrderNumber_Unit,
  {Pole_Display_Unit,} Modification_Unit, DevideForm_Unit,
  SellParamForm_Unit, {Math,} PercOrCardForm_Unit, DiscountTypeForm_Unit,
  ChooseDiscountCardForm_Unit, EditReportForm_Unit, JclMiscel,
  GDIPPictureContainer, IB, GDIPFill, CashForm_Unit;


{$R *.dfm}

{ TRestMainForm }

procedure TRestMainForm.actPassEnterExecute(Sender: TObject);
begin
  //Проверка введёного пароля
  if FFrontBase.LogIn(edPassword.Text) then
  begin
    FormState := OrderMenu;
    WriteLog(FFrontBase, cn_l_LogIn, '');
  end else
  begin
    AdvTaskMessageDlg('Внимание', 'Неверный пароль', mtWarning, [mbOK], 0);
    if edPassword.CanFocus then
      edPassword.SetFocus;
    WriteLog(FFrontBase, cn_l_ErrorPass, '');
  end;
end;

procedure TRestMainForm.FormCreate(Sender: TObject);
begin
  {$IFDEF NEW_TABCONTROL}
  btnBackToMenu.Left := btnBackToMenu.Left + 4;

  btnEditReport.Left := btnEditReport.Left + 4;
  btnCashForm.Left := btnCashForm.Left + 4;

  btnAddQuantity.Left := btnAddQuantity.Left + 4;
  btnRemoveQuantity.Left := btnRemoveQuantity.Left + 4;
  btnDeletePosition.Left := btnDeletePosition.Left + 4;
  btnCutCheck.Left := btnCutCheck.Left + 4;
  btnPreCheck.Left := btnPreCheck.Left + 4;
  btnCancelPreCheck.Left := btnCancelPreCheck.Left + 4;
  btnModification.Left := btnModification.Left + 4;
  btnKeyBoard.Left := btnKeyBoard.Left + 4;
  btnDiscount.Left := btnDiscount.Left + 4;
  btnPay.Left := btnPay.Left + 4;
  btnDevide.Left := btnDevide.Left + 4;

  btnExitWindows.Left := btnExitWindows.Left + 4;
  btnRestartRest.Left := btnRestartRest.Left + 4;
  btnShowKeyBoard.Left := btnShowKeyBoard.Left + 4;
  {$ENDIF}

  SetupGrid(DBGrMain); 

  Height := cn_Height;
  Width := cn_Width;
  AdjustResolution(Self);

  //восстанавливаем начальные размеры
  btnNewOrder.Top := btnFirstTop;
  {$IFDEF NEW_TABCONTROL}
  btnNewOrder.Left := btnFirstTop + 6;
  {$ELSE}
  btnNewOrder.Left := btnFirstTop;
  {$ENDIF}
  btnNewOrder.Width := btnWidth;
  btnNewOrder.Height := btnHeight;

  //начальные даные
  FMenuButtonList  := TObjectList.Create;
  FOrderButtonList := TObjectList.Create;
  FGoodButtonList  := TObjectList.Create;
  FGroupButtonList := TObjectList.Create;
  FUsersButtonList := TObjectList.Create;
  FUsersOrderButtonList := TObjectList.Create;
  FUpdateCount := 0;

  CreateDataSets;
  FormState := Pass;
  try
    FFrontBase := TFrontBase.Create;
  except
    on E: Exception do
    begin
      if (E is EIBClientError) and (EIBClientError(E).SQLCode = Ord(ibxeDatabaseNameMissing)) then
        AdvTaskMessageDlg('Внимание', 'Путь к базе данных указан неверно', mtError, [mbOK], 0)
      else
        AdvTaskMessageDlg('Внимание', 'Ошибка при подключении ' + E.Message, mtError, [mbOK], 0);
      FFrontBase.Free;
      Application.Terminate;
    end;
  end;
  FFiscal := TFiscalRegister.Create;
  FFiscal.FrontBase := FFrontBase;

  FReport := TRestReport.Create(Self);
  FReport.FrontBase := FFrontBase;

//  FFrontLog := TFrontLog.Create;
//  FFrontLog.FrontBase := FFrontBase;

  btnAddQuantity.Picture := FrontData.RestPictureContainer.FindPicture('AddPicture');
  btnRemoveQuantity.Picture := FrontData.RestPictureContainer.FindPicture('RemovePicture');
  btnGoodUp.Picture := FrontData.RestPictureContainer.FindPicture('Up');
  btnScrollUp.Picture := FrontData.RestPictureContainer.FindPicture('Up');
  btnGoodDown.Picture := FrontData.RestPictureContainer.FindPicture('Down');
  btnScrollDown.Picture := FrontData.RestPictureContainer.FindPicture('Down');
  btnUsersDown.Picture := FrontData.RestPictureContainer.FindPicture('Down');
  btnUsersUp.Picture := FrontData.RestPictureContainer.FindPicture('Up');
  btnUserLeft.Picture := FrontData.RestPictureContainer.FindPicture('Left');
  btnUserRight.Picture := FrontData.RestPictureContainer.FindPicture('Right');
end;

procedure TRestMainForm.FormDestroy(Sender: TObject);
begin
  if Assigned(FFrontBase) then
    FFrontBase.Free;

  if Assigned(FFiscal) then
    FFiscal.Free;

  if Assigned(FSplitForm) then
    FSplitForm.Free;

  FReport.Free;

  // инчае будет AV при уничтожения грида
  if Assigned(dsMain.DataSet) then
    dsMain.DataSet := nil;

  FreeAndNil(FOrderDataSet);
  FreeAndNil(FMenuDataSet);
  FreeAndNil(FGoodDataSet);
  FreeAndNil(FGroupDataSet);

  FreeAndNil(FModificationDataSet);
  FreeAndNil(FMasterDataSource);
  FreeAndNil(FLineTable);
  FreeAndNil(FHeaderTable);

  FMenuButtonList.Free;
  FOrderButtonList.Free;
  FGroupButtonList.Free;
  FGoodButtonList.Free;
  FUsersButtonList.Free;
  FUsersOrderButtonList.Free;

//  FFrontLog.Free;
end;

procedure TRestMainForm.edPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    actPassEnterExecute(Sender)
  else
    inherited;
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
  FGoodDataSet.CreateTable;
  FGoodDataSet.Open;

  //шапка и позиция
  GetHeaderTable(FHeaderTable);
  FHeaderTable.AfterPost := OnAfterPostHeader;
  FHeaderTable.Open;

  GetLineTable(FLineTable);
  FLineTable.OnFilterRecord := OnFilterLine;
  FLineTable.BeforePost := OnBeforePostLine;
  FLineTable.AfterDelete := OnAfterDelete;
//  FLineTable.Filter := '([usr$quantity] > 0) AND ([usr$causedeletekey] IS NULL) ';
  FLineTable.Filtered := True;
  FLineTable.Open;

  FMasterDataSource := TDataSource.Create(nil);
  FMasterDataSource.DataSet := FLineTable;

  GetModificationTable(FModificationDataSet);
  FModificationDataSet.Common.EnableVersioning := True;
  FModificationDataSet.Common.VersioningMode := mtvmAllSinceCheckPoint;
  FModificationDataSet.MasterSource := FMasterDataSource;
  FModificationDataSet.MasterFields := 'LINEKEY';
  FModificationDataSet.DetailFields := 'MASTERKEY';
  FModificationDataSet.AfterPost := OnAfterPost; ///!!!!
  FModificationDataSet.Open;
end;

procedure TRestMainForm.AddOrderButton;
var
  FButton: TAdvSmoothButton;
begin
  //Создание кнопки
  FButton := TAdvSmoothButton.Create(tsUserOrder);
  FButton.Appearance.Font.Name := cn_FontType;
  FButton.Appearance.BeginUpdate;
  try
    FButton.Color := btnColor;
    FButton.Appearance.Font.Size := cn_ButtonFontSize;
    FButton.Parent := tsUserOrder;
    FButton.OnClick := OrderButtonOnClick;
    FButton.Name := Format(btnOrderName, [FOrderButtonNumber]);
    FButton.Height := btnHeight;
    FButton.Width  := btnWidth;
    //проверяем, есть ли ещё место в ряду
    if (FLastLeftButton + {btnFirstTop} + btnWidth) > tsUserOrder.Width then
    begin
      FLastTopButton := FLastTopButton + btnHeight + btnFirstTop;
      FLastLeftButton := btnFirstTop {$IFDEF NEW_TABCONTROL} + 4 {$ENDIF};

      FButton.Left := FLastLeftButton;
      FButton.Top  := FLastTopButton;
    end else
    begin
      FButton.Left := FLastLeftButton;
      FButton.Top  := FLastTopButton;
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
begin
  FFrontBase.GetPopularGoodList(FGoodDataSet);
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

procedure TRestMainForm.AddGoodButton;
var
  FButton: TAdvSmoothButton;
begin
  //Создание кнопки
  FButton := TAdvSmoothButton.Create(pnlGood);
  FButton.Appearance.Font.Name := cn_FontType;
  FButton.Appearance.BeginUpdate;
  try
    FButton.Color := btnColor;
    FButton.Parent := pnlGood;
    FButton.OnClick := GoodButtonOnClick;
    FButton.Name := Format(btnGoodName, [FGoodButtonNumber]);
    FButton.Height := btnHeight;
    FButton.Width  := btnHalfWidth;

    //проверяем, есть ли ещё место в ряду
    if (FGoodLastLeftButton + btnHalfWidth) > pnlGood.Width then
    begin
      FGoodLastTop := FGoodLastTop + btnHeight + 2;
      FGoodLastLeftButton := btnFirstTop;

      FButton.Left := FGoodLastLeftButton;
      FButton.Top  := FGoodLastTop;
    end else
    begin
      FButton.Left := FGoodLastLeftButton;
      FButton.Top  := FGoodLastTop;
    end;

    FButton.Tag := FGoodDataSet.FieldByName('ID').AsInteger;
    FButton.Caption := FGoodDataSet.FieldByName('NAME').AsString;
    FButton.Status.Caption :=  FormatFloat('#,##0', FGoodDataSet.FieldByName('COST').AsFloat);
    FButton.Status.OffsetTop := -2;
    FButton.VerticalSpacing := 10;
    FButton.Status.Visible := True;
  finally
    FButton.Appearance.EndUpdate;
  end;
  FGoodLastLeftButton := FGoodLastLeftButton + btnHalfWidth + 2;
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

  //Создание кнопки
  FButton := TAdvSmoothButton.Create(pnlGood);
  FButton.Appearance.Font.Name := cn_FontType;
  FButton.Appearance.BeginUpdate;
  try
    FButton.Color := btnColor;
    FButton.Parent := FPanel;
    FButton.OnClick := GroupButtonOnClick;
    FButton.Name := Format(btnGroupName, [FGroupButtonNumber]);
    FButton.Height := btnHeight;
    FButton.Width  := AdjustWidth(btnHalfWidth); //btnHalfWidth;

    //проверяем, есть ли ещё место в ряду
    if (FGroupLastLeftButton + AdjustWidth(btnHalfWidth)) > FPanel.Width then
    begin
      FGroupLastTop := FGroupLastTop + btnHeight + btnFirstTop;
      FGroupLastLeftButton := btnFirstTop {$IFDEF NEW_TABCONTROL} + 4 {$ENDIF};

      FButton.Left := FGroupLastLeftButton;
      FButton.Top  := FGroupLastTop;
    end else
    begin
      FButton.Left := FGroupLastLeftButton;
      FButton.Top  := FGroupLastTop;
    end;

    FButton.Tag := FGroupDataSet.FieldByName('ID').AsInteger;
    if Length(FGroupDataSet.FieldByName('NAME').AsString) > 16 then
      FButton.Appearance.Font.Size := cn_ButtonSmallFontSize
    else
      FButton.Appearance.Font.Size := cn_ButtonFontSize;
    FButton.Caption := FGroupDataSet.FieldByName('NAME').AsString;
  finally
    FButton.Appearance.EndUpdate;
  end;
  FGroupLastLeftButton := FGroupLastLeftButton + AdjustWidth(btnHalfWidth) + AdjustWidth(10);
  FGroupButtonList.Add(FButton);
  Inc(FGroupButtonNumber);
end;

procedure TRestMainForm.AddMenuButton;
var
  FButton: TAdvSmoothButton;
begin
  //Создание кнопки
  FButton := TAdvSmoothButton.Create(pnlGood);
  FButton.Appearance.BeginUpdate;
  try
    FButton.Appearance.Font.Name := cn_FontType;
    FButton.Appearance.Font.Size := cn_ButtonFontSize;
    FButton.Color := btnColor;
    FButton.Parent := pnlMenu;
    FButton.OnClick := MenuButtonOnClick;
    FButton.Name := Format(btnMenuName, [FMenuButtonNumber]);
    FButton.Height := btnHeight;
    FButton.Width  := AdjustWidth(btnLongWidth); //btnLongWidth;

    FMenuLastTop := FMenuLastTop + btnHeight + 2;

    FButton.Left := btnFirstTop {$IFDEF NEW_TABCONTROL} + 4 {$ENDIF};
    FButton.Top  := FMenuLastTop;

    FButton.Tag := FMenuDataSet.FieldByName('ID').AsInteger;
    FButton.Caption := FMenuDataSet.FieldByName('NAME').AsString;
  finally
    FButton.Appearance.EndUpdate;
  end;
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
    pnlExtraGoodGroup.Visible := True
  else
    pnlExtraGoodGroup.Visible := False;
  //если только одно меню, то:
  //1.делаем панель с ним невидимым
  //2.вызываем сразу построение групп
  if FMenuButtonCount = 1 then
  begin
    pnlMenu.Visible := False;
    pnlExtraGoodGroup.Align := alClient;
    FMenuKey := TButton(FMenuButtonList.Items[0]).Tag;
    CreateGroupButtonList(FMenuKey);
  end;   
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
begin
  FGroupLastTop := btnFirstTop;
  FGroupFirstTop := btnFirstTop;
  FGroupLastLeftButton := btnFirstTop {$IFDEF NEW_TABCONTROL} + 4 {$ENDIF};
  RemoveGroupButton;
  FMenuKey := TButton(Sender).Tag;
  CreateGroupButtonList(FMenuKey);
  if FMenuButtonCount > 6 then
    pcMenu.ActivePage := tsGroup;
end;

procedure TRestMainForm.GroupButtonOnClick(Sender: TObject);
begin
  LockWindowUpdate(TForm(Self).Handle);
  try
    if FSelectedButton <> nil then
      TAdvSmoothButton(FSelectedButton).Enabled := True;
    FSelectedButton := Sender;
    TAdvSmoothButton(Sender).Enabled := False;

    RemoveGoodButton;
    FGoodLastTop := btnFirstTop;
    FGoodFirstTop := btnFirstTop;
    FGoodLastLeftButton := btnFirstTop;
    pnlMainGood.Visible := True;
    CreateGoodButtonList(FMenuKey, TAdvSmoothButton(Sender).Tag);
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TRestMainForm.actBackToMenuExecute(Sender: TObject);
begin
  //Очищаем кнопки, возращаемся в меню
  pnlMainGood.Visible := False;
  FMenuKey := -1;
  RemoveGoodButton;
  RemoveGroupButton;
  pcMenu.ActivePage := tsMenu;
end;

procedure TRestMainForm.GoodButtonOnClick(Sender: TObject);
var
  GoodKey: Integer;
  FForm: TModificationForm;
  S, ES: String;
begin
  GoodKey := TButton(Sender).Tag;
  S := '';
  ES := '';
  if FGoodDataSet.Locate('ID', GoodKey, []) then
  begin
    FLineTable.Append;
    FLineTable.FieldByName('LINEKEY').AsInteger := FLineID;
    FLineTable.FieldByName('STATEFIELD').AsInteger := cn_StateInsert;
    FLineTable.FieldByName('usr$quantity').AsInteger := 1;
    FLineTable.Post;

    Inc(FLineID);
    //проверяем сначала на модификаторы
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
    FLineTable.FieldByName('usr$goodkey').AsInteger := Goodkey;
    FLineTable.FieldByName('GOODNAME').AsString := FGoodDataSet.FieldByName('NAME').AsString;
    FLineTable.FieldByName('usr$quantity').AsInteger := 1;
    FLineTable.FieldByName('usr$costncu').AsCurrency := FGoodDataSet.FieldByName('COST').AsCurrency;
    FLineTable.FieldByName('MODIFYSTRING').AsString := S;
    FLineTable.FieldByName('EXTRAMODIFY').AsString := ES;
    FLineTable.Post;
    WritePos(FLineTable);
  end;
end;

procedure TRestMainForm.ScrollControl(const FControl: TWinControl; const Down: Boolean;
  var Top: Integer; var Bottom: Integer);
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
  end else
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
  LockWindowUpdate(TForm(Self).Handle);
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
  LockWindowUpdate(TForm(Self).Handle);
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
  LockWindowUpdate(TForm(Self).Handle);
  try
    ScrollControl(pnlGood, False, FGoodFirstTop, FGoodLastTop);
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TRestMainForm.actGoodDownExecute(Sender: TObject);
begin
  LockWindowUpdate(TForm(Self).Handle);
  try
    ScrollControl(pnlGood, True, FGoodFirstTop, FGoodLastTop);
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TRestMainForm.OrderButtonOnClick(Sender: TObject);
var
  FUserInfo: TUserInfo;
begin
  //сначала ставим флаг, что редактируем набор данных
  if FOrderDataSet.Locate('ID', TButton(Sender).Tag, []) then
  begin
    if FOrderDataSet.FieldByName('ISLOCKED').AsInteger = 1 then
      if AdvTaskMessageDlg('Внимание', 'Заказ редактируется. Продолжить?',
        mtInformation, [mbYes, mbNo], 0) = IDYES then
      begin
        FUserInfo := FFrontBase.CheckUserPasswordWithForm;
        if FUserInfo.CheckedUserPassword then
        begin
          if (FUserInfo.UserInGroup and FFrontBase.Options.ManagerGroupMask) <> 0 then
            //
          else begin
            AdvTaskMessageDlg('Внимание', cn_dontManagerPermission, mtWarning, [mbOK], 0);
            exit;
          end;
        end else
          exit;
      end else
        exit;
  end;     
  FFrontBase.GetOrder(FHeaderTable, FLineTable, FModificationDataSet, TButton(Sender).Tag);
  FFrontBase.LockUserOrder(TButton(Sender).Tag);
  if not Assigned(dsMain.DataSet) then
    dsMain.DataSet := FLineTable
  else begin
    // для обнулений значений в гриде
    dsMain.DataSet := nil;
    dsMain.DataSet := FLineTable;
  end;
  FormState := MenuInfo;
end;

procedure TRestMainForm.btnNewOrderClick(Sender: TObject);
var
  FOrderForm: TOrderNumber;
  FGuestForm: TGuestForm;
  FOrderNumber: String;
  FGuestCount: Integer;
begin
  ClearDisplay;

{ TODO : Проверка на Max кол-во гостей }
  if (FFrontBase.UserGroup and FFrontBase.Options.ManagerGroupMask) <> 0 then
    // входит в группу менеджеры
  else begin
    if FFrontBase.CheckCountOrderByResp(FFrontBase.ContactKey) then
    begin
      AdvTaskMessageDlg('Внимание', 'Превышено максимально возможное число открытых заказов!', mtWarning, [mbOK], 0);
      exit;
    end;
  end;

  FOrderNumber := '';
  FFrontBase.GetOrder(FHeaderTable, FLineTable, FModificationDataSet, -1);
  if FFrontBase.Options.NoPassword then
    FOrderNumber := IntToStr(FFrontBase.GetNextOrderNum)
  else begin
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
  else begin
    FGuestForm := TGuestForm.Create(nil);
    try
      FGuestForm.ShowModal;
      if FGuestForm.ModalResult = mrOK then
        FGuestCount := FGuestForm.GuestCount
      else
        FGuestCount := 1;
    finally
      FGuestForm.Free;
    end;
  end;

  if (FGuestCount >= FFrontBase.Options.MinGuestCount) and (FOrderNumber <> '') then
  begin
    if not Assigned(dsMain.DataSet) then
      dsMain.DataSet := FLineTable;
    FormState := MenuInfo;

    FHeaderTable.Insert;
    FHeaderTable.FieldByName('NUMBER').AsString := FOrderNumber;
    FHeaderTable.FieldByName('USR$GUESTCOUNT').AsInteger := FGuestCount;
    FHeaderTable.FieldByName('USR$TIMEORDER').Value := Time;
    FHeaderTable.Post;
  end;
end;

procedure TRestMainForm.actOKExecute(Sender: TObject);
var
  OrderKey: Integer;
  PrinterName: String;
  PrnGrid: Integer;
begin
  case FFormState of
    Pass: Assert(False, 'Что мы тут делаем?');

    OrderMenu, ManagerPage, ManagerChooseOrder:
      begin
        //переходим на форму с паролем
        FormState := Pass;

      end;
    MenuInfo:
      begin
        //сохраняем чек
        if AdvTaskMessageDlg('Внимание', 'Закрыть заказ?',
          mtInformation, [mbYes, mbNo], 0) = IDYES then
        begin
          DBGrMain.DataSource := nil;
          try
            if FFrontBase.CreateNewOrder(FHeaderTable, FLineTable, FModificationDataSet, OrderKey) then
            begin
              if FFrontBase.Options.LastPrintOrder <> OrderKey then
              begin
                if FFrontBase.GetServiceCheckOptions(OrderKey, PrinterName, PrnGrid) then
                  if FReport.PrintServiceCheck(1, PrnGrid, OrderKey, PrinterName) then
                  begin
                    FFrontBase.SavePrintDate(OrderKey);
                    FFrontBase.CloseModifyTable(FModificationDataSet, Now);
                  end;
              end;
              FormState := OrderMenu;
            end;
          finally
            DBGrMain.DataSource := dsMain;
          end;
        end;
      end;
  end;
end;

procedure TRestMainForm.actCancelExecute(Sender: TObject);
begin
  FSelectedButton := nil;
  case FFormState of
    Pass: Assert(False, 'Что мы тут делаем');

    OrderMenu, ManagerPage, ManagerChooseOrder:
      begin
        FormState := Pass;

      end;
    MenuInfo:
      begin
        if not FOrderDataSet.IsEmpty then
          if FFrontBase.UnLockUserOrder(FOrderDataSet.FieldByName('ID').AsInteger) then
            FormState := OrderMenu
        else
          FormState := OrderMenu
      end;
  end;
end;

procedure TRestMainForm.actAddQuantityExecute(Sender: TObject);
begin
  if (not FLineTable.IsEmpty) and (FormState = MenuInfo) then
  begin
    FLineTable.Edit;
    FLineTable.FieldByName('USR$QUANTITY').AsCurrency :=
      FLineTable.FieldByName('USR$QUANTITY').AsCurrency + 1;
    if FLineTable.FieldByName('STATEFIELD').AsInteger = cn_StateNothing then
      FLineTable.FieldByName('STATEFIELD').AsInteger := cn_StateUpdate;
    FLineTable.Post;
    WritePos(FLineTable);
  end;
end;

procedure TRestMainForm.actRemoveQuantityExecute(Sender: TObject);
var
  Quantity: Currency;
  FDeleteForm: TDeleteOrderLine;
  Amount: Currency;
  FUserInfo: TUserInfo;  
begin
  if (not FLineTable.IsEmpty) and (FormState = MenuInfo) then
  begin
    Quantity := FLineTable.FieldByName('USR$QUANTITY').AsCurrency - 1;
    if (Quantity >= FLineTable.FieldByName('OLDQUANTITY').AsCurrency) and
      (FHeaderTable.FieldByName('USR$MN_PRINTDATE').IsNull) then
    begin
      FLineTable.Edit;
      FLineTable.FieldByName('USR$QUANTITY').AsCurrency := Quantity;
      if FLineTable.FieldByName('STATEFIELD').AsInteger = cn_StateNothing then
        FLineTable.FieldByName('STATEFIELD').AsInteger := cn_StateUpdate; 
      FLineTable.Post;
      WritePos(FLineTable);
      //обновить футер грида
      DBGrMain.SumList.RecalcAll;
    end else
    begin
      //удалять может только пользователь с правами менеджера
      FUserInfo := FFrontBase.CheckUserPasswordWithForm;
      if FUserInfo.CheckedUserPassword then
      begin
        if (FUserInfo.UserInGroup and FFrontBase.Options.ManagerGroupMask) <> 0 then
          //
        else begin
          AdvTaskMessageDlg('Внимание', cn_dontManagerPermission, mtWarning, [mbOK], 0);
          exit;
        end;

        FDeleteForm := TDeleteOrderLine.CreateWithFrontBase(nil, FFrontBase);
        try
          FDeleteForm.Quantity := FLineTable.FieldByName('USR$QUANTITY').AsCurrency;
          FDeleteForm.ShowModal;
          if FDeleteForm.ModalResult = mrOK then
          begin
            Amount := FDeleteForm.RemoveQuantity;
            FFrontBase.SaveOrderLog(FFrontBase.ContactKey, FUserInfo.UserKey,
              FHeaderTable.FieldByName('ID').AsInteger, FLineTable.FieldByName('ID').AsInteger, 3);
            DeleteOrderLine(Amount, FDeleteForm.DeleteClauseID);
            WritePos(FLineTable);
          end;
        finally
          FDeleteForm.Free;
        end;
      end;
    end;
  end;
end;

procedure TRestMainForm.actDeletePositionExecute(Sender: TObject);
var
  FDeleteForm: TDeleteOrderLine;
  Amount: Currency;
  FUserInfo: TUserInfo;
begin
  if (not FLineTable.IsEmpty) and (FormState = MenuInfo) then
  begin
    if (FLineTable.FieldByName('OLDQUANTITY').IsNull) and
      (FHeaderTable.FieldByName('USR$MN_PRINTDATE').IsNull)
    then
      FLineTable.Delete

    else
    begin
      //удалять может только пользователь с правами менеджера
      FUserInfo := FFrontBase.CheckUserPasswordWithForm;
      if FUserInfo.CheckedUserPassword then
      begin
        if (FUserInfo.UserInGroup and FFrontBase.Options.ManagerGroupMask) <> 0 then
          //
        else begin
          AdvTaskMessageDlg('Внимание', cn_dontManagerPermission, mtWarning, [mbOK], 0);
          exit;
        end;
        FDeleteForm := TDeleteOrderLine.CreateWithFrontBase(nil, FFrontBase);
        try
          FDeleteForm.Quantity := FLineTable.FieldByName('USR$QUANTITY').AsCurrency;
          FDeleteForm.ShowModal;
          if FDeleteForm.ModalResult = mrOK then
          begin
            Amount := FDeleteForm.RemoveQuantity;
            FFrontBase.SaveOrderLog(FFrontBase.ContactKey, FUserInfo.UserKey,
              FHeaderTable.FieldByName('ID').AsInteger, FLineTable.FieldByName('ID').AsInteger, 3);
            DeleteOrderLine(Amount, FDeleteForm.DeleteClauseID);
            WritePos(FLineTable);
          end;
        finally
          FDeleteForm.Free;
        end;
      end;
    end;
  end;
end;

procedure TRestMainForm.actModificationExecute(Sender: TObject);
var
  GoodKey: Integer;
  FForm: TModificationForm;
  S, ES: String;
begin
  S := '';
  ES := FLineTable.FieldByName('EXTRAMODIFY').AsString;
  if (not FLineTable.IsEmpty) and (FormState = MenuInfo) then
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
          end;
        finally
          FForm.Free;
        end;
      end;
    end;
  end;
end;

procedure TRestMainForm.actKeyBoardExecute(Sender: TObject);
begin
  TouchKeyBoard.Show;
end;

procedure TRestMainForm.actCutCheckExecute(Sender: TObject);
var
  FUserInfo: TUserInfo;
  MainOrderKey: Integer;
begin
  //1. Проверяем пароль менеджера
  FUserInfo := FFrontBase.CheckUserPasswordWithForm;
  if FUserInfo.CheckedUserPassword then
  begin
    if (FUserInfo.UserInGroup and FFrontBase.Options.ManagerGroupMask) <> 0 then
      //
    else begin
      AdvTaskMessageDlg('Внимание', cn_dontManagerPermission, mtWarning, [mbOK], 0);
      exit;
    end;

    //2. сохраняем заказ, получаем его ID
    DBGrMain.DataSource := nil;
    try
      FFrontBase.CreateNewOrder(FHeaderTable, FLineTable, FModificationDataSet, MainOrderKey);
    finally
      DBGrMain.DataSource := dsMain;
    end;

    //3. переход на форму менеджера
    FormState := ManagerChooseOrder;
    CreateUserList;

    if not Assigned(FSplitForm) then
      FSplitForm := TSplitOrder.Create(nil);
    FSplitForm.MainOrderKey := MainOrderKey;
    FSplitForm.ManagerKey := FUserInfo.UserKey;

  end;
end;

procedure TRestMainForm.actPreCheckExecute(Sender: TObject);
var
  OrderKey: Integer;
begin
  if FHeaderTable.FieldByName('usr$timecloseorder').IsNull then
  begin
    ClearDisplay;
    OrderKey := FHeaderTable.FieldByName('ID').AsInteger;
    DBGrMain.DataSource := nil;
    try
      FFrontBase.SaveAndReloadOrder(FHeaderTable, FLineTable,
        FModificationDataSet, OrderKey);
    finally
      DBGrMain.DataSource := dsMain;
    end;

    if FReport.PrintPreCheck(1, OrderKey) then
    begin
      if FHeaderTable.State = dsBrowse then
        FHeaderTable.Edit;
      FHeaderTable.FieldByName('usr$timecloseorder').AsDateTime := Now;
    end;  
  end else
  begin
    AdvTaskMessageDlg('Внимание', 'Пречек уже был распечатан!',
      mtInformation, [mbOK], 0);
  end;
end;

procedure TRestMainForm.actCancelPreCheckExecute(Sender: TObject);
var
  FUserInfo: TUserInfo;
begin
  FUserInfo := FFrontBase.CheckUserPasswordWithForm;
  if FUserInfo.CheckedUserPassword then
  begin
    if (FUserInfo.UserInGroup and FFrontBase.Options.ManagerGroupMask) <> 0 then
    begin
      if FFrontBase.OrderIsPayed(FHeaderTable.FieldByName('ID').AsInteger) then
        AdvTaskMessageDlg('Внимание', 'Этот заказ уже был оплачен',
          mtInformation, [mbOK], 0)
      else begin
        FHeaderTable.Edit;
        FHeaderTable.FieldByName('usr$timecloseorder').Clear;
        FHeaderTable.Post;
      end;

      FFrontBase.SaveOrderLog(FFrontBase.ContactKey, FUserInfo.UserKey,
        FHeaderTable.FieldByName('ID').AsInteger, 0, 1);
    end else
      AdvTaskMessageDlg('Внимание', cn_dontManagerPermission, mtWarning, [mbOK], 0);
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

  if DiscountType = 1 then
  begin
    FUserInfo := FFrontBase.CheckUserPasswordWithForm;
    if FUserInfo.CheckedUserPassword then
    begin
      if (FUserInfo.UserInGroup and FFrontBase.Options.ManagerGroupMask) <> 0 then
      begin
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
      else begin
        AdvTaskMessageDlg('Внимание', cn_dontManagerPermission, mtWarning, [mbOK], 0);
        exit;
      end;
    end;  
  end
  else if DiscountType = 2 then
  begin
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
        end else
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
end;

procedure TRestMainForm.actPayExecute(Sender: TObject);
var
  FForm: TSellParamForm;
  SumToPay: Currency;
  OrderKey: Integer;
begin
  OrderKey := FHeaderTable.FieldByName('ID').AsInteger;
  DBGrMain.DataSource := nil;
  try
    FFrontBase.SaveAndReloadOrder(FHeaderTable, FLineTable,
      FModificationDataSet, OrderKey);
  finally
    DBGrMain.DataSource := dsMain;
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

  FForm := TSellParamForm.CreateWithFrontBase(nil, FFrontBase);
  try
    FForm.FiscalRegistry := FFiscal;
    FForm.Doc := FHeaderTable;
    FForm.DocLine := FLineTable;
    FForm.SumToPay := SumToPay;
    FForm.ShowModal;
    if FForm.ModalResult = mrOK then
    begin
      //сохранить и выйти
      actOK.Execute;
    end;
  finally
    FForm.Free;
  end;
end;

procedure TRestMainForm.SetFormState(const Value: TRestState);
begin
  case Value of
    Pass:
      begin
        LockWindowUpdate(TForm(Self).Handle);
        try
          FFormState := Value;

          //1.Скрываем заголовки
          tsMain.TabVisible     := False;
          tsPassWord.TabVisible := False;
          tsMainButton.TabVisible := False;
          tsFunctionButton.TabVisible := False;
          tsOrderButton.TabVisible := False;
          tsMenu.TabVisible := False;
          tsManagerPage.TabVisible := False;
          tsGroup.TabVisible := False;
          tsOrderInfo.TabVisible := False;
          tsUserOrder.TabVisible := False;
          //2.Становимся на окно с пассом
          pcMain.ActivePage := tsPassWord;
          pcMenu.ActivePage := tsMenu;
          pcExtraButton.ActivePage := tsMainButton;
          pcOrder.ActivePage := tsUserOrder;
          //3.Активый эдит
          ActiveControl := edPassword;
          edPassword.Text := '';
          //4.
          pnlMainGood.Visible := False;
          pnlChoose.Visible   := False;
          pnlExtraGoodGroup.Visible := False;
          //5. установки кнопок
          FMenuButtonCount := 0;

          btnCashForm.Visible := False;
          btnEditReport.Visible := False;

          FLastLeftButton := 18 + btnWidth {$IFDEF NEW_TABCONTROL} + 4 {$ENDIF};;
          FGroupLastLeftButton := btnFirstTop;
          FLastTopButton  := btnFirstTop;
          FGroupLastTop   := btnFirstTop;
          FGoodLastTop    := btnFirstTop;
          FGoodLastLeftButton := btnFirstTop;
          FMenuLastTop    := -(btnHeight);

          FOrderButtonNumber := 1;
          FMenuButtonNumber  := 1;
          FGroupButtonNumber := 1;

          FMenuFirstTop := btnFirstTop;
          FGoodFirstTop := btnFirstTop;
          FGroupFirstTop := btnFirstTop;

          FUserFirstTop       := btnFirstTop;
          FUserLastLeftButton := btnFirstTop;
          FUserLastTop        := btnFirstTop;
          FUserButtonNumber   := 1;

          FUserOrderFirstTop       := btnFirstTop;
          FUserOrderLastLeftButton := btnFirstTop;
          FUserOrderLastTop        := btnFirstTop;
          FUserOrderButtonNumber   := btnFirstTop;

          FMenuKey := -1;
          FLineID := 1;
          FWithPreCheck := False;

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

//          ClearDisplay;
        finally
          LockWindowUpdate(0);
        end;
      end;

    OrderMenu:
      begin
        LockWindowUpdate(TForm(Self).Handle);
        try
          FFormState := Value;

          pcMain.ActivePage := tsMain;
          pcOrder.ActivePage := tsUserOrder;
          pcExtraButton.ActivePage := tsOrderButton;
          pcMenu.ActivePage := tsMenu;
          pnlChoose.Visible := False;
          pnlMainGood.Visible := False;
          tsManagerPage.Visible := False;
          RemoveGoodButton;
          RemoveGroupButton;
          RemoveOrderButton;
          RemoveMenuButton;

          //
          FLineTable.Close;
          FLineTable.CreateTable;
          FLineTable.Open;
          //
          btnCashForm.Visible := True;
          btnEditReport.Visible := True;

          FLastLeftButton := 18 + btnWidth {$IFDEF NEW_TABCONTROL} + 4 {$ENDIF};;
          FLastTopButton  := btnFirstTop;
          FMenuLastTop    := -(btnHeight);
          FMenuButtonCount := 0;
          FGroupLastTop   := btnFirstTop;

          FUserFirstTop       := btnFirstTop;
          FUserLastLeftButton := btnFirstTop;
          FUserLastTop        := btnFirstTop;
          FUserButtonNumber   := 1;

          FUserOrderFirstTop       := btnFirstTop;
          FUserOrderLastLeftButton := btnFirstTop;
          FUserOrderLastTop        := btnFirstTop;
          FUserOrderButtonNumber   := 1;

          FLineID := 1;
          FWithPreCheck := False;

          FFrontBase.GetUserOrders(-1, FOrderDataSet);

          CreateOrderButtonList;
          CreateMenuButtonList;
          AddPopularGoods;

          ClearDisplay;
        finally
          LockWindowUpdate(0);
        end;
      end;

    MenuInfo:
      begin
        FFormState := Value;
        pcExtraButton.ActivePage := tsFunctionButton;
        pcOrder.ActivePage := tsOrderInfo;
        pnlChoose.Visible := True;
      end;

    ManagerPage:
      begin
        LockWindowUpdate(TForm(Self).Handle);
        try
          RemoveUserButton;
          RemoveUserOrderButton;

          if FWithPreCheck then
            btnPredCheck.Caption := 'Без предчека'
          else
            btnPredCheck.Caption := 'С предчеком';

          FFormState := Value;
          pcOrder.ActivePage := tsManagerPage;
          pcExtraButton.ActivePage := tsOrderButton;

          btnCashForm.Visible := True;
          btnEditReport.Visible := True;

          FUserFirstTop       := btnFirstTop;
          FUserLastLeftButton := btnFirstTop;
          FUserLastTop        := -(btnHeight - 6);
          FUserButtonNumber   := 1;

          FUserOrderFirstTop       := btnFirstTop;
          FUserOrderLastLeftButton := btnFirstTop;
          FUserOrderLastTop        := btnFirstTop;
          FUserOrderButtonNumber   := btnFirstTop;
          FMaxUserOrderButtonLeft  := btnFirstTop;

          FLineID := 1;

          ClearDisplay;
        finally
          LockWindowUpdate(0);
        end;
      end;

    ManagerChooseOrder:
      begin
        LockWindowUpdate(TForm(Self).Handle);
        try
          RemoveUserButton;
          RemoveUserOrderButton;

          pcMenu.ActivePage := tsMenu;
          pnlChoose.Visible := False;
          pnlMainGood.Visible := False;          

          if FWithPreCheck then
            btnPredCheck.Caption := 'Без предчека'
          else
            btnPredCheck.Caption := 'С предчеком';

          FFormState := Value;
          pcOrder.ActivePage := tsManagerPage;
          pcExtraButton.ActivePage := tsOrderButton;

          FUserFirstTop       := btnFirstTop;
          FUserLastLeftButton := btnFirstTop;
          FUserLastTop        := -(btnHeight - 6);
          FUserButtonNumber   := 1;

          FUserOrderFirstTop       := btnFirstTop;
          FUserOrderLastLeftButton := btnFirstTop;
          FUserOrderLastTop        := btnFirstTop;
          FUserOrderButtonNumber   := btnFirstTop;
          FMaxUserOrderButtonLeft  := btnFirstTop;

          FLineID := 1;

          ClearDisplay;
        finally
          LockWindowUpdate(0);
        end;
      end;
  end;
end;

procedure TRestMainForm.AddUserButton(const MemTable: TkbmMemTable);
var
  FButton: TAdvSmoothButton;
begin
  //Создание кнопки
  FButton := TAdvSmoothButton.Create(pnlUsers);
  FButton.Appearance.Font.Name := cn_FontType;
  FButton.Appearance.BeginUpdate;
  try
    FButton.Color := btnColor;
    FButton.Appearance.Font.Size := cn_ButtonFontSize;
    FButton.Parent := pnlUsers;
    FButton.Name := Format(btnUserName, [FUserButtonNumber]);
    FButton.Height := btnHeight;
    FButton.Width  := btnLongWidth - 40;

    FUserLastTop := FUserLastTop + btnHeight + 2;

    FButton.Left := btnFirstTop;
    FButton.Top  := FUserLastTop;

    FButton.Tag := MemTable.FieldByName('ID').AsInteger;
    FButton.Caption := MemTable.FieldByName('NAME').AsString;
  finally
    FButton.Appearance.EndUpdate;
  end;
  FUsersButtonList.Add(FButton);
  Inc(FUserButtonNumber);
end;

procedure TRestMainForm.CreateUserList;
var
  UserTable: TkbmMemTable;
  OrderTable: TkbmMemTable;
begin
  LockWindowUpdate(TForm(Self).Handle);
  try
    UserTable := TkbmMemTable.Create(nil);
    try
      UserTable.FieldDefs.Add('ID', ftInteger, 0);
      UserTable.FieldDefs.Add('NAME', ftString, 60);
      UserTable.FieldDefs.Add('ingroup', ftInteger, 0);
      UserTable.CreateTable;
      UserTable.Open;

      FFrontBase.GetActiveWaiterList(UserTable, FWithPreCheck);
      UserTable.First;
      if not UserTable.Eof then
      begin
        OrderTable := TkbmMemTable.Create(nil);
        OrderTable.FieldDefs.Add('TableName', ftString, 20);
        OrderTable.FieldDefs.Add('GuestNumbers', ftInteger, 0);
        OrderTable.FieldDefs.Add('OpenTime', ftDateTime, 0);
        OrderTable.FieldDefs.Add('Summ', ftCurrency, 0);
        OrderTable.FieldDefs.Add('Status', ftInteger, 0);
        OrderTable.FieldDefs.Add('ID', ftInteger, 0);
        OrderTable.FieldDefs.Add('ISLOCKED', ftInteger, 0);
        OrderTable.CreateTable;
        OrderTable.Open;
        try
          while not UserTable.Eof do
          begin
            if (UserTable.FieldByName('InGroup').AsInteger and FFrontBase.Options.WaiterGroupMask) <> 0 then
            begin
              //1. Отрисовываем кнопку
              AddUserButton(UserTable);
              //2. Смотрим для контакта список заказов
              FFrontBase.GetUserOrders(UserTable.FieldByName('ID').AsInteger, OrderTable);
              OrderTable.First;
              //3. Отрисовываем заказы
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
            UserTable.Next;
          end;
          FUserOrderLastLeftButton := btnFirstTop;
        finally
          OrderTable.Free;
        end;
      end;
    finally
      UserTable.Free;
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
  //Создание кнопки
  FButton := TAdvSmoothButton.Create(pnlUserOrders);
  FButton.Appearance.Font.Name := cn_FontType;
  FButton.Appearance.BeginUpdate;
  try
    FButton.Color := btnColor;
    FButton.Appearance.Font.Size := cn_ButtonFontSize;
    FButton.Parent := pnlUserOrders;
    if FormState = ManagerPage then
      FButton.OnClick := OrderButtonOnClick
    else
      FButton.OnClick := SplitButtonOnClick;
    FButton.Name := Format(btnUserOrderName, [FUserOrderButtonNumber]);
    FButton.Height := btnHeight;
    FButton.Width  := btnWidth;

    FButton.Left := FUserOrderLastLeftButton;
    FButton.Top  := FUserOrderLastTop;

    FButton.Tag := MemTable.FieldByName('ID').AsInteger;
    FButton.Caption := Format('№ %s', [MemTable.FieldByName('TableName').AsString]);
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

  FUserOrderLastLeftButton := FUserOrderLastLeftButton + btnWidth + 10;

  FUsersOrderButtonList.Add(FButton);
  Inc(FUserOrderButtonNumber);
end;

procedure TRestMainForm.RemoveUserOrderButton;
begin
  FUsersOrderButtonList.Clear;
end;

procedure TRestMainForm.Button14Click(Sender: TObject);
begin
  FormState := OrderMenu;
  FormState := ManagerPage;
  CreateUserList;
end;

procedure TRestMainForm.actUsersUpExecute(Sender: TObject);
var
  TempLastTop, TempFirstTop: Integer;
begin
  LockWindowUpdate(TForm(Self).Handle);
  try
    TempLastTop := FUserLastTop;
    TempFirstTop := FUserFirstTop;
    ScrollControl(pnlUsers, False, FUserFirstTop, FUserLastTop);
    ScrollControl(pnlUserOrders, False, TempFirstTop, TempLastTop);
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TRestMainForm.actUsersDownExecute(Sender: TObject);
var
  TempLastTop, TempFirstTop: Integer;
begin
  LockWindowUpdate(TForm(Self).Handle);
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
begin
  if (not FLineTable.IsEmpty) and (FormState = MenuInfo) then
  begin
    GoodKey := FLineTable.FieldByName('usr$goodkey').AsInteger;
    if FGoodDataSet.Locate('ID', GoodKey, []) then
      if FGoodDataSet.FieldByName('BEDIVIDE').AsInteger = 1 then
      begin
        FForm := TDevideForm.Create(nil);
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
              end;
            except
              on E: Exception do
              begin
                if E is EConvertError then
                  AdvTaskMessageDlg('Внимание', 'Введено неверное число', mtError, [mbOK], 0)
                else
                  AdvTaskMessageDlg('Внимание', 'Ошибка ' + E.Message, mtError, [mbOK], 0)
              end;
            end;
          end;
        finally
          FForm.Free;
        end;
      end;
  end;
end;

procedure TRestMainForm.WritePos(DataSet: TDataSet);
begin
  FFrontBase.Display.WritePos(DataSet.FieldByName('GOODNAME').AsString,
    DataSet.FieldByName('usr$quantity').AsCurrency, DataSet.FieldByName('usr$costncu').AsCurrency);
end;

procedure TRestMainForm.ClearDisplay;
begin
  FFrontBase.Display.Clear;
end;

procedure TRestMainForm.DeleteOrderLine(var Amount: Currency;
  const CauseKey: Integer);
var
  OldQuantity: Currency;
  OldDetailID, MasterKey: Integer;
  V: Array of Variant;
  I: Integer;
  PrnGrid, DocumentKey, OrderKey: Integer;
  PrinterName: String;
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

  //скопируем запись
  FLineTable.Append;
  for I := 0 to FLineTable.FieldCount - 1 do
  if VarIsNull(V[I]) then
    FLineTable.Fields[I].Clear
  else
    FLineTable.Fields[I].AsString := V[I];
//  FLineTable.FieldByName('ID').Clear;
  DocumentKey := FFrontBase.GetNextID;
  FLineTable.FieldByName('ID').AsInteger := DocumentKey;
  FLineTable.FieldByName('LINEKEY').AsInteger := FLineID;
  FLineTable.FieldByName('USR$QUANTITY').AsCurrency := Amount;
  FLineTable.FieldByName('STATEFIELD').AsInteger := cn_StateInsert;
  FLineTable.FieldByName('usr$causedeletekey').AsInteger := CauseKey;
  FLineTable.Post;

  Inc(FLineID);

  MasterKey := FHeaderTable.FieldByName('ID').AsInteger;
  OrderKey := FHeaderTable.FieldByName('ID').AsInteger;
  DBGrMain.DataSource := nil;
  try
    FFrontBase.SaveAndReloadOrder(FHeaderTable, FLineTable,
      FModificationDataSet, OrderKey);
  finally
    DBGrMain.DataSource := dsMain;
  end;
  //обновить футер грида
  DBGrMain.SumList.RecalcAll;

  if FFrontBase.GetDeleteServiceCheckOptions(OldDetailID, MasterKey,
    PrinterName, PrnGrid)
  then
    FReport.PrintDeleteServiceCheck(1, PrnGrid, MasterKey,
      DocumentKey, PrinterName);

end;

procedure TRestMainForm.OnFilterLine(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := ((DataSet.FieldByName('usr$quantity').AsCurrency > 0)
    and (DataSet.FieldByName('usr$causedeletekey').AsInteger = 0));
end;

procedure TRestMainForm.DBGridEh2Columns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
var
  S: String;
begin
  S := FLineTable.FieldByName('MODIFYSTRING').AsString;

  if S > '' then
    Params.Text := Params.Text + #13#10 + S
end;

procedure TRestMainForm.btnPredCheckClick(Sender: TObject);
var
  WithPreCheck: Boolean;
begin
  WithPreCheck := not FWithPreCheck;
  FormState := OrderMenu;
  FWithPreCheck := WithPreCheck;
  FormState := ManagerChooseOrder;
  CreateUserList;
end;

procedure TRestMainForm.SplitButtonOnClick(Sender: TObject);
begin
  if Assigned(FSplitForm) then
  begin
    FSplitForm.OrderKey := TButton(Sender).Tag;
    FSplitForm.FrontBase := FFrontBase;

    try
      FSplitForm.ShowModal;
      FormState := OrderMenu;
    finally
      FreeAndNil(FSplitForm);
    end;
  end;
end;

procedure TRestMainForm.actUserLeftExecute(Sender: TObject);
begin
  LockWindowUpdate(TForm(Self).Handle);
  try
    VertScrollControl(pnlUserOrders, False, FUserOrderLastLeftButton, FMaxUserOrderButtonLeft)
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TRestMainForm.actUserRightExecute(Sender: TObject);
begin
  LockWindowUpdate(TForm(Self).Handle);
  try
    VertScrollControl(pnlUserOrders, True, FUserOrderLastLeftButton, FMaxUserOrderButtonLeft);
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TRestMainForm.VertScrollControl(const FControl: TWinControl;
  const ToRight: Boolean; var Left, Right: Integer);
var
  Step: Integer;
begin
  Step := 0;
  if ToRight then
  begin
    while (Step < btnHeight + 8) and (Right + btnHeight > FControl.Width) do
    begin
      FControl.ScrollBy(-1, 0);

      Dec(Right);
      Inc(Left);
      Inc(Step);
    end;
  end else
  begin
    while (Step < btnHeight + 8) and (Left > 8) do
    begin
      FControl.ScrollBy(1, 0);

      Inc(Right);
      Dec(Left);
      Inc(Step);
    end;
  end;
end;

procedure TRestMainForm.actExitWindowsExecute(Sender: TObject);
begin
  if AdvTaskMessageDlg('Внимание', 'Выключить рабочую станцию?',
    mtInformation, [mbYes, mbNo], 0) = IDYES then
  begin
    if cn_ShutDownOnExit then
      ShutDownOS(klNormal)
    else
      Application.Terminate;
  end;
end;

procedure TRestMainForm.actRestartRestExecute(Sender: TObject);
begin
  {$IFDEF MSWINDOWS}
  if AdvTaskMessageDlg('Внимание', 'Перезапустить приложение?',
    mtInformation, [mbYes, mbNo], 0) = IDYES then
  begin
    Application.Terminate;
    WinExec32(CmdLine, 1);
  end;
  {$ENDIF MSWINDOWS}
end;

procedure TRestMainForm.OnBeforePostLine(DataSet: TDataSet);
begin
  //1. Проверяем на скидку
  if FHeaderTable.FieldByName('USR$DISCOUNTKEY').AsInteger > 0 then
    DataSet.FieldByName('USR$PERSDISCOUNT').AsCurrency :=
      FFrontBase.GetDiscount(FHeaderTable.FieldByName('USR$DISCOUNTKEY').AsInteger,
        DataSet.FieldByName('usr$goodkey').AsInteger,
        FHeaderTable.FieldByName('usr$logicdate').AsDateTime,
        DataSet.FieldByName('usr$persdiscount').AsCurrency)
  else
    DataSet.FieldByName('USR$PERSDISCOUNT').AsCurrency := 0;

{ TODO : Двойной бонус? }
  if DataSet.FieldByName('STATEFIELD').AsInteger = cn_StateNothing then
    DataSet.FieldByName('STATEFIELD').AsInteger := cn_StateUpdate;

  DataSet.FieldByName('USR$SUMNCU').AsCurrency :=
    DataSet.FieldBYName('USR$COSTNCU').AsCurrency *
    DataSet.FieldBYName('USR$QUANTITY').AsCurrency;

  DataSet.FieldByName('USR$SUMNCUWITHDISCOUNT').AsCurrency :=
    FFrontBase.RoundCost(DataSet.FieldByName('USR$SUMNCU').AsCurrency *
    (1 - DataSet.FieldBYName('USR$PERSDISCOUNT').AsCurrency /100.00));

  if DataSet.FieldBYName('USR$QUANTITY').AsCurrency <> 0 then
    DataSet.FieldBYName('USR$COSTNCUWITHDISCOUNT').AsCurrency :=
      DataSet.FieldByName('USR$SUMNCUWITHDISCOUNT').AsCurrency /
      DataSet.FieldBYName('USR$QUANTITY').AsCurrency
  else
    DataSet.FieldBYName('USR$COSTNCUWITHDISCOUNT').AsCurrency :=
      DataSet.FieldBYName('USR$COSTNCU').AsCurrency;

  DataSet.FieldByName('USR$SUMDISCOUNT').AsCurrency :=
    DataSet.FieldByName('USR$SUMNCU').AsCurrency -
    DataSet.FieldByName('USR$SUMNCUWITHDISCOUNT').AsCurrency;
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
    if bonus then
      FLineTable.FieldByName('USR$PERSDISCOUNT').AsCurrency := PercDisc;
    FLineTable.Post;

    FLineTable.Next;
  end;
end;

procedure TRestMainForm.actModificationUpdate(Sender: TObject);
begin
  actModification.Enabled := FHeaderTable.FieldByName('usr$timecloseorder').IsNull;
end;

procedure TRestMainForm.actAddQuantityUpdate(Sender: TObject);
begin
  actAddQuantity.Enabled := (FHeaderTable.FieldByName('usr$timecloseorder').IsNull
    and FLineTable.FieldByName('usr$mn_printdate').IsNull);
end;

procedure TRestMainForm.actRemoveQuantityUpdate(Sender: TObject);
begin
  actRemoveQuantity.Enabled := FHeaderTable.FieldByName('usr$timecloseorder').IsNull;
end;

procedure TRestMainForm.actDeletePositionUpdate(Sender: TObject);
begin
  actDeletePosition.Enabled := FHeaderTable.FieldByName('usr$timecloseorder').IsNull;
end;

procedure TRestMainForm.actCutCheckUpdate(Sender: TObject);
begin
  actCutCheck.Enabled := FHeaderTable.FieldByName('usr$timecloseorder').IsNull;
end;

procedure TRestMainForm.actPreCheckUpdate(Sender: TObject);
begin
  actPreCheck.Enabled := FHeaderTable.FieldByName('usr$timecloseorder').IsNull;
end;

procedure TRestMainForm.actDiscountUpdate(Sender: TObject);
begin
  actDiscount.Enabled := FHeaderTable.FieldByName('usr$timecloseorder').IsNull;
end;

procedure TRestMainForm.actDevideUpdate(Sender: TObject);
begin
  actDevide.Enabled := FHeaderTable.FieldByName('usr$timecloseorder').IsNull;
end;

procedure TRestMainForm.actPayUpdate(Sender: TObject);
begin
  actPay.Enabled := not FLineTable.IsEmpty;
end;

procedure TRestMainForm.actEditReportExecute(Sender: TObject);
var
  FUserInfo: TUserInfo;
  Form: TEditReport;
begin
  FUserInfo := FFrontBase.CheckUserPasswordWithForm;
  if FUserInfo.CheckedUserPassword then
  begin
    if (FUserInfo.UserInGroup and FFrontBase.Options.ManagerGroupMask) <> 0 then
    else begin
      AdvTaskMessageDlg('Внимание', cn_dontManagerPermission, mtWarning, [mbOK], 0);
      exit;
    end;
    Form := TEditReport.Create(nil);
    try
      Form.FrontBase := FFrontBase;
      Form.ShowModal;
    finally
      Form.Free;
      if edPassword.CanFocus then
        edPassword.SetFocus;
    end;
  end;
end;

procedure TRestMainForm.OnAfterPost(DataSet: TDataSet);
begin
  // так надо
end;

procedure TRestMainForm.OnAfterDelete(DataSet: TDataSet);
begin
  //обновить футер грида
  DBGrMain.SumList.RecalcAll;
end;

procedure TRestMainForm.actCashFormExecute(Sender: TObject);
var
  FUserInfo: TUserInfo;
  FForm: TCashForm;
begin
  FUserInfo := FFrontBase.CheckUserPasswordWithForm;
  if FUserInfo.CheckedUserPassword then
  begin
    if ((FUserInfo.UserInGroup and FFrontBase.Options.ManagerGroupMask) <> 0) or
      ((FUserInfo.UserInGroup and FFrontBase.Options.KassaGroupMask) <> 0) then
    else begin
      AdvTaskMessageDlg('Внимание', 'Данный пользователь не обладает правами менеджера или кассира!',
        mtWarning, [mbOK], 0);
      exit;
    end;
    FForm := TCashForm.Create(Self);
    try
      FForm.FiscalRegistry := FFiscal;
      FForm.IsManager := ((FUserInfo.UserInGroup and FFrontBase.Options.ManagerGroupMask) <> 0);
      FForm.ShowModal;
    finally
      FForm.Free;
    end;
  end;
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

procedure TRestMainForm.actScrollDownUpdate(Sender: TObject);
begin
  if pcMenu.ActivePage = tsMenu then
    if FMenuButtonCount > 6 then
      actScrollDown.Enabled := (FMenuLastTop + btnHeight > pnlMenu.Height)
    else
      actScrollDown.Enabled := (FGroupLastTop + btnHeight > pnlExtraGoodGroup.Height)
  else
    actScrollDown.Enabled := (FGroupLastTop + btnHeight > pnlGoodGroup.Height);
end;

end.
