unit SellParamForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Front_DataBase_Unit, kbmMemTable, DB,
  FiscalRegister_Unit, ActnList, FrontData_Unit,
  AdvSmoothTouchKeyBoard, ExtCtrls, AdvPanel, AdvSmoothButton,
  AdvSmoothToggleButton, Grids, BaseFrontForm_Unit, BaseGrid, AdvGrid,
  DBAdvGrid;

{ TODO : Подключить табло покупателя }  

const
  cn_maxpay = 1000000;
  mn_nalXID = 147142772;
  mn_nalDBID = 354772515;
  mn_beznalXID = 147142771;
  mn_beznalDBID = 362821871;
  //рубли по умолчанию форма оплаты
  mn_RUBpaytypeXID = 147141777;
  mn_RUBpaytypeDBID = 349813242;
  // тип оплаты
  // 0 нал
  // 1 карта
  // 2 безнал
  cn_paytype_cash = 0;
  cn_paytype_credit = 1;
  cn_paytype_noncash = 2;


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
    btnBeznalPay: TAdvSmoothToggleButton;
    btnCardPay: TAdvSmoothToggleButton;
    actDeletePay: TAction;
    btnDelPay: TAdvSmoothButton;
    DBAdvGrMain: TDBAdvGrid;
    procedure edMainKeyPress(Sender: TObject; var Key: Char);
    procedure edMainChange(Sender: TObject);
    procedure btnCashPayClick(Sender: TObject);
    procedure btnBeznalPayClick(Sender: TObject);
    procedure btnCardPayClick(Sender: TObject);
    procedure actPayExecute(Sender: TObject);
    procedure actPayUpdate(Sender: TObject);
    procedure TouchKeyBoardKeyClick(Sender: TObject; Index: Integer);
    procedure btnCancelClick(Sender: TObject);
    procedure actDeletePayUpdate(Sender: TObject);
    procedure actDeletePayExecute(Sender: TObject);
    procedure DBAdvGrMainFooterCalc(Sender: TObject; ACol, ARow: Integer;
      var Value: String);
  private
    FFrontBase: TFrontBase;
    // сумма к оплате
    FSumToPay: Currency;
    // сумма по всем видам оплат
    FPaySum: Currency;
    // сдача
    FChange: Currency;
    FNalID: Integer;
    FBezNalID: Integer;
    FCurrentPayType: Integer;
    FCurrentPayName: String;
    FNoFiscal: Integer;
    FFiscalRegiter: TFiscalRegister;
    FDoc: TkbmMemTable;
    FDocLine: TkbmMemTable;
    FPayType: Integer;
    dsPayLine: TkbmMemTable;

    procedure SetSumToPay(const Value: Currency);
    procedure SetFiscalRegister(const Value: TFiscalRegister);
    procedure SetDoc(const Value: TkbmMemTable);
    procedure SetDocLine(const Value: TkbmMemTable);

    procedure OnAfterDelete(DataSet: TDataSet);
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
  PayForm_Unit;

{$R *.dfm}

{ TSellParamForm }


constructor TSellParamForm.CreateWithFrontBase(AOwner: TComponent;
  FBase: TFrontBase);
begin
  inherited Create(AOwner);
  FFrontBase := FBase;
  FCurrentPayType := -1;
  FPaySum := 0;
  FSumToPay := 0;
  FChange := 0;

  dsPayLine := TkbmMemTable.Create(nil);
  dsPayLine.Close;
  dsPayLine.FieldDefs.Clear;
  dsPayLine.FieldDefs.Add('USR$NAME', ftString, 60);
  dsPayLine.FieldDefs.Add('USR$PAYTYPEKEY', ftInteger, 0);
  dsPayLine.FieldDefs.Add('USR$NOFISCAL', ftInteger, 0);
  dsPayLine.FieldDefs.Add('SUM', ftFloat, 0);
  dsPayLine.FieldDefs.Add('PAYTYPE', ftInteger, 0);
  dsPayLine.CreateTable;
  dsPayLine.AfterDelete := OnAfterDelete;
  dsPayLine.Open;
  dsMain.DataSet := dsPayLine;

  FNalID := FFrontBase.GetIDByRUID(mn_nalXID, mn_nalDBID);
  Assert(FNalID <> -1, 'Invalid RUID');
  FBezNalID := FFrontBase.GetIDByRUID(mn_beznalXID, mn_beznalDBID);
  Assert(FBezNalID <> -1, 'Invalid RUID');

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
      dsPayLine.Post;
    end;
  end;

  DBAdvGrMain.CalcFooter(2);
  if (FSumToPay - FPaySum) < 0 then
  begin
    lblChange.Caption := Format(DBAdvGrMain.FloatFormat, [FSumToPay - FPaySum]);
    FChange := FSumToPay - FPaySum;
  end else
  begin
    lblChange.Caption := '0';
    FChange := 0;
  end;
end;

procedure TSellParamForm.btnCashPayClick(Sender: TObject);
begin
  if TAdvSmoothToggleButton(Sender).Down = True then
  begin
    FCurrentPayType := FFrontBase.GetIDByRUID(mn_RUBpaytypeXID, mn_RUBpaytypeDBID);
    FCurrentPayName := 'Рубли';
    FNoFiscal := 0;
    FPayType := cn_paytype_cash;
    edMain.Text := '';
  end;
  Assert(FCurrentPayType <> -1, 'Invalid RUID');
end;

procedure TSellParamForm.btnBeznalPayClick(Sender: TObject);
var
  FForm: TPayForm;
begin
  FForm := TPayForm.CreateWithFrontBase(nil, FFrontBase);
  FForm.PayType := FBezNalID;
  FForm.IsPlCard := 0;
  try
    FForm.ShowModal;
    if FForm.ModalResult = mrOK then
    begin
      FCurrentPayType := FForm.PayFormDataSet.FieldByName('USR$PAYTYPEKEY').AsInteger;
      FCurrentPayName := FForm.PayFormDataSet.FieldByName('USR$NAME').AsString;
      FNoFiscal := FForm.PayFormDataSet.FieldByName('USR$NOFISCAL').AsInteger;
      FPayType := cn_paytype_noncash;
      edMain.Text := '';
    end;
  finally
    FForm.Free;
  end;
end;

procedure TSellParamForm.SetSumToPay(const Value: Currency);
begin
  FSumToPay := Value;
  lblToPay.Caption := Format(DBAdvGrMain.FloatFormat, [Value]);
end;

procedure TSellParamForm.btnCardPayClick(Sender: TObject);
var
  FForm: TPayForm;
begin
  FForm := TPayForm.CreateWithFrontBase(nil, FFrontBase);
  FForm.PayType := FBezNalID;
  FForm.IsPlCard := 1;
  try
    FForm.ShowModal;
    if FForm.ModalResult = mrOK then
    begin
      FCurrentPayType := FForm.PayFormDataSet.FieldByName('USR$PAYTYPEKEY').AsInteger;
      FCurrentPayName := FForm.PayFormDataSet.FieldByName('USR$NAME').AsString;
      FNoFiscal := FForm.PayFormDataSet.FieldByName('USR$NOFISCAL').AsInteger;
      FPayType := cn_paytype_credit;
      edMain.Text := '';
    end;
  finally
    FForm.Free;
  end;
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
  CashCode: Integer;
begin
  if lblChange.Caption = '' then
  begin
    MessageBox(Self.Handle, PChar('Сумма оплаты меньше суммы чека!'),
     'Внимание', MB_OK or MB_ICONEXCLAMATION);
    exit;
  end;
  if FChange > 0 then
  begin
    MessageBox(Self.Handle, PChar('Сумма оплаты меньше суммы чека!'),
     'Внимание', MB_OK or MB_ICONEXCLAMATION);
    exit;
  end;
  if (FChange > 0) and (FSumToPay = 0) then
  begin
    MessageBox(Self.Handle, PChar('Сумма оплаты больше суммы чека!'),
     'Внимание', MB_OK or MB_ICONEXCLAMATION);
    exit;
  end;
  if (-FChange >= cn_maxpay) then
  begin
    MessageBox(Self.Handle, PChar('Неверная сумма оплаты!'),
     'Внимание', MB_OK or MB_ICONEXCLAMATION);
    exit;
  end;

  if Assigned(FFiscalRegiter) then
  begin
    if FFrontBase.MN_Options.PrintFiscalChek then
    begin
      // если фискальный чек печатается, то подключаем соответствующее оборудовние
      CashCode := FFrontBase.CashCode;
      case CashCode of
        0: //Штрих-ФР
        begin
          Assert(False, 'Данный тип кассы не поддерживается');
        end;

        1: //Дитрон
        begin
          Assert(False, 'Данный тип кассы не поддерживается');
        end;

        2: //Меркурий-Epson 220U
        begin
          Assert(False, 'Данный тип кассы не поддерживается');
        end;

        3: //Спарк 617 ТФ
        begin
          FFiscalRegiter.InitFiscalRegister(CashCode);
          FFiscalRegiter.OpenDrawer;
          if FFiscalRegiter.PrintCheck(Doc, DocLine, dsPayLine) then
          begin
            Self.ModalResult := mrOk;
          end;
        end;

        4: //Без кассы для тестов
        begin
          if Doc.State <> dsEdit then
            Doc.Edit;
          Doc.FieldByName('USR$WHOPAYOFFKEY').AsInteger := FFrontBase.ContactKey;
          Doc.FieldByName('USR$PAY').AsInteger := 1;
          Doc.FieldByName('USR$LOGICDATE').AsDateTime := FFrontBase.GetLogicDate;
          if Doc.FieldByName('usr$timecloseorder').IsNull then
            Doc.FieldByName('usr$timecloseorder').AsDateTime := Now;

          dsPayLine.DisableControls;
          try
            dsPayLine.First;
            while not dsPayLine.Eof do
            begin
              FFrontBase.SavePayment(FFrontBase.ContactKey, Doc.FieldByName('ID').AsInteger,
                dsPayLine.FieldByName('USR$PAYTYPEKEY').AsInteger, dsPayLine.FieldByName('SUM').AsCurrency);

              dsPayLine.Next;
            end;
          finally
            dsPayLine.EnableControls;
          end;
          Doc.Post;
          Self.ModalResult := mrOk;
        end;

        else
          MessageBox(Application.Handle, PChar('Для данной рабочей станции не указан кассовый терминал!'),
            'Внимание', MB_OK or MB_ICONEXCLAMATION);

      end;
    end else
    begin
      if Doc.State <> dsEdit then
        Doc.Edit;
      Doc.FieldByName('USR$WHOPAYOFFKEY').AsInteger := FFrontBase.ContactKey;
      Doc.FieldByName('USR$PAY').AsInteger := 1;
      Doc.FieldByName('USR$LOGICDATE').AsDateTime := FFrontBase.GetLogicDate;
      if Doc.FieldByName('usr$timecloseorder').IsNull then
        Doc.FieldByName('usr$timecloseorder').AsDateTime := Now;

      dsPayLine.DisableControls;
      try
        dsPayLine.First;
        while not dsPayLine.Eof do
        begin
          FFrontBase.SavePayment(FFrontBase.ContactKey, Doc.FieldByName('ID').AsInteger,
            dsPayLine.FieldByName('USR$PAYTYPEKEY').AsInteger, dsPayLine.FieldByName('SUM').AsCurrency);

          dsPayLine.Next;
        end;
      finally
        dsPayLine.EnableControls;
      end;
      Doc.Post;
      Self.ModalResult := mrOk;
    end;
  end;
end;

procedure TSellParamForm.actPayUpdate(Sender: TObject);
begin
  actPay.Enabled := (Assigned(FFrontBase)) and
    (Assigned(FDoc)) and (Assigned(FDocLine));
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

procedure TSellParamForm.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSellParamForm.actDeletePayUpdate(Sender: TObject);
begin
  actDeletePay.Enabled := (not dsPayLine.IsEmpty);
end;

procedure TSellParamForm.actDeletePayExecute(Sender: TObject);
begin
  dsPayLine.Delete;
end;

procedure TSellParamForm.OnAfterDelete(DataSet: TDataSet);
begin
  edMain.Text := '';
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
    Value := Format(DBAdvGrMain.FloatFormat, [Curr]);
  end;
end;

end.
