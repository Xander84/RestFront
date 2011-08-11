unit ReturneyMoneyForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SellParamForm_Unit, ActnList, DB, Grids, AdvObj, BaseGrid, AdvGrid,
  DBAdvGrid, AdvSmoothToggleButton, AdvSmoothButton, AdvSmoothTouchKeyBoard,
  StdCtrls, ExtCtrls, AdvPanel, kbmMemTable, Front_DataBase_Unit;


type
  TReturnMoneyForm = class(TSellParamForm)
    procedure actPayExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
  private
    FNewOrderID: Integer;

    FHeaderTable: TkbmMemTable;
    FLineTable: TkbmMemTable;
    FModificationDataSet: TkbmMemTable;
    FMasterDataSource: TDataSource;

    procedure CreateDataSets;
  public
    { Public declarations }
  end;

var
  ReturnMoneyForm: TReturnMoneyForm;

implementation

uses
  TouchMessageBoxForm_Unit, rfUtils_unit;

{$R *.dfm}

procedure TReturnMoneyForm.actCancelExecute(Sender: TObject);
begin
  inherited;
  if FNewOrderID <> -1 then
    FrontBase.DeleteOrder(FNewOrderID);
end;

procedure TReturnMoneyForm.actPayExecute(Sender: TObject);
var
  Ev: TAdvSmoothTouchKeyEvent;
  FSum: Currency;
begin
  CalcSums;
  FSum := (Sums.FCardSum + Sums.FCreditSum + Sums.FCashSum + Sums.FPersonalCardSum);
  if (FSum <= 0) then
  begin
    Touch_MessageBox('Внимание', 'Сумма возврата должна быть положительной!', MB_OK, mtWarning);
    exit;
  end;

  //1. Очищаем
  FHeaderTable.First;
  while not FHeaderTable.Eof do
  begin
    FHeaderTable.Delete;
  end;
  //2. Создаём документ с нужной суммой.
  FHeaderTable.Insert;
  FHeaderTable.FieldByName('NUMBER').AsString := '0';
  FHeaderTable.FieldByName('USR$GUESTCOUNT').AsInteger := 1;
  FHeaderTable.FieldByName('USR$TIMEORDER').Value := FFrontBase.GetServerDateTime;
  FHeaderTable.FieldByName('USR$COMPUTERNAME').AsString := FFrontBase.ComputerName;
  FHeaderTable.FieldByName('usr$respkey').AsInteger := FFrontBase.ContactKey;
  FHeaderTable.Post;

  FLineTable.Insert;
  FLineTable.FieldByName('LINEKEY').AsInteger := 1;
  FLineTable.FieldByName('STATEFIELD').AsInteger := cn_StateInsert;
  FLineTable.FieldByName('usr$quantity').AsInteger := 1;
  FLineTable.FieldByName('CREATIONDATE').AsDateTime := FFrontBase.GetServerDateTime;
  FLineTable.FieldByName('usr$goodkey').AsInteger := FFrontBase.GetIDByRUID(147746001, 1650037404);
  FLineTable.FieldByName('usr$costncu').AsCurrency := FSum;
  FLineTable.FieldByName('usr$sumncu').AsCurrency := FSum;
  FLineTable.FieldByName('usr$sumncuwithdiscount').AsCurrency := FSum;
  FLineTable.FieldByName('usr$costncuwithdiscount').AsCurrency := FSum;
  FLineTable.FieldByName('USR$COMPUTERNAME').AsString := FFrontBase.ComputerName;
  FLineTable.Post;
  //3. Сохраняем документ возврата
  FFrontBase.CreateNewOrder(FHeaderTable, FLineTable, FModificationDataSet,
    FNewOrderID, True);
  FFrontBase.LockUserOrder(FNewOrderID);
  FrontBase.GetOrder(FHeaderTable, FLineTable, FModificationDataSet, FNewOrderID);

  FPrinting := True;
  Ev := TouchKeyBoard.OnKeyClick;
  TouchKeyBoard.OnKeyClick := nil;
  DBAdvGrMain.Enabled := False;
  try
    if Assigned(FiscalRegiter) then
    begin
      FiscalRegiter.InitFiscalRegister(FFrontBase.CashCode);
      FiscalRegiter.OpenDrawer;
      if FiscalRegiter.ReturnCheck(FHeaderTable, FLineTable, dsPayLine, Sums) then
      begin
        //сохраняем документ
        FFrontBase.CreateNewOrder(FHeaderTable, FLineTable, FModificationDataSet,
          FNewOrderID);
        FFrontBase.UnLockUserOrder(FNewOrderID);
        Self.ModalResult := mrOk;
      end else
        FrontBase.DeleteOrder(FNewOrderID);
    end else
      Touch_MessageBox('Внимание', 'Для данной рабочей станции не указан кассовый терминал!', MB_OK, mtWarning);
  finally
    FPrinting := False;
    TouchKeyBoard.OnKeyClick := Ev;
    DBAdvGrMain.Enabled := True;
  end;
end;

procedure TReturnMoneyForm.CreateDataSets;
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

procedure TReturnMoneyForm.FormCreate(Sender: TObject);
begin
  inherited;
  CreateDataSets;
  FNewOrderID := -1;
end;

procedure TReturnMoneyForm.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FModificationDataSet);
  FreeAndNil(FMasterDataSource);
  FreeAndNil(FLineTable);
  FreeAndNil(FHeaderTable);
end;

end.
