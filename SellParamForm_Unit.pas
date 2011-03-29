unit SellParamForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Front_DataBase_Unit, kbmMemTable, DB,
  FiscalRegister_Unit, ActnList, FrontData_Unit,
  AdvSmoothTouchKeyBoard, ExtCtrls, AdvPanel, AdvSmoothButton,
  AdvSmoothToggleButton, Grids, BaseFrontForm_Unit, BaseGrid, AdvGrid,
  DBAdvGrid, AdvObj, Base_FiscalRegister_unit;

const
  cn_maxpay = 1000000;
  mn_CashXID = 147142772;
  mn_CashlDBID = 354772515;
  mn_CreditlXID = 147142771;
  mn_CreditDBID = 362821871;
  mn_personalcardXID = 147733997;
  mn_personalcardDBID = 1604829035;

type
  TSellParamForm = class(TBaseFrontForm)
    pnlMain: TAdvPanel;
    lblToPay: TLabel;
    lblChange: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edMain: TEdit;
    dsMain: TDataSource;
    acListMain: TActionList;
    actPay: TAction;
    TouchKeyBoard: TAdvSmoothTouchKeyBoard;
    btnPay: TAdvSmoothButton;
    btnCancel: TAdvSmoothButton;
    btnCashPay: TAdvSmoothToggleButton;
    btnCreditlPay: TAdvSmoothToggleButton;
    btnCardPay: TAdvSmoothToggleButton;
    actDeletePay: TAction;
    btnDelPay: TAdvSmoothButton;
    DBAdvGrMain: TDBAdvGrid;
    btnPersonalCard: TAdvSmoothToggleButton;
    actCancel: TAction;
    actCashPay: TAction;
    actPersonalCard: TAction;
    actCardPay: TAction;
    actCreditPay: TAction;
    procedure edMainKeyPress(Sender: TObject; var Key: Char);
    procedure edMainChange(Sender: TObject);
    procedure actPayExecute(Sender: TObject);
    procedure actPayUpdate(Sender: TObject);
    procedure TouchKeyBoardKeyClick(Sender: TObject; Index: Integer);
    procedure actDeletePayUpdate(Sender: TObject);
    procedure actDeletePayExecute(Sender: TObject);
    procedure DBAdvGrMainFooterCalc(Sender: TObject; ACol, ARow: Integer;
      var Value: String);
    procedure actCancelExecute(Sender: TObject);
    procedure actCancelUpdate(Sender: TObject);
    procedure actCashPayUpdate(Sender: TObject);
    procedure actCashPayExecute(Sender: TObject);
    procedure actPersonalCardExecute(Sender: TObject);
    procedure actPersonalCardUpdate(Sender: TObject);
    procedure actCardPayUpdate(Sender: TObject);
    procedure actCardPayExecute(Sender: TObject);
    procedure actCreditPayUpdate(Sender: TObject);
    procedure actCreditPayExecute(Sender: TObject);
  private
    FFrontBase: TFrontBase;
    // сумма к оплате
    FSumToPay: Currency;
    // сумма по всем видам оплат
    FPaySum: Currency;
    // сдача
    FChange: Currency;
    // структура оплаты
    FSums: TSaleSums;

    FPrinting: Boolean;
    FInDeleteOrUpdate: Boolean;
    FInInsert: Boolean;
    FInBrowse: Boolean;
    FCashID: Integer;
    FCreditID: Integer;
    FPersonalCardID: Integer;
    FPersonalCardKey: Integer;
    FCurrentPayType: Integer;
    FCurrentPayName: String;
    FNoFiscal: Integer;
    FFiscalRegiter: TFiscalRegister;
    FDoc: TkbmMemTable;
    FDocLine: TkbmMemTable;
    FPayType: Integer;
    dsPayLine: TkbmMemTable;
    FIsValidPayment: Boolean;
    FNoFiscalPayment: Boolean;

    procedure SetSumToPay(const Value: Currency);
    procedure SetFiscalRegister(const Value: TFiscalRegister);
    procedure SetDoc(const Value: TkbmMemTable);
    procedure SetDocLine(const Value: TkbmMemTable);

    procedure OnAfterDelete(DataSet: TDataSet);
    procedure OnAfterScroll(DataSet: TDataSet);

    procedure PrevSettings(const PayType: Integer; NeedLocate: Boolean = True);
    procedure CalcSums;
  public
    constructor CreateWithFrontBase(AOwner: TComponent; FBase: TFrontBase);
    destructor Destroy; override;

    property SumToPay: Currency read FSumToPay write SetSumToPay;
    property FiscalRegistry: TFiscalRegister read FFiscalRegiter write SetFiscalRegister;
    property Doc: TkbmMemTable read FDoc write SetDoc;
    property DocLine: TkbmMemTable read FDocLine write SetDocLine;
  end;

var
  SellParamForm: TSellParamForm;

implementation

uses
  PayForm_Unit, TouchMessageBoxForm_Unit, Report_Unit, PersonalCardForm_Unit;

{$R *.dfm}

{ TSellParamForm }


procedure TSellParamForm.CalcSums;
var
  SavePlace: TBookmark;
  FFirst: Boolean;
begin
  FIsValidPayment := True;
  FFirst := True;

  with FSums do
  begin
    FCashSum := 0;
    FCardSum := 0;
    FCreditSum := 0;
    FPersonalCardSum := 0;
  end;

  FInBrowse := True;
  SavePlace := dsPayLine.Bookmark;
  try
    dsPayLine.DisableControls;
    try
      dsPayLine.First;
      while not dsPayLine.Eof do
      begin
        case dsPayLine.FieldByName('PAYTYPE').AsInteger of
          cn_paytype_cash: //наличные
            FSums.FCashSum := FSums.FCashSum + dsPayLine.FieldByName('SUM').AsInteger;
          cn_paytype_credit: //кредитная карта
            FSums.FCardSum := FSums.FCardSum + dsPayLine.FieldByName('SUM').AsInteger;
          cn_paytype_noncash: //безнал (кредит)
            FSums.FCreditSum := FSums.FCreditSum + dsPayLine.FieldByName('SUM').AsInteger;
          cn_paytype_personalcard:
            FSums.FPersonalCardSum := FSums.FPersonalCardSum + dsPayLine.FieldByName('SUM').AsInteger;
        end;
        // проверка на то, что бы фискальные оплаты не были с нефискальными
        if FFirst then
        begin
          FIsValidPayment := True;
          FNoFiscalPayment := (dsPayLine.FieldByName('USR$NOFISCAL').AsInteger = 1);
        end else
        begin
          if FNoFiscalPayment <> (dsPayLine.FieldByName('USR$NOFISCAL').AsInteger = 1) then
            FIsValidPayment := False;

        end;
        FFirst := False;

        dsPayLine.Next;
      end;
      dsPayLine.GotoBookmark(SavePlace);
    finally
      dsPayLine.EnableControls;
    end;
  finally
    FInBrowse := False;
    dsPayLine.FreeBookmark(SavePlace);
  end;
end;

constructor TSellParamForm.CreateWithFrontBase(AOwner: TComponent;
  FBase: TFrontBase);
begin
  inherited Create(AOwner);
  FFrontBase := FBase;
  FCurrentPayType := -1;
  FPaySum := 0;
  FSumToPay := 0;
  FChange := 0;
  FInDeleteOrUpdate := False;
  FInInsert := False;
  FInBrowse := False;
  FPrinting := False;

  dsPayLine := TkbmMemTable.Create(nil);
  dsPayLine.Close;
  dsPayLine.FieldDefs.Clear;
  dsPayLine.FieldDefs.Add('USR$NAME', ftString, 60);
  dsPayLine.FieldDefs.Add('USR$PAYTYPEKEY', ftInteger, 0);
  dsPayLine.FieldDefs.Add('USR$PERSONALCARDKEY', ftInteger, 0);
  dsPayLine.FieldDefs.Add('USR$NOFISCAL', ftInteger, 0);
  dsPayLine.FieldDefs.Add('SUM', ftFloat, 0);
  dsPayLine.FieldDefs.Add('PAYTYPE', ftInteger, 0);
  dsPayLine.CreateTable;
  dsPayLine.AfterDelete := OnAfterDelete;
  dsPayLine.AfterScroll := OnAfterScroll;
  dsMain.DataSet := dsPayLine;
  dsPayLine.Open;

  FCashID := FFrontBase.GetIDByRUID(mn_CashXID, mn_CashlDBID);
  Assert(FCashID <> -1, 'Invalid RUID');
  FCreditID := FFrontBase.GetIDByRUID(mn_CreditlXID, mn_CreditDBID);
  Assert(FCreditID <> -1, 'Invalid RUID');
  FPersonalCardID := FFrontBase.GetIDByRUID(mn_personalcardXID, mn_personalcardDBID);
  Assert(FPersonalCardID <> -1, 'Invalid RUID');

  btnCashPay.Down := True;
  FCurrentPayType := FFrontBase.GetIDByRUID(mn_RUBpaytypeXID, mn_RUBpaytypeDBID);
  FCurrentPayName := 'Рубли';
  FNoFiscal := 0;
  FPayType := cn_paytype_cash;

  Assert(FCurrentPayType <> -1, 'Invalid RUID');

  SetupAdvGrid(DBAdvGrMain);
  with DBAdvGrMain do
  begin
    FloatingFooter.Visible := True;
    FloatingFooter.ColumnCalc[1] := acCUSTOM;
    FloatingFooter.ColumnCalc[2] := acCUSTOM;
  end;
end;

destructor TSellParamForm.Destroy;
begin
  dsPayLine.Free;
  inherited;
end;

procedure TSellParamForm.edMainKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = 'ю') or (Key = 'Ю') or (Key = 'б') or (Key = 'Б') or (Key = ',') or (Key = '<') then
    Key := FFormatSettings.DecimalSeparator;
end;

procedure TSellParamForm.edMainChange(Sender: TObject);
begin
  FInInsert := True;
  try
    if not FInDeleteOrUpdate then
    begin
      if dsPayLine.IsEmpty then
      begin
        if edMain.Text <> '' then
        begin
          dsPayLine.Append;
          dsPayLine.FieldByName('SUM').AsCurrency := StrToCurr(edMain.Text);
          dsPayLine.FieldByName('USR$PAYTYPEKEY').AsInteger := FCurrentPayType;
          dsPayLine.FieldByName('USR$NAME').AsString := FCurrentPayName;
          dsPayLine.FieldByName('USR$NOFISCAL').AsInteger := FNoFiscal;
          dsPayLine.FieldByName('PAYTYPE').AsInteger := FPayType;
          dsPayLine.FieldByName('USR$PERSONALCARDKEY').AsInteger := FPersonalCardKey;
          dsPayLine.Post;
        end;
      end else
      begin
        if dsPayLine.Locate('USR$PAYTYPEKEY', FCurrentPayType, []) then
        begin
          dsPayLine.Edit;
          if edMain.Text <> '' then
            dsPayLine.FieldByName('SUM').AsCurrency := StrToCurr(edMain.Text)
          else
            dsPayLine.FieldByName('SUM').AsCurrency := 0;
          dsPayLine.Post;
        end else
        begin
          dsPayLine.Append;
          if edMain.Text <> '' then
            dsPayLine.FieldByName('SUM').AsCurrency := StrToCurr(edMain.Text);
          dsPayLine.FieldByName('USR$PAYTYPEKEY').AsInteger := FCurrentPayType;
          dsPayLine.FieldByName('USR$NAME').AsString := FCurrentPayName;
          dsPayLine.FieldByName('USR$NOFISCAL').AsInteger := FNoFiscal;
          dsPayLine.FieldByName('PAYTYPE').AsInteger := FPayType;
          dsPayLine.FieldByName('USR$PERSONALCARDKEY').AsInteger := FPersonalCardKey;
          dsPayLine.Post;
        end;
      end;
    end;

    DBAdvGrMain.CalcFooter(2);
    if (FSumToPay - FPaySum) < 0 then
      lblChange.Caption := Format(DBAdvGrMain.FloatFormat, [(FPaySum - FSumToPay)])
    else
      lblChange.Caption := '0';

    FChange := FPaySum - FSumToPay;
  finally
    FInInsert := False;
  end;
end;

procedure TSellParamForm.SetSumToPay(const Value: Currency);
begin
  FSumToPay := Value;
  lblToPay.Caption := Format(DBAdvGrMain.FloatFormat, [Value]);
end;

procedure TSellParamForm.SetFiscalRegister(const Value: TFiscalRegister);
begin
  FFiscalRegiter := Value;
end;

procedure TSellParamForm.SetDoc(const Value: TkbmMemTable);
begin
  FDoc := Value;
end;

procedure TSellParamForm.SetDocLine(const Value: TkbmMemTable);
begin
  FDocLine := Value;
end;

procedure TSellParamForm.actPayExecute(Sender: TObject);
var
  FReport: TRestReport;
  Ev: TAdvSmoothTouchKeyEvent;
begin
  if (lblChange.Caption = '') or (FChange < 0) then
  begin
    Touch_MessageBox('Внимание', 'Сумма оплаты меньше суммы чека!', MB_OK, mtWarning);
    exit;
  end;
  if (FChange > 0) and (FSumToPay = 0) then
  begin
    Touch_MessageBox('Внимание', 'Сумма оплаты больше суммы чека!', MB_OK, mtWarning);
    exit;
  end;
  if (-FChange >= cn_maxpay) then
  begin
    Touch_MessageBox('Внимание', 'Неверная сумма оплаты!', MB_OK, mtWarning);
    exit;
  end;
  CalcSums;
  if ((FSums.FCardSum + FSums.FCreditSum) > FSumToPay) or (FSums.FPersonalCardSum > FSumToPay) then
  begin
    Touch_MessageBox('Внимание', 'Сумма оплаты по безналичному расчету превышает сумму чека!', MB_OK, mtWarning);
    exit;
  end;
  if ((FSums.FPersonalCardSum > 0) and ((FSums.FCardSum + FSums.FCreditSum + FSums.FCreditSum) > 0)) then
  begin
    Touch_MessageBox('Внимание', 'Не может быть смешанной оплаты при оплате персональной карточкой!', MB_OK, mtWarning);
    exit;
  end;
  if not FIsValidPayment then
  begin
    Touch_MessageBox('Внимание', 'Не может быть комбинации фискальной и не фискальной оплаты!', MB_OK, mtWarning);
    exit;
  end;
  FSums.FChangeSum := FChange;

  FPrinting := True;
  Ev := TouchKeyBoard.OnKeyClick;
  TouchKeyBoard.OnKeyClick := nil;
  DBAdvGrMain.Enabled := False;
  try
    FFrontBase.Display.Payed;
    if Assigned(FFiscalRegiter) then
    begin
      FInBrowse := True;
      try
        if FNoFiscalPayment then
          FFiscalRegiter.InitFiscalRegister(4)
        else
          FFiscalRegiter.InitFiscalRegister(FFrontBase.CashCode);
        FFiscalRegiter.OpenDrawer;
        if FFiscalRegiter.PrintCheck(Doc, DocLine, dsPayLine, FSums) then
        begin
          if FFrontBase.Options.PrintCopyCheck then
          begin
            FReport := TRestReport.Create(Self);
            FReport.FrontBase := FFrontBase;
            try
              FReport.PrintAfterSalePreCheck(FDoc.FieldByName('ID').AsInteger, FSums);
            finally
              FReport.Free;
            end;
          end;

          Self.ModalResult := mrOk;
        end;
      finally
        FInBrowse := False;
      end;
    end else
      Touch_MessageBox('Внимание', 'Для данной рабочей станции не указан кассовый терминал!', MB_OK, mtWarning);
  finally
    FPrinting := False;
    TouchKeyBoard.OnKeyClick := Ev;
    DBAdvGrMain.Enabled := True;
  end;
end;

procedure TSellParamForm.actPayUpdate(Sender: TObject);
begin
  actPay.Enabled := (Assigned(FFrontBase)) and
    (Assigned(FDoc)) and (Assigned(FDocLine)) and (not FPrinting);
end;

procedure TSellParamForm.actPersonalCardExecute(Sender: TObject);
var
  FForm: TPersonalCardForm;
begin
  if btnPersonalCard.Down = False then
    btnPersonalCard.Down := True;

  FForm := TPersonalCardForm.Create(nil);
  FForm.FrontBase := FFrontBase;
  FForm.PersonalCardID := FPersonalCardID;
  try
    FForm.ShowModal;
    if FForm.ModalResult = mrOK then
    begin
      FCurrentPayType := FPersonalCardID;
      FCurrentPayName := 'Персональная карта';
      FPayType := cn_paytype_personalcard;
      FPersonalCardKey := FForm.HeaderTable.FieldByName('ID').AsInteger;
      FNoFiscal := FForm.HeaderTable.FieldByName('USR$NOFISCAL').AsInteger;
      edMain.Text := '';
      if dsPayLine.IsEmpty then
      begin
        edMain.Text := CurrToStr(FSumToPay);
        edMain.SelStart := Length(edMain.Text);
      end;
    end else
      PrevSettings(FPayType);
  finally
    FForm.Free;
  end;
end;

procedure TSellParamForm.actPersonalCardUpdate(Sender: TObject);
begin
  actPersonalCard.Enabled := not FPrinting;
end;

procedure TSellParamForm.TouchKeyBoardKeyClick(Sender: TObject;
  Index: Integer);
begin
  with TouchKeyBoard.Keys.Items[Index] do
  begin
    if SpecialKey = skNone then
      PostMessage(edMain.Handle, WM_KEYUP, Ord(Caption[1]), 0)
    else
      PostMessage(edMain.Handle, WM_KEYUP, 8, 0);
  end;
end;

procedure TSellParamForm.actDeletePayUpdate(Sender: TObject);
begin
  actDeletePay.Enabled := (not dsPayLine.IsEmpty) and (not FPrinting);
end;

procedure TSellParamForm.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSellParamForm.actCancelUpdate(Sender: TObject);
begin
  actCancel.Enabled := not FPrinting;
end;

procedure TSellParamForm.actCardPayExecute(Sender: TObject);
var
  FForm: TPayForm;
begin
  if btnCardPay.Down = False then
    btnCardPay.Down := True;
  FForm := TPayForm.CreateWithFrontBase(nil, FFrontBase);
  FForm.PayType := FCreditID;
  FForm.IsPlCard := 1;
  try
    FForm.ShowModal;
    if FForm.ModalResult = mrOK then
    begin
      FPersonalCardKey := -1;
      FCurrentPayType := FForm.PayFormDataSet.FieldByName('USR$PAYTYPEKEY').AsInteger;
      FCurrentPayName := FForm.PayFormDataSet.FieldByName('USR$NAME').AsString;
      FNoFiscal := FForm.PayFormDataSet.FieldByName('USR$NOFISCAL').AsInteger;
      FPayType := cn_paytype_credit;
      edMain.Text := '';
      if dsPayLine.IsEmpty then
      begin
        edMain.Text := CurrToStr(FSumToPay);
        edMain.SelStart := Length(edMain.Text);
      end;
    end else
      PrevSettings(FPayType);
  finally
    FForm.Free;
  end;
end;

procedure TSellParamForm.actCardPayUpdate(Sender: TObject);
begin
  actCardPay.Enabled := not FPrinting;
end;

procedure TSellParamForm.actCashPayExecute(Sender: TObject);
begin
  if btnCashPay.Down then
  begin
    FPersonalCardKey := -1;
    FCurrentPayType := FFrontBase.GetIDByRUID(mn_RUBpaytypeXID, mn_RUBpaytypeDBID);
    FCurrentPayName := 'Рубли';
    FNoFiscal := 0;
    FPayType := cn_paytype_cash;
    edMain.Text := '';
  end;
  Assert(FCurrentPayType <> -1, 'Invalid RUID');
end;

procedure TSellParamForm.actCashPayUpdate(Sender: TObject);
begin
  actCashPay.Enabled := not FPrinting;
end;

procedure TSellParamForm.actCreditPayExecute(Sender: TObject);
var
  FForm: TPayForm;
begin
  if btnCreditlPay.Down = False then
    btnCreditlPay.Down := True;
  FForm := TPayForm.CreateWithFrontBase(nil, FFrontBase);
  FForm.PayType := FCreditID;
  FForm.IsPlCard := 0;
  try
    FForm.ShowModal;
    if FForm.ModalResult = mrOK then
    begin
      FPersonalCardKey := -1;
      FCurrentPayType := FForm.PayFormDataSet.FieldByName('USR$PAYTYPEKEY').AsInteger;
      FCurrentPayName := FForm.PayFormDataSet.FieldByName('USR$NAME').AsString;
      FNoFiscal := FForm.PayFormDataSet.FieldByName('USR$NOFISCAL').AsInteger;
      FPayType := cn_paytype_noncash;
      edMain.Text := '';
      if dsPayLine.IsEmpty then
      begin
        edMain.Text := CurrToStr(FSumToPay);
        edMain.SelStart := Length(edMain.Text);
      end;
    end else
      PrevSettings(FPayType);
  finally
    FForm.Free;
  end;
end;

procedure TSellParamForm.actCreditPayUpdate(Sender: TObject);
begin
  actCreditPay.Enabled := not FPrinting;
end;

procedure TSellParamForm.actDeletePayExecute(Sender: TObject);
begin
  dsPayLine.Delete;
end;

procedure TSellParamForm.OnAfterDelete(DataSet: TDataSet);
begin
  FInDeleteOrUpdate := True;
  try
    //edMain.Text := '';
    edMain.Text := dsPayLine.FieldByName('SUM').AsString;
    PrevSettings(dsPayLine.FieldByName('PAYTYPE').AsInteger, False);
    if not dsPayLine.IsEmpty then
    begin
      FCurrentPayType := dsPayLine.FieldByName('USR$PAYTYPEKEY').AsInteger;
      FCurrentPayName := dsPayLine.FieldByName('USR$NAME').AsString;
      FPayType := dsPayLine.FieldByName('PAYTYPE').AsInteger;
      FPersonalCardKey := dsPayLine.FieldByName('USR$PERSONALCARDKEY').AsInteger;
    end else
    begin
      FCurrentPayType := FFrontBase.GetIDByRUID(mn_RUBpaytypeXID, mn_RUBpaytypeDBID);
      FCurrentPayName := 'Рубли';
      FPayType := cn_paytype_cash;
    end;
  finally
    FInDeleteOrUpdate := False;
  end;
  DBAdvGrMain.CalcFooter(2);
end;

procedure TSellParamForm.DBAdvGrMainFooterCalc(Sender: TObject; ACol,
  ARow: Integer; var Value: String);
var
  I : Integer;
  Curr: Currency;
begin
  if ACol = 1 then
    Value := 'Итого'
  else if ACol = 2 then
  begin
    Curr := 0;
    for I := DBAdvGrMain.FixedRows to ARow - 1 do
      Curr := Curr + DBAdvGrMain.Floats[ACol, I];

    FPaySum := Curr;
    if FPaySum - FSumToPay > 0 then
      FFrontBase.Display.WriteSum(FSumToPay, FPaySum, FPaySum - FSumToPay)
    else
      FFrontBase.Display.WriteSum(FSumToPay, FPaySum, 0);

    Value := Format(DBAdvGrMain.FloatFormat, [Curr]);
  end;
end;

procedure TSellParamForm.PrevSettings(const PayType: Integer; NeedLocate: Boolean);
begin
  try
    if NeedLocate then
      dsPayLine.Locate('USR$PAYTYPEKEY', FCurrentPayType, []);
    case PayType of
       cn_paytype_cash:
         btnCashPay.Down := True;

       cn_paytype_credit:
         btnCardPay.Down := True;

       cn_paytype_noncash:
         btnCreditlPay.Down := True;

       cn_paytype_personalcard:
         btnPersonalCard.Down := True;

    else
      btnCashPay.Down := True;
    end;
  except
    raise;
  end;
end;

procedure TSellParamForm.OnAfterScroll(DataSet: TDataSet);
begin
  if FInBrowse then
    exit;

  if (not FInInsert)  and (not dsPayLine.IsEmpty) then
  begin
    FInDeleteOrUpdate := True;
    try
      edMain.Text := dsPayLine.FieldByName('SUM').AsString;
      edMain.SelStart := Length(edMain.Text);
      FCurrentPayType := dsPayLine.FieldByName('USR$PAYTYPEKEY').AsInteger;
      FCurrentPayName := dsPayLine.FieldByName('USR$NAME').AsString;
      FPayType := dsPayLine.FieldByName('PAYTYPE').AsInteger;
      FPersonalCardKey := dsPayLine.FieldByName('USR$PERSONALCARDKEY').AsInteger;
      PrevSettings(FPayType, False);
    finally
      FInDeleteOrUpdate := False;
    end;
  end;
end;

end.
