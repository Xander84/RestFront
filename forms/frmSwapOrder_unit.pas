unit frmSwapOrder_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrontForm_Unit, ExtCtrls, AdvPanel, AdvSmoothButton, StdCtrls,
  Generics.Collections, rfOrder_unit, rfUser_unit, Front_DataBase_Unit;

type
  TfrmSwapOrder = class(TBaseFrontForm)
    pnlBottom: TPanel;
    btnOK: TAdvSmoothButton;
    btnCancel: TAdvSmoothButton;
    pnlMain: TAdvPanel;
    lbItemListFrom: TListBox;
    lbItemListTo: TListBox;
    btnMoveRight: TAdvSmoothButton;
    btnMoveRightAll: TAdvSmoothButton;
    btnMoveLeftAll: TAdvSmoothButton;
    btnMoveLeft: TAdvSmoothButton;
    cbObjectFrom: TComboBox;
    cbObjectTo: TComboBox;
    btnChooseObjectFrom: TAdvSmoothButton;
    btnChooseObjectTo: TAdvSmoothButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnMoveRightClick(Sender: TObject);
    procedure btnMoveLeftClick(Sender: TObject);
    procedure btnMoveRightAllClick(Sender: TObject);
    procedure btnMoveLeftAllClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbObjectFromChange(Sender: TObject);
    procedure cbObjectToChange(Sender: TObject);
    procedure btnChooseObjectFromClick(Sender: TObject);
    procedure btnChooseObjectToClick(Sender: TObject);
  private
    FItemListFrom: TList<TrfOrder>;
    FItemListTo: TList<TrfOrder>;
    FDBManager: TFrontBase;
    function GetUserFrom: TrfUser;
    function GetUserTo: TrfUser;
  public
    function ShowModalForTable(const ATableNameFrom, ATableNameTo: String): TModalResult;
    function ShowModalForWaiter(DBManager: TFrontBase): TModalResult;

    property ItemListFrom: TList<TrfOrder> read FItemListFrom write FItemListFrom;
    property ItemListTo: TList<TrfOrder> read FItemListTo write FItemListTo;
    property UserFrom: TrfUser read GetUserFrom;
    property UserTo: TrfUser read GetUserTo;
  end;

implementation

{$R *.dfm}

uses
  FrontData_Unit;

procedure TfrmSwapOrder.btnMoveLeftClick(Sender: TObject);
var
  Order: TrfOrder;
  FromIndex: Integer;
begin
  if (lbItemListTo.Count > 0) and (cbObjectFrom.ItemIndex > -1) then
  begin
    FromIndex := lbItemListTo.ItemIndex;
    if FromIndex = -1 then
      FromIndex := 0;

    Order := FItemListTo.Items[FromIndex];
    FItemListTo.Delete(FromIndex);
    lbItemListTo.Items.Delete(FromIndex);

    FItemListFrom.Add(Order);
    lbItemListFrom.Items.Add('Заказ № ' + Order.Number);
  end;
end;

procedure TfrmSwapOrder.btnChooseObjectFromClick(Sender: TObject);
var
  UserInfo: TUserInfo;
  I: Integer;
begin
  // удалять может только пользователь с правами менеджера
  UserInfo := FDBManager.CheckUserPasswordWithForm;
  if UserInfo.CheckedUserPassword then
  begin
    for I := 0 to cbObjectFrom.Items.Count - 1 do
      if Assigned(cbObjectFrom.Items.Objects[I])
         and (TrfUser(cbObjectFrom.Items.Objects[I]).ID = UserInfo.UserKey) then
      begin
        cbObjectFrom.ItemIndex := I;
        cbObjectFrom.OnChange(cbObjectFrom);
      end;
  end;
end;

procedure TfrmSwapOrder.btnChooseObjectToClick(Sender: TObject);
var
  UserInfo: TUserInfo;
  I: Integer;
begin
  // удалять может только пользователь с правами менеджера
  UserInfo := FDBManager.CheckUserPasswordWithForm;
  if UserInfo.CheckedUserPassword then
  begin
    for I := 0 to cbObjectTo.Items.Count - 1 do
      if Assigned(cbObjectTo.Items.Objects[I])
         and (TrfUser(cbObjectTo.Items.Objects[I]).ID = UserInfo.UserKey) then
      begin
        cbObjectTo.ItemIndex := I;
        cbObjectTo.OnChange(cbObjectTo);
      end;
  end;
end;

procedure TfrmSwapOrder.btnMoveLeftAllClick(Sender: TObject);
var
  Order: TrfOrder;
  FromIndex: Integer;
begin
  if cbObjectFrom.ItemIndex > -1 then
  begin
    for FromIndex := 0 to lbItemListTo.Count - 1 do
    begin
      Order := FItemListTo.Items[FromIndex];

      FItemListFrom.Add(Order);
      lbItemListFrom.Items.Add('Заказ № ' + Order.Number);
    end;

    FItemListTo.Clear;
    lbItemListTo.Clear;
  end;
end;

procedure TfrmSwapOrder.btnMoveRightClick(Sender: TObject);
var
  Order: TrfOrder;
  FromIndex: Integer;
begin
  if (lbItemListFrom.Count > 0) and (cbObjectTo.ItemIndex > -1) then
  begin
    FromIndex := lbItemListFrom.ItemIndex;
    if FromIndex = -1 then
      FromIndex := 0;

    Order := FItemListFrom.Items[FromIndex];
    FItemListFrom.Delete(FromIndex);
    lbItemListFrom.Items.Delete(FromIndex);

    FItemListTo.Add(Order);
    lbItemListTo.Items.Add('Заказ № ' + Order.Number);
  end;
end;

procedure TfrmSwapOrder.btnMoveRightAllClick(Sender: TObject);
var
  Order: TrfOrder;
  FromIndex: Integer;
begin
  if cbObjectTo.ItemIndex > -1 then
  begin
    for FromIndex := 0 to lbItemListFrom.Count - 1 do
    begin
      Order := FItemListFrom.Items[FromIndex];

      FItemListTo.Add(Order);
      lbItemListTo.Items.Add('Заказ № ' + Order.Number);
    end;

    FItemListFrom.Clear;
    lbItemListFrom.Clear;
  end;
end;

procedure TfrmSwapOrder.cbObjectFromChange(Sender: TObject);
var
  User: TrfUser;
  Order: TrfOrder;
begin
  User := GetUserFrom;
  if Assigned(User) then
  begin
    FDBManager.GetUserOrderList(User.ID, FItemListFrom);

    lbItemListFrom.Clear;
    for Order in FItemListFrom do
      lbItemListFrom.Items.Add('Заказ № ' + Order.Number);

    cbObjectFrom.Enabled := False;
    btnChooseObjectFrom.Enabled := False;
  end;
end;

procedure TfrmSwapOrder.cbObjectToChange(Sender: TObject);
var
  User: TrfUser;
  Order: TrfOrder;
begin
  User := GetUserTo;
  if Assigned(User) then
  begin
    FDBManager.GetUserOrderList(User.ID, FItemListTo);

    lbItemListTo.Clear;
    for Order in FItemListTo do
      lbItemListTo.Items.Add('Заказ № ' + Order.Number);

    cbObjectTo.Enabled := False;
    btnChooseObjectTo.Enabled := False;
  end;
end;

procedure TfrmSwapOrder.FormCreate(Sender: TObject);
begin
  inherited;

  btnOK.Picture := FrontData.RestPictureContainer.FindPicture('tick');
  btnCancel.Picture := FrontData.RestPictureContainer.FindPicture('cross');
  btnMoveRight.Picture := FrontData.RestPictureContainer.FindPicture('right');
  btnMoveRightAll.Picture := FrontData.RestPictureContainer.FindPicture('allright');
  btnMoveLeft.Picture := FrontData.RestPictureContainer.FindPicture('left');
  btnMoveLeftAll.Picture := FrontData.RestPictureContainer.FindPicture('allleft');

  btnChooseObjectFrom.Picture := FrontData.RestPictureContainer.FindPicture('user');
  btnChooseObjectTo.Picture := FrontData.RestPictureContainer.FindPicture('user');
end;

procedure TfrmSwapOrder.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  // Уничтожая объекты в cbObjectFrom мы одновременно уничтожаем их и в cbObjectTo
  //  т.к. они одинаковы
  for I := 0 to cbObjectFrom.Items.Count - 1 do
    if Assigned(cbObjectFrom.Items.Objects[I]) then
      cbObjectFrom.Items.Objects[I].Free;
end;

procedure TfrmSwapOrder.FormShow(Sender: TObject);
var
  Order: TrfOrder;
begin
  inherited;

  lbItemListFrom.Clear;
  if Assigned(FItemListFrom) then
    for Order in FItemListFrom do
      lbItemListFrom.Items.Add('Заказ № ' + Order.Number);

  lbItemListTo.Clear;
  if Assigned(FItemListTo) then
    for Order in FItemListTo do
      lbItemListTo.Items.Add('Заказ № ' + Order.Number);
end;

function TfrmSwapOrder.GetUserFrom: TrfUser;
begin
  Result := nil;
  // Если выбран исходный объект-пользователь
  if (cbObjectFrom.ItemIndex > -1)
    and Assigned(cbObjectFrom.Items.Objects[cbObjectFrom.ItemIndex])
    and (cbObjectFrom.Items.Objects[cbObjectFrom.ItemIndex] is TrfUser) then
  begin
    Result := TrfUser(cbObjectFrom.Items.Objects[cbObjectFrom.ItemIndex]);
  end;
end;

function TfrmSwapOrder.GetUserTo: TrfUser;
begin
  Result := nil;
  // Если выбран целевой объект-пользователь
  if (cbObjectTo.ItemIndex > -1)
    and Assigned(cbObjectTo.Items.Objects[cbObjectTo.ItemIndex])
    and (cbObjectTo.Items.Objects[cbObjectTo.ItemIndex] is TrfUser) then
  begin
    Result := TrfUser(cbObjectTo.Items.Objects[cbObjectTo.ItemIndex]);
  end;
end;

function TfrmSwapOrder.ShowModalForTable(const ATableNameFrom, ATableNameTo: String): TModalResult;
begin
  cbObjectFrom.AddItem(ATableNameFrom, nil);
  cbObjectFrom.ItemIndex := 0;
  cbObjectFrom.Enabled := False;
  btnChooseObjectFrom.Enabled := False;
  cbObjectTo.AddItem(ATableNameTo, nil);
  cbObjectTo.ItemIndex := 0;
  cbObjectTo.Enabled := False;
  btnChooseObjectTo.Enabled := False;
  Result := ShowModal;
end;

function TfrmSwapOrder.ShowModalForWaiter(DBManager: TFrontBase): TModalResult;
var
  User: TrfUser;
  UserList: TList<TrfUser>;
begin
  if Assigned(DBManager) then
  begin
    FDBManager := DBManager;
    // Обратимся к БД и получим список пользователей
    UserList := TList<TrfUser>.Create;
    try
      // Получим список пользователей из БД
      FDBManager.GetWaiterList(UserList);
      for User in UserList do
      begin
        cbObjectFrom.AddItem(User.Name, User);
        cbObjectTo.AddItem(User.Name, User);
      end;
    finally
      // Содержимое списка будет уничтожено при закрытии формы
      FreeAndNil(UserList);
    end;

    Result := ShowModal;
  end
  else
    raise Exception.Create('Не присвоена БД');
end;

end.
