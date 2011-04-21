unit Report_Unit;

interface

uses
  Classes, Front_DataBase_Unit, Printers, SysUtils, ComCtrls, ExtCtrls, frxOLE,
  frxDesgn, frxClass, frxDCtrl, frxChart, frxRich, frxBarcode, ImgList,
  frxCross, frxDMPExport, frxExportRTF, frxGZip, frxChBox,
  frxExportText, frxPrinter, Dialogs, frxDBSet, frxPreview, frxIBXComponents,
  IBQuery, kbmMemTable, DB, Variants, Base_FiscalRegister_unit, IBSQL;

type
  Tgs_fr4Report = class(TfrxReport)
  private
    //������� ��������
    FrxRTFExport:  TfrxRTFExport;
    FrxSimpleTextExport: TfrxSimpleTextExport;
    FrxDMPExport:  TfrxDotMatrixExport;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  //����� ������ ��� �������������
  Tgs_fr4SingleReport = class(Tgs_fr4Report);

{
  ����� ��� ������ � FR4
  ����� ����� �-���:
  - ����������� ������
  - ����������� ��������� ���
  - ����������� ��� ������
  ����� ����������� ��� ����������� ������� ������ ������
  ��� ����������� �������������� ����� ��������� ���������� � FR4 ���
  ������� �������� �������
  ������ ����� ������� ��������� ������ � ��������� ������
  �-��� �������� ������� ������ ����� ����������� ��������� ������� � ������
  ��� �������� �������, ��� ������������� ������ ������ ������������

  1.	������
  1.1.	Aura
  1.2.	Epson ���������� (�������������� ��������������� �����)
  1.3.	Epson � ��������
  2.	��������� ���
  2.1.	Aura
  2.2.	Epson � ��������
  3.	������ ������
  3.1.	Aura
  3.2.	Epson � ��������

}
  TRestReport = class(TObject)
  private
    FFrontBase: TFrontBase;
    procedure GetTemplateStreamByRuid(const XID: Integer;
      const DBID: Integer;var Stream: TStream);

    procedure GetTemplateStreamByPrnIDAndType(const ReportType,
      PrinterID: Integer; const Stream: TStream);

    procedure SaveTemplateStreamByRuid(const XID: Integer;
      const DBID: Integer;var Stream: TStream);

    procedure InitReportParams(const FReport: Tgs_fr4SingleReport;
      const PrinterName: String);

  public
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;

    function PrintPreCheck(const ReportType, DocID: Integer): Boolean;
    procedure PrintAfterSalePreCheck(const DocID: Integer; const FSums: TSaleSums);
    function PrintServiceCheck(const ReportType, PrnGrID, DocID: Integer; const PrinterName: String;
      PrinterID: Integer): Boolean;
    function PrintDeleteServiceCheck(const ReportType, PrnGrID, DocumentKey, MasterKey: Integer;
      const PrinterName: String; PrinterID: Integer): Boolean;
    procedure PrintIncomeReport(const DateBegin, DateEnd: TDate);
    procedure PrintCheckRegister(const DateBegin, DateEnd: TDate);
    procedure PrintCheckRegisterEmpl(const DateBegin, DateEnd: TDate; EmplKey, RespKey: Integer);
    procedure PrintCopyChecks(const DateBegin, DateEnd: TDate);
    procedure PrintRealization(const DateBegin, DateEnd: TDate);
    function EditTemplate(const ID: Integer): Boolean;
    function ServiceCheckOptions(const OrderKey: Integer): Boolean;

    property FrontBase: TFrontBase read FFrontBase write FFrontBase;
  end;

const
  cn_RestParam = 'RestParam';
  rp_ServiceCheck      = 1;
  rp_DelServiceCheck   = 2;
  rp_PreCheck          = 3;
  rp_AfterSalePreCheck = 4;
  rp_IncomeReport      = 5;
  rp_CheckRegisterEmpl = 6;
  rp_CopyCheck         = 7;
  rp_Realization       = 8;


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

    if Touch_MessageBox('��������', '��������� ������?', MB_YESNO, mtConfirmation) = IDYES then
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

procedure TRestReport.GetTemplateStreamByPrnIDAndType(const ReportType,
  PrinterID: Integer; const Stream: TStream);
begin
  FFrontBase.GetReportTemplateByPrnIDAndType(ReportType, PrinterID, Stream);
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
  FPrinterInfo: TPrinterInfo;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  FPrinterInfo := FFrontBase.GetPrinterInfo;
  PrinterName := FPrinterInfo.PrinterName;
  if PrinterName = '' then
  begin
    Touch_MessageBox('��������', '��� ������ ������� ������� �� ������ ���������� �������!', MB_OK, mtWarning);
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
      '  o.usr$guestcount guest, o.usr$timeorder as open1, current_time as close1, current_timestamp as date1, ' +
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
      '  o.usr$guestcount, o.usr$timeorder, o.usr$timecloseorder, 13, ' +
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

          MemTable.FieldbyName('NOW').AsDateTime := Header.FieldByName('date1').AsDateTime;;
          MemTable.FieldbyName('NOWTIME').AsDateTime := Header.FieldByName('close1').AsDateTime;
          MemTable.FieldByName('COMPRESSEDON').AsVariant := ''; // 'chr(&H1D) + CHR(&H56) + CHR(&H01)
          MemTable.FieldByName('RUSPAGE').AsVariant := '';
          if Header.FieldByName('surname').AsString <> '' then
            MemTable.FieldByNAme('DISKN').AsString := '��������:' + Header.FieldByName('cardnum').AsString +
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
          Sells.FieldByName('PayType1').AsString := '��������';
          Sells.FieldByName('PaySum1').AsString := CurrToStr(FCashSum);
          Sells.FieldByName('ChangeSum').AsString := CurrToStr(FChangeSum);
          Sells.FieldByName('NOW').AsDateTime := Date;
          Sells.FieldByName('NOWTIME').AsDateTime := Now;
          Sells.Post;
        end;
        if (FCreditSum + FPersonalCardSum) > 0 then
        begin
          Sells.Append;
          Sells.FieldByName('PayType1').AsString := '�����������';
          Sells.FieldByName('PaySum1').AsString := CurrToStr(FCreditSum + FPersonalCardSum);
          Sells.FieldByName('ChangeSum').AsString := CurrToStr(FChangeSum);
          Sells.FieldByName('NOW').AsDateTime := Date;
          Sells.FieldByName('NOWTIME').AsDateTime := Now;
          Sells.Post;
        end;
        if FCardSum > 0 then
        begin
          Sells.Append;
          Sells.FieldByName('PayType1').AsString := '�����';
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

      GetTemplateStreamByPrnIDAndType(rp_AfterSalePreCheck, FPrinterInfo.PrinterID, Str);
      if Str.Size > 0 then
      begin
        Str.Position := 0;
        FReport.LoadFromStream(Str);
      end else
      begin
        GetTemplateStreamByRuid(147733973, 1604829035, Str);
        if Str.Size > 0 then
        begin
          Str.Position := 0;
          FReport.LoadFromStream(Str);
        end;
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
      begin
        InitReportParams(FReport, PrinterName);
        FReport.Print;
      end;

    finally
      FrxDBDataset.Free;
      Str.Free;
    end;
  finally
    FReport.Free;
  end;
end;

procedure TRestReport.PrintCheckRegisterEmpl(const DateBegin, DateEnd: TDate;
  EmplKey, RespKey: Integer);
var
  PrinterName: String;
  FReport: Tgs_fr4SingleReport;
  Str: TStream;
  BaseQueryList: TgsQueryList;
  Header1, Buh: TgsDataSet;
  FrxDBDataset, FrxDBDataset1, FrxDBDataset2: TfrxDBDataset;
  MemTable: TkbmMemTable;
  DocDate: TDate;
  NomPP, DocKey, I: Integer;
  FPrinterInfo: TPrinterInfo;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  BaseQueryList := FrontData.BaseQueryList;
  BaseQueryList.Clear;

  FPrinterInfo := FFrontBase.GetPrinterInfo;
  PrinterName := FPrinterInfo.PrinterName;
  FReport := Tgs_fr4SingleReport.Create(nil);
  try
    Str := TMemoryStream.Create;
    FrxDBDataset := TfrxDBDataset.Create(nil);
    FrxDBDataset1 := TfrxDBDataset.Create(nil);
    FrxDBDataset2 := TfrxDBDataset.Create(nil);
    MemTable := TkbmMemTable.Create(nil);
    MemTable.Name := 'HEADER';
    try
      Buh := BaseQueryList.Query[BaseQueryList.Add('Buh', False)];
      Buh.SQL :=
        'select ' +
        '  con.name, p.rank ' +
        'from ' +
        '  gd_contact con ' +
        '  left join gd_people p on con.id = p.contactkey ' +
        'where ' +
        '  id = :id ';
      Buh.ParamByName('ID').AsInteger := EmplKey;
      Buh.Open;

      Header1 := BaseQueryList.Query[BaseQueryList.Add('Header1', False)];
      Header1.SQL :=
        'SELECT w.name, w.id, doc.documentdate, o.usr$timecloseorder, o.documentkey, sum(ol.usr$sumncuwithdiscount) sumcheck ' +
        ' ' +
        'FROM usr$mn_order o ' +
        '  left join usr$mn_orderline ol on o.documentkey = ol.masterkey ' +
        '  left join gd_contact w on w.id = o.usr$respkey ' +
        '  left join gd_document doc on o.documentkey = doc.id ' +
        'WHERE ' +
        '  o.usr$logicdate >= :begindate  ' +
        '  and o.usr$logicdate <= :enddate  ' +
        '  and o.usr$pay = 1 ' +
        '  and o.usr$respkey = :respkey ' +
        'GROUP BY 1, 2, 3, 4, 5  ' +
        'ORDER BY ' +
        'doc.documentdate, o.usr$timecloseorder, w.name, o.documentkey ';
      Header1.ParamByName('begindate').AsDate := DateBegin;
      Header1.ParamByName('enddate').AsDate := DateEnd;
      Header1.ParamByName('respkey').AsInteger := RespKey;
      Header1.Open;

      MemTable.CreateTableAs(Header1.DataSet, [mtcpoStructure]);
      MemTable.FieldDefs.Add('NomPP', ftInteger, 0);
      MemTable.FieldDefs.Add('CompanyName', ftString, 255);
      MemTable.CreateTable;
      MemTable.Open;

      DocDate := EncodeDate(2000, 1, 1);
      NomPP := 1;
      DocKey := -1;
      Header1.First;
      while not Header1.Eof do
      begin
        MemTable.Append;
        MemTable.FieldbyName('CompanyName').AsString := FFrontBase.Options.CheckLine1 +
          ' ' + FFrontBase.Options.CheckLine2 + ' ' +
          FFrontBase.Options.CheckLine3 + ' ' + FFrontBase.Options.CheckLine4;
        I := 0;
        while I <= Header1.FieldCount - 1 do
        begin
          MemTable.Fields[I].AsString := Header1.Fields[I].AsString;
          Inc(I);
        end;
        if DocKey <> MemTable.FieldbyName('documentkey').AsInteger then
        begin
          DocKey := MemTable.FieldbyName('documentkey').AsInteger;
          Inc(NomPP);
        end;
        if DocDate <> MemTable.FieldbyName('documentdate').AsDateTime then
        begin
          DocDate := MemTable.FieldbyName('documentdate').AsDateTime;
          NomPP := 1;
        end;
        MemTable.FieldbyName('NomPP').AsInteger := NomPP;
        MemTable.Post;

        Header1.Next;
      end;
      MemTable.SortFields := 'documentdate;NAME;nompp';
      MemTable.IndexFieldNames := 'documentdate;NAME;nompp';

      FrxDBDataset.Name := Buh.DataSet.Name;
      FrxDBDataset.DataSet := TDataSet(Buh.DataSet);
      FrxDBDataset1.Name := Header1.DataSet.Name;
      FrxDBDataset1.DataSet := TDataSet(Header1.DataSet);
      FrxDBDataset2.Name := MemTable.Name;
      FrxDBDataset2.DataSet := TDataSet(MemTable);

      FReport.DataSets.Add(FrxDBDataset);
      FReport.DataSets.Add(FrxDBDataset1);
      FReport.DataSets.Add(FrxDBDataset2);
      FReport.EnabledDataSets.Add(FrxDBDataset);
      FReport.EnabledDataSets.Add(FrxDBDataset1);
      FReport.EnabledDataSets.Add(FrxDBDataset2);

      GetTemplateStreamByPrnIDAndType(rp_CheckRegisterEmpl, FPrinterInfo.PrinterID, Str);
      if Str.Size > 0 then
      begin
        Str.Position := 0;
        FReport.LoadFromStream(Str);
      end else
      begin
        GetTemplateStreamByRuid(147733800, 1604829035, Str);
        if Str.Size > 0 then
        begin
          Str.Position := 0;
          FReport.LoadFromStream(Str);
        end;
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
      FrxDBDataset1.Free;
      FrxDBDataset2.Free;
      Str.Free;
      MemTable.Free;
    end;
  finally
    FReport.Free;
  end;
end;

procedure TRestReport.PrintCopyChecks(const DateBegin, DateEnd: TDate);
var
  PrinterName: String;
  FReport: Tgs_fr4SingleReport;
  Str: TStream;
  BaseQueryList: TgsQueryList;
  Header1: TgsDataSet;
  FrxDBDataset, FrxDBDataset1: TfrxDBDataset;
  MemTable: TkbmMemTable;
  NomPP, DocKey, I: Integer;
  DocDate: TDateTime;
  FPrinterInfo: TPrinterInfo;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  BaseQueryList := FrontData.BaseQueryList;
  BaseQueryList.Clear;

  FPrinterInfo := FFrontBase.GetPrinterInfo;
  PrinterName := FPrinterInfo.PrinterName;
  if PrinterName = '' then
  begin
    Touch_MessageBox('��������', '��� ������ ������� ������� �� ������ ���������� �������!', MB_OK, mtWarning);
    exit;
  end;
  FReport := Tgs_fr4SingleReport.Create(nil);
  try
    Str := TMemoryStream.Create;
    FrxDBDataset := TfrxDBDataset.Create(nil);
    FrxDBDataset1 := TfrxDBDataset.Create(nil);
    MemTable := TkbmMemTable.Create(nil);
    MemTable.Name := 'HEADER';
    try
      Header1 := BaseQueryList.Query[BaseQueryList.Add('Header1', False)];
      Header1.SQL :=
        '  select ' +
        '    comp.name as compname, ' +
        '    comp.address as compadr, ' +
        '    comp.city compcity, ' +
        '    g.name as goodname, ' +
        '    ol.usr$costncu as c, ' +
        '    con.name as conname, ' +
        '    doc.id, doc.documentdate as docdate, doc.number as docnum, ' +
        '    o.usr$guestcount as guest, o.usr$timeorder as open1, ' +
        '    o.usr$timecloseorder as close1, ' +
        '    o.usr$cash as cash, ' +
        '    d.usr$surname as surname, ' +
        '    d.usr$middlename as midle, ' +
        '    d.usr$firstname as firstn, ' +
        '    d.usr$cardnum as cardnum, ' +
        '    sum(ol.usr$sumncu) s,  ' +
        '    sum(ol.usr$sumncuwithdiscount) swd,  ' +
        '    sum(ol.usr$sumdiscount) sd, ' +
        '    sum(ol.usr$quantity) q ' +
        '  from  ' +
        '    usr$mn_order o ' +
        '    left join gd_document doc on o.documentkey = doc.id ' +
        '    left join usr$mn_orderline ol on ol.masterkey = o.documentkey ' +
        '    left join gd_good g on g.id = ol.usr$goodkey  ' +
        '    left join gd_contact comp on comp.id = doc.companykey ' +
        '    left join gd_contact con on con.id = o.usr$respkey  ' +
        '    left join usr$mn_discountcard d on d.id = o.usr$disccardkey ' +
        '  where ' +
        '    ol.usr$causedeletekey + 0 is null  ' +
        '    and o.usr$logicdate >= :BeginDate  ' +
        '    and o.usr$logicdate <= :EndDate and o.usr$pay = 1 ' +
        '  group by  ' +
        '    1, 2, 3, 4, 5, 6, 7, 8, ' +
        '    9, 10, 11, 12, 13, 14, 15, 16, 17 ' +
        '  having  ' +
        '    sum(ol.usr$quantity) > 0  ' +
        '  order by ' +
        '    doc.documentdate, o.usr$timecloseorder, doc.id ';
      Header1.ParamByName('begindate').AsDate := DateBegin;
      Header1.ParamByName('enddate').AsDate := DateEnd;
      Header1.Open;

      MemTable.CreateTableAs(Header1.DataSet, [mtcpoStructure]);
      MemTable.FieldDefs.Add('NomPP', ftInteger, 0);
      MemTable.FieldDefs.Add('DISKN', ftString, 60);
      MemTable.CreateTable;
      MemTable.Open;

      DocDate := EncodeDate(2000, 1, 1);
      NomPP := 1;
      DocKey := -1;
      Header1.First;
      while not Header1.Eof do
      begin
        I := 0;
        MemTable.Append;
        while I <= Header1.FieldCount - 1 do
        begin
          MemTable.Fields[I].AsString := Header1.Fields[I].AsString;
          Inc(I);
        end;

        if DocKey <> MemTable.FieldbyName('ID').AsInteger then
        begin
          DocKey := MemTable.FieldbyName('ID').AsInteger;
          Inc(NomPP);
        end;
        if DocDate <> MemTable.FieldbyName('docdate').AsDateTime then
        begin
          DocDate := MemTable.FieldbyName('docdate').AsDateTime;
          NomPP := 1;
        end;
        MemTable.FieldbyName('NomPP').AsInteger := NomPP;
        if Header1.FieldByName('surname').AsString <> '' then
        begin
          MemTable.FieldByNAme('DISKN').AsString := '��������:' + Header1.FieldByName('cardnum').AsString +
            #13#10 + Header1.FieldByName('surname').AsString + ' ' +
            Header1.FieldByName('firstn').AsString + ' ' + Header1.FieldByName('midle').AsString;
        end;
        MemTable.Post;

        Header1.Next;
      end;

      FrxDBDataset.Name := Header1.DataSet.Name;
      FrxDBDataset.DataSet := TDataSet(Header1);
      FrxDBDataset1.Name := MemTable.Name;
      FrxDBDataset1.DataSet := TDataSet(MemTable);

      FReport.DataSets.Add(FrxDBDataset);
      FReport.DataSets.Add(FrxDBDataset1);
      FReport.EnabledDataSets.Add(FrxDBDataset);
      FReport.EnabledDataSets.Add(FrxDBDataset1);

      GetTemplateStreamByPrnIDAndType(rp_CopyCheck, FPrinterInfo.PrinterID, Str);
      if Str.Size > 0 then
      begin
        Str.Position := 0;
        FReport.LoadFromStream(Str);
      end else
      begin
        GetTemplateStreamByRuid(147744649, 1650037404, Str);
        if Str.Size > 0 then
        begin
          Str.Position := 0;
          FReport.LoadFromStream(Str);
        end;
      end;

      FReport.Variables.Clear;
      FReport.Variables[' ' + cn_RestParam] := Null;
      FReport.Variables.AddVariable(cn_RestParam, 'PARAM0', '''' + DateToStr(DateBegin) + '''');
      FReport.Variables.AddVariable(cn_RestParam, 'PARAM1', '''' + DateToStr(DateEnd) + '''');
      if FReport.PrepareReport then
      begin
        InitReportParams(FReport, PrinterName);
        FReport.Print;
      end;
    finally
      FrxDBDataset.Free;
      FrxDBDataset1.Free;
      Str.Free;
      MemTable.Free;
    end;
  finally
    FReport.Free;
  end;
end;

function TRestReport.PrintDeleteServiceCheck(const ReportType, PrnGrID,
  DocumentKey, MasterKey: Integer; const PrinterName: String; PrinterID: Integer): Boolean;
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
          '  current_time as time1, ' +
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

        GetTemplateStreamByPrnIDAndType(rp_DelServiceCheck, PrinterID, Str);
        if Str.Size > 0 then
        begin
          Str.Position := 0;
          FReport.LoadFromStream(Str);
        end else
        begin
          GetTemplateStreamByRuid(147373760, 1033124911, Str);
          if Str.Size > 0 then
          begin
            Str.Position := 0;
            FReport.LoadFromStream(Str);
          end;
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
  FPrinterInfo: TPrinterInfo;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  BaseQueryList := FrontData.BaseQueryList;
  BaseQueryList.Clear;

  FPrinterInfo := FFrontBase.GetPrinterInfo;
  PrinterName := FPrinterInfo.PrinterName;
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
          Header.FieldByName('PS').AsString := '�� ���';
        end else
        begin
          Header.Edit;
          Header.FieldByName('PS').AsString := '�����';
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

      GetTemplateStreamByPrnIDAndType(rp_IncomeReport, FPrinterInfo.PrinterID, Str);
      if Str.Size > 0 then
      begin
        Str.Position := 0;
        FReport.LoadFromStream(Str);
      end else
      begin
        GetTemplateStreamByRuid(147733592, 1604829035, Str);
        if Str.Size > 0 then
        begin
          Str.Position := 0;
          FReport.LoadFromStream(Str);
        end;
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
  FPrinterInfo: TPrinterInfo;
begin
  Result := False;

  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  FPrinterInfo := FFrontBase.GetPrinterInfo;
  PrinterName := FPrinterInfo.PrinterName;
  if PrinterName = '' then
  begin
    Touch_MessageBox('��������', '��� ������ ������� ������� �� ������ ���������� �������!', MB_OK, mtWarning);
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

          MemTable.FieldbyName('NOW').AsDateTime := Query.FieldByName('date1').AsDateTime;;
          MemTable.FieldbyName('NOWTIME').AsDateTime := Query.FieldByName('close1').AsDateTime;
          MemTable.FieldByName('COMPRESSEDON').AsVariant := ''; // 'chr(&H1D) + CHR(&H56) + CHR(&H01)
          MemTable.FieldByName('RUSPAGE').AsVariant := '';
          if Query.FieldByName('surname').AsString <> '' then
            MemTable.FieldByNAme('DISKN').AsString := '��������:' + Query.FieldByName('cardnum').AsString +
              #13#10 + Query.FieldByName('surname').AsString + ' ' +
              Query.FieldByName('firstn').AsString + ' ' + Query.FieldByName('midle').AsString;

          MemTable.Post;

          Query.Next;
        end;

        TfrxDBDataset2.Name := MemTable.Name;
        TfrxDBDataset2.DataSet := TDataSet(MemTable);

        FReport.DataSets.Add(TfrxDBDataset2);
        FReport.EnabledDataSets.Add(TfrxDBDataset2);

        GetTemplateStreamByPrnIDAndType(rp_PreCheck, FPrinterInfo.PrinterID, Str);
        if Str.Size > 0 then
        begin
          Str.Position := 0;
          FReport.LoadFromStream(Str);
        end else
        begin
          GetTemplateStreamByRuid(147373700, 1033124911, Str);
          if Str.Size > 0 then
          begin
            Str.Position := 0;
            FReport.LoadFromStream(Str);
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

procedure TRestReport.PrintRealization(const DateBegin, DateEnd: TDate);
var
  PrinterName: String;
  FReport: Tgs_fr4SingleReport;
  Str: TStream;
  BaseQueryList: TgsQueryList;
  Header1, Header: TgsDataSet;
  FrxDBDataset, FrxDBDataset1: TfrxDBDataset;
  FPrinterInfo: TPrinterInfo;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  BaseQueryList := FrontData.BaseQueryList;
  BaseQueryList.Clear;

  FPrinterInfo := FFrontBase.GetPrinterInfo;
  PrinterName := FPrinterInfo.PrinterName;
  if PrinterName = '' then
  begin
    Touch_MessageBox('��������', '��� ������ ������� ������� �� ������ ���������� �������!', MB_OK, mtWarning);
    exit;
  end;
  FReport := Tgs_fr4SingleReport.Create(nil);
  try
    Str := TMemoryStream.Create;
    FrxDBDataset := TfrxDBDataset.Create(nil);
    FrxDBDataset1 := TfrxDBDataset.Create(nil);
    try
      Header1 := BaseQueryList.Query[BaseQueryList.Add('Report', False)];
      Header1.SQL :=
        'select ' +
        '   pt.usr$name , ' +
        '   con.name as groupname, ' +
        '   sum(rc.summ) as ss  ' +
        'from ' +
        '  usr$mn_p_cashreport_kassa(:begindate, :enddate) rc ' +
        '  left join  usr$mn_order o on rc.orderkey = o.documentkey ' +
        '  left join usr$mn_kindtype kt on rc.kindtypekey = kt.id ' +
        '  left join usr$inv_paytype pt on pt.id = kt.usr$paytypekey ' +
        '  left join usr$mn_category c on c.id = rc.categorykey ' +
        '  left join gd_contact con on con.id = rc.depotkey ' +
        'group by ' +
        '  1, 2 ' +
        '  order by 1,2 ';
      Header1.ParamByName('begindate').AsDate := DateBegin;
      Header1.ParamByName('enddate').AsDate := DateEnd;
      Header1.Open;

      Header := BaseQueryList.Query[BaseQueryList.Add('Header', True)];
      Header.AddField('FromDAte', 'ftDate', 0, False);
      Header.AddField('ToDAte', 'ftDate', 0, False);
      Header.Open;

      Header.Append;
      Header.FieldByName('FromDAte').AsDateTime := DateBegin;
      Header.FieldByName('ToDAte').AsDateTime := DateEnd;
      Header.Post;

      FrxDBDataset.Name := Header1.DataSet.Name;
      FrxDBDataset.DataSet := Header1.DataSet;
      FrxDBDataset1.Name := Header.DataSet.Name;;
      FrxDBDataset1.DataSet := Header.DataSet;

      FReport.DataSets.Add(FrxDBDataset);
      FReport.DataSets.Add(FrxDBDataset1);
      FReport.EnabledDataSets.Add(FrxDBDataset);
      FReport.EnabledDataSets.Add(FrxDBDataset1);

      GetTemplateStreamByPrnIDAndType(rp_Realization, FPrinterInfo.PrinterID, Str);
      if Str.Size > 0 then
      begin
        Str.Position := 0;
        FReport.LoadFromStream(Str);
      end else
      begin
        GetTemplateStreamByRuid(147744656, 1650037404, Str);
        if Str.Size > 0 then
        begin
          Str.Position := 0;
          FReport.LoadFromStream(Str);
        end;
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
      FrxDBDataset1.Free;
      Str.Free;
    end;
  finally
    FReport.Free;
  end;
end;

function TRestReport.PrintServiceCheck(const ReportType, PrnGrID,
  DocID: Integer; const PrinterName: String; PrinterID: Integer): Boolean;
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
            Inc(I);
          end;

          if Query.FieldByName('documentkey').AsInteger = Linekey then
          begin
            MemTable.FieldbyName('goodname').AsString := Query.FieldByName('modifyname').AsString;
            MemTable.FieldbyName('Q').Clear;
          end;
          if (Query.FieldByName('documentkey').AsInteger <> Linekey) and
            (Query.FieldByName('modifyname').AsString <> '')
          then
            begin
              MemTable.FieldByName('modifyname').AsString := '';
              MemTable.FieldbyName('TIME').AsdateTime := Query.FieldByName('time1').AsDateTime;
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
              MemTable.FieldbyName('GOODNAME').AsString := Query.FieldByName('modifyname').AsString;
              MemTable.FieldbyName('Q').Clear;
            end;

          if (Query.FieldByName('documentkey').AsInteger <> Linekey) and
            (Query.FieldByName('extramodify').AsString <> '')
          then
            begin
              MemTable.FieldByName('modifyname').AsString := '';
              MemTable.FieldbyName('TIME').AsdateTime := Query.FieldByName('time1').AsDateTime;
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
              MemTable.FieldbyName('GOODNAME').AsString := ' *** ' + Query.FieldByName('extramodify').AsString + ' *** ';
              MemTable.FieldbyName('Q').Clear;
            end;

          Linekey := Query.FieldByName('documentkey').AsInteger;
          MemTable.FieldbyName('TIME').AsdateTime := Query.FieldByName('time1').AsDateTime;
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
            GetTemplateStreamByPrnIDAndType(rp_ServiceCheck, PrinterID, Str);
            if Str.Size > 0 then
            begin
              Str.Position := 0;
              FReport.LoadFromStream(Str);
            end else
            begin
              GetTemplateStreamByRuid(147373664, 1033124911, Str);
              if Str.Size > 0 then
              begin
                Str.Position := 0;
                FReport.LoadFromStream(Str);
              end;
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

function TRestReport.ServiceCheckOptions(const OrderKey: Integer): Boolean;
var
  FSQL: TIBSQL;
begin
  Result := False;

  FSQL := TIBSQL.Create(nil);
  FSQL.Transaction := FFrontBase.ReadTransaction;
  try
    FSQL.SQL.Text := 'select ' +
      '  DISTINCT setprn.id as prnid,  ' +
      '  IIF(setprn.usr$concatchecks = 0, prn.id, null) as prngrid, prn.usr$divide,  ' +
      '  setprn.usr$printername, setprn.usr$printerid, o.documentkey, setprn.USR$DOSPRINTER ' +
      'from   ' +
      '  usr$mn_order o  ' +
      '  join usr$mn_orderline l on o.documentkey = l.masterkey  ' +
      '  join gd_document doc on doc.id = l.documentkey and doc.usr$mn_printdate is null  ' +
      '  join gd_good g on g.id = l.usr$goodkey  ' +
      '  join usr$mn_prngroup prn on prn.id = g.usr$prngroupkey  ' +
      '  join usr$mn_prngroupset setprn on setprn.usr$prngroup = prn.id  ' +
      'where o.documentkey = :docid  ' +
      ' and setprn.usr$computername = :comp   ' +
      ' and setprn.usr$kassa = 0   ' +
      'order by  ' +
      '  setprn.usr$printername, prn.id  ';
    FSQL.ParamByName('docid').AsInteger := OrderKey;
    FSQL.ParamByName('comp').AsString := FFrontBase.GetLocalComputerName;
    FSQL.ExecQuery;
    while not FSQL.Eof do
    begin
      PrintServiceCheck(1, FSQL.FieldByName('prngrid').AsInteger, OrderKey,
        FSQL.FieldByName('usr$printername').AsString, FSQL.FieldByName('prnid').AsInteger);
      Result := True;
      FSQL.Next;
    end;

    FSQL.Close;
  finally
    FSQL.Free;
  end;
end;

initialization
  Classes.RegisterClass(Tgs_fr4SingleReport);

finalization
  Classes.UnRegisterClass(Tgs_fr4SingleReport);

end.
