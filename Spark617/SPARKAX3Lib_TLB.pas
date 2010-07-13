unit SPARKAX3Lib_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 02.12.2009 9:01:24 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Front\SparkAx3.dll (1)
// LIBID: {E1107601-64F0-11D7-9543-00C02631588F}
// LCID: 0
// Helpfile: 
// HelpString: SparkAx3 1.0 Type Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
// Errors:
//   Hint: Parameter 'Type' of ISpark617TF.SetPaymentMean changed to 'Type_'
//   Error creating palette bitmap of (TSpark617TF) : Server C:\PROGRA~1\1Cv77\Bin\SparkAx3.dll contains no icons
//   Error creating palette bitmap of (TSpark617TFPropPage) : Server C:\PROGRA~1\1Cv77\Bin\SparkAx3.dll contains no icons
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  SPARKAX3LibMajorVersion = 1;
  SPARKAX3LibMinorVersion = 0;

  LIBID_SPARKAX3Lib: TGUID = '{E1107601-64F0-11D7-9543-00C02631588F}';

  IID_ISpark617TF: TGUID = '{E110760D-64F0-11D7-9543-00C02631588F}';
  CLASS_Spark617TF: TGUID = '{E110760E-64F0-11D7-9543-00C02631588F}';
  CLASS_Spark617TFPropPage: TGUID = '{144C4950-31E5-4797-9851-B6F0B90E7595}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ISpark617TF = interface;
  ISpark617TFDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Spark617TF = ISpark617TF;
  Spark617TFPropPage = IUnknown;


// *********************************************************************//
// Interface: ISpark617TF
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E110760D-64F0-11D7-9543-00C02631588F}
// *********************************************************************//
  ISpark617TF = interface(IDispatch)
    ['{E110760D-64F0-11D7-9543-00C02631588F}']
    function GetErrorComment(nCode: Integer): WideString; safecall;
    function InitDevice: Integer; safecall;
    function DeinitDevice: Integer; safecall;
    function GetDeviceInfo(nType: Integer): Integer; safecall;
    function SetDeviceOpt(nOpt: Integer; nVal: Integer): Integer; safecall;
    function StartSession(const ClerkName: WideString; nPOSId: Integer): Integer; safecall;
    function EndSession: Integer; safecall;
    function GetSessionInfo(nType: Integer): Integer; safecall;
    function StartDocument(nType: Integer; nSection: Integer; nCustomerId: Integer; 
                           const sClerkName: WideString): Integer; safecall;
    function CancelDocument: Integer; safecall;
    function EndDocument: Integer; safecall;
    function GetDocInfo(nType: Integer): Integer; safecall;
    function Item(nQuantity: Integer; nAmount: Integer; const sText: WideString; nTaxGroup: Integer): Integer; safecall;
    function VoidItem(nQuantity: Integer; nAmount: Integer; const sText: WideString; 
                      nTaxGroup: Integer): Integer; safecall;
    function AbsoluteCorrection(nValue: Integer): Integer; safecall;
    function PercentCorrection(nPercent: Integer): Integer; safecall;
    function Tender(nAmount: Integer; nType: Integer; const sCardNum: WideString; 
                    const sAuthCode: WideString): Integer; safecall;
    function TextLine(const sText: WideString): Integer; safecall;
    function PrintResult: Integer; safecall;
    function OpenDrawer: Integer; safecall;
    function PrintReport(nType: Integer): Integer; safecall;
    function SetDate(day: Integer; month: Integer; year: Integer): Integer; safecall;
    function SetTime(hour: Integer; minutes: Integer; seconds: Integer): Integer; safecall;
    function SetOrderHeader(nNumStr: Integer; const sText: WideString; Mode: Integer): Integer; safecall;
    function SetAccessKey(const sKey: WideString): Integer; safecall;
    function GetTextDeviceInfo(nType: Integer): WideString; safecall;
    function CorrectLastItem: Integer; safecall;
    function ResetPayInfo: Integer; safecall;
    function RepeatItem: Integer; safecall;
    function TestPrinter(nType: Integer): Integer; safecall;
    function SetNPOS(nPos: Integer): Integer; safecall;
    function GetNPOS: Integer; safecall;
    function GetTaxRate(Index: Integer): Integer; safecall;
    function SetTaxRate(Index: Integer; Rate: Integer): Integer; safecall;
    function SetTaxChain(NumChain: Integer; const Chain: WideString): Integer; safecall;
    function GetTaxChain(NumChain: SYSINT): WideString; safecall;
    function EnableTaxChains: Integer; safecall;
    function DisableTaxChains: Integer; safecall;
    function TaxChainReport100(NumChain: Integer): Integer; safecall;
    function TaxChainReport(NumChain: Integer; Sum: Integer): Integer; safecall;
    function TaxChainsReport: Integer; safecall;
    function GetDeviceOpt(nOpt: Integer): Integer; safecall;
    procedure SetDefaults; safecall;
    function SetClerk(const ClerkName: WideString): Integer; safecall;
    function SetDescriptorText(nNumDescriptor: Integer; const sDescriptorText: WideString): Integer; safecall;
    function SetExtraDocData(lDesc42: Integer; lDesc81: Integer; lDesc82: Integer; 
                             const sDesc80: WideString): Integer; safecall;
    function AbsoluteCorrectionText(nValue: Integer; const sText: WideString): Integer; safecall;
    function ItemEx(nQuantity: Integer; nAmount: Integer; const sText: WideString; 
                    nTaxGroup: Integer; nSection: Integer): Integer; safecall;
    function ReturnTare(nPrice: Integer; nQuantity: Integer): Integer; safecall;
    function ResetError: Integer; safecall;
    function SetPaymentMean(Num: Integer; const Name: WideString; Type_: Integer; 
                            CheckTotal: Integer; OpenDrawer: Integer; AllowChange: Integer): Integer; safecall;
    function VoidItemEx(nQuantity: Integer; nAmount: Integer; const sText: WideString; 
                        nTaxGroup: Integer; nSection: Integer): Integer; safecall;
    function GetLanguagesCount: Integer; safecall;
    function GetLanguageInfo(Index: Integer; out pName: WideString; out pFileName: WideString; 
                             out pId: Integer; out pDefault: Integer): Integer; safecall;
    function SetLanguage(LanguageId: Integer): Integer; safecall;
    function SetDriverOpt(nOpt: Integer; nVal: Integer): Integer; safecall;
    function GetDriverOpt(nOpt: Integer): Integer; safecall;
    function SetTextDriverOpt(nOpt: Integer; const nVal: WideString): Integer; safecall;
    function ProgramBarCodeDirect(const bstrVal: WideString): Integer; safecall;
    function LoadImage(lNum: Integer; const bstrFileName: WideString): Integer; safecall;
    function DeleteImage(lNum: Integer): Integer; safecall;
    function SetImage(lNum: Integer): Integer; safecall;
    function ProgramBarCode(nPrintCodeAfter: Integer; nPrintCodeBefore: Integer; 
                            nAlignment: Integer; nScaling: Integer; nWidth: Integer; 
                            nFontSize: Integer; nCodingSchema: Integer; nHeight: Integer; 
                            const bstrCode: WideString): Integer; safecall;
    function GetDoubleDeviceInfo(nType: Integer): Double; safecall;
    function AddExtraString(const ExtraString: WideString): Integer; safecall;
    function ClearExtraStrings: Integer; safecall;
    function EKLZPrintReportByNum(ReportType: Integer; Prm1: Integer; Prm2: Integer; Prm3: Integer): Integer; safecall;
    function EKLZPrintReportByDate(ReportType: Integer; Prm1: Integer; Date1: TDateTime; 
                                   Date2: TDateTime): Integer; safecall;
    function Tender2(nAmount: Double; nType: Integer; const sCardNum: WideString; 
                     const sAuthCode: WideString): Integer; safecall;
    function ItemTare(nQuantity: Integer; nPrice: Integer; const sText: WideString; 
                      nTaxGroup: Integer): Integer; safecall;
    function ItemTareEx(nQuantity: Integer; nPrice: Integer; const sText: WideString; 
                        nTaxGroup: Integer; nSection: Integer): Integer; safecall;
    function VoidItemTare(nQuantity: Integer; nPrice: Integer; const sText: WideString; 
                          nTaxGroup: Integer): Integer; safecall;
    function VoidItemTareEx(nQuantity: Integer; nPrice: Integer; const sText: WideString; 
                            nTaxGroup: Integer; nSection: Integer): Integer; safecall;
    function VoidReturnTare(nPrice: Integer; nQuantity: Integer): Integer; safecall;
    function InitLineDisplay: Integer; safecall;
    function StringToLineDisplay(const Msg: WideString): Integer; safecall;
    function StringToLineDisplayDirect(const sData: WideString): Integer; safecall;
    function PrintDuplicate: Integer; safecall;
    function AddExtraString2(const ExtraString: WideString; Index: Integer): Integer; safecall;
    function GetErrorCode2: Integer; safecall;
    function GetErrorComment2(nCode: Integer): WideString; safecall;
    function StartDocument2(nType: Integer; nSection: Integer; const sClerkName: WideString): Integer; safecall;
    function SetExtraDocData2(const sDesc42: WideString; const sDesc81: WideString; 
                              const sDesc82: WideString; const sDesc80: WideString): Integer; safecall;
    function OdinS_GetVersion: WideString; safecall;
    function OdinS_TestDevice(const bstrDeviceID: WideString): Integer; safecall;
    function OdinS_GetLastError(out pbstrErrorDescription: WideString): Integer; safecall;
    function OdinS_Open(out pbstrDeviceID: WideString): Integer; safecall;
    function OdinS_Close(const bstrDeviceID: WideString): Integer; safecall;
    function OdinS_PrintXReport(const bstrDeviceID: WideString): Integer; safecall;
    function OdinS_PrintZReport(const bstrDeviceID: WideString): Integer; safecall;
    function OdinS_CashInOutcome(const bstrDeviceID: WideString; Amount: Double): Integer; safecall;
    function OdinS_OpenCheck(const bstrDeviceID: WideString; IsFiscalCheck: Integer; 
                             IsReturnCheck: Integer; CancelOpenedCheck: Integer; 
                             out CheckNumber: Integer; out SessionNumber: Integer): Integer; safecall;
    function OdinS_PrintFiscalString(const bstrDeviceID: WideString; const bstrName: WideString; 
                                     Quantity: Double; Price: Double; Discount: Single; 
                                     Department: Integer; Tax: Single): Integer; safecall;
    function OdinS_CloseCheck(const bstrDeviceID: WideString; Cash: Double; Cashless: Double): Integer; safecall;
    function OdinS_CancelCheck(const bstrDeviceID: WideString): Integer; safecall;
    function OdinS_PrintNonFiscalString(const bstrDeviceID: WideString; 
                                        const bstrTextString: WideString): Integer; safecall;
  end;

// *********************************************************************//
// DispIntf:  ISpark617TFDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E110760D-64F0-11D7-9543-00C02631588F}
// *********************************************************************//
  ISpark617TFDisp = dispinterface
    ['{E110760D-64F0-11D7-9543-00C02631588F}']
    function GetErrorComment(nCode: Integer): WideString; dispid 1;
    function InitDevice: Integer; dispid 2;
    function DeinitDevice: Integer; dispid 3;
    function GetDeviceInfo(nType: Integer): Integer; dispid 4;
    function SetDeviceOpt(nOpt: Integer; nVal: Integer): Integer; dispid 5;
    function StartSession(const ClerkName: WideString; nPOSId: Integer): Integer; dispid 6;
    function EndSession: Integer; dispid 7;
    function GetSessionInfo(nType: Integer): Integer; dispid 8;
    function StartDocument(nType: Integer; nSection: Integer; nCustomerId: Integer; 
                           const sClerkName: WideString): Integer; dispid 9;
    function CancelDocument: Integer; dispid 10;
    function EndDocument: Integer; dispid 11;
    function GetDocInfo(nType: Integer): Integer; dispid 12;
    function Item(nQuantity: Integer; nAmount: Integer; const sText: WideString; nTaxGroup: Integer): Integer; dispid 13;
    function VoidItem(nQuantity: Integer; nAmount: Integer; const sText: WideString; 
                      nTaxGroup: Integer): Integer; dispid 14;
    function AbsoluteCorrection(nValue: Integer): Integer; dispid 15;
    function PercentCorrection(nPercent: Integer): Integer; dispid 16;
    function Tender(nAmount: Integer; nType: Integer; const sCardNum: WideString; 
                    const sAuthCode: WideString): Integer; dispid 17;
    function TextLine(const sText: WideString): Integer; dispid 18;
    function PrintResult: Integer; dispid 19;
    function OpenDrawer: Integer; dispid 20;
    function PrintReport(nType: Integer): Integer; dispid 21;
    function SetDate(day: Integer; month: Integer; year: Integer): Integer; dispid 22;
    function SetTime(hour: Integer; minutes: Integer; seconds: Integer): Integer; dispid 23;
    function SetOrderHeader(nNumStr: Integer; const sText: WideString; Mode: Integer): Integer; dispid 24;
    function SetAccessKey(const sKey: WideString): Integer; dispid 25;
    function GetTextDeviceInfo(nType: Integer): WideString; dispid 26;
    function CorrectLastItem: Integer; dispid 27;
    function ResetPayInfo: Integer; dispid 28;
    function RepeatItem: Integer; dispid 29;
    function TestPrinter(nType: Integer): Integer; dispid 30;
    function SetNPOS(nPos: Integer): Integer; dispid 31;
    function GetNPOS: Integer; dispid 32;
    function GetTaxRate(Index: Integer): Integer; dispid 33;
    function SetTaxRate(Index: Integer; Rate: Integer): Integer; dispid 34;
    function SetTaxChain(NumChain: Integer; const Chain: WideString): Integer; dispid 35;
    function GetTaxChain(NumChain: SYSINT): WideString; dispid 36;
    function EnableTaxChains: Integer; dispid 37;
    function DisableTaxChains: Integer; dispid 38;
    function TaxChainReport100(NumChain: Integer): Integer; dispid 39;
    function TaxChainReport(NumChain: Integer; Sum: Integer): Integer; dispid 40;
    function TaxChainsReport: Integer; dispid 41;
    function GetDeviceOpt(nOpt: Integer): Integer; dispid 42;
    procedure SetDefaults; dispid 43;
    function SetClerk(const ClerkName: WideString): Integer; dispid 44;
    function SetDescriptorText(nNumDescriptor: Integer; const sDescriptorText: WideString): Integer; dispid 45;
    function SetExtraDocData(lDesc42: Integer; lDesc81: Integer; lDesc82: Integer; 
                             const sDesc80: WideString): Integer; dispid 46;
    function AbsoluteCorrectionText(nValue: Integer; const sText: WideString): Integer; dispid 47;
    function ItemEx(nQuantity: Integer; nAmount: Integer; const sText: WideString; 
                    nTaxGroup: Integer; nSection: Integer): Integer; dispid 48;
    function ReturnTare(nPrice: Integer; nQuantity: Integer): Integer; dispid 49;
    function ResetError: Integer; dispid 50;
    function SetPaymentMean(Num: Integer; const Name: WideString; Type_: Integer; 
                            CheckTotal: Integer; OpenDrawer: Integer; AllowChange: Integer): Integer; dispid 51;
    function VoidItemEx(nQuantity: Integer; nAmount: Integer; const sText: WideString; 
                        nTaxGroup: Integer; nSection: Integer): Integer; dispid 52;
    function GetLanguagesCount: Integer; dispid 53;
    function GetLanguageInfo(Index: Integer; out pName: WideString; out pFileName: WideString; 
                             out pId: Integer; out pDefault: Integer): Integer; dispid 54;
    function SetLanguage(LanguageId: Integer): Integer; dispid 55;
    function SetDriverOpt(nOpt: Integer; nVal: Integer): Integer; dispid 56;
    function GetDriverOpt(nOpt: Integer): Integer; dispid 57;
    function SetTextDriverOpt(nOpt: Integer; const nVal: WideString): Integer; dispid 58;
    function ProgramBarCodeDirect(const bstrVal: WideString): Integer; dispid 59;
    function LoadImage(lNum: Integer; const bstrFileName: WideString): Integer; dispid 60;
    function DeleteImage(lNum: Integer): Integer; dispid 61;
    function SetImage(lNum: Integer): Integer; dispid 62;
    function ProgramBarCode(nPrintCodeAfter: Integer; nPrintCodeBefore: Integer; 
                            nAlignment: Integer; nScaling: Integer; nWidth: Integer; 
                            nFontSize: Integer; nCodingSchema: Integer; nHeight: Integer; 
                            const bstrCode: WideString): Integer; dispid 63;
    function GetDoubleDeviceInfo(nType: Integer): Double; dispid 64;
    function AddExtraString(const ExtraString: WideString): Integer; dispid 65;
    function ClearExtraStrings: Integer; dispid 66;
    function EKLZPrintReportByNum(ReportType: Integer; Prm1: Integer; Prm2: Integer; Prm3: Integer): Integer; dispid 67;
    function EKLZPrintReportByDate(ReportType: Integer; Prm1: Integer; Date1: TDateTime; 
                                   Date2: TDateTime): Integer; dispid 68;
    function Tender2(nAmount: Double; nType: Integer; const sCardNum: WideString; 
                     const sAuthCode: WideString): Integer; dispid 69;
    function ItemTare(nQuantity: Integer; nPrice: Integer; const sText: WideString; 
                      nTaxGroup: Integer): Integer; dispid 70;
    function ItemTareEx(nQuantity: Integer; nPrice: Integer; const sText: WideString; 
                        nTaxGroup: Integer; nSection: Integer): Integer; dispid 71;
    function VoidItemTare(nQuantity: Integer; nPrice: Integer; const sText: WideString; 
                          nTaxGroup: Integer): Integer; dispid 72;
    function VoidItemTareEx(nQuantity: Integer; nPrice: Integer; const sText: WideString; 
                            nTaxGroup: Integer; nSection: Integer): Integer; dispid 73;
    function VoidReturnTare(nPrice: Integer; nQuantity: Integer): Integer; dispid 74;
    function InitLineDisplay: Integer; dispid 75;
    function StringToLineDisplay(const Msg: WideString): Integer; dispid 76;
    function StringToLineDisplayDirect(const sData: WideString): Integer; dispid 77;
    function PrintDuplicate: Integer; dispid 78;
    function AddExtraString2(const ExtraString: WideString; Index: Integer): Integer; dispid 79;
    function GetErrorCode2: Integer; dispid 80;
    function GetErrorComment2(nCode: Integer): WideString; dispid 81;
    function StartDocument2(nType: Integer; nSection: Integer; const sClerkName: WideString): Integer; dispid 82;
    function SetExtraDocData2(const sDesc42: WideString; const sDesc81: WideString; 
                              const sDesc82: WideString; const sDesc80: WideString): Integer; dispid 83;
    function OdinS_GetVersion: WideString; dispid 84;
    function OdinS_TestDevice(const bstrDeviceID: WideString): Integer; dispid 85;
    function OdinS_GetLastError(out pbstrErrorDescription: WideString): Integer; dispid 86;
    function OdinS_Open(out pbstrDeviceID: WideString): Integer; dispid 87;
    function OdinS_Close(const bstrDeviceID: WideString): Integer; dispid 88;
    function OdinS_PrintXReport(const bstrDeviceID: WideString): Integer; dispid 89;
    function OdinS_PrintZReport(const bstrDeviceID: WideString): Integer; dispid 90;
    function OdinS_CashInOutcome(const bstrDeviceID: WideString; Amount: Double): Integer; dispid 91;
    function OdinS_OpenCheck(const bstrDeviceID: WideString; IsFiscalCheck: Integer; 
                             IsReturnCheck: Integer; CancelOpenedCheck: Integer; 
                             out CheckNumber: Integer; out SessionNumber: Integer): Integer; dispid 92;
    function OdinS_PrintFiscalString(const bstrDeviceID: WideString; const bstrName: WideString; 
                                     Quantity: Double; Price: Double; Discount: Single; 
                                     Department: Integer; Tax: Single): Integer; dispid 93;
    function OdinS_CloseCheck(const bstrDeviceID: WideString; Cash: Double; Cashless: Double): Integer; dispid 94;
    function OdinS_CancelCheck(const bstrDeviceID: WideString): Integer; dispid 95;
    function OdinS_PrintNonFiscalString(const bstrDeviceID: WideString; 
                                        const bstrTextString: WideString): Integer; dispid 96;
  end;

// *********************************************************************//
// The Class CoSpark617TF provides a Create and CreateRemote method to          
// create instances of the default interface ISpark617TF exposed by              
// the CoClass Spark617TF. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSpark617TF = class
    class function Create: ISpark617TF;
    class function CreateRemote(const MachineName: string): ISpark617TF;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TSpark617TF
// Help String      : Spark617TF Class
// Default Interface: ISpark617TF
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TSpark617TFProperties= class;
{$ENDIF}
  TSpark617TF = class(TOleServer)
  private
    FIntf:        ISpark617TF;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TSpark617TFProperties;
    function      GetServerProperties: TSpark617TFProperties;
{$ENDIF}
    function      GetDefaultInterface: ISpark617TF;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISpark617TF);
    procedure Disconnect; override;
    function GetErrorComment(nCode: Integer): WideString;
    function InitDevice: Integer;
    function DeinitDevice: Integer;
    function GetDeviceInfo(nType: Integer): Integer;
    function SetDeviceOpt(nOpt: Integer; nVal: Integer): Integer;
    function StartSession(const ClerkName: WideString; nPOSId: Integer): Integer;
    function EndSession: Integer;
    function GetSessionInfo(nType: Integer): Integer;
    function StartDocument(nType: Integer; nSection: Integer; nCustomerId: Integer; 
                           const sClerkName: WideString): Integer;
    function CancelDocument: Integer;
    function EndDocument: Integer;
    function GetDocInfo(nType: Integer): Integer;
    function Item(nQuantity: Integer; nAmount: Integer; const sText: WideString; nTaxGroup: Integer): Integer;
    function VoidItem(nQuantity: Integer; nAmount: Integer; const sText: WideString; 
                      nTaxGroup: Integer): Integer;
    function AbsoluteCorrection(nValue: Integer): Integer;
    function PercentCorrection(nPercent: Integer): Integer;
    function Tender(nAmount: Integer; nType: Integer; const sCardNum: WideString; 
                    const sAuthCode: WideString): Integer;
    function TextLine(const sText: WideString): Integer;
    function PrintResult: Integer;
    function OpenDrawer: Integer;
    function PrintReport(nType: Integer): Integer;
    function SetDate(day: Integer; month: Integer; year: Integer): Integer;
    function SetTime(hour: Integer; minutes: Integer; seconds: Integer): Integer;
    function SetOrderHeader(nNumStr: Integer; const sText: WideString; Mode: Integer): Integer;
    function SetAccessKey(const sKey: WideString): Integer;
    function GetTextDeviceInfo(nType: Integer): WideString;
    function CorrectLastItem: Integer;
    function ResetPayInfo: Integer;
    function RepeatItem: Integer;
    function TestPrinter(nType: Integer): Integer;
    function SetNPOS(nPos: Integer): Integer;
    function GetNPOS: Integer;
    function GetTaxRate(Index: Integer): Integer;
    function SetTaxRate(Index: Integer; Rate: Integer): Integer;
    function SetTaxChain(NumChain: Integer; const Chain: WideString): Integer;
    function GetTaxChain(NumChain: SYSINT): WideString;
    function EnableTaxChains: Integer;
    function DisableTaxChains: Integer;
    function TaxChainReport100(NumChain: Integer): Integer;
    function TaxChainReport(NumChain: Integer; Sum: Integer): Integer;
    function TaxChainsReport: Integer;
    function GetDeviceOpt(nOpt: Integer): Integer;
    procedure SetDefaults;
    function SetClerk(const ClerkName: WideString): Integer;
    function SetDescriptorText(nNumDescriptor: Integer; const sDescriptorText: WideString): Integer;
    function SetExtraDocData(lDesc42: Integer; lDesc81: Integer; lDesc82: Integer; 
                             const sDesc80: WideString): Integer;
    function AbsoluteCorrectionText(nValue: Integer; const sText: WideString): Integer;
    function ItemEx(nQuantity: Integer; nAmount: Integer; const sText: WideString; 
                    nTaxGroup: Integer; nSection: Integer): Integer;
    function ReturnTare(nPrice: Integer; nQuantity: Integer): Integer;
    function ResetError: Integer;
    function SetPaymentMean(Num: Integer; const Name: WideString; Type_: Integer; 
                            CheckTotal: Integer; OpenDrawer: Integer; AllowChange: Integer): Integer;
    function VoidItemEx(nQuantity: Integer; nAmount: Integer; const sText: WideString; 
                        nTaxGroup: Integer; nSection: Integer): Integer;
    function GetLanguagesCount: Integer;
    function GetLanguageInfo(Index: Integer; out pName: WideString; out pFileName: WideString; 
                             out pId: Integer; out pDefault: Integer): Integer;
    function SetLanguage(LanguageId: Integer): Integer;
    function SetDriverOpt(nOpt: Integer; nVal: Integer): Integer;
    function GetDriverOpt(nOpt: Integer): Integer;
    function SetTextDriverOpt(nOpt: Integer; const nVal: WideString): Integer;
    function ProgramBarCodeDirect(const bstrVal: WideString): Integer;
    function LoadImage(lNum: Integer; const bstrFileName: WideString): Integer;
    function DeleteImage(lNum: Integer): Integer;
    function SetImage(lNum: Integer): Integer;
    function ProgramBarCode(nPrintCodeAfter: Integer; nPrintCodeBefore: Integer; 
                            nAlignment: Integer; nScaling: Integer; nWidth: Integer; 
                            nFontSize: Integer; nCodingSchema: Integer; nHeight: Integer; 
                            const bstrCode: WideString): Integer;
    function GetDoubleDeviceInfo(nType: Integer): Double;
    function AddExtraString(const ExtraString: WideString): Integer;
    function ClearExtraStrings: Integer;
    function EKLZPrintReportByNum(ReportType: Integer; Prm1: Integer; Prm2: Integer; Prm3: Integer): Integer;
    function EKLZPrintReportByDate(ReportType: Integer; Prm1: Integer; Date1: TDateTime; 
                                   Date2: TDateTime): Integer;
    function Tender2(nAmount: Double; nType: Integer; const sCardNum: WideString; 
                     const sAuthCode: WideString): Integer;
    function ItemTare(nQuantity: Integer; nPrice: Integer; const sText: WideString; 
                      nTaxGroup: Integer): Integer;
    function ItemTareEx(nQuantity: Integer; nPrice: Integer; const sText: WideString; 
                        nTaxGroup: Integer; nSection: Integer): Integer;
    function VoidItemTare(nQuantity: Integer; nPrice: Integer; const sText: WideString; 
                          nTaxGroup: Integer): Integer;
    function VoidItemTareEx(nQuantity: Integer; nPrice: Integer; const sText: WideString; 
                            nTaxGroup: Integer; nSection: Integer): Integer;
    function VoidReturnTare(nPrice: Integer; nQuantity: Integer): Integer;
    function InitLineDisplay: Integer;
    function StringToLineDisplay(const Msg: WideString): Integer;
    function StringToLineDisplayDirect(const sData: WideString): Integer;
    function PrintDuplicate: Integer;
    function AddExtraString2(const ExtraString: WideString; Index: Integer): Integer;
    function GetErrorCode2: Integer;
    function GetErrorComment2(nCode: Integer): WideString;
    function StartDocument2(nType: Integer; nSection: Integer; const sClerkName: WideString): Integer;
    function SetExtraDocData2(const sDesc42: WideString; const sDesc81: WideString; 
                              const sDesc82: WideString; const sDesc80: WideString): Integer;
    function OdinS_GetVersion: WideString;
    function OdinS_TestDevice(const bstrDeviceID: WideString): Integer;
    function OdinS_GetLastError(out pbstrErrorDescription: WideString): Integer;
    function OdinS_Open(out pbstrDeviceID: WideString): Integer;
    function OdinS_Close(const bstrDeviceID: WideString): Integer;
    function OdinS_PrintXReport(const bstrDeviceID: WideString): Integer;
    function OdinS_PrintZReport(const bstrDeviceID: WideString): Integer;
    function OdinS_CashInOutcome(const bstrDeviceID: WideString; Amount: Double): Integer;
    function OdinS_OpenCheck(const bstrDeviceID: WideString; IsFiscalCheck: Integer; 
                             IsReturnCheck: Integer; CancelOpenedCheck: Integer; 
                             out CheckNumber: Integer; out SessionNumber: Integer): Integer;
    function OdinS_PrintFiscalString(const bstrDeviceID: WideString; const bstrName: WideString; 
                                     Quantity: Double; Price: Double; Discount: Single; 
                                     Department: Integer; Tax: Single): Integer;
    function OdinS_CloseCheck(const bstrDeviceID: WideString; Cash: Double; Cashless: Double): Integer;
    function OdinS_CancelCheck(const bstrDeviceID: WideString): Integer;
    function OdinS_PrintNonFiscalString(const bstrDeviceID: WideString; 
                                        const bstrTextString: WideString): Integer;
    property DefaultInterface: ISpark617TF read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TSpark617TFProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TSpark617TF
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TSpark617TFProperties = class(TPersistent)
  private
    FServer:    TSpark617TF;
    function    GetDefaultInterface: ISpark617TF;
    constructor Create(AServer: TSpark617TF);
  protected
  public
    property DefaultInterface: ISpark617TF read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoSpark617TFPropPage provides a Create and CreateRemote method to          
// create instances of the default interface IUnknown exposed by              
// the CoClass Spark617TFPropPage. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSpark617TFPropPage = class
    class function Create: IUnknown;
    class function CreateRemote(const MachineName: string): IUnknown;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TSpark617TFPropPage
// Help String      : Spark617TFPropPage Class
// Default Interface: IUnknown
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TSpark617TFPropPageProperties= class;
{$ENDIF}
  TSpark617TFPropPage = class(TOleServer)
  private
    FIntf:        IUnknown;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TSpark617TFPropPageProperties;
    function      GetServerProperties: TSpark617TFPropPageProperties;
{$ENDIF}
    function      GetDefaultInterface: IUnknown;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IUnknown);
    procedure Disconnect; override;
    property DefaultInterface: IUnknown read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TSpark617TFPropPageProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TSpark617TFPropPage
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TSpark617TFPropPageProperties = class(TPersistent)
  private
    FServer:    TSpark617TFPropPage;
    function    GetDefaultInterface: IUnknown;
    constructor Create(AServer: TSpark617TFPropPage);
  protected
  public
    property DefaultInterface: IUnknown read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoSpark617TF.Create: ISpark617TF;
begin
  Result := CreateComObject(CLASS_Spark617TF) as ISpark617TF;
end;

class function CoSpark617TF.CreateRemote(const MachineName: string): ISpark617TF;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Spark617TF) as ISpark617TF;
end;

procedure TSpark617TF.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{E110760E-64F0-11D7-9543-00C02631588F}';
    IntfIID:   '{E110760D-64F0-11D7-9543-00C02631588F}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpark617TF.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ISpark617TF;
  end;
end;

procedure TSpark617TF.ConnectTo(svrIntf: ISpark617TF);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpark617TF.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpark617TF.GetDefaultInterface: ISpark617TF;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TSpark617TF.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TSpark617TFProperties.Create(Self);
{$ENDIF}
end;

destructor TSpark617TF.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TSpark617TF.GetServerProperties: TSpark617TFProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TSpark617TF.GetErrorComment(nCode: Integer): WideString;
begin
  Result := DefaultInterface.GetErrorComment(nCode);
end;

function TSpark617TF.InitDevice: Integer;
begin
  Result := DefaultInterface.InitDevice;
end;

function TSpark617TF.DeinitDevice: Integer;
begin
  Result := DefaultInterface.DeinitDevice;
end;

function TSpark617TF.GetDeviceInfo(nType: Integer): Integer;
begin
  Result := DefaultInterface.GetDeviceInfo(nType);
end;

function TSpark617TF.SetDeviceOpt(nOpt: Integer; nVal: Integer): Integer;
begin
  Result := DefaultInterface.SetDeviceOpt(nOpt, nVal);
end;

function TSpark617TF.StartSession(const ClerkName: WideString; nPOSId: Integer): Integer;
begin
  Result := DefaultInterface.StartSession(ClerkName, nPOSId);
end;

function TSpark617TF.EndSession: Integer;
begin
  Result := DefaultInterface.EndSession;
end;

function TSpark617TF.GetSessionInfo(nType: Integer): Integer;
begin
  Result := DefaultInterface.GetSessionInfo(nType);
end;

function TSpark617TF.StartDocument(nType: Integer; nSection: Integer; nCustomerId: Integer; 
                                   const sClerkName: WideString): Integer;
begin
  Result := DefaultInterface.StartDocument(nType, nSection, nCustomerId, sClerkName);
end;

function TSpark617TF.CancelDocument: Integer;
begin
  Result := DefaultInterface.CancelDocument;
end;

function TSpark617TF.EndDocument: Integer;
begin
  Result := DefaultInterface.EndDocument;
end;

function TSpark617TF.GetDocInfo(nType: Integer): Integer;
begin
  Result := DefaultInterface.GetDocInfo(nType);
end;

function TSpark617TF.Item(nQuantity: Integer; nAmount: Integer; const sText: WideString; 
                          nTaxGroup: Integer): Integer;
begin
  Result := DefaultInterface.Item(nQuantity, nAmount, sText, nTaxGroup);
end;

function TSpark617TF.VoidItem(nQuantity: Integer; nAmount: Integer; const sText: WideString; 
                              nTaxGroup: Integer): Integer;
begin
  Result := DefaultInterface.VoidItem(nQuantity, nAmount, sText, nTaxGroup);
end;

function TSpark617TF.AbsoluteCorrection(nValue: Integer): Integer;
begin
  Result := DefaultInterface.AbsoluteCorrection(nValue);
end;

function TSpark617TF.PercentCorrection(nPercent: Integer): Integer;
begin
  Result := DefaultInterface.PercentCorrection(nPercent);
end;

function TSpark617TF.Tender(nAmount: Integer; nType: Integer; const sCardNum: WideString; 
                            const sAuthCode: WideString): Integer;
begin
  Result := DefaultInterface.Tender(nAmount, nType, sCardNum, sAuthCode);
end;

function TSpark617TF.TextLine(const sText: WideString): Integer;
begin
  Result := DefaultInterface.TextLine(sText);
end;

function TSpark617TF.PrintResult: Integer;
begin
  Result := DefaultInterface.PrintResult;
end;

function TSpark617TF.OpenDrawer: Integer;
begin
  Result := DefaultInterface.OpenDrawer;
end;

function TSpark617TF.PrintReport(nType: Integer): Integer;
begin
  Result := DefaultInterface.PrintReport(nType);
end;

function TSpark617TF.SetDate(day: Integer; month: Integer; year: Integer): Integer;
begin
  Result := DefaultInterface.SetDate(day, month, year);
end;

function TSpark617TF.SetTime(hour: Integer; minutes: Integer; seconds: Integer): Integer;
begin
  Result := DefaultInterface.SetTime(hour, minutes, seconds);
end;

function TSpark617TF.SetOrderHeader(nNumStr: Integer; const sText: WideString; Mode: Integer): Integer;
begin
  Result := DefaultInterface.SetOrderHeader(nNumStr, sText, Mode);
end;

function TSpark617TF.SetAccessKey(const sKey: WideString): Integer;
begin
  Result := DefaultInterface.SetAccessKey(sKey);
end;

function TSpark617TF.GetTextDeviceInfo(nType: Integer): WideString;
begin
  Result := DefaultInterface.GetTextDeviceInfo(nType);
end;

function TSpark617TF.CorrectLastItem: Integer;
begin
  Result := DefaultInterface.CorrectLastItem;
end;

function TSpark617TF.ResetPayInfo: Integer;
begin
  Result := DefaultInterface.ResetPayInfo;
end;

function TSpark617TF.RepeatItem: Integer;
begin
  Result := DefaultInterface.RepeatItem;
end;

function TSpark617TF.TestPrinter(nType: Integer): Integer;
begin
  Result := DefaultInterface.TestPrinter(nType);
end;

function TSpark617TF.SetNPOS(nPos: Integer): Integer;
begin
  Result := DefaultInterface.SetNPOS(nPos);
end;

function TSpark617TF.GetNPOS: Integer;
begin
  Result := DefaultInterface.GetNPOS;
end;

function TSpark617TF.GetTaxRate(Index: Integer): Integer;
begin
  Result := DefaultInterface.GetTaxRate(Index);
end;

function TSpark617TF.SetTaxRate(Index: Integer; Rate: Integer): Integer;
begin
  Result := DefaultInterface.SetTaxRate(Index, Rate);
end;

function TSpark617TF.SetTaxChain(NumChain: Integer; const Chain: WideString): Integer;
begin
  Result := DefaultInterface.SetTaxChain(NumChain, Chain);
end;

function TSpark617TF.GetTaxChain(NumChain: SYSINT): WideString;
begin
  Result := DefaultInterface.GetTaxChain(NumChain);
end;

function TSpark617TF.EnableTaxChains: Integer;
begin
  Result := DefaultInterface.EnableTaxChains;
end;

function TSpark617TF.DisableTaxChains: Integer;
begin
  Result := DefaultInterface.DisableTaxChains;
end;

function TSpark617TF.TaxChainReport100(NumChain: Integer): Integer;
begin
  Result := DefaultInterface.TaxChainReport100(NumChain);
end;

function TSpark617TF.TaxChainReport(NumChain: Integer; Sum: Integer): Integer;
begin
  Result := DefaultInterface.TaxChainReport(NumChain, Sum);
end;

function TSpark617TF.TaxChainsReport: Integer;
begin
  Result := DefaultInterface.TaxChainsReport;
end;

function TSpark617TF.GetDeviceOpt(nOpt: Integer): Integer;
begin
  Result := DefaultInterface.GetDeviceOpt(nOpt);
end;

procedure TSpark617TF.SetDefaults;
begin
  DefaultInterface.SetDefaults;
end;

function TSpark617TF.SetClerk(const ClerkName: WideString): Integer;
begin
  Result := DefaultInterface.SetClerk(ClerkName);
end;

function TSpark617TF.SetDescriptorText(nNumDescriptor: Integer; const sDescriptorText: WideString): Integer;
begin
  Result := DefaultInterface.SetDescriptorText(nNumDescriptor, sDescriptorText);
end;

function TSpark617TF.SetExtraDocData(lDesc42: Integer; lDesc81: Integer; lDesc82: Integer; 
                                     const sDesc80: WideString): Integer;
begin
  Result := DefaultInterface.SetExtraDocData(lDesc42, lDesc81, lDesc82, sDesc80);
end;

function TSpark617TF.AbsoluteCorrectionText(nValue: Integer; const sText: WideString): Integer;
begin
  Result := DefaultInterface.AbsoluteCorrectionText(nValue, sText);
end;

function TSpark617TF.ItemEx(nQuantity: Integer; nAmount: Integer; const sText: WideString; 
                            nTaxGroup: Integer; nSection: Integer): Integer;
begin
  Result := DefaultInterface.ItemEx(nQuantity, nAmount, sText, nTaxGroup, nSection);
end;

function TSpark617TF.ReturnTare(nPrice: Integer; nQuantity: Integer): Integer;
begin
  Result := DefaultInterface.ReturnTare(nPrice, nQuantity);
end;

function TSpark617TF.ResetError: Integer;
begin
  Result := DefaultInterface.ResetError;
end;

function TSpark617TF.SetPaymentMean(Num: Integer; const Name: WideString; Type_: Integer; 
                                    CheckTotal: Integer; OpenDrawer: Integer; AllowChange: Integer): Integer;
begin
  Result := DefaultInterface.SetPaymentMean(Num, Name, Type_, CheckTotal, OpenDrawer, AllowChange);
end;

function TSpark617TF.VoidItemEx(nQuantity: Integer; nAmount: Integer; const sText: WideString; 
                                nTaxGroup: Integer; nSection: Integer): Integer;
begin
  Result := DefaultInterface.VoidItemEx(nQuantity, nAmount, sText, nTaxGroup, nSection);
end;

function TSpark617TF.GetLanguagesCount: Integer;
begin
  Result := DefaultInterface.GetLanguagesCount;
end;

function TSpark617TF.GetLanguageInfo(Index: Integer; out pName: WideString; 
                                     out pFileName: WideString; out pId: Integer; 
                                     out pDefault: Integer): Integer;
begin
  Result := DefaultInterface.GetLanguageInfo(Index, pName, pFileName, pId, pDefault);
end;

function TSpark617TF.SetLanguage(LanguageId: Integer): Integer;
begin
  Result := DefaultInterface.SetLanguage(LanguageId);
end;

function TSpark617TF.SetDriverOpt(nOpt: Integer; nVal: Integer): Integer;
begin
  Result := DefaultInterface.SetDriverOpt(nOpt, nVal);
end;

function TSpark617TF.GetDriverOpt(nOpt: Integer): Integer;
begin
  Result := DefaultInterface.GetDriverOpt(nOpt);
end;

function TSpark617TF.SetTextDriverOpt(nOpt: Integer; const nVal: WideString): Integer;
begin
  Result := DefaultInterface.SetTextDriverOpt(nOpt, nVal);
end;

function TSpark617TF.ProgramBarCodeDirect(const bstrVal: WideString): Integer;
begin
  Result := DefaultInterface.ProgramBarCodeDirect(bstrVal);
end;

function TSpark617TF.LoadImage(lNum: Integer; const bstrFileName: WideString): Integer;
begin
  Result := DefaultInterface.LoadImage(lNum, bstrFileName);
end;

function TSpark617TF.DeleteImage(lNum: Integer): Integer;
begin
  Result := DefaultInterface.DeleteImage(lNum);
end;

function TSpark617TF.SetImage(lNum: Integer): Integer;
begin
  Result := DefaultInterface.SetImage(lNum);
end;

function TSpark617TF.ProgramBarCode(nPrintCodeAfter: Integer; nPrintCodeBefore: Integer; 
                                    nAlignment: Integer; nScaling: Integer; nWidth: Integer; 
                                    nFontSize: Integer; nCodingSchema: Integer; nHeight: Integer; 
                                    const bstrCode: WideString): Integer;
begin
  Result := DefaultInterface.ProgramBarCode(nPrintCodeAfter, nPrintCodeBefore, nAlignment, 
                                            nScaling, nWidth, nFontSize, nCodingSchema, nHeight, 
                                            bstrCode);
end;

function TSpark617TF.GetDoubleDeviceInfo(nType: Integer): Double;
begin
  Result := DefaultInterface.GetDoubleDeviceInfo(nType);
end;

function TSpark617TF.AddExtraString(const ExtraString: WideString): Integer;
begin
  Result := DefaultInterface.AddExtraString(ExtraString);
end;

function TSpark617TF.ClearExtraStrings: Integer;
begin
  Result := DefaultInterface.ClearExtraStrings;
end;

function TSpark617TF.EKLZPrintReportByNum(ReportType: Integer; Prm1: Integer; Prm2: Integer; 
                                          Prm3: Integer): Integer;
begin
  Result := DefaultInterface.EKLZPrintReportByNum(ReportType, Prm1, Prm2, Prm3);
end;

function TSpark617TF.EKLZPrintReportByDate(ReportType: Integer; Prm1: Integer; Date1: TDateTime; 
                                           Date2: TDateTime): Integer;
begin
  Result := DefaultInterface.EKLZPrintReportByDate(ReportType, Prm1, Date1, Date2);
end;

function TSpark617TF.Tender2(nAmount: Double; nType: Integer; const sCardNum: WideString; 
                             const sAuthCode: WideString): Integer;
begin
  Result := DefaultInterface.Tender2(nAmount, nType, sCardNum, sAuthCode);
end;

function TSpark617TF.ItemTare(nQuantity: Integer; nPrice: Integer; const sText: WideString; 
                              nTaxGroup: Integer): Integer;
begin
  Result := DefaultInterface.ItemTare(nQuantity, nPrice, sText, nTaxGroup);
end;

function TSpark617TF.ItemTareEx(nQuantity: Integer; nPrice: Integer; const sText: WideString; 
                                nTaxGroup: Integer; nSection: Integer): Integer;
begin
  Result := DefaultInterface.ItemTareEx(nQuantity, nPrice, sText, nTaxGroup, nSection);
end;

function TSpark617TF.VoidItemTare(nQuantity: Integer; nPrice: Integer; const sText: WideString; 
                                  nTaxGroup: Integer): Integer;
begin
  Result := DefaultInterface.VoidItemTare(nQuantity, nPrice, sText, nTaxGroup);
end;

function TSpark617TF.VoidItemTareEx(nQuantity: Integer; nPrice: Integer; const sText: WideString; 
                                    nTaxGroup: Integer; nSection: Integer): Integer;
begin
  Result := DefaultInterface.VoidItemTareEx(nQuantity, nPrice, sText, nTaxGroup, nSection);
end;

function TSpark617TF.VoidReturnTare(nPrice: Integer; nQuantity: Integer): Integer;
begin
  Result := DefaultInterface.VoidReturnTare(nPrice, nQuantity);
end;

function TSpark617TF.InitLineDisplay: Integer;
begin
  Result := DefaultInterface.InitLineDisplay;
end;

function TSpark617TF.StringToLineDisplay(const Msg: WideString): Integer;
begin
  Result := DefaultInterface.StringToLineDisplay(Msg);
end;

function TSpark617TF.StringToLineDisplayDirect(const sData: WideString): Integer;
begin
  Result := DefaultInterface.StringToLineDisplayDirect(sData);
end;

function TSpark617TF.PrintDuplicate: Integer;
begin
  Result := DefaultInterface.PrintDuplicate;
end;

function TSpark617TF.AddExtraString2(const ExtraString: WideString; Index: Integer): Integer;
begin
  Result := DefaultInterface.AddExtraString2(ExtraString, Index);
end;

function TSpark617TF.GetErrorCode2: Integer;
begin
  Result := DefaultInterface.GetErrorCode2;
end;

function TSpark617TF.GetErrorComment2(nCode: Integer): WideString;
begin
  Result := DefaultInterface.GetErrorComment2(nCode);
end;

function TSpark617TF.StartDocument2(nType: Integer; nSection: Integer; const sClerkName: WideString): Integer;
begin
  Result := DefaultInterface.StartDocument2(nType, nSection, sClerkName);
end;

function TSpark617TF.SetExtraDocData2(const sDesc42: WideString; const sDesc81: WideString; 
                                      const sDesc82: WideString; const sDesc80: WideString): Integer;
begin
  Result := DefaultInterface.SetExtraDocData2(sDesc42, sDesc81, sDesc82, sDesc80);
end;

function TSpark617TF.OdinS_GetVersion: WideString;
begin
  Result := DefaultInterface.OdinS_GetVersion;
end;

function TSpark617TF.OdinS_TestDevice(const bstrDeviceID: WideString): Integer;
begin
  Result := DefaultInterface.OdinS_TestDevice(bstrDeviceID);
end;

function TSpark617TF.OdinS_GetLastError(out pbstrErrorDescription: WideString): Integer;
begin
  Result := DefaultInterface.OdinS_GetLastError(pbstrErrorDescription);
end;

function TSpark617TF.OdinS_Open(out pbstrDeviceID: WideString): Integer;
begin
  Result := DefaultInterface.OdinS_Open(pbstrDeviceID);
end;

function TSpark617TF.OdinS_Close(const bstrDeviceID: WideString): Integer;
begin
  Result := DefaultInterface.OdinS_Close(bstrDeviceID);
end;

function TSpark617TF.OdinS_PrintXReport(const bstrDeviceID: WideString): Integer;
begin
  Result := DefaultInterface.OdinS_PrintXReport(bstrDeviceID);
end;

function TSpark617TF.OdinS_PrintZReport(const bstrDeviceID: WideString): Integer;
begin
  Result := DefaultInterface.OdinS_PrintZReport(bstrDeviceID);
end;

function TSpark617TF.OdinS_CashInOutcome(const bstrDeviceID: WideString; Amount: Double): Integer;
begin
  Result := DefaultInterface.OdinS_CashInOutcome(bstrDeviceID, Amount);
end;

function TSpark617TF.OdinS_OpenCheck(const bstrDeviceID: WideString; IsFiscalCheck: Integer; 
                                     IsReturnCheck: Integer; CancelOpenedCheck: Integer; 
                                     out CheckNumber: Integer; out SessionNumber: Integer): Integer;
begin
  Result := DefaultInterface.OdinS_OpenCheck(bstrDeviceID, IsFiscalCheck, IsReturnCheck, 
                                             CancelOpenedCheck, CheckNumber, SessionNumber);
end;

function TSpark617TF.OdinS_PrintFiscalString(const bstrDeviceID: WideString; 
                                             const bstrName: WideString; Quantity: Double; 
                                             Price: Double; Discount: Single; Department: Integer; 
                                             Tax: Single): Integer;
begin
  Result := DefaultInterface.OdinS_PrintFiscalString(bstrDeviceID, bstrName, Quantity, Price, 
                                                     Discount, Department, Tax);
end;

function TSpark617TF.OdinS_CloseCheck(const bstrDeviceID: WideString; Cash: Double; Cashless: Double): Integer;
begin
  Result := DefaultInterface.OdinS_CloseCheck(bstrDeviceID, Cash, Cashless);
end;

function TSpark617TF.OdinS_CancelCheck(const bstrDeviceID: WideString): Integer;
begin
  Result := DefaultInterface.OdinS_CancelCheck(bstrDeviceID);
end;

function TSpark617TF.OdinS_PrintNonFiscalString(const bstrDeviceID: WideString; 
                                                const bstrTextString: WideString): Integer;
begin
  Result := DefaultInterface.OdinS_PrintNonFiscalString(bstrDeviceID, bstrTextString);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TSpark617TFProperties.Create(AServer: TSpark617TF);
begin
  inherited Create;
  FServer := AServer;
end;

function TSpark617TFProperties.GetDefaultInterface: ISpark617TF;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoSpark617TFPropPage.Create: IUnknown;
begin
  Result := CreateComObject(CLASS_Spark617TFPropPage) as IUnknown;
end;

class function CoSpark617TFPropPage.CreateRemote(const MachineName: string): IUnknown;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Spark617TFPropPage) as IUnknown;
end;

procedure TSpark617TFPropPage.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{144C4950-31E5-4797-9851-B6F0B90E7595}';
    IntfIID:   '{00000000-0000-0000-C000-000000000046}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSpark617TFPropPage.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IUnknown;
  end;
end;

procedure TSpark617TFPropPage.ConnectTo(svrIntf: IUnknown);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSpark617TFPropPage.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSpark617TFPropPage.GetDefaultInterface: IUnknown;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TSpark617TFPropPage.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TSpark617TFPropPageProperties.Create(Self);
{$ENDIF}
end;

destructor TSpark617TFPropPage.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TSpark617TFPropPage.GetServerProperties: TSpark617TFPropPageProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TSpark617TFPropPageProperties.Create(AServer: TSpark617TFPropPage);
begin
  inherited Create;
  FServer := AServer;
end;

function TSpark617TFPropPageProperties.GetDefaultInterface: IUnknown;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TSpark617TF, TSpark617TFPropPage]);
end;

end.
