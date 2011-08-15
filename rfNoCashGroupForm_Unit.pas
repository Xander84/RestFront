unit rfNoCashGroupForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Front_DataBase_Unit, FrontData_Unit, BaseFrontForm_Unit, ExtCtrls,
  AdvPanel, AdvSmoothButton, ActnList, kbmMemTable, DB, Contnrs,
  AdvSmoothToggleButton, AdvStyleIF;

type
  TrfNoCashGroup = class(TBaseFrontForm)
    pnlBottom: TAdvPanel;
    pnlRight: TAdvPanel;
    pnlMain: TAdvPanel;
    btnExit: TAdvSmoothButton;
    aclPayGroup: TActionList;
    actGroupUp: TAction;
    actGroupDown: TAction;
    btnScrollDown: TAdvSmoothButton;
    btnScrollUp: TAdvSmoothButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actGroupUpExecute(Sender: TObject);
    procedure actGroupUpUpdate(Sender: TObject);
    procedure actGroupDownExecute(Sender: TObject);
    procedure actGroupDownUpdate(Sender: TObject);
  private
    FMemTable: TkbmMemTable;

    //
    FFirstTopButton          : Integer;
    FLastLeftButton          : Integer;
    FLastTopButton           : Integer;
    FGroupButtonNumber: Integer;
    //
    FButtonList : TObjectList;
    FNoFiscal: Integer;
    FPayTypeKey: Integer;
    FCurrentPayName: String;
    FExternalPay: Boolean;

    procedure AddButton;
    procedure ScrollControl(const FControl: TWinControl; const Down: Boolean;
      var Top: Integer; var Bottom: Integer);
    procedure PayFormButtonOnClick(Sender: TObject);
  public
    property PayTypeKey: Integer read FPayTypeKey write FPayTypeKey;
    property CurrentPayName: String read FCurrentPayName write FCurrentPayName;
    property NoFiscal: Integer read FNoFiscal write FNoFiscal;
    property ExternalPay: Boolean read FExternalPay write FExternalPay;
  end;

const
  btnHeight = 51;
  btnWidth = 145;

var
  rfNoCashGroup: TrfNoCashGroup;

implementation

uses
  PayForm_Unit;

{$R *.dfm}

procedure TrfNoCashGroup.actGroupDownExecute(Sender: TObject);
begin
  LockWindowUpdate(Self.Handle);
  try
    ScrollControl(pnlMain, True, FFirstTopButton, FLastTopButton);
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TrfNoCashGroup.actGroupDownUpdate(Sender: TObject);
begin
  actGroupDown.Enabled := (FLastTopButton + btnHeight > pnlMain.Height);
end;

procedure TrfNoCashGroup.actGroupUpExecute(Sender: TObject);
begin
  LockWindowUpdate(Self.Handle);
  try
    ScrollControl(pnlMain, False, FFirstTopButton, FLastTopButton);
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TrfNoCashGroup.actGroupUpUpdate(Sender: TObject);
begin
  actGroupUp.Enabled := (FFirstTopButton > 8);
end;

procedure TrfNoCashGroup.AddButton;
var
  FButton: TAdvSmoothToggleButton;
begin
  //Создание кнопки
  FButton := TAdvSmoothToggleButton.Create(nil);
//  FButton.AllowAllUp := True;
  FButton.Parent := pnlMain;
  FButton.OnClick := PayFormButtonOnClick;
  FButton.Name := Format('btnPayForm%d', [FGroupButtonNumber]);
  FButton.GroupIndex := 1;
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

  FButton.Tag := FMemTable.FieldByName('ID').AsInteger;
  FButton.Caption := FMemTable.FieldByName('NAME').AsString;

  FLastLeftButton := FLastLeftButton + btnWidth + 10;

  FButtonList.Add(FButton);
  Inc(FGroupButtonNumber);

end;

procedure TrfNoCashGroup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FMemTable.Free;
  FButtonList.Free;
end;

procedure TrfNoCashGroup.FormCreate(Sender: TObject);
begin
  FFirstTopButton := 8;
  FLastLeftButton := 8;
  FLastTopButton  := 8;

  FButtonList := TObjectList.Create;

  FMemTable := TkbmMemTable.Create(nil);
  FMemTable.FieldDefs.Add('ID', ftInteger, 0);
  FMemTable.FieldDefs.Add('NAME', ftString, 60);
  FMemTable.CreateTable;
  FMemTable.Open;

  btnScrollUp.Picture := FrontData.RestPictureContainer.FindPicture('Up');
  btnScrollDown.Picture := FrontData.RestPictureContainer.FindPicture('Down');
end;

procedure TrfNoCashGroup.FormShow(Sender: TObject);
begin
  // должны отобразить виды безнальной оплаты
  // исходя из групп
  FExternalPay := False;
  FFrontBase.GetNoCashGroupList(FMemTable);
  FMemTable.First;
  while not FMemTable.Eof do
  begin
    AddButton;

    FMemTable.Next;
  end;
end;

procedure TrfNoCashGroup.PayFormButtonOnClick(Sender: TObject);
var
  FForm: TPayForm;
begin
  FForm := TPayForm.CreateWithFrontBase(nil, FFrontBase);
  FForm.PayType := TAdvSmoothToggleButton(Sender).Tag;
  FForm.IsPlCard := 0;
  ExternalPay := FFrontBase.CheckExternalPay(TAdvSmoothToggleButton(Sender).Tag);
  try
    if FFrontBase.GetPayKindType(FForm.PayFormDataSet,
      FForm.PayType, FForm.IsPlCard, ExternalPay) then
    begin
      if FForm.PayFormDataSet.RecordCount > 0 then
      begin
        if (FForm.PayFormDataSet.RecordCount = 1) and (not ExternalPay) then
        begin
          FPayTypeKey := FForm.PayFormDataSet.FieldByName('USR$PAYTYPEKEY').AsInteger;
          FCurrentPayName := FForm.PayFormDataSet.FieldByName('USR$NAME').AsString;
          FNoFiscal := FForm.PayFormDataSet.FieldByName('USR$NOFISCAL').AsInteger;
          ModalResult := mrOK;
        end else
        begin
          FForm.ShowModal;
          if FForm.ModalResult = mrOK then
          begin
            FPayTypeKey := FForm.PayFormDataSet.FieldByName('USR$PAYTYPEKEY').AsInteger;
            FCurrentPayName := FForm.PayFormDataSet.FieldByName('USR$NAME').AsString;
            FNoFiscal := FForm.PayFormDataSet.FieldByName('USR$NOFISCAL').AsInteger;
            ModalResult := mrOK;
          end;
        end;
      end;
    end;
  finally
    FForm.Free;
  end;
end;

procedure TrfNoCashGroup.ScrollControl(const FControl: TWinControl;
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

end.
