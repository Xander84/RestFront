unit Modification_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, kbmMemTable, DB, Front_DataBase_Unit, Contnrs,
  ActnList, AdvPanel, FrontData_Unit, AdvSmoothButton, AdvStyleIF,
  AdvSmoothToggleButton, BaseFrontForm_Unit;

type
  TModificationForm = class(TBaseFrontForm)
    pnlTop: TAdvPanel;
    Label1: TLabel;
    plnRight: TAdvPanel;
    pnlMain: TAdvPanel;
    aclModify: TActionList;
    actOK: TAction;
    actCancel: TAction;
    btnOK: TAdvSmoothButton;
    btnCancel: TAdvSmoothButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure actOKUpdate(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actCancelUpdate(Sender: TObject);
  private
    FModificationTable: TkbmMemTable;
    FLineModifyTable: TkbmMemTable;
    FFrontBase: TFrontBase;
    FGoodKey: Integer;
    FModifyGroupKey: Integer;
    FIsEmptyLine: Boolean;
    //
    FLastLeftButton          : Integer;
    FLastTopButton           : Integer;
    FModificationButtonNumber: Integer;
    //
    FButtonList : TObjectList;
    FGoodName: String;

    procedure SetFrontBase(Value: TFrontBase);

    procedure CreateModificationButtonList;
    procedure CheckModificationButtonList;
    procedure AddModificationButton;
    procedure SetLineModifyTable(const Value: TkbmMemTable);

    procedure ModifyButtonOnClick(Sender: TObject);
    procedure SetGoodName(const Value: String);
  public
    property FrontBase: TFrontBase read FFrontBase write SetFrontBase;
    //Если модификатор обязателен, то смотрим GoodKey
    property GoodKey: Integer read FGoodKey write FGoodKey;
    //Иначе MODIFYGROUPKEY
    property ModifyGroupKey: Integer read FModifyGroupKey write FModifyGroupKey;
    //
    property LineModifyTable: TkbmMemTable read FLineModifyTable write SetLineModifyTable;
    property GoodName: String read FGoodName write SetGoodName;

    constructor CreateWithFrontBase(AOwner: TComponent; FBase: TFrontBase);

  end;

var
  ModificationForm: TModificationForm;

implementation

{$R *.dfm}

{ TModificationForm }

constructor TModificationForm.CreateWithFrontBase(AOwner: TComponent;
  FBase: TFrontBase);
begin
  inherited Create(AOwner);
  FrontBase := FBase;

  FLastLeftButton := 8;
  FLastTopButton  := 8;
  FModificationButtonNumber := 1;

  FModificationTable := TkbmMemTable.Create(nil);
  FModificationTable.FieldDefs.Add('ID', ftInteger, 0);
  FModificationTable.FieldDefs.Add('NAME', ftString, 40);
  FModificationTable.CreateTable;
  FModificationTable.Open;

  FGoodKey := -1;
  FModifyGroupKey := -1;
  FIsEmptyLine := True;

  FButtonList := TObjectList.Create;
end;

procedure TModificationForm.SetFrontBase(Value: TFrontBase);
begin
  FFrontBase := Value;
end;

procedure TModificationForm.SetGoodName(const Value: String);
begin
  FGoodName := Value;
  Label1.Caption := 'Модификаторы для: ' + FGoodName;
end;

procedure TModificationForm.AddModificationButton;
var
  FButton: TAdvSmoothToggleButton;
begin
  //Создание кнопки
  FButton := TAdvSmoothToggleButton.Create(Self);
//  FButton.AllowAllUp := True;
  FButton.Parent := pnlMain;
  FButton.OnClick := ModifyButtonOnClick;
  FButton.Name := Format('btnModification%d', [FModificationButtonNumber]);
  FButton.GroupIndex := FModificationButtonNumber;
  FButton.Height := 51;
  FButton.Width  := 145;
  FButton.Appearance.Font.Name := 'Times New Roman';
  FButton.Appearance.Font.Size := 12;
  FButton.SetComponentStyle(tsOffice2007Silver);

  //проверяем, есть ли ещё место в ряду
  if (FLastLeftButton + 145) > pnlMain.Width then
  begin
    FLastTopButton := FLastTopButton + 51 + 8;
    FLastLeftButton := 8;

    FButton.Left := FLastLeftButton;
    FButton.Top  := FLastTopButton;
  end else
  begin
    FButton.Left := FLastLeftButton;
    FButton.Top  := FLastTopButton;
  end;

  FButton.Tag := FModificationTable.FieldByName('ID').AsInteger;
  FButton.Caption := FModificationTable.FieldByName('NAME').AsString;

  FLastLeftButton := FLastLeftButton + 145 + 10;

  FButtonList.Add(FButton);
  Inc(FModificationButtonNumber);
end;

procedure TModificationForm.CreateModificationButtonList;
begin
  FModificationTable.First;
  while not FModificationTable.Eof do
  begin
    AddModificationButton;

    FModificationTable.Next;
  end;
end;

procedure TModificationForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FModificationTable.Free;
  FButtonList.Free;
end;

procedure TModificationForm.FormShow(Sender: TObject);
begin
  Assert(FLineModifyTable <> nil, 'LineModifyTable not assigned');

  if Assigned(FFrontBase) then
    if FrontBase.GetModificationList(FModificationTable, GoodKey, ModifyGroupKey) then
    begin
      CreateModificationButtonList;
      CheckModificationButtonList;
    end;
end;

procedure TModificationForm.SetLineModifyTable(const Value: TkbmMemTable);
begin
  FLineModifyTable := Value;
  try
    FLineModifyTable.StartTransaction;
  except
    raise;
  end;
  FIsEmptyLine := FLineModifyTable.IsEmpty;
end;

procedure TModificationForm.ModifyButtonOnClick(Sender: TObject);
begin
  if TAdvSmoothToggleButton(Sender).Down then
  begin
    if FModificationTable.Locate('ID', TAdvSmoothToggleButton(Sender).Tag, []) then
    begin
      FLineModifyTable.Append;
      FLineModifyTable.FieldByName('MODIFYKEY').AsInteger := FModificationTable.FieldByName('ID').AsInteger;
      FLineModifyTable.FieldByName('NAME').AsString := FModificationTable.FieldByName('NAME').AsString;
      FLineModifyTable.Post;
    end;
  end else
  begin
    if FLineModifyTable.Locate('MODIFYKEY', TAdvSmoothToggleButton(Sender).Tag, []) then
      FLineModifyTable.Delete;
  end;
end;

procedure TModificationForm.actOKExecute(Sender: TObject);
begin
  try
    FLineModifyTable.Commit;
  except
    Raise;
  end;
  ModalResult := mrOk;
end;

procedure TModificationForm.actOKUpdate(Sender: TObject);
begin
  if GoodKey <> -1 then
  begin
    actOK.Enabled := not FLineModifyTable.IsEmpty;
  end else
    actOK.Enabled := True;
end;

procedure TModificationForm.actCancelExecute(Sender: TObject);
begin
  if FIsEmptyLine then
  begin
    FLineModifyTable.First;
    while not FLineModifyTable.Eof do
      FLineModifyTable.Delete;
  end;
  try
    FLineModifyTable.Rollback;
  except
    Raise;
  end;

  ModalResult := mrCancel;
end;

procedure TModificationForm.actCancelUpdate(Sender: TObject);
begin
  actCancel.Enabled := not (GoodKey <> -1);
end;

procedure TModificationForm.CheckModificationButtonList;
var
  I: Integer;
begin
  //проставить нужные кнопки
  FLineModifyTable.First;
  while not FLineModifyTable.Eof do
  begin
    for I := 0 to ComponentCount - 1 do
    begin
      if (Components[I] is TAdvSmoothToggleButton) then
        if TAdvSmoothToggleButton(Components[I]).Tag = FLineModifyTable.FieldByName('MODIFYKEY').AsInteger then
          TAdvSmoothToggleButton(Components[I]).Down := True;
    end;
    FLineModifyTable.Next;
  end;
end;

end.
