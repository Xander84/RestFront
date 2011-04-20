unit rfChooseForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvPanel, Front_DataBase_Unit, FrontData_Unit, BaseFrontForm_Unit,
  AdvSmoothButton, ExtCtrls, StdCtrls, ActnList;

type
  TChooseForm = class(TBaseFrontForm)
    pnlBottom: TAdvPanel;
    btnOK: TAdvSmoothButton;
    btnCancel: TAdvSmoothButton;
    pnlMain: TAdvPanel;
    cbChoose: TComboBox;
    alMain: TActionList;
    actOK: TAction;
    lblName: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actOKUpdate(Sender: TObject);
  private
    FSQLText: String;
    FKeyField: String;
    FListField: String;
    FNeedResult: Boolean;
    function GetID: Integer;
    procedure SetChooseName(const Value: String);
  public
    property SQLText: String read FSQLText write FSQLText;
    property KeyField: String read FKeyField write FKeyField;
    property ListField: String read FListField write FListField;
    property NeedResult: Boolean read FNeedResult write FNeedResult;
    property ID: Integer read GetID;
    property ChooseName: String write SetChooseName;
  end;

var
  ChooseForm: TChooseForm;

implementation

uses
  IBSQL;

{$R *.dfm}

procedure TChooseForm.actOKUpdate(Sender: TObject);
begin
  if FNeedResult then
  begin
    if cbChoose.Items.Count = 0 then
      actOK.Enabled := True
    else
      actOK.Enabled := (cbChoose.ItemIndex > -1);
  end else
    actOK.Enabled := True;
end;

procedure TChooseForm.FormCreate(Sender: TObject);
begin
  inherited;
  btnOK.Picture := FrontData.RestPictureContainer.FindPicture('tick');
  btnCancel.Picture := FrontData.RestPictureContainer.FindPicture('cross');
  FKeyField := 'ID';
  FNeedResult := False;
end;

procedure TChooseForm.FormShow(Sender: TObject);
var
  FSQL: TIBSQL;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');
  FSQL := TIBSQL.Create(nil);
  try
    FSQL.Transaction := FFrontBase.ReadTransaction;
    FSQL.SQL.Text := FSQLText;
    FSQL.ExecQuery;
    while not FSQL.Eof do
    begin
      cbChoose.AddItem(FSQL.FieldByName(FListField).AsString,
        TObject(FSQL.FieldByName(FKeyField).AsInteger));

      FSQL.Next;
    end;
    FSQL.Close;
  finally
    FSQL.Free;
  end;
end;

function TChooseForm.GetID: Integer;
begin
  if cbChoose.ItemIndex > -1 then
    Result := Integer(cbChoose.Items.Objects[cbChoose.ItemIndex])
  else
    Result := -1;
end;

procedure TChooseForm.SetChooseName(const Value: String);
begin
  Caption := Value;
  lblName.Caption := Value + ':';
end;

end.
