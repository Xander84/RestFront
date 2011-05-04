unit frmEditUsers_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EditReportForm_Unit, DB, kbmMemTable, Grids, AdvObj, BaseGrid,
  AdvGrid, DBAdvGrid, AdvSmoothButton, ExtCtrls, AdvPanel, AddUserForm_unit;

type
  TEditUsers = class(TEditReport)
    btnAddUser: TAdvSmoothButton;
    procedure FormShow(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure DBGrLeftDblClick(Sender: TObject);
    procedure btnAddUserClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditUsers: TEditUsers;

implementation

{$R *.dfm}

procedure TEditUsers.btnAddUserClick(Sender: TObject);
var
  FForm: TAddUserForm;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');
  FForm := TAddUserForm.Create(Self);
  try
    FForm.FrontBase := FFrontBase;
    FForm.InsertMode := False;
    FForm.ShowModal;
    if FForm.ModalResult = mrOk then
    begin
      MemTable.DisableControls;
      try
        FFrontBase.GetAllUserList(MemTable);
        MemTable.First;
      finally
        MemTable.EnableControls;
      end;
    end;
  finally
    FForm.Free;
  end;
end;

procedure TEditUsers.btnEditClick(Sender: TObject);
var
  FForm: TAddUserForm;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');
  FForm := TAddUserForm.Create(Self);
  try
    FForm.FrontBase := FFrontBase;
    FForm.InsertMode := True;
    FForm.UserKey := MemTable.FieldByName('ID').AsInteger;
    FForm.ShowModal;
  finally
    FForm.Free;
  end;
end;

procedure TEditUsers.DBGrLeftDblClick(Sender: TObject);
var
  FForm: TAddUserForm;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');
  FForm := TAddUserForm.Create(Self);
  try
    FForm.FrontBase := FFrontBase;
    FForm.InsertMode := True;
    FForm.UserKey := MemTable.FieldByName('ID').AsInteger;
    FForm.ShowModal;
  finally
    FForm.Free;
  end;
end;

procedure TEditUsers.FormShow(Sender: TObject);
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  FFrontBase.GetAllUserList(MemTable);
  MemTable.First;
end;

end.
