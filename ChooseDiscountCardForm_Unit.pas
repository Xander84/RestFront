unit ChooseDiscountCardForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, kbmMemTable, Front_DataBase_Unit, DB, FrontData_Unit,
  ExtCtrls, AdvPanel, AdvSmoothButton, BaseFrontForm_Unit;

type
  TChooseDiscountCard = class(TBaseFrontForm)
    pnlMain: TAdvPanel;
    Label1: TLabel;
    usrg_lblCardCode: TEdit;
    Label2: TLabel;
    usrg_lblCustomer: TLabel;
    Label3: TLabel;
    usrg_lblPersDiscount: TLabel;
    Label4: TLabel;
    usrg_lbBonusSum: TLabel;
    Label5: TLabel;
    usrg_lbBonusPay: TLabel;
    btnChooseBonus: TAdvSmoothButton;
    btnCancel: TAdvSmoothButton;
    btnOK: TAdvSmoothButton;
    btnDelete: TAdvSmoothButton;
    Bevel1: TBevel;
    procedure btnChooseBonusClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure usrg_lblCardCodeKeyPress(Sender: TObject; var Key: Char);
  private
    FFrontBase: TFrontBase;
    FHeaderTable: TkbmMemTable;
    FDataTable: TkbmMemTable;

    FCardid: Integer;
    FDiskid: Integer;
    FUserID: Integer;
    { Private declarations }
  public
    property FrontBase: TFrontBase read FFrontBase write FFrontBase;
    property HeaderTable: TkbmMemTable read FHeaderTable write FHeaderTable;
    property Cardid: Integer read FCardid write FCardid;
    property UserID: Integer read FUserID write FUserID;
    property Diskid: Integer read FDiskid write FDiskid;
  end;

var
  ChooseDiscountCard: TChooseDiscountCard;

implementation

uses
  DevideForm_Unit, TouchMessageBoxForm_Unit;

{$R *.dfm}

procedure TChooseDiscountCard.btnChooseBonusClick(Sender: TObject);
var
  Form: TDevideForm;
  Sum1, Sum2: Currency;
begin
  Form := TDevideForm.Create(nil);
  try
    Form.LabelCaption := 'Сумма';
    if usrg_lbBonusSum.Caption <> '' then
      Form.Number := usrg_lbBonusSum.Caption
    else
      Form.Number := '0';
    Form.ShowModal;
    if Form.ModalResult = 1 then
    begin
      Sum1 := StrToCurr(Form.Number);
      if usrg_lbBonusSum.Caption <> '' then
        Sum2 := StrToCurr(usrg_lbBonusSum.Caption)
      else
        Sum2 := 0;

      if Sum1 > Sum2 then
        Sum1 := Sum2;

      usrg_lbBonusPay.Caption := CurrToStr(Sum1);
    end;
  finally
    Form.Free;
  end;
end;

procedure TChooseDiscountCard.btnDeleteClick(Sender: TObject);
begin
  if Touch_MessageBox('Внимание', 'Удалить скидку?', MB_YESNO, mtConfirmation) = IDYES then
  begin
    if FHeaderTable.State = dsBrowse then
      FHeaderTable.Edit;
    FHeaderTable.FieldByName('USR$DISCCARDKEY').Clear;
    FHeaderTable.Post;

    FCardid := 0;
    usrg_lblCustomer.Caption := '';
    usrg_lblPersDiscount.Caption := '';
    usrg_lblCardCode.Text := '';
    usrg_lbBonusSum.Caption := '';
    usrg_lbBonusPay.Caption := '';
  end;
end;

procedure TChooseDiscountCard.FormShow(Sender: TObject);
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');
  Assert(Assigned(FHeaderTable), 'HeaderTable not assigned');

  if Cardid > 0 then
    if FFrontBase.GetDiscountCardInfo(FDataTable, Cardid, FFrontBase.GetLogicDate, '') then
    begin
      FDataTable.First;
      if not FDataTable.Eof then
      begin
        usrg_lblCustomer.Caption := FDataTable.FieldByName('contactname').AsString;
        usrg_lblPersDiscount.Caption := FDataTable.FieldByName('Discountname').AsString + ', ' +
          FDataTable.FieldByName('DiscPers').AsString + '%';

        if FDataTable.FieldByName('usr$bonus').AsInteger = 1 then
        begin
          usrg_lbBonusSum.Caption := FDataTable.FieldByName('USR$BALANCE').AsString;
          btnChooseBonus.Enabled := True;
        end else
          usrg_lbBonusSum.Caption := '';

      end;
    end;
end;

procedure TChooseDiscountCard.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  FCardid := 0;
end;

procedure TChooseDiscountCard.FormCreate(Sender: TObject);
begin
  btnChooseBonus.Enabled := False;

  FDataTable := TkbmMemTable.Create(Self);
  FDataTable.FieldDefs.Add('ID', ftInteger, 0);
  FDataTable.FieldDefs.Add('contactname', ftString, 120);
  FDataTable.FieldDefs.Add('Discountname', ftString, 40);
  FDataTable.FieldDefs.Add('DiscPers', ftCurrency, 0);
  FDataTable.FieldDefs.Add('usr$bonus', ftCurrency, 0);
  FDataTable.FieldDefs.Add('USR$BALANCE', ftCurrency, 0);
  FDataTable.FieldDefs.Add('DiscKey', ftInteger, 0);
  FDataTable.CreateTable;
  FDataTable.Open;

  btnOK.Picture := FrontData.RestPictureContainer.FindPicture('tick');
  btnCancel.Picture := FrontData.RestPictureContainer.FindPicture('cross');
  btnDelete.Picture := FrontData.RestPictureContainer.FindPicture('cancel');
end;

procedure TChooseDiscountCard.usrg_lblCardCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  RemoveWrongPassChar(Key);

  if (Key = #13) then
  begin
    if FFrontBase.GetDiscountCardInfo(FDataTable, 0, FFrontBase.GetLogicDate, usrg_lblCardCode.Text) then
    begin
      FDataTable.First;
      if not FDataTable.Eof then
      begin
        FCardid := FDataTable.FieldByName('ID').AsInteger;
        FDiskid := FDataTable.FieldByName('DiscKey').AsInteger;
        usrg_lblCustomer.Caption := FDataTable.FieldByName('contactname').AsString;
        usrg_lblPersDiscount.Caption := FDataTable.FieldByName('Discountname').AsString + ', ' +
          FDataTable.FieldByName('DiscPers').AsString + '%';

        if FDataTable.FieldByName('usr$bonus').AsInteger = 1 then
        begin
          usrg_lbBonusSum.Caption := FDataTable.FieldByName('USR$BALANCE').AsString;
          btnChooseBonus.Enabled := True;
        end else
          usrg_lbBonusSum.Caption := '';

      end;
    end else
    begin
      usrg_lblCardCode.Text := '';
      FCardid := 0;
    end;
  end;
end;

procedure TChooseDiscountCard.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
