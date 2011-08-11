unit rfReservListForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrontForm_Unit, FrontData_Unit, Front_DataBase_Unit, ExtCtrls,
  AdvPanel, Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, DB, kbmMemTable,
  AdvSmoothButton, ActnList, TouchMessageBoxForm_Unit, RestTable_Unit,
  FiscalRegister_Unit, Base_FiscalRegister_unit, Report_Unit;

type
  TReservList = class(TBaseFrontForm)
    pnlMain: TAdvPanel;
    MemTable: TkbmMemTable;
    dsMain: TDataSource;
    DBGrLeft: TDBAdvGrid;
    alMain: TActionList;
    btnAddReservation: TAdvSmoothButton;
    btnPayAvans: TAdvSmoothButton;
    btnReturnAvans: TAdvSmoothButton;
    btnAddOrder: TAdvSmoothButton;
    btnExit: TAdvSmoothButton;
    btnDeleteAvans: TAdvSmoothButton;
    actDeleteReserv: TAction;
    actPayAvans: TAction;
    actReturnAvans: TAction;
    actEditOrder: TAction;
    btnPrintReservationOrder: TAdvSmoothButton;
    btnPrintReservationTable: TAdvSmoothButton;
    actPrintReservationOrder: TAction;
    actPrintReservationTable: TAction;
    procedure FormCreate(Sender: TObject);
    procedure btnAddReservationClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actDeleteReservUpdate(Sender: TObject);
    procedure actDeleteReservExecute(Sender: TObject);
    procedure actEditOrderExecute(Sender: TObject);
    procedure actEditOrderUpdate(Sender: TObject);
    procedure actPayAvansUpdate(Sender: TObject);
    procedure actPayAvansExecute(Sender: TObject);
    procedure actReturnAvansExecute(Sender: TObject);
    procedure actReturnAvansUpdate(Sender: TObject);
    procedure actPrintReservationOrderExecute(Sender: TObject);
    procedure actPrintReservationOrderUpdate(Sender: TObject);
    procedure actPrintReservationTableUpdate(Sender: TObject);
    procedure actPrintReservationTableExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FReport: TRestReport;
    FPrinting: Boolean;
    FTableKey: Integer;
    FCurrentTable: TRestTable;
    FFiscalRegiter: TFiscalRegister;
    FRubPayTypeKey: Integer;
    function GetOrderKey: Integer;
    function GetReservKey: Integer;
    procedure SetFiscalRegister(const Value: TFiscalRegister);
    procedure PayAvansSum(const Return: Boolean);
  public
    property TableKey: Integer read FTableKey write FTableKey;
    property ReservKey: Integer read GetReservKey;
    property OrderKey: Integer read GetOrderKey;
    property CurrentTable: TRestTable read FCurrentTable write FCurrentTable;
    property FiscalRegister: TFiscalRegister read FFiscalRegiter write SetFiscalRegister;
  end;

var
  ReservList: TReservList;

implementation

uses
  rfReservForm_Unit, rfUtils_unit, SellParamForm_Unit;

{$R *.dfm}

procedure TReservList.actDeleteReservExecute(Sender: TObject);
begin
  if Touch_MessageBox('Внимание', 'Удалить бронь?', MB_YESNO, mtConfirmation) = IDYES then
  begin
    FFrontBase.DeleteReservation(MemTable.FieldByName('ID').AsInteger,
      OrderKey);
    FrontBase.GetReservListByTable(FTableKey, MemTable);
    MemTable.First;
  end;
end;

procedure TReservList.actDeleteReservUpdate(Sender: TObject);
begin
  actDeleteReserv.Enabled := (not MemTable.IsEmpty) and
    (MemTable.FieldByName('USR$AVANSSUM').AsCurrency = 0) and (not FPrinting);
end;

procedure TReservList.actEditOrderExecute(Sender: TObject);
var
  Str: String;
begin
  if MemTable.FieldByName('USR$ORDERKEY').AsInteger <> 0 then
    Str := 'Редактировать предварительный заказ?'
  else
    Str := 'Создать предварительный заказ?';

  if Touch_MessageBox('Внимание', Str, MB_YESNO, mtConfirmation) = IDYES then
    ModalResult := mrOK;
end;

procedure TReservList.actEditOrderUpdate(Sender: TObject);
begin
  actEditOrder.Enabled := (not MemTable.IsEmpty) and (not FPrinting);
end;

procedure TReservList.actPayAvansExecute(Sender: TObject);
begin
  FPrinting := True;
  btnAddReservation.Enabled := False;
  btnExit.Enabled := False;
  try
    PayAvansSum(False);
  finally
    FPrinting := False;
    btnAddReservation.Enabled := True;
    btnExit.Enabled := True;
  end;
end;

procedure TReservList.actPayAvansUpdate(Sender: TObject);
begin
  actPayAvans.Enabled := (not MemTable.IsEmpty) and
    (MemTable.FieldByName('USR$AVANSSUM').AsCurrency = 0) and (not FPrinting);
end;

procedure TReservList.actPrintReservationOrderExecute(Sender: TObject);
begin
  FPrinting := True;
  try
    FReport.PrintReservationOrder(MemTable.FieldByName('ID').AsInteger, rp_ReservationOrder);
  finally
    FPrinting := False;
  end;
end;

procedure TReservList.actPrintReservationOrderUpdate(Sender: TObject);
begin
  actPrintReservationOrder.Enabled := (not MemTable.IsEmpty) and
    (MemTable.FieldByName('USR$ORDERKEY').AsInteger <> 0) and (not FPrinting); ;
end;

procedure TReservList.actPrintReservationTableExecute(Sender: TObject);
begin
  FPrinting := True;
  try
    FReport.PrintReservationOrder(MemTable.FieldByName('ID').AsInteger, rp_ReservationTable);
  finally
    FPrinting := False;
  end;
end;

procedure TReservList.actPrintReservationTableUpdate(Sender: TObject);
begin
  actPrintReservationTable.Enabled := actPrintReservationOrder.Enabled;
end;

procedure TReservList.actReturnAvansExecute(Sender: TObject);
begin
  FPrinting := True;
  btnAddReservation.Enabled := False;
  btnExit.Enabled := False;
  try
    PayAvansSum(True);
  finally
    FPrinting := False;
    btnAddReservation.Enabled := True;
    btnExit.Enabled := True;
  end;
end;

procedure TReservList.actReturnAvansUpdate(Sender: TObject);
begin
  actReturnAvans.Enabled := (not MemTable.IsEmpty) and
    (MemTable.FieldByName('USR$AVANSSUM').AsCurrency <> 0) and (not FPrinting);
end;

procedure TReservList.btnAddReservationClick(Sender: TObject);
var
  FReservForm: TReservForm;
begin
  FReservForm := TReservForm.Create(nil);
  try
    FReservForm.FrontBase := FrontBase;
    FReservForm.TableKey := FTableKey;
    FReservForm.CurrentTable := FCurrentTable;
    FReservForm.ShowModal;
    if FReservForm.ModalResult = mrOk then
    begin
      FrontBase.GetReservListByTable(FTableKey, MemTable);
      MemTable.First;
    end;
  finally
    FReservForm.Free;
  end;
end;

procedure TReservList.FormCreate(Sender: TObject);
begin
  FPrinting := False;

  MemTable.FieldDefs.Add('ID', ftInteger, 0);
  MemTable.FieldDefs.Add('NAME', ftString, 120);
  MemTable.FieldDefs.Add('USR$RESERVTIME', ftTime, 0);
  MemTable.FieldDefs.Add('USR$RESERVDATE', ftDate, 0);
  MemTable.FieldDefs.Add('USR$DOCUMENTDATE', ftDate, 0);
  MemTable.FieldDefs.Add('USR$DOCUMENTNUMBER', ftString, 120);
  MemTable.FieldDefs.Add('USR$AVANSSUM', ftInteger, 0);
  MemTable.FieldDefs.Add('USR$ORDERKEY', ftInteger, 0);
  MemTable.FieldDefs.Add('USR$RESPKEY', ftInteger, 0);
  MemTable.FieldDefs.Add('NUMBER', ftString, 20);
  MemTable.CreateTable;
  MemTable.Open;

  SetupAdvGrid(DBGrLeft);
end;

procedure TReservList.FormDestroy(Sender: TObject);
begin
  FReport.Free;
end;

procedure TReservList.FormShow(Sender: TObject);
begin
  Assert(Assigned(FrontBase), 'FrontBase not assigned');

  FrontBase.GetReservListByTable(FTableKey, MemTable);
  FRubPayTypeKey := FrontBase.GetIDByRUID(mn_RUBpaytypeXID, mn_RUBpaytypeDBID);
  MemTable.First;

  FReport := TRestReport.Create(nil);
  FReport.FrontBase := FrontBase;
end;

function TReservList.GetOrderKey: Integer;
begin
  Result := MemTable.FieldByName('USR$ORDERKEY').AsInteger;
end;

function TReservList.GetReservKey: Integer;
begin
  Result := MemTable.FieldByName('ID').AsInteger;
end;

procedure TReservList.PayAvansSum(const Return: Boolean);
var
  FForm: TSellParamForm;
  FLineTable: TkbmMemTable;
  FHeaderTable: TkbmMemTable;
  FModificationDataSet: TkbmMemTable;
  AvansSum: Currency;
  FNewOrderID: Integer;
begin
  if Assigned(FFiscalRegiter) then
  begin
    FForm := TSellParamForm.CreateWithFrontBase(nil, FFrontBase);
    FLineTable := TkbmMemTable.Create(nil);
    FHeaderTable := TkbmMemTable.Create(nil);
    FModificationDataSet := TkbmMemTable.Create(nil);
    try
      if Return then
      begin
        FForm.SaleType := ptReturnAvans;
        FForm.SumToPay := MemTable.FieldByName('USR$AVANSSUM').AsCurrency;
      end else
        FForm.SaleType := ptAvans;
      FForm.FiscalRegiter := FFiscalRegiter;
      FForm.Doc := FHeaderTable;
      FForm.DocLine := FLineTable;
      FForm.ShowModal;
      if FForm.ModalResult = mrOk then
      begin
        if Return then
          AvansSum := MemTable.FieldByName('USR$AVANSSUM').AsCurrency
        else
          AvansSum := FForm.Sums.FCashSum + FForm.Sums.FCardSum + FForm.Sums.FCreditSum +
            FForm.Sums.FPersonalCardSum;

        GetHeaderTable(FHeaderTable);
        FHeaderTable.Open;

        FHeaderTable.Insert;
//            FHeaderTable.FieldByName('USR$RESERVKEY').AsInteger := MemTable.FieldByName('ID').AsInteger;
        FHeaderTable.FieldByName('NUMBER').AsString := MemTable.FieldByName('NUMBER').AsString;
        FHeaderTable.FieldByName('USR$RESPKEY').AsInteger := MemTable.FieldByName('USR$RESPKEY').AsInteger;
        FHeaderTable.FieldByName('USR$GUESTCOUNT').AsInteger := 1;
        FHeaderTable.FieldByName('USR$TIMEORDER').Value := FFrontBase.GetServerDateTime;
        FHeaderTable.FieldByName('USR$COMPUTERNAME').AsString := FFrontBase.ComputerName;
        FHeaderTable.Post;

        GetLineTable(FLineTable);
        FLineTable.Open;

        GetModificationTable(FModificationDataSet);
        FModificationDataSet.Open;

        FLineTable.Insert;
        FLineTable.FieldByName('usr$quantity').AsInteger := 1;
        FLineTable.FieldByName('usr$costncu').AsCurrency := AvansSum;
        FLineTable.FieldByName('usr$sumncu').AsCurrency := AvansSum;
        FLineTable.FieldByName('usr$sumncuwithdiscount').AsCurrency := AvansSum;
        FLineTable.FieldByName('usr$costncuwithdiscount').AsCurrency := AvansSum;
        FLineTable.FieldByName('LINEKEY').AsInteger := 1;
        FLineTable.FieldByName('STATEFIELD').AsInteger := cn_StateInsert;
        FLineTable.FieldByName('CREATIONDATE').AsDateTime := FFrontBase.GetServerDateTime;
        if Return then
          FLineTable.FieldByName('usr$goodkey').AsInteger := FFrontBase.GetIDByRUID(147747671, 1650037404)
        else
          FLineTable.FieldByName('usr$goodkey').AsInteger := FFrontBase.GetIDByRUID(147747670, 1650037404);
        FLineTable.FieldByName('USR$COMPUTERNAME').AsString := FFrontBase.ComputerName;
        FLineTable.Post;

        FFrontBase.CreateNewOrder(FHeaderTable, FLineTable, FModificationDataSet,
          FNewOrderID, Return);
        FFrontBase.LockUserOrder(FNewOrderID);
        FrontBase.GetOrder(FHeaderTable, FLineTable, FModificationDataSet, FNewOrderID);
        //1.Печатаем чек
        if FForm.NoFiscalPayment then
          FFiscalRegiter.InitFiscalRegister(Reg_Test)
        else
          FFiscalRegiter.InitFiscalRegister(FFrontBase.CashCode);
        FFiscalRegiter.OpenDrawer;
        if Return then
        begin
          if FFiscalRegiter.ReturnCheck(FHeaderTable, FLineTable, FForm.PayLine, FForm.Sums) then
          begin
            FFrontBase.CreateNewOrder(FHeaderTable, FLineTable, FModificationDataSet,
              FNewOrderID);
            FFrontBase.UnLockUserOrder(FNewOrderID);
            //2.Сохраняем значение аванса
            FFrontBase.SaveReservAvansSum(MemTable.FieldByName('ID').AsInteger, 0);
          end else
            FrontBase.DeleteOrder(FNewOrderID);
        end else
        begin
          if FFiscalRegiter.PrintCheck(FHeaderTable, FLineTable, FForm.PayLine, FForm.Sums) then
          begin
            FFrontBase.CreateNewOrder(FHeaderTable, FLineTable, FModificationDataSet,
              FNewOrderID);
            FFrontBase.UnLockUserOrder(FNewOrderID);
            //2.Сохраняем значение аванса
            FFrontBase.SaveReservAvansSum(MemTable.FieldByName('ID').AsInteger, AvansSum);
          end else
            FrontBase.DeleteOrder(FNewOrderID);
        end;
        //3.Перечитываем
        FrontBase.GetReservListByTable(FTableKey, MemTable);
        MemTable.First;
      end;
    finally
      FForm.Free;
      FHeaderTable.Free;
      FLineTable.Free;
      FModificationDataSet.Free;
    end;
  end
  else
    Touch_MessageBox('Внимание', 'Для данной рабочей станции не указан кассовый терминал!', MB_OK, mtWarning);
end;

procedure TReservList.SetFiscalRegister(const Value: TFiscalRegister);
begin
  FFiscalRegiter := Value;
end;

end.
