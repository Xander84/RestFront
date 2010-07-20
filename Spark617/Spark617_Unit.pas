unit Spark617_Unit;

interface

uses
  Classes, Windows, Forms, SPARKAX3Lib_TLB, Front_DataBase_Unit, kbmMemTable, DB,
  Base_FiscalRegister_unit;

type
  TSpark617Register = class(TSpark617TF, IBaseFiscalRegister)
  private
    FFrontBase: TFrontBase;
    FDriverInit: Boolean;

    function SetParams: Boolean;
    procedure ErrMessage(Err: Integer);
    procedure SetFrontBase(const Value: TFrontBase);
    function GetFrontBase: TFrontBase;
    function Get_Self: Integer;
  public
    IsInit: Boolean;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function CheckDeviceInfo: Boolean;
    function Init: Boolean;
    function PrintCheck(const Doc, DocLine, PayLine: TkbmMemTable): Boolean;

    function PrintZ1ReportWithCleaning: Boolean;
    function PrintZ2ReportWithCleaning: Boolean;
    function PrintX1ReportWithOutCleaning: Boolean;
    function PrintX2ReportWithOutCleaning: Boolean;
    procedure OpenDrawer;
    procedure EndSession;
    procedure MoneyIn;
    procedure MoneyOut;
    function GetDocumentNumber: Integer;

    property FrontBase: TFrontBase read GetFrontBase write SetFrontBase;
    property Self: Integer read Get_Self;
  end;


implementation

uses SysUtils, Math;

{ TSpark617Register }

function TSpark617Register.CheckDeviceInfo: Boolean;
var
  Res: Integer;
begin
  Result := False;
  Assert(Assigned(FFrontBase), 'FrontBase not Assigned');

  if FDriverInit then
  begin
    if GetDeviceInfo(5) = 0 then
      SetClerk(FFrontBase.UserName);
    if GetDeviceInfo(1) = 1 then
      MessageBox(Application.Handle, PChar('Приближение конца бумаги!'),
       'Внимание', MB_OK or MB_ICONEXCLAMATION);
    if GetDeviceInfo(8) = 1 then
    begin
      MessageBox(Application.Handle, PChar('Принтер занят!'),
       'Внимание', MB_OK or MB_ICONEXCLAMATION);

      exit;
    end;
    if GetDeviceInfo(9) = 1 then
    begin
      MessageBox(Application.Handle, PChar('Ошибка принтера!'),
       'Внимание', MB_OK or MB_ICONEXCLAMATION);

      exit;
    end;
    if GetDeviceInfo(10) = 1 then
    begin
      MessageBox(Application.Handle, PChar('Бумага закончилась!'),
       'Внимание', MB_OK or MB_ICONEXCLAMATION);

      exit;
    end;
    if GetDeviceInfo(11) = 1 then
    begin
      MessageBox(Application.Handle, PChar('Фискальная память заполнена!'),
       'Внимание', MB_OK or MB_ICONEXCLAMATION);

      exit;
    end;
    if GetDeviceInfo(12) = 1 then
    begin
      MessageBox(Application.Handle, PChar('Ошибка фискальной памяти!'),
       'Внимание', MB_OK or MB_ICONEXCLAMATION);

      exit;
    end;
    if GetDeviceInfo(13) = 1 then
    begin
      MessageBox(Application.Handle, PChar('Ошибка в фискальной операции!'),
       'Внимание', MB_OK or MB_ICONEXCLAMATION);

      exit;
    end;
    if GetDeviceInfo(14) = 1 then
    begin
      MessageBox(Application.Handle, PChar('Превышение лимита времени смены (24 часа)!'),
       'Внимание', MB_OK or MB_ICONEXCLAMATION);

      exit;
    end;

    if GetDeviceInfo(4) = 0 then
    begin
      Res := SetDeviceOpt(3, 0);
      ErrMessage(Res);

      Res := SetDeviceOpt(4, 0);
      ErrMessage(Res);

      Res := SetDeviceOpt(5, 0);
      ErrMessage(Res);

      Res := SetDeviceOpt(6, 0);
      ErrMessage(Res);

      Res := SetDeviceOpt(7, 0);
      ErrMessage(Res);

      Res := SetDeviceOpt(8, 1);
      ErrMessage(Res);

      Res := SetDeviceOpt(9, 0);
      ErrMessage(Res);

      Res := SetDeviceOpt(10, 1);
      ErrMessage(Res);

      Res := SetDeviceOpt(11, 1);
      ErrMessage(Res);

      Res := SetDeviceOpt(12, 1);
      ErrMessage(Res);

      Res := SetDeviceOpt(13, 1);
      ErrMessage(Res);

      Res := SetDeviceOpt(14, 1);
      ErrMessage(Res);

      Res := SetDeviceOpt(15, 0);
      ErrMessage(Res);

      Res := SetDeviceOpt(18, 0);
      ErrMessage(Res);

      Res := SetDeviceOpt(20, 0);
      ErrMessage(Res);

      Res := SetDeviceOpt(21, 1);
      ErrMessage(Res);

      Res := SetDeviceOpt(22, 0);
      ErrMessage(Res);

      Res := SetDeviceOpt(25, 1);
      ErrMessage(Res);

  { TODO : В дальнейшем параметры брать из БД }
      Res := SetOrderHeader(1, '****************', 0);
      ErrMessage(Res);

      Res := SetOrderHeader(2, 'Ресторан', 0);
      ErrMessage(Res);

      Res := SetOrderHeader(3, 'Название', 0);
      ErrMessage(Res);

      Res := SetOrderHeader(4, '****************', 0);
      ErrMessage(Res);

      Res := SetOrderHeader(5, '             ', 0);
      ErrMessage(Res);

      Res := SetOrderHeader(6, 'Адрес', 0);
      ErrMessage(Res);

      Res := SetOrderHeader(7, 'Тел', 0);
      ErrMessage(Res);

      Res := SetOrderHeader(8, 'ежедневно с 12.00 до 24.00', 0);
      ErrMessage(Res);

      Res := SetDescriptorText(42, 'Стол №');
      ErrMessage(Res);

      Res := SetDescriptorText(80, 'Официант:');
      ErrMessage(Res);

      Res := SetPaymentMean(1, 'Пласт. карта', 0, 1, 1, 1);
      ErrMessage(Res);

      Res := SetPaymentMean(7, 'Безналичные', 0, 1, 1, 0);
      ErrMessage(Res);

      Res := SetPaymentMean(8, 'Наличные', 0, 1, 1, 1);
      ErrMessage(Res);

      Res := StartSession(FFrontBase.UserName, FFrontBase.CashNumber); //открыть сессию
      if Res <> 0 then
      begin
        ErrMessage(Res);
        exit;
      end;
    end;
    Result := True;
  end;
end;

constructor TSpark617Register.Create(AOwner: TComponent);
begin
  FDriverInit := True;
  try
    inherited Create(AOwner);
  except
    MessageBox(Application.Handle, PChar('Не установлен драйвер для ФР ''Спарк 617ТФ''!'),
     'Внимание', MB_OK or MB_ICONEXCLAMATION);
    FDriverInit := False;
  end;
  IsInit := False;
end;

destructor TSpark617Register.Destroy;
begin
  if FDriverInit then
    if IsInit then
      DeinitDevice;

  inherited;
end;

procedure TSpark617Register.EndSession;
var
  Res: Integer;
begin
  if FDriverInit then
  begin
    Init;
    Res := Inherited EndSession;
    ErrMessage(Res);
  end;
end;

procedure TSpark617Register.ErrMessage(Err: Integer);
var
  ErrStr: String;
begin
  if Err <> 0 then
  begin
    ErrStr := WideCharToString(PWideChar(GetErrorComment(Err)));
    MessageBox(Application.Handle, PChar(ErrStr),
     'Внимание', MB_OK or MB_ICONEXCLAMATION);
  end;
end;

function TSpark617Register.GetDocumentNumber: Integer;
begin
  Result := 0;
  if FDriverInit then
    Result := GetDeviceInfo(26);
end;

function TSpark617Register.Init: Boolean;
begin
  Result := False;
  if FDriverInit then
  begin
    if IsInit then
    begin
      CheckDeviceInfo;
      Init := True;
      exit;
    end;

    if not SetParams then
      exit;
    if not CheckDeviceInfo then
      exit;
  end;
  Result := True;
  IsInit := True;
end;

procedure TSpark617Register.MoneyIn;
begin
// не реализовано
end;

procedure TSpark617Register.MoneyOut;
begin
// не реализовано
end;

procedure TSpark617Register.OpenDrawer;
var
  Res: Integer;
begin
  if FDriverInit then
  begin
    Init;
    Res := Inherited OpenDrawer;
    ErrMessage(Res);
  end;
end;

function TSpark617Register.PrintCheck(const Doc, DocLine, PayLine: TkbmMemTable): Boolean;
var
  Res: Integer;
  DocNumber, WaiterName: String;
  WasDiscount: Boolean;
  TotalDiscount: Currency;
  GoodName, DiscName: String;
  Quantity, Price, SumDiscount: Currency;
begin
  Result := False;
  Assert(Assigned(FFrontBase), 'FrontBase not Assigned');

  if FDriverInit then
  begin
    if Init then
    begin
      SetClerk(FFrontBase.UserName);

      DocNumber := Doc.FieldByName('NUMBER').AsString;
      DocNumber := StringReplace(DocNumber, '.', '', [rfReplaceAll]);
      DocNumber := StringReplace(DocNumber, ',', '', [rfReplaceAll]);
      if Length(DocNumber) > 5 then
        Delete(DocNumber, 5, Length(DocNumber));

      WaiterName := FFrontBase.GetNameWaiterOnID(Doc.FieldByName('usr$respkey').AsInteger, False, False);
      Res := SetExtraDocData(StrToInt(DocNumber), 0, 0, WaiterName);
      ErrMessage(Res);

      Res := StartDocument(1, 1, StrToInt(DocNumber), FFrontBase.UserName);
      if Res <> 0 then
      begin
        ErrMessage(Res);
        CancelDocument;
        exit;
      end;

      TotalDiscount := 0;
      WasDiscount := False;

      DocLine.First;
      while not DocLine.Eof do
      begin
        if (DocLine.FieldByName('usr$sumdiscount').AsCurrency > 0) and (TotalDiscount > 0) then
        begin
          Res := AbsoluteCorrectionText(-Round(TotalDiscount + 0.0001), 'Округление');
          if Res <> 0 then
          begin
            ErrMessage(Res);
            CancelDocument;
            exit;
          end;
          TotalDiscount := 0;
        end;

        GoodName := DocLine.FieldByName('GOODNAME').AsString;
        Quantity := DocLine.FieldByName('usr$quantity').AsCurrency * 1000;
        Price := DocLine.FieldByName('usr$costncu').AsCurrency;
        SumDiscount := Round(DocLine.FieldByName('usr$sumdiscount').AsCurrency  + 0.0001);
        TotalDiscount := TotalDiscount + SumDiscount;

        if Quantity >= 0 then
        begin
          Res := Item(Round(Quantity), Round(Price), GoodName, 0);
          if Res <> 0 then
          begin
            ErrMessage(Res);
            CancelDocument;
            exit;
          end;

          if DocLine.FieldByName('usr$persdiscount').AsCurrency <> 0 then
            WasDiscount := True;
        end;
        DocLine.Next;
      end;

      if TotalDiscount <> 0 then
      begin
        if WasDiscount then
          DiscName := 'Скидка'
        else
          DiscName := 'Округление';

        Res := AbsoluteCorrectionText(-Round(TotalDiscount + 0.0001), DiscName);
        if Res <> 0 then
        begin
          ErrMessage(Res);
          CancelDocument;
          exit;
        end;
//Hint        TotalDiscount := 0;
      end;

      // проверять на ISFISCAL ???


      // сначала кредитка
      PayLine.DisableControls;
      try
        PayLine.First;
        while not PayLine.Eof do
        begin
          if (PayLine.FieldByName('PAYTYPE').AsInteger = 1) and
            (PayLine.FieldByName('SUM').AsInteger > 0) then
          begin
            Res := Tender2(PayLine.FieldByName('SUM').AsInteger, 1, '', '');
            if res <> 0 then
            begin
              ErrMessage(Res);
              Res := CancelDocument;
              if Res = 0 then
                exit;
            end;
          end;
          PayLine.Next;
        end;
      finally
        PayLine.EnableControls;
      end;

      // Безнал
      PayLine.DisableControls;
      try
        PayLine.First;
        while not PayLine.Eof do
        begin
          if (PayLine.FieldByName('PAYTYPE').AsInteger = 2) and
            (PayLine.FieldByName('SUM').AsInteger > 0) then
          begin
            Res := Tender2(PayLine.FieldByName('SUM').AsInteger, 7, '', '');
            if res <> 0 then
            begin
              ErrMessage(Res);
              Res := CancelDocument;
              if Res = 0 then
                exit;
            end;
          end;
          PayLine.Next;
        end;
      finally
        PayLine.EnableControls;
      end;

      // наличные
      PayLine.DisableControls;
      try
        PayLine.First;
        while not PayLine.Eof do
        begin
          if (PayLine.FieldByName('PAYTYPE').AsInteger = 0) and
            (PayLine.FieldByName('SUM').AsInteger > 0) then
          begin
            Res := Tender2(PayLine.FieldByName('SUM').AsInteger, 8, '', '');
            if res <> 0 then
            begin
              ErrMessage(Res);
              Res := CancelDocument;
              if Res = 0 then
                exit;
            end;
          end;
          PayLine.Next;
        end;
      finally
        PayLine.EnableControls;
      end;

      Res := EndDocument;
      if Res = 0 then
      begin
        Res := GetDeviceInfo(102);
        if Res <> 0 then
        begin
          StartDocument(1, 1, StrToInt(DocNumber), FFrontBase.UserName);
          Res := CancelDocument;
        end
      end;

      if Res = 0 then
        Result := True
      else begin
        ErrMessage(Res);
        Res := GetDeviceInfo(102);
        if Res = 0 then
          Result := True
        else begin
          Res := EndDocument;
          if Res <> 0 then
          begin
            ErrMessage(Res);
            Res := GetDeviceInfo(102);
          end;

          if Res <> 0 then
          begin
            ErrMessage(Res);
            Res := EndDocument;
            if Res = 0 then
              Result := True
            else begin
               Res := GetDeviceInfo(102);
               if Res <> 0 then
               begin
                 CancelDocument;
                 Result := False;
               end else
                 Result := True;
            end;
          end;
        end;
      end;

      if Result then
      begin
      // сохраняем чек
        if Doc.State <> dsEdit then
          Doc.Edit;
        Doc.FieldByName('USR$WHOPAYOFFKEY').AsInteger := FFrontBase.ContactKey;
        Doc.FieldByName('USR$PAY').AsInteger := 1;
        Doc.FieldByName('USR$REGISTER').AsString := IntToStr(FFrontBase.CashNumber);
        Doc.FieldByName('USR$LOGICDATE').AsDateTime := FFrontBase.GetLogicDate;
        Doc.FieldByName('USR$SYSNUM').AsInteger := GetDocumentNumber;
        if Doc.FieldByName('usr$timecloseorder').IsNull then
          Doc.FieldByName('usr$timecloseorder').AsDateTime := Now;

        PayLine.DisableControls;
        try
          PayLine.First;
          while not PayLine.Eof do
          begin
            FFrontBase.SavePayment(FFrontBase.ContactKey, Doc.FieldByName('ID').AsInteger,
              PayLine.FieldByName('USR$PAYTYPEKEY').AsInteger, PayLine.FieldByName('SUM').AsCurrency);

            PayLine.Next;
          end;
        finally
          PayLine.EnableControls;
        end;
        Doc.Post;
      end;
    end else
      MessageBox(Application.Handle, PChar('Ошибка инициализации ФР ''Спарк 617ТФ''!'),
       'Внимание', MB_OK or MB_ICONEXCLAMATION);
  end else
    MessageBox(Application.Handle, PChar('Не установлен драйвер для ФР ''Спарк 617ТФ''!'),
     'Внимание', MB_OK or MB_ICONEXCLAMATION);
end;

function TSpark617Register.PrintZ1ReportWithCleaning: Boolean;
var
  Res: Integer;
begin
  Result := False;
  if FDriverInit then
  begin
    Init;
    if MessageBox(Application.Handle, 'Вы действительно хотите снять отчет с гашением Z1?',
      'Внимание', MB_YESNO) = IDYES then
    begin
      Res := PrintReport(3);
      if Res = 0 then
        Result := True
      else
        ErrMessage(Res);
    end;
    CheckDeviceInfo;
  end;
end;

function TSpark617Register.PrintZ2ReportWithCleaning: Boolean;
var
  Res: Integer;
begin
  Result := False;
  if FDriverInit then
  begin
    Init;
    if MessageBox(Application.Handle, 'Вы действительно хотите снять отчет с гашением Z2?',
      'Внимание', MB_YESNO) = IDYES then
    begin
      Res := PrintReport(4);
      if Res = 0 then
        Result := True
      else
        ErrMessage(Res);
    end;
    CheckDeviceInfo;
  end;
end;

function TSpark617Register.PrintX1ReportWithOutCleaning: Boolean;
var
  Res: Integer;
begin
  Result := False;
  if FDriverInit then
  begin
    Init;
    if MessageBox(Application.Handle, 'Вы действительно хотите снять отчет X1?',
      'Внимание', MB_YESNO) = IDYES then
    begin
      Res := PrintReport(1);
      if Res = 0 then
        Result := True
      else
        ErrMessage(Res);
    end;
    CheckDeviceInfo;
  end;
end;

function TSpark617Register.PrintX2ReportWithOutCleaning: Boolean;
var
  Res: Integer;
begin
  Result := False;
  if FDriverInit then
  begin
    Init;
    if MessageBox(Application.Handle, 'Вы действительно хотите снять отчет X2?',
      'Внимание', MB_YESNO) = IDYES then
    begin
      Res := PrintReport(2);
      if Res = 0 then
        Result := True
      else
        ErrMessage(Res);
    end;
    CheckDeviceInfo;
  end;
end;

function TSpark617Register.SetParams: Boolean;
var
  Res: Integer;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not Assigned');

  Result := False;

  Res := SetAccessKey('000000');
  ErrMessage(Res);

  Res := SetDeviceOpt(1, FFrontBase.FiscalComPort);
  ErrMessage(Res);

  Res := SetDeviceOpt(2, 0);
  ErrMessage(Res);

  Res := InitDevice;
  if Res <> 0 then
  begin
    ErrMessage(Res);
    exit;
  end;

  Result := True;
end;

procedure TSpark617Register.SetFrontBase(const Value: TFrontBase);
begin
  FFrontBase := Value;
end;

function TSpark617Register.GetFrontBase: TFrontBase;
begin
  Result := FFrontBase;
end;

function TSpark617Register.Get_Self: Integer;
begin
  Result := Integer(Self);
end;

end.
