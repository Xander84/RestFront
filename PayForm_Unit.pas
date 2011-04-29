unit PayForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Front_DataBase_Unit, kbmMemTable, Contnrs, DB, ExtCtrls,
  StdCtrls, ActnList, FrontData_Unit, AdvPanel, AdvSmoothToggleButton, AdvStyleIF,
  AdvSmoothButton, BaseFrontForm_Unit;

const
  btnHeight = 51;
  btnWidth = 145;

type
  TPayForm = class(TBaseFrontForm)
    pnlMain: TAdvPanel;
    pnlRight: TAdvPanel;
    actMain: TActionList;
    actOK: TAction;
    btnCancel: TAdvSmoothButton;
    btnOK: TAdvSmoothButton;
    btnScrollDown: TAdvSmoothButton;
    btnScrollUp: TAdvSmoothButton;
    actPayUp: TAction;
    actPayDown: TAction;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure actOKUpdate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure actPayUpExecute(Sender: TObject);
    procedure actPayUpUpdate(Sender: TObject);
    procedure actPayDownExecute(Sender: TObject);
    procedure actPayDownUpdate(Sender: TObject);
  private
    FFrontBase: TFrontBase;
    FPayFormDataSet: TkbmMemTable;
    //
    FFirstTopButton          : Integer;
    FLastLeftButton          : Integer;
    FLastTopButton           : Integer;
    FPayFormButtonNumber     : Integer;
    //
    FButtonList : TObjectList;
    FIsPlCard: Integer;
    FPayType: Integer;
    //
    FIsChecked: Boolean;

    procedure CreatePayFormButtonList;
    procedure AddPayFormButton;

    procedure PayFormButtonOnClick(Sender: TObject);
    procedure ScrollControl(const FControl: TWinControl; const Down: Boolean;
      var Top: Integer; var Bottom: Integer);
  public
    constructor CreateWithFrontBase(AOwner: TComponent; FBase: TFrontBase);
    //наличные безналичные
    property PayType: Integer read FPayType write FPayType;
    //пластиковая карта или нет
    property IsPlCard: Integer read FIsPlCard write FIsPlCard;
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
  FButton.Appearance.Font.Name := cn_FontType;
  FButton.Appearance.Font.Size := cn_ButtonFontSize;
  FButton.SetComponentStyle(tsOffice2007Silver);

  //проверяем, есть ли ещё место в ряду
  if (FLastLeftButton + btnWidth) > pnlMain.Width then
  begin
    FLastTopButton := FLastTopButton + btnHeight + 8;
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

  FLastLeftButton := FLastLeftButton + btnWidth + 10;

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

  FFirstTopButton := 8;
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

  btnScrollUp.Picture := FrontData.RestPictureContainer.FindPicture('Up');
  btnScrollDown.Picture := FrontData.RestPictureContainer.FindPicture('Down');
end;

procedure TPayForm.FormShow(Sender: TObject);
begin
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

procedure TPayForm.ScrollControl(const FControl: TWinControl;
  const Down: Boolean; var Top, Bottom: Integer);
var
  Step: Integer;
begin
  Step := 0;
  if Down then
  begin
    while (Step < btnHeight + 8) and (Bottom + btnHeight > FControl.Height) do
    begin
      FControl.ScrollBy(0, -1);

      Dec(Bottom);
      Inc(Top);
      Inc(Step);
    end;
  end else
  begin
    while (Step < btnHeight + 8) and (Top > 8) do
    begin
      FControl.ScrollBy(0, 1);

      Inc(Bottom);
      Dec(Top);
      Inc(Step);
    end;
  end;
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

procedure TPayForm.actPayDownExecute(Sender: TObject);
begin
  LockWindowUpdate(Self.Handle);
  try
    ScrollControl(pnlMain, True, FFirstTopButton, FLastTopButton);
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TPayForm.actPayDownUpdate(Sender: TObject);
begin
  actPayDown.Enabled := (FLastTopButton + btnHeight > pnlMain.Height);
end;

procedure TPayForm.actPayUpExecute(Sender: TObject);
begin
  LockWindowUpdate(Self.Handle);
  try
    ScrollControl(pnlMain, False, FFirstTopButton, FLastTopButton);
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TPayForm.actPayUpUpdate(Sender: TObject);
begin
  actPayUp.Enabled := (FFirstTopButton > 8);
end;

procedure TPayForm.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
