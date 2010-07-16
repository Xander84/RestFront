unit MercFPrtX_TLB;

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
// File generated on 16.07.2010 12:41:08 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Windows\System32\MercFPrtX.ocx (1)
// LIBID: {AB1C5DBF-F491-489B-9B88-0F7B9CF0D904}
// LCID: 0
// Helpfile: 
// HelpString: Инкотекс: Фискальные регистраторы "Меркурий"
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, OleServer, StdVCL, Variants;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  MercFPrtXMajorVersion = 1;
  MercFPrtXMinorVersion = 4;

  LIBID_MercFPrtX: TGUID = '{AB1C5DBF-F491-489B-9B88-0F7B9CF0D904}';

  IID_IMercuryFPrt: TGUID = '{525FE0EA-4EA5-45DD-AB9E-EB75ADAF2557}';
  DIID_IMercuryFPrtEvents: TGUID = '{2E1B3242-7861-424F-B925-E230D966DDAE}';
  IID_IMercuryFPrtX: TGUID = '{6976823E-B5E5-4748-BD90-6516D22B694E}';
  IID__IMercuryFPrtEventsDirect: TGUID = '{DF60ED81-A028-4863-8C69-662E5F28512B}';
  IID_IMercuryFPrt2: TGUID = '{081E43FF-4768-4C9A-957F-BF117CFDD15B}';
  IID_IMercuryFPrt3: TGUID = '{761CED73-985A-4FCF-95E7-21D03E489305}';
  IID_IMercuryFPrtX2: TGUID = '{15273680-3D9A-4D78-9FEC-B92FFCD88441}';
  IID_IMercuryFPrtX3: TGUID = '{7F2562A6-46FE-41FD-A75F-85535472969F}';
  IID_IMercuryFPrt4: TGUID = '{01D442F5-56A5-4F04-8C61-FB651172C6F0}';
  IID_IMercuryFPrtX4: TGUID = '{38FC4258-EFAC-49CE-8215-B3ED204C5E7A}';
  IID_IMercuryFPrt5: TGUID = '{66636E2A-5015-4156-9D06-FC6F63194254}';
  IID_IMercuryFPrtX5: TGUID = '{D3FA84FF-677F-4244-AEFB-E8343EF7C706}';
  IID_IMercuryFPrt6: TGUID = '{FDC67547-0246-4854-9F84-C7EE4E93FB9B}';
  IID_IMercuryFPrtX6: TGUID = '{44595440-34C5-4FCA-A3BE-154BD980C7BA}';
  IID_IMercuryFPrt7: TGUID = '{9549BA81-6015-4DA1-996E-53347CD57ABE}';
  IID_IMercuryFPrtX7: TGUID = '{3D5A10AD-307C-49D4-A59B-70FFEE159CB2}';
  IID_IMercuryFPrt8: TGUID = '{9397BB3C-769E-47E2-8C0D-028A38B5D48F}';
  IID_IMercuryFPrtX8: TGUID = '{116A8129-4171-4B1D-8A49-6724A8E975DD}';
  IID_IMercuryFPrt9: TGUID = '{B9F07D55-3587-4FFE-BFA8-0F1BFE05554F}';
  IID_IMercuryFPrtX9: TGUID = '{47D80BD0-5B41-4BFE-98AA-9E76BA94F37E}';
  IID_IMercuryFPrt10: TGUID = '{C389388E-BCC0-4580-8673-47193431C2C3}';
  IID_IMercuryFPrtX10: TGUID = '{10ECF5F7-72AB-4B70-8BB9-4297AC4B8EC3}';
  CLASS_MercuryFPrtCOM: TGUID = '{140A3451-BB71-4DE3-87E5-E13577DEFCD1}';
  CLASS_MercuryFPrtX: TGUID = '{ED0257F0-3434-4934-B6A9-D37E14C55986}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum TxMercOperType
type
  TxMercOperType = TOleEnum;
const
  motUnknown = $00000000;
  motSale = $00000001;
  motRefund = $00000002;
  motRefundCashless = $00000003;
  motVoid = $00000004;
  motCashIn = $00000005;
  motCashOut = $00000006;
  motBuying = $00000007;
  motBuyingRefund = $00000008;
  motBuyingVoid = $00000009;
  motDayOpening = $0000000A;
  motXReport = $0000000B;
  motZReport = $0000000C;

// Constants for enum TxMercPayType
type
  TxMercPayType = TOleEnum;
const
  mptCash = $00000000;
  mptCredit = $00000001;
  mptCard = $00000002;
  mptCashCredit = $00000003;
  mptCashCard = $00000004;

// Constants for enum TxMercOperInfo
type
  TxMercOperInfo = TOleEnum;
const
  moiNumber = $00000000;
  moiName = $00000001;
  moiNumberName = $00000002;

// Constants for enum TxMercItemType
type
  TxMercItemType = TOleEnum;
const
  mitItem = $00000000;
  mitPercentAdj = $00000001;
  mitAmountAdj = $00000002;
  mitVoidItem = $00000003;
  mitVoidPercentAdj = $00000004;
  mitVoidAmountAdj = $00000005;

// Constants for enum TxMercProtocol
type
  TxMercProtocol = TOleEnum;
const
  mprUnknown = $00000000;
  mprBS = $00000001;
  mprXOnXoff = $00000002;

// Constants for enum TxMercEcrModel
type
  TxMercEcrModel = TOleEnum;
const
  memUnknown = $00000000;
  mem114_1F = $00000001;
  memSystemF = $00000002;
  memMSK = $00000003;
  mem114_1K = $00000004;
  mem114_1FMD = $00000005;
  memSystemK = $00000006;
  mem118K = $00000007;
  mem119K = $00000008;
  mem119FAZ = $00000009;
  memNTSF = $0000000A;

// Constants for enum TxMercDocStatus
type
  TxMercDocStatus = TOleEnum;
const
  mdsUnknown = $00000000;
  mdsClosed = $00000001;
  mdsCached = $00000002;
  mdsOpened = $00000003;
  mdsTotal = $00000004;
  mdsCompleted = $00000005;
  mdsReceipt = $00000006;
  mdsCustom = $00000007;
  mdsForm = $00000008;

// Constants for enum TxMercEcrStatusFlags
type
  TxMercEcrStatusFlags = TOleEnum;
const
  MERC_S_DAY_OPENED = $00000001;
  MERC_S_BUFFER_ATTENTION = $00000002;
  MERC_S_FISCAL_ECR = $00000004;
  MERC_S_FISCAL_ATTENTION = $00000008;
  MERC_S_FISCAL_FULL = $00000010;
  MERC_S_DOC_COPY = $00000020;
  MERC_S_NARROW_PAPER = $00000040;
  MERC_S_GRAPHIC_HEADER = $00000080;

// Constants for enum TxMercDevStatusFlags
type
  TxMercDevStatusFlags = TOleEnum;
const
  MERC_DS_CASH_DRAWER = $00000001;
  MERC_DS_OFFLINE = $00000002;
  MERC_DS_OPENED_COVER = $00000004;
  MERC_DS_PAPER_FEEDING = $00000008;
  MERC_DS_STOP_ON_PAPER_OUT = $00000010;
  MERC_DS_PRINTER_ERROR = $00000020;
  MERC_DS_MECHANICAL_ERROR = $00000040;
  MERC_DS_CUTTER_ERROR = $00000080;
  MERC_DS_FATAL_ERROR = $00000100;
  MERC_DS_OVERHEATING = $00000200;
  MERC_DS_JOURNAL_ATTENTION = $00000400;
  MERC_DS_RECEIPT_ATTENTION = $00000800;
  MERC_DS_JOURNAL_OUT = $00001000;
  MERC_DS_RECEIPT_OUT = $00002000;
  MERC_DS_SLIP_SELECTED = $00004000;
  MERC_DS_SLIP_WAITING = $00008000;
  MERC_DS_NO_SLIP_IN = $00010000;
  MERC_DS_NO_SLIP_OUT = $00020000;
  MERC_DS_DISPLAY_READY = $00040000;
  MERC_DS_SERVICE_MODE = $00080000;
  MERC_DS_PRINTER_SELECTED = $00100000;
  MERC_DS_CUT_DISABLED = $00200000;
  MERC_DS_PAPER_OUT = $00400000;
  MERC_DS_PRINTER_READY = $00800000;
  MERC_DS_PRINTER_BUSY = $01000000;
  MERC_DS_FACTORY_SETTINGS = $02000000;
  MERC_DS_HARDWARE_RESET = $04000000;
  MERC_DS_HEAD_LIFTED = $08000000;
  MERC_DS_JRN_HEAD_LIFTED = $10000000;
  MERC_DS_EX_STATUS = $40000000;

// Constants for enum TxMercDocFlags
type
  TxMercDocFlags = TOleEnum;
const
  MERC_DOCF_PRINT_RECEIPT = $00000001;
  MERC_DOCF_REVERSE = $00000002;
  MERC_DOCF_BOTTOM_REJ = $00000004;

// Constants for enum TxMercPropFlags
type
  TxMercPropFlags = TOleEnum;
const
  MERC_PROPF_FONT_14X30 = $00000002;
  MERC_PROPF_FONT_10X30 = $00000003;
  MERC_PROPF_FONT_9X9 = $00000004;
  MERC_PROPF_DOUBLE_WIDTH = $00000008;
  MERC_PROPF_DOUBLE_HEIGHT = $00000010;
  MERC_PROPF_UNDERLINE = $00000020;
  MERC_PROPF_NO_ORIGINAL = $00000040;
  MERC_PROPF_NO_COPY = $00000080;
  MERC_PROPF_JOURNAL_LINE1 = $00000100;
  MERC_PROPF_JOURNAL_LINE2 = $00000200;
  MERC_PROPF_NO_JOURNAL = $00000400;
  MERC_PROPF_VOIDED = $00000800;

// Constants for enum TxMercConnState
type
  TxMercConnState = TOleEnum;
const
  mcsNone = $00000000;
  mcsIdle = $00000001;
  mcsWriting = $00000002;
  mcsReading = $00000003;
  mcsNoResponse = $00000004;
  mcsPrinterError = $00000005;
  mcsDisplayError = $00000006;

// Constants for enum TxMercBadResponseCode
type
  TxMercBadResponseCode = TOleEnum;
const
  MERC_BRE_INVALID_NUMBER = $00000001;
  MERC_BRE_INVALID_HEX = $00000002;
  MERC_BRE_INVALID_DATE = $00000003;
  MERC_BRE_INVALID_TIME = $00000004;
  MERC_BRE_PACKET_FORMAT = $00000005;
  MERC_BRE_UNEXPECTED_DATA = $00000006;
  MERC_BRE_INVALID_BCC = $00000007;
  MERC_BRE_INVALID_DOC_TYPE = $00000008;
  MERC_BRE_PACKET_SIZE = $00000009;

// Constants for enum TxMercInvalidArgCode
type
  TxMercInvalidArgCode = TOleEnum;
const
  MERC_IAE_INVALID_PORT_NUM = $00000001;
  MERC_IAE_INVALID_BAUD_RATE = $00000002;
  MERC_IAE_UNSUPPORTED_BAUD_RATE = $00000003;
  MERC_IAE_INVALID_TIMEOUT = $00000004;
  MERC_IAE_INVALID_PROTOCOL = $00000005;
  MERC_IAE_INVALID_OPER_NUM = $00000006;
  MERC_IAE_INVALID_LIC_TYPE = $00000007;
  MERC_IAE_INVALID_OPER_TYPE = $00000008;
  MERC_IAE_UNSUPPORTED_OPER_TYPE = $00000009;
  MERC_IAE_INVALID_COPIES_NUM = $0000000A;
  MERC_IAE_INVALID_OFFSET = $0000000B;
  MERC_IAE_INVALID_PROP_OFFSET = $0000000C;
  MERC_IAE_INVALID_FISCAL_HOFFSET = $0000000D;
  MERC_IAE_INVALID_FISCAL_VOFFSET = $0000000E;
  MERC_IAE_INVALID_FISCAL_COPY = $0000000F;
  MERC_IAE_INVALID_OPER_INFO = $00000010;
  MERC_IAE_INVALID_PAY_TYPE = $00000011;
  MERC_IAE_UNSUPPORTED_PAY_TYPE = $00000012;
  MERC_IAE_FORBIDDEN_PAY_TYPE = $00000013;
  MERC_IAE_INVALID_PAY_SUM = $00000014;
  MERC_IAE_INVALID_ITEM_SUM = $00000015;
  MERC_IAE_INVALID_DEPARTMENT = $00000016;
  MERC_IAE_INVALID_ITEM_CODE = $00000017;
  MERC_IAE_INVALID_ADJUSTMENT = $00000018;
  MERC_IAE_INVALID_QUANTITY = $00000019;
  MERC_IAE_INVALID_QUAN_PREC = $0000001A;
  MERC_IAE_INVALID_TAX_INDEX = $0000001B;
  MERC_IAE_TOTAL_OVERFLOW = $0000001C;
  MERC_IAE_INVALID_HEADER_LINE = $0000001D;
  MERC_IAE_INVALID_ITEM_TYPE = $0000001E;
  MERC_IAE_UNSUPPORTED_ITEM_TYPE = $0000001F;
  MERC_IAE_FORBIDDEN_ITEM_TYPE = $00000020;
  MERC_IAE_INVALID_DATE = $00000021;
  MERC_IAE_INVALID_CHANNEL = $00000022;
  MERC_IAE_INVALID_PULSE_TIME = $00000023;
  MERC_IAE_INVALID_PULSE_COUNT = $00000024;
  MERC_IAE_INVALID_LINE_COUNT = $00000025;
  MERC_IAE_UNSUPPORTED_FEED = $00000026;
  MERC_IAE_INVALID_TITLE = $00000027;
  MERC_IAE_INVALID_SERIAL_NUM = $00000028;
  MERC_IAE_INVALID_TAX_RATE = $00000029;
  MERC_IAE_INVALID_COUNTER = $0000002A;
  MERC_IAE_UNSUPPORTED_COUNTER = $0000002B;
  MERC_IAE_INVALID_FISCAL_NUM = $0000002C;
  MERC_IAE_INVALID_CONTRAST = $0000002D;
  MERC_IAE_INVALID_TIMEOUT_TYPE = $0000002E;
  MERC_IAE_INVALID_LEFT_SPACE = $0000002F;
  MERC_IAE_INVALID_HEADER_WIDTH = $00000030;
  MERC_IAE_INVALID_HEADER_HEIGHT = $00000031;
  MERC_IAE_INVALID_HEADER_DATA = $00000032;
  MERC_IAE_INVALID_ACCOUNT = $00000033;
  MERC_IAE_INVALID_EKLZ_VOFFSET = $00000034;
  MERC_IAE_INVALID_GRAPHIC_NUM = $00000035;
  MERC_IAE_INVALID_PARAM_CODE = $00000036;
  MERC_IAE_INVALID_ROUNDUP_MODE = $00000037;
  MERC_IAE_INVALID_ROUNDUP_UNIT = $00000038;
  MERC_IAE_INVALID_FISC_INTERVAL = $00000039;
  MERC_IAE_INVALID_I2C_FREQUENCY = $0000003A;
  MERC_IAE_INVALID_REP_TOTAL_MODE = $0000003B;
  MERC_IAE_INVALID_CUTTER_COUNT = $0000003C;

// Constants for enum TxMercDocPropertyType
type
  TxMercDocPropertyType = TOleEnum;
const
  MERC_PT_SERIAL_NUMBER = $00000000;
  MERC_PT_HEADER_LINE1 = $00000001;
  MERC_PT_HEADER_LINE2 = $00000002;
  MERC_PT_HEADER_LINE3 = $00000003;
  MERC_PT_HEADER_LINE4 = $00000004;
  MERC_PT_DATE_TIME = $00000005;
  MERC_PT_OPER_INFO = $00000006;
  MERC_PT_DOC_NUMBER = $00000007;
  MERC_PT_RECEIPT_NUMBER = $00000008;
  MERC_PT_ACCOUNT = $00000009;
  MERC_PT_TAX_PAYER_NUMBER = $0000000A;
  MERC_PT_ITEM = $0000000B;
  MERC_PT_TOTAL = $0000000C;
  MERC_PT_PAY = $0000000D;
  MERC_PT_CHANGE = $0000000E;
  MERC_PT_TAX0 = $0000000F;
  MERC_PT_TAX1 = $00000010;
  MERC_PT_TAX2 = $00000011;
  MERC_PT_TAX3 = $00000012;
  MERC_PT_TAX4 = $00000013;
  MERC_PT_FISCAL_SIGN = $00000014;
  MERC_PT_ADJUSTMENT = $00000015;
  MERC_PT_EKLZ_DATA = $00000016;
  MERC_PT_GRAPHIC_HEADER = $00000017;
  MERC_PT_REG_NUMBER = $00000018;
  MERC_PT_BARCODE = $00000062;
  MERC_PT_CUSTOM = $00000063;

// Constants for enum TxMercErrorCode
type
  TxMercErrorCode = TOleEnum;
const
  MERC_SUCCESS = $00000000;
  MERC_ERR_CONN_OPENED = $00000001;
  MERC_ERR_CONN_CLOSED = $00000002;
  MERC_ERR_NO_RESPONSE = $00000003;
  MERC_ERR_UNKNOWN_DEVICE = $00000004;
  MERC_ERR_NO_CONVERSION = $00000005;
  MERC_ERR_UNSUPPORTED = $00000006;
  MERC_ERR_DOC_OVERFLOW = $00000007;
  MERC_ERR_NO_DOCUMENT = $00000008;
  MERC_ERR_DOC_OPENED = $00000009;
  MERC_ERR_DOC_FORBIDDEN = $0000000A;
  MERC_ERR_DOC_FORBIDDEN_VERSION = $0000000B;
  MERC_ERR_DUPLICATION = $0000000C;
  MERC_ERR_NO_PROPERTY = $0000000D;
  MERC_ERR_INVALID_ARG = $0000000E;
  MERC_ERR_BAD_RESPONSE = $0000000F;
  MERC_ERR_OUT_OF_MEMORY = $00000010;
  MERC_ERR_OS_ERROR = $00000011;
  MERC_ERR_ECR_ERROR = $00000012;
  MERC_ERR_NO_LICENCE = $00000013;
  MERC_ERR_UNKNOWN = $000003E7;

// Constants for enum TxMercEcrErrCode
type
  TxMercEcrErrCode = TOleEnum;
const
  MERC_ERR_ECR_FISCAL = $00000001;
  MERC_ERR_ECR_OPENED_SESSION = $00000002;
  MERC_ERR_ECR_OUT_OF_FISCAL = $00000003;
  MERC_ERR_ECR_FIELD_TOO_LONG = $00000004;
  MERC_ERR_ECR_BAD_FIELD_FORMAT = $00000005;
  MERC_ERR_ECR_TIMER_READ_ERROR = $00000006;
  MERC_ERR_ECR_INVALID_DATE = $00000007;
  MERC_ERR_ECR_INVALID_TIME = $00000008;
  MERC_ERR_ECR_EARLY_DATE = $00000009;
  MERC_ERR_ECR_USER_BREAK = $0000000A;
  MERC_ERR_ECR_FORBIDDEN = $0000000B;
  MERC_ERR_ECR_CLOSED_SESSION = $0000000C;
  MERC_ERR_ECR_EMPTY_JOURNAL = $FFFFFFF3;
  MERC_ERR_ECR_INPUT_OVERFLOW = $0000000E;
  MERC_ERR_ECR_FISCAL_WRITE_ERROR = $0000000F;
  MERC_ERR_ECR_TIMER_SET_ERROR = $00000010;
  MERC_ERR_ECR_BAD_INSPECTOR_PSWD = $00000011;
  MERC_ERR_ECR_BAD_CONN_PSWD = $00000012;
  MERC_ERR_ECR_REG_OVERFLOW = $00000013;
  MERC_ERR_ECR_NO_FISCAL = $00000014;
  MERC_ERR_ECR_FIELD_OVERFLOW = $00000015;
  MERC_ERR_ECR_FISCAL_READ_ERROR = $00000016;
  MERC_ERR_ECR_COUNTER_OVERFLOW = $00000017;
  MERC_ERR_ECR_ZERO_FIELD = $00000018;
  MERC_ERR_ECR_BAD_CMD_FORMAT = $00000019;
  MERC_ERR_ECR_EARLY_DOCUMENT = $0000001A;
  MERC_ERR_ECR_JOURNAL_OVERFLOW = $0000001B;
  MERC_ERR_ECR_BAD_PROPERTIES = $0000001C;
  MERC_ERR_ECR_INVALID_CMD = $0000001D;
  MERC_ERR_ECR_INVALID_BCC = $0000001E;
  MERC_ERR_ECR_EMPTY_FISCAL = $0000001F;
  MERC_ERR_ECR_DOC_CANCELED = $00000021;
  MERC_ERR_ECR_EMPTY_RESPONSE = $00000024;
  MERC_ERR_ECR_SERVICE_ABSENT = $00000025;
  MERC_ERR_ECR_NO_SERVICE = $00000027;
  MERC_ERR_ECR_BAD_JOURNAL = $00000028;
  MERC_ERR_ECR_PROP_DUPLICATION = $00000029;
  MERC_ERR_ECR_BAD_STATE = $0000002A;
  MERC_ERR_ECR_MEMORY_ERROR = $0000002B;
  MERC_ERR_ECR_FM_INITIALIZED = $0000002C;
  MERC_ERR_ECR_DISPLAY_TIMEOUT = $0000002D;
  MERC_ERR_ECR_FLASH_ERROR = $0000002E;
  MERC_ERR_ECR_NO_RECORDS = $0000002F;
  MERC_ERR_EKLZ_NO_CONNECTION = $00000030;
  MERC_ERR_EKLZ_BAD_COMMAND = $00000031;
  MERC_ERR_EKLZ_BAD_STATE = $00000032;
  MERC_ERR_EKLZ_FAILURE = $00000033;
  MERC_ERR_EKLZ_ENCODER_FAILURE = $00000034;
  MERC_ERR_EKLZ_TIME_OVERFLOW = $00000035;
  MERC_ERR_EKLZ_FULL = $00000036;
  MERC_ERR_EKLZ_BAD_DATE_TIME = $00000037;
  MERC_ERR_EKLZ_NO_DATA = $00000038;
  MERC_ERR_EKLZ_COUNTER_OVERFLOW = $00000039;
  MERC_ERR_EKLZ_PROTOCOL_ERROR = $00000046;
  MERC_ERR_EKLZ_BUFFER_OVERFLOW = $00000047;
  MERC_ERR_EKLZ_BAD_CHECKSUM = $00000048;
  MERC_ERR_EKLZ_ANOTHER_ECR = $00000049;
  MERC_ERR_EKLZ_NOT_ACTIVATED = $0000004A;
  MERC_ERR_EKLZ_FATAL_ERROR = $0000004B;
  MERC_ERR_EKLZ_NO_ACTIVATIONS = $0000004C;
  MERC_ERR_EKLZ_ACTIVATED = $0000004D;
  MERC_ERR_EKLZ_DEPART_OVERFLOW = $0000004E;
  MERC_ERR_EKLZ_NO_ARCHIVE = $0000004F;
  MERC_ERR_EKLZ_FM_CONFLICT = $00000050;
  MERC_ERR_ECR_NO_OPERATOR = $0000000D;
  MERC_ERR_ECR_CNT_QUANTITY_ADD = $00000070;
  MERC_ERR_ECR_CNT_QUANTITY_SUB = $00000071;
  MERC_ERR_ECR_CNT_VOID = $00000072;
  MERC_ERR_ECR_CNT_DAY_VOID = $00000073;
  MERC_ERR_ECR_CNT_DAY_SALE = $00000074;
  MERC_ERR_ECR_CNT_DAY_CASH_ADD = $00000075;
  MERC_ERR_ECR_CNT_DAY_PAY_CREDIT = $00000076;
  MERC_ERR_ECR_CNT_DAY_PAY_CARD = $00000077;
  MERC_ERR_ECR_CNT_DAY_CASH_SUB = $00000078;
  MERC_ERR_ECR_CNT_DAY_RFD_CREDIT = $00000079;
  MERC_ERR_ECR_CNT_TOTAL_ADD = $0000007A;
  MERC_ERR_ECR_CNT_TOTAL_SUB = $0000007B;
  MERC_ERR_ECR_CNT_TOTAL_MUL = $0000007C;
  MERC_ERR_ECR_CNT_TOTAL_DIS = $0000007D;
  MERC_ERR_ECR_CNT_DPT_TOTAL_DIS = $0000007E;
  MERC_ERR_ECR_CNT_TARE_DIS = $0000007F;
  MERC_ERR_ECR_CNT_DISCOUNT = $00000080;
  MERC_ERR_ECR_CNT_TAX_DIS = $00000081;
  MERC_ERR_ECR_CNT_NOTAX_DIS = $00000082;
  MERC_ERR_ECR_CNT_TOTAL_SUR = $00000083;
  MERC_ERR_ECR_CNT_DPT_TOTAL_SUR = $00000084;
  MERC_ERR_ECR_CNT_TARE_SUR = $00000085;
  MERC_ERR_ECR_CNT_SURCHARGE = $00000086;
  MERC_ERR_ECR_CNT_TAX_SUR = $00000087;
  MERC_ERR_ECR_CNT_NOTAX_SUR = $00000088;
  MERC_ERR_ECR_CNT_DPT_TOTAL = $00000089;
  MERC_ERR_ECR_CNT_TARE_TOTAL = $0000008A;
  MERC_ERR_ECR_CNT_TAX_TOTAL = $0000008B;
  MERC_ERR_ECR_CNT_NOTAX_TOTAL = $0000008C;
  MERC_ERR_ECR_CNT_TOTAL_VOID_DIS = $0000008D;
  MERC_ERR_ECR_CNT_DPT_VOID_DIS = $0000008E;
  MERC_ERR_ECR_CNT_TARE_VOID_DIS = $0000008F;
  MERC_ERR_ECR_CNT_VOID_DISCOUNT = $00000090;
  MERC_ERR_ECR_CNT_TAX_VOID_DIS = $00000091;
  MERC_ERR_ECR_CNT_NOTAX_VOID_DIS = $00000092;
  MERC_ERR_ECR_CNT_TOTAL_VOID_SUR = $00000093;
  MERC_ERR_ECR_CNT_DPT_VOID_SUR = $00000094;
  MERC_ERR_ECR_CNT_TARE_VOID_SUR = $00000095;
  MERC_ERR_ECR_CNT_VOID_SURCHARGE = $00000096;
  MERC_ERR_ECR_CNT_TAX_VOID_SUR = $00000097;
  MERC_ERR_ECR_CNT_NOTAX_VOID_SUR = $00000098;
  MERC_ERR_ECR_INVALID_PAYMENT = $00000099;
  MERC_ERR_ECR_CNT_PAYMENT = $0000009A;
  MERC_ERR_ECR_CASHLESS_OVERFLOW = $0000009B;
  MERC_ERR_ECR_FISC_INTERVAL_OVER = $0000009C;

// Constants for enum TxMercReportFlags
type
  TxMercReportFlags = TOleEnum;
const
  MERC_REPF_NO_ZEROES = $00000001;
  MERC_REPF_ACCUMULATE_OPER = $00000002;
  MERC_REPF_ACCUMULATE_DEP = $00000004;

// Constants for enum TxMercLicenceError
type
  TxMercLicenceError = TOleEnum;
const
  MERC_ERR_LIC_BAD_KEY = $00000001;
  MERC_ERR_LIC_EXPIRED = $00000002;
  MERC_ERR_LIC_ECR = $00000003;

// Constants for enum TxMercLicenceType
type
  TxMercLicenceType = TOleEnum;
const
  mltLocal = $00000000;
  mltUser = $00000001;
  mltAllUsers = $00000002;

// Constants for enum TxMercEcrStatusBits
type
  TxMercEcrStatusBits = TOleEnum;
const
  MERC_SBIT_DAY_OPENED = $00000000;
  MERC_SBIT_BUFFER_ATTENTION = $00000001;
  MERC_SBIT_FISCAL_ECR = $00000002;
  MERC_SBIT_FISCAL_ATTENTION = $00000003;
  MERC_SBIT_FISCAL_FULL = $00000004;
  MERC_SBIT_DOC_COPY = $00000005;
  MERC_SBIT_NARROW_PAPER = $00000006;
  MERC_SBIT_GRAPHIC_HEADER = $00000007;

// Constants for enum TxMercDevStatusBits
type
  TxMercDevStatusBits = TOleEnum;
const
  MERC_DSBIT_CASH_DRAWER = $00000000;
  MERC_DSBIT_OFFLINE = $00000001;
  MERC_DSBIT_OPENED_COVER = $00000002;
  MERC_DSBIT_PAPER_FEEDING = $00000003;
  MERC_DSBIT_STOP_ON_PAPER_OUT = $00000004;
  MERC_DSBIT_PRINTER_ERROR = $00000005;
  MERC_DSBIT_MECHANICAL_ERROR = $00000006;
  MERC_DSBIT_CUTTER_ERROR = $00000007;
  MERC_DSBIT_FATAL_ERROR = $00000008;
  MERC_DSBIT_OVERHEATING = $00000009;
  MERC_DSBIT_JOURNAL_ATTENTION = $0000000A;
  MERC_DSBIT_RECEIPT_ATTENTION = $0000000B;
  MERC_DSBIT_JOURNAL_OUT = $0000000C;
  MERC_DSBIT_RECEIPT_OUT = $0000000D;
  MERC_DSBIT_SLIP_SELECTED = $0000000E;
  MERC_DSBIT_SLIP_WAITING = $0000000F;
  MERC_DSBIT_NO_SLIP_IN = $00000010;
  MERC_DSBIT_NO_SLIP_OUT = $00000011;
  MERC_DSBIT_DISPLAY_READY = $00000012;
  MERC_DSBIT_SERVICE_MODE = $00000013;
  MERC_DSBIT_PRINTER_SELECTED = $00000014;
  MERC_DSBIT_CUT_DISABLED = $00000015;
  MERC_DSBIT_PAPER_OUT = $00000016;
  MERC_DSBIT_PRINTER_READY = $00000017;
  MERC_DSBIT_PRINTER_BUSY = $00000018;
  MERC_DSBIT_FACTORY_SETTINGS = $00000019;
  MERC_DSBIT_HARDWARE_RESET = $0000001A;
  MERC_DSBIT_HEAD_LIFTED = $0000001B;
  MERC_DSBIT_JRN_HEAD_LIFTED = $0000001C;
  MERC_DSBIT_EX_STATUS = $0000001E;

// Constants for enum TxMercParamCode
type
  TxMercParamCode = TOleEnum;
const
  MERC_PARAM_PRN_TIMEOUT = $00000001;
  MERC_PARAM_DSP_TIMEOUT = $00000002;
  MERC_PARAM_PRN_CONTRAST = $00000003;
  MERC_PARAM_LEADING = $00000004;
  MERC_PARAM_HEADER_ALIGN = $00000005;
  MERC_PARAM_AUTOCUT = $00000006;
  MERC_PARAM_ECONOMIC_MODE = $00000007;
  MERC_PARAM_PAPER_JOURNAL = $00000008;
  MERC_PARAM_FULL_JOURNAL = $00000009;
  MERC_PARAM_AUTO_CASHOUT = $0000000A;
  MERC_PARAM_DECIMAL_POINT = $0000000B;
  MERC_PARAM_ROUNDUP_MODE = $0000000C;
  MERC_PARAM_ROUNDUP_UNIT = $0000000D;
  MERC_PARAM_RESTART_COUNT = $0000000E;
  MERC_PARAM_AUTOHEADER = $0000000F;
  MERC_PARAM_AUTOHEADER_LINE1 = $00000010;
  MERC_PARAM_AUTOHEADER_LINE2 = $00000011;
  MERC_PARAM_AUTOHEADER_LINE3 = $00000012;
  MERC_PARAM_AUTOHEADER_LINE4 = $00000013;
  MERC_PARAM_HEADER_PRINTED_LINE1 = $00000014;
  MERC_PARAM_HEADER_PRINTED_LINE2 = $00000015;
  MERC_PARAM_HEADER_PRINTED_LINE3 = $00000016;
  MERC_PARAM_HEADER_PRINTED_LINE4 = $00000017;
  MERC_PARAM_CURRENT_DOC_NUMBER = $00000018;
  MERC_PARAM_CURRENT_REC_NUMBER = $00000019;
  MERC_PARAM_PAPER_AUTOLOAD = $0000001A;
  MERC_PARAM_FISCAL_TIME_INTERVAL = $0000001B;
  MERC_PARAM_NON_FISCAL_HEADER = $0000001C;
  MERC_PARAM_DAY_ELAPSED = $0000001D;
  MERC_PARAM_EKL_ENABLED = $0000001E;
  MERC_PARAM_I2C_FREQUENCY = $0000001F;
  MERC_PARAM_EKLZ_AUTOTESTING = $00000020;
  MERC_PARAM_REPORT_TOTAL_MODE = $00000021;
  MERC_PARAM_DOCUMENT_REPRINTING = $00000022;
  MERC_PARAM_CUTTER_TESTING = $00000023;

// Constants for enum TxMercEKLState
type
  TxMercEKLState = TOleEnum;
const
  meklEmpty = $00000000;
  meklNonEmpty = $00000001;
  meklAttention = $00000002;
  meklFull = $00000003;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IMercuryFPrt = interface;
  IMercuryFPrtDisp = dispinterface;
  IMercuryFPrtEvents = dispinterface;
  IMercuryFPrtX = interface;
  IMercuryFPrtXDisp = dispinterface;
  _IMercuryFPrtEventsDirect = interface;
  IMercuryFPrt2 = interface;
  IMercuryFPrt2Disp = dispinterface;
  IMercuryFPrt3 = interface;
  IMercuryFPrt3Disp = dispinterface;
  IMercuryFPrtX2 = interface;
  IMercuryFPrtX2Disp = dispinterface;
  IMercuryFPrtX3 = interface;
  IMercuryFPrtX3Disp = dispinterface;
  IMercuryFPrt4 = interface;
  IMercuryFPrt4Disp = dispinterface;
  IMercuryFPrtX4 = interface;
  IMercuryFPrtX4Disp = dispinterface;
  IMercuryFPrt5 = interface;
  IMercuryFPrt5Disp = dispinterface;
  IMercuryFPrtX5 = interface;
  IMercuryFPrtX5Disp = dispinterface;
  IMercuryFPrt6 = interface;
  IMercuryFPrt6Disp = dispinterface;
  IMercuryFPrtX6 = interface;
  IMercuryFPrtX6Disp = dispinterface;
  IMercuryFPrt7 = interface;
  IMercuryFPrt7Disp = dispinterface;
  IMercuryFPrtX7 = interface;
  IMercuryFPrtX7Disp = dispinterface;
  IMercuryFPrt8 = interface;
  IMercuryFPrt8Disp = dispinterface;
  IMercuryFPrtX8 = interface;
  IMercuryFPrtX8Disp = dispinterface;
  IMercuryFPrt9 = interface;
  IMercuryFPrt9Disp = dispinterface;
  IMercuryFPrtX9 = interface;
  IMercuryFPrtX9Disp = dispinterface;
  IMercuryFPrt10 = interface;
  IMercuryFPrt10Disp = dispinterface;
  IMercuryFPrtX10 = interface;
  IMercuryFPrtX10Disp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  MercuryFPrtCOM = IMercuryFPrt10;
  MercuryFPrtX = IMercuryFPrtX10;


// *********************************************************************//
// Interface: IMercuryFPrt
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {525FE0EA-4EA5-45DD-AB9E-EB75ADAF2557}
// *********************************************************************//
  IMercuryFPrt = interface(IDispatch)
    ['{525FE0EA-4EA5-45DD-AB9E-EB75ADAF2557}']
    procedure Open; safecall;
    procedure Close(ForceAbort: WordBool); safecall;
    procedure OpenReceipt(Oper: TxMercOperType); safecall;
    procedure AddReceiptItem(const Desc: WideString; Price: Currency; ItemIsTare: WordBool; 
                             Department: Integer; Code: Integer; Adjustment: Integer; 
                             Quantity: Integer; QuantityPrec: Integer; TaxIndex: Integer; 
                             const UnitName: WideString; Flags: Integer); safecall;
    procedure CancelReceipt; safecall;
    procedure CloseReceipt(const Account: WideString; PayType: TxMercPayType; PayCash: Currency; 
                           PayCashless: Currency; const PayInfo: WideString; CopiesNum: Integer; 
                           OperInfo: TxMercOperInfo); safecall;
    procedure OpenCustomDoc(UseForm: WordBool; Oper: TxMercOperType); safecall;
    procedure CancelCustomDoc; safecall;
    procedure CloseCustomDoc(PayType: TxMercPayType; Flags: Integer; HCopiesNum: Integer; 
                             VCopiesNum: Integer; VOrigOffset: Integer; HCopyOffset: Integer; 
                             VCopyOffset: Integer; FiscalCopy: Integer); safecall;
    procedure OpenFiscalDoc(Oper: TxMercOperType); safecall;
    procedure CancelFiscalDoc(BufferOnly: WordBool); safecall;
    procedure PrintFiscalDocBuffer; safecall;
    procedure CloseFiscalDoc; safecall;
    procedure CopyFiscalDoc; safecall;
    procedure AddSerialNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); safecall;
    procedure AddHeaderLine(LineNum: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer); safecall;
    procedure AddDateTime(Flags: Integer; HOffset: Integer; VOffset: Integer); safecall;
    procedure AddOperInfo(OperInfo: TxMercOperInfo; Flags: Integer; HOffset: Integer; 
                          VOffset: Integer); safecall;
    procedure AddDocNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); safecall;
    procedure AddReceiptNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); safecall;
    procedure AddAccount(const Account: WideString; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); safecall;
    procedure AddTaxPayerNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); safecall;
    procedure AddItem(ItemType: TxMercItemType; Price: Currency; ItemIsTare: WordBool; 
                      Department: Integer; Code: Integer; Adjustment: Integer; Quantity: Integer; 
                      QuantityPrec: Integer; TaxIndex: Integer; const UnitName: WideString; 
                      Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); safecall;
    procedure AddDocPercentAdj(Value: Integer; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                               VOffset: Integer; RightOffset: Integer); safecall;
    procedure AddDocAmountAdj(Value: Currency; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                              VOffset: Integer; RightOffset: Integer); safecall;
    procedure AddTotal(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); safecall;
    procedure AddPay(PayType: TxMercPayType; PayCash: Currency; PayCashless: Currency; 
                     const PayInfo: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                     RightOffset: Integer); safecall;
    procedure AddChange(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); safecall;
    procedure AddTaxSum(TaxIndex: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                        RightOffset: Integer); safecall;
    procedure AddFiscalSign(Flags: Integer; HOffset: Integer; VOffset: Integer); safecall;
    procedure AddBarcode(Mask1: Integer; Mask2: Integer; Mask3: Integer; Mask4: Integer; 
                         Mask5: Integer; DoubleDensity: WordBool; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); safecall;
    procedure AddCustom(const Text: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer); safecall;
    procedure RepeatOperation; safecall;
    procedure OpenDay(OperNum: Integer; const OperName: WideString; FullJournal: WordBool; 
                      AProtocol: TxMercProtocol); safecall;
    function ZReport(Flags: Integer): Integer; safecall;
    function FiscalRewrite(const InspPswd: WideString; const RegNum: WideString; 
                           const TaxPayerNum: WideString; const NewInspPswd: WideString): Integer; safecall;
    function FiscalReportByNum(const InspPswd: WideString; PrintFull: WordBool; AStartNum: Integer; 
                               AEndNum: Integer): Integer; safecall;
    function FiscalReportByDate(const InspPswd: WideString; PrintFull: WordBool; 
                                AStartDate: TDateTime; AEndDate: TDateTime): Integer; safecall;
    function FiscalReportAll(const InspPswd: WideString): Integer; safecall;
    procedure FeedAndCut(LineCount: Integer; CutAfterFeed: WordBool); safecall;
    procedure PrintNonFiscal(const Data: WideString; OpenDoc: WordBool; CloseDoc: WordBool); safecall;
    procedure ShowDisplay(const Data: WideString; OpenMode: WordBool; CloseMode: WordBool); safecall;
    procedure SetDisplayBaudRate(BaudRate: Integer); safecall;
    procedure ExternalPulse(Channel: Integer; TimeOn: Integer; TimeOff: Integer; Count: Integer); safecall;
    procedure QueryDevExStatus; safecall;
    procedure QueryFirmwareInfo; safecall;
    procedure SetHeader(const Line1: WideString; const Line2: WideString; const Line3: WideString; 
                        const Line4: WideString); safecall;
    procedure SetTax(Index: Integer; const TaxName: WideString; TaxRate: Integer); safecall;
    function QueryTax(Index: Integer): Integer; safecall;
    function QueryCounter(Index: Integer; NoRequest: WordBool): Currency; safecall;
    procedure SynchronizeEcrDateTime; safecall;
    procedure QueryResourceInfo(PrintInfo: WordBool); safecall;
    procedure QueryLastDocInfo; safecall;
    procedure SetParameters(Protocol: TxMercProtocol; PrnTimeout: Integer); safecall;
    function Get_EcrModel: TxMercEcrModel; safecall;
    function Get_EcrVersion: Integer; safecall;
    function Get_Generation: Integer; safecall;
    function Get_Protocol: TxMercProtocol; safecall;
    function Get_EcrStatus: Integer; safecall;
    function Get_EcrStatusMask: Integer; safecall;
    function Get_DevStatus: Integer; safecall;
    function Get_DevStatusMask: Integer; safecall;
    function Get_DocStatus: TxMercDocStatus; safecall;
    function Get_CurrentOper: TxMercOperType; safecall;
    function Get_PortNum: Integer; safecall;
    procedure Set_PortNum(Value: Integer); safecall;
    function Get_BaudRate: Integer; safecall;
    procedure Set_BaudRate(Value: Integer); safecall;
    function Get_Password: WideString; safecall;
    procedure Set_Password(const Value: WideString); safecall;
    function Get_InternalTimeout: Integer; safecall;
    procedure Set_InternalTimeout(Value: Integer); safecall;
    function Get_ExternalTimeout: Integer; safecall;
    procedure Set_ExternalTimeout(Value: Integer); safecall;
    function QueryHeaderLine(LineNum: Integer): WideString; safecall;
    function QuerySerialNumber: WideString; safecall;
    procedure SetSerialNumber(const Value: WideString); safecall;
    function QueryTaxPayerNumber: WideString; safecall;
    function QueryRegNumber: WideString; safecall;
    function QueryEcrDateTime: TDateTime; safecall;
    function QueryDepartName(DepartNum: Integer): WideString; safecall;
    procedure SetDepartName(DepartNum: Integer; const Value: WideString); safecall;
    function QueryTitle(TitleNum: Integer): WideString; safecall;
    procedure SetTitle(TitleNum: Integer; const Value: WideString); safecall;
    function Get_Active: WordBool; safecall;
    procedure Set_Active(Value: WordBool); safecall;
    function Get_ConnState: TxMercConnState; safecall;
    function Get_SaleSum: Currency; safecall;
    function Get_BuyingSum: Currency; safecall;
    function Get_SerialNumber: WideString; safecall;
    function Get_RegNumber: WideString; safecall;
    function Get_TaxPayerNumber: WideString; safecall;
    function Get_HeaderLine1: WideString; safecall;
    function Get_HeaderLine2: WideString; safecall;
    function Get_HeaderLine3: WideString; safecall;
    function Get_HeaderLine4: WideString; safecall;
    function Get_StartDate: TDateTime; safecall;
    function Get_EndDate: TDateTime; safecall;
    function Get_StartNumber: Integer; safecall;
    function Get_EndNumber: Integer; safecall;
    function Get_ReportDate: TDateTime; safecall;
    function Get_ModelName: WideString; safecall;
    function Get_Manufacturer: WideString; safecall;
    function Get_FirmwareVersion: WideString; safecall;
    function Get_TaxName: WideString; safecall;
    function Get_TaxDate: TDateTime; safecall;
    function Get_CounterCount: Integer; safecall;
    function Get_RewritesRemain: Integer; safecall;
    function Get_DaysRemain: Integer; safecall;
    function Get_LastFiscalReport: Integer; safecall;
    function Get_LastDayClosing: Integer; safecall;
    function Get_DayDate: TDateTime; safecall;
    function Get_LastDocOper: TxMercOperType; safecall;
    function Get_LastDocNumber: Integer; safecall;
    function Get_LastRecNumber: Integer; safecall;
    function Get_LastDocType: TxMercOperType; safecall;
    function Get_LastDocSum: Currency; safecall;
    function Get_LastDocDate: TDateTime; safecall;
    function Get_RetryOperation: WordBool; safecall;
    procedure Set_RetryOperation(Value: WordBool); safecall;
    function Get_ErrCode: Integer; safecall;
    function Get_ErrCodeEx: Integer; safecall;
    function Get_ErrMessage: WideString; safecall;
    function CheckEcrStatus(Flag: Integer): Integer; safecall;
    function CheckDevStatus(Flag: Integer): Integer; safecall;
    function Get_EcrHour: Integer; safecall;
    function Get_EcrMin: Integer; safecall;
    function Get_ReportHour: Integer; safecall;
    function Get_ReportMin: Integer; safecall;
    function Get_DayHour: Integer; safecall;
    function Get_DayMin: Integer; safecall;
    function Get_LastDocHour: Integer; safecall;
    function Get_LastDocMin: Integer; safecall;
    procedure AddGraphicHeader(Flags: Integer; HOffset: Integer; VOffset: Integer); safecall;
    procedure SetProtocol(Protocol: TxMercProtocol); safecall;
    procedure SetPrinterTimeout(Timeout: Integer); safecall;
    procedure SetDisplayTimeout(Timeout: Integer); safecall;
    procedure SetPrinterContrast(Contrast: Integer); safecall;
    procedure SetLeading(Leading: Integer); safecall;
    procedure SetCutterDisabled(Disabled: WordBool); safecall;
    procedure SetNarrowPaper(Narrow: WordBool); safecall;
    function QueryPrinterTimeout: Integer; safecall;
    function QueryDisplayTimeout: Integer; safecall;
    function QueryPrinterContrast: Integer; safecall;
    function QueryLeading: Integer; safecall;
    procedure EnableGraphicHeader(Width: Integer; Height: Integer; const Data: WideString); safecall;
    procedure DisableGraphicHeader; safecall;
    procedure AddLicence(LicType: TxMercLicenceType; const Licence: WideString); safecall;
    function XReport(Flags: Integer): Integer; safecall;
    function XReportByDep(DepartNum: Integer; Flags: Integer): Integer; safecall;
    function XReportByOper(OperNum: Integer; Flags: Integer): Integer; safecall;
    function QueryHeaderAlignment: WordBool; safecall;
    function QueryOperNumber: Integer; safecall;
    function QueryOperName(OperNum: Integer): WideString; safecall;
    procedure SetHeaderAlignment(Aligned: WordBool); safecall;
    procedure TestConnection; safecall;
    function Get_VersionNumber: Integer; safecall;
    function Get_BuildNumber: Integer; safecall;
    function Get_Version: WideString; safecall;
    procedure Set_Version(const Value: WideString); safecall;
    property EcrModel: TxMercEcrModel read Get_EcrModel;
    property EcrVersion: Integer read Get_EcrVersion;
    property Generation: Integer read Get_Generation;
    property Protocol: TxMercProtocol read Get_Protocol;
    property EcrStatus: Integer read Get_EcrStatus;
    property EcrStatusMask: Integer read Get_EcrStatusMask;
    property DevStatus: Integer read Get_DevStatus;
    property DevStatusMask: Integer read Get_DevStatusMask;
    property DocStatus: TxMercDocStatus read Get_DocStatus;
    property CurrentOper: TxMercOperType read Get_CurrentOper;
    property PortNum: Integer read Get_PortNum write Set_PortNum;
    property BaudRate: Integer read Get_BaudRate write Set_BaudRate;
    property Password: WideString read Get_Password write Set_Password;
    property InternalTimeout: Integer read Get_InternalTimeout write Set_InternalTimeout;
    property ExternalTimeout: Integer read Get_ExternalTimeout write Set_ExternalTimeout;
    property Active: WordBool read Get_Active write Set_Active;
    property ConnState: TxMercConnState read Get_ConnState;
    property SaleSum: Currency read Get_SaleSum;
    property BuyingSum: Currency read Get_BuyingSum;
    property SerialNumber: WideString read Get_SerialNumber;
    property RegNumber: WideString read Get_RegNumber;
    property TaxPayerNumber: WideString read Get_TaxPayerNumber;
    property HeaderLine1: WideString read Get_HeaderLine1;
    property HeaderLine2: WideString read Get_HeaderLine2;
    property HeaderLine3: WideString read Get_HeaderLine3;
    property HeaderLine4: WideString read Get_HeaderLine4;
    property StartDate: TDateTime read Get_StartDate;
    property EndDate: TDateTime read Get_EndDate;
    property StartNumber: Integer read Get_StartNumber;
    property EndNumber: Integer read Get_EndNumber;
    property ReportDate: TDateTime read Get_ReportDate;
    property ModelName: WideString read Get_ModelName;
    property Manufacturer: WideString read Get_Manufacturer;
    property FirmwareVersion: WideString read Get_FirmwareVersion;
    property TaxName: WideString read Get_TaxName;
    property TaxDate: TDateTime read Get_TaxDate;
    property CounterCount: Integer read Get_CounterCount;
    property RewritesRemain: Integer read Get_RewritesRemain;
    property DaysRemain: Integer read Get_DaysRemain;
    property LastFiscalReport: Integer read Get_LastFiscalReport;
    property LastDayClosing: Integer read Get_LastDayClosing;
    property DayDate: TDateTime read Get_DayDate;
    property LastDocOper: TxMercOperType read Get_LastDocOper;
    property LastDocNumber: Integer read Get_LastDocNumber;
    property LastRecNumber: Integer read Get_LastRecNumber;
    property LastDocType: TxMercOperType read Get_LastDocType;
    property LastDocSum: Currency read Get_LastDocSum;
    property LastDocDate: TDateTime read Get_LastDocDate;
    property RetryOperation: WordBool read Get_RetryOperation write Set_RetryOperation;
    property ErrCode: Integer read Get_ErrCode;
    property ErrCodeEx: Integer read Get_ErrCodeEx;
    property ErrMessage: WideString read Get_ErrMessage;
    property EcrHour: Integer read Get_EcrHour;
    property EcrMin: Integer read Get_EcrMin;
    property ReportHour: Integer read Get_ReportHour;
    property ReportMin: Integer read Get_ReportMin;
    property DayHour: Integer read Get_DayHour;
    property DayMin: Integer read Get_DayMin;
    property LastDocHour: Integer read Get_LastDocHour;
    property LastDocMin: Integer read Get_LastDocMin;
    property VersionNumber: Integer read Get_VersionNumber;
    property BuildNumber: Integer read Get_BuildNumber;
    property Version: WideString read Get_Version write Set_Version;
  end;

// *********************************************************************//
// DispIntf:  IMercuryFPrtDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {525FE0EA-4EA5-45DD-AB9E-EB75ADAF2557}
// *********************************************************************//
  IMercuryFPrtDisp = dispinterface
    ['{525FE0EA-4EA5-45DD-AB9E-EB75ADAF2557}']
    procedure Open; dispid 201;
    procedure Close(ForceAbort: WordBool); dispid 202;
    procedure OpenReceipt(Oper: TxMercOperType); dispid 203;
    procedure AddReceiptItem(const Desc: WideString; Price: Currency; ItemIsTare: WordBool; 
                             Department: Integer; Code: Integer; Adjustment: Integer; 
                             Quantity: Integer; QuantityPrec: Integer; TaxIndex: Integer; 
                             const UnitName: WideString; Flags: Integer); dispid 204;
    procedure CancelReceipt; dispid 205;
    procedure CloseReceipt(const Account: WideString; PayType: TxMercPayType; PayCash: Currency; 
                           PayCashless: Currency; const PayInfo: WideString; CopiesNum: Integer; 
                           OperInfo: TxMercOperInfo); dispid 206;
    procedure OpenCustomDoc(UseForm: WordBool; Oper: TxMercOperType); dispid 207;
    procedure CancelCustomDoc; dispid 208;
    procedure CloseCustomDoc(PayType: TxMercPayType; Flags: Integer; HCopiesNum: Integer; 
                             VCopiesNum: Integer; VOrigOffset: Integer; HCopyOffset: Integer; 
                             VCopyOffset: Integer; FiscalCopy: Integer); dispid 209;
    procedure OpenFiscalDoc(Oper: TxMercOperType); dispid 210;
    procedure CancelFiscalDoc(BufferOnly: WordBool); dispid 211;
    procedure PrintFiscalDocBuffer; dispid 212;
    procedure CloseFiscalDoc; dispid 213;
    procedure CopyFiscalDoc; dispid 214;
    procedure AddSerialNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 215;
    procedure AddHeaderLine(LineNum: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 216;
    procedure AddDateTime(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 217;
    procedure AddOperInfo(OperInfo: TxMercOperInfo; Flags: Integer; HOffset: Integer; 
                          VOffset: Integer); dispid 218;
    procedure AddDocNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 219;
    procedure AddReceiptNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 220;
    procedure AddAccount(const Account: WideString; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 221;
    procedure AddTaxPayerNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 222;
    procedure AddItem(ItemType: TxMercItemType; Price: Currency; ItemIsTare: WordBool; 
                      Department: Integer; Code: Integer; Adjustment: Integer; Quantity: Integer; 
                      QuantityPrec: Integer; TaxIndex: Integer; const UnitName: WideString; 
                      Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 223;
    procedure AddDocPercentAdj(Value: Integer; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                               VOffset: Integer; RightOffset: Integer); dispid 224;
    procedure AddDocAmountAdj(Value: Currency; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                              VOffset: Integer; RightOffset: Integer); dispid 225;
    procedure AddTotal(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 226;
    procedure AddPay(PayType: TxMercPayType; PayCash: Currency; PayCashless: Currency; 
                     const PayInfo: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                     RightOffset: Integer); dispid 227;
    procedure AddChange(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 228;
    procedure AddTaxSum(TaxIndex: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                        RightOffset: Integer); dispid 229;
    procedure AddFiscalSign(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 230;
    procedure AddBarcode(Mask1: Integer; Mask2: Integer; Mask3: Integer; Mask4: Integer; 
                         Mask5: Integer; DoubleDensity: WordBool; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 231;
    procedure AddCustom(const Text: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 232;
    procedure RepeatOperation; dispid 233;
    procedure OpenDay(OperNum: Integer; const OperName: WideString; FullJournal: WordBool; 
                      AProtocol: TxMercProtocol); dispid 234;
    function ZReport(Flags: Integer): Integer; dispid 235;
    function FiscalRewrite(const InspPswd: WideString; const RegNum: WideString; 
                           const TaxPayerNum: WideString; const NewInspPswd: WideString): Integer; dispid 236;
    function FiscalReportByNum(const InspPswd: WideString; PrintFull: WordBool; AStartNum: Integer; 
                               AEndNum: Integer): Integer; dispid 237;
    function FiscalReportByDate(const InspPswd: WideString; PrintFull: WordBool; 
                                AStartDate: TDateTime; AEndDate: TDateTime): Integer; dispid 238;
    function FiscalReportAll(const InspPswd: WideString): Integer; dispid 239;
    procedure FeedAndCut(LineCount: Integer; CutAfterFeed: WordBool); dispid 240;
    procedure PrintNonFiscal(const Data: WideString; OpenDoc: WordBool; CloseDoc: WordBool); dispid 241;
    procedure ShowDisplay(const Data: WideString; OpenMode: WordBool; CloseMode: WordBool); dispid 242;
    procedure SetDisplayBaudRate(BaudRate: Integer); dispid 243;
    procedure ExternalPulse(Channel: Integer; TimeOn: Integer; TimeOff: Integer; Count: Integer); dispid 244;
    procedure QueryDevExStatus; dispid 245;
    procedure QueryFirmwareInfo; dispid 246;
    procedure SetHeader(const Line1: WideString; const Line2: WideString; const Line3: WideString; 
                        const Line4: WideString); dispid 247;
    procedure SetTax(Index: Integer; const TaxName: WideString; TaxRate: Integer); dispid 248;
    function QueryTax(Index: Integer): Integer; dispid 249;
    function QueryCounter(Index: Integer; NoRequest: WordBool): Currency; dispid 250;
    procedure SynchronizeEcrDateTime; dispid 251;
    procedure QueryResourceInfo(PrintInfo: WordBool); dispid 252;
    procedure QueryLastDocInfo; dispid 253;
    procedure SetParameters(Protocol: TxMercProtocol; PrnTimeout: Integer); dispid 254;
    property EcrModel: TxMercEcrModel readonly dispid 255;
    property EcrVersion: Integer readonly dispid 256;
    property Generation: Integer readonly dispid 257;
    property Protocol: TxMercProtocol readonly dispid 258;
    property EcrStatus: Integer readonly dispid 259;
    property EcrStatusMask: Integer readonly dispid 260;
    property DevStatus: Integer readonly dispid 261;
    property DevStatusMask: Integer readonly dispid 262;
    property DocStatus: TxMercDocStatus readonly dispid 263;
    property CurrentOper: TxMercOperType readonly dispid 264;
    property PortNum: Integer dispid 265;
    property BaudRate: Integer dispid 266;
    property Password: WideString dispid 267;
    property InternalTimeout: Integer dispid 268;
    property ExternalTimeout: Integer dispid 269;
    function QueryHeaderLine(LineNum: Integer): WideString; dispid 270;
    function QuerySerialNumber: WideString; dispid 271;
    procedure SetSerialNumber(const Value: WideString); dispid 272;
    function QueryTaxPayerNumber: WideString; dispid 273;
    function QueryRegNumber: WideString; dispid 274;
    function QueryEcrDateTime: TDateTime; dispid 275;
    function QueryDepartName(DepartNum: Integer): WideString; dispid 276;
    procedure SetDepartName(DepartNum: Integer; const Value: WideString); dispid 277;
    function QueryTitle(TitleNum: Integer): WideString; dispid 278;
    procedure SetTitle(TitleNum: Integer; const Value: WideString); dispid 279;
    property Active: WordBool dispid 280;
    property ConnState: TxMercConnState readonly dispid 281;
    property SaleSum: Currency readonly dispid 282;
    property BuyingSum: Currency readonly dispid 283;
    property SerialNumber: WideString readonly dispid 284;
    property RegNumber: WideString readonly dispid 285;
    property TaxPayerNumber: WideString readonly dispid 286;
    property HeaderLine1: WideString readonly dispid 287;
    property HeaderLine2: WideString readonly dispid 288;
    property HeaderLine3: WideString readonly dispid 289;
    property HeaderLine4: WideString readonly dispid 290;
    property StartDate: TDateTime readonly dispid 291;
    property EndDate: TDateTime readonly dispid 292;
    property StartNumber: Integer readonly dispid 293;
    property EndNumber: Integer readonly dispid 294;
    property ReportDate: TDateTime readonly dispid 295;
    property ModelName: WideString readonly dispid 296;
    property Manufacturer: WideString readonly dispid 297;
    property FirmwareVersion: WideString readonly dispid 298;
    property TaxName: WideString readonly dispid 299;
    property TaxDate: TDateTime readonly dispid 300;
    property CounterCount: Integer readonly dispid 301;
    property RewritesRemain: Integer readonly dispid 302;
    property DaysRemain: Integer readonly dispid 303;
    property LastFiscalReport: Integer readonly dispid 304;
    property LastDayClosing: Integer readonly dispid 305;
    property DayDate: TDateTime readonly dispid 306;
    property LastDocOper: TxMercOperType readonly dispid 307;
    property LastDocNumber: Integer readonly dispid 308;
    property LastRecNumber: Integer readonly dispid 309;
    property LastDocType: TxMercOperType readonly dispid 310;
    property LastDocSum: Currency readonly dispid 311;
    property LastDocDate: TDateTime readonly dispid 312;
    property RetryOperation: WordBool dispid 313;
    property ErrCode: Integer readonly dispid 314;
    property ErrCodeEx: Integer readonly dispid 315;
    property ErrMessage: WideString readonly dispid 316;
    function CheckEcrStatus(Flag: Integer): Integer; dispid 317;
    function CheckDevStatus(Flag: Integer): Integer; dispid 318;
    property EcrHour: Integer readonly dispid 319;
    property EcrMin: Integer readonly dispid 320;
    property ReportHour: Integer readonly dispid 321;
    property ReportMin: Integer readonly dispid 322;
    property DayHour: Integer readonly dispid 323;
    property DayMin: Integer readonly dispid 324;
    property LastDocHour: Integer readonly dispid 325;
    property LastDocMin: Integer readonly dispid 326;
    procedure AddGraphicHeader(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 327;
    procedure SetProtocol(Protocol: TxMercProtocol); dispid 328;
    procedure SetPrinterTimeout(Timeout: Integer); dispid 329;
    procedure SetDisplayTimeout(Timeout: Integer); dispid 330;
    procedure SetPrinterContrast(Contrast: Integer); dispid 331;
    procedure SetLeading(Leading: Integer); dispid 332;
    procedure SetCutterDisabled(Disabled: WordBool); dispid 333;
    procedure SetNarrowPaper(Narrow: WordBool); dispid 334;
    function QueryPrinterTimeout: Integer; dispid 335;
    function QueryDisplayTimeout: Integer; dispid 336;
    function QueryPrinterContrast: Integer; dispid 337;
    function QueryLeading: Integer; dispid 338;
    procedure EnableGraphicHeader(Width: Integer; Height: Integer; const Data: WideString); dispid 339;
    procedure DisableGraphicHeader; dispid 340;
    procedure AddLicence(LicType: TxMercLicenceType; const Licence: WideString); dispid 341;
    function XReport(Flags: Integer): Integer; dispid 342;
    function XReportByDep(DepartNum: Integer; Flags: Integer): Integer; dispid 343;
    function XReportByOper(OperNum: Integer; Flags: Integer): Integer; dispid 344;
    function QueryHeaderAlignment: WordBool; dispid 345;
    function QueryOperNumber: Integer; dispid 346;
    function QueryOperName(OperNum: Integer): WideString; dispid 347;
    procedure SetHeaderAlignment(Aligned: WordBool); dispid 348;
    procedure TestConnection; dispid 349;
    property VersionNumber: Integer readonly dispid 350;
    property BuildNumber: Integer readonly dispid 351;
    property Version: WideString dispid 352;
  end;

// *********************************************************************//
// DispIntf:  IMercuryFPrtEvents
// Flags:     (4096) Dispatchable
// GUID:      {2E1B3242-7861-424F-B925-E230D966DDAE}
// *********************************************************************//
  IMercuryFPrtEvents = dispinterface
    ['{2E1B3242-7861-424F-B925-E230D966DDAE}']
    procedure OnNoResponse; dispid 201;
    procedure OnStatusUpdate; dispid 204;
    procedure OnConnStateUpdate; dispid 205;
    procedure OnPrinterError; dispid 202;
    procedure OnDisplayError; dispid 203;
  end;

// *********************************************************************//
// Interface: IMercuryFPrtX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6976823E-B5E5-4748-BD90-6516D22B694E}
// *********************************************************************//
  IMercuryFPrtX = interface(IMercuryFPrt)
    ['{6976823E-B5E5-4748-BD90-6516D22B694E}']
    function Get_BorderSize: Integer; safecall;
    procedure Set_BorderSize(Value: Integer); safecall;
    function Get_ShowState: WordBool; safecall;
    procedure Set_ShowState(Value: WordBool); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure AboutBox; safecall;
    property BorderSize: Integer read Get_BorderSize write Set_BorderSize;
    property ShowState: WordBool read Get_ShowState write Set_ShowState;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
  end;

// *********************************************************************//
// DispIntf:  IMercuryFPrtXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6976823E-B5E5-4748-BD90-6516D22B694E}
// *********************************************************************//
  IMercuryFPrtXDisp = dispinterface
    ['{6976823E-B5E5-4748-BD90-6516D22B694E}']
    property BorderSize: Integer dispid 1001;
    property ShowState: WordBool dispid 1002;
    property Enabled: WordBool dispid -514;
    procedure AboutBox; dispid -552;
    procedure Open; dispid 201;
    procedure Close(ForceAbort: WordBool); dispid 202;
    procedure OpenReceipt(Oper: TxMercOperType); dispid 203;
    procedure AddReceiptItem(const Desc: WideString; Price: Currency; ItemIsTare: WordBool; 
                             Department: Integer; Code: Integer; Adjustment: Integer; 
                             Quantity: Integer; QuantityPrec: Integer; TaxIndex: Integer; 
                             const UnitName: WideString; Flags: Integer); dispid 204;
    procedure CancelReceipt; dispid 205;
    procedure CloseReceipt(const Account: WideString; PayType: TxMercPayType; PayCash: Currency; 
                           PayCashless: Currency; const PayInfo: WideString; CopiesNum: Integer; 
                           OperInfo: TxMercOperInfo); dispid 206;
    procedure OpenCustomDoc(UseForm: WordBool; Oper: TxMercOperType); dispid 207;
    procedure CancelCustomDoc; dispid 208;
    procedure CloseCustomDoc(PayType: TxMercPayType; Flags: Integer; HCopiesNum: Integer; 
                             VCopiesNum: Integer; VOrigOffset: Integer; HCopyOffset: Integer; 
                             VCopyOffset: Integer; FiscalCopy: Integer); dispid 209;
    procedure OpenFiscalDoc(Oper: TxMercOperType); dispid 210;
    procedure CancelFiscalDoc(BufferOnly: WordBool); dispid 211;
    procedure PrintFiscalDocBuffer; dispid 212;
    procedure CloseFiscalDoc; dispid 213;
    procedure CopyFiscalDoc; dispid 214;
    procedure AddSerialNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 215;
    procedure AddHeaderLine(LineNum: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 216;
    procedure AddDateTime(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 217;
    procedure AddOperInfo(OperInfo: TxMercOperInfo; Flags: Integer; HOffset: Integer; 
                          VOffset: Integer); dispid 218;
    procedure AddDocNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 219;
    procedure AddReceiptNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 220;
    procedure AddAccount(const Account: WideString; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 221;
    procedure AddTaxPayerNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 222;
    procedure AddItem(ItemType: TxMercItemType; Price: Currency; ItemIsTare: WordBool; 
                      Department: Integer; Code: Integer; Adjustment: Integer; Quantity: Integer; 
                      QuantityPrec: Integer; TaxIndex: Integer; const UnitName: WideString; 
                      Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 223;
    procedure AddDocPercentAdj(Value: Integer; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                               VOffset: Integer; RightOffset: Integer); dispid 224;
    procedure AddDocAmountAdj(Value: Currency; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                              VOffset: Integer; RightOffset: Integer); dispid 225;
    procedure AddTotal(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 226;
    procedure AddPay(PayType: TxMercPayType; PayCash: Currency; PayCashless: Currency; 
                     const PayInfo: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                     RightOffset: Integer); dispid 227;
    procedure AddChange(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 228;
    procedure AddTaxSum(TaxIndex: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                        RightOffset: Integer); dispid 229;
    procedure AddFiscalSign(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 230;
    procedure AddBarcode(Mask1: Integer; Mask2: Integer; Mask3: Integer; Mask4: Integer; 
                         Mask5: Integer; DoubleDensity: WordBool; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 231;
    procedure AddCustom(const Text: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 232;
    procedure RepeatOperation; dispid 233;
    procedure OpenDay(OperNum: Integer; const OperName: WideString; FullJournal: WordBool; 
                      AProtocol: TxMercProtocol); dispid 234;
    function ZReport(Flags: Integer): Integer; dispid 235;
    function FiscalRewrite(const InspPswd: WideString; const RegNum: WideString; 
                           const TaxPayerNum: WideString; const NewInspPswd: WideString): Integer; dispid 236;
    function FiscalReportByNum(const InspPswd: WideString; PrintFull: WordBool; AStartNum: Integer; 
                               AEndNum: Integer): Integer; dispid 237;
    function FiscalReportByDate(const InspPswd: WideString; PrintFull: WordBool; 
                                AStartDate: TDateTime; AEndDate: TDateTime): Integer; dispid 238;
    function FiscalReportAll(const InspPswd: WideString): Integer; dispid 239;
    procedure FeedAndCut(LineCount: Integer; CutAfterFeed: WordBool); dispid 240;
    procedure PrintNonFiscal(const Data: WideString; OpenDoc: WordBool; CloseDoc: WordBool); dispid 241;
    procedure ShowDisplay(const Data: WideString; OpenMode: WordBool; CloseMode: WordBool); dispid 242;
    procedure SetDisplayBaudRate(BaudRate: Integer); dispid 243;
    procedure ExternalPulse(Channel: Integer; TimeOn: Integer; TimeOff: Integer; Count: Integer); dispid 244;
    procedure QueryDevExStatus; dispid 245;
    procedure QueryFirmwareInfo; dispid 246;
    procedure SetHeader(const Line1: WideString; const Line2: WideString; const Line3: WideString; 
                        const Line4: WideString); dispid 247;
    procedure SetTax(Index: Integer; const TaxName: WideString; TaxRate: Integer); dispid 248;
    function QueryTax(Index: Integer): Integer; dispid 249;
    function QueryCounter(Index: Integer; NoRequest: WordBool): Currency; dispid 250;
    procedure SynchronizeEcrDateTime; dispid 251;
    procedure QueryResourceInfo(PrintInfo: WordBool); dispid 252;
    procedure QueryLastDocInfo; dispid 253;
    procedure SetParameters(Protocol: TxMercProtocol; PrnTimeout: Integer); dispid 254;
    property EcrModel: TxMercEcrModel readonly dispid 255;
    property EcrVersion: Integer readonly dispid 256;
    property Generation: Integer readonly dispid 257;
    property Protocol: TxMercProtocol readonly dispid 258;
    property EcrStatus: Integer readonly dispid 259;
    property EcrStatusMask: Integer readonly dispid 260;
    property DevStatus: Integer readonly dispid 261;
    property DevStatusMask: Integer readonly dispid 262;
    property DocStatus: TxMercDocStatus readonly dispid 263;
    property CurrentOper: TxMercOperType readonly dispid 264;
    property PortNum: Integer dispid 265;
    property BaudRate: Integer dispid 266;
    property Password: WideString dispid 267;
    property InternalTimeout: Integer dispid 268;
    property ExternalTimeout: Integer dispid 269;
    function QueryHeaderLine(LineNum: Integer): WideString; dispid 270;
    function QuerySerialNumber: WideString; dispid 271;
    procedure SetSerialNumber(const Value: WideString); dispid 272;
    function QueryTaxPayerNumber: WideString; dispid 273;
    function QueryRegNumber: WideString; dispid 274;
    function QueryEcrDateTime: TDateTime; dispid 275;
    function QueryDepartName(DepartNum: Integer): WideString; dispid 276;
    procedure SetDepartName(DepartNum: Integer; const Value: WideString); dispid 277;
    function QueryTitle(TitleNum: Integer): WideString; dispid 278;
    procedure SetTitle(TitleNum: Integer; const Value: WideString); dispid 279;
    property Active: WordBool dispid 280;
    property ConnState: TxMercConnState readonly dispid 281;
    property SaleSum: Currency readonly dispid 282;
    property BuyingSum: Currency readonly dispid 283;
    property SerialNumber: WideString readonly dispid 284;
    property RegNumber: WideString readonly dispid 285;
    property TaxPayerNumber: WideString readonly dispid 286;
    property HeaderLine1: WideString readonly dispid 287;
    property HeaderLine2: WideString readonly dispid 288;
    property HeaderLine3: WideString readonly dispid 289;
    property HeaderLine4: WideString readonly dispid 290;
    property StartDate: TDateTime readonly dispid 291;
    property EndDate: TDateTime readonly dispid 292;
    property StartNumber: Integer readonly dispid 293;
    property EndNumber: Integer readonly dispid 294;
    property ReportDate: TDateTime readonly dispid 295;
    property ModelName: WideString readonly dispid 296;
    property Manufacturer: WideString readonly dispid 297;
    property FirmwareVersion: WideString readonly dispid 298;
    property TaxName: WideString readonly dispid 299;
    property TaxDate: TDateTime readonly dispid 300;
    property CounterCount: Integer readonly dispid 301;
    property RewritesRemain: Integer readonly dispid 302;
    property DaysRemain: Integer readonly dispid 303;
    property LastFiscalReport: Integer readonly dispid 304;
    property LastDayClosing: Integer readonly dispid 305;
    property DayDate: TDateTime readonly dispid 306;
    property LastDocOper: TxMercOperType readonly dispid 307;
    property LastDocNumber: Integer readonly dispid 308;
    property LastRecNumber: Integer readonly dispid 309;
    property LastDocType: TxMercOperType readonly dispid 310;
    property LastDocSum: Currency readonly dispid 311;
    property LastDocDate: TDateTime readonly dispid 312;
    property RetryOperation: WordBool dispid 313;
    property ErrCode: Integer readonly dispid 314;
    property ErrCodeEx: Integer readonly dispid 315;
    property ErrMessage: WideString readonly dispid 316;
    function CheckEcrStatus(Flag: Integer): Integer; dispid 317;
    function CheckDevStatus(Flag: Integer): Integer; dispid 318;
    property EcrHour: Integer readonly dispid 319;
    property EcrMin: Integer readonly dispid 320;
    property ReportHour: Integer readonly dispid 321;
    property ReportMin: Integer readonly dispid 322;
    property DayHour: Integer readonly dispid 323;
    property DayMin: Integer readonly dispid 324;
    property LastDocHour: Integer readonly dispid 325;
    property LastDocMin: Integer readonly dispid 326;
    procedure AddGraphicHeader(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 327;
    procedure SetProtocol(Protocol: TxMercProtocol); dispid 328;
    procedure SetPrinterTimeout(Timeout: Integer); dispid 329;
    procedure SetDisplayTimeout(Timeout: Integer); dispid 330;
    procedure SetPrinterContrast(Contrast: Integer); dispid 331;
    procedure SetLeading(Leading: Integer); dispid 332;
    procedure SetCutterDisabled(Disabled: WordBool); dispid 333;
    procedure SetNarrowPaper(Narrow: WordBool); dispid 334;
    function QueryPrinterTimeout: Integer; dispid 335;
    function QueryDisplayTimeout: Integer; dispid 336;
    function QueryPrinterContrast: Integer; dispid 337;
    function QueryLeading: Integer; dispid 338;
    procedure EnableGraphicHeader(Width: Integer; Height: Integer; const Data: WideString); dispid 339;
    procedure DisableGraphicHeader; dispid 340;
    procedure AddLicence(LicType: TxMercLicenceType; const Licence: WideString); dispid 341;
    function XReport(Flags: Integer): Integer; dispid 342;
    function XReportByDep(DepartNum: Integer; Flags: Integer): Integer; dispid 343;
    function XReportByOper(OperNum: Integer; Flags: Integer): Integer; dispid 344;
    function QueryHeaderAlignment: WordBool; dispid 345;
    function QueryOperNumber: Integer; dispid 346;
    function QueryOperName(OperNum: Integer): WideString; dispid 347;
    procedure SetHeaderAlignment(Aligned: WordBool); dispid 348;
    procedure TestConnection; dispid 349;
    property VersionNumber: Integer readonly dispid 350;
    property BuildNumber: Integer readonly dispid 351;
    property Version: WideString dispid 352;
  end;

// *********************************************************************//
// Interface: _IMercuryFPrtEventsDirect
// Flags:     (256) OleAutomation
// GUID:      {DF60ED81-A028-4863-8C69-662E5F28512B}
// *********************************************************************//
  _IMercuryFPrtEventsDirect = interface(IUnknown)
    ['{DF60ED81-A028-4863-8C69-662E5F28512B}']
    function OnNoResponse: HResult; stdcall;
    function OnStatusUpdate: HResult; stdcall;
    function OnConnStateUpdate: HResult; stdcall;
    function OnPrinterError: HResult; stdcall;
    function OnDisplayError: HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IMercuryFPrt2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {081E43FF-4768-4C9A-957F-BF117CFDD15B}
// *********************************************************************//
  IMercuryFPrt2 = interface(IMercuryFPrt)
    ['{081E43FF-4768-4C9A-957F-BF117CFDD15B}']
    function QueryAutocut: WordBool; safecall;
    procedure SetAutocut(Autocut: WordBool); safecall;
    function QueryEconomicMode: WordBool; safecall;
    procedure SetEconomicMode(EconomicMode: WordBool); safecall;
    function Get_EcrSubVersion: Integer; safecall;
    property EcrSubVersion: Integer read Get_EcrSubVersion;
  end;

// *********************************************************************//
// DispIntf:  IMercuryFPrt2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {081E43FF-4768-4C9A-957F-BF117CFDD15B}
// *********************************************************************//
  IMercuryFPrt2Disp = dispinterface
    ['{081E43FF-4768-4C9A-957F-BF117CFDD15B}']
    function QueryAutocut: WordBool; dispid 353;
    procedure SetAutocut(Autocut: WordBool); dispid 354;
    function QueryEconomicMode: WordBool; dispid 355;
    procedure SetEconomicMode(EconomicMode: WordBool); dispid 356;
    property EcrSubVersion: Integer readonly dispid 357;
    procedure Open; dispid 201;
    procedure Close(ForceAbort: WordBool); dispid 202;
    procedure OpenReceipt(Oper: TxMercOperType); dispid 203;
    procedure AddReceiptItem(const Desc: WideString; Price: Currency; ItemIsTare: WordBool; 
                             Department: Integer; Code: Integer; Adjustment: Integer; 
                             Quantity: Integer; QuantityPrec: Integer; TaxIndex: Integer; 
                             const UnitName: WideString; Flags: Integer); dispid 204;
    procedure CancelReceipt; dispid 205;
    procedure CloseReceipt(const Account: WideString; PayType: TxMercPayType; PayCash: Currency; 
                           PayCashless: Currency; const PayInfo: WideString; CopiesNum: Integer; 
                           OperInfo: TxMercOperInfo); dispid 206;
    procedure OpenCustomDoc(UseForm: WordBool; Oper: TxMercOperType); dispid 207;
    procedure CancelCustomDoc; dispid 208;
    procedure CloseCustomDoc(PayType: TxMercPayType; Flags: Integer; HCopiesNum: Integer; 
                             VCopiesNum: Integer; VOrigOffset: Integer; HCopyOffset: Integer; 
                             VCopyOffset: Integer; FiscalCopy: Integer); dispid 209;
    procedure OpenFiscalDoc(Oper: TxMercOperType); dispid 210;
    procedure CancelFiscalDoc(BufferOnly: WordBool); dispid 211;
    procedure PrintFiscalDocBuffer; dispid 212;
    procedure CloseFiscalDoc; dispid 213;
    procedure CopyFiscalDoc; dispid 214;
    procedure AddSerialNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 215;
    procedure AddHeaderLine(LineNum: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 216;
    procedure AddDateTime(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 217;
    procedure AddOperInfo(OperInfo: TxMercOperInfo; Flags: Integer; HOffset: Integer; 
                          VOffset: Integer); dispid 218;
    procedure AddDocNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 219;
    procedure AddReceiptNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 220;
    procedure AddAccount(const Account: WideString; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 221;
    procedure AddTaxPayerNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 222;
    procedure AddItem(ItemType: TxMercItemType; Price: Currency; ItemIsTare: WordBool; 
                      Department: Integer; Code: Integer; Adjustment: Integer; Quantity: Integer; 
                      QuantityPrec: Integer; TaxIndex: Integer; const UnitName: WideString; 
                      Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 223;
    procedure AddDocPercentAdj(Value: Integer; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                               VOffset: Integer; RightOffset: Integer); dispid 224;
    procedure AddDocAmountAdj(Value: Currency; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                              VOffset: Integer; RightOffset: Integer); dispid 225;
    procedure AddTotal(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 226;
    procedure AddPay(PayType: TxMercPayType; PayCash: Currency; PayCashless: Currency; 
                     const PayInfo: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                     RightOffset: Integer); dispid 227;
    procedure AddChange(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 228;
    procedure AddTaxSum(TaxIndex: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                        RightOffset: Integer); dispid 229;
    procedure AddFiscalSign(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 230;
    procedure AddBarcode(Mask1: Integer; Mask2: Integer; Mask3: Integer; Mask4: Integer; 
                         Mask5: Integer; DoubleDensity: WordBool; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 231;
    procedure AddCustom(const Text: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 232;
    procedure RepeatOperation; dispid 233;
    procedure OpenDay(OperNum: Integer; const OperName: WideString; FullJournal: WordBool; 
                      AProtocol: TxMercProtocol); dispid 234;
    function ZReport(Flags: Integer): Integer; dispid 235;
    function FiscalRewrite(const InspPswd: WideString; const RegNum: WideString; 
                           const TaxPayerNum: WideString; const NewInspPswd: WideString): Integer; dispid 236;
    function FiscalReportByNum(const InspPswd: WideString; PrintFull: WordBool; AStartNum: Integer; 
                               AEndNum: Integer): Integer; dispid 237;
    function FiscalReportByDate(const InspPswd: WideString; PrintFull: WordBool; 
                                AStartDate: TDateTime; AEndDate: TDateTime): Integer; dispid 238;
    function FiscalReportAll(const InspPswd: WideString): Integer; dispid 239;
    procedure FeedAndCut(LineCount: Integer; CutAfterFeed: WordBool); dispid 240;
    procedure PrintNonFiscal(const Data: WideString; OpenDoc: WordBool; CloseDoc: WordBool); dispid 241;
    procedure ShowDisplay(const Data: WideString; OpenMode: WordBool; CloseMode: WordBool); dispid 242;
    procedure SetDisplayBaudRate(BaudRate: Integer); dispid 243;
    procedure ExternalPulse(Channel: Integer; TimeOn: Integer; TimeOff: Integer; Count: Integer); dispid 244;
    procedure QueryDevExStatus; dispid 245;
    procedure QueryFirmwareInfo; dispid 246;
    procedure SetHeader(const Line1: WideString; const Line2: WideString; const Line3: WideString; 
                        const Line4: WideString); dispid 247;
    procedure SetTax(Index: Integer; const TaxName: WideString; TaxRate: Integer); dispid 248;
    function QueryTax(Index: Integer): Integer; dispid 249;
    function QueryCounter(Index: Integer; NoRequest: WordBool): Currency; dispid 250;
    procedure SynchronizeEcrDateTime; dispid 251;
    procedure QueryResourceInfo(PrintInfo: WordBool); dispid 252;
    procedure QueryLastDocInfo; dispid 253;
    procedure SetParameters(Protocol: TxMercProtocol; PrnTimeout: Integer); dispid 254;
    property EcrModel: TxMercEcrModel readonly dispid 255;
    property EcrVersion: Integer readonly dispid 256;
    property Generation: Integer readonly dispid 257;
    property Protocol: TxMercProtocol readonly dispid 258;
    property EcrStatus: Integer readonly dispid 259;
    property EcrStatusMask: Integer readonly dispid 260;
    property DevStatus: Integer readonly dispid 261;
    property DevStatusMask: Integer readonly dispid 262;
    property DocStatus: TxMercDocStatus readonly dispid 263;
    property CurrentOper: TxMercOperType readonly dispid 264;
    property PortNum: Integer dispid 265;
    property BaudRate: Integer dispid 266;
    property Password: WideString dispid 267;
    property InternalTimeout: Integer dispid 268;
    property ExternalTimeout: Integer dispid 269;
    function QueryHeaderLine(LineNum: Integer): WideString; dispid 270;
    function QuerySerialNumber: WideString; dispid 271;
    procedure SetSerialNumber(const Value: WideString); dispid 272;
    function QueryTaxPayerNumber: WideString; dispid 273;
    function QueryRegNumber: WideString; dispid 274;
    function QueryEcrDateTime: TDateTime; dispid 275;
    function QueryDepartName(DepartNum: Integer): WideString; dispid 276;
    procedure SetDepartName(DepartNum: Integer; const Value: WideString); dispid 277;
    function QueryTitle(TitleNum: Integer): WideString; dispid 278;
    procedure SetTitle(TitleNum: Integer; const Value: WideString); dispid 279;
    property Active: WordBool dispid 280;
    property ConnState: TxMercConnState readonly dispid 281;
    property SaleSum: Currency readonly dispid 282;
    property BuyingSum: Currency readonly dispid 283;
    property SerialNumber: WideString readonly dispid 284;
    property RegNumber: WideString readonly dispid 285;
    property TaxPayerNumber: WideString readonly dispid 286;
    property HeaderLine1: WideString readonly dispid 287;
    property HeaderLine2: WideString readonly dispid 288;
    property HeaderLine3: WideString readonly dispid 289;
    property HeaderLine4: WideString readonly dispid 290;
    property StartDate: TDateTime readonly dispid 291;
    property EndDate: TDateTime readonly dispid 292;
    property StartNumber: Integer readonly dispid 293;
    property EndNumber: Integer readonly dispid 294;
    property ReportDate: TDateTime readonly dispid 295;
    property ModelName: WideString readonly dispid 296;
    property Manufacturer: WideString readonly dispid 297;
    property FirmwareVersion: WideString readonly dispid 298;
    property TaxName: WideString readonly dispid 299;
    property TaxDate: TDateTime readonly dispid 300;
    property CounterCount: Integer readonly dispid 301;
    property RewritesRemain: Integer readonly dispid 302;
    property DaysRemain: Integer readonly dispid 303;
    property LastFiscalReport: Integer readonly dispid 304;
    property LastDayClosing: Integer readonly dispid 305;
    property DayDate: TDateTime readonly dispid 306;
    property LastDocOper: TxMercOperType readonly dispid 307;
    property LastDocNumber: Integer readonly dispid 308;
    property LastRecNumber: Integer readonly dispid 309;
    property LastDocType: TxMercOperType readonly dispid 310;
    property LastDocSum: Currency readonly dispid 311;
    property LastDocDate: TDateTime readonly dispid 312;
    property RetryOperation: WordBool dispid 313;
    property ErrCode: Integer readonly dispid 314;
    property ErrCodeEx: Integer readonly dispid 315;
    property ErrMessage: WideString readonly dispid 316;
    function CheckEcrStatus(Flag: Integer): Integer; dispid 317;
    function CheckDevStatus(Flag: Integer): Integer; dispid 318;
    property EcrHour: Integer readonly dispid 319;
    property EcrMin: Integer readonly dispid 320;
    property ReportHour: Integer readonly dispid 321;
    property ReportMin: Integer readonly dispid 322;
    property DayHour: Integer readonly dispid 323;
    property DayMin: Integer readonly dispid 324;
    property LastDocHour: Integer readonly dispid 325;
    property LastDocMin: Integer readonly dispid 326;
    procedure AddGraphicHeader(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 327;
    procedure SetProtocol(Protocol: TxMercProtocol); dispid 328;
    procedure SetPrinterTimeout(Timeout: Integer); dispid 329;
    procedure SetDisplayTimeout(Timeout: Integer); dispid 330;
    procedure SetPrinterContrast(Contrast: Integer); dispid 331;
    procedure SetLeading(Leading: Integer); dispid 332;
    procedure SetCutterDisabled(Disabled: WordBool); dispid 333;
    procedure SetNarrowPaper(Narrow: WordBool); dispid 334;
    function QueryPrinterTimeout: Integer; dispid 335;
    function QueryDisplayTimeout: Integer; dispid 336;
    function QueryPrinterContrast: Integer; dispid 337;
    function QueryLeading: Integer; dispid 338;
    procedure EnableGraphicHeader(Width: Integer; Height: Integer; const Data: WideString); dispid 339;
    procedure DisableGraphicHeader; dispid 340;
    procedure AddLicence(LicType: TxMercLicenceType; const Licence: WideString); dispid 341;
    function XReport(Flags: Integer): Integer; dispid 342;
    function XReportByDep(DepartNum: Integer; Flags: Integer): Integer; dispid 343;
    function XReportByOper(OperNum: Integer; Flags: Integer): Integer; dispid 344;
    function QueryHeaderAlignment: WordBool; dispid 345;
    function QueryOperNumber: Integer; dispid 346;
    function QueryOperName(OperNum: Integer): WideString; dispid 347;
    procedure SetHeaderAlignment(Aligned: WordBool); dispid 348;
    procedure TestConnection; dispid 349;
    property VersionNumber: Integer readonly dispid 350;
    property BuildNumber: Integer readonly dispid 351;
    property Version: WideString dispid 352;
  end;

// *********************************************************************//
// Interface: IMercuryFPrt3
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {761CED73-985A-4FCF-95E7-21D03E489305}
// *********************************************************************//
  IMercuryFPrt3 = interface(IMercuryFPrt2)
    ['{761CED73-985A-4FCF-95E7-21D03E489305}']
    procedure EKLZActivate; safecall;
    procedure EKLZActivationReport; safecall;
    procedure EKLZDayReport(DayNumber: Integer); safecall;
    procedure EKLZReportByNum(IsFull: WordBool; AStartNum: Integer; AEndNum: Integer); safecall;
    procedure EKLZReportByDate(IsFull: WordBool; AStartDate: TDateTime; AEndDate: TDateTime); safecall;
    procedure EKLZDocByNum(Number: Integer); safecall;
    procedure EKLZControlByNum(DayNumber: Integer); safecall;
    procedure EKLZCloseArchive; safecall;
    procedure EKLZQueryStatus; safecall;
    function QueryPaperJournal: WordBool; safecall;
    procedure SetPaperJournal(PaperJournal: WordBool); safecall;
    function Get_EKLZSupported: WordBool; safecall;
    function Get_EKLZActivated: WordBool; safecall;
    function Get_EKLZOper: TxMercOperType; safecall;
    function Get_EKLZArchiving: WordBool; safecall;
    function Get_EKLZReporting: WordBool; safecall;
    function Get_EKLZDayOpened: WordBool; safecall;
    function Get_EKLZFatalError: WordBool; safecall;
    function Get_EKLZAttention: WordBool; safecall;
    function Get_LastRepNumber: Integer; safecall;
    function Get_EKLZRest: Integer; safecall;
    function QueryFullJournal: WordBool; safecall;
    procedure SetFullJournal(FullJournal: WordBool); safecall;
    procedure AddEKLZData(Flags: Integer; HOffset: Integer; VOffset: Integer); safecall;
    function Get_LastBuyingSum: Currency; safecall;
    property EKLZSupported: WordBool read Get_EKLZSupported;
    property EKLZActivated: WordBool read Get_EKLZActivated;
    property EKLZOper: TxMercOperType read Get_EKLZOper;
    property EKLZArchiving: WordBool read Get_EKLZArchiving;
    property EKLZReporting: WordBool read Get_EKLZReporting;
    property EKLZDayOpened: WordBool read Get_EKLZDayOpened;
    property EKLZFatalError: WordBool read Get_EKLZFatalError;
    property EKLZAttention: WordBool read Get_EKLZAttention;
    property LastRepNumber: Integer read Get_LastRepNumber;
    property EKLZRest: Integer read Get_EKLZRest;
    property LastBuyingSum: Currency read Get_LastBuyingSum;
  end;

// *********************************************************************//
// DispIntf:  IMercuryFPrt3Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {761CED73-985A-4FCF-95E7-21D03E489305}
// *********************************************************************//
  IMercuryFPrt3Disp = dispinterface
    ['{761CED73-985A-4FCF-95E7-21D03E489305}']
    procedure EKLZActivate; dispid 401;
    procedure EKLZActivationReport; dispid 402;
    procedure EKLZDayReport(DayNumber: Integer); dispid 403;
    procedure EKLZReportByNum(IsFull: WordBool; AStartNum: Integer; AEndNum: Integer); dispid 404;
    procedure EKLZReportByDate(IsFull: WordBool; AStartDate: TDateTime; AEndDate: TDateTime); dispid 405;
    procedure EKLZDocByNum(Number: Integer); dispid 406;
    procedure EKLZControlByNum(DayNumber: Integer); dispid 407;
    procedure EKLZCloseArchive; dispid 408;
    procedure EKLZQueryStatus; dispid 409;
    function QueryPaperJournal: WordBool; dispid 410;
    procedure SetPaperJournal(PaperJournal: WordBool); dispid 411;
    property EKLZSupported: WordBool readonly dispid 412;
    property EKLZActivated: WordBool readonly dispid 413;
    property EKLZOper: TxMercOperType readonly dispid 414;
    property EKLZArchiving: WordBool readonly dispid 415;
    property EKLZReporting: WordBool readonly dispid 416;
    property EKLZDayOpened: WordBool readonly dispid 417;
    property EKLZFatalError: WordBool readonly dispid 418;
    property EKLZAttention: WordBool readonly dispid 419;
    property LastRepNumber: Integer readonly dispid 420;
    property EKLZRest: Integer readonly dispid 421;
    function QueryFullJournal: WordBool; dispid 422;
    procedure SetFullJournal(FullJournal: WordBool); dispid 423;
    procedure AddEKLZData(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 424;
    property LastBuyingSum: Currency readonly dispid 425;
    function QueryAutocut: WordBool; dispid 353;
    procedure SetAutocut(Autocut: WordBool); dispid 354;
    function QueryEconomicMode: WordBool; dispid 355;
    procedure SetEconomicMode(EconomicMode: WordBool); dispid 356;
    property EcrSubVersion: Integer readonly dispid 357;
    procedure Open; dispid 201;
    procedure Close(ForceAbort: WordBool); dispid 202;
    procedure OpenReceipt(Oper: TxMercOperType); dispid 203;
    procedure AddReceiptItem(const Desc: WideString; Price: Currency; ItemIsTare: WordBool; 
                             Department: Integer; Code: Integer; Adjustment: Integer; 
                             Quantity: Integer; QuantityPrec: Integer; TaxIndex: Integer; 
                             const UnitName: WideString; Flags: Integer); dispid 204;
    procedure CancelReceipt; dispid 205;
    procedure CloseReceipt(const Account: WideString; PayType: TxMercPayType; PayCash: Currency; 
                           PayCashless: Currency; const PayInfo: WideString; CopiesNum: Integer; 
                           OperInfo: TxMercOperInfo); dispid 206;
    procedure OpenCustomDoc(UseForm: WordBool; Oper: TxMercOperType); dispid 207;
    procedure CancelCustomDoc; dispid 208;
    procedure CloseCustomDoc(PayType: TxMercPayType; Flags: Integer; HCopiesNum: Integer; 
                             VCopiesNum: Integer; VOrigOffset: Integer; HCopyOffset: Integer; 
                             VCopyOffset: Integer; FiscalCopy: Integer); dispid 209;
    procedure OpenFiscalDoc(Oper: TxMercOperType); dispid 210;
    procedure CancelFiscalDoc(BufferOnly: WordBool); dispid 211;
    procedure PrintFiscalDocBuffer; dispid 212;
    procedure CloseFiscalDoc; dispid 213;
    procedure CopyFiscalDoc; dispid 214;
    procedure AddSerialNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 215;
    procedure AddHeaderLine(LineNum: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 216;
    procedure AddDateTime(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 217;
    procedure AddOperInfo(OperInfo: TxMercOperInfo; Flags: Integer; HOffset: Integer; 
                          VOffset: Integer); dispid 218;
    procedure AddDocNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 219;
    procedure AddReceiptNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 220;
    procedure AddAccount(const Account: WideString; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 221;
    procedure AddTaxPayerNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 222;
    procedure AddItem(ItemType: TxMercItemType; Price: Currency; ItemIsTare: WordBool; 
                      Department: Integer; Code: Integer; Adjustment: Integer; Quantity: Integer; 
                      QuantityPrec: Integer; TaxIndex: Integer; const UnitName: WideString; 
                      Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 223;
    procedure AddDocPercentAdj(Value: Integer; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                               VOffset: Integer; RightOffset: Integer); dispid 224;
    procedure AddDocAmountAdj(Value: Currency; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                              VOffset: Integer; RightOffset: Integer); dispid 225;
    procedure AddTotal(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 226;
    procedure AddPay(PayType: TxMercPayType; PayCash: Currency; PayCashless: Currency; 
                     const PayInfo: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                     RightOffset: Integer); dispid 227;
    procedure AddChange(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 228;
    procedure AddTaxSum(TaxIndex: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                        RightOffset: Integer); dispid 229;
    procedure AddFiscalSign(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 230;
    procedure AddBarcode(Mask1: Integer; Mask2: Integer; Mask3: Integer; Mask4: Integer; 
                         Mask5: Integer; DoubleDensity: WordBool; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 231;
    procedure AddCustom(const Text: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 232;
    procedure RepeatOperation; dispid 233;
    procedure OpenDay(OperNum: Integer; const OperName: WideString; FullJournal: WordBool; 
                      AProtocol: TxMercProtocol); dispid 234;
    function ZReport(Flags: Integer): Integer; dispid 235;
    function FiscalRewrite(const InspPswd: WideString; const RegNum: WideString; 
                           const TaxPayerNum: WideString; const NewInspPswd: WideString): Integer; dispid 236;
    function FiscalReportByNum(const InspPswd: WideString; PrintFull: WordBool; AStartNum: Integer; 
                               AEndNum: Integer): Integer; dispid 237;
    function FiscalReportByDate(const InspPswd: WideString; PrintFull: WordBool; 
                                AStartDate: TDateTime; AEndDate: TDateTime): Integer; dispid 238;
    function FiscalReportAll(const InspPswd: WideString): Integer; dispid 239;
    procedure FeedAndCut(LineCount: Integer; CutAfterFeed: WordBool); dispid 240;
    procedure PrintNonFiscal(const Data: WideString; OpenDoc: WordBool; CloseDoc: WordBool); dispid 241;
    procedure ShowDisplay(const Data: WideString; OpenMode: WordBool; CloseMode: WordBool); dispid 242;
    procedure SetDisplayBaudRate(BaudRate: Integer); dispid 243;
    procedure ExternalPulse(Channel: Integer; TimeOn: Integer; TimeOff: Integer; Count: Integer); dispid 244;
    procedure QueryDevExStatus; dispid 245;
    procedure QueryFirmwareInfo; dispid 246;
    procedure SetHeader(const Line1: WideString; const Line2: WideString; const Line3: WideString; 
                        const Line4: WideString); dispid 247;
    procedure SetTax(Index: Integer; const TaxName: WideString; TaxRate: Integer); dispid 248;
    function QueryTax(Index: Integer): Integer; dispid 249;
    function QueryCounter(Index: Integer; NoRequest: WordBool): Currency; dispid 250;
    procedure SynchronizeEcrDateTime; dispid 251;
    procedure QueryResourceInfo(PrintInfo: WordBool); dispid 252;
    procedure QueryLastDocInfo; dispid 253;
    procedure SetParameters(Protocol: TxMercProtocol; PrnTimeout: Integer); dispid 254;
    property EcrModel: TxMercEcrModel readonly dispid 255;
    property EcrVersion: Integer readonly dispid 256;
    property Generation: Integer readonly dispid 257;
    property Protocol: TxMercProtocol readonly dispid 258;
    property EcrStatus: Integer readonly dispid 259;
    property EcrStatusMask: Integer readonly dispid 260;
    property DevStatus: Integer readonly dispid 261;
    property DevStatusMask: Integer readonly dispid 262;
    property DocStatus: TxMercDocStatus readonly dispid 263;
    property CurrentOper: TxMercOperType readonly dispid 264;
    property PortNum: Integer dispid 265;
    property BaudRate: Integer dispid 266;
    property Password: WideString dispid 267;
    property InternalTimeout: Integer dispid 268;
    property ExternalTimeout: Integer dispid 269;
    function QueryHeaderLine(LineNum: Integer): WideString; dispid 270;
    function QuerySerialNumber: WideString; dispid 271;
    procedure SetSerialNumber(const Value: WideString); dispid 272;
    function QueryTaxPayerNumber: WideString; dispid 273;
    function QueryRegNumber: WideString; dispid 274;
    function QueryEcrDateTime: TDateTime; dispid 275;
    function QueryDepartName(DepartNum: Integer): WideString; dispid 276;
    procedure SetDepartName(DepartNum: Integer; const Value: WideString); dispid 277;
    function QueryTitle(TitleNum: Integer): WideString; dispid 278;
    procedure SetTitle(TitleNum: Integer; const Value: WideString); dispid 279;
    property Active: WordBool dispid 280;
    property ConnState: TxMercConnState readonly dispid 281;
    property SaleSum: Currency readonly dispid 282;
    property BuyingSum: Currency readonly dispid 283;
    property SerialNumber: WideString readonly dispid 284;
    property RegNumber: WideString readonly dispid 285;
    property TaxPayerNumber: WideString readonly dispid 286;
    property HeaderLine1: WideString readonly dispid 287;
    property HeaderLine2: WideString readonly dispid 288;
    property HeaderLine3: WideString readonly dispid 289;
    property HeaderLine4: WideString readonly dispid 290;
    property StartDate: TDateTime readonly dispid 291;
    property EndDate: TDateTime readonly dispid 292;
    property StartNumber: Integer readonly dispid 293;
    property EndNumber: Integer readonly dispid 294;
    property ReportDate: TDateTime readonly dispid 295;
    property ModelName: WideString readonly dispid 296;
    property Manufacturer: WideString readonly dispid 297;
    property FirmwareVersion: WideString readonly dispid 298;
    property TaxName: WideString readonly dispid 299;
    property TaxDate: TDateTime readonly dispid 300;
    property CounterCount: Integer readonly dispid 301;
    property RewritesRemain: Integer readonly dispid 302;
    property DaysRemain: Integer readonly dispid 303;
    property LastFiscalReport: Integer readonly dispid 304;
    property LastDayClosing: Integer readonly dispid 305;
    property DayDate: TDateTime readonly dispid 306;
    property LastDocOper: TxMercOperType readonly dispid 307;
    property LastDocNumber: Integer readonly dispid 308;
    property LastRecNumber: Integer readonly dispid 309;
    property LastDocType: TxMercOperType readonly dispid 310;
    property LastDocSum: Currency readonly dispid 311;
    property LastDocDate: TDateTime readonly dispid 312;
    property RetryOperation: WordBool dispid 313;
    property ErrCode: Integer readonly dispid 314;
    property ErrCodeEx: Integer readonly dispid 315;
    property ErrMessage: WideString readonly dispid 316;
    function CheckEcrStatus(Flag: Integer): Integer; dispid 317;
    function CheckDevStatus(Flag: Integer): Integer; dispid 318;
    property EcrHour: Integer readonly dispid 319;
    property EcrMin: Integer readonly dispid 320;
    property ReportHour: Integer readonly dispid 321;
    property ReportMin: Integer readonly dispid 322;
    property DayHour: Integer readonly dispid 323;
    property DayMin: Integer readonly dispid 324;
    property LastDocHour: Integer readonly dispid 325;
    property LastDocMin: Integer readonly dispid 326;
    procedure AddGraphicHeader(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 327;
    procedure SetProtocol(Protocol: TxMercProtocol); dispid 328;
    procedure SetPrinterTimeout(Timeout: Integer); dispid 329;
    procedure SetDisplayTimeout(Timeout: Integer); dispid 330;
    procedure SetPrinterContrast(Contrast: Integer); dispid 331;
    procedure SetLeading(Leading: Integer); dispid 332;
    procedure SetCutterDisabled(Disabled: WordBool); dispid 333;
    procedure SetNarrowPaper(Narrow: WordBool); dispid 334;
    function QueryPrinterTimeout: Integer; dispid 335;
    function QueryDisplayTimeout: Integer; dispid 336;
    function QueryPrinterContrast: Integer; dispid 337;
    function QueryLeading: Integer; dispid 338;
    procedure EnableGraphicHeader(Width: Integer; Height: Integer; const Data: WideString); dispid 339;
    procedure DisableGraphicHeader; dispid 340;
    procedure AddLicence(LicType: TxMercLicenceType; const Licence: WideString); dispid 341;
    function XReport(Flags: Integer): Integer; dispid 342;
    function XReportByDep(DepartNum: Integer; Flags: Integer): Integer; dispid 343;
    function XReportByOper(OperNum: Integer; Flags: Integer): Integer; dispid 344;
    function QueryHeaderAlignment: WordBool; dispid 345;
    function QueryOperNumber: Integer; dispid 346;
    function QueryOperName(OperNum: Integer): WideString; dispid 347;
    procedure SetHeaderAlignment(Aligned: WordBool); dispid 348;
    procedure TestConnection; dispid 349;
    property VersionNumber: Integer readonly dispid 350;
    property BuildNumber: Integer readonly dispid 351;
    property Version: WideString dispid 352;
  end;

// *********************************************************************//
// Interface: IMercuryFPrtX2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {15273680-3D9A-4D78-9FEC-B92FFCD88441}
// *********************************************************************//
  IMercuryFPrtX2 = interface(IMercuryFPrtX)
    ['{15273680-3D9A-4D78-9FEC-B92FFCD88441}']
    function QueryAutocut: WordBool; safecall;
    procedure SetAutocut(Autocut: WordBool); safecall;
    function QueryEconomicMode: WordBool; safecall;
    procedure SetEconomicMode(EconomicMode: WordBool); safecall;
    function Get_EcrSubVersion: Integer; safecall;
    property EcrSubVersion: Integer read Get_EcrSubVersion;
  end;

// *********************************************************************//
// DispIntf:  IMercuryFPrtX2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {15273680-3D9A-4D78-9FEC-B92FFCD88441}
// *********************************************************************//
  IMercuryFPrtX2Disp = dispinterface
    ['{15273680-3D9A-4D78-9FEC-B92FFCD88441}']
    function QueryAutocut: WordBool; dispid 353;
    procedure SetAutocut(Autocut: WordBool); dispid 354;
    function QueryEconomicMode: WordBool; dispid 355;
    procedure SetEconomicMode(EconomicMode: WordBool); dispid 356;
    property EcrSubVersion: Integer readonly dispid 357;
    property BorderSize: Integer dispid 1001;
    property ShowState: WordBool dispid 1002;
    property Enabled: WordBool dispid -514;
    procedure AboutBox; dispid -552;
    procedure Open; dispid 201;
    procedure Close(ForceAbort: WordBool); dispid 202;
    procedure OpenReceipt(Oper: TxMercOperType); dispid 203;
    procedure AddReceiptItem(const Desc: WideString; Price: Currency; ItemIsTare: WordBool; 
                             Department: Integer; Code: Integer; Adjustment: Integer; 
                             Quantity: Integer; QuantityPrec: Integer; TaxIndex: Integer; 
                             const UnitName: WideString; Flags: Integer); dispid 204;
    procedure CancelReceipt; dispid 205;
    procedure CloseReceipt(const Account: WideString; PayType: TxMercPayType; PayCash: Currency; 
                           PayCashless: Currency; const PayInfo: WideString; CopiesNum: Integer; 
                           OperInfo: TxMercOperInfo); dispid 206;
    procedure OpenCustomDoc(UseForm: WordBool; Oper: TxMercOperType); dispid 207;
    procedure CancelCustomDoc; dispid 208;
    procedure CloseCustomDoc(PayType: TxMercPayType; Flags: Integer; HCopiesNum: Integer; 
                             VCopiesNum: Integer; VOrigOffset: Integer; HCopyOffset: Integer; 
                             VCopyOffset: Integer; FiscalCopy: Integer); dispid 209;
    procedure OpenFiscalDoc(Oper: TxMercOperType); dispid 210;
    procedure CancelFiscalDoc(BufferOnly: WordBool); dispid 211;
    procedure PrintFiscalDocBuffer; dispid 212;
    procedure CloseFiscalDoc; dispid 213;
    procedure CopyFiscalDoc; dispid 214;
    procedure AddSerialNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 215;
    procedure AddHeaderLine(LineNum: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 216;
    procedure AddDateTime(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 217;
    procedure AddOperInfo(OperInfo: TxMercOperInfo; Flags: Integer; HOffset: Integer; 
                          VOffset: Integer); dispid 218;
    procedure AddDocNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 219;
    procedure AddReceiptNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 220;
    procedure AddAccount(const Account: WideString; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 221;
    procedure AddTaxPayerNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 222;
    procedure AddItem(ItemType: TxMercItemType; Price: Currency; ItemIsTare: WordBool; 
                      Department: Integer; Code: Integer; Adjustment: Integer; Quantity: Integer; 
                      QuantityPrec: Integer; TaxIndex: Integer; const UnitName: WideString; 
                      Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 223;
    procedure AddDocPercentAdj(Value: Integer; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                               VOffset: Integer; RightOffset: Integer); dispid 224;
    procedure AddDocAmountAdj(Value: Currency; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                              VOffset: Integer; RightOffset: Integer); dispid 225;
    procedure AddTotal(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 226;
    procedure AddPay(PayType: TxMercPayType; PayCash: Currency; PayCashless: Currency; 
                     const PayInfo: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                     RightOffset: Integer); dispid 227;
    procedure AddChange(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 228;
    procedure AddTaxSum(TaxIndex: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                        RightOffset: Integer); dispid 229;
    procedure AddFiscalSign(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 230;
    procedure AddBarcode(Mask1: Integer; Mask2: Integer; Mask3: Integer; Mask4: Integer; 
                         Mask5: Integer; DoubleDensity: WordBool; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 231;
    procedure AddCustom(const Text: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 232;
    procedure RepeatOperation; dispid 233;
    procedure OpenDay(OperNum: Integer; const OperName: WideString; FullJournal: WordBool; 
                      AProtocol: TxMercProtocol); dispid 234;
    function ZReport(Flags: Integer): Integer; dispid 235;
    function FiscalRewrite(const InspPswd: WideString; const RegNum: WideString; 
                           const TaxPayerNum: WideString; const NewInspPswd: WideString): Integer; dispid 236;
    function FiscalReportByNum(const InspPswd: WideString; PrintFull: WordBool; AStartNum: Integer; 
                               AEndNum: Integer): Integer; dispid 237;
    function FiscalReportByDate(const InspPswd: WideString; PrintFull: WordBool; 
                                AStartDate: TDateTime; AEndDate: TDateTime): Integer; dispid 238;
    function FiscalReportAll(const InspPswd: WideString): Integer; dispid 239;
    procedure FeedAndCut(LineCount: Integer; CutAfterFeed: WordBool); dispid 240;
    procedure PrintNonFiscal(const Data: WideString; OpenDoc: WordBool; CloseDoc: WordBool); dispid 241;
    procedure ShowDisplay(const Data: WideString; OpenMode: WordBool; CloseMode: WordBool); dispid 242;
    procedure SetDisplayBaudRate(BaudRate: Integer); dispid 243;
    procedure ExternalPulse(Channel: Integer; TimeOn: Integer; TimeOff: Integer; Count: Integer); dispid 244;
    procedure QueryDevExStatus; dispid 245;
    procedure QueryFirmwareInfo; dispid 246;
    procedure SetHeader(const Line1: WideString; const Line2: WideString; const Line3: WideString; 
                        const Line4: WideString); dispid 247;
    procedure SetTax(Index: Integer; const TaxName: WideString; TaxRate: Integer); dispid 248;
    function QueryTax(Index: Integer): Integer; dispid 249;
    function QueryCounter(Index: Integer; NoRequest: WordBool): Currency; dispid 250;
    procedure SynchronizeEcrDateTime; dispid 251;
    procedure QueryResourceInfo(PrintInfo: WordBool); dispid 252;
    procedure QueryLastDocInfo; dispid 253;
    procedure SetParameters(Protocol: TxMercProtocol; PrnTimeout: Integer); dispid 254;
    property EcrModel: TxMercEcrModel readonly dispid 255;
    property EcrVersion: Integer readonly dispid 256;
    property Generation: Integer readonly dispid 257;
    property Protocol: TxMercProtocol readonly dispid 258;
    property EcrStatus: Integer readonly dispid 259;
    property EcrStatusMask: Integer readonly dispid 260;
    property DevStatus: Integer readonly dispid 261;
    property DevStatusMask: Integer readonly dispid 262;
    property DocStatus: TxMercDocStatus readonly dispid 263;
    property CurrentOper: TxMercOperType readonly dispid 264;
    property PortNum: Integer dispid 265;
    property BaudRate: Integer dispid 266;
    property Password: WideString dispid 267;
    property InternalTimeout: Integer dispid 268;
    property ExternalTimeout: Integer dispid 269;
    function QueryHeaderLine(LineNum: Integer): WideString; dispid 270;
    function QuerySerialNumber: WideString; dispid 271;
    procedure SetSerialNumber(const Value: WideString); dispid 272;
    function QueryTaxPayerNumber: WideString; dispid 273;
    function QueryRegNumber: WideString; dispid 274;
    function QueryEcrDateTime: TDateTime; dispid 275;
    function QueryDepartName(DepartNum: Integer): WideString; dispid 276;
    procedure SetDepartName(DepartNum: Integer; const Value: WideString); dispid 277;
    function QueryTitle(TitleNum: Integer): WideString; dispid 278;
    procedure SetTitle(TitleNum: Integer; const Value: WideString); dispid 279;
    property Active: WordBool dispid 280;
    property ConnState: TxMercConnState readonly dispid 281;
    property SaleSum: Currency readonly dispid 282;
    property BuyingSum: Currency readonly dispid 283;
    property SerialNumber: WideString readonly dispid 284;
    property RegNumber: WideString readonly dispid 285;
    property TaxPayerNumber: WideString readonly dispid 286;
    property HeaderLine1: WideString readonly dispid 287;
    property HeaderLine2: WideString readonly dispid 288;
    property HeaderLine3: WideString readonly dispid 289;
    property HeaderLine4: WideString readonly dispid 290;
    property StartDate: TDateTime readonly dispid 291;
    property EndDate: TDateTime readonly dispid 292;
    property StartNumber: Integer readonly dispid 293;
    property EndNumber: Integer readonly dispid 294;
    property ReportDate: TDateTime readonly dispid 295;
    property ModelName: WideString readonly dispid 296;
    property Manufacturer: WideString readonly dispid 297;
    property FirmwareVersion: WideString readonly dispid 298;
    property TaxName: WideString readonly dispid 299;
    property TaxDate: TDateTime readonly dispid 300;
    property CounterCount: Integer readonly dispid 301;
    property RewritesRemain: Integer readonly dispid 302;
    property DaysRemain: Integer readonly dispid 303;
    property LastFiscalReport: Integer readonly dispid 304;
    property LastDayClosing: Integer readonly dispid 305;
    property DayDate: TDateTime readonly dispid 306;
    property LastDocOper: TxMercOperType readonly dispid 307;
    property LastDocNumber: Integer readonly dispid 308;
    property LastRecNumber: Integer readonly dispid 309;
    property LastDocType: TxMercOperType readonly dispid 310;
    property LastDocSum: Currency readonly dispid 311;
    property LastDocDate: TDateTime readonly dispid 312;
    property RetryOperation: WordBool dispid 313;
    property ErrCode: Integer readonly dispid 314;
    property ErrCodeEx: Integer readonly dispid 315;
    property ErrMessage: WideString readonly dispid 316;
    function CheckEcrStatus(Flag: Integer): Integer; dispid 317;
    function CheckDevStatus(Flag: Integer): Integer; dispid 318;
    property EcrHour: Integer readonly dispid 319;
    property EcrMin: Integer readonly dispid 320;
    property ReportHour: Integer readonly dispid 321;
    property ReportMin: Integer readonly dispid 322;
    property DayHour: Integer readonly dispid 323;
    property DayMin: Integer readonly dispid 324;
    property LastDocHour: Integer readonly dispid 325;
    property LastDocMin: Integer readonly dispid 326;
    procedure AddGraphicHeader(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 327;
    procedure SetProtocol(Protocol: TxMercProtocol); dispid 328;
    procedure SetPrinterTimeout(Timeout: Integer); dispid 329;
    procedure SetDisplayTimeout(Timeout: Integer); dispid 330;
    procedure SetPrinterContrast(Contrast: Integer); dispid 331;
    procedure SetLeading(Leading: Integer); dispid 332;
    procedure SetCutterDisabled(Disabled: WordBool); dispid 333;
    procedure SetNarrowPaper(Narrow: WordBool); dispid 334;
    function QueryPrinterTimeout: Integer; dispid 335;
    function QueryDisplayTimeout: Integer; dispid 336;
    function QueryPrinterContrast: Integer; dispid 337;
    function QueryLeading: Integer; dispid 338;
    procedure EnableGraphicHeader(Width: Integer; Height: Integer; const Data: WideString); dispid 339;
    procedure DisableGraphicHeader; dispid 340;
    procedure AddLicence(LicType: TxMercLicenceType; const Licence: WideString); dispid 341;
    function XReport(Flags: Integer): Integer; dispid 342;
    function XReportByDep(DepartNum: Integer; Flags: Integer): Integer; dispid 343;
    function XReportByOper(OperNum: Integer; Flags: Integer): Integer; dispid 344;
    function QueryHeaderAlignment: WordBool; dispid 345;
    function QueryOperNumber: Integer; dispid 346;
    function QueryOperName(OperNum: Integer): WideString; dispid 347;
    procedure SetHeaderAlignment(Aligned: WordBool); dispid 348;
    procedure TestConnection; dispid 349;
    property VersionNumber: Integer readonly dispid 350;
    property BuildNumber: Integer readonly dispid 351;
    property Version: WideString dispid 352;
  end;

// *********************************************************************//
// Interface: IMercuryFPrtX3
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7F2562A6-46FE-41FD-A75F-85535472969F}
// *********************************************************************//
  IMercuryFPrtX3 = interface(IMercuryFPrtX2)
    ['{7F2562A6-46FE-41FD-A75F-85535472969F}']
    procedure EKLZActivate; safecall;
    procedure EKLZActivationReport; safecall;
    procedure EKLZDayReport(DayNumber: Integer); safecall;
    procedure EKLZReportByNum(IsFull: WordBool; AStartNum: Integer; AEndNum: Integer); safecall;
    procedure EKLZReportByDate(IsFull: WordBool; AStartDate: TDateTime; AEndDate: TDateTime); safecall;
    procedure EKLZDocByNum(Number: Integer); safecall;
    procedure EKLZControlByNum(DayNumber: Integer); safecall;
    procedure EKLZCloseArchive; safecall;
    procedure EKLZQueryStatus; safecall;
    function QueryPaperJournal: WordBool; safecall;
    procedure SetPaperJournal(PaperJournal: WordBool); safecall;
    function Get_EKLZSupported: WordBool; safecall;
    function Get_EKLZActivated: WordBool; safecall;
    function Get_EKLZOper: TxMercOperType; safecall;
    function Get_EKLZArchiving: WordBool; safecall;
    function Get_EKLZReporting: WordBool; safecall;
    function Get_EKLZDayOpened: WordBool; safecall;
    function Get_EKLZFatalError: WordBool; safecall;
    function Get_EKLZAttention: WordBool; safecall;
    function QueryFullJournal: WordBool; safecall;
    procedure SetFullJournal(FullJournal: WordBool); safecall;
    procedure AddEKLZData(Flags: Integer; HOffset: Integer; VOffset: Integer); safecall;
    function Get_LastBuyingSum: Currency; safecall;
    property EKLZSupported: WordBool read Get_EKLZSupported;
    property EKLZActivated: WordBool read Get_EKLZActivated;
    property EKLZOper: TxMercOperType read Get_EKLZOper;
    property EKLZArchiving: WordBool read Get_EKLZArchiving;
    property EKLZReporting: WordBool read Get_EKLZReporting;
    property EKLZDayOpened: WordBool read Get_EKLZDayOpened;
    property EKLZFatalError: WordBool read Get_EKLZFatalError;
    property EKLZAttention: WordBool read Get_EKLZAttention;
    property LastBuyingSum: Currency read Get_LastBuyingSum;
  end;

// *********************************************************************//
// DispIntf:  IMercuryFPrtX3Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7F2562A6-46FE-41FD-A75F-85535472969F}
// *********************************************************************//
  IMercuryFPrtX3Disp = dispinterface
    ['{7F2562A6-46FE-41FD-A75F-85535472969F}']
    procedure EKLZActivate; dispid 401;
    procedure EKLZActivationReport; dispid 402;
    procedure EKLZDayReport(DayNumber: Integer); dispid 403;
    procedure EKLZReportByNum(IsFull: WordBool; AStartNum: Integer; AEndNum: Integer); dispid 404;
    procedure EKLZReportByDate(IsFull: WordBool; AStartDate: TDateTime; AEndDate: TDateTime); dispid 405;
    procedure EKLZDocByNum(Number: Integer); dispid 406;
    procedure EKLZControlByNum(DayNumber: Integer); dispid 407;
    procedure EKLZCloseArchive; dispid 408;
    procedure EKLZQueryStatus; dispid 409;
    function QueryPaperJournal: WordBool; dispid 410;
    procedure SetPaperJournal(PaperJournal: WordBool); dispid 411;
    property EKLZSupported: WordBool readonly dispid 412;
    property EKLZActivated: WordBool readonly dispid 413;
    property EKLZOper: TxMercOperType readonly dispid 414;
    property EKLZArchiving: WordBool readonly dispid 415;
    property EKLZReporting: WordBool readonly dispid 416;
    property EKLZDayOpened: WordBool readonly dispid 417;
    property EKLZFatalError: WordBool readonly dispid 418;
    property EKLZAttention: WordBool readonly dispid 419;
    function QueryFullJournal: WordBool; dispid 501;
    procedure SetFullJournal(FullJournal: WordBool); dispid 502;
    procedure AddEKLZData(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 503;
    property LastBuyingSum: Currency readonly dispid 504;
    function QueryAutocut: WordBool; dispid 353;
    procedure SetAutocut(Autocut: WordBool); dispid 354;
    function QueryEconomicMode: WordBool; dispid 355;
    procedure SetEconomicMode(EconomicMode: WordBool); dispid 356;
    property EcrSubVersion: Integer readonly dispid 357;
    property BorderSize: Integer dispid 1001;
    property ShowState: WordBool dispid 1002;
    property Enabled: WordBool dispid -514;
    procedure AboutBox; dispid -552;
    procedure Open; dispid 201;
    procedure Close(ForceAbort: WordBool); dispid 202;
    procedure OpenReceipt(Oper: TxMercOperType); dispid 203;
    procedure AddReceiptItem(const Desc: WideString; Price: Currency; ItemIsTare: WordBool; 
                             Department: Integer; Code: Integer; Adjustment: Integer; 
                             Quantity: Integer; QuantityPrec: Integer; TaxIndex: Integer; 
                             const UnitName: WideString; Flags: Integer); dispid 204;
    procedure CancelReceipt; dispid 205;
    procedure CloseReceipt(const Account: WideString; PayType: TxMercPayType; PayCash: Currency; 
                           PayCashless: Currency; const PayInfo: WideString; CopiesNum: Integer; 
                           OperInfo: TxMercOperInfo); dispid 206;
    procedure OpenCustomDoc(UseForm: WordBool; Oper: TxMercOperType); dispid 207;
    procedure CancelCustomDoc; dispid 208;
    procedure CloseCustomDoc(PayType: TxMercPayType; Flags: Integer; HCopiesNum: Integer; 
                             VCopiesNum: Integer; VOrigOffset: Integer; HCopyOffset: Integer; 
                             VCopyOffset: Integer; FiscalCopy: Integer); dispid 209;
    procedure OpenFiscalDoc(Oper: TxMercOperType); dispid 210;
    procedure CancelFiscalDoc(BufferOnly: WordBool); dispid 211;
    procedure PrintFiscalDocBuffer; dispid 212;
    procedure CloseFiscalDoc; dispid 213;
    procedure CopyFiscalDoc; dispid 214;
    procedure AddSerialNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 215;
    procedure AddHeaderLine(LineNum: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 216;
    procedure AddDateTime(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 217;
    procedure AddOperInfo(OperInfo: TxMercOperInfo; Flags: Integer; HOffset: Integer; 
                          VOffset: Integer); dispid 218;
    procedure AddDocNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 219;
    procedure AddReceiptNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 220;
    procedure AddAccount(const Account: WideString; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 221;
    procedure AddTaxPayerNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 222;
    procedure AddItem(ItemType: TxMercItemType; Price: Currency; ItemIsTare: WordBool; 
                      Department: Integer; Code: Integer; Adjustment: Integer; Quantity: Integer; 
                      QuantityPrec: Integer; TaxIndex: Integer; const UnitName: WideString; 
                      Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 223;
    procedure AddDocPercentAdj(Value: Integer; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                               VOffset: Integer; RightOffset: Integer); dispid 224;
    procedure AddDocAmountAdj(Value: Currency; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                              VOffset: Integer; RightOffset: Integer); dispid 225;
    procedure AddTotal(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 226;
    procedure AddPay(PayType: TxMercPayType; PayCash: Currency; PayCashless: Currency; 
                     const PayInfo: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                     RightOffset: Integer); dispid 227;
    procedure AddChange(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 228;
    procedure AddTaxSum(TaxIndex: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                        RightOffset: Integer); dispid 229;
    procedure AddFiscalSign(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 230;
    procedure AddBarcode(Mask1: Integer; Mask2: Integer; Mask3: Integer; Mask4: Integer; 
                         Mask5: Integer; DoubleDensity: WordBool; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 231;
    procedure AddCustom(const Text: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 232;
    procedure RepeatOperation; dispid 233;
    procedure OpenDay(OperNum: Integer; const OperName: WideString; FullJournal: WordBool; 
                      AProtocol: TxMercProtocol); dispid 234;
    function ZReport(Flags: Integer): Integer; dispid 235;
    function FiscalRewrite(const InspPswd: WideString; const RegNum: WideString; 
                           const TaxPayerNum: WideString; const NewInspPswd: WideString): Integer; dispid 236;
    function FiscalReportByNum(const InspPswd: WideString; PrintFull: WordBool; AStartNum: Integer; 
                               AEndNum: Integer): Integer; dispid 237;
    function FiscalReportByDate(const InspPswd: WideString; PrintFull: WordBool; 
                                AStartDate: TDateTime; AEndDate: TDateTime): Integer; dispid 238;
    function FiscalReportAll(const InspPswd: WideString): Integer; dispid 239;
    procedure FeedAndCut(LineCount: Integer; CutAfterFeed: WordBool); dispid 240;
    procedure PrintNonFiscal(const Data: WideString; OpenDoc: WordBool; CloseDoc: WordBool); dispid 241;
    procedure ShowDisplay(const Data: WideString; OpenMode: WordBool; CloseMode: WordBool); dispid 242;
    procedure SetDisplayBaudRate(BaudRate: Integer); dispid 243;
    procedure ExternalPulse(Channel: Integer; TimeOn: Integer; TimeOff: Integer; Count: Integer); dispid 244;
    procedure QueryDevExStatus; dispid 245;
    procedure QueryFirmwareInfo; dispid 246;
    procedure SetHeader(const Line1: WideString; const Line2: WideString; const Line3: WideString; 
                        const Line4: WideString); dispid 247;
    procedure SetTax(Index: Integer; const TaxName: WideString; TaxRate: Integer); dispid 248;
    function QueryTax(Index: Integer): Integer; dispid 249;
    function QueryCounter(Index: Integer; NoRequest: WordBool): Currency; dispid 250;
    procedure SynchronizeEcrDateTime; dispid 251;
    procedure QueryResourceInfo(PrintInfo: WordBool); dispid 252;
    procedure QueryLastDocInfo; dispid 253;
    procedure SetParameters(Protocol: TxMercProtocol; PrnTimeout: Integer); dispid 254;
    property EcrModel: TxMercEcrModel readonly dispid 255;
    property EcrVersion: Integer readonly dispid 256;
    property Generation: Integer readonly dispid 257;
    property Protocol: TxMercProtocol readonly dispid 258;
    property EcrStatus: Integer readonly dispid 259;
    property EcrStatusMask: Integer readonly dispid 260;
    property DevStatus: Integer readonly dispid 261;
    property DevStatusMask: Integer readonly dispid 262;
    property DocStatus: TxMercDocStatus readonly dispid 263;
    property CurrentOper: TxMercOperType readonly dispid 264;
    property PortNum: Integer dispid 265;
    property BaudRate: Integer dispid 266;
    property Password: WideString dispid 267;
    property InternalTimeout: Integer dispid 268;
    property ExternalTimeout: Integer dispid 269;
    function QueryHeaderLine(LineNum: Integer): WideString; dispid 270;
    function QuerySerialNumber: WideString; dispid 271;
    procedure SetSerialNumber(const Value: WideString); dispid 272;
    function QueryTaxPayerNumber: WideString; dispid 273;
    function QueryRegNumber: WideString; dispid 274;
    function QueryEcrDateTime: TDateTime; dispid 275;
    function QueryDepartName(DepartNum: Integer): WideString; dispid 276;
    procedure SetDepartName(DepartNum: Integer; const Value: WideString); dispid 277;
    function QueryTitle(TitleNum: Integer): WideString; dispid 278;
    procedure SetTitle(TitleNum: Integer; const Value: WideString); dispid 279;
    property Active: WordBool dispid 280;
    property ConnState: TxMercConnState readonly dispid 281;
    property SaleSum: Currency readonly dispid 282;
    property BuyingSum: Currency readonly dispid 283;
    property SerialNumber: WideString readonly dispid 284;
    property RegNumber: WideString readonly dispid 285;
    property TaxPayerNumber: WideString readonly dispid 286;
    property HeaderLine1: WideString readonly dispid 287;
    property HeaderLine2: WideString readonly dispid 288;
    property HeaderLine3: WideString readonly dispid 289;
    property HeaderLine4: WideString readonly dispid 290;
    property StartDate: TDateTime readonly dispid 291;
    property EndDate: TDateTime readonly dispid 292;
    property StartNumber: Integer readonly dispid 293;
    property EndNumber: Integer readonly dispid 294;
    property ReportDate: TDateTime readonly dispid 295;
    property ModelName: WideString readonly dispid 296;
    property Manufacturer: WideString readonly dispid 297;
    property FirmwareVersion: WideString readonly dispid 298;
    property TaxName: WideString readonly dispid 299;
    property TaxDate: TDateTime readonly dispid 300;
    property CounterCount: Integer readonly dispid 301;
    property RewritesRemain: Integer readonly dispid 302;
    property DaysRemain: Integer readonly dispid 303;
    property LastFiscalReport: Integer readonly dispid 304;
    property LastDayClosing: Integer readonly dispid 305;
    property DayDate: TDateTime readonly dispid 306;
    property LastDocOper: TxMercOperType readonly dispid 307;
    property LastDocNumber: Integer readonly dispid 308;
    property LastRecNumber: Integer readonly dispid 309;
    property LastDocType: TxMercOperType readonly dispid 310;
    property LastDocSum: Currency readonly dispid 311;
    property LastDocDate: TDateTime readonly dispid 312;
    property RetryOperation: WordBool dispid 313;
    property ErrCode: Integer readonly dispid 314;
    property ErrCodeEx: Integer readonly dispid 315;
    property ErrMessage: WideString readonly dispid 316;
    function CheckEcrStatus(Flag: Integer): Integer; dispid 317;
    function CheckDevStatus(Flag: Integer): Integer; dispid 318;
    property EcrHour: Integer readonly dispid 319;
    property EcrMin: Integer readonly dispid 320;
    property ReportHour: Integer readonly dispid 321;
    property ReportMin: Integer readonly dispid 322;
    property DayHour: Integer readonly dispid 323;
    property DayMin: Integer readonly dispid 324;
    property LastDocHour: Integer readonly dispid 325;
    property LastDocMin: Integer readonly dispid 326;
    procedure AddGraphicHeader(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 327;
    procedure SetProtocol(Protocol: TxMercProtocol); dispid 328;
    procedure SetPrinterTimeout(Timeout: Integer); dispid 329;
    procedure SetDisplayTimeout(Timeout: Integer); dispid 330;
    procedure SetPrinterContrast(Contrast: Integer); dispid 331;
    procedure SetLeading(Leading: Integer); dispid 332;
    procedure SetCutterDisabled(Disabled: WordBool); dispid 333;
    procedure SetNarrowPaper(Narrow: WordBool); dispid 334;
    function QueryPrinterTimeout: Integer; dispid 335;
    function QueryDisplayTimeout: Integer; dispid 336;
    function QueryPrinterContrast: Integer; dispid 337;
    function QueryLeading: Integer; dispid 338;
    procedure EnableGraphicHeader(Width: Integer; Height: Integer; const Data: WideString); dispid 339;
    procedure DisableGraphicHeader; dispid 340;
    procedure AddLicence(LicType: TxMercLicenceType; const Licence: WideString); dispid 341;
    function XReport(Flags: Integer): Integer; dispid 342;
    function XReportByDep(DepartNum: Integer; Flags: Integer): Integer; dispid 343;
    function XReportByOper(OperNum: Integer; Flags: Integer): Integer; dispid 344;
    function QueryHeaderAlignment: WordBool; dispid 345;
    function QueryOperNumber: Integer; dispid 346;
    function QueryOperName(OperNum: Integer): WideString; dispid 347;
    procedure SetHeaderAlignment(Aligned: WordBool); dispid 348;
    procedure TestConnection; dispid 349;
    property VersionNumber: Integer readonly dispid 350;
    property BuildNumber: Integer readonly dispid 351;
    property Version: WideString dispid 352;
  end;

// *********************************************************************//
// Interface: IMercuryFPrt4
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {01D442F5-56A5-4F04-8C61-FB651172C6F0}
// *********************************************************************//
  IMercuryFPrt4 = interface(IMercuryFPrt3)
    ['{01D442F5-56A5-4F04-8C61-FB651172C6F0}']
    procedure AddRegNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); safecall;
  end;

// *********************************************************************//
// DispIntf:  IMercuryFPrt4Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {01D442F5-56A5-4F04-8C61-FB651172C6F0}
// *********************************************************************//
  IMercuryFPrt4Disp = dispinterface
    ['{01D442F5-56A5-4F04-8C61-FB651172C6F0}']
    procedure AddRegNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 501;
    procedure EKLZActivate; dispid 401;
    procedure EKLZActivationReport; dispid 402;
    procedure EKLZDayReport(DayNumber: Integer); dispid 403;
    procedure EKLZReportByNum(IsFull: WordBool; AStartNum: Integer; AEndNum: Integer); dispid 404;
    procedure EKLZReportByDate(IsFull: WordBool; AStartDate: TDateTime; AEndDate: TDateTime); dispid 405;
    procedure EKLZDocByNum(Number: Integer); dispid 406;
    procedure EKLZControlByNum(DayNumber: Integer); dispid 407;
    procedure EKLZCloseArchive; dispid 408;
    procedure EKLZQueryStatus; dispid 409;
    function QueryPaperJournal: WordBool; dispid 410;
    procedure SetPaperJournal(PaperJournal: WordBool); dispid 411;
    property EKLZSupported: WordBool readonly dispid 412;
    property EKLZActivated: WordBool readonly dispid 413;
    property EKLZOper: TxMercOperType readonly dispid 414;
    property EKLZArchiving: WordBool readonly dispid 415;
    property EKLZReporting: WordBool readonly dispid 416;
    property EKLZDayOpened: WordBool readonly dispid 417;
    property EKLZFatalError: WordBool readonly dispid 418;
    property EKLZAttention: WordBool readonly dispid 419;
    property LastRepNumber: Integer readonly dispid 420;
    property EKLZRest: Integer readonly dispid 421;
    function QueryFullJournal: WordBool; dispid 422;
    procedure SetFullJournal(FullJournal: WordBool); dispid 423;
    procedure AddEKLZData(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 424;
    property LastBuyingSum: Currency readonly dispid 425;
    function QueryAutocut: WordBool; dispid 353;
    procedure SetAutocut(Autocut: WordBool); dispid 354;
    function QueryEconomicMode: WordBool; dispid 355;
    procedure SetEconomicMode(EconomicMode: WordBool); dispid 356;
    property EcrSubVersion: Integer readonly dispid 357;
    procedure Open; dispid 201;
    procedure Close(ForceAbort: WordBool); dispid 202;
    procedure OpenReceipt(Oper: TxMercOperType); dispid 203;
    procedure AddReceiptItem(const Desc: WideString; Price: Currency; ItemIsTare: WordBool; 
                             Department: Integer; Code: Integer; Adjustment: Integer; 
                             Quantity: Integer; QuantityPrec: Integer; TaxIndex: Integer; 
                             const UnitName: WideString; Flags: Integer); dispid 204;
    procedure CancelReceipt; dispid 205;
    procedure CloseReceipt(const Account: WideString; PayType: TxMercPayType; PayCash: Currency; 
                           PayCashless: Currency; const PayInfo: WideString; CopiesNum: Integer; 
                           OperInfo: TxMercOperInfo); dispid 206;
    procedure OpenCustomDoc(UseForm: WordBool; Oper: TxMercOperType); dispid 207;
    procedure CancelCustomDoc; dispid 208;
    procedure CloseCustomDoc(PayType: TxMercPayType; Flags: Integer; HCopiesNum: Integer; 
                             VCopiesNum: Integer; VOrigOffset: Integer; HCopyOffset: Integer; 
                             VCopyOffset: Integer; FiscalCopy: Integer); dispid 209;
    procedure OpenFiscalDoc(Oper: TxMercOperType); dispid 210;
    procedure CancelFiscalDoc(BufferOnly: WordBool); dispid 211;
    procedure PrintFiscalDocBuffer; dispid 212;
    procedure CloseFiscalDoc; dispid 213;
    procedure CopyFiscalDoc; dispid 214;
    procedure AddSerialNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 215;
    procedure AddHeaderLine(LineNum: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 216;
    procedure AddDateTime(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 217;
    procedure AddOperInfo(OperInfo: TxMercOperInfo; Flags: Integer; HOffset: Integer; 
                          VOffset: Integer); dispid 218;
    procedure AddDocNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 219;
    procedure AddReceiptNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 220;
    procedure AddAccount(const Account: WideString; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 221;
    procedure AddTaxPayerNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 222;
    procedure AddItem(ItemType: TxMercItemType; Price: Currency; ItemIsTare: WordBool; 
                      Department: Integer; Code: Integer; Adjustment: Integer; Quantity: Integer; 
                      QuantityPrec: Integer; TaxIndex: Integer; const UnitName: WideString; 
                      Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 223;
    procedure AddDocPercentAdj(Value: Integer; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                               VOffset: Integer; RightOffset: Integer); dispid 224;
    procedure AddDocAmountAdj(Value: Currency; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                              VOffset: Integer; RightOffset: Integer); dispid 225;
    procedure AddTotal(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 226;
    procedure AddPay(PayType: TxMercPayType; PayCash: Currency; PayCashless: Currency; 
                     const PayInfo: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                     RightOffset: Integer); dispid 227;
    procedure AddChange(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 228;
    procedure AddTaxSum(TaxIndex: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                        RightOffset: Integer); dispid 229;
    procedure AddFiscalSign(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 230;
    procedure AddBarcode(Mask1: Integer; Mask2: Integer; Mask3: Integer; Mask4: Integer; 
                         Mask5: Integer; DoubleDensity: WordBool; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 231;
    procedure AddCustom(const Text: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 232;
    procedure RepeatOperation; dispid 233;
    procedure OpenDay(OperNum: Integer; const OperName: WideString; FullJournal: WordBool; 
                      AProtocol: TxMercProtocol); dispid 234;
    function ZReport(Flags: Integer): Integer; dispid 235;
    function FiscalRewrite(const InspPswd: WideString; const RegNum: WideString; 
                           const TaxPayerNum: WideString; const NewInspPswd: WideString): Integer; dispid 236;
    function FiscalReportByNum(const InspPswd: WideString; PrintFull: WordBool; AStartNum: Integer; 
                               AEndNum: Integer): Integer; dispid 237;
    function FiscalReportByDate(const InspPswd: WideString; PrintFull: WordBool; 
                                AStartDate: TDateTime; AEndDate: TDateTime): Integer; dispid 238;
    function FiscalReportAll(const InspPswd: WideString): Integer; dispid 239;
    procedure FeedAndCut(LineCount: Integer; CutAfterFeed: WordBool); dispid 240;
    procedure PrintNonFiscal(const Data: WideString; OpenDoc: WordBool; CloseDoc: WordBool); dispid 241;
    procedure ShowDisplay(const Data: WideString; OpenMode: WordBool; CloseMode: WordBool); dispid 242;
    procedure SetDisplayBaudRate(BaudRate: Integer); dispid 243;
    procedure ExternalPulse(Channel: Integer; TimeOn: Integer; TimeOff: Integer; Count: Integer); dispid 244;
    procedure QueryDevExStatus; dispid 245;
    procedure QueryFirmwareInfo; dispid 246;
    procedure SetHeader(const Line1: WideString; const Line2: WideString; const Line3: WideString; 
                        const Line4: WideString); dispid 247;
    procedure SetTax(Index: Integer; const TaxName: WideString; TaxRate: Integer); dispid 248;
    function QueryTax(Index: Integer): Integer; dispid 249;
    function QueryCounter(Index: Integer; NoRequest: WordBool): Currency; dispid 250;
    procedure SynchronizeEcrDateTime; dispid 251;
    procedure QueryResourceInfo(PrintInfo: WordBool); dispid 252;
    procedure QueryLastDocInfo; dispid 253;
    procedure SetParameters(Protocol: TxMercProtocol; PrnTimeout: Integer); dispid 254;
    property EcrModel: TxMercEcrModel readonly dispid 255;
    property EcrVersion: Integer readonly dispid 256;
    property Generation: Integer readonly dispid 257;
    property Protocol: TxMercProtocol readonly dispid 258;
    property EcrStatus: Integer readonly dispid 259;
    property EcrStatusMask: Integer readonly dispid 260;
    property DevStatus: Integer readonly dispid 261;
    property DevStatusMask: Integer readonly dispid 262;
    property DocStatus: TxMercDocStatus readonly dispid 263;
    property CurrentOper: TxMercOperType readonly dispid 264;
    property PortNum: Integer dispid 265;
    property BaudRate: Integer dispid 266;
    property Password: WideString dispid 267;
    property InternalTimeout: Integer dispid 268;
    property ExternalTimeout: Integer dispid 269;
    function QueryHeaderLine(LineNum: Integer): WideString; dispid 270;
    function QuerySerialNumber: WideString; dispid 271;
    procedure SetSerialNumber(const Value: WideString); dispid 272;
    function QueryTaxPayerNumber: WideString; dispid 273;
    function QueryRegNumber: WideString; dispid 274;
    function QueryEcrDateTime: TDateTime; dispid 275;
    function QueryDepartName(DepartNum: Integer): WideString; dispid 276;
    procedure SetDepartName(DepartNum: Integer; const Value: WideString); dispid 277;
    function QueryTitle(TitleNum: Integer): WideString; dispid 278;
    procedure SetTitle(TitleNum: Integer; const Value: WideString); dispid 279;
    property Active: WordBool dispid 280;
    property ConnState: TxMercConnState readonly dispid 281;
    property SaleSum: Currency readonly dispid 282;
    property BuyingSum: Currency readonly dispid 283;
    property SerialNumber: WideString readonly dispid 284;
    property RegNumber: WideString readonly dispid 285;
    property TaxPayerNumber: WideString readonly dispid 286;
    property HeaderLine1: WideString readonly dispid 287;
    property HeaderLine2: WideString readonly dispid 288;
    property HeaderLine3: WideString readonly dispid 289;
    property HeaderLine4: WideString readonly dispid 290;
    property StartDate: TDateTime readonly dispid 291;
    property EndDate: TDateTime readonly dispid 292;
    property StartNumber: Integer readonly dispid 293;
    property EndNumber: Integer readonly dispid 294;
    property ReportDate: TDateTime readonly dispid 295;
    property ModelName: WideString readonly dispid 296;
    property Manufacturer: WideString readonly dispid 297;
    property FirmwareVersion: WideString readonly dispid 298;
    property TaxName: WideString readonly dispid 299;
    property TaxDate: TDateTime readonly dispid 300;
    property CounterCount: Integer readonly dispid 301;
    property RewritesRemain: Integer readonly dispid 302;
    property DaysRemain: Integer readonly dispid 303;
    property LastFiscalReport: Integer readonly dispid 304;
    property LastDayClosing: Integer readonly dispid 305;
    property DayDate: TDateTime readonly dispid 306;
    property LastDocOper: TxMercOperType readonly dispid 307;
    property LastDocNumber: Integer readonly dispid 308;
    property LastRecNumber: Integer readonly dispid 309;
    property LastDocType: TxMercOperType readonly dispid 310;
    property LastDocSum: Currency readonly dispid 311;
    property LastDocDate: TDateTime readonly dispid 312;
    property RetryOperation: WordBool dispid 313;
    property ErrCode: Integer readonly dispid 314;
    property ErrCodeEx: Integer readonly dispid 315;
    property ErrMessage: WideString readonly dispid 316;
    function CheckEcrStatus(Flag: Integer): Integer; dispid 317;
    function CheckDevStatus(Flag: Integer): Integer; dispid 318;
    property EcrHour: Integer readonly dispid 319;
    property EcrMin: Integer readonly dispid 320;
    property ReportHour: Integer readonly dispid 321;
    property ReportMin: Integer readonly dispid 322;
    property DayHour: Integer readonly dispid 323;
    property DayMin: Integer readonly dispid 324;
    property LastDocHour: Integer readonly dispid 325;
    property LastDocMin: Integer readonly dispid 326;
    procedure AddGraphicHeader(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 327;
    procedure SetProtocol(Protocol: TxMercProtocol); dispid 328;
    procedure SetPrinterTimeout(Timeout: Integer); dispid 329;
    procedure SetDisplayTimeout(Timeout: Integer); dispid 330;
    procedure SetPrinterContrast(Contrast: Integer); dispid 331;
    procedure SetLeading(Leading: Integer); dispid 332;
    procedure SetCutterDisabled(Disabled: WordBool); dispid 333;
    procedure SetNarrowPaper(Narrow: WordBool); dispid 334;
    function QueryPrinterTimeout: Integer; dispid 335;
    function QueryDisplayTimeout: Integer; dispid 336;
    function QueryPrinterContrast: Integer; dispid 337;
    function QueryLeading: Integer; dispid 338;
    procedure EnableGraphicHeader(Width: Integer; Height: Integer; const Data: WideString); dispid 339;
    procedure DisableGraphicHeader; dispid 340;
    procedure AddLicence(LicType: TxMercLicenceType; const Licence: WideString); dispid 341;
    function XReport(Flags: Integer): Integer; dispid 342;
    function XReportByDep(DepartNum: Integer; Flags: Integer): Integer; dispid 343;
    function XReportByOper(OperNum: Integer; Flags: Integer): Integer; dispid 344;
    function QueryHeaderAlignment: WordBool; dispid 345;
    function QueryOperNumber: Integer; dispid 346;
    function QueryOperName(OperNum: Integer): WideString; dispid 347;
    procedure SetHeaderAlignment(Aligned: WordBool); dispid 348;
    procedure TestConnection; dispid 349;
    property VersionNumber: Integer readonly dispid 350;
    property BuildNumber: Integer readonly dispid 351;
    property Version: WideString dispid 352;
  end;

// *********************************************************************//
// Interface: IMercuryFPrtX4
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {38FC4258-EFAC-49CE-8215-B3ED204C5E7A}
// *********************************************************************//
  IMercuryFPrtX4 = interface(IMercuryFPrtX3)
    ['{38FC4258-EFAC-49CE-8215-B3ED204C5E7A}']
    procedure AddRegNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); safecall;
  end;

// *********************************************************************//
// DispIntf:  IMercuryFPrtX4Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {38FC4258-EFAC-49CE-8215-B3ED204C5E7A}
// *********************************************************************//
  IMercuryFPrtX4Disp = dispinterface
    ['{38FC4258-EFAC-49CE-8215-B3ED204C5E7A}']
    procedure AddRegNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 601;
    procedure EKLZActivate; dispid 401;
    procedure EKLZActivationReport; dispid 402;
    procedure EKLZDayReport(DayNumber: Integer); dispid 403;
    procedure EKLZReportByNum(IsFull: WordBool; AStartNum: Integer; AEndNum: Integer); dispid 404;
    procedure EKLZReportByDate(IsFull: WordBool; AStartDate: TDateTime; AEndDate: TDateTime); dispid 405;
    procedure EKLZDocByNum(Number: Integer); dispid 406;
    procedure EKLZControlByNum(DayNumber: Integer); dispid 407;
    procedure EKLZCloseArchive; dispid 408;
    procedure EKLZQueryStatus; dispid 409;
    function QueryPaperJournal: WordBool; dispid 410;
    procedure SetPaperJournal(PaperJournal: WordBool); dispid 411;
    property EKLZSupported: WordBool readonly dispid 412;
    property EKLZActivated: WordBool readonly dispid 413;
    property EKLZOper: TxMercOperType readonly dispid 414;
    property EKLZArchiving: WordBool readonly dispid 415;
    property EKLZReporting: WordBool readonly dispid 416;
    property EKLZDayOpened: WordBool readonly dispid 417;
    property EKLZFatalError: WordBool readonly dispid 418;
    property EKLZAttention: WordBool readonly dispid 419;
    function QueryFullJournal: WordBool; dispid 501;
    procedure SetFullJournal(FullJournal: WordBool); dispid 502;
    procedure AddEKLZData(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 503;
    property LastBuyingSum: Currency readonly dispid 504;
    function QueryAutocut: WordBool; dispid 353;
    procedure SetAutocut(Autocut: WordBool); dispid 354;
    function QueryEconomicMode: WordBool; dispid 355;
    procedure SetEconomicMode(EconomicMode: WordBool); dispid 356;
    property EcrSubVersion: Integer readonly dispid 357;
    property BorderSize: Integer dispid 1001;
    property ShowState: WordBool dispid 1002;
    property Enabled: WordBool dispid -514;
    procedure AboutBox; dispid -552;
    procedure Open; dispid 201;
    procedure Close(ForceAbort: WordBool); dispid 202;
    procedure OpenReceipt(Oper: TxMercOperType); dispid 203;
    procedure AddReceiptItem(const Desc: WideString; Price: Currency; ItemIsTare: WordBool; 
                             Department: Integer; Code: Integer; Adjustment: Integer; 
                             Quantity: Integer; QuantityPrec: Integer; TaxIndex: Integer; 
                             const UnitName: WideString; Flags: Integer); dispid 204;
    procedure CancelReceipt; dispid 205;
    procedure CloseReceipt(const Account: WideString; PayType: TxMercPayType; PayCash: Currency; 
                           PayCashless: Currency; const PayInfo: WideString; CopiesNum: Integer; 
                           OperInfo: TxMercOperInfo); dispid 206;
    procedure OpenCustomDoc(UseForm: WordBool; Oper: TxMercOperType); dispid 207;
    procedure CancelCustomDoc; dispid 208;
    procedure CloseCustomDoc(PayType: TxMercPayType; Flags: Integer; HCopiesNum: Integer; 
                             VCopiesNum: Integer; VOrigOffset: Integer; HCopyOffset: Integer; 
                             VCopyOffset: Integer; FiscalCopy: Integer); dispid 209;
    procedure OpenFiscalDoc(Oper: TxMercOperType); dispid 210;
    procedure CancelFiscalDoc(BufferOnly: WordBool); dispid 211;
    procedure PrintFiscalDocBuffer; dispid 212;
    procedure CloseFiscalDoc; dispid 213;
    procedure CopyFiscalDoc; dispid 214;
    procedure AddSerialNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 215;
    procedure AddHeaderLine(LineNum: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 216;
    procedure AddDateTime(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 217;
    procedure AddOperInfo(OperInfo: TxMercOperInfo; Flags: Integer; HOffset: Integer; 
                          VOffset: Integer); dispid 218;
    procedure AddDocNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 219;
    procedure AddReceiptNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 220;
    procedure AddAccount(const Account: WideString; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 221;
    procedure AddTaxPayerNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 222;
    procedure AddItem(ItemType: TxMercItemType; Price: Currency; ItemIsTare: WordBool; 
                      Department: Integer; Code: Integer; Adjustment: Integer; Quantity: Integer; 
                      QuantityPrec: Integer; TaxIndex: Integer; const UnitName: WideString; 
                      Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 223;
    procedure AddDocPercentAdj(Value: Integer; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                               VOffset: Integer; RightOffset: Integer); dispid 224;
    procedure AddDocAmountAdj(Value: Currency; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                              VOffset: Integer; RightOffset: Integer); dispid 225;
    procedure AddTotal(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 226;
    procedure AddPay(PayType: TxMercPayType; PayCash: Currency; PayCashless: Currency; 
                     const PayInfo: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                     RightOffset: Integer); dispid 227;
    procedure AddChange(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 228;
    procedure AddTaxSum(TaxIndex: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                        RightOffset: Integer); dispid 229;
    procedure AddFiscalSign(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 230;
    procedure AddBarcode(Mask1: Integer; Mask2: Integer; Mask3: Integer; Mask4: Integer; 
                         Mask5: Integer; DoubleDensity: WordBool; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 231;
    procedure AddCustom(const Text: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 232;
    procedure RepeatOperation; dispid 233;
    procedure OpenDay(OperNum: Integer; const OperName: WideString; FullJournal: WordBool; 
                      AProtocol: TxMercProtocol); dispid 234;
    function ZReport(Flags: Integer): Integer; dispid 235;
    function FiscalRewrite(const InspPswd: WideString; const RegNum: WideString; 
                           const TaxPayerNum: WideString; const NewInspPswd: WideString): Integer; dispid 236;
    function FiscalReportByNum(const InspPswd: WideString; PrintFull: WordBool; AStartNum: Integer; 
                               AEndNum: Integer): Integer; dispid 237;
    function FiscalReportByDate(const InspPswd: WideString; PrintFull: WordBool; 
                                AStartDate: TDateTime; AEndDate: TDateTime): Integer; dispid 238;
    function FiscalReportAll(const InspPswd: WideString): Integer; dispid 239;
    procedure FeedAndCut(LineCount: Integer; CutAfterFeed: WordBool); dispid 240;
    procedure PrintNonFiscal(const Data: WideString; OpenDoc: WordBool; CloseDoc: WordBool); dispid 241;
    procedure ShowDisplay(const Data: WideString; OpenMode: WordBool; CloseMode: WordBool); dispid 242;
    procedure SetDisplayBaudRate(BaudRate: Integer); dispid 243;
    procedure ExternalPulse(Channel: Integer; TimeOn: Integer; TimeOff: Integer; Count: Integer); dispid 244;
    procedure QueryDevExStatus; dispid 245;
    procedure QueryFirmwareInfo; dispid 246;
    procedure SetHeader(const Line1: WideString; const Line2: WideString; const Line3: WideString; 
                        const Line4: WideString); dispid 247;
    procedure SetTax(Index: Integer; const TaxName: WideString; TaxRate: Integer); dispid 248;
    function QueryTax(Index: Integer): Integer; dispid 249;
    function QueryCounter(Index: Integer; NoRequest: WordBool): Currency; dispid 250;
    procedure SynchronizeEcrDateTime; dispid 251;
    procedure QueryResourceInfo(PrintInfo: WordBool); dispid 252;
    procedure QueryLastDocInfo; dispid 253;
    procedure SetParameters(Protocol: TxMercProtocol; PrnTimeout: Integer); dispid 254;
    property EcrModel: TxMercEcrModel readonly dispid 255;
    property EcrVersion: Integer readonly dispid 256;
    property Generation: Integer readonly dispid 257;
    property Protocol: TxMercProtocol readonly dispid 258;
    property EcrStatus: Integer readonly dispid 259;
    property EcrStatusMask: Integer readonly dispid 260;
    property DevStatus: Integer readonly dispid 261;
    property DevStatusMask: Integer readonly dispid 262;
    property DocStatus: TxMercDocStatus readonly dispid 263;
    property CurrentOper: TxMercOperType readonly dispid 264;
    property PortNum: Integer dispid 265;
    property BaudRate: Integer dispid 266;
    property Password: WideString dispid 267;
    property InternalTimeout: Integer dispid 268;
    property ExternalTimeout: Integer dispid 269;
    function QueryHeaderLine(LineNum: Integer): WideString; dispid 270;
    function QuerySerialNumber: WideString; dispid 271;
    procedure SetSerialNumber(const Value: WideString); dispid 272;
    function QueryTaxPayerNumber: WideString; dispid 273;
    function QueryRegNumber: WideString; dispid 274;
    function QueryEcrDateTime: TDateTime; dispid 275;
    function QueryDepartName(DepartNum: Integer): WideString; dispid 276;
    procedure SetDepartName(DepartNum: Integer; const Value: WideString); dispid 277;
    function QueryTitle(TitleNum: Integer): WideString; dispid 278;
    procedure SetTitle(TitleNum: Integer; const Value: WideString); dispid 279;
    property Active: WordBool dispid 280;
    property ConnState: TxMercConnState readonly dispid 281;
    property SaleSum: Currency readonly dispid 282;
    property BuyingSum: Currency readonly dispid 283;
    property SerialNumber: WideString readonly dispid 284;
    property RegNumber: WideString readonly dispid 285;
    property TaxPayerNumber: WideString readonly dispid 286;
    property HeaderLine1: WideString readonly dispid 287;
    property HeaderLine2: WideString readonly dispid 288;
    property HeaderLine3: WideString readonly dispid 289;
    property HeaderLine4: WideString readonly dispid 290;
    property StartDate: TDateTime readonly dispid 291;
    property EndDate: TDateTime readonly dispid 292;
    property StartNumber: Integer readonly dispid 293;
    property EndNumber: Integer readonly dispid 294;
    property ReportDate: TDateTime readonly dispid 295;
    property ModelName: WideString readonly dispid 296;
    property Manufacturer: WideString readonly dispid 297;
    property FirmwareVersion: WideString readonly dispid 298;
    property TaxName: WideString readonly dispid 299;
    property TaxDate: TDateTime readonly dispid 300;
    property CounterCount: Integer readonly dispid 301;
    property RewritesRemain: Integer readonly dispid 302;
    property DaysRemain: Integer readonly dispid 303;
    property LastFiscalReport: Integer readonly dispid 304;
    property LastDayClosing: Integer readonly dispid 305;
    property DayDate: TDateTime readonly dispid 306;
    property LastDocOper: TxMercOperType readonly dispid 307;
    property LastDocNumber: Integer readonly dispid 308;
    property LastRecNumber: Integer readonly dispid 309;
    property LastDocType: TxMercOperType readonly dispid 310;
    property LastDocSum: Currency readonly dispid 311;
    property LastDocDate: TDateTime readonly dispid 312;
    property RetryOperation: WordBool dispid 313;
    property ErrCode: Integer readonly dispid 314;
    property ErrCodeEx: Integer readonly dispid 315;
    property ErrMessage: WideString readonly dispid 316;
    function CheckEcrStatus(Flag: Integer): Integer; dispid 317;
    function CheckDevStatus(Flag: Integer): Integer; dispid 318;
    property EcrHour: Integer readonly dispid 319;
    property EcrMin: Integer readonly dispid 320;
    property ReportHour: Integer readonly dispid 321;
    property ReportMin: Integer readonly dispid 322;
    property DayHour: Integer readonly dispid 323;
    property DayMin: Integer readonly dispid 324;
    property LastDocHour: Integer readonly dispid 325;
    property LastDocMin: Integer readonly dispid 326;
    procedure AddGraphicHeader(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 327;
    procedure SetProtocol(Protocol: TxMercProtocol); dispid 328;
    procedure SetPrinterTimeout(Timeout: Integer); dispid 329;
    procedure SetDisplayTimeout(Timeout: Integer); dispid 330;
    procedure SetPrinterContrast(Contrast: Integer); dispid 331;
    procedure SetLeading(Leading: Integer); dispid 332;
    procedure SetCutterDisabled(Disabled: WordBool); dispid 333;
    procedure SetNarrowPaper(Narrow: WordBool); dispid 334;
    function QueryPrinterTimeout: Integer; dispid 335;
    function QueryDisplayTimeout: Integer; dispid 336;
    function QueryPrinterContrast: Integer; dispid 337;
    function QueryLeading: Integer; dispid 338;
    procedure EnableGraphicHeader(Width: Integer; Height: Integer; const Data: WideString); dispid 339;
    procedure DisableGraphicHeader; dispid 340;
    procedure AddLicence(LicType: TxMercLicenceType; const Licence: WideString); dispid 341;
    function XReport(Flags: Integer): Integer; dispid 342;
    function XReportByDep(DepartNum: Integer; Flags: Integer): Integer; dispid 343;
    function XReportByOper(OperNum: Integer; Flags: Integer): Integer; dispid 344;
    function QueryHeaderAlignment: WordBool; dispid 345;
    function QueryOperNumber: Integer; dispid 346;
    function QueryOperName(OperNum: Integer): WideString; dispid 347;
    procedure SetHeaderAlignment(Aligned: WordBool); dispid 348;
    procedure TestConnection; dispid 349;
    property VersionNumber: Integer readonly dispid 350;
    property BuildNumber: Integer readonly dispid 351;
    property Version: WideString dispid 352;
  end;

// *********************************************************************//
// Interface: IMercuryFPrt5
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {66636E2A-5015-4156-9D06-FC6F63194254}
// *********************************************************************//
  IMercuryFPrt5 = interface(IMercuryFPrt4)
    ['{66636E2A-5015-4156-9D06-FC6F63194254}']
    procedure WriteGraphic(Number: Integer; Width: Integer; Height: Integer; const Data: WideString); safecall;
    procedure PrintGraphic(Width: Integer; Height: Integer; const Data: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IMercuryFPrt5Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {66636E2A-5015-4156-9D06-FC6F63194254}
// *********************************************************************//
  IMercuryFPrt5Disp = dispinterface
    ['{66636E2A-5015-4156-9D06-FC6F63194254}']
    procedure WriteGraphic(Number: Integer; Width: Integer; Height: Integer; const Data: WideString); dispid 601;
    procedure PrintGraphic(Width: Integer; Height: Integer; const Data: WideString); dispid 602;
    procedure AddRegNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 501;
    procedure EKLZActivate; dispid 401;
    procedure EKLZActivationReport; dispid 402;
    procedure EKLZDayReport(DayNumber: Integer); dispid 403;
    procedure EKLZReportByNum(IsFull: WordBool; AStartNum: Integer; AEndNum: Integer); dispid 404;
    procedure EKLZReportByDate(IsFull: WordBool; AStartDate: TDateTime; AEndDate: TDateTime); dispid 405;
    procedure EKLZDocByNum(Number: Integer); dispid 406;
    procedure EKLZControlByNum(DayNumber: Integer); dispid 407;
    procedure EKLZCloseArchive; dispid 408;
    procedure EKLZQueryStatus; dispid 409;
    function QueryPaperJournal: WordBool; dispid 410;
    procedure SetPaperJournal(PaperJournal: WordBool); dispid 411;
    property EKLZSupported: WordBool readonly dispid 412;
    property EKLZActivated: WordBool readonly dispid 413;
    property EKLZOper: TxMercOperType readonly dispid 414;
    property EKLZArchiving: WordBool readonly dispid 415;
    property EKLZReporting: WordBool readonly dispid 416;
    property EKLZDayOpened: WordBool readonly dispid 417;
    property EKLZFatalError: WordBool readonly dispid 418;
    property EKLZAttention: WordBool readonly dispid 419;
    property LastRepNumber: Integer readonly dispid 420;
    property EKLZRest: Integer readonly dispid 421;
    function QueryFullJournal: WordBool; dispid 422;
    procedure SetFullJournal(FullJournal: WordBool); dispid 423;
    procedure AddEKLZData(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 424;
    property LastBuyingSum: Currency readonly dispid 425;
    function QueryAutocut: WordBool; dispid 353;
    procedure SetAutocut(Autocut: WordBool); dispid 354;
    function QueryEconomicMode: WordBool; dispid 355;
    procedure SetEconomicMode(EconomicMode: WordBool); dispid 356;
    property EcrSubVersion: Integer readonly dispid 357;
    procedure Open; dispid 201;
    procedure Close(ForceAbort: WordBool); dispid 202;
    procedure OpenReceipt(Oper: TxMercOperType); dispid 203;
    procedure AddReceiptItem(const Desc: WideString; Price: Currency; ItemIsTare: WordBool; 
                             Department: Integer; Code: Integer; Adjustment: Integer; 
                             Quantity: Integer; QuantityPrec: Integer; TaxIndex: Integer; 
                             const UnitName: WideString; Flags: Integer); dispid 204;
    procedure CancelReceipt; dispid 205;
    procedure CloseReceipt(const Account: WideString; PayType: TxMercPayType; PayCash: Currency; 
                           PayCashless: Currency; const PayInfo: WideString; CopiesNum: Integer; 
                           OperInfo: TxMercOperInfo); dispid 206;
    procedure OpenCustomDoc(UseForm: WordBool; Oper: TxMercOperType); dispid 207;
    procedure CancelCustomDoc; dispid 208;
    procedure CloseCustomDoc(PayType: TxMercPayType; Flags: Integer; HCopiesNum: Integer; 
                             VCopiesNum: Integer; VOrigOffset: Integer; HCopyOffset: Integer; 
                             VCopyOffset: Integer; FiscalCopy: Integer); dispid 209;
    procedure OpenFiscalDoc(Oper: TxMercOperType); dispid 210;
    procedure CancelFiscalDoc(BufferOnly: WordBool); dispid 211;
    procedure PrintFiscalDocBuffer; dispid 212;
    procedure CloseFiscalDoc; dispid 213;
    procedure CopyFiscalDoc; dispid 214;
    procedure AddSerialNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 215;
    procedure AddHeaderLine(LineNum: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 216;
    procedure AddDateTime(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 217;
    procedure AddOperInfo(OperInfo: TxMercOperInfo; Flags: Integer; HOffset: Integer; 
                          VOffset: Integer); dispid 218;
    procedure AddDocNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 219;
    procedure AddReceiptNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 220;
    procedure AddAccount(const Account: WideString; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 221;
    procedure AddTaxPayerNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 222;
    procedure AddItem(ItemType: TxMercItemType; Price: Currency; ItemIsTare: WordBool; 
                      Department: Integer; Code: Integer; Adjustment: Integer; Quantity: Integer; 
                      QuantityPrec: Integer; TaxIndex: Integer; const UnitName: WideString; 
                      Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 223;
    procedure AddDocPercentAdj(Value: Integer; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                               VOffset: Integer; RightOffset: Integer); dispid 224;
    procedure AddDocAmountAdj(Value: Currency; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                              VOffset: Integer; RightOffset: Integer); dispid 225;
    procedure AddTotal(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 226;
    procedure AddPay(PayType: TxMercPayType; PayCash: Currency; PayCashless: Currency; 
                     const PayInfo: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                     RightOffset: Integer); dispid 227;
    procedure AddChange(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 228;
    procedure AddTaxSum(TaxIndex: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                        RightOffset: Integer); dispid 229;
    procedure AddFiscalSign(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 230;
    procedure AddBarcode(Mask1: Integer; Mask2: Integer; Mask3: Integer; Mask4: Integer; 
                         Mask5: Integer; DoubleDensity: WordBool; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 231;
    procedure AddCustom(const Text: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 232;
    procedure RepeatOperation; dispid 233;
    procedure OpenDay(OperNum: Integer; const OperName: WideString; FullJournal: WordBool; 
                      AProtocol: TxMercProtocol); dispid 234;
    function ZReport(Flags: Integer): Integer; dispid 235;
    function FiscalRewrite(const InspPswd: WideString; const RegNum: WideString; 
                           const TaxPayerNum: WideString; const NewInspPswd: WideString): Integer; dispid 236;
    function FiscalReportByNum(const InspPswd: WideString; PrintFull: WordBool; AStartNum: Integer; 
                               AEndNum: Integer): Integer; dispid 237;
    function FiscalReportByDate(const InspPswd: WideString; PrintFull: WordBool; 
                                AStartDate: TDateTime; AEndDate: TDateTime): Integer; dispid 238;
    function FiscalReportAll(const InspPswd: WideString): Integer; dispid 239;
    procedure FeedAndCut(LineCount: Integer; CutAfterFeed: WordBool); dispid 240;
    procedure PrintNonFiscal(const Data: WideString; OpenDoc: WordBool; CloseDoc: WordBool); dispid 241;
    procedure ShowDisplay(const Data: WideString; OpenMode: WordBool; CloseMode: WordBool); dispid 242;
    procedure SetDisplayBaudRate(BaudRate: Integer); dispid 243;
    procedure ExternalPulse(Channel: Integer; TimeOn: Integer; TimeOff: Integer; Count: Integer); dispid 244;
    procedure QueryDevExStatus; dispid 245;
    procedure QueryFirmwareInfo; dispid 246;
    procedure SetHeader(const Line1: WideString; const Line2: WideString; const Line3: WideString; 
                        const Line4: WideString); dispid 247;
    procedure SetTax(Index: Integer; const TaxName: WideString; TaxRate: Integer); dispid 248;
    function QueryTax(Index: Integer): Integer; dispid 249;
    function QueryCounter(Index: Integer; NoRequest: WordBool): Currency; dispid 250;
    procedure SynchronizeEcrDateTime; dispid 251;
    procedure QueryResourceInfo(PrintInfo: WordBool); dispid 252;
    procedure QueryLastDocInfo; dispid 253;
    procedure SetParameters(Protocol: TxMercProtocol; PrnTimeout: Integer); dispid 254;
    property EcrModel: TxMercEcrModel readonly dispid 255;
    property EcrVersion: Integer readonly dispid 256;
    property Generation: Integer readonly dispid 257;
    property Protocol: TxMercProtocol readonly dispid 258;
    property EcrStatus: Integer readonly dispid 259;
    property EcrStatusMask: Integer readonly dispid 260;
    property DevStatus: Integer readonly dispid 261;
    property DevStatusMask: Integer readonly dispid 262;
    property DocStatus: TxMercDocStatus readonly dispid 263;
    property CurrentOper: TxMercOperType readonly dispid 264;
    property PortNum: Integer dispid 265;
    property BaudRate: Integer dispid 266;
    property Password: WideString dispid 267;
    property InternalTimeout: Integer dispid 268;
    property ExternalTimeout: Integer dispid 269;
    function QueryHeaderLine(LineNum: Integer): WideString; dispid 270;
    function QuerySerialNumber: WideString; dispid 271;
    procedure SetSerialNumber(const Value: WideString); dispid 272;
    function QueryTaxPayerNumber: WideString; dispid 273;
    function QueryRegNumber: WideString; dispid 274;
    function QueryEcrDateTime: TDateTime; dispid 275;
    function QueryDepartName(DepartNum: Integer): WideString; dispid 276;
    procedure SetDepartName(DepartNum: Integer; const Value: WideString); dispid 277;
    function QueryTitle(TitleNum: Integer): WideString; dispid 278;
    procedure SetTitle(TitleNum: Integer; const Value: WideString); dispid 279;
    property Active: WordBool dispid 280;
    property ConnState: TxMercConnState readonly dispid 281;
    property SaleSum: Currency readonly dispid 282;
    property BuyingSum: Currency readonly dispid 283;
    property SerialNumber: WideString readonly dispid 284;
    property RegNumber: WideString readonly dispid 285;
    property TaxPayerNumber: WideString readonly dispid 286;
    property HeaderLine1: WideString readonly dispid 287;
    property HeaderLine2: WideString readonly dispid 288;
    property HeaderLine3: WideString readonly dispid 289;
    property HeaderLine4: WideString readonly dispid 290;
    property StartDate: TDateTime readonly dispid 291;
    property EndDate: TDateTime readonly dispid 292;
    property StartNumber: Integer readonly dispid 293;
    property EndNumber: Integer readonly dispid 294;
    property ReportDate: TDateTime readonly dispid 295;
    property ModelName: WideString readonly dispid 296;
    property Manufacturer: WideString readonly dispid 297;
    property FirmwareVersion: WideString readonly dispid 298;
    property TaxName: WideString readonly dispid 299;
    property TaxDate: TDateTime readonly dispid 300;
    property CounterCount: Integer readonly dispid 301;
    property RewritesRemain: Integer readonly dispid 302;
    property DaysRemain: Integer readonly dispid 303;
    property LastFiscalReport: Integer readonly dispid 304;
    property LastDayClosing: Integer readonly dispid 305;
    property DayDate: TDateTime readonly dispid 306;
    property LastDocOper: TxMercOperType readonly dispid 307;
    property LastDocNumber: Integer readonly dispid 308;
    property LastRecNumber: Integer readonly dispid 309;
    property LastDocType: TxMercOperType readonly dispid 310;
    property LastDocSum: Currency readonly dispid 311;
    property LastDocDate: TDateTime readonly dispid 312;
    property RetryOperation: WordBool dispid 313;
    property ErrCode: Integer readonly dispid 314;
    property ErrCodeEx: Integer readonly dispid 315;
    property ErrMessage: WideString readonly dispid 316;
    function CheckEcrStatus(Flag: Integer): Integer; dispid 317;
    function CheckDevStatus(Flag: Integer): Integer; dispid 318;
    property EcrHour: Integer readonly dispid 319;
    property EcrMin: Integer readonly dispid 320;
    property ReportHour: Integer readonly dispid 321;
    property ReportMin: Integer readonly dispid 322;
    property DayHour: Integer readonly dispid 323;
    property DayMin: Integer readonly dispid 324;
    property LastDocHour: Integer readonly dispid 325;
    property LastDocMin: Integer readonly dispid 326;
    procedure AddGraphicHeader(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 327;
    procedure SetProtocol(Protocol: TxMercProtocol); dispid 328;
    procedure SetPrinterTimeout(Timeout: Integer); dispid 329;
    procedure SetDisplayTimeout(Timeout: Integer); dispid 330;
    procedure SetPrinterContrast(Contrast: Integer); dispid 331;
    procedure SetLeading(Leading: Integer); dispid 332;
    procedure SetCutterDisabled(Disabled: WordBool); dispid 333;
    procedure SetNarrowPaper(Narrow: WordBool); dispid 334;
    function QueryPrinterTimeout: Integer; dispid 335;
    function QueryDisplayTimeout: Integer; dispid 336;
    function QueryPrinterContrast: Integer; dispid 337;
    function QueryLeading: Integer; dispid 338;
    procedure EnableGraphicHeader(Width: Integer; Height: Integer; const Data: WideString); dispid 339;
    procedure DisableGraphicHeader; dispid 340;
    procedure AddLicence(LicType: TxMercLicenceType; const Licence: WideString); dispid 341;
    function XReport(Flags: Integer): Integer; dispid 342;
    function XReportByDep(DepartNum: Integer; Flags: Integer): Integer; dispid 343;
    function XReportByOper(OperNum: Integer; Flags: Integer): Integer; dispid 344;
    function QueryHeaderAlignment: WordBool; dispid 345;
    function QueryOperNumber: Integer; dispid 346;
    function QueryOperName(OperNum: Integer): WideString; dispid 347;
    procedure SetHeaderAlignment(Aligned: WordBool); dispid 348;
    procedure TestConnection; dispid 349;
    property VersionNumber: Integer readonly dispid 350;
    property BuildNumber: Integer readonly dispid 351;
    property Version: WideString dispid 352;
  end;

// *********************************************************************//
// Interface: IMercuryFPrtX5
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D3FA84FF-677F-4244-AEFB-E8343EF7C706}
// *********************************************************************//
  IMercuryFPrtX5 = interface(IMercuryFPrtX4)
    ['{D3FA84FF-677F-4244-AEFB-E8343EF7C706}']
    procedure WriteGraphic(Number: Integer; Width: Integer; Height: Integer; const Data: WideString); safecall;
    procedure PrintGraphic(Width: Integer; Height: Integer; const Data: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IMercuryFPrtX5Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D3FA84FF-677F-4244-AEFB-E8343EF7C706}
// *********************************************************************//
  IMercuryFPrtX5Disp = dispinterface
    ['{D3FA84FF-677F-4244-AEFB-E8343EF7C706}']
    procedure WriteGraphic(Number: Integer; Width: Integer; Height: Integer; const Data: WideString); dispid 701;
    procedure PrintGraphic(Width: Integer; Height: Integer; const Data: WideString); dispid 702;
    procedure AddRegNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 601;
    procedure EKLZActivate; dispid 401;
    procedure EKLZActivationReport; dispid 402;
    procedure EKLZDayReport(DayNumber: Integer); dispid 403;
    procedure EKLZReportByNum(IsFull: WordBool; AStartNum: Integer; AEndNum: Integer); dispid 404;
    procedure EKLZReportByDate(IsFull: WordBool; AStartDate: TDateTime; AEndDate: TDateTime); dispid 405;
    procedure EKLZDocByNum(Number: Integer); dispid 406;
    procedure EKLZControlByNum(DayNumber: Integer); dispid 407;
    procedure EKLZCloseArchive; dispid 408;
    procedure EKLZQueryStatus; dispid 409;
    function QueryPaperJournal: WordBool; dispid 410;
    procedure SetPaperJournal(PaperJournal: WordBool); dispid 411;
    property EKLZSupported: WordBool readonly dispid 412;
    property EKLZActivated: WordBool readonly dispid 413;
    property EKLZOper: TxMercOperType readonly dispid 414;
    property EKLZArchiving: WordBool readonly dispid 415;
    property EKLZReporting: WordBool readonly dispid 416;
    property EKLZDayOpened: WordBool readonly dispid 417;
    property EKLZFatalError: WordBool readonly dispid 418;
    property EKLZAttention: WordBool readonly dispid 419;
    function QueryFullJournal: WordBool; dispid 501;
    procedure SetFullJournal(FullJournal: WordBool); dispid 502;
    procedure AddEKLZData(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 503;
    property LastBuyingSum: Currency readonly dispid 504;
    function QueryAutocut: WordBool; dispid 353;
    procedure SetAutocut(Autocut: WordBool); dispid 354;
    function QueryEconomicMode: WordBool; dispid 355;
    procedure SetEconomicMode(EconomicMode: WordBool); dispid 356;
    property EcrSubVersion: Integer readonly dispid 357;
    property BorderSize: Integer dispid 1001;
    property ShowState: WordBool dispid 1002;
    property Enabled: WordBool dispid -514;
    procedure AboutBox; dispid -552;
    procedure Open; dispid 201;
    procedure Close(ForceAbort: WordBool); dispid 202;
    procedure OpenReceipt(Oper: TxMercOperType); dispid 203;
    procedure AddReceiptItem(const Desc: WideString; Price: Currency; ItemIsTare: WordBool; 
                             Department: Integer; Code: Integer; Adjustment: Integer; 
                             Quantity: Integer; QuantityPrec: Integer; TaxIndex: Integer; 
                             const UnitName: WideString; Flags: Integer); dispid 204;
    procedure CancelReceipt; dispid 205;
    procedure CloseReceipt(const Account: WideString; PayType: TxMercPayType; PayCash: Currency; 
                           PayCashless: Currency; const PayInfo: WideString; CopiesNum: Integer; 
                           OperInfo: TxMercOperInfo); dispid 206;
    procedure OpenCustomDoc(UseForm: WordBool; Oper: TxMercOperType); dispid 207;
    procedure CancelCustomDoc; dispid 208;
    procedure CloseCustomDoc(PayType: TxMercPayType; Flags: Integer; HCopiesNum: Integer; 
                             VCopiesNum: Integer; VOrigOffset: Integer; HCopyOffset: Integer; 
                             VCopyOffset: Integer; FiscalCopy: Integer); dispid 209;
    procedure OpenFiscalDoc(Oper: TxMercOperType); dispid 210;
    procedure CancelFiscalDoc(BufferOnly: WordBool); dispid 211;
    procedure PrintFiscalDocBuffer; dispid 212;
    procedure CloseFiscalDoc; dispid 213;
    procedure CopyFiscalDoc; dispid 214;
    procedure AddSerialNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 215;
    procedure AddHeaderLine(LineNum: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 216;
    procedure AddDateTime(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 217;
    procedure AddOperInfo(OperInfo: TxMercOperInfo; Flags: Integer; HOffset: Integer; 
                          VOffset: Integer); dispid 218;
    procedure AddDocNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 219;
    procedure AddReceiptNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 220;
    procedure AddAccount(const Account: WideString; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 221;
    procedure AddTaxPayerNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 222;
    procedure AddItem(ItemType: TxMercItemType; Price: Currency; ItemIsTare: WordBool; 
                      Department: Integer; Code: Integer; Adjustment: Integer; Quantity: Integer; 
                      QuantityPrec: Integer; TaxIndex: Integer; const UnitName: WideString; 
                      Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 223;
    procedure AddDocPercentAdj(Value: Integer; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                               VOffset: Integer; RightOffset: Integer); dispid 224;
    procedure AddDocAmountAdj(Value: Currency; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                              VOffset: Integer; RightOffset: Integer); dispid 225;
    procedure AddTotal(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 226;
    procedure AddPay(PayType: TxMercPayType; PayCash: Currency; PayCashless: Currency; 
                     const PayInfo: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                     RightOffset: Integer); dispid 227;
    procedure AddChange(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 228;
    procedure AddTaxSum(TaxIndex: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                        RightOffset: Integer); dispid 229;
    procedure AddFiscalSign(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 230;
    procedure AddBarcode(Mask1: Integer; Mask2: Integer; Mask3: Integer; Mask4: Integer; 
                         Mask5: Integer; DoubleDensity: WordBool; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 231;
    procedure AddCustom(const Text: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 232;
    procedure RepeatOperation; dispid 233;
    procedure OpenDay(OperNum: Integer; const OperName: WideString; FullJournal: WordBool; 
                      AProtocol: TxMercProtocol); dispid 234;
    function ZReport(Flags: Integer): Integer; dispid 235;
    function FiscalRewrite(const InspPswd: WideString; const RegNum: WideString; 
                           const TaxPayerNum: WideString; const NewInspPswd: WideString): Integer; dispid 236;
    function FiscalReportByNum(const InspPswd: WideString; PrintFull: WordBool; AStartNum: Integer; 
                               AEndNum: Integer): Integer; dispid 237;
    function FiscalReportByDate(const InspPswd: WideString; PrintFull: WordBool; 
                                AStartDate: TDateTime; AEndDate: TDateTime): Integer; dispid 238;
    function FiscalReportAll(const InspPswd: WideString): Integer; dispid 239;
    procedure FeedAndCut(LineCount: Integer; CutAfterFeed: WordBool); dispid 240;
    procedure PrintNonFiscal(const Data: WideString; OpenDoc: WordBool; CloseDoc: WordBool); dispid 241;
    procedure ShowDisplay(const Data: WideString; OpenMode: WordBool; CloseMode: WordBool); dispid 242;
    procedure SetDisplayBaudRate(BaudRate: Integer); dispid 243;
    procedure ExternalPulse(Channel: Integer; TimeOn: Integer; TimeOff: Integer; Count: Integer); dispid 244;
    procedure QueryDevExStatus; dispid 245;
    procedure QueryFirmwareInfo; dispid 246;
    procedure SetHeader(const Line1: WideString; const Line2: WideString; const Line3: WideString; 
                        const Line4: WideString); dispid 247;
    procedure SetTax(Index: Integer; const TaxName: WideString; TaxRate: Integer); dispid 248;
    function QueryTax(Index: Integer): Integer; dispid 249;
    function QueryCounter(Index: Integer; NoRequest: WordBool): Currency; dispid 250;
    procedure SynchronizeEcrDateTime; dispid 251;
    procedure QueryResourceInfo(PrintInfo: WordBool); dispid 252;
    procedure QueryLastDocInfo; dispid 253;
    procedure SetParameters(Protocol: TxMercProtocol; PrnTimeout: Integer); dispid 254;
    property EcrModel: TxMercEcrModel readonly dispid 255;
    property EcrVersion: Integer readonly dispid 256;
    property Generation: Integer readonly dispid 257;
    property Protocol: TxMercProtocol readonly dispid 258;
    property EcrStatus: Integer readonly dispid 259;
    property EcrStatusMask: Integer readonly dispid 260;
    property DevStatus: Integer readonly dispid 261;
    property DevStatusMask: Integer readonly dispid 262;
    property DocStatus: TxMercDocStatus readonly dispid 263;
    property CurrentOper: TxMercOperType readonly dispid 264;
    property PortNum: Integer dispid 265;
    property BaudRate: Integer dispid 266;
    property Password: WideString dispid 267;
    property InternalTimeout: Integer dispid 268;
    property ExternalTimeout: Integer dispid 269;
    function QueryHeaderLine(LineNum: Integer): WideString; dispid 270;
    function QuerySerialNumber: WideString; dispid 271;
    procedure SetSerialNumber(const Value: WideString); dispid 272;
    function QueryTaxPayerNumber: WideString; dispid 273;
    function QueryRegNumber: WideString; dispid 274;
    function QueryEcrDateTime: TDateTime; dispid 275;
    function QueryDepartName(DepartNum: Integer): WideString; dispid 276;
    procedure SetDepartName(DepartNum: Integer; const Value: WideString); dispid 277;
    function QueryTitle(TitleNum: Integer): WideString; dispid 278;
    procedure SetTitle(TitleNum: Integer; const Value: WideString); dispid 279;
    property Active: WordBool dispid 280;
    property ConnState: TxMercConnState readonly dispid 281;
    property SaleSum: Currency readonly dispid 282;
    property BuyingSum: Currency readonly dispid 283;
    property SerialNumber: WideString readonly dispid 284;
    property RegNumber: WideString readonly dispid 285;
    property TaxPayerNumber: WideString readonly dispid 286;
    property HeaderLine1: WideString readonly dispid 287;
    property HeaderLine2: WideString readonly dispid 288;
    property HeaderLine3: WideString readonly dispid 289;
    property HeaderLine4: WideString readonly dispid 290;
    property StartDate: TDateTime readonly dispid 291;
    property EndDate: TDateTime readonly dispid 292;
    property StartNumber: Integer readonly dispid 293;
    property EndNumber: Integer readonly dispid 294;
    property ReportDate: TDateTime readonly dispid 295;
    property ModelName: WideString readonly dispid 296;
    property Manufacturer: WideString readonly dispid 297;
    property FirmwareVersion: WideString readonly dispid 298;
    property TaxName: WideString readonly dispid 299;
    property TaxDate: TDateTime readonly dispid 300;
    property CounterCount: Integer readonly dispid 301;
    property RewritesRemain: Integer readonly dispid 302;
    property DaysRemain: Integer readonly dispid 303;
    property LastFiscalReport: Integer readonly dispid 304;
    property LastDayClosing: Integer readonly dispid 305;
    property DayDate: TDateTime readonly dispid 306;
    property LastDocOper: TxMercOperType readonly dispid 307;
    property LastDocNumber: Integer readonly dispid 308;
    property LastRecNumber: Integer readonly dispid 309;
    property LastDocType: TxMercOperType readonly dispid 310;
    property LastDocSum: Currency readonly dispid 311;
    property LastDocDate: TDateTime readonly dispid 312;
    property RetryOperation: WordBool dispid 313;
    property ErrCode: Integer readonly dispid 314;
    property ErrCodeEx: Integer readonly dispid 315;
    property ErrMessage: WideString readonly dispid 316;
    function CheckEcrStatus(Flag: Integer): Integer; dispid 317;
    function CheckDevStatus(Flag: Integer): Integer; dispid 318;
    property EcrHour: Integer readonly dispid 319;
    property EcrMin: Integer readonly dispid 320;
    property ReportHour: Integer readonly dispid 321;
    property ReportMin: Integer readonly dispid 322;
    property DayHour: Integer readonly dispid 323;
    property DayMin: Integer readonly dispid 324;
    property LastDocHour: Integer readonly dispid 325;
    property LastDocMin: Integer readonly dispid 326;
    procedure AddGraphicHeader(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 327;
    procedure SetProtocol(Protocol: TxMercProtocol); dispid 328;
    procedure SetPrinterTimeout(Timeout: Integer); dispid 329;
    procedure SetDisplayTimeout(Timeout: Integer); dispid 330;
    procedure SetPrinterContrast(Contrast: Integer); dispid 331;
    procedure SetLeading(Leading: Integer); dispid 332;
    procedure SetCutterDisabled(Disabled: WordBool); dispid 333;
    procedure SetNarrowPaper(Narrow: WordBool); dispid 334;
    function QueryPrinterTimeout: Integer; dispid 335;
    function QueryDisplayTimeout: Integer; dispid 336;
    function QueryPrinterContrast: Integer; dispid 337;
    function QueryLeading: Integer; dispid 338;
    procedure EnableGraphicHeader(Width: Integer; Height: Integer; const Data: WideString); dispid 339;
    procedure DisableGraphicHeader; dispid 340;
    procedure AddLicence(LicType: TxMercLicenceType; const Licence: WideString); dispid 341;
    function XReport(Flags: Integer): Integer; dispid 342;
    function XReportByDep(DepartNum: Integer; Flags: Integer): Integer; dispid 343;
    function XReportByOper(OperNum: Integer; Flags: Integer): Integer; dispid 344;
    function QueryHeaderAlignment: WordBool; dispid 345;
    function QueryOperNumber: Integer; dispid 346;
    function QueryOperName(OperNum: Integer): WideString; dispid 347;
    procedure SetHeaderAlignment(Aligned: WordBool); dispid 348;
    procedure TestConnection; dispid 349;
    property VersionNumber: Integer readonly dispid 350;
    property BuildNumber: Integer readonly dispid 351;
    property Version: WideString dispid 352;
  end;

// *********************************************************************//
// Interface: IMercuryFPrt6
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FDC67547-0246-4854-9F84-C7EE4E93FB9B}
// *********************************************************************//
  IMercuryFPrt6 = interface(IMercuryFPrt5)
    ['{FDC67547-0246-4854-9F84-C7EE4E93FB9B}']
    function QueryParameterBool(ParamCode: Integer): WordBool; safecall;
    function QueryParameterInt(ParamCode: Integer): Integer; safecall;
    procedure SetParameterBool(ParamCode: Integer; ParamValue: WordBool); safecall;
    procedure SetParameterInt(ParamCode: Integer; ParamValue: Integer); safecall;
  end;

// *********************************************************************//
// DispIntf:  IMercuryFPrt6Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FDC67547-0246-4854-9F84-C7EE4E93FB9B}
// *********************************************************************//
  IMercuryFPrt6Disp = dispinterface
    ['{FDC67547-0246-4854-9F84-C7EE4E93FB9B}']
    function QueryParameterBool(ParamCode: Integer): WordBool; dispid 701;
    function QueryParameterInt(ParamCode: Integer): Integer; dispid 702;
    procedure SetParameterBool(ParamCode: Integer; ParamValue: WordBool); dispid 703;
    procedure SetParameterInt(ParamCode: Integer; ParamValue: Integer); dispid 704;
    procedure WriteGraphic(Number: Integer; Width: Integer; Height: Integer; const Data: WideString); dispid 601;
    procedure PrintGraphic(Width: Integer; Height: Integer; const Data: WideString); dispid 602;
    procedure AddRegNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 501;
    procedure EKLZActivate; dispid 401;
    procedure EKLZActivationReport; dispid 402;
    procedure EKLZDayReport(DayNumber: Integer); dispid 403;
    procedure EKLZReportByNum(IsFull: WordBool; AStartNum: Integer; AEndNum: Integer); dispid 404;
    procedure EKLZReportByDate(IsFull: WordBool; AStartDate: TDateTime; AEndDate: TDateTime); dispid 405;
    procedure EKLZDocByNum(Number: Integer); dispid 406;
    procedure EKLZControlByNum(DayNumber: Integer); dispid 407;
    procedure EKLZCloseArchive; dispid 408;
    procedure EKLZQueryStatus; dispid 409;
    function QueryPaperJournal: WordBool; dispid 410;
    procedure SetPaperJournal(PaperJournal: WordBool); dispid 411;
    property EKLZSupported: WordBool readonly dispid 412;
    property EKLZActivated: WordBool readonly dispid 413;
    property EKLZOper: TxMercOperType readonly dispid 414;
    property EKLZArchiving: WordBool readonly dispid 415;
    property EKLZReporting: WordBool readonly dispid 416;
    property EKLZDayOpened: WordBool readonly dispid 417;
    property EKLZFatalError: WordBool readonly dispid 418;
    property EKLZAttention: WordBool readonly dispid 419;
    property LastRepNumber: Integer readonly dispid 420;
    property EKLZRest: Integer readonly dispid 421;
    function QueryFullJournal: WordBool; dispid 422;
    procedure SetFullJournal(FullJournal: WordBool); dispid 423;
    procedure AddEKLZData(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 424;
    property LastBuyingSum: Currency readonly dispid 425;
    function QueryAutocut: WordBool; dispid 353;
    procedure SetAutocut(Autocut: WordBool); dispid 354;
    function QueryEconomicMode: WordBool; dispid 355;
    procedure SetEconomicMode(EconomicMode: WordBool); dispid 356;
    property EcrSubVersion: Integer readonly dispid 357;
    procedure Open; dispid 201;
    procedure Close(ForceAbort: WordBool); dispid 202;
    procedure OpenReceipt(Oper: TxMercOperType); dispid 203;
    procedure AddReceiptItem(const Desc: WideString; Price: Currency; ItemIsTare: WordBool; 
                             Department: Integer; Code: Integer; Adjustment: Integer; 
                             Quantity: Integer; QuantityPrec: Integer; TaxIndex: Integer; 
                             const UnitName: WideString; Flags: Integer); dispid 204;
    procedure CancelReceipt; dispid 205;
    procedure CloseReceipt(const Account: WideString; PayType: TxMercPayType; PayCash: Currency; 
                           PayCashless: Currency; const PayInfo: WideString; CopiesNum: Integer; 
                           OperInfo: TxMercOperInfo); dispid 206;
    procedure OpenCustomDoc(UseForm: WordBool; Oper: TxMercOperType); dispid 207;
    procedure CancelCustomDoc; dispid 208;
    procedure CloseCustomDoc(PayType: TxMercPayType; Flags: Integer; HCopiesNum: Integer; 
                             VCopiesNum: Integer; VOrigOffset: Integer; HCopyOffset: Integer; 
                             VCopyOffset: Integer; FiscalCopy: Integer); dispid 209;
    procedure OpenFiscalDoc(Oper: TxMercOperType); dispid 210;
    procedure CancelFiscalDoc(BufferOnly: WordBool); dispid 211;
    procedure PrintFiscalDocBuffer; dispid 212;
    procedure CloseFiscalDoc; dispid 213;
    procedure CopyFiscalDoc; dispid 214;
    procedure AddSerialNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 215;
    procedure AddHeaderLine(LineNum: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 216;
    procedure AddDateTime(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 217;
    procedure AddOperInfo(OperInfo: TxMercOperInfo; Flags: Integer; HOffset: Integer; 
                          VOffset: Integer); dispid 218;
    procedure AddDocNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 219;
    procedure AddReceiptNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 220;
    procedure AddAccount(const Account: WideString; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 221;
    procedure AddTaxPayerNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 222;
    procedure AddItem(ItemType: TxMercItemType; Price: Currency; ItemIsTare: WordBool; 
                      Department: Integer; Code: Integer; Adjustment: Integer; Quantity: Integer; 
                      QuantityPrec: Integer; TaxIndex: Integer; const UnitName: WideString; 
                      Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 223;
    procedure AddDocPercentAdj(Value: Integer; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                               VOffset: Integer; RightOffset: Integer); dispid 224;
    procedure AddDocAmountAdj(Value: Currency; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                              VOffset: Integer; RightOffset: Integer); dispid 225;
    procedure AddTotal(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 226;
    procedure AddPay(PayType: TxMercPayType; PayCash: Currency; PayCashless: Currency; 
                     const PayInfo: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                     RightOffset: Integer); dispid 227;
    procedure AddChange(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 228;
    procedure AddTaxSum(TaxIndex: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                        RightOffset: Integer); dispid 229;
    procedure AddFiscalSign(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 230;
    procedure AddBarcode(Mask1: Integer; Mask2: Integer; Mask3: Integer; Mask4: Integer; 
                         Mask5: Integer; DoubleDensity: WordBool; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 231;
    procedure AddCustom(const Text: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 232;
    procedure RepeatOperation; dispid 233;
    procedure OpenDay(OperNum: Integer; const OperName: WideString; FullJournal: WordBool; 
                      AProtocol: TxMercProtocol); dispid 234;
    function ZReport(Flags: Integer): Integer; dispid 235;
    function FiscalRewrite(const InspPswd: WideString; const RegNum: WideString; 
                           const TaxPayerNum: WideString; const NewInspPswd: WideString): Integer; dispid 236;
    function FiscalReportByNum(const InspPswd: WideString; PrintFull: WordBool; AStartNum: Integer; 
                               AEndNum: Integer): Integer; dispid 237;
    function FiscalReportByDate(const InspPswd: WideString; PrintFull: WordBool; 
                                AStartDate: TDateTime; AEndDate: TDateTime): Integer; dispid 238;
    function FiscalReportAll(const InspPswd: WideString): Integer; dispid 239;
    procedure FeedAndCut(LineCount: Integer; CutAfterFeed: WordBool); dispid 240;
    procedure PrintNonFiscal(const Data: WideString; OpenDoc: WordBool; CloseDoc: WordBool); dispid 241;
    procedure ShowDisplay(const Data: WideString; OpenMode: WordBool; CloseMode: WordBool); dispid 242;
    procedure SetDisplayBaudRate(BaudRate: Integer); dispid 243;
    procedure ExternalPulse(Channel: Integer; TimeOn: Integer; TimeOff: Integer; Count: Integer); dispid 244;
    procedure QueryDevExStatus; dispid 245;
    procedure QueryFirmwareInfo; dispid 246;
    procedure SetHeader(const Line1: WideString; const Line2: WideString; const Line3: WideString; 
                        const Line4: WideString); dispid 247;
    procedure SetTax(Index: Integer; const TaxName: WideString; TaxRate: Integer); dispid 248;
    function QueryTax(Index: Integer): Integer; dispid 249;
    function QueryCounter(Index: Integer; NoRequest: WordBool): Currency; dispid 250;
    procedure SynchronizeEcrDateTime; dispid 251;
    procedure QueryResourceInfo(PrintInfo: WordBool); dispid 252;
    procedure QueryLastDocInfo; dispid 253;
    procedure SetParameters(Protocol: TxMercProtocol; PrnTimeout: Integer); dispid 254;
    property EcrModel: TxMercEcrModel readonly dispid 255;
    property EcrVersion: Integer readonly dispid 256;
    property Generation: Integer readonly dispid 257;
    property Protocol: TxMercProtocol readonly dispid 258;
    property EcrStatus: Integer readonly dispid 259;
    property EcrStatusMask: Integer readonly dispid 260;
    property DevStatus: Integer readonly dispid 261;
    property DevStatusMask: Integer readonly dispid 262;
    property DocStatus: TxMercDocStatus readonly dispid 263;
    property CurrentOper: TxMercOperType readonly dispid 264;
    property PortNum: Integer dispid 265;
    property BaudRate: Integer dispid 266;
    property Password: WideString dispid 267;
    property InternalTimeout: Integer dispid 268;
    property ExternalTimeout: Integer dispid 269;
    function QueryHeaderLine(LineNum: Integer): WideString; dispid 270;
    function QuerySerialNumber: WideString; dispid 271;
    procedure SetSerialNumber(const Value: WideString); dispid 272;
    function QueryTaxPayerNumber: WideString; dispid 273;
    function QueryRegNumber: WideString; dispid 274;
    function QueryEcrDateTime: TDateTime; dispid 275;
    function QueryDepartName(DepartNum: Integer): WideString; dispid 276;
    procedure SetDepartName(DepartNum: Integer; const Value: WideString); dispid 277;
    function QueryTitle(TitleNum: Integer): WideString; dispid 278;
    procedure SetTitle(TitleNum: Integer; const Value: WideString); dispid 279;
    property Active: WordBool dispid 280;
    property ConnState: TxMercConnState readonly dispid 281;
    property SaleSum: Currency readonly dispid 282;
    property BuyingSum: Currency readonly dispid 283;
    property SerialNumber: WideString readonly dispid 284;
    property RegNumber: WideString readonly dispid 285;
    property TaxPayerNumber: WideString readonly dispid 286;
    property HeaderLine1: WideString readonly dispid 287;
    property HeaderLine2: WideString readonly dispid 288;
    property HeaderLine3: WideString readonly dispid 289;
    property HeaderLine4: WideString readonly dispid 290;
    property StartDate: TDateTime readonly dispid 291;
    property EndDate: TDateTime readonly dispid 292;
    property StartNumber: Integer readonly dispid 293;
    property EndNumber: Integer readonly dispid 294;
    property ReportDate: TDateTime readonly dispid 295;
    property ModelName: WideString readonly dispid 296;
    property Manufacturer: WideString readonly dispid 297;
    property FirmwareVersion: WideString readonly dispid 298;
    property TaxName: WideString readonly dispid 299;
    property TaxDate: TDateTime readonly dispid 300;
    property CounterCount: Integer readonly dispid 301;
    property RewritesRemain: Integer readonly dispid 302;
    property DaysRemain: Integer readonly dispid 303;
    property LastFiscalReport: Integer readonly dispid 304;
    property LastDayClosing: Integer readonly dispid 305;
    property DayDate: TDateTime readonly dispid 306;
    property LastDocOper: TxMercOperType readonly dispid 307;
    property LastDocNumber: Integer readonly dispid 308;
    property LastRecNumber: Integer readonly dispid 309;
    property LastDocType: TxMercOperType readonly dispid 310;
    property LastDocSum: Currency readonly dispid 311;
    property LastDocDate: TDateTime readonly dispid 312;
    property RetryOperation: WordBool dispid 313;
    property ErrCode: Integer readonly dispid 314;
    property ErrCodeEx: Integer readonly dispid 315;
    property ErrMessage: WideString readonly dispid 316;
    function CheckEcrStatus(Flag: Integer): Integer; dispid 317;
    function CheckDevStatus(Flag: Integer): Integer; dispid 318;
    property EcrHour: Integer readonly dispid 319;
    property EcrMin: Integer readonly dispid 320;
    property ReportHour: Integer readonly dispid 321;
    property ReportMin: Integer readonly dispid 322;
    property DayHour: Integer readonly dispid 323;
    property DayMin: Integer readonly dispid 324;
    property LastDocHour: Integer readonly dispid 325;
    property LastDocMin: Integer readonly dispid 326;
    procedure AddGraphicHeader(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 327;
    procedure SetProtocol(Protocol: TxMercProtocol); dispid 328;
    procedure SetPrinterTimeout(Timeout: Integer); dispid 329;
    procedure SetDisplayTimeout(Timeout: Integer); dispid 330;
    procedure SetPrinterContrast(Contrast: Integer); dispid 331;
    procedure SetLeading(Leading: Integer); dispid 332;
    procedure SetCutterDisabled(Disabled: WordBool); dispid 333;
    procedure SetNarrowPaper(Narrow: WordBool); dispid 334;
    function QueryPrinterTimeout: Integer; dispid 335;
    function QueryDisplayTimeout: Integer; dispid 336;
    function QueryPrinterContrast: Integer; dispid 337;
    function QueryLeading: Integer; dispid 338;
    procedure EnableGraphicHeader(Width: Integer; Height: Integer; const Data: WideString); dispid 339;
    procedure DisableGraphicHeader; dispid 340;
    procedure AddLicence(LicType: TxMercLicenceType; const Licence: WideString); dispid 341;
    function XReport(Flags: Integer): Integer; dispid 342;
    function XReportByDep(DepartNum: Integer; Flags: Integer): Integer; dispid 343;
    function XReportByOper(OperNum: Integer; Flags: Integer): Integer; dispid 344;
    function QueryHeaderAlignment: WordBool; dispid 345;
    function QueryOperNumber: Integer; dispid 346;
    function QueryOperName(OperNum: Integer): WideString; dispid 347;
    procedure SetHeaderAlignment(Aligned: WordBool); dispid 348;
    procedure TestConnection; dispid 349;
    property VersionNumber: Integer readonly dispid 350;
    property BuildNumber: Integer readonly dispid 351;
    property Version: WideString dispid 352;
  end;

// *********************************************************************//
// Interface: IMercuryFPrtX6
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {44595440-34C5-4FCA-A3BE-154BD980C7BA}
// *********************************************************************//
  IMercuryFPrtX6 = interface(IMercuryFPrtX5)
    ['{44595440-34C5-4FCA-A3BE-154BD980C7BA}']
    function QueryParameterBool(ParamCode: Integer): WordBool; safecall;
    function QueryParameterInt(ParamCode: Integer): Integer; safecall;
    procedure SetParameterBool(ParamCode: Integer; ParamValue: WordBool); safecall;
    procedure SetParameterInt(ParamCode: Integer; ParamValue: Integer); safecall;
  end;

// *********************************************************************//
// DispIntf:  IMercuryFPrtX6Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {44595440-34C5-4FCA-A3BE-154BD980C7BA}
// *********************************************************************//
  IMercuryFPrtX6Disp = dispinterface
    ['{44595440-34C5-4FCA-A3BE-154BD980C7BA}']
    function QueryParameterBool(ParamCode: Integer): WordBool; dispid 801;
    function QueryParameterInt(ParamCode: Integer): Integer; dispid 802;
    procedure SetParameterBool(ParamCode: Integer; ParamValue: WordBool); dispid 803;
    procedure SetParameterInt(ParamCode: Integer; ParamValue: Integer); dispid 804;
    procedure WriteGraphic(Number: Integer; Width: Integer; Height: Integer; const Data: WideString); dispid 701;
    procedure PrintGraphic(Width: Integer; Height: Integer; const Data: WideString); dispid 702;
    procedure AddRegNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 601;
    procedure EKLZActivate; dispid 401;
    procedure EKLZActivationReport; dispid 402;
    procedure EKLZDayReport(DayNumber: Integer); dispid 403;
    procedure EKLZReportByNum(IsFull: WordBool; AStartNum: Integer; AEndNum: Integer); dispid 404;
    procedure EKLZReportByDate(IsFull: WordBool; AStartDate: TDateTime; AEndDate: TDateTime); dispid 405;
    procedure EKLZDocByNum(Number: Integer); dispid 406;
    procedure EKLZControlByNum(DayNumber: Integer); dispid 407;
    procedure EKLZCloseArchive; dispid 408;
    procedure EKLZQueryStatus; dispid 409;
    function QueryPaperJournal: WordBool; dispid 410;
    procedure SetPaperJournal(PaperJournal: WordBool); dispid 411;
    property EKLZSupported: WordBool readonly dispid 412;
    property EKLZActivated: WordBool readonly dispid 413;
    property EKLZOper: TxMercOperType readonly dispid 414;
    property EKLZArchiving: WordBool readonly dispid 415;
    property EKLZReporting: WordBool readonly dispid 416;
    property EKLZDayOpened: WordBool readonly dispid 417;
    property EKLZFatalError: WordBool readonly dispid 418;
    property EKLZAttention: WordBool readonly dispid 419;
    function QueryFullJournal: WordBool; dispid 501;
    procedure SetFullJournal(FullJournal: WordBool); dispid 502;
    procedure AddEKLZData(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 503;
    property LastBuyingSum: Currency readonly dispid 504;
    function QueryAutocut: WordBool; dispid 353;
    procedure SetAutocut(Autocut: WordBool); dispid 354;
    function QueryEconomicMode: WordBool; dispid 355;
    procedure SetEconomicMode(EconomicMode: WordBool); dispid 356;
    property EcrSubVersion: Integer readonly dispid 357;
    property BorderSize: Integer dispid 1001;
    property ShowState: WordBool dispid 1002;
    property Enabled: WordBool dispid -514;
    procedure AboutBox; dispid -552;
    procedure Open; dispid 201;
    procedure Close(ForceAbort: WordBool); dispid 202;
    procedure OpenReceipt(Oper: TxMercOperType); dispid 203;
    procedure AddReceiptItem(const Desc: WideString; Price: Currency; ItemIsTare: WordBool; 
                             Department: Integer; Code: Integer; Adjustment: Integer; 
                             Quantity: Integer; QuantityPrec: Integer; TaxIndex: Integer; 
                             const UnitName: WideString; Flags: Integer); dispid 204;
    procedure CancelReceipt; dispid 205;
    procedure CloseReceipt(const Account: WideString; PayType: TxMercPayType; PayCash: Currency; 
                           PayCashless: Currency; const PayInfo: WideString; CopiesNum: Integer; 
                           OperInfo: TxMercOperInfo); dispid 206;
    procedure OpenCustomDoc(UseForm: WordBool; Oper: TxMercOperType); dispid 207;
    procedure CancelCustomDoc; dispid 208;
    procedure CloseCustomDoc(PayType: TxMercPayType; Flags: Integer; HCopiesNum: Integer; 
                             VCopiesNum: Integer; VOrigOffset: Integer; HCopyOffset: Integer; 
                             VCopyOffset: Integer; FiscalCopy: Integer); dispid 209;
    procedure OpenFiscalDoc(Oper: TxMercOperType); dispid 210;
    procedure CancelFiscalDoc(BufferOnly: WordBool); dispid 211;
    procedure PrintFiscalDocBuffer; dispid 212;
    procedure CloseFiscalDoc; dispid 213;
    procedure CopyFiscalDoc; dispid 214;
    procedure AddSerialNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 215;
    procedure AddHeaderLine(LineNum: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 216;
    procedure AddDateTime(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 217;
    procedure AddOperInfo(OperInfo: TxMercOperInfo; Flags: Integer; HOffset: Integer; 
                          VOffset: Integer); dispid 218;
    procedure AddDocNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 219;
    procedure AddReceiptNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 220;
    procedure AddAccount(const Account: WideString; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 221;
    procedure AddTaxPayerNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 222;
    procedure AddItem(ItemType: TxMercItemType; Price: Currency; ItemIsTare: WordBool; 
                      Department: Integer; Code: Integer; Adjustment: Integer; Quantity: Integer; 
                      QuantityPrec: Integer; TaxIndex: Integer; const UnitName: WideString; 
                      Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 223;
    procedure AddDocPercentAdj(Value: Integer; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                               VOffset: Integer; RightOffset: Integer); dispid 224;
    procedure AddDocAmountAdj(Value: Currency; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                              VOffset: Integer; RightOffset: Integer); dispid 225;
    procedure AddTotal(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 226;
    procedure AddPay(PayType: TxMercPayType; PayCash: Currency; PayCashless: Currency; 
                     const PayInfo: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                     RightOffset: Integer); dispid 227;
    procedure AddChange(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 228;
    procedure AddTaxSum(TaxIndex: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                        RightOffset: Integer); dispid 229;
    procedure AddFiscalSign(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 230;
    procedure AddBarcode(Mask1: Integer; Mask2: Integer; Mask3: Integer; Mask4: Integer; 
                         Mask5: Integer; DoubleDensity: WordBool; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 231;
    procedure AddCustom(const Text: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 232;
    procedure RepeatOperation; dispid 233;
    procedure OpenDay(OperNum: Integer; const OperName: WideString; FullJournal: WordBool; 
                      AProtocol: TxMercProtocol); dispid 234;
    function ZReport(Flags: Integer): Integer; dispid 235;
    function FiscalRewrite(const InspPswd: WideString; const RegNum: WideString; 
                           const TaxPayerNum: WideString; const NewInspPswd: WideString): Integer; dispid 236;
    function FiscalReportByNum(const InspPswd: WideString; PrintFull: WordBool; AStartNum: Integer; 
                               AEndNum: Integer): Integer; dispid 237;
    function FiscalReportByDate(const InspPswd: WideString; PrintFull: WordBool; 
                                AStartDate: TDateTime; AEndDate: TDateTime): Integer; dispid 238;
    function FiscalReportAll(const InspPswd: WideString): Integer; dispid 239;
    procedure FeedAndCut(LineCount: Integer; CutAfterFeed: WordBool); dispid 240;
    procedure PrintNonFiscal(const Data: WideString; OpenDoc: WordBool; CloseDoc: WordBool); dispid 241;
    procedure ShowDisplay(const Data: WideString; OpenMode: WordBool; CloseMode: WordBool); dispid 242;
    procedure SetDisplayBaudRate(BaudRate: Integer); dispid 243;
    procedure ExternalPulse(Channel: Integer; TimeOn: Integer; TimeOff: Integer; Count: Integer); dispid 244;
    procedure QueryDevExStatus; dispid 245;
    procedure QueryFirmwareInfo; dispid 246;
    procedure SetHeader(const Line1: WideString; const Line2: WideString; const Line3: WideString; 
                        const Line4: WideString); dispid 247;
    procedure SetTax(Index: Integer; const TaxName: WideString; TaxRate: Integer); dispid 248;
    function QueryTax(Index: Integer): Integer; dispid 249;
    function QueryCounter(Index: Integer; NoRequest: WordBool): Currency; dispid 250;
    procedure SynchronizeEcrDateTime; dispid 251;
    procedure QueryResourceInfo(PrintInfo: WordBool); dispid 252;
    procedure QueryLastDocInfo; dispid 253;
    procedure SetParameters(Protocol: TxMercProtocol; PrnTimeout: Integer); dispid 254;
    property EcrModel: TxMercEcrModel readonly dispid 255;
    property EcrVersion: Integer readonly dispid 256;
    property Generation: Integer readonly dispid 257;
    property Protocol: TxMercProtocol readonly dispid 258;
    property EcrStatus: Integer readonly dispid 259;
    property EcrStatusMask: Integer readonly dispid 260;
    property DevStatus: Integer readonly dispid 261;
    property DevStatusMask: Integer readonly dispid 262;
    property DocStatus: TxMercDocStatus readonly dispid 263;
    property CurrentOper: TxMercOperType readonly dispid 264;
    property PortNum: Integer dispid 265;
    property BaudRate: Integer dispid 266;
    property Password: WideString dispid 267;
    property InternalTimeout: Integer dispid 268;
    property ExternalTimeout: Integer dispid 269;
    function QueryHeaderLine(LineNum: Integer): WideString; dispid 270;
    function QuerySerialNumber: WideString; dispid 271;
    procedure SetSerialNumber(const Value: WideString); dispid 272;
    function QueryTaxPayerNumber: WideString; dispid 273;
    function QueryRegNumber: WideString; dispid 274;
    function QueryEcrDateTime: TDateTime; dispid 275;
    function QueryDepartName(DepartNum: Integer): WideString; dispid 276;
    procedure SetDepartName(DepartNum: Integer; const Value: WideString); dispid 277;
    function QueryTitle(TitleNum: Integer): WideString; dispid 278;
    procedure SetTitle(TitleNum: Integer; const Value: WideString); dispid 279;
    property Active: WordBool dispid 280;
    property ConnState: TxMercConnState readonly dispid 281;
    property SaleSum: Currency readonly dispid 282;
    property BuyingSum: Currency readonly dispid 283;
    property SerialNumber: WideString readonly dispid 284;
    property RegNumber: WideString readonly dispid 285;
    property TaxPayerNumber: WideString readonly dispid 286;
    property HeaderLine1: WideString readonly dispid 287;
    property HeaderLine2: WideString readonly dispid 288;
    property HeaderLine3: WideString readonly dispid 289;
    property HeaderLine4: WideString readonly dispid 290;
    property StartDate: TDateTime readonly dispid 291;
    property EndDate: TDateTime readonly dispid 292;
    property StartNumber: Integer readonly dispid 293;
    property EndNumber: Integer readonly dispid 294;
    property ReportDate: TDateTime readonly dispid 295;
    property ModelName: WideString readonly dispid 296;
    property Manufacturer: WideString readonly dispid 297;
    property FirmwareVersion: WideString readonly dispid 298;
    property TaxName: WideString readonly dispid 299;
    property TaxDate: TDateTime readonly dispid 300;
    property CounterCount: Integer readonly dispid 301;
    property RewritesRemain: Integer readonly dispid 302;
    property DaysRemain: Integer readonly dispid 303;
    property LastFiscalReport: Integer readonly dispid 304;
    property LastDayClosing: Integer readonly dispid 305;
    property DayDate: TDateTime readonly dispid 306;
    property LastDocOper: TxMercOperType readonly dispid 307;
    property LastDocNumber: Integer readonly dispid 308;
    property LastRecNumber: Integer readonly dispid 309;
    property LastDocType: TxMercOperType readonly dispid 310;
    property LastDocSum: Currency readonly dispid 311;
    property LastDocDate: TDateTime readonly dispid 312;
    property RetryOperation: WordBool dispid 313;
    property ErrCode: Integer readonly dispid 314;
    property ErrCodeEx: Integer readonly dispid 315;
    property ErrMessage: WideString readonly dispid 316;
    function CheckEcrStatus(Flag: Integer): Integer; dispid 317;
    function CheckDevStatus(Flag: Integer): Integer; dispid 318;
    property EcrHour: Integer readonly dispid 319;
    property EcrMin: Integer readonly dispid 320;
    property ReportHour: Integer readonly dispid 321;
    property ReportMin: Integer readonly dispid 322;
    property DayHour: Integer readonly dispid 323;
    property DayMin: Integer readonly dispid 324;
    property LastDocHour: Integer readonly dispid 325;
    property LastDocMin: Integer readonly dispid 326;
    procedure AddGraphicHeader(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 327;
    procedure SetProtocol(Protocol: TxMercProtocol); dispid 328;
    procedure SetPrinterTimeout(Timeout: Integer); dispid 329;
    procedure SetDisplayTimeout(Timeout: Integer); dispid 330;
    procedure SetPrinterContrast(Contrast: Integer); dispid 331;
    procedure SetLeading(Leading: Integer); dispid 332;
    procedure SetCutterDisabled(Disabled: WordBool); dispid 333;
    procedure SetNarrowPaper(Narrow: WordBool); dispid 334;
    function QueryPrinterTimeout: Integer; dispid 335;
    function QueryDisplayTimeout: Integer; dispid 336;
    function QueryPrinterContrast: Integer; dispid 337;
    function QueryLeading: Integer; dispid 338;
    procedure EnableGraphicHeader(Width: Integer; Height: Integer; const Data: WideString); dispid 339;
    procedure DisableGraphicHeader; dispid 340;
    procedure AddLicence(LicType: TxMercLicenceType; const Licence: WideString); dispid 341;
    function XReport(Flags: Integer): Integer; dispid 342;
    function XReportByDep(DepartNum: Integer; Flags: Integer): Integer; dispid 343;
    function XReportByOper(OperNum: Integer; Flags: Integer): Integer; dispid 344;
    function QueryHeaderAlignment: WordBool; dispid 345;
    function QueryOperNumber: Integer; dispid 346;
    function QueryOperName(OperNum: Integer): WideString; dispid 347;
    procedure SetHeaderAlignment(Aligned: WordBool); dispid 348;
    procedure TestConnection; dispid 349;
    property VersionNumber: Integer readonly dispid 350;
    property BuildNumber: Integer readonly dispid 351;
    property Version: WideString dispid 352;
  end;

// *********************************************************************//
// Interface: IMercuryFPrt7
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9549BA81-6015-4DA1-996E-53347CD57ABE}
// *********************************************************************//
  IMercuryFPrt7 = interface(IMercuryFPrt6)
    ['{9549BA81-6015-4DA1-996E-53347CD57ABE}']
    procedure PrintHeader; safecall;
  end;

// *********************************************************************//
// DispIntf:  IMercuryFPrt7Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9549BA81-6015-4DA1-996E-53347CD57ABE}
// *********************************************************************//
  IMercuryFPrt7Disp = dispinterface
    ['{9549BA81-6015-4DA1-996E-53347CD57ABE}']
    procedure PrintHeader; dispid 801;
    function QueryParameterBool(ParamCode: Integer): WordBool; dispid 701;
    function QueryParameterInt(ParamCode: Integer): Integer; dispid 702;
    procedure SetParameterBool(ParamCode: Integer; ParamValue: WordBool); dispid 703;
    procedure SetParameterInt(ParamCode: Integer; ParamValue: Integer); dispid 704;
    procedure WriteGraphic(Number: Integer; Width: Integer; Height: Integer; const Data: WideString); dispid 601;
    procedure PrintGraphic(Width: Integer; Height: Integer; const Data: WideString); dispid 602;
    procedure AddRegNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 501;
    procedure EKLZActivate; dispid 401;
    procedure EKLZActivationReport; dispid 402;
    procedure EKLZDayReport(DayNumber: Integer); dispid 403;
    procedure EKLZReportByNum(IsFull: WordBool; AStartNum: Integer; AEndNum: Integer); dispid 404;
    procedure EKLZReportByDate(IsFull: WordBool; AStartDate: TDateTime; AEndDate: TDateTime); dispid 405;
    procedure EKLZDocByNum(Number: Integer); dispid 406;
    procedure EKLZControlByNum(DayNumber: Integer); dispid 407;
    procedure EKLZCloseArchive; dispid 408;
    procedure EKLZQueryStatus; dispid 409;
    function QueryPaperJournal: WordBool; dispid 410;
    procedure SetPaperJournal(PaperJournal: WordBool); dispid 411;
    property EKLZSupported: WordBool readonly dispid 412;
    property EKLZActivated: WordBool readonly dispid 413;
    property EKLZOper: TxMercOperType readonly dispid 414;
    property EKLZArchiving: WordBool readonly dispid 415;
    property EKLZReporting: WordBool readonly dispid 416;
    property EKLZDayOpened: WordBool readonly dispid 417;
    property EKLZFatalError: WordBool readonly dispid 418;
    property EKLZAttention: WordBool readonly dispid 419;
    property LastRepNumber: Integer readonly dispid 420;
    property EKLZRest: Integer readonly dispid 421;
    function QueryFullJournal: WordBool; dispid 422;
    procedure SetFullJournal(FullJournal: WordBool); dispid 423;
    procedure AddEKLZData(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 424;
    property LastBuyingSum: Currency readonly dispid 425;
    function QueryAutocut: WordBool; dispid 353;
    procedure SetAutocut(Autocut: WordBool); dispid 354;
    function QueryEconomicMode: WordBool; dispid 355;
    procedure SetEconomicMode(EconomicMode: WordBool); dispid 356;
    property EcrSubVersion: Integer readonly dispid 357;
    procedure Open; dispid 201;
    procedure Close(ForceAbort: WordBool); dispid 202;
    procedure OpenReceipt(Oper: TxMercOperType); dispid 203;
    procedure AddReceiptItem(const Desc: WideString; Price: Currency; ItemIsTare: WordBool; 
                             Department: Integer; Code: Integer; Adjustment: Integer; 
                             Quantity: Integer; QuantityPrec: Integer; TaxIndex: Integer; 
                             const UnitName: WideString; Flags: Integer); dispid 204;
    procedure CancelReceipt; dispid 205;
    procedure CloseReceipt(const Account: WideString; PayType: TxMercPayType; PayCash: Currency; 
                           PayCashless: Currency; const PayInfo: WideString; CopiesNum: Integer; 
                           OperInfo: TxMercOperInfo); dispid 206;
    procedure OpenCustomDoc(UseForm: WordBool; Oper: TxMercOperType); dispid 207;
    procedure CancelCustomDoc; dispid 208;
    procedure CloseCustomDoc(PayType: TxMercPayType; Flags: Integer; HCopiesNum: Integer; 
                             VCopiesNum: Integer; VOrigOffset: Integer; HCopyOffset: Integer; 
                             VCopyOffset: Integer; FiscalCopy: Integer); dispid 209;
    procedure OpenFiscalDoc(Oper: TxMercOperType); dispid 210;
    procedure CancelFiscalDoc(BufferOnly: WordBool); dispid 211;
    procedure PrintFiscalDocBuffer; dispid 212;
    procedure CloseFiscalDoc; dispid 213;
    procedure CopyFiscalDoc; dispid 214;
    procedure AddSerialNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 215;
    procedure AddHeaderLine(LineNum: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 216;
    procedure AddDateTime(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 217;
    procedure AddOperInfo(OperInfo: TxMercOperInfo; Flags: Integer; HOffset: Integer; 
                          VOffset: Integer); dispid 218;
    procedure AddDocNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 219;
    procedure AddReceiptNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 220;
    procedure AddAccount(const Account: WideString; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 221;
    procedure AddTaxPayerNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 222;
    procedure AddItem(ItemType: TxMercItemType; Price: Currency; ItemIsTare: WordBool; 
                      Department: Integer; Code: Integer; Adjustment: Integer; Quantity: Integer; 
                      QuantityPrec: Integer; TaxIndex: Integer; const UnitName: WideString; 
                      Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 223;
    procedure AddDocPercentAdj(Value: Integer; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                               VOffset: Integer; RightOffset: Integer); dispid 224;
    procedure AddDocAmountAdj(Value: Currency; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                              VOffset: Integer; RightOffset: Integer); dispid 225;
    procedure AddTotal(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 226;
    procedure AddPay(PayType: TxMercPayType; PayCash: Currency; PayCashless: Currency; 
                     const PayInfo: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                     RightOffset: Integer); dispid 227;
    procedure AddChange(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 228;
    procedure AddTaxSum(TaxIndex: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                        RightOffset: Integer); dispid 229;
    procedure AddFiscalSign(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 230;
    procedure AddBarcode(Mask1: Integer; Mask2: Integer; Mask3: Integer; Mask4: Integer; 
                         Mask5: Integer; DoubleDensity: WordBool; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 231;
    procedure AddCustom(const Text: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 232;
    procedure RepeatOperation; dispid 233;
    procedure OpenDay(OperNum: Integer; const OperName: WideString; FullJournal: WordBool; 
                      AProtocol: TxMercProtocol); dispid 234;
    function ZReport(Flags: Integer): Integer; dispid 235;
    function FiscalRewrite(const InspPswd: WideString; const RegNum: WideString; 
                           const TaxPayerNum: WideString; const NewInspPswd: WideString): Integer; dispid 236;
    function FiscalReportByNum(const InspPswd: WideString; PrintFull: WordBool; AStartNum: Integer; 
                               AEndNum: Integer): Integer; dispid 237;
    function FiscalReportByDate(const InspPswd: WideString; PrintFull: WordBool; 
                                AStartDate: TDateTime; AEndDate: TDateTime): Integer; dispid 238;
    function FiscalReportAll(const InspPswd: WideString): Integer; dispid 239;
    procedure FeedAndCut(LineCount: Integer; CutAfterFeed: WordBool); dispid 240;
    procedure PrintNonFiscal(const Data: WideString; OpenDoc: WordBool; CloseDoc: WordBool); dispid 241;
    procedure ShowDisplay(const Data: WideString; OpenMode: WordBool; CloseMode: WordBool); dispid 242;
    procedure SetDisplayBaudRate(BaudRate: Integer); dispid 243;
    procedure ExternalPulse(Channel: Integer; TimeOn: Integer; TimeOff: Integer; Count: Integer); dispid 244;
    procedure QueryDevExStatus; dispid 245;
    procedure QueryFirmwareInfo; dispid 246;
    procedure SetHeader(const Line1: WideString; const Line2: WideString; const Line3: WideString; 
                        const Line4: WideString); dispid 247;
    procedure SetTax(Index: Integer; const TaxName: WideString; TaxRate: Integer); dispid 248;
    function QueryTax(Index: Integer): Integer; dispid 249;
    function QueryCounter(Index: Integer; NoRequest: WordBool): Currency; dispid 250;
    procedure SynchronizeEcrDateTime; dispid 251;
    procedure QueryResourceInfo(PrintInfo: WordBool); dispid 252;
    procedure QueryLastDocInfo; dispid 253;
    procedure SetParameters(Protocol: TxMercProtocol; PrnTimeout: Integer); dispid 254;
    property EcrModel: TxMercEcrModel readonly dispid 255;
    property EcrVersion: Integer readonly dispid 256;
    property Generation: Integer readonly dispid 257;
    property Protocol: TxMercProtocol readonly dispid 258;
    property EcrStatus: Integer readonly dispid 259;
    property EcrStatusMask: Integer readonly dispid 260;
    property DevStatus: Integer readonly dispid 261;
    property DevStatusMask: Integer readonly dispid 262;
    property DocStatus: TxMercDocStatus readonly dispid 263;
    property CurrentOper: TxMercOperType readonly dispid 264;
    property PortNum: Integer dispid 265;
    property BaudRate: Integer dispid 266;
    property Password: WideString dispid 267;
    property InternalTimeout: Integer dispid 268;
    property ExternalTimeout: Integer dispid 269;
    function QueryHeaderLine(LineNum: Integer): WideString; dispid 270;
    function QuerySerialNumber: WideString; dispid 271;
    procedure SetSerialNumber(const Value: WideString); dispid 272;
    function QueryTaxPayerNumber: WideString; dispid 273;
    function QueryRegNumber: WideString; dispid 274;
    function QueryEcrDateTime: TDateTime; dispid 275;
    function QueryDepartName(DepartNum: Integer): WideString; dispid 276;
    procedure SetDepartName(DepartNum: Integer; const Value: WideString); dispid 277;
    function QueryTitle(TitleNum: Integer): WideString; dispid 278;
    procedure SetTitle(TitleNum: Integer; const Value: WideString); dispid 279;
    property Active: WordBool dispid 280;
    property ConnState: TxMercConnState readonly dispid 281;
    property SaleSum: Currency readonly dispid 282;
    property BuyingSum: Currency readonly dispid 283;
    property SerialNumber: WideString readonly dispid 284;
    property RegNumber: WideString readonly dispid 285;
    property TaxPayerNumber: WideString readonly dispid 286;
    property HeaderLine1: WideString readonly dispid 287;
    property HeaderLine2: WideString readonly dispid 288;
    property HeaderLine3: WideString readonly dispid 289;
    property HeaderLine4: WideString readonly dispid 290;
    property StartDate: TDateTime readonly dispid 291;
    property EndDate: TDateTime readonly dispid 292;
    property StartNumber: Integer readonly dispid 293;
    property EndNumber: Integer readonly dispid 294;
    property ReportDate: TDateTime readonly dispid 295;
    property ModelName: WideString readonly dispid 296;
    property Manufacturer: WideString readonly dispid 297;
    property FirmwareVersion: WideString readonly dispid 298;
    property TaxName: WideString readonly dispid 299;
    property TaxDate: TDateTime readonly dispid 300;
    property CounterCount: Integer readonly dispid 301;
    property RewritesRemain: Integer readonly dispid 302;
    property DaysRemain: Integer readonly dispid 303;
    property LastFiscalReport: Integer readonly dispid 304;
    property LastDayClosing: Integer readonly dispid 305;
    property DayDate: TDateTime readonly dispid 306;
    property LastDocOper: TxMercOperType readonly dispid 307;
    property LastDocNumber: Integer readonly dispid 308;
    property LastRecNumber: Integer readonly dispid 309;
    property LastDocType: TxMercOperType readonly dispid 310;
    property LastDocSum: Currency readonly dispid 311;
    property LastDocDate: TDateTime readonly dispid 312;
    property RetryOperation: WordBool dispid 313;
    property ErrCode: Integer readonly dispid 314;
    property ErrCodeEx: Integer readonly dispid 315;
    property ErrMessage: WideString readonly dispid 316;
    function CheckEcrStatus(Flag: Integer): Integer; dispid 317;
    function CheckDevStatus(Flag: Integer): Integer; dispid 318;
    property EcrHour: Integer readonly dispid 319;
    property EcrMin: Integer readonly dispid 320;
    property ReportHour: Integer readonly dispid 321;
    property ReportMin: Integer readonly dispid 322;
    property DayHour: Integer readonly dispid 323;
    property DayMin: Integer readonly dispid 324;
    property LastDocHour: Integer readonly dispid 325;
    property LastDocMin: Integer readonly dispid 326;
    procedure AddGraphicHeader(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 327;
    procedure SetProtocol(Protocol: TxMercProtocol); dispid 328;
    procedure SetPrinterTimeout(Timeout: Integer); dispid 329;
    procedure SetDisplayTimeout(Timeout: Integer); dispid 330;
    procedure SetPrinterContrast(Contrast: Integer); dispid 331;
    procedure SetLeading(Leading: Integer); dispid 332;
    procedure SetCutterDisabled(Disabled: WordBool); dispid 333;
    procedure SetNarrowPaper(Narrow: WordBool); dispid 334;
    function QueryPrinterTimeout: Integer; dispid 335;
    function QueryDisplayTimeout: Integer; dispid 336;
    function QueryPrinterContrast: Integer; dispid 337;
    function QueryLeading: Integer; dispid 338;
    procedure EnableGraphicHeader(Width: Integer; Height: Integer; const Data: WideString); dispid 339;
    procedure DisableGraphicHeader; dispid 340;
    procedure AddLicence(LicType: TxMercLicenceType; const Licence: WideString); dispid 341;
    function XReport(Flags: Integer): Integer; dispid 342;
    function XReportByDep(DepartNum: Integer; Flags: Integer): Integer; dispid 343;
    function XReportByOper(OperNum: Integer; Flags: Integer): Integer; dispid 344;
    function QueryHeaderAlignment: WordBool; dispid 345;
    function QueryOperNumber: Integer; dispid 346;
    function QueryOperName(OperNum: Integer): WideString; dispid 347;
    procedure SetHeaderAlignment(Aligned: WordBool); dispid 348;
    procedure TestConnection; dispid 349;
    property VersionNumber: Integer readonly dispid 350;
    property BuildNumber: Integer readonly dispid 351;
    property Version: WideString dispid 352;
  end;

// *********************************************************************//
// Interface: IMercuryFPrtX7
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3D5A10AD-307C-49D4-A59B-70FFEE159CB2}
// *********************************************************************//
  IMercuryFPrtX7 = interface(IMercuryFPrtX6)
    ['{3D5A10AD-307C-49D4-A59B-70FFEE159CB2}']
    procedure PrintHeader; safecall;
  end;

// *********************************************************************//
// DispIntf:  IMercuryFPrtX7Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3D5A10AD-307C-49D4-A59B-70FFEE159CB2}
// *********************************************************************//
  IMercuryFPrtX7Disp = dispinterface
    ['{3D5A10AD-307C-49D4-A59B-70FFEE159CB2}']
    procedure PrintHeader; dispid 901;
    function QueryParameterBool(ParamCode: Integer): WordBool; dispid 801;
    function QueryParameterInt(ParamCode: Integer): Integer; dispid 802;
    procedure SetParameterBool(ParamCode: Integer; ParamValue: WordBool); dispid 803;
    procedure SetParameterInt(ParamCode: Integer; ParamValue: Integer); dispid 804;
    procedure WriteGraphic(Number: Integer; Width: Integer; Height: Integer; const Data: WideString); dispid 701;
    procedure PrintGraphic(Width: Integer; Height: Integer; const Data: WideString); dispid 702;
    procedure AddRegNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 601;
    procedure EKLZActivate; dispid 401;
    procedure EKLZActivationReport; dispid 402;
    procedure EKLZDayReport(DayNumber: Integer); dispid 403;
    procedure EKLZReportByNum(IsFull: WordBool; AStartNum: Integer; AEndNum: Integer); dispid 404;
    procedure EKLZReportByDate(IsFull: WordBool; AStartDate: TDateTime; AEndDate: TDateTime); dispid 405;
    procedure EKLZDocByNum(Number: Integer); dispid 406;
    procedure EKLZControlByNum(DayNumber: Integer); dispid 407;
    procedure EKLZCloseArchive; dispid 408;
    procedure EKLZQueryStatus; dispid 409;
    function QueryPaperJournal: WordBool; dispid 410;
    procedure SetPaperJournal(PaperJournal: WordBool); dispid 411;
    property EKLZSupported: WordBool readonly dispid 412;
    property EKLZActivated: WordBool readonly dispid 413;
    property EKLZOper: TxMercOperType readonly dispid 414;
    property EKLZArchiving: WordBool readonly dispid 415;
    property EKLZReporting: WordBool readonly dispid 416;
    property EKLZDayOpened: WordBool readonly dispid 417;
    property EKLZFatalError: WordBool readonly dispid 418;
    property EKLZAttention: WordBool readonly dispid 419;
    function QueryFullJournal: WordBool; dispid 501;
    procedure SetFullJournal(FullJournal: WordBool); dispid 502;
    procedure AddEKLZData(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 503;
    property LastBuyingSum: Currency readonly dispid 504;
    function QueryAutocut: WordBool; dispid 353;
    procedure SetAutocut(Autocut: WordBool); dispid 354;
    function QueryEconomicMode: WordBool; dispid 355;
    procedure SetEconomicMode(EconomicMode: WordBool); dispid 356;
    property EcrSubVersion: Integer readonly dispid 357;
    property BorderSize: Integer dispid 1001;
    property ShowState: WordBool dispid 1002;
    property Enabled: WordBool dispid -514;
    procedure AboutBox; dispid -552;
    procedure Open; dispid 201;
    procedure Close(ForceAbort: WordBool); dispid 202;
    procedure OpenReceipt(Oper: TxMercOperType); dispid 203;
    procedure AddReceiptItem(const Desc: WideString; Price: Currency; ItemIsTare: WordBool; 
                             Department: Integer; Code: Integer; Adjustment: Integer; 
                             Quantity: Integer; QuantityPrec: Integer; TaxIndex: Integer; 
                             const UnitName: WideString; Flags: Integer); dispid 204;
    procedure CancelReceipt; dispid 205;
    procedure CloseReceipt(const Account: WideString; PayType: TxMercPayType; PayCash: Currency; 
                           PayCashless: Currency; const PayInfo: WideString; CopiesNum: Integer; 
                           OperInfo: TxMercOperInfo); dispid 206;
    procedure OpenCustomDoc(UseForm: WordBool; Oper: TxMercOperType); dispid 207;
    procedure CancelCustomDoc; dispid 208;
    procedure CloseCustomDoc(PayType: TxMercPayType; Flags: Integer; HCopiesNum: Integer; 
                             VCopiesNum: Integer; VOrigOffset: Integer; HCopyOffset: Integer; 
                             VCopyOffset: Integer; FiscalCopy: Integer); dispid 209;
    procedure OpenFiscalDoc(Oper: TxMercOperType); dispid 210;
    procedure CancelFiscalDoc(BufferOnly: WordBool); dispid 211;
    procedure PrintFiscalDocBuffer; dispid 212;
    procedure CloseFiscalDoc; dispid 213;
    procedure CopyFiscalDoc; dispid 214;
    procedure AddSerialNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 215;
    procedure AddHeaderLine(LineNum: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 216;
    procedure AddDateTime(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 217;
    procedure AddOperInfo(OperInfo: TxMercOperInfo; Flags: Integer; HOffset: Integer; 
                          VOffset: Integer); dispid 218;
    procedure AddDocNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 219;
    procedure AddReceiptNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 220;
    procedure AddAccount(const Account: WideString; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 221;
    procedure AddTaxPayerNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 222;
    procedure AddItem(ItemType: TxMercItemType; Price: Currency; ItemIsTare: WordBool; 
                      Department: Integer; Code: Integer; Adjustment: Integer; Quantity: Integer; 
                      QuantityPrec: Integer; TaxIndex: Integer; const UnitName: WideString; 
                      Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 223;
    procedure AddDocPercentAdj(Value: Integer; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                               VOffset: Integer; RightOffset: Integer); dispid 224;
    procedure AddDocAmountAdj(Value: Currency; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                              VOffset: Integer; RightOffset: Integer); dispid 225;
    procedure AddTotal(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 226;
    procedure AddPay(PayType: TxMercPayType; PayCash: Currency; PayCashless: Currency; 
                     const PayInfo: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                     RightOffset: Integer); dispid 227;
    procedure AddChange(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 228;
    procedure AddTaxSum(TaxIndex: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                        RightOffset: Integer); dispid 229;
    procedure AddFiscalSign(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 230;
    procedure AddBarcode(Mask1: Integer; Mask2: Integer; Mask3: Integer; Mask4: Integer; 
                         Mask5: Integer; DoubleDensity: WordBool; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 231;
    procedure AddCustom(const Text: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 232;
    procedure RepeatOperation; dispid 233;
    procedure OpenDay(OperNum: Integer; const OperName: WideString; FullJournal: WordBool; 
                      AProtocol: TxMercProtocol); dispid 234;
    function ZReport(Flags: Integer): Integer; dispid 235;
    function FiscalRewrite(const InspPswd: WideString; const RegNum: WideString; 
                           const TaxPayerNum: WideString; const NewInspPswd: WideString): Integer; dispid 236;
    function FiscalReportByNum(const InspPswd: WideString; PrintFull: WordBool; AStartNum: Integer; 
                               AEndNum: Integer): Integer; dispid 237;
    function FiscalReportByDate(const InspPswd: WideString; PrintFull: WordBool; 
                                AStartDate: TDateTime; AEndDate: TDateTime): Integer; dispid 238;
    function FiscalReportAll(const InspPswd: WideString): Integer; dispid 239;
    procedure FeedAndCut(LineCount: Integer; CutAfterFeed: WordBool); dispid 240;
    procedure PrintNonFiscal(const Data: WideString; OpenDoc: WordBool; CloseDoc: WordBool); dispid 241;
    procedure ShowDisplay(const Data: WideString; OpenMode: WordBool; CloseMode: WordBool); dispid 242;
    procedure SetDisplayBaudRate(BaudRate: Integer); dispid 243;
    procedure ExternalPulse(Channel: Integer; TimeOn: Integer; TimeOff: Integer; Count: Integer); dispid 244;
    procedure QueryDevExStatus; dispid 245;
    procedure QueryFirmwareInfo; dispid 246;
    procedure SetHeader(const Line1: WideString; const Line2: WideString; const Line3: WideString; 
                        const Line4: WideString); dispid 247;
    procedure SetTax(Index: Integer; const TaxName: WideString; TaxRate: Integer); dispid 248;
    function QueryTax(Index: Integer): Integer; dispid 249;
    function QueryCounter(Index: Integer; NoRequest: WordBool): Currency; dispid 250;
    procedure SynchronizeEcrDateTime; dispid 251;
    procedure QueryResourceInfo(PrintInfo: WordBool); dispid 252;
    procedure QueryLastDocInfo; dispid 253;
    procedure SetParameters(Protocol: TxMercProtocol; PrnTimeout: Integer); dispid 254;
    property EcrModel: TxMercEcrModel readonly dispid 255;
    property EcrVersion: Integer readonly dispid 256;
    property Generation: Integer readonly dispid 257;
    property Protocol: TxMercProtocol readonly dispid 258;
    property EcrStatus: Integer readonly dispid 259;
    property EcrStatusMask: Integer readonly dispid 260;
    property DevStatus: Integer readonly dispid 261;
    property DevStatusMask: Integer readonly dispid 262;
    property DocStatus: TxMercDocStatus readonly dispid 263;
    property CurrentOper: TxMercOperType readonly dispid 264;
    property PortNum: Integer dispid 265;
    property BaudRate: Integer dispid 266;
    property Password: WideString dispid 267;
    property InternalTimeout: Integer dispid 268;
    property ExternalTimeout: Integer dispid 269;
    function QueryHeaderLine(LineNum: Integer): WideString; dispid 270;
    function QuerySerialNumber: WideString; dispid 271;
    procedure SetSerialNumber(const Value: WideString); dispid 272;
    function QueryTaxPayerNumber: WideString; dispid 273;
    function QueryRegNumber: WideString; dispid 274;
    function QueryEcrDateTime: TDateTime; dispid 275;
    function QueryDepartName(DepartNum: Integer): WideString; dispid 276;
    procedure SetDepartName(DepartNum: Integer; const Value: WideString); dispid 277;
    function QueryTitle(TitleNum: Integer): WideString; dispid 278;
    procedure SetTitle(TitleNum: Integer; const Value: WideString); dispid 279;
    property Active: WordBool dispid 280;
    property ConnState: TxMercConnState readonly dispid 281;
    property SaleSum: Currency readonly dispid 282;
    property BuyingSum: Currency readonly dispid 283;
    property SerialNumber: WideString readonly dispid 284;
    property RegNumber: WideString readonly dispid 285;
    property TaxPayerNumber: WideString readonly dispid 286;
    property HeaderLine1: WideString readonly dispid 287;
    property HeaderLine2: WideString readonly dispid 288;
    property HeaderLine3: WideString readonly dispid 289;
    property HeaderLine4: WideString readonly dispid 290;
    property StartDate: TDateTime readonly dispid 291;
    property EndDate: TDateTime readonly dispid 292;
    property StartNumber: Integer readonly dispid 293;
    property EndNumber: Integer readonly dispid 294;
    property ReportDate: TDateTime readonly dispid 295;
    property ModelName: WideString readonly dispid 296;
    property Manufacturer: WideString readonly dispid 297;
    property FirmwareVersion: WideString readonly dispid 298;
    property TaxName: WideString readonly dispid 299;
    property TaxDate: TDateTime readonly dispid 300;
    property CounterCount: Integer readonly dispid 301;
    property RewritesRemain: Integer readonly dispid 302;
    property DaysRemain: Integer readonly dispid 303;
    property LastFiscalReport: Integer readonly dispid 304;
    property LastDayClosing: Integer readonly dispid 305;
    property DayDate: TDateTime readonly dispid 306;
    property LastDocOper: TxMercOperType readonly dispid 307;
    property LastDocNumber: Integer readonly dispid 308;
    property LastRecNumber: Integer readonly dispid 309;
    property LastDocType: TxMercOperType readonly dispid 310;
    property LastDocSum: Currency readonly dispid 311;
    property LastDocDate: TDateTime readonly dispid 312;
    property RetryOperation: WordBool dispid 313;
    property ErrCode: Integer readonly dispid 314;
    property ErrCodeEx: Integer readonly dispid 315;
    property ErrMessage: WideString readonly dispid 316;
    function CheckEcrStatus(Flag: Integer): Integer; dispid 317;
    function CheckDevStatus(Flag: Integer): Integer; dispid 318;
    property EcrHour: Integer readonly dispid 319;
    property EcrMin: Integer readonly dispid 320;
    property ReportHour: Integer readonly dispid 321;
    property ReportMin: Integer readonly dispid 322;
    property DayHour: Integer readonly dispid 323;
    property DayMin: Integer readonly dispid 324;
    property LastDocHour: Integer readonly dispid 325;
    property LastDocMin: Integer readonly dispid 326;
    procedure AddGraphicHeader(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 327;
    procedure SetProtocol(Protocol: TxMercProtocol); dispid 328;
    procedure SetPrinterTimeout(Timeout: Integer); dispid 329;
    procedure SetDisplayTimeout(Timeout: Integer); dispid 330;
    procedure SetPrinterContrast(Contrast: Integer); dispid 331;
    procedure SetLeading(Leading: Integer); dispid 332;
    procedure SetCutterDisabled(Disabled: WordBool); dispid 333;
    procedure SetNarrowPaper(Narrow: WordBool); dispid 334;
    function QueryPrinterTimeout: Integer; dispid 335;
    function QueryDisplayTimeout: Integer; dispid 336;
    function QueryPrinterContrast: Integer; dispid 337;
    function QueryLeading: Integer; dispid 338;
    procedure EnableGraphicHeader(Width: Integer; Height: Integer; const Data: WideString); dispid 339;
    procedure DisableGraphicHeader; dispid 340;
    procedure AddLicence(LicType: TxMercLicenceType; const Licence: WideString); dispid 341;
    function XReport(Flags: Integer): Integer; dispid 342;
    function XReportByDep(DepartNum: Integer; Flags: Integer): Integer; dispid 343;
    function XReportByOper(OperNum: Integer; Flags: Integer): Integer; dispid 344;
    function QueryHeaderAlignment: WordBool; dispid 345;
    function QueryOperNumber: Integer; dispid 346;
    function QueryOperName(OperNum: Integer): WideString; dispid 347;
    procedure SetHeaderAlignment(Aligned: WordBool); dispid 348;
    procedure TestConnection; dispid 349;
    property VersionNumber: Integer readonly dispid 350;
    property BuildNumber: Integer readonly dispid 351;
    property Version: WideString dispid 352;
  end;

// *********************************************************************//
// Interface: IMercuryFPrt8
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9397BB3C-769E-47E2-8C0D-028A38B5D48F}
// *********************************************************************//
  IMercuryFPrt8 = interface(IMercuryFPrt7)
    ['{9397BB3C-769E-47E2-8C0D-028A38B5D48F}']
    procedure SetOperPassword(OperNum: Integer; const OperName: WideString; 
                              const OperPassword: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IMercuryFPrt8Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9397BB3C-769E-47E2-8C0D-028A38B5D48F}
// *********************************************************************//
  IMercuryFPrt8Disp = dispinterface
    ['{9397BB3C-769E-47E2-8C0D-028A38B5D48F}']
    procedure SetOperPassword(OperNum: Integer; const OperName: WideString; 
                              const OperPassword: WideString); dispid 901;
    procedure PrintHeader; dispid 801;
    function QueryParameterBool(ParamCode: Integer): WordBool; dispid 701;
    function QueryParameterInt(ParamCode: Integer): Integer; dispid 702;
    procedure SetParameterBool(ParamCode: Integer; ParamValue: WordBool); dispid 703;
    procedure SetParameterInt(ParamCode: Integer; ParamValue: Integer); dispid 704;
    procedure WriteGraphic(Number: Integer; Width: Integer; Height: Integer; const Data: WideString); dispid 601;
    procedure PrintGraphic(Width: Integer; Height: Integer; const Data: WideString); dispid 602;
    procedure AddRegNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 501;
    procedure EKLZActivate; dispid 401;
    procedure EKLZActivationReport; dispid 402;
    procedure EKLZDayReport(DayNumber: Integer); dispid 403;
    procedure EKLZReportByNum(IsFull: WordBool; AStartNum: Integer; AEndNum: Integer); dispid 404;
    procedure EKLZReportByDate(IsFull: WordBool; AStartDate: TDateTime; AEndDate: TDateTime); dispid 405;
    procedure EKLZDocByNum(Number: Integer); dispid 406;
    procedure EKLZControlByNum(DayNumber: Integer); dispid 407;
    procedure EKLZCloseArchive; dispid 408;
    procedure EKLZQueryStatus; dispid 409;
    function QueryPaperJournal: WordBool; dispid 410;
    procedure SetPaperJournal(PaperJournal: WordBool); dispid 411;
    property EKLZSupported: WordBool readonly dispid 412;
    property EKLZActivated: WordBool readonly dispid 413;
    property EKLZOper: TxMercOperType readonly dispid 414;
    property EKLZArchiving: WordBool readonly dispid 415;
    property EKLZReporting: WordBool readonly dispid 416;
    property EKLZDayOpened: WordBool readonly dispid 417;
    property EKLZFatalError: WordBool readonly dispid 418;
    property EKLZAttention: WordBool readonly dispid 419;
    property LastRepNumber: Integer readonly dispid 420;
    property EKLZRest: Integer readonly dispid 421;
    function QueryFullJournal: WordBool; dispid 422;
    procedure SetFullJournal(FullJournal: WordBool); dispid 423;
    procedure AddEKLZData(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 424;
    property LastBuyingSum: Currency readonly dispid 425;
    function QueryAutocut: WordBool; dispid 353;
    procedure SetAutocut(Autocut: WordBool); dispid 354;
    function QueryEconomicMode: WordBool; dispid 355;
    procedure SetEconomicMode(EconomicMode: WordBool); dispid 356;
    property EcrSubVersion: Integer readonly dispid 357;
    procedure Open; dispid 201;
    procedure Close(ForceAbort: WordBool); dispid 202;
    procedure OpenReceipt(Oper: TxMercOperType); dispid 203;
    procedure AddReceiptItem(const Desc: WideString; Price: Currency; ItemIsTare: WordBool; 
                             Department: Integer; Code: Integer; Adjustment: Integer; 
                             Quantity: Integer; QuantityPrec: Integer; TaxIndex: Integer; 
                             const UnitName: WideString; Flags: Integer); dispid 204;
    procedure CancelReceipt; dispid 205;
    procedure CloseReceipt(const Account: WideString; PayType: TxMercPayType; PayCash: Currency; 
                           PayCashless: Currency; const PayInfo: WideString; CopiesNum: Integer; 
                           OperInfo: TxMercOperInfo); dispid 206;
    procedure OpenCustomDoc(UseForm: WordBool; Oper: TxMercOperType); dispid 207;
    procedure CancelCustomDoc; dispid 208;
    procedure CloseCustomDoc(PayType: TxMercPayType; Flags: Integer; HCopiesNum: Integer; 
                             VCopiesNum: Integer; VOrigOffset: Integer; HCopyOffset: Integer; 
                             VCopyOffset: Integer; FiscalCopy: Integer); dispid 209;
    procedure OpenFiscalDoc(Oper: TxMercOperType); dispid 210;
    procedure CancelFiscalDoc(BufferOnly: WordBool); dispid 211;
    procedure PrintFiscalDocBuffer; dispid 212;
    procedure CloseFiscalDoc; dispid 213;
    procedure CopyFiscalDoc; dispid 214;
    procedure AddSerialNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 215;
    procedure AddHeaderLine(LineNum: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 216;
    procedure AddDateTime(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 217;
    procedure AddOperInfo(OperInfo: TxMercOperInfo; Flags: Integer; HOffset: Integer; 
                          VOffset: Integer); dispid 218;
    procedure AddDocNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 219;
    procedure AddReceiptNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 220;
    procedure AddAccount(const Account: WideString; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 221;
    procedure AddTaxPayerNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 222;
    procedure AddItem(ItemType: TxMercItemType; Price: Currency; ItemIsTare: WordBool; 
                      Department: Integer; Code: Integer; Adjustment: Integer; Quantity: Integer; 
                      QuantityPrec: Integer; TaxIndex: Integer; const UnitName: WideString; 
                      Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 223;
    procedure AddDocPercentAdj(Value: Integer; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                               VOffset: Integer; RightOffset: Integer); dispid 224;
    procedure AddDocAmountAdj(Value: Currency; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                              VOffset: Integer; RightOffset: Integer); dispid 225;
    procedure AddTotal(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 226;
    procedure AddPay(PayType: TxMercPayType; PayCash: Currency; PayCashless: Currency; 
                     const PayInfo: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                     RightOffset: Integer); dispid 227;
    procedure AddChange(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 228;
    procedure AddTaxSum(TaxIndex: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                        RightOffset: Integer); dispid 229;
    procedure AddFiscalSign(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 230;
    procedure AddBarcode(Mask1: Integer; Mask2: Integer; Mask3: Integer; Mask4: Integer; 
                         Mask5: Integer; DoubleDensity: WordBool; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 231;
    procedure AddCustom(const Text: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 232;
    procedure RepeatOperation; dispid 233;
    procedure OpenDay(OperNum: Integer; const OperName: WideString; FullJournal: WordBool; 
                      AProtocol: TxMercProtocol); dispid 234;
    function ZReport(Flags: Integer): Integer; dispid 235;
    function FiscalRewrite(const InspPswd: WideString; const RegNum: WideString; 
                           const TaxPayerNum: WideString; const NewInspPswd: WideString): Integer; dispid 236;
    function FiscalReportByNum(const InspPswd: WideString; PrintFull: WordBool; AStartNum: Integer; 
                               AEndNum: Integer): Integer; dispid 237;
    function FiscalReportByDate(const InspPswd: WideString; PrintFull: WordBool; 
                                AStartDate: TDateTime; AEndDate: TDateTime): Integer; dispid 238;
    function FiscalReportAll(const InspPswd: WideString): Integer; dispid 239;
    procedure FeedAndCut(LineCount: Integer; CutAfterFeed: WordBool); dispid 240;
    procedure PrintNonFiscal(const Data: WideString; OpenDoc: WordBool; CloseDoc: WordBool); dispid 241;
    procedure ShowDisplay(const Data: WideString; OpenMode: WordBool; CloseMode: WordBool); dispid 242;
    procedure SetDisplayBaudRate(BaudRate: Integer); dispid 243;
    procedure ExternalPulse(Channel: Integer; TimeOn: Integer; TimeOff: Integer; Count: Integer); dispid 244;
    procedure QueryDevExStatus; dispid 245;
    procedure QueryFirmwareInfo; dispid 246;
    procedure SetHeader(const Line1: WideString; const Line2: WideString; const Line3: WideString; 
                        const Line4: WideString); dispid 247;
    procedure SetTax(Index: Integer; const TaxName: WideString; TaxRate: Integer); dispid 248;
    function QueryTax(Index: Integer): Integer; dispid 249;
    function QueryCounter(Index: Integer; NoRequest: WordBool): Currency; dispid 250;
    procedure SynchronizeEcrDateTime; dispid 251;
    procedure QueryResourceInfo(PrintInfo: WordBool); dispid 252;
    procedure QueryLastDocInfo; dispid 253;
    procedure SetParameters(Protocol: TxMercProtocol; PrnTimeout: Integer); dispid 254;
    property EcrModel: TxMercEcrModel readonly dispid 255;
    property EcrVersion: Integer readonly dispid 256;
    property Generation: Integer readonly dispid 257;
    property Protocol: TxMercProtocol readonly dispid 258;
    property EcrStatus: Integer readonly dispid 259;
    property EcrStatusMask: Integer readonly dispid 260;
    property DevStatus: Integer readonly dispid 261;
    property DevStatusMask: Integer readonly dispid 262;
    property DocStatus: TxMercDocStatus readonly dispid 263;
    property CurrentOper: TxMercOperType readonly dispid 264;
    property PortNum: Integer dispid 265;
    property BaudRate: Integer dispid 266;
    property Password: WideString dispid 267;
    property InternalTimeout: Integer dispid 268;
    property ExternalTimeout: Integer dispid 269;
    function QueryHeaderLine(LineNum: Integer): WideString; dispid 270;
    function QuerySerialNumber: WideString; dispid 271;
    procedure SetSerialNumber(const Value: WideString); dispid 272;
    function QueryTaxPayerNumber: WideString; dispid 273;
    function QueryRegNumber: WideString; dispid 274;
    function QueryEcrDateTime: TDateTime; dispid 275;
    function QueryDepartName(DepartNum: Integer): WideString; dispid 276;
    procedure SetDepartName(DepartNum: Integer; const Value: WideString); dispid 277;
    function QueryTitle(TitleNum: Integer): WideString; dispid 278;
    procedure SetTitle(TitleNum: Integer; const Value: WideString); dispid 279;
    property Active: WordBool dispid 280;
    property ConnState: TxMercConnState readonly dispid 281;
    property SaleSum: Currency readonly dispid 282;
    property BuyingSum: Currency readonly dispid 283;
    property SerialNumber: WideString readonly dispid 284;
    property RegNumber: WideString readonly dispid 285;
    property TaxPayerNumber: WideString readonly dispid 286;
    property HeaderLine1: WideString readonly dispid 287;
    property HeaderLine2: WideString readonly dispid 288;
    property HeaderLine3: WideString readonly dispid 289;
    property HeaderLine4: WideString readonly dispid 290;
    property StartDate: TDateTime readonly dispid 291;
    property EndDate: TDateTime readonly dispid 292;
    property StartNumber: Integer readonly dispid 293;
    property EndNumber: Integer readonly dispid 294;
    property ReportDate: TDateTime readonly dispid 295;
    property ModelName: WideString readonly dispid 296;
    property Manufacturer: WideString readonly dispid 297;
    property FirmwareVersion: WideString readonly dispid 298;
    property TaxName: WideString readonly dispid 299;
    property TaxDate: TDateTime readonly dispid 300;
    property CounterCount: Integer readonly dispid 301;
    property RewritesRemain: Integer readonly dispid 302;
    property DaysRemain: Integer readonly dispid 303;
    property LastFiscalReport: Integer readonly dispid 304;
    property LastDayClosing: Integer readonly dispid 305;
    property DayDate: TDateTime readonly dispid 306;
    property LastDocOper: TxMercOperType readonly dispid 307;
    property LastDocNumber: Integer readonly dispid 308;
    property LastRecNumber: Integer readonly dispid 309;
    property LastDocType: TxMercOperType readonly dispid 310;
    property LastDocSum: Currency readonly dispid 311;
    property LastDocDate: TDateTime readonly dispid 312;
    property RetryOperation: WordBool dispid 313;
    property ErrCode: Integer readonly dispid 314;
    property ErrCodeEx: Integer readonly dispid 315;
    property ErrMessage: WideString readonly dispid 316;
    function CheckEcrStatus(Flag: Integer): Integer; dispid 317;
    function CheckDevStatus(Flag: Integer): Integer; dispid 318;
    property EcrHour: Integer readonly dispid 319;
    property EcrMin: Integer readonly dispid 320;
    property ReportHour: Integer readonly dispid 321;
    property ReportMin: Integer readonly dispid 322;
    property DayHour: Integer readonly dispid 323;
    property DayMin: Integer readonly dispid 324;
    property LastDocHour: Integer readonly dispid 325;
    property LastDocMin: Integer readonly dispid 326;
    procedure AddGraphicHeader(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 327;
    procedure SetProtocol(Protocol: TxMercProtocol); dispid 328;
    procedure SetPrinterTimeout(Timeout: Integer); dispid 329;
    procedure SetDisplayTimeout(Timeout: Integer); dispid 330;
    procedure SetPrinterContrast(Contrast: Integer); dispid 331;
    procedure SetLeading(Leading: Integer); dispid 332;
    procedure SetCutterDisabled(Disabled: WordBool); dispid 333;
    procedure SetNarrowPaper(Narrow: WordBool); dispid 334;
    function QueryPrinterTimeout: Integer; dispid 335;
    function QueryDisplayTimeout: Integer; dispid 336;
    function QueryPrinterContrast: Integer; dispid 337;
    function QueryLeading: Integer; dispid 338;
    procedure EnableGraphicHeader(Width: Integer; Height: Integer; const Data: WideString); dispid 339;
    procedure DisableGraphicHeader; dispid 340;
    procedure AddLicence(LicType: TxMercLicenceType; const Licence: WideString); dispid 341;
    function XReport(Flags: Integer): Integer; dispid 342;
    function XReportByDep(DepartNum: Integer; Flags: Integer): Integer; dispid 343;
    function XReportByOper(OperNum: Integer; Flags: Integer): Integer; dispid 344;
    function QueryHeaderAlignment: WordBool; dispid 345;
    function QueryOperNumber: Integer; dispid 346;
    function QueryOperName(OperNum: Integer): WideString; dispid 347;
    procedure SetHeaderAlignment(Aligned: WordBool); dispid 348;
    procedure TestConnection; dispid 349;
    property VersionNumber: Integer readonly dispid 350;
    property BuildNumber: Integer readonly dispid 351;
    property Version: WideString dispid 352;
  end;

// *********************************************************************//
// Interface: IMercuryFPrtX8
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {116A8129-4171-4B1D-8A49-6724A8E975DD}
// *********************************************************************//
  IMercuryFPrtX8 = interface(IMercuryFPrtX7)
    ['{116A8129-4171-4B1D-8A49-6724A8E975DD}']
    procedure SetOperPassword(OperNum: Integer; const OperName: WideString; 
                              const OperPassword: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IMercuryFPrtX8Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {116A8129-4171-4B1D-8A49-6724A8E975DD}
// *********************************************************************//
  IMercuryFPrtX8Disp = dispinterface
    ['{116A8129-4171-4B1D-8A49-6724A8E975DD}']
    procedure SetOperPassword(OperNum: Integer; const OperName: WideString; 
                              const OperPassword: WideString); dispid 1003;
    procedure PrintHeader; dispid 901;
    function QueryParameterBool(ParamCode: Integer): WordBool; dispid 801;
    function QueryParameterInt(ParamCode: Integer): Integer; dispid 802;
    procedure SetParameterBool(ParamCode: Integer; ParamValue: WordBool); dispid 803;
    procedure SetParameterInt(ParamCode: Integer; ParamValue: Integer); dispid 804;
    procedure WriteGraphic(Number: Integer; Width: Integer; Height: Integer; const Data: WideString); dispid 701;
    procedure PrintGraphic(Width: Integer; Height: Integer; const Data: WideString); dispid 702;
    procedure AddRegNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 601;
    procedure EKLZActivate; dispid 401;
    procedure EKLZActivationReport; dispid 402;
    procedure EKLZDayReport(DayNumber: Integer); dispid 403;
    procedure EKLZReportByNum(IsFull: WordBool; AStartNum: Integer; AEndNum: Integer); dispid 404;
    procedure EKLZReportByDate(IsFull: WordBool; AStartDate: TDateTime; AEndDate: TDateTime); dispid 405;
    procedure EKLZDocByNum(Number: Integer); dispid 406;
    procedure EKLZControlByNum(DayNumber: Integer); dispid 407;
    procedure EKLZCloseArchive; dispid 408;
    procedure EKLZQueryStatus; dispid 409;
    function QueryPaperJournal: WordBool; dispid 410;
    procedure SetPaperJournal(PaperJournal: WordBool); dispid 411;
    property EKLZSupported: WordBool readonly dispid 412;
    property EKLZActivated: WordBool readonly dispid 413;
    property EKLZOper: TxMercOperType readonly dispid 414;
    property EKLZArchiving: WordBool readonly dispid 415;
    property EKLZReporting: WordBool readonly dispid 416;
    property EKLZDayOpened: WordBool readonly dispid 417;
    property EKLZFatalError: WordBool readonly dispid 418;
    property EKLZAttention: WordBool readonly dispid 419;
    function QueryFullJournal: WordBool; dispid 501;
    procedure SetFullJournal(FullJournal: WordBool); dispid 502;
    procedure AddEKLZData(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 503;
    property LastBuyingSum: Currency readonly dispid 504;
    function QueryAutocut: WordBool; dispid 353;
    procedure SetAutocut(Autocut: WordBool); dispid 354;
    function QueryEconomicMode: WordBool; dispid 355;
    procedure SetEconomicMode(EconomicMode: WordBool); dispid 356;
    property EcrSubVersion: Integer readonly dispid 357;
    property BorderSize: Integer dispid 1001;
    property ShowState: WordBool dispid 1002;
    property Enabled: WordBool dispid -514;
    procedure AboutBox; dispid -552;
    procedure Open; dispid 201;
    procedure Close(ForceAbort: WordBool); dispid 202;
    procedure OpenReceipt(Oper: TxMercOperType); dispid 203;
    procedure AddReceiptItem(const Desc: WideString; Price: Currency; ItemIsTare: WordBool; 
                             Department: Integer; Code: Integer; Adjustment: Integer; 
                             Quantity: Integer; QuantityPrec: Integer; TaxIndex: Integer; 
                             const UnitName: WideString; Flags: Integer); dispid 204;
    procedure CancelReceipt; dispid 205;
    procedure CloseReceipt(const Account: WideString; PayType: TxMercPayType; PayCash: Currency; 
                           PayCashless: Currency; const PayInfo: WideString; CopiesNum: Integer; 
                           OperInfo: TxMercOperInfo); dispid 206;
    procedure OpenCustomDoc(UseForm: WordBool; Oper: TxMercOperType); dispid 207;
    procedure CancelCustomDoc; dispid 208;
    procedure CloseCustomDoc(PayType: TxMercPayType; Flags: Integer; HCopiesNum: Integer; 
                             VCopiesNum: Integer; VOrigOffset: Integer; HCopyOffset: Integer; 
                             VCopyOffset: Integer; FiscalCopy: Integer); dispid 209;
    procedure OpenFiscalDoc(Oper: TxMercOperType); dispid 210;
    procedure CancelFiscalDoc(BufferOnly: WordBool); dispid 211;
    procedure PrintFiscalDocBuffer; dispid 212;
    procedure CloseFiscalDoc; dispid 213;
    procedure CopyFiscalDoc; dispid 214;
    procedure AddSerialNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 215;
    procedure AddHeaderLine(LineNum: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 216;
    procedure AddDateTime(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 217;
    procedure AddOperInfo(OperInfo: TxMercOperInfo; Flags: Integer; HOffset: Integer; 
                          VOffset: Integer); dispid 218;
    procedure AddDocNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 219;
    procedure AddReceiptNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 220;
    procedure AddAccount(const Account: WideString; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 221;
    procedure AddTaxPayerNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 222;
    procedure AddItem(ItemType: TxMercItemType; Price: Currency; ItemIsTare: WordBool; 
                      Department: Integer; Code: Integer; Adjustment: Integer; Quantity: Integer; 
                      QuantityPrec: Integer; TaxIndex: Integer; const UnitName: WideString; 
                      Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 223;
    procedure AddDocPercentAdj(Value: Integer; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                               VOffset: Integer; RightOffset: Integer); dispid 224;
    procedure AddDocAmountAdj(Value: Currency; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                              VOffset: Integer; RightOffset: Integer); dispid 225;
    procedure AddTotal(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 226;
    procedure AddPay(PayType: TxMercPayType; PayCash: Currency; PayCashless: Currency; 
                     const PayInfo: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                     RightOffset: Integer); dispid 227;
    procedure AddChange(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 228;
    procedure AddTaxSum(TaxIndex: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                        RightOffset: Integer); dispid 229;
    procedure AddFiscalSign(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 230;
    procedure AddBarcode(Mask1: Integer; Mask2: Integer; Mask3: Integer; Mask4: Integer; 
                         Mask5: Integer; DoubleDensity: WordBool; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 231;
    procedure AddCustom(const Text: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 232;
    procedure RepeatOperation; dispid 233;
    procedure OpenDay(OperNum: Integer; const OperName: WideString; FullJournal: WordBool; 
                      AProtocol: TxMercProtocol); dispid 234;
    function ZReport(Flags: Integer): Integer; dispid 235;
    function FiscalRewrite(const InspPswd: WideString; const RegNum: WideString; 
                           const TaxPayerNum: WideString; const NewInspPswd: WideString): Integer; dispid 236;
    function FiscalReportByNum(const InspPswd: WideString; PrintFull: WordBool; AStartNum: Integer; 
                               AEndNum: Integer): Integer; dispid 237;
    function FiscalReportByDate(const InspPswd: WideString; PrintFull: WordBool; 
                                AStartDate: TDateTime; AEndDate: TDateTime): Integer; dispid 238;
    function FiscalReportAll(const InspPswd: WideString): Integer; dispid 239;
    procedure FeedAndCut(LineCount: Integer; CutAfterFeed: WordBool); dispid 240;
    procedure PrintNonFiscal(const Data: WideString; OpenDoc: WordBool; CloseDoc: WordBool); dispid 241;
    procedure ShowDisplay(const Data: WideString; OpenMode: WordBool; CloseMode: WordBool); dispid 242;
    procedure SetDisplayBaudRate(BaudRate: Integer); dispid 243;
    procedure ExternalPulse(Channel: Integer; TimeOn: Integer; TimeOff: Integer; Count: Integer); dispid 244;
    procedure QueryDevExStatus; dispid 245;
    procedure QueryFirmwareInfo; dispid 246;
    procedure SetHeader(const Line1: WideString; const Line2: WideString; const Line3: WideString; 
                        const Line4: WideString); dispid 247;
    procedure SetTax(Index: Integer; const TaxName: WideString; TaxRate: Integer); dispid 248;
    function QueryTax(Index: Integer): Integer; dispid 249;
    function QueryCounter(Index: Integer; NoRequest: WordBool): Currency; dispid 250;
    procedure SynchronizeEcrDateTime; dispid 251;
    procedure QueryResourceInfo(PrintInfo: WordBool); dispid 252;
    procedure QueryLastDocInfo; dispid 253;
    procedure SetParameters(Protocol: TxMercProtocol; PrnTimeout: Integer); dispid 254;
    property EcrModel: TxMercEcrModel readonly dispid 255;
    property EcrVersion: Integer readonly dispid 256;
    property Generation: Integer readonly dispid 257;
    property Protocol: TxMercProtocol readonly dispid 258;
    property EcrStatus: Integer readonly dispid 259;
    property EcrStatusMask: Integer readonly dispid 260;
    property DevStatus: Integer readonly dispid 261;
    property DevStatusMask: Integer readonly dispid 262;
    property DocStatus: TxMercDocStatus readonly dispid 263;
    property CurrentOper: TxMercOperType readonly dispid 264;
    property PortNum: Integer dispid 265;
    property BaudRate: Integer dispid 266;
    property Password: WideString dispid 267;
    property InternalTimeout: Integer dispid 268;
    property ExternalTimeout: Integer dispid 269;
    function QueryHeaderLine(LineNum: Integer): WideString; dispid 270;
    function QuerySerialNumber: WideString; dispid 271;
    procedure SetSerialNumber(const Value: WideString); dispid 272;
    function QueryTaxPayerNumber: WideString; dispid 273;
    function QueryRegNumber: WideString; dispid 274;
    function QueryEcrDateTime: TDateTime; dispid 275;
    function QueryDepartName(DepartNum: Integer): WideString; dispid 276;
    procedure SetDepartName(DepartNum: Integer; const Value: WideString); dispid 277;
    function QueryTitle(TitleNum: Integer): WideString; dispid 278;
    procedure SetTitle(TitleNum: Integer; const Value: WideString); dispid 279;
    property Active: WordBool dispid 280;
    property ConnState: TxMercConnState readonly dispid 281;
    property SaleSum: Currency readonly dispid 282;
    property BuyingSum: Currency readonly dispid 283;
    property SerialNumber: WideString readonly dispid 284;
    property RegNumber: WideString readonly dispid 285;
    property TaxPayerNumber: WideString readonly dispid 286;
    property HeaderLine1: WideString readonly dispid 287;
    property HeaderLine2: WideString readonly dispid 288;
    property HeaderLine3: WideString readonly dispid 289;
    property HeaderLine4: WideString readonly dispid 290;
    property StartDate: TDateTime readonly dispid 291;
    property EndDate: TDateTime readonly dispid 292;
    property StartNumber: Integer readonly dispid 293;
    property EndNumber: Integer readonly dispid 294;
    property ReportDate: TDateTime readonly dispid 295;
    property ModelName: WideString readonly dispid 296;
    property Manufacturer: WideString readonly dispid 297;
    property FirmwareVersion: WideString readonly dispid 298;
    property TaxName: WideString readonly dispid 299;
    property TaxDate: TDateTime readonly dispid 300;
    property CounterCount: Integer readonly dispid 301;
    property RewritesRemain: Integer readonly dispid 302;
    property DaysRemain: Integer readonly dispid 303;
    property LastFiscalReport: Integer readonly dispid 304;
    property LastDayClosing: Integer readonly dispid 305;
    property DayDate: TDateTime readonly dispid 306;
    property LastDocOper: TxMercOperType readonly dispid 307;
    property LastDocNumber: Integer readonly dispid 308;
    property LastRecNumber: Integer readonly dispid 309;
    property LastDocType: TxMercOperType readonly dispid 310;
    property LastDocSum: Currency readonly dispid 311;
    property LastDocDate: TDateTime readonly dispid 312;
    property RetryOperation: WordBool dispid 313;
    property ErrCode: Integer readonly dispid 314;
    property ErrCodeEx: Integer readonly dispid 315;
    property ErrMessage: WideString readonly dispid 316;
    function CheckEcrStatus(Flag: Integer): Integer; dispid 317;
    function CheckDevStatus(Flag: Integer): Integer; dispid 318;
    property EcrHour: Integer readonly dispid 319;
    property EcrMin: Integer readonly dispid 320;
    property ReportHour: Integer readonly dispid 321;
    property ReportMin: Integer readonly dispid 322;
    property DayHour: Integer readonly dispid 323;
    property DayMin: Integer readonly dispid 324;
    property LastDocHour: Integer readonly dispid 325;
    property LastDocMin: Integer readonly dispid 326;
    procedure AddGraphicHeader(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 327;
    procedure SetProtocol(Protocol: TxMercProtocol); dispid 328;
    procedure SetPrinterTimeout(Timeout: Integer); dispid 329;
    procedure SetDisplayTimeout(Timeout: Integer); dispid 330;
    procedure SetPrinterContrast(Contrast: Integer); dispid 331;
    procedure SetLeading(Leading: Integer); dispid 332;
    procedure SetCutterDisabled(Disabled: WordBool); dispid 333;
    procedure SetNarrowPaper(Narrow: WordBool); dispid 334;
    function QueryPrinterTimeout: Integer; dispid 335;
    function QueryDisplayTimeout: Integer; dispid 336;
    function QueryPrinterContrast: Integer; dispid 337;
    function QueryLeading: Integer; dispid 338;
    procedure EnableGraphicHeader(Width: Integer; Height: Integer; const Data: WideString); dispid 339;
    procedure DisableGraphicHeader; dispid 340;
    procedure AddLicence(LicType: TxMercLicenceType; const Licence: WideString); dispid 341;
    function XReport(Flags: Integer): Integer; dispid 342;
    function XReportByDep(DepartNum: Integer; Flags: Integer): Integer; dispid 343;
    function XReportByOper(OperNum: Integer; Flags: Integer): Integer; dispid 344;
    function QueryHeaderAlignment: WordBool; dispid 345;
    function QueryOperNumber: Integer; dispid 346;
    function QueryOperName(OperNum: Integer): WideString; dispid 347;
    procedure SetHeaderAlignment(Aligned: WordBool); dispid 348;
    procedure TestConnection; dispid 349;
    property VersionNumber: Integer readonly dispid 350;
    property BuildNumber: Integer readonly dispid 351;
    property Version: WideString dispid 352;
  end;

// *********************************************************************//
// Interface: IMercuryFPrt9
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B9F07D55-3587-4FFE-BFA8-0F1BFE05554F}
// *********************************************************************//
  IMercuryFPrt9 = interface(IMercuryFPrt8)
    ['{B9F07D55-3587-4FFE-BFA8-0F1BFE05554F}']
    function PrintEKL(Flags: Integer): Integer; safecall;
    function QueryEKLState: TxMercEKLState; safecall;
  end;

// *********************************************************************//
// DispIntf:  IMercuryFPrt9Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B9F07D55-3587-4FFE-BFA8-0F1BFE05554F}
// *********************************************************************//
  IMercuryFPrt9Disp = dispinterface
    ['{B9F07D55-3587-4FFE-BFA8-0F1BFE05554F}']
    function PrintEKL(Flags: Integer): Integer; dispid 1001;
    function QueryEKLState: TxMercEKLState; dispid 1002;
    procedure SetOperPassword(OperNum: Integer; const OperName: WideString; 
                              const OperPassword: WideString); dispid 901;
    procedure PrintHeader; dispid 801;
    function QueryParameterBool(ParamCode: Integer): WordBool; dispid 701;
    function QueryParameterInt(ParamCode: Integer): Integer; dispid 702;
    procedure SetParameterBool(ParamCode: Integer; ParamValue: WordBool); dispid 703;
    procedure SetParameterInt(ParamCode: Integer; ParamValue: Integer); dispid 704;
    procedure WriteGraphic(Number: Integer; Width: Integer; Height: Integer; const Data: WideString); dispid 601;
    procedure PrintGraphic(Width: Integer; Height: Integer; const Data: WideString); dispid 602;
    procedure AddRegNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 501;
    procedure EKLZActivate; dispid 401;
    procedure EKLZActivationReport; dispid 402;
    procedure EKLZDayReport(DayNumber: Integer); dispid 403;
    procedure EKLZReportByNum(IsFull: WordBool; AStartNum: Integer; AEndNum: Integer); dispid 404;
    procedure EKLZReportByDate(IsFull: WordBool; AStartDate: TDateTime; AEndDate: TDateTime); dispid 405;
    procedure EKLZDocByNum(Number: Integer); dispid 406;
    procedure EKLZControlByNum(DayNumber: Integer); dispid 407;
    procedure EKLZCloseArchive; dispid 408;
    procedure EKLZQueryStatus; dispid 409;
    function QueryPaperJournal: WordBool; dispid 410;
    procedure SetPaperJournal(PaperJournal: WordBool); dispid 411;
    property EKLZSupported: WordBool readonly dispid 412;
    property EKLZActivated: WordBool readonly dispid 413;
    property EKLZOper: TxMercOperType readonly dispid 414;
    property EKLZArchiving: WordBool readonly dispid 415;
    property EKLZReporting: WordBool readonly dispid 416;
    property EKLZDayOpened: WordBool readonly dispid 417;
    property EKLZFatalError: WordBool readonly dispid 418;
    property EKLZAttention: WordBool readonly dispid 419;
    property LastRepNumber: Integer readonly dispid 420;
    property EKLZRest: Integer readonly dispid 421;
    function QueryFullJournal: WordBool; dispid 422;
    procedure SetFullJournal(FullJournal: WordBool); dispid 423;
    procedure AddEKLZData(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 424;
    property LastBuyingSum: Currency readonly dispid 425;
    function QueryAutocut: WordBool; dispid 353;
    procedure SetAutocut(Autocut: WordBool); dispid 354;
    function QueryEconomicMode: WordBool; dispid 355;
    procedure SetEconomicMode(EconomicMode: WordBool); dispid 356;
    property EcrSubVersion: Integer readonly dispid 357;
    procedure Open; dispid 201;
    procedure Close(ForceAbort: WordBool); dispid 202;
    procedure OpenReceipt(Oper: TxMercOperType); dispid 203;
    procedure AddReceiptItem(const Desc: WideString; Price: Currency; ItemIsTare: WordBool; 
                             Department: Integer; Code: Integer; Adjustment: Integer; 
                             Quantity: Integer; QuantityPrec: Integer; TaxIndex: Integer; 
                             const UnitName: WideString; Flags: Integer); dispid 204;
    procedure CancelReceipt; dispid 205;
    procedure CloseReceipt(const Account: WideString; PayType: TxMercPayType; PayCash: Currency; 
                           PayCashless: Currency; const PayInfo: WideString; CopiesNum: Integer; 
                           OperInfo: TxMercOperInfo); dispid 206;
    procedure OpenCustomDoc(UseForm: WordBool; Oper: TxMercOperType); dispid 207;
    procedure CancelCustomDoc; dispid 208;
    procedure CloseCustomDoc(PayType: TxMercPayType; Flags: Integer; HCopiesNum: Integer; 
                             VCopiesNum: Integer; VOrigOffset: Integer; HCopyOffset: Integer; 
                             VCopyOffset: Integer; FiscalCopy: Integer); dispid 209;
    procedure OpenFiscalDoc(Oper: TxMercOperType); dispid 210;
    procedure CancelFiscalDoc(BufferOnly: WordBool); dispid 211;
    procedure PrintFiscalDocBuffer; dispid 212;
    procedure CloseFiscalDoc; dispid 213;
    procedure CopyFiscalDoc; dispid 214;
    procedure AddSerialNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 215;
    procedure AddHeaderLine(LineNum: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 216;
    procedure AddDateTime(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 217;
    procedure AddOperInfo(OperInfo: TxMercOperInfo; Flags: Integer; HOffset: Integer; 
                          VOffset: Integer); dispid 218;
    procedure AddDocNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 219;
    procedure AddReceiptNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 220;
    procedure AddAccount(const Account: WideString; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 221;
    procedure AddTaxPayerNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 222;
    procedure AddItem(ItemType: TxMercItemType; Price: Currency; ItemIsTare: WordBool; 
                      Department: Integer; Code: Integer; Adjustment: Integer; Quantity: Integer; 
                      QuantityPrec: Integer; TaxIndex: Integer; const UnitName: WideString; 
                      Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 223;
    procedure AddDocPercentAdj(Value: Integer; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                               VOffset: Integer; RightOffset: Integer); dispid 224;
    procedure AddDocAmountAdj(Value: Currency; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                              VOffset: Integer; RightOffset: Integer); dispid 225;
    procedure AddTotal(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 226;
    procedure AddPay(PayType: TxMercPayType; PayCash: Currency; PayCashless: Currency; 
                     const PayInfo: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                     RightOffset: Integer); dispid 227;
    procedure AddChange(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 228;
    procedure AddTaxSum(TaxIndex: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                        RightOffset: Integer); dispid 229;
    procedure AddFiscalSign(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 230;
    procedure AddBarcode(Mask1: Integer; Mask2: Integer; Mask3: Integer; Mask4: Integer; 
                         Mask5: Integer; DoubleDensity: WordBool; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 231;
    procedure AddCustom(const Text: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 232;
    procedure RepeatOperation; dispid 233;
    procedure OpenDay(OperNum: Integer; const OperName: WideString; FullJournal: WordBool; 
                      AProtocol: TxMercProtocol); dispid 234;
    function ZReport(Flags: Integer): Integer; dispid 235;
    function FiscalRewrite(const InspPswd: WideString; const RegNum: WideString; 
                           const TaxPayerNum: WideString; const NewInspPswd: WideString): Integer; dispid 236;
    function FiscalReportByNum(const InspPswd: WideString; PrintFull: WordBool; AStartNum: Integer; 
                               AEndNum: Integer): Integer; dispid 237;
    function FiscalReportByDate(const InspPswd: WideString; PrintFull: WordBool; 
                                AStartDate: TDateTime; AEndDate: TDateTime): Integer; dispid 238;
    function FiscalReportAll(const InspPswd: WideString): Integer; dispid 239;
    procedure FeedAndCut(LineCount: Integer; CutAfterFeed: WordBool); dispid 240;
    procedure PrintNonFiscal(const Data: WideString; OpenDoc: WordBool; CloseDoc: WordBool); dispid 241;
    procedure ShowDisplay(const Data: WideString; OpenMode: WordBool; CloseMode: WordBool); dispid 242;
    procedure SetDisplayBaudRate(BaudRate: Integer); dispid 243;
    procedure ExternalPulse(Channel: Integer; TimeOn: Integer; TimeOff: Integer; Count: Integer); dispid 244;
    procedure QueryDevExStatus; dispid 245;
    procedure QueryFirmwareInfo; dispid 246;
    procedure SetHeader(const Line1: WideString; const Line2: WideString; const Line3: WideString; 
                        const Line4: WideString); dispid 247;
    procedure SetTax(Index: Integer; const TaxName: WideString; TaxRate: Integer); dispid 248;
    function QueryTax(Index: Integer): Integer; dispid 249;
    function QueryCounter(Index: Integer; NoRequest: WordBool): Currency; dispid 250;
    procedure SynchronizeEcrDateTime; dispid 251;
    procedure QueryResourceInfo(PrintInfo: WordBool); dispid 252;
    procedure QueryLastDocInfo; dispid 253;
    procedure SetParameters(Protocol: TxMercProtocol; PrnTimeout: Integer); dispid 254;
    property EcrModel: TxMercEcrModel readonly dispid 255;
    property EcrVersion: Integer readonly dispid 256;
    property Generation: Integer readonly dispid 257;
    property Protocol: TxMercProtocol readonly dispid 258;
    property EcrStatus: Integer readonly dispid 259;
    property EcrStatusMask: Integer readonly dispid 260;
    property DevStatus: Integer readonly dispid 261;
    property DevStatusMask: Integer readonly dispid 262;
    property DocStatus: TxMercDocStatus readonly dispid 263;
    property CurrentOper: TxMercOperType readonly dispid 264;
    property PortNum: Integer dispid 265;
    property BaudRate: Integer dispid 266;
    property Password: WideString dispid 267;
    property InternalTimeout: Integer dispid 268;
    property ExternalTimeout: Integer dispid 269;
    function QueryHeaderLine(LineNum: Integer): WideString; dispid 270;
    function QuerySerialNumber: WideString; dispid 271;
    procedure SetSerialNumber(const Value: WideString); dispid 272;
    function QueryTaxPayerNumber: WideString; dispid 273;
    function QueryRegNumber: WideString; dispid 274;
    function QueryEcrDateTime: TDateTime; dispid 275;
    function QueryDepartName(DepartNum: Integer): WideString; dispid 276;
    procedure SetDepartName(DepartNum: Integer; const Value: WideString); dispid 277;
    function QueryTitle(TitleNum: Integer): WideString; dispid 278;
    procedure SetTitle(TitleNum: Integer; const Value: WideString); dispid 279;
    property Active: WordBool dispid 280;
    property ConnState: TxMercConnState readonly dispid 281;
    property SaleSum: Currency readonly dispid 282;
    property BuyingSum: Currency readonly dispid 283;
    property SerialNumber: WideString readonly dispid 284;
    property RegNumber: WideString readonly dispid 285;
    property TaxPayerNumber: WideString readonly dispid 286;
    property HeaderLine1: WideString readonly dispid 287;
    property HeaderLine2: WideString readonly dispid 288;
    property HeaderLine3: WideString readonly dispid 289;
    property HeaderLine4: WideString readonly dispid 290;
    property StartDate: TDateTime readonly dispid 291;
    property EndDate: TDateTime readonly dispid 292;
    property StartNumber: Integer readonly dispid 293;
    property EndNumber: Integer readonly dispid 294;
    property ReportDate: TDateTime readonly dispid 295;
    property ModelName: WideString readonly dispid 296;
    property Manufacturer: WideString readonly dispid 297;
    property FirmwareVersion: WideString readonly dispid 298;
    property TaxName: WideString readonly dispid 299;
    property TaxDate: TDateTime readonly dispid 300;
    property CounterCount: Integer readonly dispid 301;
    property RewritesRemain: Integer readonly dispid 302;
    property DaysRemain: Integer readonly dispid 303;
    property LastFiscalReport: Integer readonly dispid 304;
    property LastDayClosing: Integer readonly dispid 305;
    property DayDate: TDateTime readonly dispid 306;
    property LastDocOper: TxMercOperType readonly dispid 307;
    property LastDocNumber: Integer readonly dispid 308;
    property LastRecNumber: Integer readonly dispid 309;
    property LastDocType: TxMercOperType readonly dispid 310;
    property LastDocSum: Currency readonly dispid 311;
    property LastDocDate: TDateTime readonly dispid 312;
    property RetryOperation: WordBool dispid 313;
    property ErrCode: Integer readonly dispid 314;
    property ErrCodeEx: Integer readonly dispid 315;
    property ErrMessage: WideString readonly dispid 316;
    function CheckEcrStatus(Flag: Integer): Integer; dispid 317;
    function CheckDevStatus(Flag: Integer): Integer; dispid 318;
    property EcrHour: Integer readonly dispid 319;
    property EcrMin: Integer readonly dispid 320;
    property ReportHour: Integer readonly dispid 321;
    property ReportMin: Integer readonly dispid 322;
    property DayHour: Integer readonly dispid 323;
    property DayMin: Integer readonly dispid 324;
    property LastDocHour: Integer readonly dispid 325;
    property LastDocMin: Integer readonly dispid 326;
    procedure AddGraphicHeader(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 327;
    procedure SetProtocol(Protocol: TxMercProtocol); dispid 328;
    procedure SetPrinterTimeout(Timeout: Integer); dispid 329;
    procedure SetDisplayTimeout(Timeout: Integer); dispid 330;
    procedure SetPrinterContrast(Contrast: Integer); dispid 331;
    procedure SetLeading(Leading: Integer); dispid 332;
    procedure SetCutterDisabled(Disabled: WordBool); dispid 333;
    procedure SetNarrowPaper(Narrow: WordBool); dispid 334;
    function QueryPrinterTimeout: Integer; dispid 335;
    function QueryDisplayTimeout: Integer; dispid 336;
    function QueryPrinterContrast: Integer; dispid 337;
    function QueryLeading: Integer; dispid 338;
    procedure EnableGraphicHeader(Width: Integer; Height: Integer; const Data: WideString); dispid 339;
    procedure DisableGraphicHeader; dispid 340;
    procedure AddLicence(LicType: TxMercLicenceType; const Licence: WideString); dispid 341;
    function XReport(Flags: Integer): Integer; dispid 342;
    function XReportByDep(DepartNum: Integer; Flags: Integer): Integer; dispid 343;
    function XReportByOper(OperNum: Integer; Flags: Integer): Integer; dispid 344;
    function QueryHeaderAlignment: WordBool; dispid 345;
    function QueryOperNumber: Integer; dispid 346;
    function QueryOperName(OperNum: Integer): WideString; dispid 347;
    procedure SetHeaderAlignment(Aligned: WordBool); dispid 348;
    procedure TestConnection; dispid 349;
    property VersionNumber: Integer readonly dispid 350;
    property BuildNumber: Integer readonly dispid 351;
    property Version: WideString dispid 352;
  end;

// *********************************************************************//
// Interface: IMercuryFPrtX9
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {47D80BD0-5B41-4BFE-98AA-9E76BA94F37E}
// *********************************************************************//
  IMercuryFPrtX9 = interface(IMercuryFPrtX8)
    ['{47D80BD0-5B41-4BFE-98AA-9E76BA94F37E}']
    function PrintEKL(Flags: Integer): Integer; safecall;
    function QueryEKLState: TxMercEKLState; safecall;
  end;

// *********************************************************************//
// DispIntf:  IMercuryFPrtX9Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {47D80BD0-5B41-4BFE-98AA-9E76BA94F37E}
// *********************************************************************//
  IMercuryFPrtX9Disp = dispinterface
    ['{47D80BD0-5B41-4BFE-98AA-9E76BA94F37E}']
    function PrintEKL(Flags: Integer): Integer; dispid 1101;
    function QueryEKLState: TxMercEKLState; dispid 1102;
    procedure SetOperPassword(OperNum: Integer; const OperName: WideString; 
                              const OperPassword: WideString); dispid 1003;
    procedure PrintHeader; dispid 901;
    function QueryParameterBool(ParamCode: Integer): WordBool; dispid 801;
    function QueryParameterInt(ParamCode: Integer): Integer; dispid 802;
    procedure SetParameterBool(ParamCode: Integer; ParamValue: WordBool); dispid 803;
    procedure SetParameterInt(ParamCode: Integer; ParamValue: Integer); dispid 804;
    procedure WriteGraphic(Number: Integer; Width: Integer; Height: Integer; const Data: WideString); dispid 701;
    procedure PrintGraphic(Width: Integer; Height: Integer; const Data: WideString); dispid 702;
    procedure AddRegNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 601;
    procedure EKLZActivate; dispid 401;
    procedure EKLZActivationReport; dispid 402;
    procedure EKLZDayReport(DayNumber: Integer); dispid 403;
    procedure EKLZReportByNum(IsFull: WordBool; AStartNum: Integer; AEndNum: Integer); dispid 404;
    procedure EKLZReportByDate(IsFull: WordBool; AStartDate: TDateTime; AEndDate: TDateTime); dispid 405;
    procedure EKLZDocByNum(Number: Integer); dispid 406;
    procedure EKLZControlByNum(DayNumber: Integer); dispid 407;
    procedure EKLZCloseArchive; dispid 408;
    procedure EKLZQueryStatus; dispid 409;
    function QueryPaperJournal: WordBool; dispid 410;
    procedure SetPaperJournal(PaperJournal: WordBool); dispid 411;
    property EKLZSupported: WordBool readonly dispid 412;
    property EKLZActivated: WordBool readonly dispid 413;
    property EKLZOper: TxMercOperType readonly dispid 414;
    property EKLZArchiving: WordBool readonly dispid 415;
    property EKLZReporting: WordBool readonly dispid 416;
    property EKLZDayOpened: WordBool readonly dispid 417;
    property EKLZFatalError: WordBool readonly dispid 418;
    property EKLZAttention: WordBool readonly dispid 419;
    function QueryFullJournal: WordBool; dispid 501;
    procedure SetFullJournal(FullJournal: WordBool); dispid 502;
    procedure AddEKLZData(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 503;
    property LastBuyingSum: Currency readonly dispid 504;
    function QueryAutocut: WordBool; dispid 353;
    procedure SetAutocut(Autocut: WordBool); dispid 354;
    function QueryEconomicMode: WordBool; dispid 355;
    procedure SetEconomicMode(EconomicMode: WordBool); dispid 356;
    property EcrSubVersion: Integer readonly dispid 357;
    property BorderSize: Integer dispid 1001;
    property ShowState: WordBool dispid 1002;
    property Enabled: WordBool dispid -514;
    procedure AboutBox; dispid -552;
    procedure Open; dispid 201;
    procedure Close(ForceAbort: WordBool); dispid 202;
    procedure OpenReceipt(Oper: TxMercOperType); dispid 203;
    procedure AddReceiptItem(const Desc: WideString; Price: Currency; ItemIsTare: WordBool; 
                             Department: Integer; Code: Integer; Adjustment: Integer; 
                             Quantity: Integer; QuantityPrec: Integer; TaxIndex: Integer; 
                             const UnitName: WideString; Flags: Integer); dispid 204;
    procedure CancelReceipt; dispid 205;
    procedure CloseReceipt(const Account: WideString; PayType: TxMercPayType; PayCash: Currency; 
                           PayCashless: Currency; const PayInfo: WideString; CopiesNum: Integer; 
                           OperInfo: TxMercOperInfo); dispid 206;
    procedure OpenCustomDoc(UseForm: WordBool; Oper: TxMercOperType); dispid 207;
    procedure CancelCustomDoc; dispid 208;
    procedure CloseCustomDoc(PayType: TxMercPayType; Flags: Integer; HCopiesNum: Integer; 
                             VCopiesNum: Integer; VOrigOffset: Integer; HCopyOffset: Integer; 
                             VCopyOffset: Integer; FiscalCopy: Integer); dispid 209;
    procedure OpenFiscalDoc(Oper: TxMercOperType); dispid 210;
    procedure CancelFiscalDoc(BufferOnly: WordBool); dispid 211;
    procedure PrintFiscalDocBuffer; dispid 212;
    procedure CloseFiscalDoc; dispid 213;
    procedure CopyFiscalDoc; dispid 214;
    procedure AddSerialNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 215;
    procedure AddHeaderLine(LineNum: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 216;
    procedure AddDateTime(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 217;
    procedure AddOperInfo(OperInfo: TxMercOperInfo; Flags: Integer; HOffset: Integer; 
                          VOffset: Integer); dispid 218;
    procedure AddDocNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 219;
    procedure AddReceiptNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 220;
    procedure AddAccount(const Account: WideString; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 221;
    procedure AddTaxPayerNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 222;
    procedure AddItem(ItemType: TxMercItemType; Price: Currency; ItemIsTare: WordBool; 
                      Department: Integer; Code: Integer; Adjustment: Integer; Quantity: Integer; 
                      QuantityPrec: Integer; TaxIndex: Integer; const UnitName: WideString; 
                      Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 223;
    procedure AddDocPercentAdj(Value: Integer; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                               VOffset: Integer; RightOffset: Integer); dispid 224;
    procedure AddDocAmountAdj(Value: Currency; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                              VOffset: Integer; RightOffset: Integer); dispid 225;
    procedure AddTotal(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 226;
    procedure AddPay(PayType: TxMercPayType; PayCash: Currency; PayCashless: Currency; 
                     const PayInfo: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                     RightOffset: Integer); dispid 227;
    procedure AddChange(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 228;
    procedure AddTaxSum(TaxIndex: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                        RightOffset: Integer); dispid 229;
    procedure AddFiscalSign(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 230;
    procedure AddBarcode(Mask1: Integer; Mask2: Integer; Mask3: Integer; Mask4: Integer; 
                         Mask5: Integer; DoubleDensity: WordBool; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 231;
    procedure AddCustom(const Text: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 232;
    procedure RepeatOperation; dispid 233;
    procedure OpenDay(OperNum: Integer; const OperName: WideString; FullJournal: WordBool; 
                      AProtocol: TxMercProtocol); dispid 234;
    function ZReport(Flags: Integer): Integer; dispid 235;
    function FiscalRewrite(const InspPswd: WideString; const RegNum: WideString; 
                           const TaxPayerNum: WideString; const NewInspPswd: WideString): Integer; dispid 236;
    function FiscalReportByNum(const InspPswd: WideString; PrintFull: WordBool; AStartNum: Integer; 
                               AEndNum: Integer): Integer; dispid 237;
    function FiscalReportByDate(const InspPswd: WideString; PrintFull: WordBool; 
                                AStartDate: TDateTime; AEndDate: TDateTime): Integer; dispid 238;
    function FiscalReportAll(const InspPswd: WideString): Integer; dispid 239;
    procedure FeedAndCut(LineCount: Integer; CutAfterFeed: WordBool); dispid 240;
    procedure PrintNonFiscal(const Data: WideString; OpenDoc: WordBool; CloseDoc: WordBool); dispid 241;
    procedure ShowDisplay(const Data: WideString; OpenMode: WordBool; CloseMode: WordBool); dispid 242;
    procedure SetDisplayBaudRate(BaudRate: Integer); dispid 243;
    procedure ExternalPulse(Channel: Integer; TimeOn: Integer; TimeOff: Integer; Count: Integer); dispid 244;
    procedure QueryDevExStatus; dispid 245;
    procedure QueryFirmwareInfo; dispid 246;
    procedure SetHeader(const Line1: WideString; const Line2: WideString; const Line3: WideString; 
                        const Line4: WideString); dispid 247;
    procedure SetTax(Index: Integer; const TaxName: WideString; TaxRate: Integer); dispid 248;
    function QueryTax(Index: Integer): Integer; dispid 249;
    function QueryCounter(Index: Integer; NoRequest: WordBool): Currency; dispid 250;
    procedure SynchronizeEcrDateTime; dispid 251;
    procedure QueryResourceInfo(PrintInfo: WordBool); dispid 252;
    procedure QueryLastDocInfo; dispid 253;
    procedure SetParameters(Protocol: TxMercProtocol; PrnTimeout: Integer); dispid 254;
    property EcrModel: TxMercEcrModel readonly dispid 255;
    property EcrVersion: Integer readonly dispid 256;
    property Generation: Integer readonly dispid 257;
    property Protocol: TxMercProtocol readonly dispid 258;
    property EcrStatus: Integer readonly dispid 259;
    property EcrStatusMask: Integer readonly dispid 260;
    property DevStatus: Integer readonly dispid 261;
    property DevStatusMask: Integer readonly dispid 262;
    property DocStatus: TxMercDocStatus readonly dispid 263;
    property CurrentOper: TxMercOperType readonly dispid 264;
    property PortNum: Integer dispid 265;
    property BaudRate: Integer dispid 266;
    property Password: WideString dispid 267;
    property InternalTimeout: Integer dispid 268;
    property ExternalTimeout: Integer dispid 269;
    function QueryHeaderLine(LineNum: Integer): WideString; dispid 270;
    function QuerySerialNumber: WideString; dispid 271;
    procedure SetSerialNumber(const Value: WideString); dispid 272;
    function QueryTaxPayerNumber: WideString; dispid 273;
    function QueryRegNumber: WideString; dispid 274;
    function QueryEcrDateTime: TDateTime; dispid 275;
    function QueryDepartName(DepartNum: Integer): WideString; dispid 276;
    procedure SetDepartName(DepartNum: Integer; const Value: WideString); dispid 277;
    function QueryTitle(TitleNum: Integer): WideString; dispid 278;
    procedure SetTitle(TitleNum: Integer; const Value: WideString); dispid 279;
    property Active: WordBool dispid 280;
    property ConnState: TxMercConnState readonly dispid 281;
    property SaleSum: Currency readonly dispid 282;
    property BuyingSum: Currency readonly dispid 283;
    property SerialNumber: WideString readonly dispid 284;
    property RegNumber: WideString readonly dispid 285;
    property TaxPayerNumber: WideString readonly dispid 286;
    property HeaderLine1: WideString readonly dispid 287;
    property HeaderLine2: WideString readonly dispid 288;
    property HeaderLine3: WideString readonly dispid 289;
    property HeaderLine4: WideString readonly dispid 290;
    property StartDate: TDateTime readonly dispid 291;
    property EndDate: TDateTime readonly dispid 292;
    property StartNumber: Integer readonly dispid 293;
    property EndNumber: Integer readonly dispid 294;
    property ReportDate: TDateTime readonly dispid 295;
    property ModelName: WideString readonly dispid 296;
    property Manufacturer: WideString readonly dispid 297;
    property FirmwareVersion: WideString readonly dispid 298;
    property TaxName: WideString readonly dispid 299;
    property TaxDate: TDateTime readonly dispid 300;
    property CounterCount: Integer readonly dispid 301;
    property RewritesRemain: Integer readonly dispid 302;
    property DaysRemain: Integer readonly dispid 303;
    property LastFiscalReport: Integer readonly dispid 304;
    property LastDayClosing: Integer readonly dispid 305;
    property DayDate: TDateTime readonly dispid 306;
    property LastDocOper: TxMercOperType readonly dispid 307;
    property LastDocNumber: Integer readonly dispid 308;
    property LastRecNumber: Integer readonly dispid 309;
    property LastDocType: TxMercOperType readonly dispid 310;
    property LastDocSum: Currency readonly dispid 311;
    property LastDocDate: TDateTime readonly dispid 312;
    property RetryOperation: WordBool dispid 313;
    property ErrCode: Integer readonly dispid 314;
    property ErrCodeEx: Integer readonly dispid 315;
    property ErrMessage: WideString readonly dispid 316;
    function CheckEcrStatus(Flag: Integer): Integer; dispid 317;
    function CheckDevStatus(Flag: Integer): Integer; dispid 318;
    property EcrHour: Integer readonly dispid 319;
    property EcrMin: Integer readonly dispid 320;
    property ReportHour: Integer readonly dispid 321;
    property ReportMin: Integer readonly dispid 322;
    property DayHour: Integer readonly dispid 323;
    property DayMin: Integer readonly dispid 324;
    property LastDocHour: Integer readonly dispid 325;
    property LastDocMin: Integer readonly dispid 326;
    procedure AddGraphicHeader(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 327;
    procedure SetProtocol(Protocol: TxMercProtocol); dispid 328;
    procedure SetPrinterTimeout(Timeout: Integer); dispid 329;
    procedure SetDisplayTimeout(Timeout: Integer); dispid 330;
    procedure SetPrinterContrast(Contrast: Integer); dispid 331;
    procedure SetLeading(Leading: Integer); dispid 332;
    procedure SetCutterDisabled(Disabled: WordBool); dispid 333;
    procedure SetNarrowPaper(Narrow: WordBool); dispid 334;
    function QueryPrinterTimeout: Integer; dispid 335;
    function QueryDisplayTimeout: Integer; dispid 336;
    function QueryPrinterContrast: Integer; dispid 337;
    function QueryLeading: Integer; dispid 338;
    procedure EnableGraphicHeader(Width: Integer; Height: Integer; const Data: WideString); dispid 339;
    procedure DisableGraphicHeader; dispid 340;
    procedure AddLicence(LicType: TxMercLicenceType; const Licence: WideString); dispid 341;
    function XReport(Flags: Integer): Integer; dispid 342;
    function XReportByDep(DepartNum: Integer; Flags: Integer): Integer; dispid 343;
    function XReportByOper(OperNum: Integer; Flags: Integer): Integer; dispid 344;
    function QueryHeaderAlignment: WordBool; dispid 345;
    function QueryOperNumber: Integer; dispid 346;
    function QueryOperName(OperNum: Integer): WideString; dispid 347;
    procedure SetHeaderAlignment(Aligned: WordBool); dispid 348;
    procedure TestConnection; dispid 349;
    property VersionNumber: Integer readonly dispid 350;
    property BuildNumber: Integer readonly dispid 351;
    property Version: WideString dispid 352;
  end;

// *********************************************************************//
// Interface: IMercuryFPrt10
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C389388E-BCC0-4580-8673-47193431C2C3}
// *********************************************************************//
  IMercuryFPrt10 = interface(IMercuryFPrt9)
    ['{C389388E-BCC0-4580-8673-47193431C2C3}']
    procedure ReprintDocument; safecall;
  end;

// *********************************************************************//
// DispIntf:  IMercuryFPrt10Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C389388E-BCC0-4580-8673-47193431C2C3}
// *********************************************************************//
  IMercuryFPrt10Disp = dispinterface
    ['{C389388E-BCC0-4580-8673-47193431C2C3}']
    procedure ReprintDocument; dispid 1101;
    function PrintEKL(Flags: Integer): Integer; dispid 1001;
    function QueryEKLState: TxMercEKLState; dispid 1002;
    procedure SetOperPassword(OperNum: Integer; const OperName: WideString; 
                              const OperPassword: WideString); dispid 901;
    procedure PrintHeader; dispid 801;
    function QueryParameterBool(ParamCode: Integer): WordBool; dispid 701;
    function QueryParameterInt(ParamCode: Integer): Integer; dispid 702;
    procedure SetParameterBool(ParamCode: Integer; ParamValue: WordBool); dispid 703;
    procedure SetParameterInt(ParamCode: Integer; ParamValue: Integer); dispid 704;
    procedure WriteGraphic(Number: Integer; Width: Integer; Height: Integer; const Data: WideString); dispid 601;
    procedure PrintGraphic(Width: Integer; Height: Integer; const Data: WideString); dispid 602;
    procedure AddRegNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 501;
    procedure EKLZActivate; dispid 401;
    procedure EKLZActivationReport; dispid 402;
    procedure EKLZDayReport(DayNumber: Integer); dispid 403;
    procedure EKLZReportByNum(IsFull: WordBool; AStartNum: Integer; AEndNum: Integer); dispid 404;
    procedure EKLZReportByDate(IsFull: WordBool; AStartDate: TDateTime; AEndDate: TDateTime); dispid 405;
    procedure EKLZDocByNum(Number: Integer); dispid 406;
    procedure EKLZControlByNum(DayNumber: Integer); dispid 407;
    procedure EKLZCloseArchive; dispid 408;
    procedure EKLZQueryStatus; dispid 409;
    function QueryPaperJournal: WordBool; dispid 410;
    procedure SetPaperJournal(PaperJournal: WordBool); dispid 411;
    property EKLZSupported: WordBool readonly dispid 412;
    property EKLZActivated: WordBool readonly dispid 413;
    property EKLZOper: TxMercOperType readonly dispid 414;
    property EKLZArchiving: WordBool readonly dispid 415;
    property EKLZReporting: WordBool readonly dispid 416;
    property EKLZDayOpened: WordBool readonly dispid 417;
    property EKLZFatalError: WordBool readonly dispid 418;
    property EKLZAttention: WordBool readonly dispid 419;
    property LastRepNumber: Integer readonly dispid 420;
    property EKLZRest: Integer readonly dispid 421;
    function QueryFullJournal: WordBool; dispid 422;
    procedure SetFullJournal(FullJournal: WordBool); dispid 423;
    procedure AddEKLZData(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 424;
    property LastBuyingSum: Currency readonly dispid 425;
    function QueryAutocut: WordBool; dispid 353;
    procedure SetAutocut(Autocut: WordBool); dispid 354;
    function QueryEconomicMode: WordBool; dispid 355;
    procedure SetEconomicMode(EconomicMode: WordBool); dispid 356;
    property EcrSubVersion: Integer readonly dispid 357;
    procedure Open; dispid 201;
    procedure Close(ForceAbort: WordBool); dispid 202;
    procedure OpenReceipt(Oper: TxMercOperType); dispid 203;
    procedure AddReceiptItem(const Desc: WideString; Price: Currency; ItemIsTare: WordBool; 
                             Department: Integer; Code: Integer; Adjustment: Integer; 
                             Quantity: Integer; QuantityPrec: Integer; TaxIndex: Integer; 
                             const UnitName: WideString; Flags: Integer); dispid 204;
    procedure CancelReceipt; dispid 205;
    procedure CloseReceipt(const Account: WideString; PayType: TxMercPayType; PayCash: Currency; 
                           PayCashless: Currency; const PayInfo: WideString; CopiesNum: Integer; 
                           OperInfo: TxMercOperInfo); dispid 206;
    procedure OpenCustomDoc(UseForm: WordBool; Oper: TxMercOperType); dispid 207;
    procedure CancelCustomDoc; dispid 208;
    procedure CloseCustomDoc(PayType: TxMercPayType; Flags: Integer; HCopiesNum: Integer; 
                             VCopiesNum: Integer; VOrigOffset: Integer; HCopyOffset: Integer; 
                             VCopyOffset: Integer; FiscalCopy: Integer); dispid 209;
    procedure OpenFiscalDoc(Oper: TxMercOperType); dispid 210;
    procedure CancelFiscalDoc(BufferOnly: WordBool); dispid 211;
    procedure PrintFiscalDocBuffer; dispid 212;
    procedure CloseFiscalDoc; dispid 213;
    procedure CopyFiscalDoc; dispid 214;
    procedure AddSerialNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 215;
    procedure AddHeaderLine(LineNum: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 216;
    procedure AddDateTime(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 217;
    procedure AddOperInfo(OperInfo: TxMercOperInfo; Flags: Integer; HOffset: Integer; 
                          VOffset: Integer); dispid 218;
    procedure AddDocNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 219;
    procedure AddReceiptNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 220;
    procedure AddAccount(const Account: WideString; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 221;
    procedure AddTaxPayerNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 222;
    procedure AddItem(ItemType: TxMercItemType; Price: Currency; ItemIsTare: WordBool; 
                      Department: Integer; Code: Integer; Adjustment: Integer; Quantity: Integer; 
                      QuantityPrec: Integer; TaxIndex: Integer; const UnitName: WideString; 
                      Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 223;
    procedure AddDocPercentAdj(Value: Integer; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                               VOffset: Integer; RightOffset: Integer); dispid 224;
    procedure AddDocAmountAdj(Value: Currency; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                              VOffset: Integer; RightOffset: Integer); dispid 225;
    procedure AddTotal(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 226;
    procedure AddPay(PayType: TxMercPayType; PayCash: Currency; PayCashless: Currency; 
                     const PayInfo: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                     RightOffset: Integer); dispid 227;
    procedure AddChange(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 228;
    procedure AddTaxSum(TaxIndex: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                        RightOffset: Integer); dispid 229;
    procedure AddFiscalSign(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 230;
    procedure AddBarcode(Mask1: Integer; Mask2: Integer; Mask3: Integer; Mask4: Integer; 
                         Mask5: Integer; DoubleDensity: WordBool; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 231;
    procedure AddCustom(const Text: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 232;
    procedure RepeatOperation; dispid 233;
    procedure OpenDay(OperNum: Integer; const OperName: WideString; FullJournal: WordBool; 
                      AProtocol: TxMercProtocol); dispid 234;
    function ZReport(Flags: Integer): Integer; dispid 235;
    function FiscalRewrite(const InspPswd: WideString; const RegNum: WideString; 
                           const TaxPayerNum: WideString; const NewInspPswd: WideString): Integer; dispid 236;
    function FiscalReportByNum(const InspPswd: WideString; PrintFull: WordBool; AStartNum: Integer; 
                               AEndNum: Integer): Integer; dispid 237;
    function FiscalReportByDate(const InspPswd: WideString; PrintFull: WordBool; 
                                AStartDate: TDateTime; AEndDate: TDateTime): Integer; dispid 238;
    function FiscalReportAll(const InspPswd: WideString): Integer; dispid 239;
    procedure FeedAndCut(LineCount: Integer; CutAfterFeed: WordBool); dispid 240;
    procedure PrintNonFiscal(const Data: WideString; OpenDoc: WordBool; CloseDoc: WordBool); dispid 241;
    procedure ShowDisplay(const Data: WideString; OpenMode: WordBool; CloseMode: WordBool); dispid 242;
    procedure SetDisplayBaudRate(BaudRate: Integer); dispid 243;
    procedure ExternalPulse(Channel: Integer; TimeOn: Integer; TimeOff: Integer; Count: Integer); dispid 244;
    procedure QueryDevExStatus; dispid 245;
    procedure QueryFirmwareInfo; dispid 246;
    procedure SetHeader(const Line1: WideString; const Line2: WideString; const Line3: WideString; 
                        const Line4: WideString); dispid 247;
    procedure SetTax(Index: Integer; const TaxName: WideString; TaxRate: Integer); dispid 248;
    function QueryTax(Index: Integer): Integer; dispid 249;
    function QueryCounter(Index: Integer; NoRequest: WordBool): Currency; dispid 250;
    procedure SynchronizeEcrDateTime; dispid 251;
    procedure QueryResourceInfo(PrintInfo: WordBool); dispid 252;
    procedure QueryLastDocInfo; dispid 253;
    procedure SetParameters(Protocol: TxMercProtocol; PrnTimeout: Integer); dispid 254;
    property EcrModel: TxMercEcrModel readonly dispid 255;
    property EcrVersion: Integer readonly dispid 256;
    property Generation: Integer readonly dispid 257;
    property Protocol: TxMercProtocol readonly dispid 258;
    property EcrStatus: Integer readonly dispid 259;
    property EcrStatusMask: Integer readonly dispid 260;
    property DevStatus: Integer readonly dispid 261;
    property DevStatusMask: Integer readonly dispid 262;
    property DocStatus: TxMercDocStatus readonly dispid 263;
    property CurrentOper: TxMercOperType readonly dispid 264;
    property PortNum: Integer dispid 265;
    property BaudRate: Integer dispid 266;
    property Password: WideString dispid 267;
    property InternalTimeout: Integer dispid 268;
    property ExternalTimeout: Integer dispid 269;
    function QueryHeaderLine(LineNum: Integer): WideString; dispid 270;
    function QuerySerialNumber: WideString; dispid 271;
    procedure SetSerialNumber(const Value: WideString); dispid 272;
    function QueryTaxPayerNumber: WideString; dispid 273;
    function QueryRegNumber: WideString; dispid 274;
    function QueryEcrDateTime: TDateTime; dispid 275;
    function QueryDepartName(DepartNum: Integer): WideString; dispid 276;
    procedure SetDepartName(DepartNum: Integer; const Value: WideString); dispid 277;
    function QueryTitle(TitleNum: Integer): WideString; dispid 278;
    procedure SetTitle(TitleNum: Integer; const Value: WideString); dispid 279;
    property Active: WordBool dispid 280;
    property ConnState: TxMercConnState readonly dispid 281;
    property SaleSum: Currency readonly dispid 282;
    property BuyingSum: Currency readonly dispid 283;
    property SerialNumber: WideString readonly dispid 284;
    property RegNumber: WideString readonly dispid 285;
    property TaxPayerNumber: WideString readonly dispid 286;
    property HeaderLine1: WideString readonly dispid 287;
    property HeaderLine2: WideString readonly dispid 288;
    property HeaderLine3: WideString readonly dispid 289;
    property HeaderLine4: WideString readonly dispid 290;
    property StartDate: TDateTime readonly dispid 291;
    property EndDate: TDateTime readonly dispid 292;
    property StartNumber: Integer readonly dispid 293;
    property EndNumber: Integer readonly dispid 294;
    property ReportDate: TDateTime readonly dispid 295;
    property ModelName: WideString readonly dispid 296;
    property Manufacturer: WideString readonly dispid 297;
    property FirmwareVersion: WideString readonly dispid 298;
    property TaxName: WideString readonly dispid 299;
    property TaxDate: TDateTime readonly dispid 300;
    property CounterCount: Integer readonly dispid 301;
    property RewritesRemain: Integer readonly dispid 302;
    property DaysRemain: Integer readonly dispid 303;
    property LastFiscalReport: Integer readonly dispid 304;
    property LastDayClosing: Integer readonly dispid 305;
    property DayDate: TDateTime readonly dispid 306;
    property LastDocOper: TxMercOperType readonly dispid 307;
    property LastDocNumber: Integer readonly dispid 308;
    property LastRecNumber: Integer readonly dispid 309;
    property LastDocType: TxMercOperType readonly dispid 310;
    property LastDocSum: Currency readonly dispid 311;
    property LastDocDate: TDateTime readonly dispid 312;
    property RetryOperation: WordBool dispid 313;
    property ErrCode: Integer readonly dispid 314;
    property ErrCodeEx: Integer readonly dispid 315;
    property ErrMessage: WideString readonly dispid 316;
    function CheckEcrStatus(Flag: Integer): Integer; dispid 317;
    function CheckDevStatus(Flag: Integer): Integer; dispid 318;
    property EcrHour: Integer readonly dispid 319;
    property EcrMin: Integer readonly dispid 320;
    property ReportHour: Integer readonly dispid 321;
    property ReportMin: Integer readonly dispid 322;
    property DayHour: Integer readonly dispid 323;
    property DayMin: Integer readonly dispid 324;
    property LastDocHour: Integer readonly dispid 325;
    property LastDocMin: Integer readonly dispid 326;
    procedure AddGraphicHeader(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 327;
    procedure SetProtocol(Protocol: TxMercProtocol); dispid 328;
    procedure SetPrinterTimeout(Timeout: Integer); dispid 329;
    procedure SetDisplayTimeout(Timeout: Integer); dispid 330;
    procedure SetPrinterContrast(Contrast: Integer); dispid 331;
    procedure SetLeading(Leading: Integer); dispid 332;
    procedure SetCutterDisabled(Disabled: WordBool); dispid 333;
    procedure SetNarrowPaper(Narrow: WordBool); dispid 334;
    function QueryPrinterTimeout: Integer; dispid 335;
    function QueryDisplayTimeout: Integer; dispid 336;
    function QueryPrinterContrast: Integer; dispid 337;
    function QueryLeading: Integer; dispid 338;
    procedure EnableGraphicHeader(Width: Integer; Height: Integer; const Data: WideString); dispid 339;
    procedure DisableGraphicHeader; dispid 340;
    procedure AddLicence(LicType: TxMercLicenceType; const Licence: WideString); dispid 341;
    function XReport(Flags: Integer): Integer; dispid 342;
    function XReportByDep(DepartNum: Integer; Flags: Integer): Integer; dispid 343;
    function XReportByOper(OperNum: Integer; Flags: Integer): Integer; dispid 344;
    function QueryHeaderAlignment: WordBool; dispid 345;
    function QueryOperNumber: Integer; dispid 346;
    function QueryOperName(OperNum: Integer): WideString; dispid 347;
    procedure SetHeaderAlignment(Aligned: WordBool); dispid 348;
    procedure TestConnection; dispid 349;
    property VersionNumber: Integer readonly dispid 350;
    property BuildNumber: Integer readonly dispid 351;
    property Version: WideString dispid 352;
  end;

// *********************************************************************//
// Interface: IMercuryFPrtX10
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {10ECF5F7-72AB-4B70-8BB9-4297AC4B8EC3}
// *********************************************************************//
  IMercuryFPrtX10 = interface(IMercuryFPrtX9)
    ['{10ECF5F7-72AB-4B70-8BB9-4297AC4B8EC3}']
    procedure ReprintDocument; safecall;
  end;

// *********************************************************************//
// DispIntf:  IMercuryFPrtX10Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {10ECF5F7-72AB-4B70-8BB9-4297AC4B8EC3}
// *********************************************************************//
  IMercuryFPrtX10Disp = dispinterface
    ['{10ECF5F7-72AB-4B70-8BB9-4297AC4B8EC3}']
    procedure ReprintDocument; dispid 1201;
    function PrintEKL(Flags: Integer): Integer; dispid 1101;
    function QueryEKLState: TxMercEKLState; dispid 1102;
    procedure SetOperPassword(OperNum: Integer; const OperName: WideString; 
                              const OperPassword: WideString); dispid 1003;
    procedure PrintHeader; dispid 901;
    function QueryParameterBool(ParamCode: Integer): WordBool; dispid 801;
    function QueryParameterInt(ParamCode: Integer): Integer; dispid 802;
    procedure SetParameterBool(ParamCode: Integer; ParamValue: WordBool); dispid 803;
    procedure SetParameterInt(ParamCode: Integer; ParamValue: Integer); dispid 804;
    procedure WriteGraphic(Number: Integer; Width: Integer; Height: Integer; const Data: WideString); dispid 701;
    procedure PrintGraphic(Width: Integer; Height: Integer; const Data: WideString); dispid 702;
    procedure AddRegNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 601;
    procedure EKLZActivate; dispid 401;
    procedure EKLZActivationReport; dispid 402;
    procedure EKLZDayReport(DayNumber: Integer); dispid 403;
    procedure EKLZReportByNum(IsFull: WordBool; AStartNum: Integer; AEndNum: Integer); dispid 404;
    procedure EKLZReportByDate(IsFull: WordBool; AStartDate: TDateTime; AEndDate: TDateTime); dispid 405;
    procedure EKLZDocByNum(Number: Integer); dispid 406;
    procedure EKLZControlByNum(DayNumber: Integer); dispid 407;
    procedure EKLZCloseArchive; dispid 408;
    procedure EKLZQueryStatus; dispid 409;
    function QueryPaperJournal: WordBool; dispid 410;
    procedure SetPaperJournal(PaperJournal: WordBool); dispid 411;
    property EKLZSupported: WordBool readonly dispid 412;
    property EKLZActivated: WordBool readonly dispid 413;
    property EKLZOper: TxMercOperType readonly dispid 414;
    property EKLZArchiving: WordBool readonly dispid 415;
    property EKLZReporting: WordBool readonly dispid 416;
    property EKLZDayOpened: WordBool readonly dispid 417;
    property EKLZFatalError: WordBool readonly dispid 418;
    property EKLZAttention: WordBool readonly dispid 419;
    function QueryFullJournal: WordBool; dispid 501;
    procedure SetFullJournal(FullJournal: WordBool); dispid 502;
    procedure AddEKLZData(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 503;
    property LastBuyingSum: Currency readonly dispid 504;
    function QueryAutocut: WordBool; dispid 353;
    procedure SetAutocut(Autocut: WordBool); dispid 354;
    function QueryEconomicMode: WordBool; dispid 355;
    procedure SetEconomicMode(EconomicMode: WordBool); dispid 356;
    property EcrSubVersion: Integer readonly dispid 357;
    property BorderSize: Integer dispid 1001;
    property ShowState: WordBool dispid 1002;
    property Enabled: WordBool dispid -514;
    procedure AboutBox; dispid -552;
    procedure Open; dispid 201;
    procedure Close(ForceAbort: WordBool); dispid 202;
    procedure OpenReceipt(Oper: TxMercOperType); dispid 203;
    procedure AddReceiptItem(const Desc: WideString; Price: Currency; ItemIsTare: WordBool; 
                             Department: Integer; Code: Integer; Adjustment: Integer; 
                             Quantity: Integer; QuantityPrec: Integer; TaxIndex: Integer; 
                             const UnitName: WideString; Flags: Integer); dispid 204;
    procedure CancelReceipt; dispid 205;
    procedure CloseReceipt(const Account: WideString; PayType: TxMercPayType; PayCash: Currency; 
                           PayCashless: Currency; const PayInfo: WideString; CopiesNum: Integer; 
                           OperInfo: TxMercOperInfo); dispid 206;
    procedure OpenCustomDoc(UseForm: WordBool; Oper: TxMercOperType); dispid 207;
    procedure CancelCustomDoc; dispid 208;
    procedure CloseCustomDoc(PayType: TxMercPayType; Flags: Integer; HCopiesNum: Integer; 
                             VCopiesNum: Integer; VOrigOffset: Integer; HCopyOffset: Integer; 
                             VCopyOffset: Integer; FiscalCopy: Integer); dispid 209;
    procedure OpenFiscalDoc(Oper: TxMercOperType); dispid 210;
    procedure CancelFiscalDoc(BufferOnly: WordBool); dispid 211;
    procedure PrintFiscalDocBuffer; dispid 212;
    procedure CloseFiscalDoc; dispid 213;
    procedure CopyFiscalDoc; dispid 214;
    procedure AddSerialNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 215;
    procedure AddHeaderLine(LineNum: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 216;
    procedure AddDateTime(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 217;
    procedure AddOperInfo(OperInfo: TxMercOperInfo; Flags: Integer; HOffset: Integer; 
                          VOffset: Integer); dispid 218;
    procedure AddDocNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 219;
    procedure AddReceiptNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 220;
    procedure AddAccount(const Account: WideString; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 221;
    procedure AddTaxPayerNumber(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 222;
    procedure AddItem(ItemType: TxMercItemType; Price: Currency; ItemIsTare: WordBool; 
                      Department: Integer; Code: Integer; Adjustment: Integer; Quantity: Integer; 
                      QuantityPrec: Integer; TaxIndex: Integer; const UnitName: WideString; 
                      Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 223;
    procedure AddDocPercentAdj(Value: Integer; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                               VOffset: Integer; RightOffset: Integer); dispid 224;
    procedure AddDocAmountAdj(Value: Currency; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                              VOffset: Integer; RightOffset: Integer); dispid 225;
    procedure AddTotal(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 226;
    procedure AddPay(PayType: TxMercPayType; PayCash: Currency; PayCashless: Currency; 
                     const PayInfo: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                     RightOffset: Integer); dispid 227;
    procedure AddChange(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer); dispid 228;
    procedure AddTaxSum(TaxIndex: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                        RightOffset: Integer); dispid 229;
    procedure AddFiscalSign(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 230;
    procedure AddBarcode(Mask1: Integer; Mask2: Integer; Mask3: Integer; Mask4: Integer; 
                         Mask5: Integer; DoubleDensity: WordBool; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer); dispid 231;
    procedure AddCustom(const Text: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 232;
    procedure RepeatOperation; dispid 233;
    procedure OpenDay(OperNum: Integer; const OperName: WideString; FullJournal: WordBool; 
                      AProtocol: TxMercProtocol); dispid 234;
    function ZReport(Flags: Integer): Integer; dispid 235;
    function FiscalRewrite(const InspPswd: WideString; const RegNum: WideString; 
                           const TaxPayerNum: WideString; const NewInspPswd: WideString): Integer; dispid 236;
    function FiscalReportByNum(const InspPswd: WideString; PrintFull: WordBool; AStartNum: Integer; 
                               AEndNum: Integer): Integer; dispid 237;
    function FiscalReportByDate(const InspPswd: WideString; PrintFull: WordBool; 
                                AStartDate: TDateTime; AEndDate: TDateTime): Integer; dispid 238;
    function FiscalReportAll(const InspPswd: WideString): Integer; dispid 239;
    procedure FeedAndCut(LineCount: Integer; CutAfterFeed: WordBool); dispid 240;
    procedure PrintNonFiscal(const Data: WideString; OpenDoc: WordBool; CloseDoc: WordBool); dispid 241;
    procedure ShowDisplay(const Data: WideString; OpenMode: WordBool; CloseMode: WordBool); dispid 242;
    procedure SetDisplayBaudRate(BaudRate: Integer); dispid 243;
    procedure ExternalPulse(Channel: Integer; TimeOn: Integer; TimeOff: Integer; Count: Integer); dispid 244;
    procedure QueryDevExStatus; dispid 245;
    procedure QueryFirmwareInfo; dispid 246;
    procedure SetHeader(const Line1: WideString; const Line2: WideString; const Line3: WideString; 
                        const Line4: WideString); dispid 247;
    procedure SetTax(Index: Integer; const TaxName: WideString; TaxRate: Integer); dispid 248;
    function QueryTax(Index: Integer): Integer; dispid 249;
    function QueryCounter(Index: Integer; NoRequest: WordBool): Currency; dispid 250;
    procedure SynchronizeEcrDateTime; dispid 251;
    procedure QueryResourceInfo(PrintInfo: WordBool); dispid 252;
    procedure QueryLastDocInfo; dispid 253;
    procedure SetParameters(Protocol: TxMercProtocol; PrnTimeout: Integer); dispid 254;
    property EcrModel: TxMercEcrModel readonly dispid 255;
    property EcrVersion: Integer readonly dispid 256;
    property Generation: Integer readonly dispid 257;
    property Protocol: TxMercProtocol readonly dispid 258;
    property EcrStatus: Integer readonly dispid 259;
    property EcrStatusMask: Integer readonly dispid 260;
    property DevStatus: Integer readonly dispid 261;
    property DevStatusMask: Integer readonly dispid 262;
    property DocStatus: TxMercDocStatus readonly dispid 263;
    property CurrentOper: TxMercOperType readonly dispid 264;
    property PortNum: Integer dispid 265;
    property BaudRate: Integer dispid 266;
    property Password: WideString dispid 267;
    property InternalTimeout: Integer dispid 268;
    property ExternalTimeout: Integer dispid 269;
    function QueryHeaderLine(LineNum: Integer): WideString; dispid 270;
    function QuerySerialNumber: WideString; dispid 271;
    procedure SetSerialNumber(const Value: WideString); dispid 272;
    function QueryTaxPayerNumber: WideString; dispid 273;
    function QueryRegNumber: WideString; dispid 274;
    function QueryEcrDateTime: TDateTime; dispid 275;
    function QueryDepartName(DepartNum: Integer): WideString; dispid 276;
    procedure SetDepartName(DepartNum: Integer; const Value: WideString); dispid 277;
    function QueryTitle(TitleNum: Integer): WideString; dispid 278;
    procedure SetTitle(TitleNum: Integer; const Value: WideString); dispid 279;
    property Active: WordBool dispid 280;
    property ConnState: TxMercConnState readonly dispid 281;
    property SaleSum: Currency readonly dispid 282;
    property BuyingSum: Currency readonly dispid 283;
    property SerialNumber: WideString readonly dispid 284;
    property RegNumber: WideString readonly dispid 285;
    property TaxPayerNumber: WideString readonly dispid 286;
    property HeaderLine1: WideString readonly dispid 287;
    property HeaderLine2: WideString readonly dispid 288;
    property HeaderLine3: WideString readonly dispid 289;
    property HeaderLine4: WideString readonly dispid 290;
    property StartDate: TDateTime readonly dispid 291;
    property EndDate: TDateTime readonly dispid 292;
    property StartNumber: Integer readonly dispid 293;
    property EndNumber: Integer readonly dispid 294;
    property ReportDate: TDateTime readonly dispid 295;
    property ModelName: WideString readonly dispid 296;
    property Manufacturer: WideString readonly dispid 297;
    property FirmwareVersion: WideString readonly dispid 298;
    property TaxName: WideString readonly dispid 299;
    property TaxDate: TDateTime readonly dispid 300;
    property CounterCount: Integer readonly dispid 301;
    property RewritesRemain: Integer readonly dispid 302;
    property DaysRemain: Integer readonly dispid 303;
    property LastFiscalReport: Integer readonly dispid 304;
    property LastDayClosing: Integer readonly dispid 305;
    property DayDate: TDateTime readonly dispid 306;
    property LastDocOper: TxMercOperType readonly dispid 307;
    property LastDocNumber: Integer readonly dispid 308;
    property LastRecNumber: Integer readonly dispid 309;
    property LastDocType: TxMercOperType readonly dispid 310;
    property LastDocSum: Currency readonly dispid 311;
    property LastDocDate: TDateTime readonly dispid 312;
    property RetryOperation: WordBool dispid 313;
    property ErrCode: Integer readonly dispid 314;
    property ErrCodeEx: Integer readonly dispid 315;
    property ErrMessage: WideString readonly dispid 316;
    function CheckEcrStatus(Flag: Integer): Integer; dispid 317;
    function CheckDevStatus(Flag: Integer): Integer; dispid 318;
    property EcrHour: Integer readonly dispid 319;
    property EcrMin: Integer readonly dispid 320;
    property ReportHour: Integer readonly dispid 321;
    property ReportMin: Integer readonly dispid 322;
    property DayHour: Integer readonly dispid 323;
    property DayMin: Integer readonly dispid 324;
    property LastDocHour: Integer readonly dispid 325;
    property LastDocMin: Integer readonly dispid 326;
    procedure AddGraphicHeader(Flags: Integer; HOffset: Integer; VOffset: Integer); dispid 327;
    procedure SetProtocol(Protocol: TxMercProtocol); dispid 328;
    procedure SetPrinterTimeout(Timeout: Integer); dispid 329;
    procedure SetDisplayTimeout(Timeout: Integer); dispid 330;
    procedure SetPrinterContrast(Contrast: Integer); dispid 331;
    procedure SetLeading(Leading: Integer); dispid 332;
    procedure SetCutterDisabled(Disabled: WordBool); dispid 333;
    procedure SetNarrowPaper(Narrow: WordBool); dispid 334;
    function QueryPrinterTimeout: Integer; dispid 335;
    function QueryDisplayTimeout: Integer; dispid 336;
    function QueryPrinterContrast: Integer; dispid 337;
    function QueryLeading: Integer; dispid 338;
    procedure EnableGraphicHeader(Width: Integer; Height: Integer; const Data: WideString); dispid 339;
    procedure DisableGraphicHeader; dispid 340;
    procedure AddLicence(LicType: TxMercLicenceType; const Licence: WideString); dispid 341;
    function XReport(Flags: Integer): Integer; dispid 342;
    function XReportByDep(DepartNum: Integer; Flags: Integer): Integer; dispid 343;
    function XReportByOper(OperNum: Integer; Flags: Integer): Integer; dispid 344;
    function QueryHeaderAlignment: WordBool; dispid 345;
    function QueryOperNumber: Integer; dispid 346;
    function QueryOperName(OperNum: Integer): WideString; dispid 347;
    procedure SetHeaderAlignment(Aligned: WordBool); dispid 348;
    procedure TestConnection; dispid 349;
    property VersionNumber: Integer readonly dispid 350;
    property BuildNumber: Integer readonly dispid 351;
    property Version: WideString dispid 352;
  end;

// *********************************************************************//
// The Class CoMercuryFPrtCOM provides a Create and CreateRemote method to          
// create instances of the default interface IMercuryFPrt10 exposed by              
// the CoClass MercuryFPrtCOM. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMercuryFPrtCOM = class
    class function Create: IMercuryFPrt10;
    class function CreateRemote(const MachineName: string): IMercuryFPrt10;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TMercuryFPrtX
// Help String      : Инкотекс: Фискальные регистраторы "Меркурий"
// Default Interface: IMercuryFPrtX10
// Def. Intf. DISP? : No
// Event   Interface: IMercuryFPrtEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TMercuryFPrtX = class(TOleControl)
  private
    FOnNoResponse: TNotifyEvent;
    FOnStatusUpdate: TNotifyEvent;
    FOnConnStateUpdate: TNotifyEvent;
    FOnPrinterError: TNotifyEvent;
    FOnDisplayError: TNotifyEvent;
    FIntf: IMercuryFPrtX10;
    function  GetControlInterface: IMercuryFPrtX10;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure Open;
    procedure Close(ForceAbort: WordBool);
    procedure OpenReceipt(Oper: TxMercOperType);
    procedure AddReceiptItem(const Desc: WideString; Price: Currency; ItemIsTare: WordBool; 
                             Department: Integer; Code: Integer; Adjustment: Integer; 
                             Quantity: Integer; QuantityPrec: Integer; TaxIndex: Integer; 
                             const UnitName: WideString; Flags: Integer);
    procedure CancelReceipt;
    procedure CloseReceipt(const Account: WideString; PayType: TxMercPayType; PayCash: Currency; 
                           PayCashless: Currency; const PayInfo: WideString; CopiesNum: Integer; 
                           OperInfo: TxMercOperInfo);
    procedure OpenCustomDoc(UseForm: WordBool; Oper: TxMercOperType);
    procedure CancelCustomDoc;
    procedure CloseCustomDoc(PayType: TxMercPayType; Flags: Integer; HCopiesNum: Integer; 
                             VCopiesNum: Integer; VOrigOffset: Integer; HCopyOffset: Integer; 
                             VCopyOffset: Integer; FiscalCopy: Integer);
    procedure OpenFiscalDoc(Oper: TxMercOperType);
    procedure CancelFiscalDoc(BufferOnly: WordBool);
    procedure PrintFiscalDocBuffer;
    procedure CloseFiscalDoc;
    procedure CopyFiscalDoc;
    procedure AddSerialNumber(Flags: Integer; HOffset: Integer; VOffset: Integer);
    procedure AddHeaderLine(LineNum: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer);
    procedure AddDateTime(Flags: Integer; HOffset: Integer; VOffset: Integer);
    procedure AddOperInfo(OperInfo: TxMercOperInfo; Flags: Integer; HOffset: Integer; 
                          VOffset: Integer);
    procedure AddDocNumber(Flags: Integer; HOffset: Integer; VOffset: Integer);
    procedure AddReceiptNumber(Flags: Integer; HOffset: Integer; VOffset: Integer);
    procedure AddAccount(const Account: WideString; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer);
    procedure AddTaxPayerNumber(Flags: Integer; HOffset: Integer; VOffset: Integer);
    procedure AddItem(ItemType: TxMercItemType; Price: Currency; ItemIsTare: WordBool; 
                      Department: Integer; Code: Integer; Adjustment: Integer; Quantity: Integer; 
                      QuantityPrec: Integer; TaxIndex: Integer; const UnitName: WideString; 
                      Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer);
    procedure AddDocPercentAdj(Value: Integer; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                               VOffset: Integer; RightOffset: Integer);
    procedure AddDocAmountAdj(Value: Currency; TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                              VOffset: Integer; RightOffset: Integer);
    procedure AddTotal(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer);
    procedure AddPay(PayType: TxMercPayType; PayCash: Currency; PayCashless: Currency; 
                     const PayInfo: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                     RightOffset: Integer);
    procedure AddChange(Flags: Integer; HOffset: Integer; VOffset: Integer; RightOffset: Integer);
    procedure AddTaxSum(TaxIndex: Integer; Flags: Integer; HOffset: Integer; VOffset: Integer; 
                        RightOffset: Integer);
    procedure AddFiscalSign(Flags: Integer; HOffset: Integer; VOffset: Integer);
    procedure AddBarcode(Mask1: Integer; Mask2: Integer; Mask3: Integer; Mask4: Integer; 
                         Mask5: Integer; DoubleDensity: WordBool; Flags: Integer; HOffset: Integer; 
                         VOffset: Integer);
    procedure AddCustom(const Text: WideString; Flags: Integer; HOffset: Integer; VOffset: Integer);
    procedure RepeatOperation;
    procedure OpenDay(OperNum: Integer; const OperName: WideString; FullJournal: WordBool; 
                      AProtocol: TxMercProtocol);
    function ZReport(Flags: Integer): Integer;
    function FiscalRewrite(const InspPswd: WideString; const RegNum: WideString; 
                           const TaxPayerNum: WideString; const NewInspPswd: WideString): Integer;
    function FiscalReportByNum(const InspPswd: WideString; PrintFull: WordBool; AStartNum: Integer; 
                               AEndNum: Integer): Integer;
    function FiscalReportByDate(const InspPswd: WideString; PrintFull: WordBool; 
                                AStartDate: TDateTime; AEndDate: TDateTime): Integer;
    function FiscalReportAll(const InspPswd: WideString): Integer;
    procedure FeedAndCut(LineCount: Integer; CutAfterFeed: WordBool);
    procedure PrintNonFiscal(const Data: WideString; OpenDoc: WordBool; CloseDoc: WordBool);
    procedure ShowDisplay(const Data: WideString; OpenMode: WordBool; CloseMode: WordBool);
    procedure SetDisplayBaudRate(BaudRate: Integer);
    procedure ExternalPulse(Channel: Integer; TimeOn: Integer; TimeOff: Integer; Count: Integer);
    procedure QueryDevExStatus;
    procedure QueryFirmwareInfo;
    procedure SetHeader(const Line1: WideString; const Line2: WideString; const Line3: WideString; 
                        const Line4: WideString);
    procedure SetTax(Index: Integer; const TaxName: WideString; TaxRate: Integer);
    function QueryTax(Index: Integer): Integer;
    function QueryCounter(Index: Integer; NoRequest: WordBool): Currency;
    procedure SynchronizeEcrDateTime;
    procedure QueryResourceInfo(PrintInfo: WordBool);
    procedure QueryLastDocInfo;
    procedure SetParameters(Protocol: TxMercProtocol; PrnTimeout: Integer);
    function QueryHeaderLine(LineNum: Integer): WideString;
    function QuerySerialNumber: WideString;
    procedure SetSerialNumber(const Value: WideString);
    function QueryTaxPayerNumber: WideString;
    function QueryRegNumber: WideString;
    function QueryEcrDateTime: TDateTime;
    function QueryDepartName(DepartNum: Integer): WideString;
    procedure SetDepartName(DepartNum: Integer; const Value: WideString);
    function QueryTitle(TitleNum: Integer): WideString;
    procedure SetTitle(TitleNum: Integer; const Value: WideString);
    function CheckEcrStatus(Flag: Integer): Integer;
    function CheckDevStatus(Flag: Integer): Integer;
    procedure AddGraphicHeader(Flags: Integer; HOffset: Integer; VOffset: Integer);
    procedure SetProtocol(Protocol: TxMercProtocol);
    procedure SetPrinterTimeout(Timeout: Integer);
    procedure SetDisplayTimeout(Timeout: Integer);
    procedure SetPrinterContrast(Contrast: Integer);
    procedure SetLeading(Leading: Integer);
    procedure SetCutterDisabled(Disabled: WordBool);
    procedure SetNarrowPaper(Narrow: WordBool);
    function QueryPrinterTimeout: Integer;
    function QueryDisplayTimeout: Integer;
    function QueryPrinterContrast: Integer;
    function QueryLeading: Integer;
    procedure EnableGraphicHeader(Width: Integer; Height: Integer; const Data: WideString);
    procedure DisableGraphicHeader;
    procedure AddLicence(LicType: TxMercLicenceType; const Licence: WideString);
    function XReport(Flags: Integer): Integer;
    function XReportByDep(DepartNum: Integer; Flags: Integer): Integer;
    function XReportByOper(OperNum: Integer; Flags: Integer): Integer;
    function QueryHeaderAlignment: WordBool;
    function QueryOperNumber: Integer;
    function QueryOperName(OperNum: Integer): WideString;
    procedure SetHeaderAlignment(Aligned: WordBool);
    procedure TestConnection;
    procedure AboutBox;
    function QueryAutocut: WordBool;
    procedure SetAutocut(Autocut: WordBool);
    function QueryEconomicMode: WordBool;
    procedure SetEconomicMode(EconomicMode: WordBool);
    procedure EKLZActivate;
    procedure EKLZActivationReport;
    procedure EKLZDayReport(DayNumber: Integer);
    procedure EKLZReportByNum(IsFull: WordBool; AStartNum: Integer; AEndNum: Integer);
    procedure EKLZReportByDate(IsFull: WordBool; AStartDate: TDateTime; AEndDate: TDateTime);
    procedure EKLZDocByNum(Number: Integer);
    procedure EKLZControlByNum(DayNumber: Integer);
    procedure EKLZCloseArchive;
    procedure EKLZQueryStatus;
    function QueryPaperJournal: WordBool;
    procedure SetPaperJournal(PaperJournal: WordBool);
    function QueryFullJournal: WordBool;
    procedure SetFullJournal(FullJournal: WordBool);
    procedure AddEKLZData(Flags: Integer; HOffset: Integer; VOffset: Integer);
    procedure AddRegNumber(Flags: Integer; HOffset: Integer; VOffset: Integer);
    procedure WriteGraphic(Number: Integer; Width: Integer; Height: Integer; const Data: WideString);
    procedure PrintGraphic(Width: Integer; Height: Integer; const Data: WideString);
    function QueryParameterBool(ParamCode: Integer): WordBool;
    function QueryParameterInt(ParamCode: Integer): Integer;
    procedure SetParameterBool(ParamCode: Integer; ParamValue: WordBool);
    procedure SetParameterInt(ParamCode: Integer; ParamValue: Integer);
    procedure PrintHeader;
    procedure SetOperPassword(OperNum: Integer; const OperName: WideString; 
                              const OperPassword: WideString);
    function PrintEKL(Flags: Integer): Integer;
    function QueryEKLState: TxMercEKLState;
    procedure ReprintDocument;
    property  ControlInterface: IMercuryFPrtX10 read GetControlInterface;
    property  DefaultInterface: IMercuryFPrtX10 read GetControlInterface;
    property EcrModel: TOleEnum index 255 read GetTOleEnumProp;
    property EcrVersion: Integer index 256 read GetIntegerProp;
    property Generation: Integer index 257 read GetIntegerProp;
    property Protocol: TOleEnum index 258 read GetTOleEnumProp;
    property EcrStatus: Integer index 259 read GetIntegerProp;
    property EcrStatusMask: Integer index 260 read GetIntegerProp;
    property DevStatus: Integer index 261 read GetIntegerProp;
    property DevStatusMask: Integer index 262 read GetIntegerProp;
    property DocStatus: TOleEnum index 263 read GetTOleEnumProp;
    property CurrentOper: TOleEnum index 264 read GetTOleEnumProp;
    property ConnState: TOleEnum index 281 read GetTOleEnumProp;
    property SaleSum: Currency index 282 read GetCurrencyProp;
    property BuyingSum: Currency index 283 read GetCurrencyProp;
    property SerialNumber: WideString index 284 read GetWideStringProp;
    property RegNumber: WideString index 285 read GetWideStringProp;
    property TaxPayerNumber: WideString index 286 read GetWideStringProp;
    property HeaderLine1: WideString index 287 read GetWideStringProp;
    property HeaderLine2: WideString index 288 read GetWideStringProp;
    property HeaderLine3: WideString index 289 read GetWideStringProp;
    property HeaderLine4: WideString index 290 read GetWideStringProp;
    property StartDate: TDateTime index 291 read GetTDateTimeProp;
    property EndDate: TDateTime index 292 read GetTDateTimeProp;
    property StartNumber: Integer index 293 read GetIntegerProp;
    property EndNumber: Integer index 294 read GetIntegerProp;
    property ReportDate: TDateTime index 295 read GetTDateTimeProp;
    property ModelName: WideString index 296 read GetWideStringProp;
    property Manufacturer: WideString index 297 read GetWideStringProp;
    property FirmwareVersion: WideString index 298 read GetWideStringProp;
    property TaxName: WideString index 299 read GetWideStringProp;
    property TaxDate: TDateTime index 300 read GetTDateTimeProp;
    property CounterCount: Integer index 301 read GetIntegerProp;
    property RewritesRemain: Integer index 302 read GetIntegerProp;
    property DaysRemain: Integer index 303 read GetIntegerProp;
    property LastFiscalReport: Integer index 304 read GetIntegerProp;
    property LastDayClosing: Integer index 305 read GetIntegerProp;
    property DayDate: TDateTime index 306 read GetTDateTimeProp;
    property LastDocOper: TOleEnum index 307 read GetTOleEnumProp;
    property LastDocNumber: Integer index 308 read GetIntegerProp;
    property LastRecNumber: Integer index 309 read GetIntegerProp;
    property LastDocType: TOleEnum index 310 read GetTOleEnumProp;
    property LastDocSum: Currency index 311 read GetCurrencyProp;
    property LastDocDate: TDateTime index 312 read GetTDateTimeProp;
    property ErrCode: Integer index 314 read GetIntegerProp;
    property ErrCodeEx: Integer index 315 read GetIntegerProp;
    property ErrMessage: WideString index 316 read GetWideStringProp;
    property EcrHour: Integer index 319 read GetIntegerProp;
    property EcrMin: Integer index 320 read GetIntegerProp;
    property ReportHour: Integer index 321 read GetIntegerProp;
    property ReportMin: Integer index 322 read GetIntegerProp;
    property DayHour: Integer index 323 read GetIntegerProp;
    property DayMin: Integer index 324 read GetIntegerProp;
    property LastDocHour: Integer index 325 read GetIntegerProp;
    property LastDocMin: Integer index 326 read GetIntegerProp;
    property VersionNumber: Integer index 350 read GetIntegerProp;
    property BuildNumber: Integer index 351 read GetIntegerProp;
    property EcrSubVersion: Integer index 357 read GetIntegerProp;
    property EKLZSupported: WordBool index 412 read GetWordBoolProp;
    property EKLZActivated: WordBool index 413 read GetWordBoolProp;
    property EKLZOper: TOleEnum index 414 read GetTOleEnumProp;
    property EKLZArchiving: WordBool index 415 read GetWordBoolProp;
    property EKLZReporting: WordBool index 416 read GetWordBoolProp;
    property EKLZDayOpened: WordBool index 417 read GetWordBoolProp;
    property EKLZFatalError: WordBool index 418 read GetWordBoolProp;
    property EKLZAttention: WordBool index 419 read GetWordBoolProp;
    property LastBuyingSum: Currency index 504 read GetCurrencyProp;
  published
    property Anchors;
    property  TabStop;
    property  Align;
    property  DragCursor;
    property  DragMode;
    property  ParentShowHint;
    property  PopupMenu;
    property  ShowHint;
    property  TabOrder;
    property  Visible;
    property  OnDragDrop;
    property  OnDragOver;
    property  OnEndDrag;
    property  OnEnter;
    property  OnExit;
    property  OnStartDrag;
    property PortNum: Integer index 265 read GetIntegerProp write SetIntegerProp stored False;
    property BaudRate: Integer index 266 read GetIntegerProp write SetIntegerProp stored False;
    property Password: WideString index 267 read GetWideStringProp write SetWideStringProp stored False;
    property InternalTimeout: Integer index 268 read GetIntegerProp write SetIntegerProp stored False;
    property ExternalTimeout: Integer index 269 read GetIntegerProp write SetIntegerProp stored False;
    property Active: WordBool index 280 read GetWordBoolProp write SetWordBoolProp stored False;
    property RetryOperation: WordBool index 313 read GetWordBoolProp write SetWordBoolProp stored False;
    property Version: WideString index 352 read GetWideStringProp write SetWideStringProp stored False;
    property BorderSize: Integer index 1001 read GetIntegerProp write SetIntegerProp stored False;
    property ShowState: WordBool index 1002 read GetWordBoolProp write SetWordBoolProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property OnNoResponse: TNotifyEvent read FOnNoResponse write FOnNoResponse;
    property OnStatusUpdate: TNotifyEvent read FOnStatusUpdate write FOnStatusUpdate;
    property OnConnStateUpdate: TNotifyEvent read FOnConnStateUpdate write FOnConnStateUpdate;
    property OnPrinterError: TNotifyEvent read FOnPrinterError write FOnPrinterError;
    property OnDisplayError: TNotifyEvent read FOnDisplayError write FOnDisplayError;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoMercuryFPrtCOM.Create: IMercuryFPrt10;
begin
  Result := CreateComObject(CLASS_MercuryFPrtCOM) as IMercuryFPrt10;
end;

class function CoMercuryFPrtCOM.CreateRemote(const MachineName: string): IMercuryFPrt10;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MercuryFPrtCOM) as IMercuryFPrt10;
end;

procedure TMercuryFPrtX.InitControlData;
const
  CEventDispIDs: array [0..4] of DWORD = (
    $000000C9, $000000CC, $000000CD, $000000CA, $000000CB);
  CControlData: TControlData2 = (
    ClassID: '{ED0257F0-3434-4934-B6A9-D37E14C55986}';
    EventIID: '{2E1B3242-7861-424F-B925-E230D966DDAE}';
    EventCount: 5;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$00000000*);
    Flags: $00000008;
    Version: 401);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnNoResponse) - Cardinal(Self);
end;

procedure TMercuryFPrtX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IMercuryFPrtX10;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TMercuryFPrtX.GetControlInterface: IMercuryFPrtX10;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TMercuryFPrtX.Open;
begin
  DefaultInterface.Open;
end;

procedure TMercuryFPrtX.Close(ForceAbort: WordBool);
begin
  DefaultInterface.Close(ForceAbort);
end;

procedure TMercuryFPrtX.OpenReceipt(Oper: TxMercOperType);
begin
  DefaultInterface.OpenReceipt(Oper);
end;

procedure TMercuryFPrtX.AddReceiptItem(const Desc: WideString; Price: Currency; 
                                       ItemIsTare: WordBool; Department: Integer; Code: Integer; 
                                       Adjustment: Integer; Quantity: Integer; 
                                       QuantityPrec: Integer; TaxIndex: Integer; 
                                       const UnitName: WideString; Flags: Integer);
begin
  DefaultInterface.AddReceiptItem(Desc, Price, ItemIsTare, Department, Code, Adjustment, Quantity, 
                                  QuantityPrec, TaxIndex, UnitName, Flags);
end;

procedure TMercuryFPrtX.CancelReceipt;
begin
  DefaultInterface.CancelReceipt;
end;

procedure TMercuryFPrtX.CloseReceipt(const Account: WideString; PayType: TxMercPayType; 
                                     PayCash: Currency; PayCashless: Currency; 
                                     const PayInfo: WideString; CopiesNum: Integer; 
                                     OperInfo: TxMercOperInfo);
begin
  DefaultInterface.CloseReceipt(Account, PayType, PayCash, PayCashless, PayInfo, CopiesNum, OperInfo);
end;

procedure TMercuryFPrtX.OpenCustomDoc(UseForm: WordBool; Oper: TxMercOperType);
begin
  DefaultInterface.OpenCustomDoc(UseForm, Oper);
end;

procedure TMercuryFPrtX.CancelCustomDoc;
begin
  DefaultInterface.CancelCustomDoc;
end;

procedure TMercuryFPrtX.CloseCustomDoc(PayType: TxMercPayType; Flags: Integer; HCopiesNum: Integer; 
                                       VCopiesNum: Integer; VOrigOffset: Integer; 
                                       HCopyOffset: Integer; VCopyOffset: Integer; 
                                       FiscalCopy: Integer);
begin
  DefaultInterface.CloseCustomDoc(PayType, Flags, HCopiesNum, VCopiesNum, VOrigOffset, HCopyOffset, 
                                  VCopyOffset, FiscalCopy);
end;

procedure TMercuryFPrtX.OpenFiscalDoc(Oper: TxMercOperType);
begin
  DefaultInterface.OpenFiscalDoc(Oper);
end;

procedure TMercuryFPrtX.CancelFiscalDoc(BufferOnly: WordBool);
begin
  DefaultInterface.CancelFiscalDoc(BufferOnly);
end;

procedure TMercuryFPrtX.PrintFiscalDocBuffer;
begin
  DefaultInterface.PrintFiscalDocBuffer;
end;

procedure TMercuryFPrtX.CloseFiscalDoc;
begin
  DefaultInterface.CloseFiscalDoc;
end;

procedure TMercuryFPrtX.CopyFiscalDoc;
begin
  DefaultInterface.CopyFiscalDoc;
end;

procedure TMercuryFPrtX.AddSerialNumber(Flags: Integer; HOffset: Integer; VOffset: Integer);
begin
  DefaultInterface.AddSerialNumber(Flags, HOffset, VOffset);
end;

procedure TMercuryFPrtX.AddHeaderLine(LineNum: Integer; Flags: Integer; HOffset: Integer; 
                                      VOffset: Integer);
begin
  DefaultInterface.AddHeaderLine(LineNum, Flags, HOffset, VOffset);
end;

procedure TMercuryFPrtX.AddDateTime(Flags: Integer; HOffset: Integer; VOffset: Integer);
begin
  DefaultInterface.AddDateTime(Flags, HOffset, VOffset);
end;

procedure TMercuryFPrtX.AddOperInfo(OperInfo: TxMercOperInfo; Flags: Integer; HOffset: Integer; 
                                    VOffset: Integer);
begin
  DefaultInterface.AddOperInfo(OperInfo, Flags, HOffset, VOffset);
end;

procedure TMercuryFPrtX.AddDocNumber(Flags: Integer; HOffset: Integer; VOffset: Integer);
begin
  DefaultInterface.AddDocNumber(Flags, HOffset, VOffset);
end;

procedure TMercuryFPrtX.AddReceiptNumber(Flags: Integer; HOffset: Integer; VOffset: Integer);
begin
  DefaultInterface.AddReceiptNumber(Flags, HOffset, VOffset);
end;

procedure TMercuryFPrtX.AddAccount(const Account: WideString; Flags: Integer; HOffset: Integer; 
                                   VOffset: Integer);
begin
  DefaultInterface.AddAccount(Account, Flags, HOffset, VOffset);
end;

procedure TMercuryFPrtX.AddTaxPayerNumber(Flags: Integer; HOffset: Integer; VOffset: Integer);
begin
  DefaultInterface.AddTaxPayerNumber(Flags, HOffset, VOffset);
end;

procedure TMercuryFPrtX.AddItem(ItemType: TxMercItemType; Price: Currency; ItemIsTare: WordBool; 
                                Department: Integer; Code: Integer; Adjustment: Integer; 
                                Quantity: Integer; QuantityPrec: Integer; TaxIndex: Integer; 
                                const UnitName: WideString; Flags: Integer; HOffset: Integer; 
                                VOffset: Integer; RightOffset: Integer);
begin
  DefaultInterface.AddItem(ItemType, Price, ItemIsTare, Department, Code, Adjustment, Quantity, 
                           QuantityPrec, TaxIndex, UnitName, Flags, HOffset, VOffset, RightOffset);
end;

procedure TMercuryFPrtX.AddDocPercentAdj(Value: Integer; TaxIndex: Integer; Flags: Integer; 
                                         HOffset: Integer; VOffset: Integer; RightOffset: Integer);
begin
  DefaultInterface.AddDocPercentAdj(Value, TaxIndex, Flags, HOffset, VOffset, RightOffset);
end;

procedure TMercuryFPrtX.AddDocAmountAdj(Value: Currency; TaxIndex: Integer; Flags: Integer; 
                                        HOffset: Integer; VOffset: Integer; RightOffset: Integer);
begin
  DefaultInterface.AddDocAmountAdj(Value, TaxIndex, Flags, HOffset, VOffset, RightOffset);
end;

procedure TMercuryFPrtX.AddTotal(Flags: Integer; HOffset: Integer; VOffset: Integer; 
                                 RightOffset: Integer);
begin
  DefaultInterface.AddTotal(Flags, HOffset, VOffset, RightOffset);
end;

procedure TMercuryFPrtX.AddPay(PayType: TxMercPayType; PayCash: Currency; PayCashless: Currency; 
                               const PayInfo: WideString; Flags: Integer; HOffset: Integer; 
                               VOffset: Integer; RightOffset: Integer);
begin
  DefaultInterface.AddPay(PayType, PayCash, PayCashless, PayInfo, Flags, HOffset, VOffset, 
                          RightOffset);
end;

procedure TMercuryFPrtX.AddChange(Flags: Integer; HOffset: Integer; VOffset: Integer; 
                                  RightOffset: Integer);
begin
  DefaultInterface.AddChange(Flags, HOffset, VOffset, RightOffset);
end;

procedure TMercuryFPrtX.AddTaxSum(TaxIndex: Integer; Flags: Integer; HOffset: Integer; 
                                  VOffset: Integer; RightOffset: Integer);
begin
  DefaultInterface.AddTaxSum(TaxIndex, Flags, HOffset, VOffset, RightOffset);
end;

procedure TMercuryFPrtX.AddFiscalSign(Flags: Integer; HOffset: Integer; VOffset: Integer);
begin
  DefaultInterface.AddFiscalSign(Flags, HOffset, VOffset);
end;

procedure TMercuryFPrtX.AddBarcode(Mask1: Integer; Mask2: Integer; Mask3: Integer; Mask4: Integer; 
                                   Mask5: Integer; DoubleDensity: WordBool; Flags: Integer; 
                                   HOffset: Integer; VOffset: Integer);
begin
  DefaultInterface.AddBarcode(Mask1, Mask2, Mask3, Mask4, Mask5, DoubleDensity, Flags, HOffset, 
                              VOffset);
end;

procedure TMercuryFPrtX.AddCustom(const Text: WideString; Flags: Integer; HOffset: Integer; 
                                  VOffset: Integer);
begin
  DefaultInterface.AddCustom(Text, Flags, HOffset, VOffset);
end;

procedure TMercuryFPrtX.RepeatOperation;
begin
  DefaultInterface.RepeatOperation;
end;

procedure TMercuryFPrtX.OpenDay(OperNum: Integer; const OperName: WideString; 
                                FullJournal: WordBool; AProtocol: TxMercProtocol);
begin
  DefaultInterface.OpenDay(OperNum, OperName, FullJournal, AProtocol);
end;

function TMercuryFPrtX.ZReport(Flags: Integer): Integer;
begin
  Result := DefaultInterface.ZReport(Flags);
end;

function TMercuryFPrtX.FiscalRewrite(const InspPswd: WideString; const RegNum: WideString; 
                                     const TaxPayerNum: WideString; const NewInspPswd: WideString): Integer;
begin
  Result := DefaultInterface.FiscalRewrite(InspPswd, RegNum, TaxPayerNum, NewInspPswd);
end;

function TMercuryFPrtX.FiscalReportByNum(const InspPswd: WideString; PrintFull: WordBool; 
                                         AStartNum: Integer; AEndNum: Integer): Integer;
begin
  Result := DefaultInterface.FiscalReportByNum(InspPswd, PrintFull, AStartNum, AEndNum);
end;

function TMercuryFPrtX.FiscalReportByDate(const InspPswd: WideString; PrintFull: WordBool; 
                                          AStartDate: TDateTime; AEndDate: TDateTime): Integer;
begin
  Result := DefaultInterface.FiscalReportByDate(InspPswd, PrintFull, AStartDate, AEndDate);
end;

function TMercuryFPrtX.FiscalReportAll(const InspPswd: WideString): Integer;
begin
  Result := DefaultInterface.FiscalReportAll(InspPswd);
end;

procedure TMercuryFPrtX.FeedAndCut(LineCount: Integer; CutAfterFeed: WordBool);
begin
  DefaultInterface.FeedAndCut(LineCount, CutAfterFeed);
end;

procedure TMercuryFPrtX.PrintNonFiscal(const Data: WideString; OpenDoc: WordBool; CloseDoc: WordBool);
begin
  DefaultInterface.PrintNonFiscal(Data, OpenDoc, CloseDoc);
end;

procedure TMercuryFPrtX.ShowDisplay(const Data: WideString; OpenMode: WordBool; CloseMode: WordBool);
begin
  DefaultInterface.ShowDisplay(Data, OpenMode, CloseMode);
end;

procedure TMercuryFPrtX.SetDisplayBaudRate(BaudRate: Integer);
begin
  DefaultInterface.SetDisplayBaudRate(BaudRate);
end;

procedure TMercuryFPrtX.ExternalPulse(Channel: Integer; TimeOn: Integer; TimeOff: Integer; 
                                      Count: Integer);
begin
  DefaultInterface.ExternalPulse(Channel, TimeOn, TimeOff, Count);
end;

procedure TMercuryFPrtX.QueryDevExStatus;
begin
  DefaultInterface.QueryDevExStatus;
end;

procedure TMercuryFPrtX.QueryFirmwareInfo;
begin
  DefaultInterface.QueryFirmwareInfo;
end;

procedure TMercuryFPrtX.SetHeader(const Line1: WideString; const Line2: WideString; 
                                  const Line3: WideString; const Line4: WideString);
begin
  DefaultInterface.SetHeader(Line1, Line2, Line3, Line4);
end;

procedure TMercuryFPrtX.SetTax(Index: Integer; const TaxName: WideString; TaxRate: Integer);
begin
  DefaultInterface.SetTax(Index, TaxName, TaxRate);
end;

function TMercuryFPrtX.QueryTax(Index: Integer): Integer;
begin
  Result := DefaultInterface.QueryTax(Index);
end;

function TMercuryFPrtX.QueryCounter(Index: Integer; NoRequest: WordBool): Currency;
begin
  Result := DefaultInterface.QueryCounter(Index, NoRequest);
end;

procedure TMercuryFPrtX.SynchronizeEcrDateTime;
begin
  DefaultInterface.SynchronizeEcrDateTime;
end;

procedure TMercuryFPrtX.QueryResourceInfo(PrintInfo: WordBool);
begin
  DefaultInterface.QueryResourceInfo(PrintInfo);
end;

procedure TMercuryFPrtX.QueryLastDocInfo;
begin
  DefaultInterface.QueryLastDocInfo;
end;

procedure TMercuryFPrtX.SetParameters(Protocol: TxMercProtocol; PrnTimeout: Integer);
begin
  DefaultInterface.SetParameters(Protocol, PrnTimeout);
end;

function TMercuryFPrtX.QueryHeaderLine(LineNum: Integer): WideString;
begin
  Result := DefaultInterface.QueryHeaderLine(LineNum);
end;

function TMercuryFPrtX.QuerySerialNumber: WideString;
begin
  Result := DefaultInterface.QuerySerialNumber;
end;

procedure TMercuryFPrtX.SetSerialNumber(const Value: WideString);
begin
  DefaultInterface.SetSerialNumber(Value);
end;

function TMercuryFPrtX.QueryTaxPayerNumber: WideString;
begin
  Result := DefaultInterface.QueryTaxPayerNumber;
end;

function TMercuryFPrtX.QueryRegNumber: WideString;
begin
  Result := DefaultInterface.QueryRegNumber;
end;

function TMercuryFPrtX.QueryEcrDateTime: TDateTime;
begin
  Result := DefaultInterface.QueryEcrDateTime;
end;

function TMercuryFPrtX.QueryDepartName(DepartNum: Integer): WideString;
begin
  Result := DefaultInterface.QueryDepartName(DepartNum);
end;

procedure TMercuryFPrtX.SetDepartName(DepartNum: Integer; const Value: WideString);
begin
  DefaultInterface.SetDepartName(DepartNum, Value);
end;

function TMercuryFPrtX.QueryTitle(TitleNum: Integer): WideString;
begin
  Result := DefaultInterface.QueryTitle(TitleNum);
end;

procedure TMercuryFPrtX.SetTitle(TitleNum: Integer; const Value: WideString);
begin
  DefaultInterface.SetTitle(TitleNum, Value);
end;

function TMercuryFPrtX.CheckEcrStatus(Flag: Integer): Integer;
begin
  Result := DefaultInterface.CheckEcrStatus(Flag);
end;

function TMercuryFPrtX.CheckDevStatus(Flag: Integer): Integer;
begin
  Result := DefaultInterface.CheckDevStatus(Flag);
end;

procedure TMercuryFPrtX.AddGraphicHeader(Flags: Integer; HOffset: Integer; VOffset: Integer);
begin
  DefaultInterface.AddGraphicHeader(Flags, HOffset, VOffset);
end;

procedure TMercuryFPrtX.SetProtocol(Protocol: TxMercProtocol);
begin
  DefaultInterface.SetProtocol(Protocol);
end;

procedure TMercuryFPrtX.SetPrinterTimeout(Timeout: Integer);
begin
  DefaultInterface.SetPrinterTimeout(Timeout);
end;

procedure TMercuryFPrtX.SetDisplayTimeout(Timeout: Integer);
begin
  DefaultInterface.SetDisplayTimeout(Timeout);
end;

procedure TMercuryFPrtX.SetPrinterContrast(Contrast: Integer);
begin
  DefaultInterface.SetPrinterContrast(Contrast);
end;

procedure TMercuryFPrtX.SetLeading(Leading: Integer);
begin
  DefaultInterface.SetLeading(Leading);
end;

procedure TMercuryFPrtX.SetCutterDisabled(Disabled: WordBool);
begin
  DefaultInterface.SetCutterDisabled(Disabled);
end;

procedure TMercuryFPrtX.SetNarrowPaper(Narrow: WordBool);
begin
  DefaultInterface.SetNarrowPaper(Narrow);
end;

function TMercuryFPrtX.QueryPrinterTimeout: Integer;
begin
  Result := DefaultInterface.QueryPrinterTimeout;
end;

function TMercuryFPrtX.QueryDisplayTimeout: Integer;
begin
  Result := DefaultInterface.QueryDisplayTimeout;
end;

function TMercuryFPrtX.QueryPrinterContrast: Integer;
begin
  Result := DefaultInterface.QueryPrinterContrast;
end;

function TMercuryFPrtX.QueryLeading: Integer;
begin
  Result := DefaultInterface.QueryLeading;
end;

procedure TMercuryFPrtX.EnableGraphicHeader(Width: Integer; Height: Integer; const Data: WideString);
begin
  DefaultInterface.EnableGraphicHeader(Width, Height, Data);
end;

procedure TMercuryFPrtX.DisableGraphicHeader;
begin
  DefaultInterface.DisableGraphicHeader;
end;

procedure TMercuryFPrtX.AddLicence(LicType: TxMercLicenceType; const Licence: WideString);
begin
  DefaultInterface.AddLicence(LicType, Licence);
end;

function TMercuryFPrtX.XReport(Flags: Integer): Integer;
begin
  Result := DefaultInterface.XReport(Flags);
end;

function TMercuryFPrtX.XReportByDep(DepartNum: Integer; Flags: Integer): Integer;
begin
  Result := DefaultInterface.XReportByDep(DepartNum, Flags);
end;

function TMercuryFPrtX.XReportByOper(OperNum: Integer; Flags: Integer): Integer;
begin
  Result := DefaultInterface.XReportByOper(OperNum, Flags);
end;

function TMercuryFPrtX.QueryHeaderAlignment: WordBool;
begin
  Result := DefaultInterface.QueryHeaderAlignment;
end;

function TMercuryFPrtX.QueryOperNumber: Integer;
begin
  Result := DefaultInterface.QueryOperNumber;
end;

function TMercuryFPrtX.QueryOperName(OperNum: Integer): WideString;
begin
  Result := DefaultInterface.QueryOperName(OperNum);
end;

procedure TMercuryFPrtX.SetHeaderAlignment(Aligned: WordBool);
begin
  DefaultInterface.SetHeaderAlignment(Aligned);
end;

procedure TMercuryFPrtX.TestConnection;
begin
  DefaultInterface.TestConnection;
end;

procedure TMercuryFPrtX.AboutBox;
begin
  DefaultInterface.AboutBox;
end;

function TMercuryFPrtX.QueryAutocut: WordBool;
begin
  Result := DefaultInterface.QueryAutocut;
end;

procedure TMercuryFPrtX.SetAutocut(Autocut: WordBool);
begin
  DefaultInterface.SetAutocut(Autocut);
end;

function TMercuryFPrtX.QueryEconomicMode: WordBool;
begin
  Result := DefaultInterface.QueryEconomicMode;
end;

procedure TMercuryFPrtX.SetEconomicMode(EconomicMode: WordBool);
begin
  DefaultInterface.SetEconomicMode(EconomicMode);
end;

procedure TMercuryFPrtX.EKLZActivate;
begin
  DefaultInterface.EKLZActivate;
end;

procedure TMercuryFPrtX.EKLZActivationReport;
begin
  DefaultInterface.EKLZActivationReport;
end;

procedure TMercuryFPrtX.EKLZDayReport(DayNumber: Integer);
begin
  DefaultInterface.EKLZDayReport(DayNumber);
end;

procedure TMercuryFPrtX.EKLZReportByNum(IsFull: WordBool; AStartNum: Integer; AEndNum: Integer);
begin
  DefaultInterface.EKLZReportByNum(IsFull, AStartNum, AEndNum);
end;

procedure TMercuryFPrtX.EKLZReportByDate(IsFull: WordBool; AStartDate: TDateTime; 
                                         AEndDate: TDateTime);
begin
  DefaultInterface.EKLZReportByDate(IsFull, AStartDate, AEndDate);
end;

procedure TMercuryFPrtX.EKLZDocByNum(Number: Integer);
begin
  DefaultInterface.EKLZDocByNum(Number);
end;

procedure TMercuryFPrtX.EKLZControlByNum(DayNumber: Integer);
begin
  DefaultInterface.EKLZControlByNum(DayNumber);
end;

procedure TMercuryFPrtX.EKLZCloseArchive;
begin
  DefaultInterface.EKLZCloseArchive;
end;

procedure TMercuryFPrtX.EKLZQueryStatus;
begin
  DefaultInterface.EKLZQueryStatus;
end;

function TMercuryFPrtX.QueryPaperJournal: WordBool;
begin
  Result := DefaultInterface.QueryPaperJournal;
end;

procedure TMercuryFPrtX.SetPaperJournal(PaperJournal: WordBool);
begin
  DefaultInterface.SetPaperJournal(PaperJournal);
end;

function TMercuryFPrtX.QueryFullJournal: WordBool;
begin
  Result := DefaultInterface.QueryFullJournal;
end;

procedure TMercuryFPrtX.SetFullJournal(FullJournal: WordBool);
begin
  DefaultInterface.SetFullJournal(FullJournal);
end;

procedure TMercuryFPrtX.AddEKLZData(Flags: Integer; HOffset: Integer; VOffset: Integer);
begin
  DefaultInterface.AddEKLZData(Flags, HOffset, VOffset);
end;

procedure TMercuryFPrtX.AddRegNumber(Flags: Integer; HOffset: Integer; VOffset: Integer);
begin
  DefaultInterface.AddRegNumber(Flags, HOffset, VOffset);
end;

procedure TMercuryFPrtX.WriteGraphic(Number: Integer; Width: Integer; Height: Integer; 
                                     const Data: WideString);
begin
  DefaultInterface.WriteGraphic(Number, Width, Height, Data);
end;

procedure TMercuryFPrtX.PrintGraphic(Width: Integer; Height: Integer; const Data: WideString);
begin
  DefaultInterface.PrintGraphic(Width, Height, Data);
end;

function TMercuryFPrtX.QueryParameterBool(ParamCode: Integer): WordBool;
begin
  Result := DefaultInterface.QueryParameterBool(ParamCode);
end;

function TMercuryFPrtX.QueryParameterInt(ParamCode: Integer): Integer;
begin
  Result := DefaultInterface.QueryParameterInt(ParamCode);
end;

procedure TMercuryFPrtX.SetParameterBool(ParamCode: Integer; ParamValue: WordBool);
begin
  DefaultInterface.SetParameterBool(ParamCode, ParamValue);
end;

procedure TMercuryFPrtX.SetParameterInt(ParamCode: Integer; ParamValue: Integer);
begin
  DefaultInterface.SetParameterInt(ParamCode, ParamValue);
end;

procedure TMercuryFPrtX.PrintHeader;
begin
  DefaultInterface.PrintHeader;
end;

procedure TMercuryFPrtX.SetOperPassword(OperNum: Integer; const OperName: WideString; 
                                        const OperPassword: WideString);
begin
  DefaultInterface.SetOperPassword(OperNum, OperName, OperPassword);
end;

function TMercuryFPrtX.PrintEKL(Flags: Integer): Integer;
begin
  Result := DefaultInterface.PrintEKL(Flags);
end;

function TMercuryFPrtX.QueryEKLState: TxMercEKLState;
begin
  Result := DefaultInterface.QueryEKLState;
end;

procedure TMercuryFPrtX.ReprintDocument;
begin
  DefaultInterface.ReprintDocument;
end;

procedure Register;
begin
  RegisterComponents(dtlOcxPage, [TMercuryFPrtX]);
end;

end.
