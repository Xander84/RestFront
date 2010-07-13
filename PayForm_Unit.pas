unit PayForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Front_DataBase_Unit, kbmMemTable, Contnrs, DB, ExtCtrls,
  StdCtrls, ActnList, FrontData_Unit, AdvPanel, AdvSmoothToggleButton, AdvStyleIF,
  AdvSmoothButton;

type
  TPayForm = class(TForm)
    pnlBottom: TAdvPanel;
    pnlMain: TAdvPanel;
    pnlRight: TAdvPanel;
    actMain: TActionList;
    actOK: TAction;
    btnOK: TAdvSmoothButton;
    btnCancel: TAdvSmoothButton;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure actOKUpdate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    FFrontBase: TFrontBase;
    FPayFormDataSet: TkbmMemTable;
    //
    FLastLeftButton          : Integer;
    FLastTopButton           : Integer;
    FPayFormButtonNumber: Integer;
    //
    FButtonList : TObjectList;
    FIsPlCard: Integer;
    FPayType: Integer;
    //
    FIsChecked: Boolean;

    procedure CreatePayFormButtonList;
    procedure AddPayFormButton;

    procedure PayFormButtonOnClick(Sender: TObject);
  public
    constructor CreateWithFrontBase(AOwner: TComponent; FBase: TFrontBase);
    //наличные безналичные
    property PayType: Integer read FPayType write FPayType;
    //пластиковая карта или нет
    property IsPlCard: Integer read FIsPlCard write FIsPLCard;
    property PayFormDataSet: TkbmMemTable read FPayFormDataSet;
  end;

var
  PayForm: TPayForm;

implementation

{$R *.dfm}

{ TPayForm }

procedure TPayForm.AddPayFormButton;
var
  FButton: TAdvSmoothToggleButton;
begin
  //Создание кнопки
  FButton := TAdvSmoothToggleButton.Create(nil);
//  FButton.AllowAllUp := True;
  FButton.Parent := pnlMain;
  FButton.OnClick := PayFormButtonOnClick;
  FButton.Name := Format('btnPayForm%d', [FPayFormButtonNumber]);
  FButton.GroupIndex := 1;
  //FPayFormButtonNumber;
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

  FButton.Tag := FPayFormDataSet.FieldByName('USR$PAYTYPEKEY').AsInteger;
  FButton.Caption := FPayFormDataSet.FieldByName('USR$NAME').AsString;

  FLastLeftButton := FLastLeftButton + 145 + 10;

  FButtonList.Add(FButton);
  Inc(FPayFormButtonNumber);
end;

procedure TPayForm.CreatePayFormButtonList;
begin
  FPayFormDataSet.First;
  while not FPayFormDataSet.Eof do
  begin
    AddPayFormButton;

    FPayFormDataSet.Next;
  end;
end;

constructor TPayForm.CreateWithFrontBase(AOwner: TComponent;
  FBase: TFrontBase);
begin
  inherited Create(AOwner);
  FFrontBase := FBase;

  FLastLeftButton := 8;
  FLastTopButton  := 8;
  FPayFormButtonNumber := 1;

  FPayType := -1;
  FIsPlCard := 0;

  FPayFormDataSet := TkbmMemTable.Create(nil);
  FPayFormDataSet.FieldDefs.Add('USR$NAME', ftString, 60);
  FPayFormDataSet.FieldDefs.Add('USR$PAYTYPEKEY', ftInteger, 0);
  FPayFormDataSet.FieldDefs.Add('USR$NOFISCAL', ftInteger, 0);
  FPayFormDataSet.CreateTable;
  FPayFormDataSet.Open;

  FButtonList := TObjectList.Create;
end;

procedure TPayForm.FormShow(Sender: TObject);
begin
  if Assigned(FFrontBase) then
    if FFrontBase.GetPayKindType(FPayFormDataSet, FPayType, FIsPlCard) then
      CreatePayFormButtonList;
end;

procedure TPayForm.PayFormButtonOnClick(Sender: TObject);
begin
  if TAdvSmoothToggleButton(Sender).Down then
  begin
    FPayFormDataSet.Locate('USR$PAYTYPEKEY', TAdvSmoothToggleButton(Sender).Tag, []);
    FIsChecked := True;
  end else
    FIsChecked := False;  
end;

procedure TPayForm.FormDestroy(Sender: TObject);
begin
  FButtonList.Free;
  FPayFormDataSet.Free;
end;

procedure TPayForm.actOKExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TPayForm.actOKUpdate(Sender: TObject);
begin
  actOK.Enabled := FIsChecked;
end;

procedure TPayForm.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
