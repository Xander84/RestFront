unit DeleteOrderLine_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, kbmMemTable, DB, Front_DataBase_Unit, Contnrs, StdCtrls,
  ExtCtrls, ActnList, FrontData_Unit, AdvSmoothButton, AdvPanel,
  AdvSmoothToggleButton, AdvStyleIF, BaseFrontForm_Unit;

type
  TDeleteOrderLine = class(TBaseFrontForm)
    pnlTop: TAdvPanel;
    pnlBottom: TAdvPanel;
    pnlMain: TAdvPanel;
    lblQuantityLabel: TLabel;
    lblQuantity: TLabel;
    alMain: TActionList;
    actOK: TAction;
    btnOK: TAdvSmoothButton;
    btnCancel: TAdvSmoothButton;
    btnAddQuantity: TAdvSmoothButton;
    btnRemoveQuantity: TAdvSmoothButton;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnAddQuantityClick(Sender: TObject);
    procedure btnRemoveQuantityClick(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure actOKUpdate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    DeleteCauseList: TkbmMemTable;
    FFrontBase: TFrontBase;
    FQuantity: Currency;
    FDeleteClauseID: Integer;

    //
    FLastLeftButton          : Integer;
    FLastTopButton           : Integer;
    FDeleteClauseButtonNumber: Integer;
    //
    FButtonList : TObjectList;


    procedure SetFrontBase(Value: TFrontBase);

    procedure CreateDeleteClauseButtonList;
    procedure AddDeleteClauseButton;

    function GetRemoveQuantity: Currency;

    procedure DeleteButtonOnClick(Sender: TObject);
  public
    property FrontBase: TFrontBase read FFrontBase write SetFrontBase;
    property Quantity: Currency read FQuantity write FQuantity;
    property RemoveQuantity: Currency read GetRemoveQuantity;
    property DeleteClauseID: Integer read FDeleteClauseID write FDeleteClauseID;
    constructor CreateWithFrontBase(AOwner: TComponent; FBase: TFrontBase);

  end;

var
  DeleteOrderLine: TDeleteOrderLine;

implementation


{$R *.dfm}

procedure TDeleteOrderLine.FormCreate(Sender: TObject);
begin
  DeleteCauseList := TkbmMemTable.Create(nil);
  DeleteCauseList.FieldDefs.Add('ID', ftInteger, 0);
  DeleteCauseList.FieldDefs.Add('NAME', ftString, 40);
  DeleteCauseList.CreateTable;
  DeleteCauseList.Open;

  if Assigned(FFrontBase) then
    if FFrontBase.GetCauseDeleteList(DeleteCauseList) then
      CreateDeleteClauseButtonList;

  btnAddQuantity.Picture := FrontData.RestPictureContainer.FindPicture('add');
  btnRemoveQuantity.Picture := FrontData.RestPictureContainer.FindPicture('delete');
  btnOK.Picture := FrontData.RestPictureContainer.FindPicture('tick');
  btnCancel.Picture := FrontData.RestPictureContainer.FindPicture('cross');
end;

procedure TDeleteOrderLine.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DeleteCauseList.Free;
  FButtonList.Free;
end;

procedure TDeleteOrderLine.SetFrontBase(Value: TFrontBase);
begin
  FFrontBase := Value;
end;

constructor TDeleteOrderLine.CreateWithFrontBase(AOwner: TComponent;
  FBase: TFrontBase);
begin
  inherited Create(AOwner);
  FrontBase := FBase;
  FQuantity := 0;

  FLastLeftButton := 8;
  FLastTopButton  := 8;
  FDeleteClauseButtonNumber := 1;
  FDeleteClauseID := -1;

  lblQuantity.Caption := '0';

  FButtonList := TObjectList.Create;
end;

procedure TDeleteOrderLine.AddDeleteClauseButton;
var
  FButton: TAdvSmoothToggleButton;
begin
  //Создание кнопки
  FButton := TAdvSmoothToggleButton.Create(nil);
//  FButton.AllowAllUp := True;
  FButton.Parent := pnlMain;
  FButton.OnClick := DeleteButtonOnClick;
  FButton.Name := Format('btnDelete%d', [FDeleteClauseButtonNumber]);
  FButton.GroupIndex := 1;
  FButton.Height := 51;
  FButton.Width  := 145;
  FButton.Appearance.Font.Name := cn_FontType;
  FButton.Appearance.Font.Size := cn_ButtonFontSize;
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

  FButton.Tag := DeleteCauseList.FieldByName('ID').AsInteger;
  FButton.Caption := DeleteCauseList.FieldByName('NAME').AsString;

  FLastLeftButton := FLastLeftButton + 145 + 10;


  FButtonList.Add(FButton);
  Inc(FDeleteClauseButtonNumber);
end;

procedure TDeleteOrderLine.CreateDeleteClauseButtonList;
begin
  DeleteCauseList.First;
  while not DeleteCauseList.Eof do
  begin
    AddDeleteClauseButton;

    DeleteCauseList.Next;
  end;
end;

procedure TDeleteOrderLine.btnAddQuantityClick(Sender: TObject);
var
  IncrementedQuantity: Currency;
begin
  IncrementedQuantity := StrToCurr(lblQuantity.Caption) + 1;
  if IncrementedQuantity < FQuantity then
    lblQuantity.Caption := CurrToStr(IncrementedQuantity)
  else
    lblQuantity.Caption := CurrToStr(FQuantity);
end;

procedure TDeleteOrderLine.btnRemoveQuantityClick(Sender: TObject);
var
  DecrementedQuantity: Currency;
begin
  DecrementedQuantity := StrToCurr(lblQuantity.Caption) - 1;
  if DecrementedQuantity > 0 then
    lblQuantity.Caption := CurrToStr(DecrementedQuantity)
  else
    lblQuantity.Caption := '0';
end;

function TDeleteOrderLine.GetRemoveQuantity: Currency;
begin
  Result := StrToCurr(lblQuantity.Caption);
end;

procedure TDeleteOrderLine.DeleteButtonOnClick(Sender: TObject);
begin
  if TAdvSmoothToggleButton(Sender).Down then
    DeleteClauseID := TAdvSmoothToggleButton(Sender).Tag
  else
    DeleteClauseID := -1;
end;

procedure TDeleteOrderLine.actOKExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TDeleteOrderLine.actOKUpdate(Sender: TObject);
begin
  actOK.Enabled := (DeleteClauseID <> -1);
end;

procedure TDeleteOrderLine.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
