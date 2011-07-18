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
    //Фильтры экспорта
    FrxRTFExport:  TfrxRTFExport;
    FrxSimpleTextExport: TfrxSimpleTextExport;
    FrxDMPExport:  TfrxDotMatrixExport;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  //fake component
  //класс обёртка для совместимости c Gedemin
  Tgs_fr4SingleReport = class(Tgs_fr4Report);

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

    function PrintPreCheck(const ReportType, DocID: Integer): Boolean; //DONE
    procedure PrintAfterSalePreCheck(const DocID: Integer; const FSums: TSaleSums);
    function PrintServiceCheck(const ReportType, PrnGrID, DocID: Integer; const PrinterName: String;
      PrinterID: Integer): Boolean;  //DONE
    function PrintDeleteServiceCheck(const ReportType, PrnGrID, DocumentKey, MasterKey: Integer;
      const PrinterName: String; PrinterID: Integer): Boolean;  //DONE
    procedure PrintIncomeReport(const DateBegin, DateEnd: TDate);  //DONE
    procedure PrintCheckRegisterEmpl(const DateBegin, DateEnd: TDate; EmplKey, RespKey: Integer); //DONE
    procedure PrintCopyChecks(const DateBegin, DateEnd: TDate);    // DONE
    procedure PrintRealization(const DateBegin, DateEnd: TDate);   // DONE
    function EditTemplate(const ID, TemplateType: Integer): Boolean;
    function ServiceCheckOptions(const OrderKey: Integer): Boolean;
    function DeleteServiceCheckOptions(const DocID, MasterKey,
      DocumentKey: Integer): Boolean;
    procedure PrintCustomReport(const DateBegin, DateEnd: TDate; const TemplateID: Integer);

    property FrontBase: TFrontBase read FFrontBase write FFrontBase;
  end;

const
  cn_RestParam = 'RestParam';
  rp_ServiceCheck      = 1;   //DONE
  rp_DelServiceCheck   = 2;   //DONE
  rp_PreCheck          = 3;   //DONE
  //копия чека
  rp_AfterSalePreCheck = 4;
  //отчет по выручке
  rp_IncomeReport      = 5;   //DONE
  //реестр счетов
  rp_CheckRegisterEmpl = 6;   //DONE
  //копии счетов за период
  rp_CopyCheck         = 7;   //DONE
  //акт реализации
  rp_Realization       = 8;   //DONE
  //пользовательский отчет
  rp_CustomReport      = 9;


implementation

uses
  Windows, Forms, FrontData_Unit, TouchMessageBoxForm_Unit, rfUtils_unit,
  obj_QueryList;

{ Tgs_fr4Report }

constructor Tgs_fr4Report.Create(AOwner: TComponent);
begin
  inherited;

  FrxRTFExport  := TfrxRTFExport.Create(Self);
  FrxSimpleTextExport := TfrxSimpleTextExport.Create(Self);
  FrxDMPExport  := TfrxDotMatrixExport.Create(Self);
  ShowProgress := False;
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

function TRestReport.EditTemplate(const ID, TemplateType : Integer): Boolean;
var
  FReport: Tgs_fr4SingleReport;
  Str: TStream;
  BaseQueryList: TgsQueryList;
  FCompanyName: String;
begin
  Result := False;
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  BaseQueryList := FrontData.BaseQueryList;
  BaseQueryList.Clear;
  FReport := Tgs_fr4SingleReport.Create(nil);
  Str := TMemoryStream.Create;
  try
    BaseQueryList.Report := FReport;
    FFrontBase.GetReportTemplate(Str, ID);
    if Str.Size > 0 then
    begin
      Str.Position := 0;
      FReport.LoadFromStream(Str);
    end;
    FReport.DataSets.Clear;
    FReport.EnabledDataSets.Clear;

    FReport.Variables.Clear;
    FReport.Variables[' ' + cn_RestParam] := Null;
    case TemplateType of
      rp_Realization, rp_CopyCheck, rp_IncomeReport, rp_CustomReport:
        begin
          FReport.Variables.AddVariable(cn_RestParam, 'DateBegin', '''' + DateToStr(Now) + '''');
          FReport.Variables.AddVariable(cn_RestParam, 'DateEnd', '''' + DateToStr(Now) + '''');
          FCompanyName := FFrontBase.Options.CheckLine1 +
            ' ' + FFrontBase.Options.CheckLine2 + ' ' +
            FFrontBase.Options.CheckLine3 + ' ' + FFrontBase.Options.CheckLine4;
          FReport.Variables.AddVariable(cn_RestParam, 'CompanyName', '''' + FCompanyName + '''');
        end;
      rp_PreCheck:
        begin
          FReport.Variables.AddVariable(cn_RestParam, 'DocID', '''' + '0' + '''');
        end;
      rp_DelServiceCheck:
        begin
          FReport.Variables.AddVariable(cn_RestParam, 'PrnGrID', '''' + '0' + '''');
          FReport.Variables.AddVariable(cn_RestParam, 'DocID', '''' + '0' + '''');
          FReport.Variables.AddVariable(cn_RestParam, 'LineID', '''' + '0' + '''');
          FReport.Variables.AddVariable(cn_RestParam, 'PrinterName', '''' + '' + '''');
          FReport.Variables.AddVariable(cn_RestParam, 'ComputerName', '''' + GetLocalComputerName + '''');
        end;
      rp_ServiceCheck:
        begin
          FReport.Variables.AddVariable(cn_RestParam, 'PrnGrID', '''' + '0' + '''');
          FReport.Variables.AddVariable(cn_RestParam, 'DocID', '''' + '0' + '''');
          FReport.Variables.AddVariable(cn_RestParam, 'PrinterName', '''' + '' + '''');
          FReport.Variables.AddVariable(cn_RestParam, 'ComputerName', '''' + GetLocalComputerName + '''');
        end;
      rp_CheckRegisterEmpl:
        begin
          FReport.Variables.AddVariable(cn_RestParam, 'DateBegin', '''' + DateToStr(Now) + '''');
          FReport.Variables.AddVariable(cn_RestParam, 'DateEnd', '''' + DateToStr(Now) + '''');
          FReport.Variables.AddVariable(cn_RestParam, 'EmplKey', '''' + '0' + '''');
          FReport.Variables.AddVariable(cn_RestParam, 'RespKey', '''' + '0' + '''');
          FCompanyName := FFrontBase.Options.CheckLine1 +
            ' ' + FFrontBase.Options.CheckLine2 + ' ' +
            FFrontBase.Options.CheckLine3 + ' ' + FFrontBase.Options.CheckLine4;
          FReport.Variables.AddVariable(cn_RestParam, 'CompanyName', '''' + FCompanyName + '''');
        end;
      rp_AfterSalePreCheck:
        begin
          FReport.Variables.AddVariable(cn_RestParam, 'DocID', '''' + '0' + '''');
        end;
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
    BaseQueryList.Report := nil;
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
  FPrinterInfo: TPrinterInfo;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  FPrinterInfo := FFrontBase.GetPrinterInfo;
  PrinterName := FPrinterInfo.PrinterName;
  if PrinterName = '' then
  begin
    Touch_MessageBox('Внимание', 'Для данной рабочей станции не указан пречековый принтер!', MB_OK, mtWarning);
    exit;
  end;

  BaseQueryList := FrontData.BaseQueryList;
  BaseQueryList.Clear;
  FReport := Tgs_fr4SingleReport.Create(nil);
  BaseQueryList.Report := FReport;
  try
    Str := TMemoryStream.Create;
    try
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
      FReport.DataSets.Clear;
      FReport.Variables.Clear;
      FReport.Variables[' ' + cn_RestParam] := Null;
      FReport.Variables.AddVariable(cn_RestParam, 'DocID', '''' + VarToStr(DocID) + '''');
      if FReport.PrepareReport then
      begin
        InitReportParams(FReport, PrinterName);
        FReport.Print;
      end;
    finally
      Str.Free;
    end;
  finally
    BaseQueryList.Report := nil;
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
  FPrinterInfo: TPrinterInfo;
  FCompanyName: String;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  BaseQueryList := FrontData.BaseQueryList;
  BaseQueryList.Clear;

  FPrinterInfo := FFrontBase.GetPrinterInfo;
  PrinterName := FPrinterInfo.PrinterName;
  FReport := Tgs_fr4SingleReport.Create(nil);
  BaseQueryList.Report := FReport;
  try
    Str := TMemoryStream.Create;
    try
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
      FReport.DataSets.Clear;
      FCompanyName := FFrontBase.Options.CheckLine1 +
        ' ' + FFrontBase.Options.CheckLine2 + ' ' +
        FFrontBase.Options.CheckLine3 + ' ' + FFrontBase.Options.CheckLine4;

      FReport.Variables.Clear;
      FReport.Variables[' ' + cn_RestParam] := Null;
      FReport.Variables.AddVariable(cn_RestParam, 'DateBegin', '''' + DateToStr(DateBegin) + '''');
      FReport.Variables.AddVariable(cn_RestParam, 'DateEnd', '''' + DateToStr(DateEnd) + '''');
      FReport.Variables.AddVariable(cn_RestParam, 'EmplKey', '''' + IntToStr(EmplKey) + '''');
      FReport.Variables.AddVariable(cn_RestParam, 'RespKey', '''' + IntToStr(RespKey) + '''');
      FReport.Variables.AddVariable(cn_RestParam, 'CompanyName', '''' + FCompanyName + '''');
      if FReport.PrepareReport then
      begin
        InitReportParams(FReport, PrinterName);
        FReport.ShowPreparedReport;
      end;
    finally
      Str.Free;
    end;
  finally
    BaseQueryList.Report := nil;
    FReport.Free;
  end;
end;

procedure TRestReport.PrintCopyChecks(const DateBegin, DateEnd: TDate);
var
  PrinterName: String;
  FReport: Tgs_fr4SingleReport;
  Str: TStream;
  BaseQueryList: TgsQueryList;
  FPrinterInfo: TPrinterInfo;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  BaseQueryList := FrontData.BaseQueryList;
  BaseQueryList.Clear;

  FPrinterInfo := FFrontBase.GetPrinterInfo;
  PrinterName := FPrinterInfo.PrinterName;
  if PrinterName = '' then
  begin
    Touch_MessageBox('Внимание', 'Для данной рабочей станции не указан пречековый принтер!', MB_OK, mtWarning);
    exit;
  end;
  FReport := Tgs_fr4SingleReport.Create(nil);
  BaseQueryList.Report := FReport;
  try
    Str := TMemoryStream.Create;
    try
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
      FReport.DataSets.Clear;
      FReport.Variables.Clear;
      FReport.Variables[' ' + cn_RestParam] := Null;
      FReport.Variables.AddVariable(cn_RestParam, 'DateBegin', '''' + DateToStr(DateBegin) + '''');
      FReport.Variables.AddVariable(cn_RestParam, 'DateEnd', '''' + DateToStr(DateEnd) + '''');
      if FReport.PrepareReport then
      begin
        InitReportParams(FReport, PrinterName);
        FReport.Print;
      end;
    finally
      Str.Free;
    end;
  finally
    BaseQueryList.Report := nil;
    FReport.Free;
  end;
end;

procedure TRestReport.PrintCustomReport(const DateBegin, DateEnd: TDate;
  const TemplateID: Integer);
var
  FReport: Tgs_fr4SingleReport;
  Str: TStream;
  BaseQueryList: TgsQueryList;
  FPrinterInfo: TPrinterInfo;
  PrinterName, FCompanyName: String;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');
  BaseQueryList := FrontData.BaseQueryList;
  BaseQueryList.Clear;

  FPrinterInfo := FFrontBase.GetPrinterInfo;
  PrinterName := FPrinterInfo.PrinterName;

  FReport := Tgs_fr4SingleReport.Create(nil);
  BaseQueryList.Report := FReport;
  try
    Str := TMemoryStream.Create;
    try
      FFrontBase.GetReportTemplate(Str, TemplateID);
      if Str.Size > 0 then
      begin
        Str.Position := 0;
        FReport.LoadFromStream(Str);
      end;

      FReport.DataSets.Clear;
      FCompanyName := FFrontBase.Options.CheckLine1 +
        ' ' + FFrontBase.Options.CheckLine2 + ' ' +
        FFrontBase.Options.CheckLine3 + ' ' + FFrontBase.Options.CheckLine4;

      FReport.Variables.Clear;
      FReport.Variables[' ' + cn_RestParam] := Null;
      FReport.Variables.AddVariable(cn_RestParam, 'DateBegin', '''' + DateToStr(DateBegin) + '''');
      FReport.Variables.AddVariable(cn_RestParam, 'DateEnd', '''' + DateToStr(DateEnd) + '''');
      FReport.Variables.AddVariable(cn_RestParam, 'CompanyName', '''' + FCompanyName + '''');
      if FReport.PrepareReport then
      begin
        InitReportParams(FReport, PrinterName);
        FReport.ShowPreparedReport;
      end;
    finally
      Str.Free;
    end;
  finally
    BaseQueryList.Report := nil;
    FReport.Free;
  end;
end;

function TRestReport.PrintDeleteServiceCheck(const ReportType, PrnGrID,
  DocumentKey, MasterKey: Integer; const PrinterName: String; PrinterID: Integer): Boolean;
var
  FReport: Tgs_fr4SingleReport;
  Str: TStream;
  BaseQueryList: TgsQueryList;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');
  BaseQueryList := FrontData.BaseQueryList;
  BaseQueryList.Clear;

  FReport := Tgs_fr4SingleReport.Create(nil);
  BaseQueryList.Report := FReport;
  try
    try
      Str := TMemoryStream.Create;
      try
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
        FReport.DataSets.Clear;
        FReport.Variables.Clear;
        FReport.Variables[' ' + cn_RestParam] := Null;
        FReport.Variables.AddVariable(cn_RestParam, 'PrnGrID', '''' + VarToStr(PrnGrID) + '''');
        FReport.Variables.AddVariable(cn_RestParam, 'DocID', '''' + VarToStr(DocumentKey) + '''');
        FReport.Variables.AddVariable(cn_RestParam, 'LineID', '''' + VarToStr(MasterKey) + '''');
        FReport.Variables.AddVariable(cn_RestParam, 'PrinterName', '''' + VarToStr(PrinterName) + '''');
        FReport.Variables.AddVariable(cn_RestParam, 'ComputerName', '''' + GetLocalComputerName + '''');
        if FReport.PrepareReport then
        begin
          InitReportParams(FReport, PrinterName);
          FReport.Print;
        end;
        Result := True;
      finally
        Str.Free;
      end;
    except
      Result := False;
      raise;
    end;
  finally
    BaseQueryList.Report := nil;
    FReport.Free;
  end;
end;

procedure TRestReport.PrintIncomeReport(const DateBegin, DateEnd: TDate);
var
  PrinterName: String;
  FReport: Tgs_fr4SingleReport;
  Str: TStream;
  BaseQueryList: TgsQueryList;
  FPrinterInfo: TPrinterInfo;
  FCompanyName: String;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  BaseQueryList := FrontData.BaseQueryList;
  BaseQueryList.Clear;

  FPrinterInfo := FFrontBase.GetPrinterInfo;
  PrinterName := FPrinterInfo.PrinterName;

  FReport := Tgs_fr4SingleReport.Create(nil);
  BaseQueryList.Report := FReport;
  try
    Str := TMemoryStream.Create;
    try
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
      FReport.DataSets.Clear;
      FReport.Variables.Clear;
      FReport.Variables[' ' + cn_RestParam] := Null;
      FReport.Variables.AddVariable(cn_RestParam, 'DateBegin', '''' + DateToStr(DateBegin) + '''');
      FReport.Variables.AddVariable(cn_RestParam, 'DateEnd', '''' + DateToStr(DateEnd) + '''');
      FCompanyName := FFrontBase.Options.CheckLine1 +
        ' ' + FFrontBase.Options.CheckLine2 + ' ' +
        FFrontBase.Options.CheckLine3 + ' ' + FFrontBase.Options.CheckLine4;
      FReport.Variables.AddVariable(cn_RestParam, 'CompanyName', '''' + FCompanyName + '''');
      if FReport.PrepareReport then
      begin
        InitReportParams(FReport, PrinterName);
        FReport.ShowPreparedReport;
      end;
    finally
      BaseQueryList.Report := nil;
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
  FPrinterInfo: TPrinterInfo;
  BaseQueryList: TgsQueryList;
begin
  Result := False;

  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  BaseQueryList := FrontData.BaseQueryList;
  BaseQueryList.Clear;

  FPrinterInfo := FFrontBase.GetPrinterInfo;
  PrinterName := FPrinterInfo.PrinterName;
  if PrinterName = '' then
  begin
    Touch_MessageBox('Внимание', 'Для данной рабочей станции не указан пречековый принтер!', MB_OK, mtWarning);
    exit;
  end;

  FReport := Tgs_fr4SingleReport.Create(nil);
  BaseQueryList.Report := FReport;
  try
    Str := TMemoryStream.Create;
    try
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
      FReport.DataSets.Clear;
      FReport.Variables.Clear;
      FReport.Variables[' ' + cn_RestParam] := Null;
      FReport.Variables.AddVariable(cn_RestParam, 'DocID', '''' + VarToStr(DocID) + '''');
      if FReport.PrepareReport then
      begin
        InitReportParams(FReport, PrinterName);
        FReport.Print;
      end;
      Result := True;
    finally
      Str.Free;
    end;
  finally
    BaseQueryList.Report := nil;
    FReport.Free;
  end;
end;

procedure TRestReport.PrintRealization(const DateBegin, DateEnd: TDate);
var
  PrinterName: String;
  FReport: Tgs_fr4SingleReport;
  Str: TStream;
  BaseQueryList: TgsQueryList;
  FPrinterInfo: TPrinterInfo;
  FCompanyName: String;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  BaseQueryList := FrontData.BaseQueryList;
  BaseQueryList.Clear;

  FPrinterInfo := FFrontBase.GetPrinterInfo;
  PrinterName := FPrinterInfo.PrinterName;
  if PrinterName = '' then
  begin
    Touch_MessageBox('Внимание', 'Для данной рабочей станции не указан пречековый принтер!', MB_OK, mtWarning);
    exit;
  end;
  FReport := Tgs_fr4SingleReport.Create(nil);
  BaseQueryList.Report := FReport;
  try
    Str := TMemoryStream.Create;
    try
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
      FReport.DataSets.Clear;
      FReport.Variables.Clear;
      FReport.Variables[' ' + cn_RestParam] := Null;
      FReport.Variables.AddVariable(cn_RestParam, 'DateBegin', '''' + DateToStr(DateBegin) + '''');
      FReport.Variables.AddVariable(cn_RestParam, 'DateEnd', '''' + DateToStr(DateEnd) + '''');
      FCompanyName := FFrontBase.Options.CheckLine1 +
        ' ' + FFrontBase.Options.CheckLine2 + ' ' +
        FFrontBase.Options.CheckLine3 + ' ' + FFrontBase.Options.CheckLine4;
      FReport.Variables.AddVariable(cn_RestParam, 'CompanyName', '''' + FCompanyName + '''');
      if FReport.PrepareReport then
      begin
        InitReportParams(FReport, PrinterName);
        FReport.ShowPreparedReport;
      end;
    finally
      Str.Free;
    end;
  finally
    FReport.Free;
    BaseQueryList.Report := nil;
  end;
end;

function TRestReport.PrintServiceCheck(const ReportType, PrnGrID,
  DocID: Integer; const PrinterName: String; PrinterID: Integer): Boolean;
var
  FReport: Tgs_fr4SingleReport;
  Str: TStream;
  BaseQueryList: TgsQueryList;
begin
  Result := False;

  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  BaseQueryList := FrontData.BaseQueryList;
  BaseQueryList.Clear;

  FReport := Tgs_fr4SingleReport.Create(nil);
  BaseQueryList.Report := FReport;
  try
    Str := TMemoryStream.Create;
    try
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
      FReport.DataSets.Clear;
      FReport.Variables.Clear;
      FReport.Variables[' ' + cn_RestParam] := Null;
      FReport.Variables.AddVariable(cn_RestParam, 'PrnGrID', '''' + VarToStr(PrnGrID) + '''');
      FReport.Variables.AddVariable(cn_RestParam, 'DocID', '''' + VarToStr(DocID) + '''');
      FReport.Variables.AddVariable(cn_RestParam, 'PrinterName', '''' + VarToStr(PrinterName) + '''');
      FReport.Variables.AddVariable(cn_RestParam, 'ComputerName', '''' + GetLocalComputerName + '''');
      if FReport.PrepareReport then
      begin
        InitReportParams(FReport, PrinterName);
        FReport.Print;
      end;
      Result := True;
    finally
      Str.Free;
    end;
  finally
    BaseQueryList.Report := nil;
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
    FSQL.ParamByName('comp').AsString := GetLocalComputerName;
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

function TRestReport.DeleteServiceCheckOptions(const DocID, MasterKey,
  DocumentKey: Integer): Boolean;
var
  FSQL: TIBSQL;
begin
  Result := False;

  FSQL := TIBSQL.Create(nil);
  FSQL.Transaction := FFrontBase.ReadTransaction;
  try
    FSQL.SQL.Text :=
      'select ' +
      '  DISTINCT setprn.id as prnid, ' +
      '  IIF(setprn.usr$concatchecks = 0, prn.id, null) as prngrid, ' +
      '  setprn.usr$printername,                                    ' +
      '  o.documentkey, prn.usr$name, setprn.usr$PRINTERID          ' +
      'from                                                         ' +
      '  usr$mn_order o                                             ' +
      '  join usr$mn_orderline l on o.documentkey = l.masterkey     ' +
      '  join gd_document doc on doc.id = l.documentkey             ' +
      '  join gd_good g on g.id = l.usr$goodkey                     ' +
      '  join usr$mn_prngroup prn on prn.id = g.usr$prngroupkey     ' +
      '  join usr$mn_prngroupset setprn on setprn.usr$prngroup = prn.id  ' +
      'where                                                        ' +
      ' o.documentkey = :masterkey                                  ' +
      ' and l.documentkey = :docid                                  ' +
      ' and setprn.usr$computername = :comp                         ' +
      ' and setprn.usr$kassa = 0                                    ' +
      'order by                                                     ' +
      '  setprn.usr$printername,                                    ' +
      '  prn.usr$name ';
    FSQL.ParamByName('docid').AsInteger := DocID;
    FSQL.ParamByName('masterkey').AsInteger := MasterKey;
    FSQL.ParamByName('comp').AsString := GetLocalComputerName;
    FSQL.ExecQuery;
    while not FSQL.Eof do
    begin
      PrintDeleteServiceCheck(1, FSQL.FieldByName('prngrid').AsInteger, MasterKey, DocumentKey,
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
