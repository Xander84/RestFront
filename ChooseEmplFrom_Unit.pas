unit ChooseEmplFrom_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, AdvPanel, Front_DataBase_Unit,
  FrontData_Unit, BaseFrontForm_Unit, IBSQL, AdvSmoothButton;

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
  private
    function GetEmplkey: Integer;
    function GetRespKey: Integer;
    { Private declarations }
  public
    procedure FillEmployees;
    property RespKey: Integer read GetRespKey;
    property EmplKey: Integer read GetEmplkey;
  end;

var
  ChooseEmpl: TChooseEmpl;

implementation

{$R *.dfm}

{ TChooseEmpl }

procedure TChooseEmpl.FillEmployees;
var
  FSQL: TIBSQL;
begin
  Assert(FFrontBase <> nil, 'FrontBase not asigned');

  FSQL := TIBSQL.Create(nil);
  try
    cbEmplName.Items.NameValueSeparator := '=';
    FSQL.Transaction := FFrontBase.ReadTransaction;
    FSQL.SQL.Text :=
      ' select    ' +
      '   distinct  ' +
      '   u.contactkey,    ' +
      '   con.name as fullname ' +
      ' from    ' +
      '   gd_user u    ' +
      '   join gd_contact con on con.id = u.contactkey    ' +
      ' where  ' +
      '   u.disabled <> 1    ' +
      '   and u.usr$mn_isfrontuser = 1 ';
    FSQL.ExecQuery;
    while not FSQL.Eof do
    begin
//      cbEmplName.AddItem(FSQL.FieldByName('fullname').AsString + '=' +
//        FSQL.FieldByName('contactkey').AsString, nil);

      cbEmplName.AddItem(FSQL.FieldByName('fullname').AsString,
        TObject(FSQL.FieldByName('contactkey').AsInteger));


      cbResp.AddItem(FSQL.FieldByName('fullname').AsString,
        TObject(FSQL.FieldByName('contactkey').AsInteger));
//      cbResp.AddItem(FSQL.FieldByName('fullname').AsString + '=' +
//        FSQL.FieldByName('contactkey').AsString, nil);


      FSQL.Next;
    end;
    cbEmplName.ItemIndex := 0;
    cbResp.ItemIndex := 0;

    FSQL.Close;
  finally
    FSQL.Free;
  end;
end;

function TChooseEmpl.GetEmplkey: Integer;
begin
  Result := 0;
  if cbEmplName.Items.Count > 0 then
    Result := Integer(cbEmplName.Items.Objects[cbEmplName.ItemIndex]);
end;

function TChooseEmpl.GetRespKey: Integer;
begin
  Result := 0;
  if cbResp.Items.Count > 0 then
    Result := Integer(cbResp.Items.Objects[cbResp.ItemIndex]);
end;

end.
