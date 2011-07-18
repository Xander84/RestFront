unit AddUserForm_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrontForm_Unit, FrontData_Unit, StdCtrls, ExtCtrls, AdvPanel,
  Front_DataBase_Unit, kbmMemTable, DB, DBCtrls, AdvSmoothButton, Mask, ActnList,
  Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, AdvSmoothTouchKeyBoard,
  Generics.Collections;

type
  TAddUserForm = class(TBaseFrontForm)
    pnlMain: TAdvPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DepartmentTable: TkbmMemTable;
    dsDepartment: TDataSource;
    dsMain: TDataSource;
    MainTable: TkbmMemTable;
    pnlRight: TAdvPanel;
    btnOK: TAdvSmoothButton;
    btnCancel: TAdvSmoothButton;
    dbeSurName: TDBEdit;
    dbeFirstName: TDBEdit;
    dbeMiddleName: TDBEdit;
    Label5: TLabel;
    dbePASSW: TDBEdit;
    Label6: TLabel;
    edConfirmPass: TEdit;
    alMain: TActionList;
    actAddUser: TAction;
    dbrgMain: TDBAdvGrid;
    UserGroupTable: TkbmMemTable;
    dsUserGroup: TDataSource;
    UserGroupTableID: TIntegerField;
    UserGroupTableUSRNAME: TStringField;
    UserGroupTableCHECKED: TIntegerField;
    AdvTouchKeyBoard: TAdvSmoothTouchKeyBoard;
    cbDisabled: TDBCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actAddUserExecute(Sender: TObject);
    procedure actAddUserUpdate(Sender: TObject);
    procedure dbePASSWKeyPress(Sender: TObject; var Key: Char);
    procedure edConfirmPassKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
  private
    FInsertMode: Boolean;
    FUserKey: Integer;
    FGroupList: TList<Integer>;
  public
    property InsertMode: Boolean read FInsertMode write FInsertMode;
    property UserKey: Integer read FUserKey write FUserKey;
  end;

var
  AddUserForm: TAddUserForm;

implementation

uses
  rfUtils_unit, TouchMessageBoxForm_Unit;

{$R *.dfm}

procedure TAddUserForm.actAddUserExecute(Sender: TObject);
var
  FValidGroup: Boolean;
begin
  FValidGroup := False;
  UserGroupTable.First;
  while not UserGroupTable.Eof do
  begin
    if UserGroupTable.FieldByName('CHECKED').AsInteger = 1 then
    begin
      FValidGroup := True;
      Break;
    end;
    UserGroupTable.Next
  end;
  if not FValidGroup then
  begin
    Touch_MessageBox('Внимание', 'Нужно указать группу пользователя', MB_OK, mtWarning);
    exit;
  end;
  if not FInsertMode then
  begin
    if FFrontBase.AddUser(MainTable, UserGroupTable) then
      ModalResult := mrOk;
  end else
  if FInsertMode then
  begin
    if FFrontBase.UpdateUser(MainTable, UserGroupTable, FUserKey, FGroupList) then
      ModalResult := mrOk;
  end;
end;

procedure TAddUserForm.actAddUserUpdate(Sender: TObject);
begin
  actAddUser.Enabled := (not MainTable.FieldByName('SURNAME').IsNull)
    and (not MainTable.FieldByName('PASSW').IsNull)
    and (MainTable.FieldByName('PASSW').AsString = edConfirmPass.Text);
end;

procedure TAddUserForm.dbePASSWKeyPress(Sender: TObject; var Key: Char);
begin
  RemoveWrongPassChar(Key);
  inherited;
end;

procedure TAddUserForm.edConfirmPassKeyPress(Sender: TObject; var Key: Char);
begin
  RemoveWrongPassChar(Key);
  inherited;
end;

procedure TAddUserForm.FormCreate(Sender: TObject);
begin
  FInsertMode := False;
  FUserKey := -1;

  DepartmentTable.FieldDefs.Add('ID', ftInteger, 0);
  DepartmentTable.FieldDefs.Add('USR$NAME', ftString, 60);
  DepartmentTable.CreateTable;
  DepartmentTable.Open;

  MainTable.FieldDefs.Add('ID', ftInteger, 0);
  MainTable.FieldDefs.Add('FIRSTNAME', ftString, 20);
  MainTable.FieldDefs.Add('SURNAME', ftString, 20);
  MainTable.FieldDefs.Add('MIDDLENAME', ftString, 20);
  MainTable.FieldDefs.Add('ibname', ftString, 8);
  MainTable.FieldDefs.Add('ibpassword', ftString, 8);
  MainTable.FieldDefs.Add('PASSW', ftString, 20);
  MainTable.FieldDefs.Add('DISABLED', ftBoolean, 0);
  MainTable.CreateTable;
  MainTable.Open;

  cbDisabled.Checked := False;

  FGroupList := TList<Integer>.Create;

  SetupAdvGrid(dbrgMain);
end;

procedure TAddUserForm.FormDestroy(Sender: TObject);
begin
  FGroupList.Free;
  inherited;
end;

procedure TAddUserForm.FormShow(Sender: TObject);
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');
  FFrontBase.GetDepartmentList(DepartmentTable);
  FFrontBase.GetUserGroupList(UserGroupTable);
  UserGroupTable.First;
  if FInsertMode then
  begin
    FFrontBase.GetEditUserInfo(MainTable, UserGroupTable, FUserKey, FGroupList);
    edConfirmPass.Text := MainTable.FieldByName('PASSW').AsString;
    UserGroupTable.First;
  end;
end;

end.
