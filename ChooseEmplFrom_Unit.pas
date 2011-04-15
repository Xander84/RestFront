unit ChooseEmplFrom_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, AdvPanel, Front_DataBase_Unit,
  FrontData_Unit, BaseFrontForm_Unit, AdvSmoothButton, AdvCombo;

type
  TChooseEmpl = class(TBaseFrontForm)
    pnlMain: TAdvPanel;
    cbEmplName: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    cbResp: TComboBox;
    pnlBottom: TAdvPanel;
    btnOK: TAdvSmoothButton;
    btnCancel: TAdvSmoothButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    function GetEmplkey: Integer;
    function GetRespKey: Integer;
    { Private declarations }
  public
    procedure FillEmployees;
    property RespKey: Integer read GetRespKey;
    property EmplKey: Integer read GetEmplkey;
  end;

implementation

{$R *.dfm}

uses
  Generics.Collections, rfUser_unit;

{ TChooseEmpl }

procedure TChooseEmpl.FormCreate(Sender: TObject);
begin
  inherited;

  btnOK.Picture := FrontData.RestPictureContainer.FindPicture('tick');
  btnCancel.Picture := FrontData.RestPictureContainer.FindPicture('cross');
end;

procedure TChooseEmpl.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  // Уничтожая объекты в cbEmplName мы одновременно уничтожаем их и в cbResp
  //  т.к. они одинаковы
  for I := 0 to cbEmplName.Items.Count - 1 do
    if Assigned(cbEmplName.Items.Objects[I]) then
      cbEmplName.Items.Objects[I].Free;
  inherited;
end;

procedure TChooseEmpl.FillEmployees;
var
  User: TrfUser;
  UserList: TList<TrfUser>;
begin
  Assert(FFrontBase <> nil, 'FrontBase not asigned');

  UserList := TList<TrfUser>.Create;
  try
    // Получим список пользователей фронта
    FFrontBase.GetWaiterList(UserList);
    for User in UserList do
    begin
      cbEmplName.AddItem(User.Name, User);
      cbResp.AddItem(User.Name, User);
    end;
    cbEmplName.ItemIndex := 0;
    cbResp.ItemIndex := 0;
  finally
    FreeAndNil(UserList);
  end;
end;

function TChooseEmpl.GetEmplkey: Integer;
begin
  Result := 0;
  // Если выбран объект-пользователь
  if (cbEmplName.ItemIndex > -1)
    and Assigned(cbEmplName.Items.Objects[cbEmplName.ItemIndex])
    and (cbEmplName.Items.Objects[cbEmplName.ItemIndex] is TrfUser) then
  begin
    Result := TrfUser(cbEmplName.Items.Objects[cbEmplName.ItemIndex]).ID;
  end;
end;

function TChooseEmpl.GetRespKey: Integer;
begin
  Result := 0;
  // Если выбран объект-пользователь
  if (cbResp.ItemIndex > -1)
    and Assigned(cbResp.Items.Objects[cbResp.ItemIndex])
    and (cbResp.Items.Objects[cbResp.ItemIndex] is TrfUser) then
  begin
    Result := TrfUser(cbResp.Items.Objects[cbResp.ItemIndex]).ID;
  end;
end;

end.
