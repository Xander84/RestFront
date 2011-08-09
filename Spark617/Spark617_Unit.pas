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
    IsInit: Boolean;
    FLastErr: Integer;

    // Наличные
    Spark_Cash: Integer;
    // Безнал
    Spark_NoCash: Integer;
    // Карты
    Spark_Credit: Integer;

    function SetParams: Boolean;
    procedure ErrMessage(Err: Integer);
    procedure SetFrontBase(const Value: TFrontBase);
    procedure MoneyOperation(const Param: Integer; Sum: Currency);
    function GetFrontBase: TFrontBase;
    function Get_Self: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function CheckDeviceInfo: Boolean;
    function Init: Boolean;
    function PrintCheck(const Doc, DocLine, PayLine: TkbmMemTable; const FSums: TSaleSums): Boolean;
    function ReturnCheck(const Doc, DocLine, PayLine: TkbmMemTable; const FSums: TSaleSums): Boolean;
    function ReturnGoodMoney(const FSums: TSaleSums): Boolean;

    function PrintZ1ReportWithCleaning: Boolean;
    function PrintX1ReportWithOutCleaning: Boolean;
    procedure OpenDrawer;
    procedure EndSession;
    function OpenDay: Boolean;
    procedure MoneyIn(const Sum: Currency);
    procedure MoneyOut(const Sum: Currency);
    function GetDocumentNumber: Integer;
    function GetRegisterInfo: TRegisterStucture;

    property FrontBase: TFrontBase read GetFrontBase write SetFrontBase;
    property Self: Integer read Get_Self;
  end;


implementation

uses SysUtils, Controls, TouchMessageBoxForm_Unit;

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
      Touch_MessageBox('Внимание', 'Приближение конца бумаги!', MB_OK or MB_ICONEXCLAMATION);
    if GetDeviceInfo(8) = 1 then
    begin
      Touch_MessageBox('Внимание', 'Принтер занят!', MB_OK or MB_ICONEXCLAMATION);
      exit;
    end;
    if GetDeviceInfo(9) = 1 then
    begin
      Touch_MessageBox('Внимание', 'Ошибка принтера!', MB_OK or MB_ICONEXCLAMATION);
      exit;
    end;
    if GetDeviceInfo(10) = 1 then
    begin
      Touch_MessageBox('Внимание', 'Бумага закончилась!', MB_OK or MB_ICONEXCLAMATION);
      exit;
    end;
    if GetDeviceInfo(11) = 1 then
    begin
      Touch_MessageBox('Внимание', 'Фискальная память заполнена!', MB_OK or MB_ICONEXCLAMATION);
      exit;
    end;
    if GetDeviceInfo(12) = 1 then
    begin
      Touch_MessageBox('Внимание', 'Ошибка фискальной памяти!', MB_OK or MB_ICONEXCLAMATION);
      exit;
    end;
    if GetDeviceInfo(13) = 1 then
    begin
      Touch_MessageBox('Внимание', 'Ошибка в фискальной операции!', MB_OK or MB_ICONEXCLAMATION);
      exit;
    end;
    if GetDeviceInfo(14) = 1 then
    begin
      Touch_MessageBox('Внимание', 'Превышение лимита времени смены (24 часа)!', MB_OK or MB_ICONEXCLAMATION);
      exit;
    end;

    // если смена закрыта
    if GetDeviceInfo(4) = 0 then
    begin
      // Развернутая печать налогов на чеке отключена
      Res := SetDeviceOpt(3, 0);
      ErrMessage(Res);
      // Печать на чеке «в т.ч. НДС» отключена
      Res := SetDeviceOpt(4, 0);
      ErrMessage(Res);
      // Печать на чеке ставок налогов отключена
      Res := SetDeviceOpt(5, 0);
      ErrMessage(Res);
      // Печать ставок налогов и рассчитанных налогов на X и Z отчетах отключена
      Res := SetDeviceOpt(6, 0);
      ErrMessage(Res);
      // Не использовать налоговые цепочки при начислении налогов
      Res := SetDeviceOpt(7, 0);
      ErrMessage(Res);
      // Печатать на чеке количество покупок
      Res := SetDeviceOpt(8, 1);
      ErrMessage(Res);
      // Не печатать номер отдела перед наименованием товара
      Res := SetDeviceOpt(9, 0);
      ErrMessage(Res);
      // Полная резка чека
      Res := SetDeviceOpt(10, 1);
      ErrMessage(Res);
      // Центрировать клише
      Res := SetDeviceOpt(11, 1);
      ErrMessage(Res);
      // Печатать сумму итога увеличенным по высоте шрифтом в сочетании с разделительными линиями
      Res := SetDeviceOpt(12, 1);
      ErrMessage(Res);
      // Печатать сумму итога символами двойной ширины
      Res := SetDeviceOpt(13, 1);
      ErrMessage(Res);
      // Печатать «*» перед суммой
      Res := SetDeviceOpt(14, 1);
      ErrMessage(Res);
      // Не проверять наличие денег в кассе при подсчете сдачи
      Res := SetDeviceOpt(15, 0);
      ErrMessage(Res);
      // Игнорировать состояние денежного ящика при регистрации продаж
      Res := SetDeviceOpt(18, 0);
      ErrMessage(Res);
      // Не открывать уже открытый денежный ящик
      Res := SetDeviceOpt(20, 0);
      ErrMessage(Res);
      // Счетчик покупок подсчитывает общее количество
      Res := SetDeviceOpt(21, 1);
      ErrMessage(Res);
      // Дата в формате День-Месяц-Год
      Res := SetDeviceOpt(22, 0);
      ErrMessage(Res);
      // Печатать строку - разделитель между содержимым чека и его ”обрамлением”
      Res := SetDeviceOpt(25, 1);
      ErrMessage(Res);
      // Установка текста, отображаемого в заголовке чека
      // 0	Обычный режим
      // 1	Режим отображения текста жирными буквами
      Res := SetOrderHeader(1, FrontBase.Options.CheckLine1, 0);
      ErrMessage(Res);

      Res := SetOrderHeader(2, FrontBase.Options.CheckLine2, 0);
      ErrMessage(Res);

      Res := SetOrderHeader(3, FrontBase.Options.CheckLine3, 0);
      ErrMessage(Res);

      Res := SetOrderHeader(4, FrontBase.Options.CheckLine4, 0);
      ErrMessage(Res);

      Res := SetOrderHeader(5, FrontBase.Options.CheckLine5, 0);
      ErrMessage(Res);

      Res := SetOrderHeader(6, FrontBase.Options.CheckLine6, 0);
      ErrMessage(Res);

      Res := SetOrderHeader(7, FrontBase.Options.CheckLine7, 0);
      ErrMessage(Res);

      Res := SetOrderHeader(8, FrontBase.Options.CheckLine8, 0);
      ErrMessage(Res);
      // Установка значения текстового дескриптора
      // Номер дескриптора      Содержание      Значение по умолчанию
      // 42                     Номер заказа    Заказ №
      // 80                     Обслуж. лицо    Портье
      Res := SetDescriptorText(42, 'Стол №');
      ErrMessage(Res);

      Res := SetDescriptorText(80, 'Официант:');
      ErrMessage(Res);
      // Задание параметров платежных средств
      // Spark_Cash   = 8;  Наличные
      // Spark_NoCash = 7;  Безнал
      // Spark_Credit = 1;  Карты

      Res := SetPaymentMean(Spark_Credit, 'Пласт. карта', 0, 0, 1, 1);
//      Res := SetPaymentMean(Spark_Credit, 'Пласт. карта', 0, 1, 1, 1);
      ErrMessage(Res);

      Res := SetPaymentMean(Spark_NoCash, 'Безналичные', 0, 0, 1, 0);
//      Res := SetPaymentMean(Spark_NoCash, 'Безналичные', 0, 1, 1, 1);
      ErrMessage(Res);

      Res := SetPaymentMean(Spark_Cash, 'Наличные', 0, 1, 1, 1);
//      Res := SetPaymentMean(Spark_Cash, 'Наличные', 0, 1, 1, 1);
      ErrMessage(Res);
      //открытие сессии
      Res := StartSession(FFrontBase.UserName, FFrontBase.CashNumber);
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
  FLastErr := 0;
  try
    inherited Create(AOwner);
  except
    Touch_MessageBox('Внимание', 'Не установлен драйвер для ФР ''Спарк 617ТФ''!', MB_OK or MB_ICONEXCLAMATION);
    FDriverInit := False;
  end;
  IsInit := False;

  Spark_Cash := 8;
  Spark_NoCash := 7;
  Spark_Credit := 1;
end;

destructor TSpark617Register.Destroy;
begin
  if FDriverInit and IsInit then
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
    SaveRegisters(GetRegisterInfo, FrontBase);
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
    ErrStr := GetErrorComment(Err);
    Touch_MessageBox('Внимание', ErrStr, MB_OK or MB_ICONEXCLAMATION);
    WriteLogToFile(ErrStr, FFrontBase.UserName);
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

procedure TSpark617Register.MoneyIn(const Sum: Currency);
begin
  MoneyOperation(4, Sum);
end;

procedure TSpark617Register.MoneyOut(const Sum: Currency);
begin
  MoneyOperation(5, Sum);
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

function TSpark617Register.PrintCheck(const Doc, DocLine, PayLine: TkbmMemTable;
  const FSums: TSaleSums): Boolean;
var
  Res: Integer;
  DocNumber, WaiterName: String;
  DocStr: Integer;
//  WasDiscount: Boolean;
  TotalDiscount: Currency;
  GoodName{, DiscName}: String;
  Quantity, Price, SumDiscount: Currency;
  QuantityStr: String;
  PriceStr: String;
  DoLog: Boolean;
begin
  Result := False;
  Assert(Assigned(FFrontBase), 'FrontBase not Assigned');

  DoLog := FFrontBase.DoFiscalLog;
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
      try
        DocStr := StrToInt(DocNumber);
      except
        DocStr := 0;
      end;
      WaiterName := FFrontBase.GetNameWaiterOnID(Doc.FieldByName('usr$respkey').AsInteger, False, False);
      Res := SetExtraDocData(DocStr, 0, 0, WaiterName);
      ErrMessage(Res);

      Res := StartDocument(1, 1, StrToInt(DocNumber), FFrontBase.UserName);
      if DoLog then
      begin
        WriteLogToFile('Старт чека номер ' + DocNumber, FFrontBase.UserName);
        WriteLogToFile('Переменные: наличными ' + CurrToStr(FSums.FCashSum) +
          ' безнал ' + CurrToStr(FSums.FCreditSum) +
          ' кр.карта ' + CurrToStr(FSums.FCardSum) +
          ' перс.карта ' + CurrToStr(FSums.FPersonalCardSum), FFrontBase.UserName);
      end;
      if Res <> 0 then
      begin
        ErrMessage(Res);
        CancelDocument;
        exit;
      end;

      TotalDiscount := 0;

      DocLine.First;
      while not DocLine.Eof do
      begin
        if DocLine.FieldByName('USR$NOPRINT').AsInteger <> 1 then
        begin
          GoodName := DocLine.FieldByName('GOODNAME').AsString;
          QuantityStr := CurrToStr(DocLine.FieldByName('usr$quantity').AsCurrency);
          PriceStr := CurrToStr(DocLine.FieldByName('usr$costncu').AsCurrency);
          if Length(GoodName) > 35 then
            Delete(GoodName, 36, Length(GoodName))
          else
          begin
            while Length(GoodName) < 34 do
              GoodName := GoodName + ' ';
            GoodName := GoodName + '.';
          end;
          GoodName := GoodName + QuantityStr + 'x' + PriceStr;

          Quantity := 1000;
          Price := DocLine.FieldByName('usr$sumncu').AsCurrency;
          SumDiscount := DocLine.FieldByName('usr$sumncu').AsCurrency -
            DocLine.FieldByName('usr$sumncuwithdiscount').AsCurrency;
          TotalDiscount := TotalDiscount + SumDiscount;

          if Quantity >= 0 then
          begin
            Res := Item(Round(Quantity), Round(Price), GoodName, 0);
            if DoLog then
              WriteLogToFile('Добавление товара ' + GoodName + ' кол-во ' +
                CurrToStr(Quantity) + ' цена ' + CurrToStr(Price), FFrontBase.UserName);
            if Res <> 0 then
            begin
              ErrMessage(Res);
              CancelDocument;
              exit;
            end;
          end;

          if (SumDiscount > 0) then
          begin
            Res := AbsoluteCorrectionText(-Round(SumDiscount), '');
            if DoLog then
              WriteLogToFile('Корректировка суммы ' + CurrToStr(-Round(SumDiscount)), FFrontBase.UserName);
            if Res <> 0 then
            begin
              ErrMessage(Res);
              CancelDocument;
              if DoLog then
                WriteLogToFile('Отмена документа строка 411', FFrontBase.UserName);
              exit;
            end;
          end;
        end;
        DocLine.Next;
      end;

      // кредитная карта
      if FSums.FCardSum > 0 then
      begin
        Res := Tender2(FSums.FCardSum, Spark_Credit, '', '');
        if DoLog then
          WriteLogToFile('Сумма по кредитной карте ' + CurrToStr(FSums.FCardSum) +
            ' счетчик ' + IntToStr(Spark_Credit), FFrontBase.UserName);
        if Res <> 0 then
        begin
          ErrMessage(Res);
          Res := CancelDocument;
          if DoLog then
            WriteLogToFile('Отмена документа строка 428', FFrontBase.UserName);
          if Res = 0 then
            exit;
        end;
      end;
      // Безнал
      if (FSums.FCreditSum + FSums.FPersonalCardSum) > 0 then
      begin
        Res := Tender2(FSums.FCreditSum + FSums.FPersonalCardSum, Spark_NoCash, '', '');
        if DoLog then
          WriteLogToFile('Сумма по безналу ' + CurrToStr(FSums.FCreditSum + FSums.FPersonalCardSum) +
            ' счетчик ' + IntToStr(Spark_NoCash), FFrontBase.UserName);
        if Res <> 0 then
        begin
          ErrMessage(Res);
          Res := CancelDocument;
          if DoLog then
            WriteLogToFile('Отмена документа строка 443', FFrontBase.UserName);
          if Res = 0 then
            exit;
        end;
      end;
      Res := GetDeviceInfo(102);   //проверяем документ еще открыт ?
      if Res <> 0 then
      begin
        // наличные
        if FSums.FCashSum > 0 then
        begin
          Res := Tender2(FSums.FCashSum, Spark_Cash, '', '');
          if DoLog then
            WriteLogToFile('Сумма наличными ' + CurrToStr(FSums.FCashSum) +
              ' счетчик ' + IntToStr(Spark_Cash), FFrontBase.UserName);
          if Res <> 0 then
          begin
            ErrMessage(Res);
            Res := CancelDocument;
            if DoLog then
              WriteLogToFile('Отмена документа строка 461', FFrontBase.UserName);
            if Res = 0 then
              exit;
          end;
        end;

        Res := EndDocument;
        if DoLog then
          WriteLogToFile('Закрытие фискального документа', FFrontBase.UserName);
//        if Res = 0 then
//        begin
//          Res := GetDeviceInfo(102);
//          if Res <> 0 then
//          begin
//            WriteLogToFile('Документ остался открытым! Строка 472, код ' + IntToStr(Res), FFrontBase.UserName);
//            StartDocument(1, 1, StrToInt(DocNumber), FFrontBase.UserName);
//            Res := CancelDocument;
//            WriteLogToFile('Создание чека отмены ', FFrontBase.UserName);
//          end
//        end;
      end;
      if Res = 0 then
        Result := True
      else begin
        ErrMessage(Res);
        Res := GetDeviceInfo(102);
        if DoLog then
          WriteLogToFile('Документ остался открытым! Строка 486, код ' + IntToStr(Res), FFrontBase.UserName);
        if Res = 0 then
          Result := True
        else begin
          Res := EndDocument;
          if DoLog then
            WriteLogToFile('Закрытие фискального документа, строка 491', FFrontBase.UserName);
          if Res <> 0 then
          begin
            ErrMessage(Res);
            Res := GetDeviceInfo(102);
          end;

          if Res <> 0 then
          begin
            if DoLog then
              WriteLogToFile('Документ остался открытым! Строка 496, код ' + IntToStr(Res), FFrontBase.UserName);
            ErrMessage(Res);
            Res := EndDocument;
            if DoLog then
              WriteLogToFile('Закрытие фискального документа, строка 503', FFrontBase.UserName);
            if Res = 0 then
              Result := True
            else begin
              Res := GetDeviceInfo(102);
              if Res <> 0 then
              begin
                if DoLog then
                  WriteLogToFile('Документ остался открытым! Строка 508, код ' + IntToStr(Res), FFrontBase.UserName);
                CancelDocument;
                if DoLog then
                  WriteLogToFile('Создание чека отмены, строка 512 ', FFrontBase.UserName);
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
        try
          SavePayment(FFrontBase.ContactKey, Doc.FieldByName('ID').AsInteger,
            PayLine, FFrontBase, FSums);
        except
          {TODO: Issue 50}
        end;
        Doc.Post;
      end;
    end else
      Touch_MessageBox('Внимание', 'Ошибка инициализации ФР ''Спарк 617ТФ''!', MB_OK or MB_ICONEXCLAMATION);
  end else
    Touch_MessageBox('Внимание', 'Не установлен драйвер для ФР ''Спарк 617ТФ''!', MB_OK or MB_ICONEXCLAMATION);
end;

function TSpark617Register.PrintZ1ReportWithCleaning: Boolean;
var
  Res: Integer;
begin
  Result := False;
  if FDriverInit then
  begin
    Init;

    SaveRegisters(GetRegisterInfo, FrontBase);

    Res := PrintReport(3);
    if Res = 0 then
      Result := True
    else
      ErrMessage(Res);

    CheckDeviceInfo;
  end;
end;

function TSpark617Register.ReturnCheck(const Doc, DocLine,
  PayLine: TkbmMemTable; const FSums: TSaleSums): Boolean;
var
  Res: Integer;
  DocNumber, WaiterName: String;
  DocStr: Integer;
//  WasDiscount: Boolean;
  TotalDiscount: Currency;
  GoodName{, DiscName}: String;
  Quantity, Price, SumDiscount: Currency;
  QuantityStr: String;
  PriceStr: String;
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
      try
        DocStr := StrToInt(DocNumber);
      except
        DocStr := 0;
      end;
      WaiterName := FFrontBase.GetNameWaiterOnID(Doc.FieldByName('usr$respkey').AsInteger, False, False);
      Res := SetExtraDocData(DocStr, 0, 0, WaiterName);
      ErrMessage(Res);

      Res := StartDocument(2, 1, StrToInt(DocNumber), FFrontBase.UserName);
      if Res <> 0 then
      begin
        ErrMessage(Res);
        CancelDocument;
        exit;
      end;

      TotalDiscount := 0;

      DocLine.First;
      while not DocLine.Eof do
      begin
        GoodName := DocLine.FieldByName('GOODNAME').AsString;
        QuantityStr := CurrToStr(-DocLine.FieldByName('usr$quantity').AsCurrency);
        PriceStr := CurrToStr(DocLine.FieldByName('usr$costncu').AsCurrency);
        if Length(GoodName) > 35 then
          Delete(GoodName, 36, Length(GoodName))
        else
        begin
          while Length(GoodName) < 34 do
            GoodName := GoodName + ' ';
          GoodName := GoodName + '.';
        end;
        GoodName := GoodName + QuantityStr + 'x' + PriceStr;

        Quantity := 1000;
        Price := -DocLine.FieldByName('usr$sumncu').AsCurrency;
        SumDiscount := -DocLine.FieldByName('usr$sumncu').AsCurrency +
          DocLine.FieldByName('usr$sumncuwithdiscount').AsCurrency;
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
        end;

        if (SumDiscount > 0) then
        begin
          Res := AbsoluteCorrectionText(-Round(SumDiscount), '');
          if Res <> 0 then
          begin
            ErrMessage(Res);
            CancelDocument;
            exit;
          end;
        end;
        DocLine.Next;
      end;

      // кредитная карта
      if FSums.FCardSum > 0 then
      begin
        Res := Tender2(FSums.FCardSum, Spark_Credit, '', '');
        if Res <> 0 then
        begin
          ErrMessage(Res);
          Res := CancelDocument;
          if Res = 0 then
            exit;
        end;
      end;
      // Безнал
      if (FSums.FCreditSum + FSums.FPersonalCardSum) > 0 then
      begin
        Res := Tender2(FSums.FCreditSum + FSums.FPersonalCardSum, Spark_NoCash, '', '');
        if Res <> 0 then
        begin
          ErrMessage(Res);
          Res := CancelDocument;
          if Res = 0 then
            exit;
        end;
      end;
      Res := GetDeviceInfo(102);   //проверяем документ еще открыт ?
      if Res <> 0 then
      begin
        // наличные
        if FSums.FCashSum > 0 then
        begin
          Res := Tender2(FSums.FCashSum, Spark_Cash, '', '');
          if Res <> 0 then
          begin
            ErrMessage(Res);
            Res := CancelDocument;
            if Res = 0 then
              exit;
          end;
        end;

        Res := EndDocument;
//        if Res = 0 then
//        begin
//          Res := GetDeviceInfo(102);
//          if Res <> 0 then
//          begin
//            WriteLogToFile('Документ остался открытым! Строка 472, код ' + IntToStr(Res), FFrontBase.UserName);
//            StartDocument(1, 1, StrToInt(DocNumber), FFrontBase.UserName);
//            Res := CancelDocument;
//            WriteLogToFile('Создание чека отмены ', FFrontBase.UserName);
//          end
//        end;
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
        try
          SavePayment(FFrontBase.ContactKey, Doc.FieldByName('ID').AsInteger,
            PayLine, FFrontBase, FSums);
        except
          {TODO: Issue 50}
        end;
        Doc.Post;
      end;
    end else
      Touch_MessageBox('Внимание', 'Ошибка инициализации ФР ''Спарк 617ТФ''!', MB_OK or MB_ICONEXCLAMATION);
  end else
    Touch_MessageBox('Внимание', 'Не установлен драйвер для ФР ''Спарк 617ТФ''!', MB_OK or MB_ICONEXCLAMATION);
end;

function TSpark617Register.ReturnGoodMoney(const FSums: TSaleSums): Boolean;
var
  Res: Integer;
begin
  Result := False;
  Assert(Assigned(FFrontBase), 'FrontBase not Assigned');

  if FDriverInit then
  begin
    if Init then
    begin
      SetClerk(FFrontBase.UserName);

      Res := StartDocument(6, 1, 0, FFrontBase.UserName);
      if Res <> 0 then
      begin
        ErrMessage(Res);
        CancelDocument;
        exit;
      end;
      // кредитная карта
      if FSums.FCardSum > 0 then
      begin
        Res := Tender2(FSums.FCardSum, Spark_Credit, '', '');
        if res <> 0 then
        begin
          ErrMessage(Res);
          Res := CancelDocument;
          if Res = 0 then
            exit;
        end;
      end;
      // Безнал
      if (FSums.FCreditSum + FSums.FPersonalCardSum) > 0 then
      begin
        Res := Tender2(FSums.FCreditSum + FSums.FPersonalCardSum, Spark_NoCash, '', '');
        if res <> 0 then
        begin
          ErrMessage(Res);
          Res := CancelDocument;
          if Res = 0 then
            exit;
        end;
      end;
      Res := GetDeviceInfo(102);   //проверяем документ еще открыт ?
      if Res <> 0 then
      begin
        // наличные
        if FSums.FCashSum > 0 then
        begin
          Res := Tender2(FSums.FCashSum, Spark_Cash, '', '');
          if res <> 0 then
          begin
            ErrMessage(Res);
            Res := CancelDocument;
            if Res = 0 then
              exit;
          end;
        end;

        Res := EndDocument;
        if Res = 0 then
        begin
          Res := GetDeviceInfo(102);
          if Res <> 0 then
          begin
            ErrMessage(Res);
            Res := CancelDocument;
          end
        end;
      end;
      if Res = 0 then
        Result := True;

      CheckDeviceInfo;
    end;
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

    Res := PrintReport(1);
    if Res = 0 then
      Result := True
    else
      ErrMessage(Res);

    CheckDeviceInfo;
  end;
end;

function TSpark617Register.SetParams: Boolean;
var
  Res: Integer;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not Assigned');

  Result := False;

  if not FFrontBase.Options.PrintFiscalChek then
    Res := SetAccessKey('000000')
  else
    Res := SetAccessKey('111111');
  ErrMessage(Res);

  Res := SetDeviceOpt(1, FFrontBase.FiscalComPort);
  ErrMessage(Res);

  Res := SetDeviceOpt(2, 0);
  ErrMessage(Res);

  Res := InitDevice;
  if Res <> 0 then
  begin
    if (Res = 20) and (FLastErr = 20) then
      //Требуется снятие Z1-отчета (принтер заблокирован)
    else
      ErrMessage(Res);

    if Res = 20 then
      FLastErr := 20
    else
      FLastErr := 0;
    exit;
  end;
  FLastErr := 0;
  Result := True;
end;

procedure TSpark617Register.SetFrontBase(const Value: TFrontBase);
begin
  FFrontBase := Value;
  if FFrontBase <> nil then
  begin
    Spark_Cash := FFrontBase.Options.SparkCash;
    Spark_NoCash := FFrontBase.Options.SparkNoCash;
    Spark_Credit := FFrontBase.Options.SparkCredit;
  end;
end;

function TSpark617Register.GetFrontBase: TFrontBase;
begin
  Result := FFrontBase;
end;

function TSpark617Register.GetRegisterInfo: TRegisterStucture;

  function GetRegister(const RegNumber: Integer): Currency;
  begin
    try
      Result := GetDoubleDeviceInfo(RegNumber);
    except
      Result := 0;
    end;
  end;

begin
  Result.Summ1 := GetRegister((300 + Spark_Cash));
  Result.Summ2 := GetRegister((300 + Spark_NoCash));
  Result.Summ3 := GetRegister((300 + Spark_Credit));
  Result.Summ4 := 0;
  Result.SummReturn1 := GetRegister(312);
  Result.SummReturn2 := 0;
  Result.SummReturn3 := 0;
  Result.SummReturn4 := 0;
  Result.PayInSumm := GetRegister(320);
  Result.PayOutSumm := GetRegister(322);
  Result.RNM := GetTextDeviceInfo(22);
end;

function TSpark617Register.Get_Self: Integer;
begin
  Result := Integer(Self);
end;

procedure TSpark617Register.MoneyOperation(const Param: Integer; Sum: Currency);
var
  Res: Integer;
begin
  if FDriverInit then
  begin
    Init;
    Res := StartDocument(Param, 1, 0, FFrontBase.UserName);
    if Res <> 0 then
      ErrMessage(Res);
    Res := Tender2(Sum, 8, '', '');
    if Res <> 0 then
      ErrMessage(Res);
    Res := EndDocument;
    if Res <> 0 then
      ErrMessage(Res);
    CheckDeviceInfo;
  end;
end;

function TSpark617Register.OpenDay: Boolean;
begin
 { TODO : В спарке открытие смены происходит в CheckDeviceInfo (StartSession)
   возможно стоит вынести в отдельную ф-цию и проверять}
  Result := True;
end;

end.
