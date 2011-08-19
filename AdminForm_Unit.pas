unit AdminForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Front_DataBase_Unit, BaseFrontForm_Unit, FrontData_Unit, ExtCtrls,
  AdvPanel, AdvSmoothButton, ActnList, AddUserForm_unit, EditReportForm_Unit,
  frmEditUsers_unit;

type
  TCrackControl = class(TControl);

  TAdminForm = class(TBaseFrontForm)
    pnlMain: TAdvPanel;
    alMain: TActionList;
    actAddUser: TAction;
    btnExit: TAdvSmoothButton;
    btnEditReport: TAdvSmoothButton;
    actEditReport: TAction;
    btnHallsEdit: TAdvSmoothButton;
    btnEditUser: TAdvSmoothButton;
    actEditUser: TAction;
    actExit: TAction;
    procedure actAddUserExecute(Sender: TObject);
    procedure actEditReportExecute(Sender: TObject);
    procedure actEditUserExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure alMainExecute(Action: TBasicAction; var Handled: Boolean);
  private
    FFrontBase: TFrontBase;
  public
    property FrontBase: TFrontBase read FFrontBase write FFrontBase;
  end;

var
  AdminForm: TAdminForm;

implementation

{$R *.dfm}

procedure TAdminForm.actAddUserExecute(Sender: TObject);
var
  FForm: TAddUserForm;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');
  FForm := TAddUserForm.Create(Self);
  try
    FForm.FrontBase := FFrontBase;
    FForm.ShowModal;
  finally
    FForm.Free;
  end;
end;

procedure TAdminForm.actEditReportExecute(Sender: TObject);
var
  Form: TEditReport;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');
  Form := TEditReport.Create(nil);
  try
    Form.FrontBase := FFrontBase;
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure TAdminForm.actEditUserExecute(Sender: TObject);
var
  Form: TEditUsers;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');
  Form := TEditUsers.Create(nil);
  try
    Form.FrontBase := FFrontBase;
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure TAdminForm.actExitExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TAdminForm.alMainExecute(Action: TBasicAction; var Handled: Boolean);
var
  FComponent: TControl;
begin
  inherited;
  if Action.ActionComponent is TControl then
  begin
    FComponent := TControl(Action.ActionComponent);
    if Assigned(FLogManager) then
    begin
      FLogManager.DoActionLog(FLogManager.GetCurrentUserInfo,
        Format('Форма %s (%s), событие %s (%s)', [Self.Caption,
        Self.Name, TCrackControl(FComponent).Caption, FComponent.Name]));
    end;
  end;
end;

end.
