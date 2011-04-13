unit Report_Unit;

interface

uses
  Classes, Front_DataBase_Unit, Printers, SysUtils, ComCtrls, ExtCtrls, frxOLE,
  frxDesgn, frxClass, frxDCtrl, frxChart, frxRich, frxBarcode, ImgList,
  frxCross, frxDMPExport, frxExportRTF, frxGZip, frxChBox,
  frxExportText, frxPrinter, Dialogs, frxDBSet, frxPreview, frxIBXComponents,
  IBQuery, kbmMemTable, DB, Variants, Base_FiscalRegister_unit;

type
  Tgs_fr4Report = class(TfrxReport)
  private
    //Фильтры экспорта
    FrxRTFExport:  TfrxRTFExport;
    FrxSimpleTextExport: TfrxSimpleTextExport;
    FrxDMPExport:  TfrxDotMatrixExport;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  //класс обёртка для совместимости
  Tgs_fr4SingleReport = class(Tgs_fr4Report);

{
  Класс для работы с FR4
  будет иметь ф-ции:
  - распечатать пречек
  - распечатать сервисный чек
  - распечатать чек отмены
  будет формировать для стандартных отчётов наборы данных
  для возможности редактирования будет добавлять переменные в FR4 для
  ручного создания отчётов
  должен иметь функции загрузить шаблон и сохранить шаблон
  ф-ция загрузки шаблона должна иметь возможность сохранять шаблоны в список
  для быстрого доступа, при редактировнии список должен уничтожаться

  1.	Пречек
  1.1.	Aura
  1.2.	Epson подкладной (протестировать многостраничный отчет)
  1.3.	Epson с обрезкой
  2.	Сервисный чек
  2.1.	Aura
  2.2.	Epson с обрезкой
  3.	Реестр счетов
  3.1.	Aura
  3.2.	Epson с обрезкой

}
  TRestReport = class(TObject)
  private
    FFrontBase: TFrontBase;
    procedure GetTemplateStreamByRuid(const XID: Integer;
      const DBID: Integer;var Stream: TStream);

    procedure SaveTemplateStreamByRuid(const XID: Integer;
      const DBID: Integer;var Stream: TStream);

    procedure InitReportParams(const FReport: Tgs_fr4SingleReport;
      const PrinterName: String);

  public
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;

    function PrintPreCheck(const ReportType, DocID: Integer): Boolean;
    procedure PrintAfterSalePreCheck(const DocID: Integer; const FSums: TSaleSums);
    function PrintServiceCheck(const ReportType, PrnGrID, DocID: Integer; const PrinterName: String): Boolean;
    function PrintDeleteServiceCheck(const ReportType, PrnGrID, DocumentKey, MasterKey: Integer;
      const PrinterName: String): Boolean;
    procedure PrintIncomeReport(const DateBegin, DateEnd: TDate);
    procedure PrintCheckRegister(const DateBegin, DateEnd: TDate);
    function EditTemplate(const ID: Integer): Boolean;

    property FrontBase: TFrontBase read FFrontBase write FFrontBase;
  end;

const
  cn_RestParam = 'RestParam';

implementation

uses
  Windows, Forms, FrontData_Unit, obj_QueryList, TouchMessageBoxForm_Unit;

{ Tgs_fr4Report }

constructor Tgs_fr4Report.Create(AOwner: TComponent);
begin
  inherited;

  FrxRTFExport  := TfrxRTFExport.Create(Self);
  FrxSimpleTextExport := TfrxSimpleTextExport.Create(Self);
  FrxDMPExport  := TfrxDotMatrixExport.Create(Self);
end;

destructor Tgs_fr4Report.Destroy;
begin
  FrxRTFExport.Free;
  FrxSimpleTextExport.Free;
  FrxDMPExport.Free;

  inherited;
end;

{ Tgs_fr4SingleReport }


{ TRestReport }

constructor TRestReport.Create(AOwner: TComponent);
begin
  inherited Create;
end;

destructor TRestReport.Destroy;
begin
  inherited;
end;

function TRestReport.EditTemplate(const ID: Integer): Boolean;
var
  FReport: Tgs_fr4SingleReport;
  Str: TStream;
begin
  Result := False;
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  FReport := Tgs_fr4SingleReport.Create(nil);
  Str := TMemoryStream.Create;
  try
    FFrontBase.GetReportTemplate(Str, ID);
    if Str.Size > 0 then
    begin
      Str.Position := 0;
      FReport.LoadFromStream(Str);
    end;
    FReport.DesignReport;

    if Touch_MessageBox('Внимание', 'Сохранить шаблон?', MB_YESNO, mtConfirmation) = IDYES then
    begin
      Str.Position := 0;
      Str.Size := 0;
      FReport.Variables.Clear;
      FReport.SaveToStream(Str);
      Str.Position := 0;
      FFrontBase.SaveReportTemplate(Str, ID);
    end;
  finally
    FReport.Free;
    Str.Free;
  end;
end;

procedure TRestReport.GetTemplateStreamByRuid(const XID, DBID: Integer;
  var Stream: TStream);
var
  ID: Integer;
begin
  ID := FFrontBase.GetIDByRUID(XID, DBID);

  Assert(ID <> -1, 'Invalid template RUID');

  FFrontBase.GetReportTemplate(Stream, ID);
end;

procedure TRestReport.InitReportParams(const FReport: Tgs_fr4SingleReport;
  const PrinterName: String);
begin
  if PrinterName > '' then
    FReport.PrintOptions.Printer := PrinterName;
  FReport.PrintOptions.ShowDialog := False;
  FReport.PrintOptions.PageNumbers := '';
  FReport.PrintOptions.Copies := 1;
  FReport.PrintOptions.Collate := True;
  FReport.PrintOptions.PrintPages := ppAll;
end;

procedure TRestReport.PrintAfterSalePreCheck(const DocID: Integer;
  const FSums: TSaleSums);
var
  PrinterName: String;
  FReport: Tgs_fr4SingleReport;
  Str: TStream;
  BaseQueryList: TgsQueryList;
  Header{, Sells}: TgsDataSet;
  FrxDBDataset, FrxDBDataset1: TfrxDBDataset;
  MemTable: TkbmMemTable;
  I: Integer;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  PrinterName := FFrontBase.GetPrinterName;
  if PrinterName = '' then
  begin
    Touch_MessageBox('Внимание', 'Для данной рабочей станции не указан пречековый принтер!', MB_OK, mtWarning);
    exit;
  end;

  BaseQueryList := FrontData.BaseQueryList;
  BaseQueryList.Clear;
  FReport := Tgs_fr4SingleReport.Create(nil);
  try
    Str := TMemoryStream.Create;
    FrxDBDataset := TfrxDBDataset.Create(nil);
    FrxDBDataset1 := TfrxDBDataset.Create(nil);
    MemTable := TkbmMemTable.Create(nil);
    MemTable.Name := 'HEADER';
    try
      Header := BaseQueryList.Query[BaseQueryList.Add('Header2', False)];
      Header.SQL :=
 {       '  SELECT comp.name compname, comp.address compadr, comp.city compcity, ' +
        '  g.alias a, cat.usr$name categ, g.name goodname, ol.usr$costncu C, ' +
        '  con.name conname, o.usr$logicdate docdate, doc.number docnum, ' +
        '  o.usr$guestcount guest, o.usr$timeorder open1, o.usr$timecloseorder close1, ' +
        '  o.usr$cash cash, o.usr$sysnum sysnum, ' +
        '  SUM(ol.usr$sumncu) S, ' +
        '  SUM(ol.usr$sumncuwithdiscount) SWD, ' +
        '  SUM(ol.usr$sumdiscount) SD, ' +
        '  Sum(ol.usr$quantity) q ' +
        '  FROM gd_document doc ' +
        '  JOIN usr$mn_order o ON o.documentkey = doc.id ' +
        '    AND doc.id = :dockey ' +
        '  JOIN usr$mn_orderline ol on ol.masterkey = o.documentkey ' +
        '  JOIN gd_good g ON g.id = ol.usr$goodkey ' +
        '  LEFT JOIN gd_contact comp ON comp.id = doc.companykey ' +
        '  LEFT JOIN usr$mn_p_getcontact_department(usr$respkey) cd ON 0 = 0 ' +
        '  LEFT JOIN gd_contact con ON con.id = cd.peoplekey ' +
        '  LEFT JOIN gd_contact dept ON dept.id = cd.departmentkey ' +
        '  LEFT JOIN USR$mn_category cat ON cat.id = g.usr$category ' +
        '  where ol.usr$causedeletekey + 0 is null ' +
        '  GROUP BY ' +
        '  comp.name, comp.address, comp.city, ' +
        '  g.name, g.alias, ol.usr$costncu, ' +
        '  con.name, o.usr$logicdate, doc.number, ' +
        '  o.usr$guestcount, o.usr$timeorder, o.usr$timecloseorder, ' +
        '  o.usr$cash, usr$sysnum, cat.usr$name ' +
        '  having Sum(ol.usr$quantity) > 0 ' +
        '  order by cat.usr$name '; }
      '  SELECT comp.name compname, comp.address compadr, comp.city compcity,  ' +
      '  g.alias a, g.name goodname, ol.usr$costncu C, ' +
      '  con.name conname, doc.documentdate as docdate, doc.number docnum, ' +
      '  o.usr$guestcount guest, o.usr$timeorder as open1, current_time as close1, ' +
      '  o.usr$cash cash, d.usr$surname as surname, d.usr$middlename midle, d.usr$firstname firstn, d.USR$cardnum cardnum, ' +
      '  SUM(ol.usr$sumncu) S, ' +
      '  SUM(ol.usr$sumncuwithdiscount) SWD, ' +
      '  SUM(ol.usr$sumdiscount) SD, ' +
      '  Sum(ol.usr$quantity) q  ' +
      '  FROM gd_document doc  ' +
      '  JOIN usr$mn_order o ON o.documentkey = doc.id ' +
      '    AND doc.id = :dockey ' +
      '  JOIN usr$mn_orderline ol on ol.masterkey = o.documentkey  ' +
      '  JOIN gd_good g ON g.id = ol.usr$goodkey  ' +
      '  LEFT JOIN gd_contact comp ON comp.id = doc.companykey  ' +
      '  LEFT JOIN usr$mn_p_getcontact_department(usr$respkey) cd ON 0 = 0  ' +
      '  LEFT JOIN gd_contact con ON con.id = cd.peoplekey ' +
      '  LEFT JOIN gd_contact dept ON dept.id = cd.departmentkey  ' +
      '  left join usr$mn_discountcard d on d.id = o.usr$disccardkey ' +
      '  where ol.usr$causedeletekey + 0 is null ' +
      '  GROUP BY ' +
      '  comp.name, comp.address, comp.city, ' +
      '  g.name, g.alias, ol.usr$costncu, ' +
      '  con.name, doc.documentdate, doc.number,  ' +
      '  o.usr$guestcount, o.usr$timeorder, o.usr$timecloseorder, ' +
      '  o.usr$cash, d.usr$surname, d.usr$middlename, d.usr$firstname, d.USR$cardnum  ' +
      '  having Sum(ol.usr$quantity) > 0 ';

      Header.ParamByName('dockey').AsInteger := DocID;
      Header.Open;



        MemTable.CreateTableAs(Header.DataSet, [mtcpoStructure]);
        MemTable.FieldDefs.Add('NOW', ftDate, 0);
        MemTable.FieldDefs.Add('NOWTIME', ftTime, 0);
        MemTable.FieldDefs.Add('COMPRESSEDON', ftString, 5);
        MemTable.FieldDefs.Add('RUSPAGE', ftString, 5);
        MemTable.FieldDefs.Add('CUTPAGE', ftString, 15);
        MemTable.FieldDefs.Add('DISKN', ftString, 60);
        MemTable.CreateTable;
        MemTable.Open;

        Header.First;
        while not Header.Eof do
        begin
          MemTable.Append;
          I := 0;
          while I <= Header.FieldCount - 1 do
          begin
            MemTable.Fields[I].AsString := Header.Fields[I].AsString;
            Inc(I);
          end;

          MemTable.FieldbyName('NOW').AsDateTime := Date;
          MemTable.FieldbyName('NOWTIME').AsDateTime := Time;
          MemTable.FieldByName('COMPRESSEDON').AsVariant := ''; // 'chr(&H1D) + CHR(&H56) + CHR(&H01)
          MemTable.FieldByName('RUSPAGE').AsVariant := '';
          if Header.FieldByName('surname').AsString <> '' then
            MemTable.FieldByNAme('DISKN').AsString := 'Карточка:' + Header.FieldByName('cardnum').AsString +
              #13#10 + Header.FieldByName('surname').AsString + ' ' +
              Header.FieldByName('firstn').AsString + ' ' + Header.FieldByName('midle').AsString;

          MemTable.Post;

          Header.Next;
        end;

 {     Sells := BaseQueryList.Query[BaseQueryList.Add('Sells', True)];
      Sells.AddField('PayType1', 'ftString', 15, False);
      Sells.AddField('PaySum1', 'ftString', 15, False);
      Sells.AddField('ChangeSum', 'ftString', 15, False);
      Sells.AddField('NOW', 'ftDate', 0, False);
      Sells.AddField('NOWTIME', 'ftTime', 0, False);
      Sells.Open;
      with FSums do
      begin
        if FCashSum > 0 then
        begin
          Sells.Append;
          Sells.FieldByName('PayType1').AsString := 'Наличные';
          Sells.FieldByName('PaySum1').AsString := CurrToStr(FCashSum);
          Sells.FieldByName('ChangeSum').AsString := CurrToStr(FChangeSum);
          Sells.FieldByName('NOW').AsDateTime := Date;
          Sells.FieldByName('NOWTIME').AsDateTime := Now;
          Sells.Post;
        end;
        if (FCreditSum + FPersonalCardSum) > 0 then
        begin
          Sells.Append;
          Sells.FieldByName('PayType1').AsString := 'Безналичные';
          Sells.FieldByName('PaySum1').AsString := CurrToStr(FCreditSum + FPersonalCardSum);
          Sells.FieldByName('ChangeSum').AsString := CurrToStr(FChangeSum);
          Sells.FieldByName('NOW').AsDateTime := Date;
          Sells.FieldByName('NOWTIME').AsDateTime := Now;
          Sells.Post;
        end;
        if FCardSum > 0 then
        begin
          Sells.Append;
          Sells.FieldByName('PayType1').AsString := 'Карта';
          Sells.FieldByName('PaySum1').AsString := CurrToStr(FCardSum);
          Sells.FieldByName('ChangeSum').AsString := CurrToStr(FChangeSum);
          Sells.FieldByName('NOW').AsDateTime := Date;
          Sells.FieldByName('NOWTIME').AsDateTime := Now;
          Sells.Post;
        end;
      end;      }


      FrxDBDataset.Name := Header.DataSet.Name;
      FrxDBDataset.DataSet := TDataSet(Header.DataSet);

      FrxDBDataset1.Name := MemTable.Name;
      FrxDBDataset1.DataSet := TDataSet(MemTable);

      FReport.DataSets.Add(FrxDBDataset);
      FReport.DataSets.Add(FrxDBDataset1);
      FReport.EnabledDataSets.Add(FrxDBDataset);
      FReport.EnabledDataSets.Add(FrxDBDataset1);

      GetTemplateStreamByRuid(147733973, 1604829035, Str);
      if Str.Size > 0 then
      begin
        Str.Position := 0;
        FReport.LoadFromStream(Str);
      end;
      FReport.Variables.Clear;
      FReport.Variables[' ' + cn_RestParam] := Null;
      FReport.Variables.AddVariable(cn_RestParam, 'DocID', '''' + VarToStr(DocID) + '''');
      if FReport.PrepareReport then
      begin
        InitReportParams(FReport, PrinterName);
        FReport.Print;
      end;

    finally
      MemTable.Free;
      FrxDBDataset.Free;
      FrxDBDataset1.Free;
      Str.Free;
    end;
  finally
    FReport.Free;
  end;
end;

procedure TRestReport.PrintCheckRegister(const DateBegin, DateEnd: TDate);
var
  PrinterName: String;
  FReport: Tgs_fr4SingleReport;
  Str: TStream;
  BaseQueryList: TgsQueryList;
  Header: TgsDataSet;
  FrxDBDataset: TfrxDBDataset;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  BaseQueryList := FrontData.BaseQueryList;
  BaseQueryList.Clear;
  PrinterName := FFrontBase.GetPrinterName;
  FReport := Tgs_fr4SingleReport.Create(nil);
  try
    Str := TMemoryStream.Create;
    FrxDBDataset := TfrxDBDataset.Create(nil);
    try
      Header := BaseQueryList.Query[BaseQueryList.Add('Header', False)];
      Header.SQL :=
        ' SELECT w.name, w.id, o.usr$sysnum, com.name as company, sum(ol.usr$sumncuwithdiscount) sumcheck ' +
        ' FROM usr$mn_order o ' +
        ' JOIN usr$mn_orderline ol on o.documentkey = ol.masterkey ' +
        ' left join gd_contact w on w.id = o.usr$respkey ' +
        ' left join gd_document doc on doc.id = o.documentkey ' +
        ' left join gd_contact com on com.id = doc.companykey ' +
        ' WHERE ' +
        '  o.usr$logicdate >= :begindate ' +
        '  and o.usr$logicdate <= :enddate and ol.usr$causedeletekey + 0 is NULL and ol.usr$quantity > 0 ' +
        '  and exists (SELECT * FROM usr$mn_payment p where p.usr$orderkey = o.documentkey and p.usr$paykindkey = :paykind ) ' +
        ' GROUP BY 1,3,2,4 ' +
        ' ORDER BY ' +
        ' w.name, o.usr$sysnum ';
      Header.ParamByName('begindate').AsDate := DateBegin;
      Header.ParamByName('enddate').AsDate := DateEnd;
      Header.ParamByName('paykind').AsInteger := FFrontBase.GetIDByRUID(mn_RUBpaytypeXID, mn_RUBpaytypeDBID);
      Header.Open;

      FrxDBDataset.Name := Header.DataSet.Name;
      FrxDBDataset.DataSet := TDataSet(Header.DataSet);
      FReport.DataSets.Add(FrxDBDataset);
      FReport.EnabledDataSets.Add(FrxDBDataset);

      GetTemplateStreamByRuid(147733800, 1604829035, Str);
      if Str.Size > 0 then
      begin
        Str.Position := 0;
        FReport.LoadFromStream(Str);
      end;

      FReport.Variables.Clear;
      FReport.Variables[' ' + cn_RestParam] := Null;
      FReport.Variables.AddVariable(cn_RestParam, 'PARAM0', '''' + DateToStr(DateBegin) + '''');
      FReport.Variables.AddVariable(cn_RestParam, 'PARAM1', '''' + DateToStr(DateEnd) + '''');
      if FReport.PrepareReport then
        FReport.ShowPreparedReport;

    finally
      FrxDBDataset.Free;
      Str.Free;
    end;
  finally
    FReport.Free;
  end;
end;

function TRestReport.PrintDeleteServiceCheck(const ReportType, PrnGrID,
  DocumentKey, MasterKey: Integer; const PrinterName: String): Boolean;
var
  FReport: Tgs_fr4SingleReport;
  Str: TStream;
  BaseQueryList: TgsQueryList;
  FfrxDBDataset: TfrxDBDataset;
  S: String;
  Header: TgsDataSet;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');
  BaseQueryList := FrontData.BaseQueryList;
  BaseQueryList.Clear;
  FReport := Tgs_fr4SingleReport.Create(nil);
  try
    try
      Str := TMemoryStream.Create;
      FfrxDBDataset := TfrxDBDataset.Create(nil);
      try
        Header := BaseQueryList.Query[BaseQueryList.Add('HEADER', False)];
        S :=
          'select ' +
          '  doc.documentdate, doc.number as NUM, ' +
          '  comp.name compname,  ' +
          '  o.usr$guestcount guest, ' +
          '  con.name conname, o.usr$timeorder as open1,  ' +
          '  ol.documentkey,                              ' +
          '  g.alias, g.name as goodname,                 ' +
          '  prngr.usr$name as prngroupname,              ' +
          '  ol.usr$quantity as q,                        ' +
          '  setprn.usr$printername as printername,       ' +
          '  cause.usr$name as cn                         ' +
          'from                                           ' +
          '  gd_document doc                              ' +
          '  join usr$mn_order o on doc.id = o.documentkey and doc.id = :docid  ' +
          '  join usr$mn_orderline ol on o.documentkey = ol.masterkey ' +
          '    and ol.documentkey = :lineID                           ' +
          '  join gd_document docl on docl.id = ol.documentkey        ' +
          '  join gd_good g on g.id = ol.usr$goodkey                  ' +
          '  join usr$mn_prngroup prngr on prngr.id = g.usr$prngroupkey   ' +
          '  join usr$mn_prngroupset setprn on setprn.usr$prngroup = prngr.id   ' +
          '  JOIN gd_contact comp ON comp.id = doc.companykey                   ' +
          '  JOIN USR$MN_CAUSEDELETEORDERLINE cause on cause.id = ol.usr$causedeletekey  ' +
          '  LEFT JOIN usr$mn_p_getcontact_department(o.usr$respkey) cd ON 0 = 0  ' +
          '  LEFT JOIN gd_contact con ON con.id = cd.peoplekey        ' +
          '  LEFT JOIN gd_contact dept ON dept.id = cd.departmentkey  ' +
          'where                                                      ' +
          '  setprn.usr$printername = :printername                    ' +
          '  and ol.usr$causedeletekey is not null                    ' +
          '  and setprn.usr$computername = :COMP                      ' +
          '  and setprn.usr$kassa = 0 ';
        if PrnGrID <> 0 then
          S := S + '  and prngr.id = :prngrid ';
        Header.SQL := S;
        Header.ParamByName('docid').AsInteger := DocumentKey;
        Header.ParamByName('LineID').AsInteger := MasterKey;
        Header.ParambyName('printername').AsString := PrinterName;
        Header.ParambyName('comp').AsString := FFrontBase.GetLocalComputerName;
        if PrnGrID <> 0 then
          Header.ParambyName('prngrid').Value := PrnGrID;
        Header.Open;

        FfrxDBDataset.Name := Header.DataSet.Name;
        FfrxDBDataset.DataSet := TDataSet(Header.DataSet);

        FReport.DataSets.Add(FfrxDBDataset);
        FReport.EnabledDataSets.Add(FfrxDBDataset);
        GetTemplateStreamByRuid(147373760, 1033124911, Str);
        if Str.Size > 0 then
        begin
          Str.Position := 0;
          FReport.LoadFromStream(Str);
        end;
        //
        FReport.Variables.Clear;
        FReport.Variables[' ' + cn_RestParam] := Null;
        FReport.Variables.AddVariable(cn_RestParam, 'PrnGrID', '''' + VarToStr(PrnGrID) + '''');
        FReport.Variables.AddVariable(cn_RestParam, 'DocID', '''' + VarToStr(MasterKey) + '''');
        FReport.Variables.AddVariable(cn_RestParam, 'LineID', '''' + VarToStr(DocumentKey) + '''');
        FReport.Variables.AddVariable(cn_RestParam, 'PrinterName', '''' + VarToStr(PrinterName) + '''');
        if FReport.PrepareReport then
        begin
          InitReportParams(FReport, PrinterName);
          FReport.Print;
        end;
        Result := True;
      finally
        Str.Free;
        FfrxDBDataset.Free;
      end;
    except
      Result := False;
      raise;
    end;
  finally
    FReport.Free;
  end;
end;

procedure TRestReport.PrintIncomeReport(const DateBegin, DateEnd: TDate);
var
  PrinterName: String;
  FReport: Tgs_fr4SingleReport;
  Str: TStream;
  BaseQueryList: TgsQueryList;
  Q, P, Np, Comp, Header: TgsDataSet;
  I: Integer;
  FrxDBDataset: TfrxDBDataset;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  BaseQueryList := FrontData.BaseQueryList;
  BaseQueryList.Clear;
  PrinterName := FFrontBase.GetPrinterName;
  FReport := Tgs_fr4SingleReport.Create(nil);
  try
    Str := TMemoryStream.Create;
    FrxDBDataset := TfrxDBDataset.Create(nil);
    try
      Q := BaseQueryList.Query[BaseQueryList.Add('Q', False)];
      Q.SQL :=
        '    select ' +
        '    o.usr$pay, count(o.documentkey) as  countchek, ' +
        '    sum(o.usr$guestcount) as guestcount ' +
        '    from ' +
        '    usr$mn_order o ' +
        '     ' +
        '    where o.usr$logicdate >= :datebegin ' +
        '    and o.usr$logicdate <= :dateend ' +
        '    group by  o.usr$pay ' +
        '    order by o.usr$pay desc ';
      Q.ParamByName('datebegin').AsDateTime := DateBegin;
      Q.ParamByName('dateend').AsDateTime := DateEnd;
      Q.Open;
      Q.IsResult := False;

      P := BaseQueryList.Query[BaseQueryList.Add('P' , False)];
      P.SQL :=
        '    select ' +
        '      o.usr$pay, pt.usr$name as typepay, ' +
        '      kt.usr$name as kindpay, ' +
        '      sum(p.usr$sumncu) as sumpayncu ' +
        '      from ' +
        '      usr$mn_payment p ' +
        '      LEFT join usr$mn_order o on o.documentkey = p.usr$orderkey ' +
        '      LEFT join USR$MN_KINDTYPE kt on kt.id = p.usr$paykindkey ' +
        '      LEFT join USR$INV_PAYTYPE pt on pt.id = kt.usr$paytypekey ' +
        '      where o.usr$logicdate >= :datebegin ' +
        '      and o.usr$logicdate <= :dateend and o.usr$pay = 1 ' +
        '      group by o.usr$pay, kt.usr$name, pt.usr$name ';
      P.ParamByName('datebegin').AsDateTime := DateBegin;
      P.ParamByName('dateend').AsDateTime := DateEnd;
      P.Open;
      P.IsResult := False;

      Np := BaseQueryList.Query[BaseQueryList.add('Np' , False)];
      Np.SQL := ' select o.usr$pay, sum(ol.usr$sumncuwithdiscount) as sumncu from usr$mn_order o ' +
        ' join usr$mn_orderline ol on ol.masterkey = o.documentkey ' +
        '      where o.usr$logicdate >= :datebegin ' +
        '      and o.usr$logicdate <= :dateend and o.usr$pay + 0 = 0' +
        '      and ol.usr$causedeletekey + 0 is null ' +
        ' group by o.usr$pay ';
      Np.ParamByName('datebegin').AsDateTime := DateBegin;
      Np.ParamByName('dateend').AsDateTime := DateEnd;
      Np.Open;
      Np.IsResult := False;

      Comp := BaseQueryList.Query[BaseQueryList.add('Comp' , False)];
      Comp.SQL := ' select * from gd_v_company where id = :id ';
      Comp.ParamByName('id').AsInteger := FFrontBase.CompanyKey;
      Comp.Open;
      Comp.IsResult := False;

      Header := BaseQueryList.Query[BaseQueryList.Add('Header', True)];
      Header.AddField('PAY', 'ftInteger', 0, False);
      Header.AddField('c', 'FTFloat', 0, False);
      Header.AddField('g', 'FTFloat', 0, False);
      Header.AddField('t', 'FTString', 60, False);
      Header.AddField('K', 'FTString', 60, False);
      Header.AddField('p', 'FTFloat', 0, False);
      Header.AddField('np', 'FTFloat', 0, False);
      Header.AddField('PS', 'FTString', 20, False);
      Header.AddField('COMPANY', 'FtString', 60, False);
      Header.AddField('Db', 'FtDate', 0, False);
      Header.AddField('De', 'FtDate', 0, False);
      Header.AddField('Time', 'FtDateTime', 0, False);
      Header.Open;

      while not Q.eof do
      begin
        Header.Append;
        Header.FieldByNAme('COMPANY').AsString := Comp.FieldByName('compname').AsString;
        Header.FieldByNAme('Db').AsDateTime := DateBegin;
        Header.FieldByNAme('De').AsDateTime := DateEnd;
        Header.FieldByNAme('Time').AsVariant := Now;

        I := 0;
        while I <= Q.FieldCount - 1 do
        begin
          Header.Fields[I].AsString := Q.Fields[I].AsString;
          Inc(I);
        end;
        if Q.FieldByName('usr$pay').AsCurrency <> 1 then
        begin
          Header.Edit;
          Header.FieldByName('PS').AsString := 'Не опл';
        end else
        begin
          Header.Edit;
          Header.FieldByName('PS').AsString := 'Оплач';
        end;
        while not P.eof do
        begin
          Header.Append;
          Header.FieldByName('t').AsString := P.FieldByName('typepay').AsString;
          Header.FieldByName('k').AsString := P.FieldByName('kindpay').AsString;
          Header.FieldByName('p').AsCurrency := P.FieldByName('sumpayncu').AsCurrency;
          P.Next;
        end;
        if Q.FieldByName('usr$pay').AsCurrency <> 1 then
        begin
          Header.Edit;
          Header.FieldByName('p').AsCurrency := Np.FieldByName('sumncu').AsCurrency;
        end;

        Header.Post;
        Q.Next;
      end;

      FrxDBDataset.Name := Header.DataSet.Name;
      FrxDBDataset.DataSet := TDataSet(Header.DataSet);
      FReport.DataSets.Add(FrxDBDataset);
      FReport.EnabledDataSets.Add(FrxDBDataset);

      GetTemplateStreamByRuid(147733592, 1604829035, Str);
      if Str.Size > 0 then
      begin
        Str.Position := 0;
        FReport.LoadFromStream(Str);
      end;

      FReport.Variables.Clear;
      FReport.Variables[' ' + cn_RestParam] := Null;
      FReport.Variables.AddVariable(cn_RestParam, 'PARAM0', '''' + DateToStr(DateBegin) + '''');
      FReport.Variables.AddVariable(cn_RestParam, 'PARAM1', '''' + DateToStr(DateEnd) + '''');
      if FReport.PrepareReport then
      begin
        InitReportParams(FReport, PrinterName);
        FReport.ShowPreparedReport;
      end;
    finally
      FrxDBDataset.Free;
      Str.Free;
    end;
  finally
    FReport.Free;
  end;
end;

function TRestReport.PrintPreCheck(const ReportType,
  DocID: Integer): Boolean;
var
  PrinterName: String;
  FReport: Tgs_fr4SingleReport;
  Str: TStream;
  Query: TIBQuery;
  MemTable: TkbmMemTable;
  I: Integer;
  TfrxDBDataset2: TfrxDBDataset;
begin
  Result := False;

  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  PrinterName := FFrontBase.GetPrinterName;
  if PrinterName = '' then
  begin
    Touch_MessageBox('Внимание', 'Для данной рабочей станции не указан пречековый принтер!', MB_OK, mtWarning);
    exit;
  end;

  FReport := Tgs_fr4SingleReport.Create(nil);
  try

    Str := TMemoryStream.Create;
    Query := TIBQuery.Create(nil);
    MemTable := TkbmMemTable.Create(nil);
    MemTable.Name := 'HEADER';
    TfrxDBDataset2 := TfrxDBDataset.Create(nil);
    try
      if FFrontBase.GetPreCheckQuery(Query, DocID) then
      begin
        MemTable.CreateTableAs(Query, [mtcpoStructure]);
        MemTable.FieldDefs.Add('NOW', ftDate, 0);
        MemTable.FieldDefs.Add('NOWTIME', ftTime, 0);
        MemTable.FieldDefs.Add('COMPRESSEDON', ftString, 5);
        MemTable.FieldDefs.Add('RUSPAGE', ftString, 5);
        MemTable.FieldDefs.Add('CUTPAGE', ftString, 15);
        MemTable.FieldDefs.Add('DISKN', ftString, 60);
        MemTable.CreateTable;
        MemTable.Open;

        Query.First;
        while not Query.Eof do
        begin
          MemTable.Append;
          I := 0;
          while I <= Query.FieldCount - 1 do
          begin
            MemTable.Fields[I].AsString := Query.Fields[I].AsString;
            Inc(I);
          end;

          MemTable.FieldbyName('NOW').AsDateTime := Date;
          MemTable.FieldbyName('NOWTIME').AsDateTime := Time;
          MemTable.FieldByName('COMPRESSEDON').AsVariant := ''; // 'chr(&H1D) + CHR(&H56) + CHR(&H01)
          MemTable.FieldByName('RUSPAGE').AsVariant := '';
          if Query.FieldByName('surname').AsString <> '' then
            MemTable.FieldByNAme('DISKN').AsString := 'Карточка:' + Query.FieldByName('cardnum').AsString +
              #13#10 + Query.FieldByName('surname').AsString + ' ' +
              Query.FieldByName('firstn').AsString + ' ' + Query.FieldByName('midle').AsString;

          MemTable.Post;

          Query.Next;
        end;

        TfrxDBDataset2.Name := MemTable.Name;
        TfrxDBDataset2.DataSet := TDataSet(MemTable);

        FReport.DataSets.Add(TfrxDBDataset2);
        FReport.EnabledDataSets.Add(TfrxDBDataset2);

        case ReportType of
          1:
          begin
            GetTemplateStreamByRuid(147373700, 1033124911, Str);
            if Str.Size > 0 then
            begin
              Str.Position := 0;
              FReport.LoadFromStream(Str);
            end;
          end;
        end;
        //
        FReport.Variables.Clear;
        FReport.Variables[' ' + cn_RestParam] := Null;
        FReport.Variables.AddVariable(cn_RestParam, 'DocID', '''' + VarToStr(DocID) + '''');
        if FReport.PrepareReport then
        begin
          InitReportParams(FReport, PrinterName);
          FReport.Print;
        end;
        Result := True;
      end;
    finally
      Str.Free;
      Query.Free;
      MemTable.Free;
      TfrxDBDataset2.Free;
    end;
  finally
    FReport.Free;
  end;
end;

function TRestReport.PrintServiceCheck(const ReportType, PrnGrID,
  DocID: Integer; const PrinterName: String): Boolean;
var
  FReport: Tgs_fr4SingleReport;
  Str: TStream;
  Query: TIBQuery;
  MemTable: TkbmMemTable;
  I: Integer;
  Bold, EndBold,
  DOUBLESIZE, ENDDOUBLESIZE: String;
  LineKey: Integer;
  TfrxDBDataset2: TfrxDBDataset;
begin
  Result := False;

  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  FReport := Tgs_fr4SingleReport.Create(nil);
  try
    Str := TMemoryStream.Create;
    Query := TIBQuery.Create(nil);
    MemTable := TkbmMemTable.Create(nil);
    MemTable.Name := 'HEADER';
    TfrxDBDataset2 := TfrxDBDataset.Create(nil);
    try
      if FFrontBase.GetServiceCheckQuery(Query, PrnGrID, DocID, PrinterName) then
      begin
        MemTable.CreateTableAs(Query, [mtcpoStructure]);
        MemTable.FieldDefs.Add('TIME', ftTime, 0);
        MemTable.FieldDefs.Add('COMPRESSEDON', ftString, 10);
        MemTable.FieldDefs.Add('BELL', ftString, 10);
        MemTable.FieldDefs.Add('BOLD', ftString, 10);
        MemTable.FieldDefs.Add('ENDBOLD', ftString, 10);
        MemTable.FieldDefs.Add('RESET', ftString, 10);
        MemTable.FieldDefs.Add('DOUBLESIZE', ftString, 10);
        MemTable.FieldDefs.Add('ENDDOUBLESIZE', ftString, 10);
        MemTable.FieldDefs.Add('MODNAME', ftString, 60);
        MemTable.CreateTable;
        MemTable.Open;

        Bold := ''; //chr(&H1B) + CHR(&H21) + CHR(&H08)
        EndBold := ''; //chr(&H1B) + CHR(&H21) + CHR(&H80)

        DOUBLESIZE := '';  //chr(&H1B) + CHR(&H21) + CHR(&H30)
        ENDDOUBLESIZE := ''; //chr(&H1B) + CHR(&H21) + CHR(&H08)
        LineKey := 0;

        Query.First;
        while not Query.Eof do
        begin
          MemTable.Append;
          I := 0;
          while i <= Query.FieldCount - 1 do
          begin
            MemTable.Fields[i].AsString := Query.Fields[I].AsString;
            if Query.FieldByName('documentkey').AsInteger = Linekey then
            begin
              MemTable.FieldbyName('goodname').AsString := EndBold + '    ' +
                Query.FieldByName('modifyname').AsString;
              MemTable.FieldbyName('prngroupname').AsString := DOUBLESIZE +
                Query.FieldByName('prngroupname').AsString + ENDDOUBLESIZE;
            end else
            begin
              if (AnsiUpperCase(Query.Fields[I].FieldName) = 'GOODNAME') then
                MemTable.Fields[I].AsString := Bold + Query.Fields[I].AsString
              else if (AnsiUpperCase(Query.Fields[i].FieldName) = 'PRNGROUPNAME')
                or (AnsiUpperCase(Query.Fields[i].FieldName) = 'NUM') or (AnsiUpperCase(Query.Fields[i].FieldName) = 'CONNAME')
              then
                MemTable.Fields[i].AsString := DOUBLESIZE + Copy(Query.Fields[I].AsString, 1, 16) + ENDDOUBLESIZE
              else
                MemTable.Fields[i].AsString := Query.Fields[I].AsString;
            end;
            Inc(I);
          end;

          if (Query.FieldByName('documentkey').AsInteger <> Linekey) and
            (Query.FieldByName('modifyname').AsString <> '')
          then
            begin
              MemTable.FieldByName('modifyname').AsString := '';
              MemTable.FieldbyName('TIME').AsdateTime := Time;
              MemTable.FieldByNAme('COMPRESSEDON').AsVariant := ''; // 'chr(&H1D) + CHR(&H56) + CHR(&H01)
              MemTable.FieldByNAme('RESET').AsVariant := ''; //'chr(&H1B) + CHR(&H40)
              MemTable.FieldByNAme('BELL').AsVariant := ''; //'chr(&H1B) + CHR(&H70) + "0" + CHR(0) + chr(0)
              MemTable.Post;
              MemTable.Append;
              I := 0;
              while I <= Query.FieldCount - 1 do
              begin
                MemTable.Fields[I].AsString := Query.Fields[I].AsString;
                Inc(I);
              end;
              MemTable.FieldbyName('GOODNAME').AsString := EndBold + '    ' + Query.FieldByName('modifyname').AsString;
              MemTable.FieldbyName('prngroupname').AsString := DOUBLESIZE + Query.FieldByName('prngroupname').AsString + ENDDOUBLESIZE;
            end;

          if (Query.FieldByName('documentkey').AsInteger <> Linekey) and
            (Query.FieldByName('extramodify').AsString <> '')
          then
            begin
              MemTable.FieldByName('modifyname').AsString := '';
              MemTable.FieldbyName('TIME').AsdateTime := Time;
              MemTable.FieldByNAme('COMPRESSEDON').AsVariant := ''; // 'chr(&H1D) + CHR(&H56) + CHR(&H01)
              MemTable.FieldByNAme('RESET').AsVariant := ''; //'chr(&H1B) + CHR(&H40)
              MemTable.FieldByNAme('BELL').AsVariant := ''; //'chr(&H1B) + CHR(&H70) + "0" + CHR(0) + chr(0)
              MemTable.Post;
              MemTable.Append;
              I := 0;
              while I <= Query.FieldCount - 1 do
              begin
                MemTable.Fields[I].AsString := Query.Fields[I].AsString;
                Inc(I);
              end;
              MemTable.FieldbyName('GOODNAME').AsString := EndBold + '     *** ' + Query.FieldByName('extramodify').AsString + ' *** ';
              MemTable.FieldbyName('prngroupname').AsString := DOUBLESIZE + Query.FieldByName('prngroupname').AsString + ENDDOUBLESIZE;
            end;

          Linekey := Query.FieldByName('documentkey').AsInteger;
          MemTable.FieldbyName('TIME').AsdateTime := Time;
          MemTable.FieldByNAme('COMPRESSEDON').AsVariant := ''; // 'chr(&H1D) + CHR(&H56) + CHR(&H01)
          MemTable.FieldByNAme('RESET').AsVariant := ''; //'chr(&H1B) + CHR(&H40)
          MemTable.FieldByNAme('BELL').AsVariant := ''; //'chr(&H1B) + CHR(&H70) + "0" + CHR(0) + chr(0)
          MemTable.Post;

          Query.Next;
        end;

        TfrxDBDataset2.Name := MemTable.Name;
        TfrxDBDataset2.DataSet := TDataSet(MemTable);

        FReport.DataSets.Add(TfrxDBDataset2);
        FReport.EnabledDataSets.Add(TfrxDBDataset2);

        case ReportType of
          1:
          begin
            GetTemplateStreamByRuid(147373664, 1033124911, Str);
            if Str.Size > 0 then
            begin
              Str.Position := 0;
              FReport.LoadFromStream(Str);
            end;
          end;
        end;
        //
        FReport.Variables.Clear;
        FReport.Variables[' ' + cn_RestParam] := Null;
        FReport.Variables.AddVariable(cn_RestParam, 'PrnGrID', '''' + VarToStr(PrnGrID) + '''');
        FReport.Variables.AddVariable(cn_RestParam, 'DocID', '''' + VarToStr(DocID) + '''');
        FReport.Variables.AddVariable(cn_RestParam, 'PrinterName', '''' + VarToStr(PrinterName) + '''');
        if FReport.PrepareReport then
        begin
          InitReportParams(FReport, PrinterName);
          FReport.Print;
        end;
        Result := True;
      end;
    finally
      Str.Free;
      Query.Free;
      MemTable.Free;
      TfrxDBDataset2.Free;
    end;
  finally
    FReport.Free;
  end;
end;

procedure TRestReport.SaveTemplateStreamByRuid(const XID, DBID: Integer;
  var Stream: TStream);
var
  ID: Integer;
begin
  ID := FFrontBase.GetIDByRUID(XID, DBID);

  Assert(ID <> -1, 'Invalid template RUID');

  FFrontBase.SaveReportTemplate(Stream, ID);
end;

initialization
  Classes.RegisterClass(Tgs_fr4SingleReport);

finalization
  Classes.UnRegisterClass(Tgs_fr4SingleReport);

end.
