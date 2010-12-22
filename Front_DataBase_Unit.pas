unit Front_DataBase_Unit;

interface

uses
  IBDatabase, Db, Classes, IBSQL, kbmMemTable, Base_Display_unit,
  Pole_Display_Unit, IBQuery, IB, IBErrorCodes;

const
  MN_OrderXID = 147014509;
  MN_OrderDBID = 9263644;
  cn_StateNothing = 0;
  cn_StateInsert = 1;
  cn_StateUpdate = 2;
  cn_StateUpdateParent = 3;

//константы с запросами
const
  cst_UserPassword =
    ' SELECT u.usr$groupkey ' +
    ' FROM                  ' +
    '   usr$users u         ' +
    ' WHERE                 ' +
    '   and u.usr$password = :Password ';

  cst_CauseDelete = 'SELECT * FROM usr$mn_causedeleteorderline';

  cst_GoodList =
    ' SELECT g.id, g.name, mn.usr$cost, g.alias, g.USR$MODIFYGROUPKEY, g.USR$BEDIVIDE ' +
    ' FROM usr$mn_menuline mn  ' +
    '   JOIN gd_good g on g.id = mn.usr$goodkey  ' +
    '   JOIN gd_goodgroup cg ON g.groupkey = cg.id  ' +
    '   JOIN gd_document doc on doc.id = mn.documentkey ' +
    ' WHERE mn.masterkey = :MenuKey  ' +
    '   AND cg.id = :GroupKey  ' +
    '   and (doc.disabled is null or doc.disabled = 0)  ' +
    ' ORDER BY g.name ';

  cst_GroupList =
    ' SELECT DISTINCT cg.name name, cg.id id, cg.alias ' +
    '  FROM usr$mn_menuline mn  ' +
    '  JOIN gd_good g ON mn.usr$goodkey = g.id  ' +
    '  JOIN gd_goodgroup cg ON g.groupkey = cg.id  ' +
    '  JOIN gd_document doc on doc.id = mn.documentkey  ' +
    ' WHERE mn.masterkey = :menukey  ' +
    '  and (doc.disabled is null or doc.disabled = 0)  ' +
    ' ORDER BY 1 ';

  cst_PopularGoodList =
    ' SELECT g.id, g.name, mn.usr$cost, g.alias, g.USR$MODIFYGROUPKEY, g.USR$BEDIVIDE FROM GD_GOOD G ' +
    ' JOIN GD_GOODGROUP GD ON GD.ID = G.GROUPKEY ' +
    ' JOIN usr$mn_menuline mn ON g.id = mn.usr$goodkey ' +
    ' JOIN gd_document doc on doc.id = mn.documentkey ' +
    ' WHERE ((G.USR$ISPOPULAR = 1) OR (GD.USR$ISPOPULAR = 1)) ' +
    '   AND (doc.disabled is null or doc.disabled = 0) ' +
    ' ORDER BY G.NAME ';

  cst_MenuList =
    'SELECT mn.documentkey, mn.usr$todate, mnn.usr$name ' +
    '  FROM usr$mn_menu mn left join usr$mn_menuname mnn ' +
    '   ON mn.usr$menunamekey = mnn.id ' +
    '    LEFT JOIN gd_document doc on doc.id = mn.documentkey ' +
    '  WHERE (mn.usr$todate is null or mn.usr$todate>=:date) and (doc.documentdate <= :Date) ' +
    ' and exists (select first(1) dd.id from gd_document dd where dd.parent = mn.documentkey) ' +
    ' ORDER BY mnn.usr$name ';

  cst_OrderHeader =
     ' SELECT                      ' +
     '   doc.id,                   ' +
     '   doc.number,               ' +
     '   doc.sumncu,               ' +
     '   doc.usr$mn_printdate,     ' +
     '   doc.editiondate,          ' +
     '   doc.editorkey,            ' +
     '   o.usr$respkey,            ' +
     '   o.usr$guestcount,         ' +
     '   o.usr$timeorder,          ' +
     '   o.usr$timecloseorder,     ' +
     '   o.usr$logicdate,          ' +
     '   o.usr$discountncu,        ' +
     '   o.usr$disccardkey,        ' +
     '   o.usr$userdisckey,        ' +
     '   o.usr$discountkey,        ' +
     '   o.usr$bonussum,           ' +
     '   o.usr$pay,                ' +
     '   o.usr$cash,               ' +
     '   o.usr$sysnum,             ' +
     '   o.usr$register,           ' +
     '   o.usr$whopayoffkey,       ' +
     '   o.usr$vip,                 ' +
     ' ( SELECT SUM(L.USR$SUMNCUWITHDISCOUNT) FROM USR$MN_ORDERLINE L WHERE L.MASTERKEY = doc.ID AND L.USR$CAUSEDELETEKEY IS NULL) AS USR$SUMNCUWITHDISCOUNT ' +
     ' FROM gd_document doc        ' +
     '  join usr$mn_order o on o.documentkey = doc.id  ' +
     '  WHERE                                          ' +
     '  o.documentkey = :id                            ';

  cst_OrderLine =
    ' SELECT                                                    '+
    '  doc.id,                                                  '+
    '  doc.editiondate,                                         '+
    '  doc.editorkey,                                           '+
    '  doc.number,                                              '+
    '  doc.usr$mn_printdate,                                    '+
    '  ol.usr$quantity,                                         '+
    '  ol.usr$costncu,                                          '+
    '  ol.usr$goodkey,                                          '+
    '  ol.usr$sumncuwithdiscount,                               '+
    '  ol.usr$sumncu,                                           '+
    '  ol.usr$costncuwithdiscount,                              '+
    '  ol.usr$sumdiscount,                                      '+
    '  ol.usr$persdiscount,                                     '+
    '  ol.usr$causedeletekey,                                   '+
    '  ol.usr$deleteamount,                                     '+
    '  ol.usr$doublebonus,                                      '+
    '  g.name goodname                                          '+
    ' FROM gd_document doc                                      '+
    ' join usr$mn_orderline ol on ol.documentkey = doc.id       '+
    ' join gd_good g on g.id = ol.usr$goodkey                   '+
    ' WHERE ol.masterkey = :id                                  '+
    ' ORDER BY doc.id ';

  cst_OrderActiveLine =
    ' SELECT                                                    '+
    '  doc.id,                                                  '+
    '  doc.editiondate,                                         '+
    '  doc.editorkey,                                           '+
    '  doc.number,                                              '+
    '  doc.usr$mn_printdate,                                    '+
    '  ol.usr$quantity,                                         '+
    '  ol.usr$costncu,                                          '+
    '  ol.usr$goodkey,                                          '+
    '  ol.usr$sumncuwithdiscount,                               '+
    '  ol.usr$sumncu,                                           '+
    '  ol.usr$costncuwithdiscount,                              '+
    '  ol.usr$sumdiscount,                                      '+
    '  ol.usr$persdiscount,                                     '+
    '  ol.usr$causedeletekey,                                   '+
    '  ol.usr$deleteamount,                                     '+
    '  ol.usr$doublebonus,                                      '+
    '  ol.usr$extramodify,                                      '+
    '  g.name goodname                                          '+
    ' FROM gd_document doc                                      '+
    ' join usr$mn_orderline ol on ol.documentkey = doc.id       '+
    ' join gd_good g on g.id = ol.usr$goodkey                   '+
    ' WHERE ol.masterkey = :id and                              '+
    '   ol.usr$quantity > 0 and ol.usr$causedeletekey IS NULL   '+
    ' ORDER BY doc.id ';


type
  TOrderState = (osOrderOpen, osOrderClose, osOrderPayed);

  TFrontOptions = packed record
    OrderCurrentLDate: Boolean;
    UseCurrentDate:    Boolean;
    KassaGroupMask:    Integer;
    ManagerGroupMask:  Integer;
    WaiterGroupMask:   Integer;
    MaxGuestCount:     Integer;
    MaxOpenedOrders:   Integer;
    MinGuestCount:     Integer;
    PLFileFolder:      String;
    PLSingleFile:      Boolean;
    PrintFiscalChek:   Boolean;
    PrintLog:          Boolean;
    DiscountType:      Integer;
    LastPrintOrder:    Integer;
    // опции лога
    DoLog:             Boolean;
    LinesLimit:        Integer;
    LogToFile:         Boolean;
    //
    NoPassword:        Boolean;
    OpenTime:          TDateTime;
    CloseTime:         TDateTime;
    BasePath:          String;
    MainCompanyID:     Integer;
    CheckLine1:        String;
    CheckLine2:        String;
    CheckLine3:        String;
    CheckLine4:        String;
    CheckLine5:        String;
    CheckLine6:        String;
    CheckLine7:        String;
    CheckLine8:        String;
    SyncTime:          Boolean;
    TimeComp:          String;
    ExtCalcCardID:     Integer;
    ExtDepotKeys:      String;
    PrintCopyCheck:    Boolean;
    SaveAllOrder:      Boolean;
    BackType:          Integer;
  end;

  TUserInfo = record
    CheckedUserPassword : Boolean;
    UserName            : String;
    UserKey             : Integer;
    UserInGroup         : Integer;
  end;

  TFrontBase = class
  private
    FDataBase: TIBDataBase;
    FReadTransaction: TIBTransaction;
    FReadSQL: TIBSQL;
    FIDSQL: TIBSQL;
    FIDTransaction: TIBTransaction;
    FCheckTransaction: TIBTransaction;
    FCheckSQL: TIBSQL;

    // Имя и пароль IB
    FIBName: String;
    FIBPassword: String;
    FIBPath: String;

    FUserKey: Integer;
    FContactKey: Integer;
    FUserName: String;
    FUserGroup: Integer;

    FCashCode: Integer;
    FFiscalComPort: Integer;
    FCashNumber: Integer;
    FIsMainCash: Boolean;

    FOrderTypeKey: Integer;
    FCompanyKey: Integer;
    FOptions: TFrontOptions;

    FDisplay: TDisplay;
    FDisplayInitialized: Boolean;

    function GetDisplay: TDisplay;
    function GetCashCode: Integer;
    function GetFiscalComPort: Integer;
    function GetCashNumber: Integer;
    function GetIsMainCash: Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    procedure InitDB;
    procedure InitStorage;

    function CheckUserPassword(UserID: Integer; UserPassword: String): Integer; //Возвращает ID Группы -1 Если не нашло
    function LogIn(UserPassword: String): Boolean; //Возвращает ID Группы -1 Если не нашло
    function CheckUserPasswordWithForm: TUserInfo;

    function GetNextID: Integer;

    procedure GetUserList(UserList: TStrings);
    function GetUserOrders(ContactKey: Integer; var MemTable: TkbmMemTable):Boolean; //Если -1 то возвращаем для текущего
    function GetMenuList(var MemTable: TkbmMemTable): Boolean;
    function GetGroupList(var MemTable: TkbmMemTable; const MenuKey: Integer): Boolean;
    function GetGoodList(var MemTable: TkbmMemTable; const MenuKey, GroupKey: Integer): Boolean;
    function GetGoodByID(var MemTable: TkbmMemTable; const GoodKey: Integer): Boolean;
    function GetPopularGoodList(var MemTable: TkbmMemTable): Boolean;

    function LockUserOrder(const OrderKey: Integer): Boolean;
    function UnLockUserOrder(const OrderKey: Integer): Boolean;

    function GetPayKindType(var MemTable: TkbmMemTable; const PayType: Integer; IsPlCard: Integer = 0): Boolean;

    function CreateNewOrder(var HeaderTable, LineTable, ModifyTable: TkbmMemTable; out OrderKey: Integer): Boolean;
    function SaveAndReloadOrder(var HeaderTable, LineTable, ModifyTable: TkbmMemTable; OrderKey: Integer): Boolean;
    function GetOrder(var HeaderTable, LineTable, ModifyTable: TkbmMemTable; OrderKey: Integer): Boolean; // Если OrderKey = -1 то новый заказ
    function CloseModifyTable(var ModifyTable: TkbmMemTable; const CloseTime: TTime): Boolean;
    //оплачен или нет
    function OrderIsPayed(const ID: Integer): Boolean;
    //причины списания
    function GetCauseDeleteList(var MemTable: TkbmMemTable): Boolean;
    function GetActiveWaiterList(var MemTable: TkbmMemTable; WithPrecheck: Boolean): Boolean;
    function GetLogicDate: TDateTime;

    function GetModificationList(var MemTable: TkbmMemTable; const GoodKey: Integer; const ModifyGroupKey: Integer): Boolean;

    function GetIDByRUID(const XID: Integer; const DBID: Integer): Integer;
    function GetNextOrderNum: Integer;
    function CheckCountOrderByResp(const RespID: Integer): Boolean;

    function GetDiscount(const DiscKey, GoodKey: Integer;
      DocDate: TDateTime; PersDiscount: Currency): Currency;
    function GetDiscountList(var MemTable: TkbmMemTable): Boolean;
    function GetDiscountCardInfo(var MemTable: TkbmMemTable; const CardID: Integer; LDate: TDateTime; Pass: String): Boolean;
    function CalcBonusSum(var DataSet: TDataSet; FLine: TkbmMemTable; var Bonus: Boolean; var PercDisc: Currency): Boolean;
    //работа с оборудованием
    procedure InitDisplay;
    function GetPrinterName: String;
    function GetReportTemplate(var Stream: TStream; const ID: Integer): Boolean;
    function SaveReportTemplate(var Stream: TStream; const ID: Integer): Boolean;

    function GetNameWaiterOnID(const ID: Integer; WithGroup, TwoRows: Boolean): String;

    function SavePayment(const ContactKey, OrderKey, PayKindKey: Integer;
      Sum: Currency): Boolean;

    //1. Отмена пречека
    //2. Перенос блюда
    //3. Удаление блюда
    function SaveOrderLog(const WaiterKey, ManagerKey, OrderKey, OrderLineKey, Operation: Integer): Boolean;

    //reports
    function GetServiceCheckQuery(var Query: TIBQuery; const PrnGrID, DocID: Integer; const PrinterName: String): Boolean;
    function GetServiceCheckOptions(const DocID: Integer; out PrinterName: String; out PrnGrid: Integer): Boolean;
    function SavePrintDate(const ID: Integer): Boolean;
    function GetPreCheckQuery(var Query: TIBQuery; const DocID: Integer): Boolean;
    function GetDeleteServiceCheckQuery(var Query: TIBQuery; const PrnGrID, DocumentKey, MasterKey: Integer; const PrinterName: String): Boolean;
    function GetDeleteServiceCheckOptions(const DocID, MasterKey: Integer; out PrinterName: String;
      out PrnGrid: Integer): Boolean;
    function GetReportList(var MemTable: TkbmMemTable): Boolean;

    procedure CanCloseDay;
    procedure CanOpenDay;

    procedure DoOnDisconnect;
    function TryToConnect(const Count: Integer): Boolean;

    class function GetGroupMask(const AGroupID: Integer): Integer;
    class function GetLocalComputerName: String;
    class function RoundCost(const Cost: Currency): Currency;

    property UserName: String read FUserName;
    property UserKey: Integer read FUserKey;
    property ContactKey: Integer read FContactKey;
    property UserGroup: Integer read FUserGroup;
    property Options: TFrontOptions read FOptions write FOptions;

    property Display: TDisplay read GetDisplay;
    property CashCode: Integer read GetCashCode;
    property FiscalComPort: Integer read GetFiscalComPort;
    property CashNumber: Integer read GetCashNumber;
    property IsMainCash: Boolean read GetIsMainCash;
  end;

  procedure GetHeaderTable(var DS: TkbmMemTable);
  procedure GetLineTable(var DS: TkbmMemTable);
  procedure GetModificationTable(var DS: TkbmMemTable);

implementation

uses
  Windows, Sysutils, CardCodeForm_Unit, TaskDialog, Dialogs;


procedure GetHeaderTable(var DS: TkbmMemTable);
begin
  DS := TkbmMemTable.Create(nil);
  DS.FieldDefs.Add('ID', ftInteger, 0);
  DS.FieldDefs.Add('NUMBER', ftString, 20);
  DS.FieldDefs.Add('SUMNCU', ftCurrency, 0);
  DS.FieldDefs.Add('usr$mn_printdate', ftDateTime, 0);
  DS.FieldDefs.Add('usr$sumncuwithdiscount', ftCurrency, 0);
  DS.FieldDefs.Add('usr$respkey', ftInteger, 0);
  DS.FieldDefs.Add('usr$guestcount', ftInteger, 0);
  DS.FieldDefs.Add('usr$pay', ftInteger, 0);
  DS.FieldDefs.Add('usr$timeorder', ftTime, 0);
  DS.FieldDefs.Add('usr$timecloseorder', ftTime, 0);
  DS.FieldDefs.Add('usr$logicdate', ftDate, 0);
  DS.FieldDefs.Add('usr$discountncu', ftCurrency, 0);
  DS.FieldDefs.Add('usr$sysnum', ftInteger, 0);
  DS.FieldDefs.Add('usr$register', ftString, 8);
  DS.FieldDefs.Add('usr$whopayoffkey', ftInteger, 0);
  DS.FieldDefs.Add('usr$vip', ftInteger, 0);
  DS.FieldDefs.Add('usr$disccardkey', ftInteger, 0);
  DS.FieldDefs.Add('usr$userdisckey', ftInteger, 0);
  DS.FieldDefs.Add('usr$discountkey', ftInteger, 0);
  DS.FieldDefs.Add('usr$bonussum', ftCurrency, 0);
  DS.FieldDefs.Add('editorkey', ftInteger, 0);
  DS.FieldDefs.Add('editiondate', ftTimeStamp, 0);
  DS.CreateTable;
end;

procedure GetLineTable(var DS: TkbmMemTable);
begin
  DS := TkbmMemTable.Create(nil);
  DS.FieldDefs.Add('ID', ftInteger, 0);
  DS.FieldDefs.Add('number', ftString, 20);
  DS.FieldDefs.Add('GOODNAME', ftString, 40);
  DS.FieldDefs.Add('usr$mn_printdate', ftDateTime, 0);
  DS.FieldDefs.Add('usr$quantity', ftFloat, 0);
  DS.FieldDefs.Add('usr$costncu', ftCurrency, 0);
  DS.FieldDefs.Add('usr$goodkey', ftInteger, 0);
  DS.FieldDefs.Add('usr$sumncuwithdiscount', ftCurrency, 0);
  DS.FieldDefs.Add('usr$sumncu', ftCurrency, 0);
  DS.FieldDefs.Add('usr$costncuwithdiscount', ftCurrency, 0);
  DS.FieldDefs.Add('usr$sumdiscount', ftCurrency, 0);
  DS.FieldDefs.Add('usr$persdiscount', ftCurrency, 0);
  DS.FieldDefs.Add('usr$causedeletekey', ftInteger, 0);
  DS.FieldDefs.Add('usr$deleteamount', ftCurrency, 0);
  DS.FieldDefs.Add('usr$doublebonus', ftInteger, 0);
  DS.FieldDefs.Add('editorkey', ftInteger, 0);
  DS.FieldDefs.Add('editiondate', ftTimeStamp, 0);
  DS.FieldDefs.Add('oldquantity', ftFloat, 0);
  DS.FieldDefs.Add('LINEKEY', ftInteger, 0);
  DS.FieldDefs.Add('STATEFIELD', ftInteger, 0);
  DS.FieldDefs.Add('MODIFYSTRING', ftString, 1024);
  DS.FieldDefs.Add('PARENT', ftInteger, 0);
  DS.FieldDefs.Add('EXTRAMODIFY', ftString, 60);
  DS.CreateTable;
end;

procedure GetModificationTable(var DS: TkbmMemTable);
begin
  DS := TkbmMemTable.Create(nil);
  DS.FieldDefs.Add('MASTERKEY', ftInteger, 0);
  DS.FieldDefs.Add('MODIFYKEY', ftInteger, 0);
  DS.FieldDefs.Add('NAME', ftString, 40);
  DS.FieldDefs.Add('CLOSETIME', ftTime, 0);
  DS.CreateTable;
end;

{ TFrontBase }

function TFrontBase.CheckUserPassword(UserID: Integer;
  UserPassword: String): Integer;
begin
  Result := -1;
  FReadSQL.Close;
  FReadSQL.Transaction.StartTransaction;
  try
    FReadSQL.SQL.Text := cst_UserPassword;
    FReadSQL.ParamBYName('Password').AsString := UserPassword;
    FReadSQL.ExecQuery;
    if not FReadSQL.EOF then
      Result := FReadSQL.FieldByName('usr$groupKey').ASInteger;
  finally
    FReadSQL.Close;
    FReadSQL.Transaction.Commit;
  end;
end;

constructor TFrontBase.Create;
begin
  inherited;

  FReadTransaction := TIBTransaction.Create(nil);
  FReadTransaction.Params.Add('read_committed');
  FReadTransaction.Params.Add('read');
  FReadTransaction.Params.Add('rec_version');
  FReadTransaction.Params.Add('nowait');

  FDataBase := TIBDataBase.Create(nil);
  FDataBase.LoginPrompt := False;
  FDataBase.DefaultTransaction := FReadTransaction;

  FReadSQL := TIBSQL.Create(nil);
  FReadSQL.Transaction := FReadTransaction;

  FCheckTransaction := TIBTransaction.Create(nil);
  FCheckTransaction.DefaultDatabase := FDataBase;

  FCheckTransaction.Params.Add('concurrency');
  FCheckTransaction.Params.Add('nowait');
  FCheckTransaction.Params.Add('write');

  FCheckSQL := TIBSQL.Create(nil);
  FCheckSQL.Transaction := FCheckTransaction;

  FIDTransaction := TIBTransaction.Create(nil);
  FIDTransaction.DefaultDatabase := FDataBase;
  FIDTransaction.Params.Add('read_committed');
  FIDTransaction.Params.Add('read');
  FIDTransaction.Params.Add('rec_version');
  FIDTransaction.Params.Add('nowait');

  FIDSQL := TIBSQl.Create(nil);
  FIDSQL.Transaction := FIDTransaction;
  FIDSQL.SQL.Text := 'SELECT gen_id(gd_g_unique, 1) as id FROM rdb$database';

  try
    InitDB;
    InitStorage;
  except
    raise;
  end;
  FDisplayInitialized := False;
  FCashCode := -1;
  FFiscalComPort := -1;
  FCashNumber := -1;
  FIsMainCash := False;
end;

function TFrontBase.CreateNewOrder(var HeaderTable,
  LineTable, ModifyTable: TkbmMemTable; out OrderKey: Integer): Boolean;
var
  InsDoc, InsOrder, InsOrderLine, InsModify, DelModify, UpdParent :TIBSQL;
  updOrder, UpdOrderLine: TIBSQL;
  MasterID, LineState, LineID: Integer;
const
  DocInsert =
    ' insert into gd_document (  ' +
    '     id,                    ' +
    '     parent,                ' +
    '     documenttypekey,       ' +
    '     number,                ' +
    '     documentdate,          ' +
    '     afull,                 ' +
    '     achag,                 ' +
    '     aview,                 ' +
    '     companykey,            ' +
    '     creatorkey,            ' +
    '     creationdate,          ' +
    '     editorkey,             ' +
    '     editiondate,           ' +
    '     usr$mn_printdate)      ' +
    '   values (                 ' +
    '     :id,                   ' +
    '     :parent,               ' +
    '     :documenttypekey,      ' +
    '     :number,               ' +
    '     :documentdate,         ' +
    '     -1,                    ' +
    '     -1,                    ' +
    '     -1,                    ' +
    '     :companykey,           ' +
    '     :creatorkey,           ' +
    '     :creationdate,         ' +
    '     :editorkey,            ' +
    '     :editiondate,          ' +
    '     :usr$mn_printdate)     ' ;

  OrderInsert =
    '   insert into usr$mn_order (   ' +
    '       documentkey,             ' +
    '       usr$respkey,             ' +
    '       usr$guestcount,          ' +
    '       usr$timeorder,           ' +
    '       usr$timecloseorder,      ' +
    '       usr$logicdate,           ' +
    '       usr$discountncu,         ' +
    '       usr$disccardkey,         ' +
    '       usr$userdisckey,         ' +
    '       usr$discountkey,         ' +
    '       usr$bonussum)            ' +
    '     values (                   ' +
    '       :documentkey,            ' +
    '       :usr$respkey,            ' +
    '       :usr$guestcount,         ' +
    '       :usr$timeorder,          ' +
    '       :usr$timecloseorder,     ' +
    '       :usr$logicdate,          ' +
    '       :usr$discountncu,        ' +
    '       :usr$disccardkey,        ' +
    '       :usr$userdisckey,        ' +
    '       :usr$discountkey,        ' +
    '       :usr$bonussum)           ';

  OrderLineInsert =
    '  insert into usr$mn_orderline (    ' +
    '      documentkey,                  ' +
    '      masterkey,                    ' +
    '      usr$quantity,                 ' +
    '      usr$costncu,                  ' +
    '      usr$goodkey,                  ' +
    '      usr$sumncuwithdiscount,       ' +
    '      usr$sumncu,                   ' +
    '      usr$costncuwithdiscount,      ' +
    '      usr$sumdiscount,              ' +
    '      usr$persdiscount,             ' +
    '      usr$causedeletekey,           ' +
    '      usr$deleteamount,             ' +
    '      usr$costeqwithdiscount,       ' +
    '      usr$costeq,                   ' +
    '      usr$register,                 ' +
    '      usr$logicdate,                ' +
    '      usr$depotkey,                 ' +
    '      usr$doublebonus,              ' +
    '      usr$extramodify)              ' +
    '    values (                        ' +
    '      :documentkey,                 ' +
    '      :masterkey,                   ' +
    '      :usr$quantity,                ' +
    '      :usr$costncu,                 ' +
    '      :usr$goodkey,                 ' +
    '      :usr$sumncuwithdiscount,      ' +
    '      :usr$sumncu,                  ' +
    '      :usr$costncuwithdiscount,     ' +
    '      :usr$sumdiscount,             ' +
    '      :usr$persdiscount,            ' +
    '      :usr$causedeletekey,          ' +
    '      :usr$deleteamount,            ' +
    '      :usr$costeqwithdiscount,      ' +
    '      :usr$costeq,                  ' +
    '      :usr$register,                ' +
    '      :usr$logicdate,               ' +
    '      :usr$depotkey,                ' +
    '      :usr$doublebonus,             ' +
    '      :usr$extramodify)             ' ;

  UpdateOrder =
    '      update usr$mn_order                      ' +
    '      set usr$respkey = :usr$respkey,          ' +
    '          usr$guestcount = :usr$guestcount,    ' +
    '          usr$timeorder = :usr$timeorder,      ' +
    '          usr$logicdate = :usr$logicdate,      ' +
    '          usr$discountncu = :usr$discountncu,  ' +
    '          usr$disccardkey = :usr$disccardkey,  ' +
    '          usr$userdisckey = :usr$userdisckey,  ' +
    '          usr$discountkey = :usr$discountkey,  ' +
    '          usr$bonussum = :usr$bonussum,        ' +
    '          usr$timecloseorder = :usr$timecloseorder, ' +
    '          usr$pay = :usr$pay,                  ' +
    '          USR$ISLOCKED = 0                     ' +
    '      where (documentkey = :documentkey)       ';

  UpdateOrderLine =
    '      update usr$mn_orderline                                   ' +
    '      set masterkey = :masterkey,                               ' +
    '          usr$quantity = :usr$quantity,                         ' +
    '          usr$costncu = :usr$costncu,                           ' +
    '          usr$goodkey = :usr$goodkey,                           ' +
    '          usr$sumncuwithdiscount = :usr$sumncuwithdiscount,     ' +
    '          usr$sumncu = :usr$sumncu,                             ' +
    '          usr$costncuwithdiscount = :usr$costncuwithdiscount,   ' +
    '          usr$sumdiscount = :usr$sumdiscount,                   ' +
    '          usr$persdiscount = :usr$persdiscount,                 ' +
    '          usr$causedeletekey = :usr$causedeletekey,             ' +
    '          usr$deleteamount = :usr$deleteamount,                 ' +
    '          usr$logicdate = :usr$logicdate,                       ' +
    '          usr$doublebonus = :usr$doublebonus,                   ' +
    '          usr$extramodify = :usr$extramodify                    ' +
    '      where (documentkey = :documentkey)                        ';

  DeleteModify = ' DELETE FROM USR$CROSS509_157767346 ' +
    ' WHERE usr$mn_orderlinekey = :PosKey ';

  InsertModify = ' INSERT INTO USR$CROSS509_157767346 (usr$mn_orderlinekey, usr$mn_modifykey) ' +
    ' VALUES (:LineKey, :ModKey) ';

  UpdateParent =
    ' EXECUTE BLOCK ' +
    ' AS ' +
    ' DECLARE VARIABLE ID INTEGER; ' +
    ' DECLARE VARIABLE PARENT INTEGER; ' +
    ' BEGIN ' +
    '   ID = %s; ' +
    '   PARENT = %s; ' +
    '   ' +
    '   UPDATE GD_DOCUMENT ' +
    '   SET PARENT = :PARENT ' +
    '   WHERE ID = :ID; ' +
    '                   ' +
    '   UPDATE usr$mn_orderline ' +
    '   SET MASTERKEY = :PARENT ' +
    '   WHERE DOCUMENTKEY = :ID; ' +
    ' END ';

begin
  Result := False;
  //если шапка пришла без ID, значит делаем INSERT, инчае UPDATE
  //для позиций заводим поле состояния
  //0 ничего с данной позицией не делаем
  //1 надо добавить позицию в документ
  //2 делаем update позиций

  //как формировать номер документа?
  //что такое logicdate?

  InsDoc := TIBSQL.Create(nil);
  InsDoc.Transaction := FCheckTransaction;
  InsDoc.SQL.Text := DocInsert;

  InsOrder := TIBSQL.Create(nil);
  InsOrder.Transaction := FCheckTransaction;
  InsOrder.SQL.Text := OrderInsert;

  InsOrderLine := TIBSQL.Create(nil);
  InsOrderLine.Transaction := FCheckTransaction;
  InsOrderLine.SQL.Text := OrderLineInsert;

  updOrder := TIBSQL.Create(nil);
  updOrder.Transaction := FCheckTransaction;
  updOrder.SQL.Text := UpdateOrder;

  UpdOrderLine := TIBSQL.Create(nil);
  UpdOrderLine.Transaction := FCheckTransaction;
  UpdOrderLine.SQL.Text := UpdateOrderLine;

  InsModify := TIBSQL.Create(nil);
  InsModify.Transaction := FCheckTransaction;
  InsModify.SQL.Text := InsertModify;

  DelModify := TIBSQL.Create(nil);
  DelModify.Transaction := FCheckTransaction;
  DelModify.SQL.Text := DeleteModify;

  UpdParent := TIBSQL.Create(nil);
  UpdParent.Transaction := FCheckTransaction;
  UpdParent.ParamCheck := False;

  LineTable.Filtered := False;
  try
    try
      if not FCheckTransaction.InTransaction then
        FCheckTransaction.StartTransaction;

      MasterID := -1;
      HeaderTable.First;
      if not HeaderTable.Eof then
      begin
        if HeaderTable.FieldByName('ID').AsInteger <> 0 then
        begin
          MasterID := HeaderTable.FieldByName('ID').AsInteger;
          //обновляем шапку
          updOrder.ParamByName('usr$respkey').Value := HeaderTable.FieldByName('usr$respkey').Value;
          updOrder.ParamByName('usr$guestcount').AsInteger := HeaderTable.FieldByName('usr$guestcount').AsInteger;
          updOrder.ParamByName('usr$timeorder').Value := HeaderTable.FieldByName('usr$timeorder').Value; //????
          updOrder.ParamByName('usr$logicdate').Value := HeaderTable.FieldByName('usr$logicdate').Value; //????
          updOrder.ParamByName('usr$discountncu').AsCurrency := HeaderTable.FieldByName('usr$discountncu').AsCurrency;
          updOrder.ParamByName('usr$disccardkey').Value := HeaderTable.FieldByName('usr$disccardkey').Value;
          updOrder.ParamByName('usr$userdisckey').Value := HeaderTable.FieldByName('usr$userdisckey').Value;
          updOrder.ParamByName('usr$discountkey').Value := HeaderTable.FieldByName('usr$discountkey').Value;
          updOrder.ParamByName('usr$bonussum').AsCurrency := HeaderTable.FieldByName('usr$bonussum').AsCurrency;
          updOrder.ParamByName('usr$timecloseorder').Value := HeaderTable.FieldByName('usr$timecloseorder').Value;
          updOrder.ParamByName('documentkey').AsInteger := HeaderTable.FieldByName('ID').AsInteger;
          updOrder.ParamByName('usr$pay').AsInteger := HeaderTable.FieldByName('usr$pay').AsInteger;
          updOrder.ExecQuery;

        end else
        begin
          MasterID := GetNextID;

          InsDoc.ParamByName('ID').AsInteger := MasterID;
          InsDoc.ParamByName('PARENT').AsVariant := '';
          InsDoc.ParamByName('documenttypekey').AsInteger := FOrderTypeKey;
          InsDoc.ParamByName('NUMBER').AsString := HeaderTable.FieldByName('NUMBER').AsString;
          InsDoc.ParamByName('documentdate').AsDateTime := Date;
          InsDoc.ParamByName('companykey').AsInteger := FCompanyKey;
          InsDoc.ParamByName('creatorkey').AsInteger := FContactKey;
          InsDoc.ParamByName('creationdate').AsDateTime := Date;
          InsDoc.ParamByName('editorkey').AsInteger := FContactKey;
          InsDoc.ParamByName('editiondate').AsDateTime := Date;
          InsDoc.ParamByName('usr$mn_printdate').Value := HeaderTable.FieldByName('usr$mn_printdate').Value;
          InsDoc.ExecQuery;

          InsOrder.ParamByName('usr$respkey').Value := FContactKey;
          InsOrder.ParamByName('usr$guestcount').AsInteger := HeaderTable.FieldByName('usr$guestcount').AsInteger;
          InsOrder.ParamByName('usr$timeorder').AsTime := Time;
          InsOrder.ParamByName('usr$logicdate').AsDate := GetLogicDate;
          InsOrder.ParamByName('usr$discountncu').AsCurrency := HeaderTable.FieldByName('usr$discountncu').AsCurrency;
          InsOrder.ParamByName('usr$disccardkey').Value := HeaderTable.FieldByName('usr$disccardkey').Value;
          InsOrder.ParamByName('usr$userdisckey').Value := HeaderTable.FieldByName('usr$userdisckey').Value;
          InsOrder.ParamByName('usr$discountkey').Value := HeaderTable.FieldByName('usr$discountkey').Value;
          InsOrder.ParamByName('usr$bonussum').AsCurrency := HeaderTable.FieldByName('usr$bonussum').AsCurrency;
          InsOrder.ParamByName('usr$timecloseorder').Value := HeaderTable.FieldByName('usr$timecloseorder').Value;
          InsOrder.ParamByName('documentkey').AsInteger := MasterID;
          InsOrder.ExecQuery;
        end;
      end;

      Assert(MasterID <> -1, 'wrong master ID');

      LineTable.First;
      while not LineTable.Eof do
      begin
        LineState := LineTable.FieldByName('STATEFIELD').AsInteger;
        case LineState of
          cn_StateNothing:
            begin
              //ничего не делаем
            end;
          cn_StateInsert:
            begin
              //добавляем запись
              InsDoc.Close;
              InsOrderLine.Close;

              if LineTable.FieldByName('ID').IsNull then
                LineID := GetNextID
              else
                LineID := LineTable.FieldByName('ID').AsInteger;
              InsDoc.ParamByName('ID').AsInteger := LineID;
              InsDoc.ParamByName('PARENT').AsInteger := MasterID;
              InsDoc.ParamByName('documenttypekey').AsInteger := FOrderTypeKey;
              InsDoc.ParamByName('NUMBER').AsString := HeaderTable.FieldByName('NUMBER').AsString;
              InsDoc.ParamByName('documentdate').AsDateTime := Date;
              InsDoc.ParamByName('companykey').AsInteger := FCompanyKey;
              InsDoc.ParamByName('creatorkey').AsInteger := FContactKey;
              InsDoc.ParamByName('creationdate').AsDateTime := Date;
              InsDoc.ParamByName('editorkey').AsInteger := FContactKey;
              InsDoc.ParamByName('editiondate').AsDateTime := Date;
              InsDoc.ParamByName('usr$mn_printdate').Value := LineTable.FieldByName('usr$mn_printdate').Value;
              InsDoc.ExecQuery;

              InsOrderLine.ParamByName('masterkey').AsInteger := MasterID;
              InsOrderLine.ParamByName('usr$quantity').AsCurrency := LineTable.FieldByName('usr$quantity').AsCurrency;
              InsOrderLine.ParamByName('usr$costncu').AsCurrency := LineTable.FieldByName('usr$costncu').AsCurrency;
              InsOrderLine.ParamByName('usr$goodkey').Value := LineTable.FieldByName('usr$goodkey').Value;
              InsOrderLine.ParamByName('usr$sumncuwithdiscount').AsCurrency := LineTable.FieldByName('usr$sumncuwithdiscount').AsCurrency;
              InsOrderLine.ParamByName('usr$sumncu').AsCurrency := LineTable.FieldByName('usr$sumncu').AsCurrency;
              InsOrderLine.ParamByName('usr$costncuwithdiscount').AsCurrency := LineTable.FieldByName('usr$costncuwithdiscount').AsCurrency;
              InsOrderLine.ParamByName('usr$sumdiscount').AsCurrency := LineTable.FieldByName('usr$sumdiscount').AsCurrency;
              InsOrderLine.ParamByName('usr$persdiscount').AsCurrency := LineTable.FieldByName('usr$persdiscount').AsCurrency;
              InsOrderLine.ParamByName('usr$causedeletekey').Value := LineTable.FieldByName('usr$causedeletekey').Value;
              InsOrderLine.ParamByName('usr$deleteamount').AsCurrency := LineTable.FieldByName('usr$deleteamount').AsCurrency;
              InsOrderLine.ParamByName('usr$logicdate').AsDate := GetLogicDate;
              InsOrderLine.ParamByName('usr$doublebonus').AsInteger := LineTable.FieldByName('usr$doublebonus').AsInteger;
              InsOrderLine.ParamByName('documentkey').AsInteger := LineID;
              InsOrderLine.ParamByName('usr$register').AsVariant := ''; //????
              InsOrderLine.ParamByName('usr$costeqwithdiscount').AsVariant := ''; //????
              InsOrderLine.ParamByName('usr$costeq').AsVariant := '';  //????
              InsOrderLine.ParamByName('usr$depotkey').AsVariant := ''; //????
              InsOrderLine.ParamByName('usr$extramodify').AsString := LineTable.FieldByName('extramodify').AsString;
              InsOrderLine.ExecQuery;

              ModifyTable.First;
              while not ModifyTable.Eof do
              begin
                InsModify.Close;
                InsModify.ParamByName('LINEKEY').AsInteger := LineID;
                InsModify.ParamByName('MODKEY').AsInteger := ModifyTable.FieldByName('MODIFYKEY').AsInteger;
                InsModify.ExecQuery;

                ModifyTable.Next;
              end;
            end;
          cn_StateUpdate:
            begin
              //обновляем запись
              UpdOrderLine.Close;
              UpdOrderLine.ParamByName('masterkey').AsInteger := MasterID;
              UpdOrderLine.ParamByName('usr$quantity').AsCurrency := LineTable.FieldByName('usr$quantity').AsCurrency;
              UpdOrderLine.ParamByName('usr$costncu').AsCurrency := LineTable.FieldByName('usr$costncu').AsCurrency;
              UpdOrderLine.ParamByName('usr$goodkey').Value := LineTable.FieldByName('usr$goodkey').Value;
              UpdOrderLine.ParamByName('usr$sumncuwithdiscount').AsCurrency := LineTable.FieldByName('usr$sumncuwithdiscount').AsCurrency;
              UpdOrderLine.ParamByName('usr$sumncu').AsCurrency := LineTable.FieldByName('usr$sumncu').AsCurrency;
              UpdOrderLine.ParamByName('usr$costncuwithdiscount').AsCurrency := LineTable.FieldByName('usr$costncuwithdiscount').AsCurrency;
              UpdOrderLine.ParamByName('usr$sumdiscount').AsCurrency := LineTable.FieldByName('usr$sumdiscount').AsCurrency;
              UpdOrderLine.ParamByName('usr$persdiscount').AsCurrency := LineTable.FieldByName('usr$persdiscount').AsCurrency;
              UpdOrderLine.ParamByName('usr$causedeletekey').Value := LineTable.FieldByName('usr$causedeletekey').Value;
              UpdOrderLine.ParamByName('usr$deleteamount').AsCurrency := LineTable.FieldByName('usr$deleteamount').AsCurrency;
              UpdOrderLine.ParamByName('usr$logicdate').AsDate := GetLogicDate; //????
              UpdOrderLine.ParamByName('usr$doublebonus').AsInteger := LineTable.FieldByName('usr$doublebonus').AsInteger;
              UpdOrderLine.ParamByName('usr$extramodify').AsString := LineTable.FieldByName('extramodify').AsString;
              UpdOrderLine.ParamByName('documentkey').AsInteger := LineTable.FieldByName('ID').AsInteger;
              UpdOrderLine.ExecQuery;

              DelModify.Close;
              DelModify.ParamByName('POSKEY').AsInteger := LineTable.FieldByName('ID').AsInteger;
              DelModify.ExecQuery;
              // на всякий случай
              if ModifyTable.TransactionLevel > 0 then
                ModifyTable.Commit;
              ModifyTable.First;
              while not ModifyTable.Eof do
              begin
                InsModify.Close;
                InsModify.ParamByName('LINEKEY').AsInteger := LineTable.FieldByName('ID').AsInteger;
                InsModify.ParamByName('MODKEY').AsInteger := ModifyTable.FieldByName('MODIFYKEY').AsInteger;
                InsModify.ExecQuery;

                ModifyTable.Next;
              end;
            end;

          cn_StateUpdateParent: // обновить parent
            begin
              UpdParent.Close;
              UpdParent.SQL.Text := Format(UpdateParent,
                [LineTable.FieldByName('ID').AsString, LineTable.FieldByName('PARENT').AsString]);
              UpdParent.ExecQuery;
            end;
        else
          Assert(False, 'wrong type state field');
        end;

        LineTable.Next;
      end;
      Result := True;
      OrderKey := MasterID;
    except
      on E: EIBInterBaseError do
      begin
        if (E.IBErrorCode = isc_lost_db_connection) or (E.IBErrorCode = isc_net_read_err)
          or (E.IBErrorCode = isc_net_read_err) or (E.IBErrorCode = isc_net_write_err) then
            DoOnDisconnect
        else begin
          AdvTaskMessageDlg('Внимание', 'Ошибка при сохранении чека ' + E.Message, mtError, [mbOK], 0);
          FCheckTransaction.Rollback;
        end;
      end;
      on E: Exception do
      begin
        AdvTaskMessageDlg('Внимание', 'Ошибка при сохранении чека ' + E.Message, mtError, [mbOK], 0);
        FCheckTransaction.Rollback;
      end;
    end;
  finally
    try
      if FCheckTransaction.InTransaction then
        FCheckTransaction.Commit;
    except
      on E: EIBInterBaseError do
      begin
        if (E.IBErrorCode = isc_lost_db_connection) or (E.IBErrorCode = isc_net_read_err)
          or (E.IBErrorCode = isc_net_read_err) or (E.IBErrorCode = isc_net_write_err) then
          // ничего не делаем
        else
          raise;
      end;
    end;

    InsDoc.Free;
    InsOrder.Free;
    InsOrderLine.Free;
    updOrder.Free;
    UpdOrderLine.Free;
    InsModify.Free;
    DelModify.Free;
    UpdParent.Free;
    LineTable.Filtered := True;
  end;
end;

destructor TFrontBase.Destroy;
begin
  FReadSQL.Free;
  FReadTransaction.Free;

  FCheckSQL.Free;
  FCheckTransaction.Free;

  if FIDTransaction.InTransaction then
    FIDTransaction.Commit;

  FIDSQL.Free;
  FIDTransaction.Free;

  FDataBase.Free;

  if Assigned(FDisplay) then
    FDisplay.Free;

  inherited;
end;

procedure TFrontBase.DoOnDisconnect;
begin
  FDataBase.ForceClose;
  if not TryToConnect(5) then
{ TODO : Обработать }
    ;
end;

function TFrontBase.GetCauseDeleteList(
  var MemTable: TkbmMemTable): Boolean;
begin
  Result := False;
  FReadSQL.Close;
  MemTable.Close;
  MemTable.CreateTable;
  MemTable.Open;
  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;
  try
    FReadSQL.SQL.Text := cst_CauseDelete;
    FReadSQL.ExecQuery;
    while not FReadSQL.EOF do
    begin
      MemTable.Append;
      MemTable.FieldByName('ID').AsInteger := FReadSQL.FieldByName('ID').AsInteger;
      MemTable.FieldByName('NAME').AsString := FReadSQL.FieldByName('USR$NAME').AsString;
      MemTable.Post;
      FReadSQL.Next;
    end;
    Result := True;
  finally
    FReadSQL.Close;
    FReadSQL.Transaction.Commit;
  end;
end;

function IsNeedModify(const FSQL: TIBSQL; const GoodKey: Integer): Integer; inline;
begin
  Result := 0;
  FSQL.Close;
  FSQL.ParamByName('goodkey').AsInteger := GoodKey;
  FSQL.ExecQuery;
  if not FSQL.Eof then
    Result := 1;
end;

function TFrontBase.GetGoodByID(var MemTable: TkbmMemTable;
  const GoodKey: Integer): Boolean;
var
  FSQL: TIBSQL;
const
  cst_GoodByID =
    ' SELECT g.id, g.name, mn.usr$cost, g.alias, g.USR$MODIFYGROUPKEY, g.USR$BEDIVIDE ' +
    ' FROM gd_good g ' +
    '   JOIN usr$mn_menuline mn ON mn.usr$goodkey = g.id ' +
    '   JOIN gd_goodgroup cg ON g.groupkey = cg.id ' +
    '   JOIN gd_document doc ON doc.id = mn.documentkey ' +
    ' WHERE G.ID = :GOODKEY ' +
    '   and (doc.disabled is null or doc.disabled = 0) ';
begin
  Result := False;
  FReadSQL.Close;
  if MemTable.State <> dsBrowse then
    MemTable.Post;

{ TODO : Переписать код обработки транзакции в ф-циях с товарами }
  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;
  try
    FSQL := TIBSQL.Create(nil);
    FSQL.Transaction := FReadSQL.Transaction;
    FSQL.SQL.Text := 'SELECT FIRST(1) * FROM USR$CROSS36_416793598 WHERE usr$gd_goodkey = :goodkey';
    try
      FReadSQL.SQL.Text := cst_GoodByID;
      FReadSQL.ParamByName('GOODKEY').AsInteger := GoodKey;
      FReadSQL.ExecQuery;
      while not FReadSQL.EOF do
      begin
        MemTable.Append;
        MemTable.FieldByName('ID').AsInteger := FReadSQL.FieldByName('ID').AsInteger;
        MemTable.FieldByName('NAME').AsString := FReadSQL.FieldByName('NAME').AsString;
        MemTable.FieldByName('Alias').AsString := FReadSQL.FieldByName('ALIAS').AsString;
        MemTable.FieldByName('Cost').ASCurrency := FReadSQL.FieldByName('usr$Cost').ASCurrency;
        MemTable.FieldByName('MODIFYGROUPKEY').AsInteger := FReadSQL.FieldByName('USR$MODIFYGROUPKEY').AsInteger;
        MemTable.FieldByName('ISNEEDMODIFY').AsInteger := IsNeedModify(FSQL, FReadSQL.FieldByName('ID').AsInteger);
        MemTable.FieldByName('BEDIVIDE').AsInteger := FReadSQL.FieldByName('USR$BEDIVIDE').AsInteger;
        MemTable.Post;
        FReadSQL.Next;
      end;
      Result := True;
    finally
      FSQL.Free;
    end;
  finally
    FReadSQL.Close;
    FReadSQL.Transaction.Commit;
  end;
end;

function TFrontBase.GetGoodList(var MemTable: TkbmMemTable;
  const MenuKey, GroupKey: Integer): Boolean;
var
  FSQL: TIBSQL;
begin
  Result := False;
  FReadSQL.Close;
  MemTable.Close;
  MemTable.CreateTable;
  MemTable.Open;
  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;
  try
    FSQL := TIBSQL.Create(nil);
    FSQL.Transaction := FReadSQL.Transaction;
    FSQL.SQL.Text := 'SELECT FIRST(1) * FROM USR$CROSS36_416793598 WHERE usr$gd_goodkey = :goodkey';
    try
      FReadSQL.SQL.Text := cst_GoodList;
      FReadSQL.ParamByName('MenuKey').AsInteger := MenuKey;
      FReadSQL.ParamByName('GroupKey').AsInteger := GroupKey;
      FReadSQL.ExecQuery;
      while not FReadSQL.EOF do
      begin
        MemTable.Append;
        MemTable.FieldByName('ID').AsInteger := FReadSQL.FieldByName('ID').AsInteger;
        MemTable.FieldByName('NAME').AsString := FReadSQL.FieldByName('NAME').AsString;
        MemTable.FieldByName('Alias').AsString := FReadSQL.FieldByName('ALIAS').AsString;
        MemTable.FieldByName('Cost').ASCurrency := FReadSQL.FieldByName('usr$Cost').ASCurrency;
        MemTable.FieldByName('MODIFYGROUPKEY').AsInteger := FReadSQL.FieldByName('USR$MODIFYGROUPKEY').AsInteger;
        MemTable.FieldByName('ISNEEDMODIFY').AsInteger := IsNeedModify(FSQL, FReadSQL.FieldByName('ID').AsInteger);
        MemTable.FieldByName('BEDIVIDE').AsInteger := FReadSQL.FieldByName('USR$BEDIVIDE').AsInteger;
        MemTable.Post;
        FReadSQL.Next;
      end;
      Result := True;
    finally
      FSQL.Free;
    end;
  finally
    FReadSQL.Close;
    FReadSQL.Transaction.Commit;
  end;
end;

function TFrontBase.GetPopularGoodList(var MemTable: TkbmMemTable): Boolean;
var
  FSQL: TIBSQL;
begin
  Result := False;
  FReadSQL.Close;
  MemTable.Close;
  MemTable.CreateTable;
  MemTable.Open;
  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;
  try
    FSQL := TIBSQL.Create(nil);
    FSQL.Transaction := FReadSQL.Transaction;
    FSQL.SQL.Text := 'SELECT FIRST(1) * FROM USR$CROSS36_416793598 WHERE usr$gd_goodkey = :goodkey';
    try
      FReadSQL.SQL.Text := cst_PopularGoodList;
      FReadSQL.ExecQuery;
      while not FReadSQL.EOF do
      begin
        MemTable.Append;
        MemTable.FieldByName('ID').AsInteger := FReadSQL.FieldByName('ID').AsInteger;
        MemTable.FieldByName('NAME').AsString := FReadSQL.FieldByName('NAME').AsString;
        MemTable.FieldByName('Alias').AsString := FReadSQL.FieldByName('ALIAS').AsString;
        MemTable.FieldByName('Cost').ASCurrency := FReadSQL.FieldByName('usr$Cost').ASCurrency;
        MemTable.FieldByName('MODIFYGROUPKEY').AsInteger := FReadSQL.FieldByName('USR$MODIFYGROUPKEY').AsInteger;
        MemTable.FieldByName('ISNEEDMODIFY').AsInteger := IsNeedModify(FSQL, FReadSQL.FieldByName('ID').AsInteger);
        MemTable.FieldByName('BEDIVIDE').AsInteger := FReadSQL.FieldByName('USR$BEDIVIDE').AsInteger;
        MemTable.Post;
        FReadSQL.Next;
      end;
      Result := True;
    finally
      FSQL.Free;
    end;
  finally
    FReadSQL.Close;
    FReadSQL.Transaction.Commit;
  end;
end;

function TFrontBase.GetGroupList(var MemTable: TkbmMemTable; const MenuKey: Integer): Boolean;
begin
  Result := False;
  FReadSQL.Close;
  MemTable.Close;
  MemTable.CreateTable;
  MemTable.Open;
  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;
  try
    FReadSQL.SQL.Text := cst_GroupList;
    FReadSQL.ParamByName('MenuKey').AsInteger := MenuKey;
    FReadSQL.ExecQuery;
    while not FReadSQL.EOF do
    begin
      MemTable.Append;
      MemTable.FieldByName('ID').AsInteger := FReadSQL.FieldByName('ID').AsInteger;
      MemTable.FieldByName('NAME').AsString := FReadSQL.FieldByName('NAME').AsString;
      MemTable.FieldByName('Alias').AsString := FReadSQL.FieldByName('ALIAS').AsString;
      MemTable.Post;
      FReadSQL.Next;
    end;
    Result := True;
  finally
    FReadSQL.Close;
    FReadSQL.Transaction.Commit;
  end;
end;

function TFrontBase.GetMenuList(var MemTable: TkbmMemTable): Boolean;
begin
  Result := False;
  FReadSQL.Close;
  MemTable.Close;
  MemTable.CreateTable;
  MemTable.Open;
  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;
  try
    FReadSQL.SQL.Text := cst_MenuList;
    FReadSQL.ParamByName('Date').ASDateTime := Now;
    FReadSQL.ExecQuery;
    while not FReadSQL.EOF do
    begin
      MemTable.Append;
      MemTable.FieldByName('ID').AsInteger := FReadSQL.FieldByName('documentkey').AsInteger;
      MemTable.FieldByName('NAME').AsString := FReadSQL.FieldByName('USR$NAME').AsString;
      MemTable.Post;
      FReadSQL.Next;
    end;
    Result := True;
  finally
    FReadSQL.Close;
    FReadSQL.Transaction.Commit;
  end;
end;

function TFrontBase.GetNextID: Integer;
begin
  if not FIDSQL.Transaction.InTransaction then
   FIDSQL.Transaction.StartTransaction;

  FIDSQL.Close;
  FIDSQL.ExecQuery;
  Result := FIDSQL.FieldByName('ID').AsInteger;
end;

function TFrontBase.GetOrder(var HeaderTable, LineTable, ModifyTable: TkbmMemTable;
  OrderKey: Integer): Boolean;
var
  FSQL: TIBSQL;
  S, ES: String;
  BPost, APost: TDataSetNotifyEvent;
begin
  Result := False;
  HeaderTable.Close;
  HeaderTable.CreateTable;
  HeaderTable.Open;

  LineTable.Close;
  LineTable.CreateTable;
  LineTable.Open;

  ModifyTable.Close;
  ModifyTable.CreateTable;
  ModifyTable.Open;

  if OrderKey  = -1 then
  begin
    Result := True;
    Exit;
  end;
  FReadSQL.Close;

  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;

  APost := HeaderTable.AfterPost;
  HeaderTable.AfterPost := nil;

  BPost := LineTable.BeforePost;
  LineTable.BeforePost := nil;
  try
    FSQL := TIBSQL.Create(nil);
    FSQL.Transaction := FReadSQL.Transaction;
    FSQL.SQL.Text :=
      ' SELECT CR.USR$MN_MODIFYKEY, m.USR$NAME, CR.USR$CLOSETIME ' +
      ' FROM USR$CROSS509_157767346 CR ' +
      ' LEFT JOIN usr$mn_modify m ON m.ID = CR.USR$MN_MODIFYKEY ' +
      ' WHERE CR.USR$MN_ORDERLINEKEY = :line ';

    try
      FReadSQL.SQL.Text := cst_OrderHeader;
      FReadSQL.ParamByName('ID').AsInteger := OrderKey;
      FReadSQL.ExecQuery;
      while not FReadSQL.EOF do
      begin
        HeaderTable.Append;
        HeaderTable.FieldByName('id').Value := FReadSQL.FieldByName('id').Value;
        HeaderTable.FieldByName('number').Value := FReadSQL.FieldByName('number').Value;
        HeaderTable.FieldByName('sumncu').Value := FReadSQL.FieldByName('sumncu').Value;
        HeaderTable.FieldByName('usr$mn_printdate').Value := FReadSQL.FieldByName('usr$mn_printdate').Value;
        HeaderTable.FieldByName('usr$sumncuwithdiscount').Value := FReadSQL.FieldByName('usr$sumncuwithdiscount').Value;
        HeaderTable.FieldByName('usr$respkey').Value := FReadSQL.FieldByName('usr$respkey').Value;
        HeaderTable.FieldByName('usr$guestcount').Value := FReadSQL.FieldByName('usr$guestcount').Value;
        HeaderTable.FieldByName('usr$pay').Value := FReadSQL.FieldByName('usr$pay').Value;
        HeaderTable.FieldByName('usr$timeorder').Value := FReadSQL.FieldByName('usr$timeorder').Value;
        HeaderTable.FieldByName('usr$timecloseorder').Value := FReadSQL.FieldByName('usr$timecloseorder').Value;
        HeaderTable.FieldByName('usr$logicdate').Value := FReadSQL.FieldByName('usr$logicdate').Value;
        HeaderTable.FieldByName('usr$discountncu').Value := FReadSQL.FieldByName('usr$discountncu').Value;
        HeaderTable.FieldByName('usr$sysnum').Value := FReadSQL.FieldByName('usr$sysnum').Value;
        HeaderTable.FieldByName('usr$register').Value := FReadSQL.FieldByName('usr$register').Value;
        HeaderTable.FieldByName('usr$whopayoffkey').Value := FReadSQL.FieldByName('usr$whopayoffkey').Value;
        HeaderTable.FieldByName('usr$vip').Value := FReadSQL.FieldByName('usr$vip').Value;
        HeaderTable.FieldByName('usr$disccardkey').Value := FReadSQL.FieldByName('usr$disccardkey').Value;
        HeaderTable.FieldByName('usr$userdisckey').Value := FReadSQL.FieldByName('usr$userdisckey').Value;
        HeaderTable.FieldByName('usr$discountkey').Value := FReadSQL.FieldByName('usr$discountkey').Value;
        HeaderTable.FieldByName('usr$bonussum').Value := FReadSQL.FieldByName('usr$bonussum').Value;
        HeaderTable.FieldByName('editorkey').Value := FReadSQL.FieldByName('editorkey').Value;
        HeaderTable.FieldByName('editiondate').Value := FReadSQL.FieldByName('editiondate').Value;
        HeaderTable.Post;
        FReadSQL.Next;
      end;
      FReadSQL.Close;
      FReadSQL.SQL.Text := cst_OrderActiveLine; // cst_OrderLine;
      FReadSQL.ParamByName('ID').AsInteger := OrderKey;
      FReadSQL.ExecQuery;
      while not FReadSQL.EOF do
      begin
        S:= '';
        LineTable.Append;
        LineTable.FieldByName('id').Value := FReadSQL.FieldByName('id').Value;
        LineTable.FieldByName('number').Value := FReadSQL.FieldByName('number').Value;
        LineTable.FieldByName('GOODNAME').Value := FReadSQL.FieldByName('GOODNAME').Value;
        LineTable.FieldByName('usr$mn_printdate').Value := FReadSQL.FieldByName('usr$mn_printdate').Value;
        LineTable.FieldByName('usr$quantity').Value := FReadSQL.FieldByName('usr$quantity').Value;
        LineTable.FieldByName('usr$costncu').Value := FReadSQL.FieldByName('usr$costncu').Value;
        LineTable.FieldByName('usr$goodkey').Value := FReadSQL.FieldByName('usr$goodkey').Value;
        LineTable.FieldByName('usr$sumncuwithdiscount').Value := FReadSQL.FieldByName('usr$sumncuwithdiscount').Value;
        LineTable.FieldByName('usr$sumncu').Value := FReadSQL.FieldByName('usr$sumncu').Value;
        LineTable.FieldByName('usr$costncuwithdiscount').Value := FReadSQL.FieldByName('usr$costncuwithdiscount').Value;
        LineTable.FieldByName('usr$sumdiscount').Value := FReadSQL.FieldByName('usr$sumdiscount').Value;
        LineTable.FieldByName('usr$persdiscount').Value := FReadSQL.FieldByName('usr$persdiscount').Value;
        LineTable.FieldByName('usr$causedeletekey').Value := FReadSQL.FieldByName('usr$causedeletekey').Value;
        LineTable.FieldByName('usr$deleteamount').Value := FReadSQL.FieldByName('usr$deleteamount').Value;
        LineTable.FieldByName('usr$doublebonus').Value := FReadSQL.FieldByName('usr$doublebonus').Value;
        LineTable.FieldByName('editorkey').Value := FReadSQL.FieldByName('editorkey').Value;
        LineTable.FieldByName('editiondate').Value := FReadSQL.FieldByName('editiondate').Value;
        LineTable.FieldByName('oldquantity').Value := FReadSQL.FieldByName('usr$quantity').Value;
        LineTable.FieldByName('LINEKEY').AsInteger := FReadSQL.FieldByName('id').Value;
        LineTable.FieldByName('STATEFIELD').AsInteger := 0;
        LineTable.FieldByName('EXTRAMODIFY').AsString := FReadSQL.FieldByName('usr$extramodify').AsString;
        ES := LineTable.FieldByName('EXTRAMODIFY').AsString;
        LineTable.Post;

        FSQL.Params[0].AsInteger := FReadSQL.FieldByName('id').Value;
        FSQL.ExecQuery;

        ModifyTable.StartTransaction;
        try
          while not FSQL.Eof do
          begin

            ModifyTable.Append;
            ModifyTable.FieldByName('MASTERKEY').AsInteger := FReadSQL.FieldByName('id').AsInteger;
            ModifyTable.FieldByName('MODIFYKEY').AsInteger := FSQL.FieldByName('USR$MN_MODIFYKEY').AsInteger;
            ModifyTable.FieldByName('NAME').AsString := FSQL.FieldByName('USR$NAME').AsString;
            ModifyTable.FieldByName('CLOSETIME').Value := FSQL.FieldByName('USR$CLOSETIME').Value;
            ModifyTable.Post;
            if S > '' then
              S := S + ', ';
            S := S + FSQL.FieldByName('USR$NAME').AsString;

            FSQL.Next;
          end;
          FSQL.Close;
        finally
          ModifyTable.Commit;
        end;

        if ES <> '' then
        begin
          if S = '' then
            S := ES
          else
            S := S + ', ' + ES;
        end;

        if S > '' then
        begin
          LineTable.Edit;
          LineTable.FieldByName('MODIFYSTRING').AsString := S;
          LineTable.Post;
        end;

        FReadSQL.Next;
      end;
    finally
      FSQL.Free;
    end;

    Result := True;
  finally
    HeaderTable.AfterPost := APost;
    LineTable.BeforePost := BPost;
    FReadSQL.Close;
    FReadSQL.Transaction.Commit;
  end;
end;

procedure TFrontBase.GetUserList(UserList: TStrings);
begin
  UserList.Clear;
  FReadSQL.Close;

  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;

  try
    FReadSQL.SQL.Text :=
      ' select u.id, u.usr$name FROM usr$users u WHERE u.disabled = 0 ORDER BY u.usr$name';

    FReadSQL.ExecQuery;
    while not FReadSQL.EOF do
    begin
      UserList.Add(FReadSQL.FieldByName('usr$name').AsString + '=' + FReadSQL.FieldByName('ID').AsString);
      FReadSQL.Next;
    end
  finally
    FReadSQL.Close;
    FReadSQL.Transaction.Commit;
  end;
end;

function TFrontBase.GetUserOrders(ContactKey: Integer; var MemTable: TkbmMemTable): Boolean;
begin
  Result := False;
  FReadSQL.Close;
  MemTable.Close;
  MemTable.CreateTable;
  MemTable.Open;
  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;

  try
    FReadSQL.SQL.Text :=
     ' SELECT  ' +
     '   Z.ID, ' +
     '   Z.NUMBER, ' +
     '   U.USR$GUESTCOUNT, ' +
     '   U.USR$LOGICDATE,  ' +
     '   U.USR$PAY,   ' +
     '   U.USR$TIMECLOSEORDER, ' +
     '   U.USR$TIMEORDER, ' +
     '   U.USR$VIP, ' +
     '   U.USR$ISLOCKED, ' +
     '   ( SELECT ' +
     '     SUM ( L.USR$SUMNCUWITHDISCOUNT ) ' +
     '   FROM ' +
     '     USR$MN_ORDERLINE L ' +
     '   WHERE ' +
     '     L.MASTERKEY  =  Z.ID ' +
     '        AND ' +
     '      L.USR$CAUSEDELETEKEY + 0 IS NULL    ) AS USR$SUMNCUWITHDISCOUNT, ' +
     '   Z.USR$MN_PRINTDATE ' +
     '  FROM ' +
     '   GD_DOCUMENT Z ' +
     '     JOIN ' +
     '       USR$MN_ORDER U ' +
     '     ON ' +
     '       U.DOCUMENTKEY  =  Z.ID ' +
     ' WHERE ' +
     '   Z.DOCUMENTTYPEKEY  =  :OrderTypeKey ' +
     '      AND ' +
     '   Z.PARENT + 0 IS NULL ' +
     '      AND ' +
     '   USR$RESPKEY  =  :RespKey ' +
     '      AND ' +
     '   ( USR$PAY  <>  1 ) ' +
     '      AND ' +
     '   ( USR$VIP  <>  1 OR   USR$VIP IS NULL ) ' +
     ' ORDER BY ' +
     '   U.USR$LOGICDATE, ' +
     '   U.USR$TIMEORDER ';
    if ContactKey  > 0 then
      FReadSQL.ParamByName('RespKey').AsInteger := ContactKey
    else
      FReadSQL.ParamByName('RespKey').AsInteger := FContactKey;

    FReadSQL.ParamByName('OrderTypeKey').AsInteger := FOrderTypeKey;

    FReadSQL.ExecQuery;
    while not FReadSQL.EOF do
    begin
      MemTable.Append;
      MemTable.FieldByName('TABLENAME').AsString := FReadSQL.FieldByName('NUMBER').AsString;
      MemTable.FieldByName('GuestNumbers').AsInteger := FReadSQL.FieldByName('USR$GUESTCOUNT').ASInteger;
      MemTable.FieldByName('OpenTime').ASDateTime := FReadSQL.FieldByName('USR$TIMEORDER').AsDateTime;
      MemTable.FieldByName('Summ').AsCurrency := FReadSQL.FieldByName('USR$SUMNCUWITHDISCOUNT').AsCurrency;
      MemTable.FieldByName('ID').AsInteger := FReadSQL.FieldByName('ID').AsInteger;
      if FReadSQL.FieldByName('USR$PAY').ASInteger = 1 then
        MemTable.FieldByName('Status').AsInteger := Integer(osOrderPayed)
      else if not FReadSQL.FieldByName('USR$TIMECLOSEORDER').IsNull then
        MemTable.FieldByName('Status').AsInteger := Integer(osOrderClose)
      else
        MemTable.FieldByName('Status').AsInteger := Integer(osOrderOpen);
      MemTable.FieldByName('ISLOCKED').AsInteger := FReadSQL.FieldByName('USR$ISLOCKED').AsInteger;
      MemTable.Post;
      FReadSQL.Next;
    end;
    Result := True;
  finally
    FReadSQL.Close;
    FReadSQL.Transaction.Commit;
  end;
end;

function TFrontBase.GetActiveWaiterList(var MemTable: TkbmMemTable; WithPrecheck: Boolean): Boolean;
begin
  Result := False;
  FReadSQL.Close;
  MemTable.Close;
  MemTable.CreateTable;
  MemTable.Open;
  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;
  try
    FReadSQL.SQL.Text :=
      ' select    ' +
      '   distinct  ' +
      '   u.contactkey,    ' +
      '   u.ingroup,   ' +
      '   con.name as fullname    ' +
      ' from    ' +
      '   gd_user u    ' +
      '   join gd_contact con on con.id = u.contactkey    ' +
      ' where  ' +
      '   u.disabled <> 1    ' +
      '   and u.usr$mn_isfrontuser = 1    ' +
      '   and exists (select o.documentkey from usr$mn_order o where o.usr$pay <> 1 and o.usr$respkey = con.id ' ;
    if WithPrecheck then
      FReadSQL.SQL.Text := FReadSQL.SQL.Text +
        '   and o.usr$timecloseorder + 0 is not null ';
    if Options.OrderCurrentLDate then
      FReadSQL.SQL.Text := FReadSQL.SQL.Text + ' AND o.USR$LOGICDATE = :LDate ' ;
    FReadSQL.SQL.Text := FReadSQL.SQL.Text + '   ) ' +
      ' order by    ' +
      '   con.name asc  ';
    if Options.OrderCurrentLDate then
      FReadSQL.ParamByName('LDate').AsDateTime := GetLogicDate;

    FReadSQL.ExecQuery;
    while not FReadSQL.EOF do
    begin
      MemTable.Append;
      MemTable.FieldByName('ID').AsInteger := FReadSQL.FieldByName('Contactkey').AsInteger;
      MemTable.FieldByName('NAME').AsString := FReadSQL.FieldByName('fullname').AsString;
      MemTable.FieldByName('ingroup').ASInteger := FReadSQL.FieldByName('ingroup').AsInteger;
      MemTable.Post;
      FReadSQL.Next;
    end;
    Result := True;
  finally
    FReadSQL.Close;
    FReadSQL.Transaction.Commit;
  end;
end;

procedure TFrontBase.InitDB;
var
  I: Integer;
begin
  for i := 0 to ParamCount - 1 do
  begin
    if UpperCase(ParamStr(i)) = '/SN' then
      FIBPath := ParamStr(i+1)
    else if UpperCase(ParamStr(i)) = '/USER' then
      FIBName := ParamStr(i+1)
    else if UpperCase(ParamStr(i)) = '/PASSWORD' then
      FIBPassword := ParamStr(i+1)
  end;

  try
    FDataBase.DatabaseName := FIBPath;
    FDatabase.Params.Add('user_name=' + FIBName);
    FDatabase.Params.Add('password=' + FIBPassword);
    FDatabase.Params.Add('lc_ctype=WIN1251');
    FDatabase.SQLDialect := 3;
    FDataBase.Open;
    FIDTransaction.StartTransaction;
    if not FReadSQL.Transaction.InTransaction then
      FReadSQL.Transaction.StartTransaction;
    FReadSQL.Close;

    FReadSQL.SQL.Text := ' SELECT ID FROM gd_ruid WHERE xid= :xid and dbid = :dbid ' ;
    FReadSQL.ParamByName('xid').AsInteger := MN_OrderXID;
    FReadSQL.ParamByName('DBid').AsInteger := MN_OrderDBID;
    FReadSQL.ExecQuery;
    if not FReadSQL.Eof then
      FOrderTypeKey := FReadSQL.FieldByname('ID').AsInteger
    else
      FOrderTypeKey := -1;
    FReadSQL.Close;

    FReadSQL.SQL.Text :=
      ' SELECT first(1) oc.companykey ' +
      '  FROM gd_ourcompany oc  ' +
      '  WHERE oc.disabled = 0  ';
    FReadSQL.ExecQuery ;
    if not FReadSQL.Eof then
      FCompanyKey := FReadSQL.FieldByName('companyKey').AsInteger
    else
      FCompanyKey := -1;
    FReadSQL.Close;

    FReadSQL.Transaction.Commit;
  except
    raise;
  end;
end;

function TFrontBase.LogIn(UserPassword: String): Boolean;
begin
  Result := False;
  if FDataBase.Connected then
  begin
    FReadSQL.Close;
    if not FReadSQL.Transaction.InTransaction then
      FReadSQL.Transaction.StartTransaction;
    try

      FReadSQL.SQL.Text :=
        ' SELECT u.ingroup,  u.id userkey, con.name, con.id contactkey ' +
        '   FROM ' +
        '   GD_user u ' +
        '   Left Join gd_contact con on con.id = u.contactkey ' +
        ' WHERE ' +
        '    u.passw = :Password ';

      FReadSQL.ParamBYName('Password').AsString := UserPassword;
      FReadSQL.ExecQuery;
      if not FReadSQL.EOF then
      begin
        Result := True;
        FUserKey := FReadSQL.FieldByName('ingroup').AsInteger;
        FUserName := FReadSQL.FieldByName('Name').AsString;
        FContactKey := FReadSQL.FieldByName('contactkey').AsInteger;
        FUserGroup := FReadSQL.FieldByName('contactkey').AsInteger;
      end
      else
      begin
        Result := False;
        FUserKey := -1;
        FUserName := '';
        FContactKey := -1;
        FUserGroup := -1;
      end
    finally
      FReadSQL.Close;
      FReadSQL.Transaction.Commit;
    end;
  end
end;

function TFrontBase.GetLogicDate: TDateTime;
begin
  GetLogicDate := Date;
  if not Options.UseCurrentDate then
  begin
    FReadSQL.Close;
    if not FReadSQL.Transaction.InTransaction then
      FReadSQL.Transaction.StartTransaction;
    try
      FReadSQL.SQL.Text :=
        'select max(op.usr$logicdate) as LDate ' +
        '  from usr$mn_options op ';
      FReadSQL.ExecQuery;
      if not FReadSQL.EOF then
        GetLogicDate := FReadSQL.FieldByName('Ldate').AsDateTime;
    finally
      FReadSQL.Transaction.Commit;
    end;
  end;
end;

function TFrontBase.GetModificationList(var MemTable: TkbmMemTable;
  const GoodKey, ModifyGroupKey: Integer): Boolean;
begin
  Result := False;
  FReadSQL.Close;
  MemTable.Close;
  MemTable.CreateTable;
  MemTable.Open;
  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;
  try
    if GoodKey <> -1 then
    begin
      FReadSQL.SQL.Text :=
        'Select ' +
        'm.usr$name, m.id, c.usr$mn_modifykey, c.usr$gd_goodkey ' +
        'FROM usr$mn_modify m ' +
        '  JOIN USR$CROSS36_416793598 c ON c.usr$mn_modifykey = m.id ' +
        'WHERE c.usr$gd_goodkey = :goodkey ';
      FReadSQL.ParamByName('goodkey').AsInteger := GoodKey;
      FReadSQL.ExecQuery;
      while not FReadSQL.Eof do
      begin
        MemTable.Append;
        MemTable.FieldByName('ID').AsInteger := FReadSQL.FieldByName('ID').AsInteger;
        MemTable.FieldByName('NAME').AsString := FReadSQL.FieldByName('USR$NAME').AsString;
        MemTable.Post;

        FReadSQL.Next;
      end;
    end else
    if ModifyGroupKey <> -1 then
    begin
      FReadSQL.SQL.Text :=
        'SELECT m.id, m.USR$NAME FROM usr$mn_modify mn ' +
        'LEFT JOIN usr$mn_modify m ON m.LB >= mn.LB ' +
        '  AND  m.RB <= mn.RB ' +
        'WHERE m.USR$ISGROUP <> 1 ' +
        '  AND mn.ID = :modifygroupkey ';
      FReadSQL.ParamByName('modifygroupkey').AsInteger := ModifyGroupKey;
      FReadSQL.ExecQuery;
      while not FReadSQL.Eof do
      begin
        MemTable.Append;
        MemTable.FieldByName('ID').AsInteger := FReadSQL.FieldByName('ID').AsInteger;
        MemTable.FieldByName('NAME').AsString := FReadSQL.FieldByName('USR$NAME').AsString;
        MemTable.Post;

        FReadSQL.Next;
      end;
    end;
    Result := True;
  finally
    FReadSQL.Transaction.Commit;
  end;
end;

procedure TFrontBase.InitDisplay;
begin
  FDisplayInitialized := False;
  FReadSQL.Close;
  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;
  try
    FReadSQL.SQL.Text :=
      ' SELECT * FROM USR$MN_SALEDEVICE sd ' +
      ' WHERE sd.USR$COMPUTERNAME = :ComputerName and sd.usr$active = 1 ';
    FReadSQL.Params[0].AsString := GetLocalComputerName;
    FReadSQL.ExecQuery;
    if not FReadSQL.Eof then
    begin
      while not FReadSQL.Eof do
      begin
        if FReadSQL.FieldByName('USR$DEVICETYPE').AsInteger = 0 then
        begin
          FDisplay := TDisplay.Create;
          FDisplay.ComPort := FReadSQL.FieldByName('USR$COMPORT').AsInteger;
          FDisplay.Init(True, 1);

          Break;
        end;
        FReadSQL.Next;
      end;
    end else
    begin
      FDisplay := TDisplay.Create;
      FDisplay.Init(False, -1);
    end;
    FDisplayInitialized := True;
  finally
    FReadSQL.Transaction.Commit;
  end;
end;

function TFrontBase.GetDisplay: TDisplay;
begin
  if not FDisplayInitialized then
    InitDisplay;

  Result := FDisplay;
end;

class function TFrontBase.GetLocalComputerName: String;
var
  ComputerName: array[0..MAX_COMPUTERNAME_LENGTH + 1] of Char;
  ComputerNameSize: DWORD;
begin
  ComputerNameSize := SizeOf(ComputerName);
  if GetComputerName(ComputerName, ComputerNameSize) = BOOL(0) then
    Result := ''
  else
    Result := AnsiUpperCase(ComputerName);
end;

function TFrontBase.GetPayKindType(var MemTable: TkbmMemTable;
  const PayType: Integer; IsPlCard: Integer): Boolean;
var
  S: String;
begin
  Result := False;
  FReadSQL.Close;
  MemTable.Close;
  MemTable.CreateTable;
  MemTable.Open;
  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;
  try
    S :=
      ' SELECT USR$NAME, USR$PAYTYPEKEY, USR$NOFISCAL, ID FROM USR$MN_KINDTYPE ' +
      ' WHERE USR$PAYTYPEKEY = :paytype ';
    if IsPlCard = 1 then
      S := S + ' AND USR$ISPLCARD = 1 '
    else
      S := S + ' AND ((USR$ISPLCARD IS NULL) OR (USR$ISPLCARD = 0))';

    FReadSQL.SQL.Text := S;
    FReadSQL.Params[0].AsInteger := PayType;
    FReadSQL.ExecQuery;
    while not FReadSQL.Eof do
    begin
      MemTable.Append;
      MemTable.FieldByName('USR$NAME').AsString := FReadSQL.FieldByName('USR$NAME').AsString;
      MemTable.FieldByName('USR$PAYTYPEKEY').AsInteger := FReadSQL.FieldByName('ID').AsInteger;
      MemTable.FieldByName('USR$NOFISCAL').AsInteger := FReadSQL.FieldByName('USR$NOFISCAL').AsInteger;
      MemTable.Post;

      FReadSQL.Next;
    end;
    Result := True;
  finally
    FReadSQL.Transaction.Commit;
  end;
end;

function TFrontBase.GetIDByRUID(const XID: Integer;
  const DBID: Integer): Integer;
begin
  Result := -1;

  FReadSQL.Close;
  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;
  try
    FReadSQL.SQL.Text := ' SELECT ID FROM gd_ruid WHERE xid= :xid and dbid = :dbid ' ;
    FReadSQL.ParamByName('xid').AsInteger := XID;
    FReadSQL.ParamByName('DBid').AsInteger := DBID;
    FReadSQL.ExecQuery;
    if not FReadSQL.Eof then
      Result := FReadSQL.FieldByname('ID').AsInteger;

  finally
    FReadSQL.Transaction.Commit;
  end;
end;

function TFrontBase.GetCashCode: Integer;
begin
  if FCashCode > 0 then
    Result := FCashCode
  else begin
    FReadSQL.Close;
    if not FReadSQL.Transaction.InTransaction then
      FReadSQL.Transaction.StartTransaction;
    try
      FReadSQL.SQL.Text :=
        ' select ' +
        '   first(1) ' +
        '   s.usr$cashcode as code, s.USR$COMPORT as comport, s.usr$cashnumber as number, s.id ' +
        ' from ' +
        '   usr$mn_pointofsaleset  s  ' +
        ' where ' +
        '   upper(s.usr$computer) = upper(:comp) ' +
        '   and coalesce(s.usr$active, 0) = 0 ' +
        '   and s.usr$kassa > '''' ' +
        ' order by  ' +
        '   s.id desc ';
      FReadSQL.Params[0].AsString := AnsiUpperCase(GetLocalComputerName);
      FReadSQL.ExecQuery;
      if not FReadSQL.Eof then
      begin
        FCashCode := FReadSQL.FieldByName('code').AsInteger;
        FFiscalComPort := FReadSQL.FieldByName('comport').AsInteger;
        FCashNumber := FReadSQL.FieldByName('number').AsInteger;
        FIsMainCash := True;
      end else
      begin
        FCashCode := -1;
        FFiscalComPort := -1;
        FCashNumber := -1;
        FIsMainCash := False;
      end;
      Result := FCashCode;
    finally
      FReadSQL.Transaction.Commit;
    end;
  end;
end;

function TFrontBase.GetFiscalComPort: Integer;
begin
  if FFiscalComPort > 0 then
    Result := FFiscalComPort
  else begin
    FReadSQL.Close;
    if not FReadSQL.Transaction.InTransaction then
      FReadSQL.Transaction.StartTransaction;
    try
      FReadSQL.SQL.Text :=
        ' select ' +
        '   first(1) ' +
        '   s.usr$cashcode as code, s.USR$COMPORT as comport, s.usr$cashnumber as number, s.id ' +
        ' from ' +
        '   usr$mn_pointofsaleset  s  ' +
        ' where ' +
        '   upper(s.usr$computer) = upper(:comp) ' +
        '   and coalesce(s.usr$active, 0) = 0 ' +
        '   and s.usr$kassa > '''' ' +
        ' order by  ' +
        '   s.id desc ';
      FReadSQL.Params[0].AsString := AnsiUpperCase(GetLocalComputerName);
      FReadSQL.ExecQuery;
      if not FReadSQL.Eof then
      begin
        FCashCode := FReadSQL.FieldByName('code').AsInteger;
        FFiscalComPort := FReadSQL.FieldByName('comport').AsInteger;
        FCashNumber := FReadSQL.FieldByName('number').AsInteger;
        FIsMainCash := True;
      end else
      begin
        FCashCode := -1;
        FFiscalComPort := -1;
        FCashNumber := -1;
        FIsMainCash := False;
      end;
      Result := FFiscalComPort;
    finally
      FReadSQL.Transaction.Commit;
    end;
  end;
end;

function TFrontBase.GetCashNumber: Integer;
begin
  if FCashNumber > 0 then
    Result := FCashNumber
  else begin
    FReadSQL.Close;
    if not FReadSQL.Transaction.InTransaction then
      FReadSQL.Transaction.StartTransaction;
    try
      FReadSQL.SQL.Text :=
        ' select ' +
        '   first(1) ' +
        '   s.usr$cashcode as code, s.USR$COMPORT as comport, s.usr$cashnumber as number, s.id ' +
        ' from ' +
        '   usr$mn_pointofsaleset  s  ' +
        ' where ' +
        '   upper(s.usr$computer) = upper(:comp) ' +
        '   and coalesce(s.usr$active, 0) = 0 ' +
        '   and s.usr$kassa > '''' ' +
        ' order by  ' +
        '   s.id desc ';
      FReadSQL.Params[0].AsString := AnsiUpperCase(GetLocalComputerName);
      FReadSQL.ExecQuery;
      if not FReadSQL.Eof then
      begin
        FCashCode := FReadSQL.FieldByName('code').AsInteger;
        FFiscalComPort := FReadSQL.FieldByName('comport').AsInteger;
        FCashNumber := FReadSQL.FieldByName('number').AsInteger;
        FIsMainCash := True;
      end else
      begin
        FCashCode := -1;
        FFiscalComPort := -1;
        FCashNumber := -1;
        FIsMainCash := False;
      end;
      Result := FCashNumber;
    finally
      FReadSQL.Transaction.Commit;
    end;
  end;
end;

function TFrontBase.GetIsMainCash: Boolean;
begin
  if FIsMainCash then
    Result := True
  else begin
    FReadSQL.Close;
    if not FReadSQL.Transaction.InTransaction then
      FReadSQL.Transaction.StartTransaction;
    try
      FReadSQL.SQL.Text :=
        ' select ' +
        '   first(1) ' +
        '   s.usr$cashcode as code, s.USR$COMPORT as comport, s.usr$cashnumber as number, s.id ' +
        ' from ' +
        '   usr$mn_pointofsaleset  s  ' +
        ' where ' +
        '   upper(s.usr$computer) = upper(:comp) ' +
        '   and coalesce(s.usr$active, 0) = 0 ' +
        '   and s.usr$kassa > '''' ' +
        ' order by  ' +
        '   s.id desc ';
      FReadSQL.Params[0].AsString := AnsiUpperCase(GetLocalComputerName);
      FReadSQL.ExecQuery;
      if not FReadSQL.Eof then
      begin
        FCashCode := FReadSQL.FieldByName('code').AsInteger;
        FFiscalComPort := FReadSQL.FieldByName('comport').AsInteger;
        FCashNumber := FReadSQL.FieldByName('number').AsInteger;
        FIsMainCash := True;
      end else
      begin
        FCashCode := -1;
        FFiscalComPort := -1;
        FCashNumber := -1;
        FIsMainCash := False;
      end;
      Result := FIsMainCash;
    finally
      FReadSQL.Transaction.Commit;
    end;
  end;
end;


function TFrontBase.GetNameWaiterOnID(const ID: Integer; WithGroup,
  TwoRows: Boolean): String;
var
  S, UserInGroupName: String;
begin
  Result := '';

  FReadSQL.Close;
  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;
  try
    FReadSQL.SQL.Text :=
      ' select ' +
      '   con.name, u.ingroup ' +
      ' from ' +
      '   gd_contact con ' +
      '   join gd_user u on u.contactkey = con.id ' +
      ' where ' +
      '   con.id = :id ';
    FReadSQL.Params[0].AsInteger := ID;
    FReadSQL.ExecQuery;
    if not FReadSQL.Eof then
    begin
      if TwoRows then
        S := #13#10
      else
        S := '';

      if WithGroup then
      begin
        if (FReadSQL.FieldByName('InGroup').AsInteger and Options.ManagerGroupMask) <> 0 then
          UserInGroupName := 'Менеджер: '
        else if (FReadSQL.FieldByName('InGroup').AsInteger and Options.KassaGroupMask) <> 0 then
          UserInGroupName := 'Кассир: '
        else
          UserInGroupName := 'Официант: ';

        S := UserInGroupName + S;
      end;
      Result := S + FReadSQL.FieldByName('name').AsString;
    end;
  finally
    FReadSQL.Transaction.Commit;
  end;
end;

function TFrontBase.SavePayment(const ContactKey, OrderKey,
  PayKindKey: Integer; Sum: Currency): Boolean;
var
  FSQL: TIBSQL;
begin
  Result := False;

  FSQL := TIBSQL.Create(nil);
  FSQL.Transaction := FCheckTransaction;
  FSQL.SQL.Text :=
    'insert into usr$mn_payment ( ' +
    '    editorkey, ' +
    '    usr$orderkey, ' +
    '    usr$paykindkey, ' +
    '    usr$sumncu, ' +
    '    usr$datetime) ' +
    '  values ( ' +
    '    :editorkey, ' +
    '    :usr$orderkey, ' +
    '    :usr$paykindkey, ' +
    '    :usr$sumncu, ' +
    '    :usr$datetime) ';
  try
    if not FCheckTransaction.InTransaction then
      FCheckTransaction.StartTransaction;
    // фиксируем суммы, оплаченные различными формами оплаты
    try
      FSQL.ParamByName('editorkey').AsInteger := ContactKey;
      FSQL.ParamByName('usr$orderkey').AsInteger := OrderKey;
      FSQL.ParamByName('usr$paykindkey').AsInteger := PayKindKey;
      FSQL.ParamByName('usr$sumncu').AsCurrency := Sum;
      FSQL.ParamByName('usr$datetime').AsDateTime := Now;
      FSQL.ExecQuery;
    except
      on E: Exception do
      begin
        AdvTaskMessageDlg('Внимание', 'Ошибка при сохранении чека ' + E.Message, mtError, [mbOK], 0);
        FCheckTransaction.Rollback;
      end;
    end;

  finally
    if FCheckTransaction.InTransaction then
      FCheckTransaction.Commit;

    FSQL.Free;
  end;
end;

function TFrontBase.SaveOrderLog(const WaiterKey, ManagerKey, OrderKey,
  OrderLineKey, Operation: Integer): Boolean;
var
  FSQL: TIBSQL;
  Curr: Currency;
begin
  Result := False;

  FSQL := TIBSQL.Create(nil);
  FSQL.Transaction := FCheckTransaction;
  FSQL.SQL.Text :=
    'insert into usr$mn_log ( ' +
    '    usr$waiterkey, ' +
    '    usr$managerkey, ' +
    '    usr$orderkey, ' +
    '    usr$orderlinekey, ' +
    '    usr$ordersum, ' +
    '    usr$operation, ' +
    '    usr$logicdate) ' +
    '  values ( ' +
    '    :usr$waiterkey, ' +
    '    :usr$managerkey, ' +
    '    :usr$orderkey, ' +
    '    :usr$orderlinekey, ' +
    '    :usr$ordersum, ' +
    '    :usr$operation, ' +
    '    :usr$logicdate) ';
  try
    if not FCheckTransaction.InTransaction then
      FCheckTransaction.StartTransaction;
    // фиксируем суммы, оплаченные различными формами оплаты
    try
      FReadSQL.Close;
      if not FReadSQL.Transaction.InTransaction then
        FReadSQL.Transaction.StartTransaction;
      try
        FReadSQL.SQL.Text :=
          ' SELECT  ' +
          '   SUM ( L.USR$SUMNCUWITHDISCOUNT ) SumWithDiscount ' +
          ' FROM ' +
          '   USR$MN_ORDERLINE L ' +
          ' WHERE  ' +
          '   L.MASTERKEY  =  :OrderKey ' +
          '      AND  ' +
          '   L.USR$CAUSEDELETEKEY + 0 IS NULL ';
        FReadSQL.ParamByName('ORDERKEY').AsInteger := OrderKey;
        FReadSQL.ExecQuery;
        Curr := FReadSQL.Fields[0].AsCurrency;
      finally
        FReadSQL.Transaction.Commit;
      end;

      FSQL.ParamByName('USR$WAITERKEY').AsInteger := WaiterKey;
      FSQL.ParamByName('USR$MANAGERKEY').AsInteger := ManagerKey;
      FSQL.ParamByName('USR$ORDERKEY').AsInteger := OrderKey;
      FSQL.ParamByName('USR$ORDERKEY').AsInteger := OrderLineKey;
      FSQL.ParamByName('USR$OPERATION').AsInteger := Operation;
      FSQL.ParamByName('USR$LOGICDATE').AsDateTime := GetLogicDate;
      FSQL.ParamByName('USR$ORDERSUM').AsCurrency := Curr;
      FSQL.ExecQuery;
    except
      on E: Exception do
      begin
        AdvTaskMessageDlg('Внимание', 'Ошибка при сохранении лога ' + E.Message, mtError, [mbOK], 0);
        FCheckTransaction.Rollback;
      end;
    end;
  finally
    if FCheckTransaction.InTransaction then
      FCheckTransaction.Commit;

    FSQL.Free;
  end;
end;

class function TFrontBase.GetGroupMask(const AGroupID: Integer): Integer;
begin
  Assert(AGroupID in [1..32], 'Invalid group ID specified. Must be between 1 and 32.');
  Result := 1 shl (AGroupID - 1);
end;

function TFrontBase.CheckUserPasswordWithForm: TUserInfo;
var
  FForm: TCardCode;
begin
  Result.CheckedUserPassword := False;

  FForm := TCardCode.Create(nil);
  try
    FForm.ShowModal;
    if FForm.ModalResult = 1 then
    begin
      FReadSQL.Close;
      if not FReadSQL.Transaction.InTransaction then
        FReadSQL.Transaction.StartTransaction;
      try
        FReadSQL.SQL.Text :=
          'select ' +
          '  con.id, con.name, usr.ingroup ' +
          'from  ' +
          '  gd_user usr  ' +
          '  join gd_contact con on con.id = usr.contactkey  ' +
          'where ' +
          '  usr.passw = :pass ' +
          '  and usr.disabled = 0  ' +
          '  and usr.usr$mn_isfrontuser = 1 ';
        FReadSQL.Params[0].AsString := FForm.InputString;
        FReadSQL.ExecQuery;
        if not FReadSQL.Eof then
        begin
          Result.CheckedUserPassword := True;
          Result.UserName := FReadSQL.FieldByName('Name').AsString;
          Result.UserKey := FReadSQL.FieldByName('ID').AsInteger;
          Result.UserInGroup := FReadSQL.FieldByName('InGroup').AsInteger;
        end;
      finally
        FReadSQL.Transaction.Commit;
      end;
    end;  
  finally
    FForm.Free;
  end;
end;

function TFrontBase.CloseModifyTable(var ModifyTable: TkbmMemTable;
  const CloseTime: TTime): Boolean;
var
  FSQL: TIBSQL;

const
  UpdateModify = ' UPDATE USR$CROSS509_157767346 C ' +
    ' SET C.USR$CLOSETIME = :closetime       ' +
    ' WHERE C.usr$mn_orderlinekey = :linekey ';

begin
  Result := False;

  FSQL := TIBSQL.Create(nil);
  FSQL.Transaction := FCheckTransaction;
  FSQL.SQL.Text := UpdateModify;
  try
    try
      if not FCheckTransaction.InTransaction then
        FCheckTransaction.StartTransaction;

      ModifyTable.First;
      while not ModifyTable.Eof do
      begin
        if ModifyTable.FieldByName('CLOSETIME').AsString = '' then
        begin
          FSQL.ParamByName('linekey').AsInteger := ModifyTable.FieldByName('MASTERKEY').AsInteger;
          FSQL.ParamByName('closetime').AsTime := CloseTime;
          FSQL.ExecQuery;
          FSQL.Close;
        end;
        ModifyTable.Next;
      end;
    except
      on E: Exception do
      begin
        AdvTaskMessageDlg('Внимание', 'Ошибка при сохранении заказа ' + E.Message, mtError, [mbOK], 0);
        FCheckTransaction.Rollback;
      end;
    end;
  finally
    if FCheckTransaction.InTransaction then
      FCheckTransaction.Commit;

    FSQL.Free;
  end;
end;

function TFrontBase.SaveAndReloadOrder(var HeaderTable, LineTable,
  ModifyTable: TkbmMemTable; OrderKey: Integer): Boolean;
begin
  Result := False;
  CreateNewOrder(HeaderTable, LineTable, ModifyTable, OrderKey);
  LockUserOrder(OrderKey);
  Result := GetOrder(HeaderTable, LineTable, ModifyTable, OrderKey);
end;

function TFrontBase.LockUserOrder(const OrderKey :Integer): Boolean;
var
  FSQL: TIBSQL;
begin
  Result := False;

  FSQL := TIBSQL.Create(nil);
  FSQL.Transaction := FCheckTransaction;
  FSQL.SQL.Text :=
    ' UPDATE USR$MN_ORDER ' +
    ' SET USR$ISLOCKED = 1 ' +
    ' WHERE DOCUMENTKEY = :orderkey ';
  try
    try
      if not FCheckTransaction.InTransaction then
        FCheckTransaction.StartTransaction;

      FSQL.Params[0].AsInteger := OrderKey;
      FSQL.ExecQuery;
      FSQL.Close;
    except
      on E: Exception do
      begin
        AdvTaskMessageDlg('Внимание', 'Ошибка при сохранении заказа ' + E.Message, mtError, [mbOK], 0);
        FCheckTransaction.Rollback;
      end;
    end;
  finally
    if FCheckTransaction.InTransaction then
      FCheckTransaction.Commit;

    FSQL.Free;
  end;
end;

function TFrontBase.UnLockUserOrder(const OrderKey: Integer): Boolean;
var
  FSQL: TIBSQL;
begin
  Result := False;

  FSQL := TIBSQL.Create(nil);
  FSQL.Transaction := FCheckTransaction;
  FSQL.SQL.Text :=
    ' UPDATE USR$MN_ORDER ' +
    ' SET USR$ISLOCKED = 0 ' +
    ' WHERE DOCUMENTKEY = :orderkey ';
  try
    if not FCheckTransaction.InTransaction then
      FCheckTransaction.StartTransaction;

    FSQL.Params[0].AsInteger := OrderKey;
    try
      FSQL.ExecQuery;
      FSQL.Close;
    except
      on E: Exception do
      begin
        AdvTaskMessageDlg('Внимание', 'Ошибка при сохранении заказа ' + E.Message, mtError, [mbOK], 0);
        FCheckTransaction.Rollback;
      end;
    end;
  finally
    if FCheckTransaction.InTransaction then
      FCheckTransaction.Commit;

    FSQL.Free;
  end;
end;

function TFrontBase.GetPrinterName: String;
begin
  FReadSQL.Close;
  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;
  try
    FReadSQL.SQL.Text :=
      'select first(1) ' +
      '  prnset.usr$printername, prnset.USR$ENCLOSE, prnset.usr$printerid ' +
      'from ' +
      '  usr$mn_prngroupset prnset ' +
      'where ' +
      '  prnset.usr$kassa = 1 ' +
      '  and prnset.usr$computername = :comp ';
    FReadSQL.Params[0].AsString := GetLocalComputerName;
    FReadSQL.ExecQuery;
    if not FReadSQL.Eof then
      Result := FReadSQL.FieldByName('usr$printername').AsString
    else
      Result := '';
  finally
    FReadSQL.Transaction.Commit;
  end;
end;

function TFrontBase.GetReportTemplate(var Stream: TStream; const ID: Integer): Boolean;
begin
  Result := False;

  FReadSQL.Close;
  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;
  try
    FReadSQL.SQL.Text :=
      'SELECT USR$TEMPLATEDATA AS TEMPLATEDATA '  +
      'FROM USR$MN_REPORT  ' +
      'WHERE ID = :ID ';
{      'SELECT TM.TEMPLATEDATA ' +
      'FROM RP_REPORTLIST L ' +
      'JOIN RP_REPORTTEMPLATE TM ON L.TEMPLATEKEY = TM.ID ' +
      'WHERE L.ID = :ID ';        }
    FReadSQL.Params[0].AsInteger := ID;
    FReadSQL.ExecQuery;
    if not FReadSQL.Eof then
    begin
      Result := True;
      FReadSQL.FieldByName('templatedata').SaveToStream(Stream);
    end;
  finally
    FReadSQL.Transaction.Commit;
  end;
end;

function TFrontBase.OrderIsPayed(const ID: Integer): Boolean;
begin
  Result := False;

  FReadSQL.Close;
  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;
  try
    FReadSQL.SQL.Text :=
      'SELECT usr$pay FROM USR$MN_ORDER ' +
      'where documentkey = :id ';
    FReadSQL.Params[0].AsInteger := ID;
    FReadSQL.ExecQuery;
    if FReadSQL.FieldByName('usr$pay').AsInteger = 1 then
      Result := True;
  finally
    FReadSQL.Transaction.Commit;
  end;
end;

class function TFrontBase.RoundCost(const Cost: Currency): Currency;
begin
  Result := Round(Cost / 10.0000 + 0.0000000001) * 10;
end;

function TFrontBase.GetDiscount(const DiscKey, GoodKey: Integer;
  DocDate: TDateTime; PersDiscount: Currency): Currency;
var
  FSQL: TIBSQL;
  DidActivate: Boolean;
begin
  Result := 0;

  DidActivate := FReadSQL.Transaction.InTransaction;
  FSQL := TIBSQL.Create(nil);
  FSQL.Transaction := FReadSQL.Transaction;
  try
    if not DidActivate then
      FReadSQL.Transaction.StartTransaction;

    FSQL.SQL.Text :=
      'SELECT G.DISCOUNT ' +
      'FROM USR$MN_P_GETDISCOUNT(:disckey, :goodkey, :docdate, :persdiscount) G ';
    FSQL.ParamByName('disckey').AsInteger := DiscKey;
    FSQL.ParamByName('goodkey').AsInteger := GoodKey;
    FSQL.ParamByName('docdate').AsDateTime := DocDate;
    FSQL.ParamByName('persdiscount').AsCurrency := PersDiscount;
    FSQL.ExecQuery;
    if not FSQL.Eof then
      Result := FSQL.FieldByName('DISCOUNT').AsCurrency;

  finally
    if not DidActivate then
      FReadSQL.Transaction.Commit;
    FSQL.Free;
  end;
end;

function TFrontBase.GetDiscountList(var MemTable: TkbmMemTable): Boolean;
begin
  Result := False;
  FReadSQL.Close;
  MemTable.Close;
  MemTable.CreateTable;
  MemTable.Open;
  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;
  try
    FReadSQL.SQL.Text := 'select ID, USR$NAME from USR$MN_DISCOUNTNAME';
    FReadSQL.ExecQuery;
    while not FReadSQL.EOF do
    begin
      MemTable.Append;
      MemTable.FieldByName('ID').AsInteger := FReadSQL.FieldByName('ID').AsInteger;
      MemTable.FieldByName('USR$NAME').AsString := FReadSQL.FieldByName('USR$NAME').AsString;
      MemTable.Post;
      FReadSQL.Next;
    end;
    Result := True;
  finally
    FReadSQL.Close;
    FReadSQL.Transaction.Commit;
  end;
end;

function TFrontBase.GetDiscountCardInfo(
  var MemTable: TkbmMemTable; const CardID: Integer; LDate: TDateTime; Pass: String): Boolean;
begin
  Result := False;
  FReadSQL.Close;
  MemTable.Close;
  MemTable.CreateTable;
  MemTable.Open;
  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;
  try
    if Pass = '' then
      FReadSQL.SQL.Text :=
        '  select first(1) ' +
        '    c.id, name.usr$name as discountname,  ' +
        '    dt.usr$percent as discpers, ' +
        '    coalesce(c.usr$surname, '''') || '' '' || coalesce(c.usr$firstname, '''') || '' '' || coalesce(c.usr$middlename, '''') as contactname, ' +
        '    dt.usr$fromdate, ' +
        '    name.id DiscKey, name.usr$bonus, c.USR$BALANCE  ' +
        '  from                                              ' +
        '    usr$mn_discountcard c                           ' +
        '    left join usr$mn_discountname name on name.id = c.usr$discountnamekey ' +
        '    left join usr$mn_discounttype dt on dt.usr$discountnamekey = name.id and dt.usr$fromdate <= :adate  ' +
        '  where c.id = :id  ' +
        '    and c.usr$datebegin <= :adate  ' +
        '    and (c.usr$dateend >= :adate or c.usr$dateend is null) ' +
        '  order by dt.usr$fromdate desc '
    else
      FReadSQL.SQL.Text :=
        '  select first(1) ' +
        '    c.id, name.usr$name as discountname,  ' +
        '    dt.usr$percent as discpers, ' +
        '    coalesce(c.usr$surname, '''') || '' '' || coalesce(c.usr$firstname, '''') || '' '' || coalesce(c.usr$middlename, '''') as contactname, ' +
        '    dt.usr$fromdate, ' +
        '    name.id DiscKey, name.usr$bonus, c.USR$BALANCE  ' +
        '  from                                              ' +
        '    usr$mn_discountcard c                           ' +
        '    left join usr$mn_discountname name on name.id = c.usr$discountnamekey ' +
        '    left join usr$mn_discounttype dt on dt.usr$discountnamekey = name.id and dt.usr$fromdate <= :adate  ' +
        '  where c.usr$code = :pass  ' +
        '    and c.usr$datebegin <= :adate  ' +
        '    and (c.usr$dateend >= :adate or c.usr$dateend is null) ' +
        '  order by dt.usr$fromdate desc ';

    FReadSQL.ParamByName('adate').AsDateTime := LDate;
    if Pass = '' then
      FReadSQL.ParamByName('id').AsInteger := CardID
    else
      FReadSQL.ParamByName('pass').AsString := Pass;
    FReadSQL.ExecQuery;
    while not FReadSQL.EOF do
    begin
      MemTable.Append;
      MemTable.FieldByName('ID').AsInteger := FReadSQL.FieldByName('ID').AsInteger;
      MemTable.FieldByName('contactname').AsString := FReadSQL.FieldByName('contactname').AsString;
      MemTable.FieldByName('Discountname').AsString := FReadSQL.FieldByName('Discountname').AsString;
      MemTable.FieldByName('DiscPers').AsCurrency := FReadSQL.FieldByName('DiscPers').AsCurrency;
      MemTable.FieldByName('usr$bonus').AsCurrency := FReadSQL.FieldByName('usr$bonus').AsCurrency;
      MemTable.FieldByName('USR$BALANCE').AsCurrency := FReadSQL.FieldByName('USR$BALANCE').AsCurrency;
      MemTable.FieldByName('DiscKey').AsInteger := FReadSQL.FieldByName('DiscKey').AsInteger;
      MemTable.Post;
      FReadSQL.Next;
    end;
    Result := True;
  finally
    FReadSQL.Close;
    FReadSQL.Transaction.Commit;
  end;
end;

function TFrontBase.CalcBonusSum(var DataSet: TDataSet;
  FLine: TkbmMemTable; var Bonus: Boolean;
  var PercDisc: Currency): Boolean;
var
  SumCheck: Currency;
begin
  Result := False;
  FReadSQL.Close;
  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;
  try
    FReadSQL.SQL.Text :=
      'SELECT d.usr$bonus ' +
      'FROM usr$mn_discountname d ' +
      'where d.id = :id ';
    FReadSQL.Params[0].AsInteger := DataSet.FieldByname('USR$DISCOUNTKEY').AsInteger;
    FReadSQL.ExecQuery;
    
    Bonus := (FReadSQL.FieldByName('USR$BONUS').AsInteger = 1);
    if Bonus then
    begin
      SumCheck := 0;

      FLine.First;
      FReadSQL.Close;
      FReadSQL.SQL.Text :=
        'SELECT g.usr$nobonus ' +
        'FROM gd_good g ' +
        'where g.id = :id ';
      while not FLine.Eof do
      begin
        FReadSQL.Params[0].AsInteger := FLine.FieldByName('USR$GOODKEY').AsInteger;
        FReadSQL.ExecQuery;
        if FReadSQL.FieldByName('usr$nobonus').AsInteger <> 1 then
          SumCheck := SumCheck + FLine.FieldByName('usr$sumncu').AsCurrency;

        FReadSQL.Close;
        FLine.Next;
      end;

      if SumCheck <> 0 then
      begin
        PercDisc := DataSet.FieldByName('USR$BONUSSUM').AsCurrency / SumCheck * 100;
        if PercDisc > 70 then
          PercDisc := 70;
      end else
        PercDisc := 0;
    end;
    Result := True;
  finally
    FReadSQL.Close;
    FReadSQL.Transaction.Commit;
  end;
end;

function TFrontBase.GetServiceCheckQuery(var Query: TIBQuery;
  const PrnGrID, DocID: Integer; const PrinterName: String): Boolean;
var
  S: String;
begin
  Result := False;
  try
    S :=
      'select ' +
      '  doc.documentdate, ' +
      '  doc.number as NUM, ' +
      '  comp.name compname, ' +
      '  o.usr$guestcount guest,  ' +
      '  con.name conname,        ' +
      '  o.usr$timeorder as open1, ' +
      '  g.alias,                  ' +
      '  g.name as goodname,         ' +
      '  prngr.usr$name as prngroupname,  ' +
      '  setprn.usr$printername as printername,  ' +
      '  '' *** '' || m.usr$name || '' ***'' as modifyname,  ' +
      '  ol.documentkey as documentkey, ' +
      '  ol.usr$quantity as q           ' +
      'from                             ' +
      '  gd_document doc                ' +
      '  join usr$mn_order o on doc.id = o.documentkey and doc.id = :docid  ' +
      '    and doc.usr$mn_printdate is null   ' +
      '  join usr$mn_orderline ol on o.documentkey = ol.masterkey ' +
      '  join gd_document docl on docl.id = ol.documentkey ' +
      '     and docl.usr$mn_printdate is null  ' +
      '  join gd_good g on g.id = ol.usr$goodkey  ' +
      '  join usr$mn_prngroup prngr on prngr.id = g.usr$prngroupkey  ' +
      '  join usr$mn_prngroupset setprn on setprn.usr$prngroup = prngr.id ' +
      '  JOIN gd_contact comp ON comp.id = doc.companykey ' +
      '  left join usr$cross509_157767346 cr on cr.usr$mn_orderlinekey = ol.documentkey  ' +
      '  left join usr$mn_modify m on m.id = cr.usr$mn_modifykey ' +
      '  LEFT JOIN usr$mn_p_getcontact_department(o.usr$respkey) cd ON 0 = 0  ' +
      '  LEFT JOIN gd_contact con ON con.id = cd.peoplekey ' +
      '  LEFT JOIN gd_contact dept ON dept.id = cd.departmentkey ' +
      'where   ' +
      '  setprn.usr$printername = :printername  ' +
      '  and ol.usr$quantity + 0 > 0  ' +
      '  and ol.usr$causedeletekey + 0 is null  ' +
      '  and setprn.usr$computername = :COMP  ' +
      '  and setprn.usr$kassa + 0 = 0 ';
    if prngrid <> 0 then
      S := S + '  and prngr.id = :prngrid ';
    S := S +
      'ORDER BY ' +
      '  prngr.usr$name, ol.documentkey ';
    Query.Database := FDataBase;
    Query.SQL.Text := S;
    Query.ParamByName('docid').AsInteger := DocID;
    Query.ParambyName('printername').AsString := PrinterName;
    Query.ParambyName('comp').AsString := GetLocalComputerName;
    if prngrid <> 0 then
      Query.ParambyName('prngrid').Value := PrnGrID;
    Query.Open;

    Result := True;
  except
    on E: Exception do
        AdvTaskMessageDlg('Внимание', 'Ошибка ' + E.Message, mtError, [mbOK], 0);
  end;
end;

function TFrontBase.GetServiceCheckOptions(const DocID: Integer;
  out PrinterName: String; out PrnGrid: Integer): Boolean;
begin
  Result := False;
  FReadSQL.Close;
  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;
  try
    FReadSQL.SQL.Text :=
      'select ' +
      '  DISTINCT   ' +
      '  IIF(setprn.usr$concatchecks = 0, prn.id, null) as prngrid, prn.usr$divide,  ' +
      '  setprn.usr$printername, setprn.usr$printerid, o.documentkey, setprn.USR$DOSPRINTER  ' +
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
    FReadSQL.ParamByName('docid').AsInteger := DocID;
    FReadSQL.ParamByName('comp').AsString := GetLocalComputerName;
    FReadSQL.ExecQuery;
    if not FReadSQL.Eof then
    begin
      PrinterName := FReadSQL.FieldByName('usr$printername').AsString;
      PrnGrid := FReadSQL.FieldByName('prngrid').AsInteger;

      Result := True;
    end;
  finally
    FReadSQL.Close;
    FReadSQL.Transaction.Commit;
  end;
end;

function TFrontBase.SaveReportTemplate(var Stream: TStream;
  const ID: Integer): Boolean;
var
  FSQL: TIBSQL;
begin
  Result := False;

  FSQL := TIBSQL.Create(nil);
  FSQL.Transaction := FCheckTransaction;
  FSQL.SQL.Text :=
    'UPDATE USR$MN_REPORT ' +
    'SET USR$TEMPLATEDATA = :data ' +
    'WHERE ID = :ID ';
  try
    if not FCheckTransaction.InTransaction then
      FCheckTransaction.StartTransaction;
    // фиксируем суммы, оплаченные различными формами оплаты
    try
      FSQL.ParamByName('id').AsInteger := ID;
      FSQL.ParamByName('data').LoadFromStream(Stream);
      FSQL.ExecQuery;
    except
      on E: Exception do
      begin
        AdvTaskMessageDlg('Внимание', 'Ошибка при сохранении шаблона ' + E.Message, mtError, [mbOK], 0);
        FCheckTransaction.Rollback;
      end;
    end;

  finally
    if FCheckTransaction.InTransaction then
      FCheckTransaction.Commit;

    FSQL.Free;
  end;
end;

function TFrontBase.TryToConnect(const Count: Integer): Boolean;
var
  N: Integer;
begin
  Result := False;
  if Count <= 0 then
    exit;
  N := 0;

  while N <> Count - 1 do
  begin
    Sleep(1000);
    try
      FDataBase.Open;
      Result := True;
      break;
    except
      Result := False;
    end;
    Inc(N);
  end;
end;

function TFrontBase.SavePrintDate(const ID: Integer): Boolean;
var
  FSQL: TIBSQL;
begin
  Result := False;

  FSQL := TIBSQL.Create(nil);
  FSQL.Transaction := FCheckTransaction;
  FSQL.SQL.Text :=
    ' update gd_document doc ' +
    ' set doc.usr$mn_printdate = :pdate ' +
    ' where doc.parent = :docid ' +
    ' and doc.usr$mn_printdate is null ';
  try
    if not FCheckTransaction.InTransaction then
      FCheckTransaction.StartTransaction;
    try
      FSQL.ParamByName('docid').AsInteger := ID;
      FSQL.ParamByName('pdate').AsDateTime := Now;
      FSQL.ExecQuery;
    except
      on E: Exception do
      begin
        AdvTaskMessageDlg('Внимание', 'Ошибка при сохранении ' + E.Message, mtError, [mbOK], 0);
        FCheckTransaction.Rollback;
      end;
    end;
  finally
    if FCheckTransaction.InTransaction then
      FCheckTransaction.Commit;

    FSQL.Free;
  end;
end;

function TFrontBase.GetPreCheckQuery(var Query: TIBQuery;
  const DocID: Integer): Boolean;
begin
  Result := False;
  try
    Query.Database := FDataBase;
    Query.SQL.Text :=
      '  SELECT comp.name compname, comp.address compadr, comp.city compcity, ' +
      '  g.alias a, g.name goodname, ol.usr$costncu C,                        ' +
      '  con.name conname, doc.documentdate docdate, doc.number docnum,       ' +
      '  o.usr$guestcount guest, o.usr$timeorder open1, o.usr$timecloseorder timeclose, ' +
      '  o.usr$cash cash,  ' +
      '  SUM(ol.usr$sumncu) S,   ' +
      '  SUM(ol.usr$sumncuwithdiscount) SWD,  ' +
      '  SUM(ol.usr$sumdiscount) SD, ' +
      '  Sum(ol.usr$quantity) q      ' +
      '  FROM gd_document doc        ' +
      '  JOIN usr$mn_order o ON o.documentkey = doc.id  ' +
      '    AND doc.id = :dockey                         ' +
      '  JOIN usr$mn_orderline ol on ol.masterkey = o.documentkey  ' +
      '  JOIN gd_good g ON g.id = ol.usr$goodkey                   ' +
      '  LEFT JOIN gd_contact comp ON comp.id = doc.companykey     ' +
      '  LEFT JOIN usr$mn_p_getcontact_department(usr$respkey) cd ON 0 = 0  ' +
      '  LEFT JOIN gd_contact con ON con.id = cd.peoplekey        ' +
      '  LEFT JOIN gd_contact dept ON dept.id = cd.departmentkey  ' +
      '  where ol.usr$causedeletekey + 0 is null                  ' +
      '  GROUP BY                                                 ' +
      '  comp.name, comp.address, comp.city,                      ' +
      '  g.name, g.alias, ol.usr$costncu,                         ' +
      '  con.name, doc.documentdate, doc.number,                  ' +
      '  o.usr$guestcount, o.usr$timeorder, o.usr$timecloseorder, ' +
      '  o.usr$cash                                               ' +
      '  having Sum(ol.usr$quantity) > 0 ';
    Query.ParamByName('dockey').AsInteger := DocID;
    Query.Open;

    Result := True;
  except
    on E: Exception do
      AdvTaskMessageDlg('Внимание', 'Ошибка ' + E.Message, mtError, [mbOK], 0);
  end;
end;

function TFrontBase.GetDeleteServiceCheckQuery(var Query: TIBQuery;
  const PrnGrID, DocumentKey, MasterKey: Integer;
  const PrinterName: String): Boolean;
var
  S: String;
begin
  Result := False;
  try
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
    if prngrid <> 0 then
      S := S + '  and prngr.id = :prngrid ';

    Query.Database := FDataBase;
    Query.SQL.Text := S;
    Query.ParamByName('docid').AsInteger := DocumentKey;
    Query.ParamByName('LineID').AsInteger := MasterKey;
    Query.ParambyName('printername').AsString := PrinterName;
    Query.ParambyName('comp').AsString := GetLocalComputerName;
    if prngrid <> 0 then
      Query.ParambyName('prngrid').Value := PrnGrID;
    Query.Open;

    Result := True;
  except
    on E: Exception do
      AdvTaskMessageDlg('Внимание', 'Ошибка ' + E.Message, mtError, [mbOK], 0);
  end;
end;

function TFrontBase.GetDeleteServiceCheckOptions(const DocID,
  MasterKey: Integer; out PrinterName: String; out PrnGrid: Integer): Boolean;
begin
  Result := False;
  FReadSQL.Close;
  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;
  try
    FReadSQL.SQL.Text :=
      'select ' +
      '  DISTINCT  ' +
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
    FReadSQL.ParamByName('docid').AsInteger := DocID;
    FReadSQL.ParamByName('masterkey').AsInteger := MasterKey;
    FReadSQL.ParamByName('comp').AsString := GetLocalComputerName;
    FReadSQL.ExecQuery;
    if not FReadSQL.Eof then
    begin
      PrinterName := FReadSQL.FieldByName('usr$printername').AsString;
      PrnGrid := FReadSQL.FieldByName('prngrid').AsInteger;

      Result := True;
    end;
  finally
    FReadSQL.Close;
    FReadSQL.Transaction.Commit;
  end;
end;

function TFrontBase.GetReportList(var MemTable: TkbmMemTable): Boolean;
begin
  Result := False;
  FReadSQL.Close;
  MemTable.Close;
  MemTable.CreateTable;
  MemTable.Open;
  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;
  try
    FReadSQL.SQL.Text := 'select ID, USR$NAME FROM USR$MN_REPORT';
    FReadSQL.ExecQuery;
    while not FReadSQL.EOF do
    begin
      MemTable.Append;
      MemTable.FieldByName('ID').AsInteger := FReadSQL.FieldByName('ID').AsInteger;
      MemTable.FieldByName('NAME').AsString := FReadSQL.FieldByName('USR$NAME').AsString;
      MemTable.Post;
      FReadSQL.Next;
    end;
    Result := True;
  finally
    FReadSQL.Close;
    FReadSQL.Transaction.Commit;
  end;
end;

procedure TFrontBase.CanCloseDay;
var
  CanClose: Boolean;
  NewDate: TDateTime;
  FUserInfo: TUserInfo;
  FUpdateSQL: TIBSQL;
begin
  FReadSQL.Close;
  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;
  try
    FReadSQL.SQL.Text :=
      'select max(op.usr$logicdate) as LDate ' +
      '  from usr$mn_options op ';
    FReadSQL.ExecQuery;
    if not FReadSQL.EOF then
    begin
      NewDate := FReadSQL.FieldByName('LDate').AsDateTime;
      FReadSQL.Close;
      FReadSQL.SQL.Text :=
        'select ' +
        'op.usr$off, op.usr$open ' +
        'from ' +
        'usr$mn_options op ' +
        'where ' +
        'op.usr$logicdate = :ldate ';
      FReadSQL.ParamByName('LDATE').AsDateTime := NewDate;
      FReadSQL.ExecQuery;
      if FReadSQL.FieldByName('usr$off').AsInteger = 1 then
      begin
        AdvTaskMessageDlg('Внимание', 'Кассовый день ' + DateToStr(NewDate) + ' уже закрыт ',
          mtInformation, [mbOK], 0);
        exit;
      end;
      CanClose := True;
    end else
    begin
      CanClose := False;
      NewDate := Date;
      AdvTaskMessageDlg('Внимание', 'Кассовый день не открыт', mtWarning, [mbOK], 0);
    end;

    if CanClose then
      if AdvTaskMessageDlg('Внимание', 'Хотите закрыть день' + DateToStr(NewDate) + '?',
        mtInformation, [mbYes, mbNo], 0) = IDYES then
      begin
        FUserInfo := CheckUserPasswordWithForm;
        if FUserInfo.CheckedUserPassword then
        begin
          if (FUserInfo.UserInGroup and Options.KassaGroupMask) <> 0 then
          begin
            FUpdateSQL := TIBSQL.Create(nil);
            FUpdateSQL.Transaction := FCheckTransaction;
            FUpdateSQL.SQL.Text :=
              ' update usr$mn_options ' +
              ' set usr$off = 1, usr$offuser = :offuser, usr$offdatetime = :offdatetime ' +
              ' where usr$logicdate = :ldate ';
            try
              if not FCheckTransaction.InTransaction then
                FCheckTransaction.StartTransaction;

              FUpdateSQL.ParamByName('ldate').AsDateTime := NewDate;
              FUpdateSQL.ParamByName('offuser').AsInteger := FUserInfo.UserKey;
              FUpdateSQL.ParamByName('offdatetime').AsDateTime := Now;
              try
                FUpdateSQL.ExecQuery;
                FCheckTransaction.Commit;
              except
                on E: Exception do
                begin
                  AdvTaskMessageDlg('Внимание', 'Ошибка при закрытии дня ' + E.Message, mtError, [mbOK], 0);
                  FCheckTransaction.Rollback;
                end;
              end;
            finally
              if FCheckTransaction.InTransaction then
                FCheckTransaction.Commit;
              FUpdateSQL.Free;
            end;
          end else
            AdvTaskMessageDlg('Внимание', 'Данный пользователь не обладает правами для закрытия дня!', mtWarning, [mbOK], 0);
        end else
          exit;
      end;
  finally
    FReadSQL.Transaction.Commit;
  end;
end;

procedure TFrontBase.CanOpenDay;
var
  CanStart: Boolean;
  NewDate: TDateTime;
  FUserInfo: TUserInfo;
  FUpdateSQL: TIBSQL;
begin
  FReadSQL.Close;
  if not FReadSQL.Transaction.InTransaction then
    FReadSQL.Transaction.StartTransaction;
  try
    FReadSQL.SQL.Text :=
      'select max(op.usr$logicdate) as LDate ' +
      '  from usr$mn_options op ';
    FReadSQL.ExecQuery;
    if not FReadSQL.EOF then
    begin
      NewDate := FReadSQL.FieldByName('LDate').AsDateTime;
      FReadSQL.Close;
      FReadSQL.SQL.Text :=
        'select ' +
        'op.usr$off, op.usr$open ' +
        'from ' +
        'usr$mn_options op ' +
        'where ' +
        'op.usr$logicdate = :ldate ';
      FReadSQL.ParamByName('LDATE').AsDateTime := NewDate;
      FReadSQL.ExecQuery;
      if (FReadSQL.FieldByName('usr$off').AsInteger = 0) and (FReadSQL.FieldByName('usr$open').AsInteger = 1) then
      begin
        AdvTaskMessageDlg('Внимание', 'Кассовый день ' + DateToStr(NewDate) + ' не закрыт!',
          mtInformation, [mbOK], 0);
        exit;
      end;
      CanStart := True;
      NewDate := NewDate + 1;
    end else
    begin
      CanStart := True;
      NewDate := Date;
    end;

    if CanStart then
      if AdvTaskMessageDlg('Внимание', 'Хотите открыть день' + DateToStr(NewDate) + '?',
        mtInformation, [mbYes, mbNo], 0) = IDYES then
      begin
        FUserInfo := CheckUserPasswordWithForm;
        if FUserInfo.CheckedUserPassword then
        begin
          if (FUserInfo.UserInGroup and Options.KassaGroupMask) <> 0 then
          begin
            FUpdateSQL := TIBSQL.Create(nil);
            FUpdateSQL.Transaction := FCheckTransaction;
            FUpdateSQL.SQL.Text :=
              ' INSERT INTO usr$mn_options(usr$logicdate, usr$open, usr$openuser, usr$opendatetime) ' +
              ' VALUES (:ldate, :open, :openuser, :opendate) ';
            try
              if not FCheckTransaction.InTransaction then
                FCheckTransaction.StartTransaction;

              FUpdateSQL.ParamByName('ldate').AsDateTime := NewDate;
              FUpdateSQL.ParamByName('open').AsInteger := 1;
              FUpdateSQL.ParamByName('openuser').AsInteger := FUserInfo.UserKey;
              FUpdateSQL.ParamByName('opendate').AsDateTime := Now;
              try
                FUpdateSQL.ExecQuery;
                FCheckTransaction.Commit;
              except
                on E: Exception do
                begin
                  AdvTaskMessageDlg('Внимание', 'Ошибка при закрытии дня ' + E.Message, mtError, [mbOK], 0);
                  FCheckTransaction.Rollback;
                end;
              end;
            finally
              if FCheckTransaction.InTransaction then
                FCheckTransaction.Commit;
              FUpdateSQL.Free;
            end;
          end else
            AdvTaskMessageDlg('Внимание', 'Данный пользователь не обладает правами для открытия дня!', mtWarning, [mbOK], 0);
        end else
          exit;
      end;
  finally
    FReadSQL.Transaction.Commit;
  end;
end;

procedure TFrontBase.InitStorage;
var
  FName: String;
begin
  try
    if not FReadSQL.Transaction.InTransaction then
      FReadSQL.Transaction.StartTransaction;

    FOptions.LastPrintOrder := -1;
    // опции Лога
    FOptions.DoLog := True;
    FOptions.LinesLimit := 0;
    FOptions.LogToFile := True;

    FReadSQL.Close;
    FReadSQL.SQL.Text :=
      'SELECT ' +
      '  Z.NAME, ' +
      '  Z.DATA_TYPE, ' +
      '  Z.STR_DATA, ' +
      '  Z.INT_DATA, ' +
      '  Z.DATETIME_DATA, ' +
      '  Z.CURR_DATA, ' +
      '  Z.BLOB_DATA ' +
      'FROM ' +
      '  GD_STORAGE_DATA Z ' +
      'WHERE  ' +
      '  Z.PARENT IN (SELECT S.ID from GD_STORAGE_DATA S ' +
      '    WHERE S.NAME = :name) AND  ' +
      '  Z.DATA_TYPE IN ( ''S'', ''I'', ''C'', ''D'', ''L'', ''B'' ) ';
    FReadSQL.Params[0].AsString := 'Restaurant';
    FReadSQL.ExecQuery;
    while not FReadSQL.Eof do
    begin
      // Пока сделано через большой IF, потом подумать
      FName := AnsiUpperCase(FReadSQL.FieldByName('NAME').AsString);
      if FName = 'OPENTIME' then
      begin
        FOptions.OpenTime := FReadSQL.FieldByName('DATETIME_DATA').AsDateTime;
      end else
      if FName = 'CLOSETIME' then
      begin
        FOptions.CloseTime := FReadSQL.FieldByName('DATETIME_DATA').AsDateTime;
      end else
      if FName = 'BASEPATH' then
      begin
        FOptions.BasePath := FReadSQL.FieldByName('STR_DATA').AsString;
      end else
      if FName = 'PRINTLOG' then
      begin
        FOptions.PrintLog := (FReadSQL.FieldByName('INT_DATA').AsInteger = 1);
      end else
      if FName = 'PLSINGLEFILE' then
      begin
        FOptions.PLSingleFile := (FReadSQL.FieldByName('INT_DATA').AsInteger = 1);
      end else
      if FName = 'PLFILEFOLDER' then
      begin
        FOptions.PLFileFolder := FReadSQL.FieldByName('STR_DATA').AsString;
      end else
      if FName = 'PRINTFISCALCHEK' then
      begin
        FOptions.PrintFiscalChek := (FReadSQL.FieldByName('INT_DATA').AsInteger = 1);
      end else
      if FName = 'ORDERCURRENTLDATE' then
      begin
        FOptions.OrderCurrentLDate := (FReadSQL.FieldByName('INT_DATA').AsInteger = 1);
      end else
      if FName = 'MAINCOMPANYID' then
      begin
        FOptions.MainCompanyID := FReadSQL.FieldByName('INT_DATA').AsInteger;
      end else
      if FName = 'CHECKLINE1' then
      begin
        FOptions.CheckLine1 := FReadSQL.FieldByName('STR_DATA').AsString;
      end else
      if FName = 'CHECKLINE2' then
      begin
        FOptions.CheckLine2 := FReadSQL.FieldByName('STR_DATA').AsString;
      end else
      if FName = 'CHECKLINE3' then
      begin
        FOptions.CheckLine3 := FReadSQL.FieldByName('STR_DATA').AsString;
      end else
      if FName = 'CHECKLINE4' then
      begin
        FOptions.CheckLine4 := FReadSQL.FieldByName('STR_DATA').AsString;
      end else
      if FName = 'CHECKLINE5' then
      begin
        FOptions.CheckLine5 := FReadSQL.FieldByName('STR_DATA').AsString;
      end else
      if FName = 'CHECKLINE6' then
      begin
        FOptions.CheckLine6 := FReadSQL.FieldByName('STR_DATA').AsString;
      end else
      if FName = 'CHECKLINE7' then
      begin
        FOptions.CheckLine7 := FReadSQL.FieldByName('STR_DATA').AsString;
      end else
      if FName = 'CHECKLINE8' then
      begin
        FOptions.CheckLine8 := FReadSQL.FieldByName('STR_DATA').AsString;
      end else
      if FName = 'SYNCTIME' then
      begin
        FOptions.SyncTime := (FReadSQL.FieldByName('INT_DATA').AsInteger = 1);
      end else
      if FName = 'TIMECOMP' then
      begin
        FOptions.TimeComp := FReadSQL.FieldByName('STR_DATA').AsString;
      end else
      if FName = 'EXTCALCCARDID' then
      begin
        FOptions.ExtCalcCardID := FReadSQL.FieldByName('INT_DATA').AsInteger;
      end else
      if FName = 'EXTDEPOTKEYS' then
      begin
        FOptions.ExtDepotKeys := FReadSQL.FieldByName('STR_DATA').AsString;
      end else
      if FName = 'NOPASSWORD' then
      begin
        FOptions.NoPassword := (FReadSQL.FieldByName('INT_DATA').AsInteger = 1);
      end else
      if FName = 'USECURRENTDATE' then
      begin
        FOptions.UseCurrentDate := (FReadSQL.FieldByName('INT_DATA').AsInteger = 1);
      end else
      if FName = 'DISCOUNTTYPE' then
      begin
        FOptions.DiscountType := FReadSQL.FieldByName('INT_DATA').AsInteger;
      end else
      if FName = 'SAVEALLORDER' then
      begin
        FOptions.SaveAllOrder := True;//(FReadSQL.FieldByName('INT_DATA').AsInteger = 1);
      end else
      if FName = 'BACKTYPE' then
      begin
        FOptions.BackType := FReadSQL.FieldByName('INT_DATA').AsInteger;
      end else
      if FName = 'PRINTCOPYCHECK' then
      begin
        FOptions.PrintCopyCheck := (FReadSQL.FieldByName('INT_DATA').AsInteger = 1);
      end;

      FReadSQL.Next;
    end;

    FReadSQL.Close;
    FReadSQL.Params[0].AsString := 'Max';    
    FReadSQL.ExecQuery;
    while not FReadSQL.Eof do
    begin
      FName := AnsiUpperCase(FReadSQL.FieldByName('NAME').AsString);
      if FName = 'MAXOPENEDORDERS' then
      begin
        FOptions.MaxOpenedOrders := FReadSQL.FieldByName('INT_DATA').AsInteger;
      end else
      if FName = 'MAXGUESTCOUNT' then
      begin
        FOptions.MaxGuestCount := FReadSQL.FieldByName('INT_DATA').AsInteger;
      end else
      if FName = 'MINGUESTCOUNT' then
      begin
        FOptions.MinGuestCount := FReadSQL.FieldByName('INT_DATA').AsInteger;
      end;

      FReadSQL.Next;
    end;

    FReadSQL.Close;
    FReadSQL.Params[0].AsString := 'Groups';
    FReadSQL.ExecQuery;
    while not FReadSQL.Eof do
    begin
      FName := AnsiUpperCase(FReadSQL.FieldByName('NAME').AsString);
      if FName = 'WAITER' then
      begin
        FOptions.WaiterGroupMask := GetGroupMask(FReadSQL.FieldByName('INT_DATA').AsInteger);
      end else
      if FName = 'MANAGER' then
      begin
        FOptions.ManagerGroupMask := GetGroupMask(FReadSQL.FieldByName('INT_DATA').AsInteger);
      end else
      if FName = 'KASSA' then
      begin
        FOptions.KassaGroupMask := GetGroupMask(FReadSQL.FieldByName('INT_DATA').AsInteger);
      end;

      FReadSQL.Next;
    end;

    FReadSQL.Transaction.Commit;
  except
    on E: Exception do
      AdvTaskMessageDlg('Внимание', 'Ошибка при загрузке настроек ' + E.Message, mtError, [mbOK], 0);
  end;
end;

function TFrontBase.GetNextOrderNum: Integer;
begin
  GetNextOrderNum := -1;
  try
    if not FReadSQL.Transaction.InTransaction then
      FReadSQL.Transaction.StartTransaction;

    FReadSQL.Close;
    FReadSQL.SQL.Text := 'SELECT gen_id(USR$MN_CHECKNUMBER, 1) id FROM rdb$database ';
    FReadSQL.ExecQuery;

    Result := FReadSQL.FieldByName('ID').AsInteger;

    FReadSQL.Transaction.Commit;
  except
    on E: Exception do
      AdvTaskMessageDlg('Внимание', 'Ошибка ' + E.Message, mtError, [mbOK], 0);
  end;
end;

function TFrontBase.CheckCountOrderByResp(const RespID: Integer): Boolean;
begin
  Result := True;

  try
    if not FReadSQL.Transaction.InTransaction then
      FReadSQL.Transaction.StartTransaction;

    FReadSQL.Close;
    FReadSQL.SQL.Text :=
      ' SELECT COUNT(*) AS countOrder ' +
      ' FROM usr$mn_order o  ' +
      ' WHERE o.usr$logicdate = :ldate ' +
      '   AND o.usr$respkey = :respkey ' +
      '   AND o.USR$TIMECLOSEORDER IS NULL ';
    FReadSQL.ParamByName('ldate').AsDateTime := GetLogicDate;
    FReadSQL.ParamByName('respkey').AsInteger := RespID;
    FReadSQL.ExecQuery;

    Result := (FReadSQL.FieldByName('countOrder').AsInteger > Options.MaxOpenedOrders - 1);

    FReadSQL.Transaction.Commit;
  except
    on E: Exception do
      AdvTaskMessageDlg('Внимание', 'Ошибка ' + E.Message, mtError, [mbOK], 0);
  end;
end;

end.
