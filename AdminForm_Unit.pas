unit AdminForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Front_DataBase_Unit, BaseFrontForm_Unit, FrontData_Unit, ExtCtrls,
  AdvPanel, AdvSmoothButton, ActnList, AddUserForm_unit, EditReportForm_Unit;

type
  TAdminForm = class(TBaseFrontForm)
    pnlMain: TAdvPanel;
    alMain: TActionList;
    actAddUser: TAction;
    btnExit: TAdvSmoothButton;
    btnAddUser: TAdvSmoothButton;
    btnEditReport: TAdvSmoothButton;
    actEditReport: TAction;
    btnHallsEdit: TAdvSmoothButton;
    procedure actAddUserExecute(Sender: TObject);
    procedure actEditReportExecute(Sender: TObject);
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

end.
