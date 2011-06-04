unit frmViewOrder_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, BaseFrontForm_Unit, FrontData_Unit, StdCtrls, DB,
  GridsEh, DBGridEh, kbmMemTable, Front_DataBase_Unit, AdvSmoothButton,
  ActnList, FiscalRegister_Unit;

type
  TViewOrder = class(TBaseFrontForm)
    pnlLeft: TAdvPanel;
    pnlMain: TAdvPanel;
    DBGrMain: TDBGridEh;
    dsMain: TDataSource;
    grScrollBar: TScrollBar;
    btnCancel: TAdvSmoothButton;
    actMain: TActionList;
    btnPay: TAdvSmoothButton;
    btnDeletePosition: TAdvSmoothButton;
    actDeletePosition: TAction;
    actPay: TAction;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrMainColumns0GetCellParams(Sender: TObject; EditMode: Boolean;
      Params: TColCellParamsEh);
    procedure DBGrMainColumns1GetCellParams(Sender: TObject; EditMode: Boolean;
      Params: TColCellParamsEh);
    procedure DBGrMainColumns2GetCellParams(Sender: TObject; EditMode: Boolean;
      Params: TColCellParamsEh);
    procedure DBGrMainColumns3GetCellParams(Sender: TObject; EditMode: Boolean;
      Params: TColCellParamsEh);
    procedure btnCancelClick(Sender: TObject);
    procedure actDeletePositionUpdate(Sender: TObject);
    procedure actDeletePositionExecute(Sender: TObject);
    procedure actPayUpdate(Sender: TObject);
    procedure actPayExecute(Sender: TObject);
  private
    FOrderID: Integer;
    FNewOrderID: Integer;

    FHeaderTable: TkbmMemTable;
    FLineTable: TkbmMemTable;
    FModificationDataSet: TkbmMemTable;
    FMasterDataSource: TDataSource;
    FFiscalRegiter: TFiscalRegister;
    FSumToPay: Currency;

    procedure CreateDataSets;
    procedure SetFiscalRegister(const Value: TFiscalRegister);
    procedure SaveCheck;
  public
    property OrderID: Integer read FOrderID write FOrderID;
    property FiscalRegistry: TFiscalRegister read FFiscalRegiter write SetFiscalRegister;
  end;

var
  ViewOrder: TViewOrder;

implementation

uses
  SellParamForm_Unit, TouchMessageBoxForm_Unit;

{$R *.dfm}

procedure TViewOrder.actDeletePositionExecute(Sender: TObject);
begin
  IsActionRun := True;
  btnCancel.Enabled := False;
  try
    if Touch_MessageBox('Внимание', 'Удалить позицию?', MB_YESNO, mtConfirmation) = IDYES then
      FLineTable.Delete;
  finally
    IsActionRun := False;
    btnCancel.Enabled := True;
  end;
end;

procedure TViewOrder.actDeletePositionUpdate(Sender: TObject);
begin
  actDeletePosition.Enabled := (not FLineTable.IsEmpty) and (not IsActionRun);
end;

procedure TViewOrder.actPayExecute(Sender: TObject);
var
  FForm: TSellParamForm;
begin
  IsActionRun := True;
  btnCancel.Enabled := False;
  try
    if FFrontBase.CashCode <> -1 then
    begin
      // если чек не распечатался в прошлый раз
      if FNewOrderID <> -1 then
        FrontBase.DeleteOrder(FNewOrderID);
      //сохраняем обратный документ
      SaveCheck;

      FLineTable.DisableControls;
      try
        FLineTable.First;
        while not FLineTable.Eof do
        begin
          FSumToPay := FSumToPay - FLineTable.FieldByName('usr$sumncuwithdiscount').AsCurrency;
          FLineTable.Next;
        end;
      finally
        FLineTable.EnableControls;
      end;

      FForm := TSellParamForm.CreateWithFrontBase(nil, FFrontBase);
      try
        FForm.SaleType := ptReturn;
        FForm.FiscalRegiter := FFiscalRegiter;
        FForm.Doc := FHeaderTable;
        FForm.DocLine := FLineTable;
        FForm.SumToPay := FSumToPay;
        FForm.ShowModal;
        if FForm.ModalResult = mrOK then
        begin
          FFrontBase.CreateNewOrder(FHeaderTable, FLineTable, FModificationDataSet,
            FNewOrderID);
          FFrontBase.UnLockUserOrder(FNewOrderID);
          ModalResult := mrOK;
        end;
      finally
        FForm.Free;
      end;
    end
    else
      Touch_MessageBox('Внимание', 'Для данной рабочей станции не указан кассовый терминал!', MB_OK, mtWarning);
  finally
    IsActionRun := False;
    btnCancel.Enabled := True;
  end;
end;

procedure TViewOrder.actPayUpdate(Sender: TObject);
begin
  actPay.Enabled := (not FLineTable.IsEmpty) and (not IsActionRun);
end;

procedure TViewOrder.btnCancelClick(Sender: TObject);
begin
  IsActionRun := True;
  btnCancel.Enabled := False;
  try
    if FNewOrderID <> -1 then
      FrontBase.DeleteOrder(FNewOrderID);
    ModalResult := mrCancel;
  finally
    IsActionRun := False;
    btnCancel.Enabled := True;
  end;
end;

procedure TViewOrder.CreateDataSets;
begin
  // шапка и позиция
  GetHeaderTable(FHeaderTable);
  FHeaderTable.Open;

  GetLineTable(FLineTable);
  FLineTable.Open;

  FMasterDataSource := TDataSource.Create(nil);
  FMasterDataSource.DataSet := FLineTable;

  GetModificationTable(FModificationDataSet);
  FModificationDataSet.MasterSource := FMasterDataSource;
  FModificationDataSet.MasterFields := 'LINEKEY';
  FModificationDataSet.DetailFields := 'MASTERKEY';
  FModificationDataSet.Open;
end;

procedure TViewOrder.DBGrMainColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
var
  S: String;
  Width: Integer;
begin
  if FLineTable.FieldByName('MODIFYSTRING').AsString <> '' then
  begin
    Width := DBGrMain.Columns[0].Width div 10;
    S := Params.Text;
    if Length(S) > Width then
    begin
      Delete(S, Width, Length(S));
      Params.Text := S;
    end;

    S := FLineTable.FieldByName('MODIFYSTRING').AsString;
    if S > '' then
      Params.Text := Params.Text + #13#10 + S
  end;
  if FLineTable.FieldByName('usr$mn_printdate').AsString = '' then
  begin
    Params.Font.Color := clGreen;
    Params.Font.Style := [fsBold];
  end
  else
    Params.Font.Color := clGrayText;
end;

procedure TViewOrder.DBGrMainColumns1GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  if FLineTable.FieldByName('usr$mn_printdate').AsString = '' then
  begin
    Params.Font.Color := clGreen;
    Params.Font.Style := [fsBold];
  end
  else
    Params.Font.Color := clGrayText;
end;

procedure TViewOrder.DBGrMainColumns2GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  if FLineTable.FieldByName('USR$PERSDISCOUNT').AsCurrency > 0 then
    Params.Text := Params.Text + #13#10 + FLineTable.FieldByName
      ('USR$PERSDISCOUNT').AsString + '%';

  if FLineTable.FieldByName('usr$mn_printdate').AsString = '' then
  begin
    Params.Font.Color := clGreen;
    Params.Font.Style := [fsBold];
  end
  else
    Params.Font.Color := clGrayText;
end;

procedure TViewOrder.DBGrMainColumns3GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  if FLineTable.FieldByName('usr$mn_printdate').AsString = '' then
  begin
    Params.Font.Color := clGreen;
    Params.Font.Style := [fsBold];
  end
  else
    Params.Font.Color := clGrayText;
end;

procedure TViewOrder.FormCreate(Sender: TObject);
begin
  FNewOrderID := -1;
  SetupGrid(DBGrMain);
  CreateDataSets;

  btnCancel.Picture := FrontData.RestPictureContainer.FindPicture('cross');
  btnDeletePosition.Picture := FrontData.RestPictureContainer.FindPicture('cancel');
  btnPay.Picture := FrontData.RestPictureContainer.FindPicture('money');
end;

procedure TViewOrder.FormDestroy(Sender: TObject);
begin
  if Assigned(dsMain.DataSet) then
    dsMain.DataSet := nil;

  FreeAndNil(FModificationDataSet);
  FreeAndNil(FMasterDataSource);
  FreeAndNil(FLineTable);
  FreeAndNil(FHeaderTable);
end;

procedure TViewOrder.FormShow(Sender: TObject);
begin
  FSumToPay := 0;
  FrontBase.GetOrder(FHeaderTable, FLineTable, FModificationDataSet, FOrderID);
  FHeaderTable.First;
  if not FHeaderTable.IsEmpty then
  begin
    FHeaderTable.Edit;
    FHeaderTable.FieldByName('ID').AsInteger := 0;
    FHeaderTable.Post;
  end;
  FLineTable.First;
  while not FLineTable.Eof do
  begin
    FLineTable.Edit;
    FLineTable.FieldByName('STATEFIELD').AsInteger := cn_StateInsert;
    FLineTable.FieldByName('ID').Clear;
    FLineTable.Post;

    FLineTable.Next;
  end;

  if not Assigned(dsMain.DataSet) then
    dsMain.DataSet := FLineTable
end;

procedure TViewOrder.SaveCheck;
begin
  DBGrMain.DataSource := nil;
  try
    FFrontBase.CreateNewOrder(FHeaderTable, FLineTable, FModificationDataSet,
      FNewOrderID, True);
    FFrontBase.LockUserOrder(FNewOrderID);
    FrontBase.GetOrder(FHeaderTable, FLineTable, FModificationDataSet, FNewOrderID);
  finally
    DBGrMain.DataSource := dsMain;
  end;
end;

procedure TViewOrder.SetFiscalRegister(const Value: TFiscalRegister);
begin
  FFiscalRegiter := Value;
end;

end.
