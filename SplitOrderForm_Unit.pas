unit SplitOrderForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Front_DataBase_Unit, DB, GridsEh, DBGridEh, kbmMemTable,
  StdCtrls, FrontData_Unit, AdvPanel, AdvSmoothButton;


type
  TSplitOrder = class(TForm)
    pnlLeft: TAdvPanel;
    pnlRight: TAdvPanel;
    pnlBottom: TAdvPanel;
    DBGrLeft: TDBGridEh;
    DBGrRight: TDBGridEh;
    pnlLeftTop: TAdvPanel;
    pnlRightTop: TAdvPanel;
    dsLeft: TDataSource;
    dsRight: TDataSource;
    pnlCenter: TAdvPanel;
    btnRight: TAdvSmoothButton;
    btnAllRight: TAdvSmoothButton;
    btnLeft: TAdvSmoothButton;
    btnAllLeft: TAdvSmoothButton;
    btnOK: TAdvSmoothButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrRightDblClick(Sender: TObject);
    procedure DBGrLeftDblClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnRightClick(Sender: TObject);
    procedure btnLeftClick(Sender: TObject);
    procedure btnAllRightClick(Sender: TObject);
    procedure btnAllLeftClick(Sender: TObject);
  private
    FFrontBase: TFrontBase;
    FLeftDoc: TkbmMemTable;
    FLeftDocLine: TkbmMemTable;
    FRightDoc: TkbmMemTable;
    FRightDocLine: TkbmMemTable;
    FLeftModificationDataSet: TkbmMemTable;
    FRightModificationDataSet: TkbmMemTable;
    FLeftMasterDataSource: TDataSource;
    FRightMasterDataSource: TDataSource;

    FOrderKey: Integer;
    FMainOrderKey: Integer;
    FManagerKey: Integer;
    procedure SetFrontBase(const Value: TFrontBase);
    procedure CopyDS(const SourceDS, DestDS: TkbmMemTable; Parent: Integer; All: Boolean = False);
    procedure OnBeforePostLeftLine(DataSet: TDataSet);
    procedure OnBeforePostRightLine(DataSet: TDataSet);
    procedure RefreshDataSets;
  public
    property MainOrderKey: Integer read FMainOrderKey write FMainOrderKey;
    property OrderKey: Integer read FOrderKey write FOrderKey;
    property FrontBase: TFrontBase write SetFrontBase;
    property ManagerKey: Integer read FManagerKey write FManagerKey;
  end;

var
  SplitOrder: TSplitOrder;

implementation

uses
  DevideForm_Unit;

{$R *.dfm}

procedure TSplitOrder.CopyDS(const SourceDS, DestDS: TkbmMemTable;
  Parent: Integer; All: Boolean);
var
  I: Integer;
  Form: TDevideForm;
  Quantity: Currency;
begin
  if not SourceDS.IsEmpty then
  begin
    FFrontBase.SaveOrderLog(FFrontBase.ContactKey, ManagerKey,
      SourceDS.FieldByName('ID').AsInteger, SourceDS.FieldByName('ID').AsInteger, 2);

    if (SourceDS.FieldByName('usr$quantity').AsCurrency > 1) and (not All) then
    begin
      Form := TDevideForm.Create(nil);
      try
        Form.ShowModal;
        if Form.ModalResult = mrOK then
        begin
{ TODO : проверять на дробность товара }
          Quantity := StrToCurr(Form.Number);
          if (Quantity > 0) and (SourceDS.FieldByName('usr$quantity').AsCurrency >= Quantity) then
          begin
            SourceDS.Edit;
            SourceDS.FieldByName('usr$quantity').AsCurrency :=
              SourceDS.FieldByName('usr$quantity').AsCurrency - Quantity;
            SourceDS.Post;

            //должны создать запись.
            DestDS.Append;
            for I := 0 to DestDS.FieldCount - 1 do
            begin
            if SourceDS.Fields[I].IsNull then
              DestDS.Fields[I].Value := SourceDS.Fields[I].Value
            else
              DestDS.Fields[I].AsString := SourceDS.Fields[I].AsString;
            end;
            DestDS.FieldByName('ID').AsInteger := FFrontBase.GetNextID;
            DestDS.FieldByName('usr$quantity').AsCurrency := Quantity;
            DestDS.FieldByName('PARENT').AsInteger := Parent;
            DestDS.FieldByName('STATEFIELD').AsInteger := 1;
            DestDS.Post;

            if SourceDS = FLeftDocLine then
            begin
              FLeftModificationDataSet.First;
              while not FLeftModificationDataSet.Eof do
              begin
                FRightModificationDataSet.Append;
                FRightModificationDataSet.FieldByName('MODIFYKEY').AsInteger :=
                  FLeftModificationDataSet.FieldByName('MODIFYKEY').AsInteger;
                FRightModificationDataSet.Post;

                FLeftModificationDataSet.Next;
              end;
            end else
            begin
              FRightModificationDataSet.First;
              while not FRightModificationDataSet.Eof do
              begin
                FLeftModificationDataSet.Append;
                FLeftModificationDataSet.FieldByName('MODIFYKEY').AsInteger :=
                  FRightModificationDataSet.FieldByName('MODIFYKEY').AsInteger;
                FLeftModificationDataSet.Post;

                FRightModificationDataSet.Next;
              end;
            end;
          end;
        end;
      finally
        Form.Free;
      end;
    end else
    begin
      DestDS.Append;
      for I := 0 to DestDS.FieldCount - 1 do
      begin
        if SourceDS.Fields[I].IsNull then
          DestDS.Fields[I].Value := SourceDS.Fields[I].Value
        else
          DestDS.Fields[I].AsString := SourceDS.Fields[I].AsString;
      end;
      DestDS.FieldByName('PARENT').AsInteger := Parent;
      DestDS.FieldByName('STATEFIELD').AsInteger := 3;
      DestDS.Post;

      if SourceDS = FLeftDocLine then
      begin
        FLeftModificationDataSet.First;
        while not FLeftModificationDataSet.Eof do
        begin
          FRightModificationDataSet.Append;
          FRightModificationDataSet.FieldByName('MODIFYKEY').AsInteger :=
            FLeftModificationDataSet.FieldByName('MODIFYKEY').AsInteger;
          FRightModificationDataSet.Post;

          FLeftModificationDataSet.Next;
        end;
      end else
      begin
        FRightModificationDataSet.First;
        while not FRightModificationDataSet.Eof do
        begin
          FLeftModificationDataSet.Append;
          FLeftModificationDataSet.FieldByName('MODIFYKEY').AsInteger :=
            FRightModificationDataSet.FieldByName('MODIFYKEY').AsInteger;
          FLeftModificationDataSet.Post;

          FRightModificationDataSet.Next;
        end;
      end;

      SourceDS.Delete;
    end;  
  end;
end;

procedure TSplitOrder.FormCreate(Sender: TObject);
begin
  //шапка и позиция
   { TODO : Может надо переделать создание датасетов? }
  FLeftDoc := TkbmMemTable.Create(nil);
  FLeftDoc.FieldDefs.Add('ID', ftInteger, 0);
  FLeftDoc.FieldDefs.Add('NUMBER', ftString, 20);
  FLeftDoc.FieldDefs.Add('SUMNCU', ftCurrency, 0);
  FLeftDoc.FieldDefs.Add('usr$mn_printdate', ftDateTime, 0);
  FLeftDoc.FieldDefs.Add('usr$sumncuwithdiscount', ftCurrency, 0);
  FLeftDoc.FieldDefs.Add('usr$respkey', ftInteger, 0);
  FLeftDoc.FieldDefs.Add('usr$guestcount', ftInteger, 0);
  FLeftDoc.FieldDefs.Add('usr$pay', ftInteger, 0);
  FLeftDoc.FieldDefs.Add('usr$timeorder', ftTime, 0);
  FLeftDoc.FieldDefs.Add('usr$timecloseorder', ftTime, 0);
  FLeftDoc.FieldDefs.Add('usr$logicdate', ftDate, 0);
  FLeftDoc.FieldDefs.Add('usr$discountncu', ftCurrency, 0);
  FLeftDoc.FieldDefs.Add('usr$sysnum', ftInteger, 0);
  FLeftDoc.FieldDefs.Add('usr$register', ftString, 8);
  FLeftDoc.FieldDefs.Add('usr$whopayoffkey', ftInteger, 0);
  FLeftDoc.FieldDefs.Add('usr$vip', ftInteger, 0);
  FLeftDoc.FieldDefs.Add('usr$disccardkey', ftInteger, 0);
  FLeftDoc.FieldDefs.Add('usr$userdisckey', ftInteger, 0);
  FLeftDoc.FieldDefs.Add('usr$discountkey', ftInteger, 0);
  FLeftDoc.FieldDefs.Add('usr$bonussum', ftCurrency, 0);
  FLeftDoc.FieldDefs.Add('editorkey', ftInteger, 0);
  FLeftDoc.FieldDefs.Add('editiondate', ftTimeStamp, 0);
  FLeftDoc.CreateTable;
  FLeftDoc.Open;

  FLeftDocLine := TkbmMemTable.Create(nil);
  FLeftDocLine.FieldDefs.Add('ID', ftInteger, 0);
  FLeftDocLine.FieldDefs.Add('number', ftString, 20);
  FLeftDocLine.FieldDefs.Add('usr$mn_printdate', ftDateTime, 0);
  FLeftDocLine.FieldDefs.Add('GOODNAME', ftString, 40);
  FLeftDocLine.FieldDefs.Add('usr$quantity', ftCurrency, 0);
  FLeftDocLine.FieldDefs.Add('usr$costncu', ftCurrency, 0);
  FLeftDocLine.FieldDefs.Add('usr$goodkey', ftInteger, 0);
  FLeftDocLine.FieldDefs.Add('usr$sumncuwithdiscount', ftCurrency, 0);
  FLeftDocLine.FieldDefs.Add('usr$sumncu', ftCurrency, 0);
  FLeftDocLine.FieldDefs.Add('usr$costncuwithdiscount', ftCurrency, 0);
  FLeftDocLine.FieldDefs.Add('usr$sumdiscount', ftCurrency, 0);
  FLeftDocLine.FieldDefs.Add('usr$persdiscount', ftCurrency, 0);
  FLeftDocLine.FieldDefs.Add('usr$causedeletekey', ftInteger, 0);
  FLeftDocLine.FieldDefs.Add('usr$deleteamount', ftCurrency, 0);
  FLeftDocLine.FieldDefs.Add('usr$doublebonus', ftInteger, 0);
  FLeftDocLine.FieldDefs.Add('editorkey', ftInteger, 0);
  FLeftDocLine.FieldDefs.Add('editiondate', ftTimeStamp, 0);
  FLeftDocLine.FieldDefs.Add('oldquantity', ftCurrency, 0);
  FLeftDocLine.FieldDefs.Add('LINEKEY', ftInteger, 0);
  FLeftDocLine.FieldDefs.Add('STATEFIELD', ftInteger, 0);
  FLeftDocLine.FieldDefs.Add('MODIFYSTRING', ftString, 1024);
  FLeftDocLine.FieldDefs.Add('PARENT', ftInteger, 0);
  FLeftDocLine.CreateTable;
  FLeftDocLine.BeforePost := OnBeforePostLeftLine;
//  FLeftDocLine.Filter := '([usr$quantity] > 0) AND ([usr$causedeletekey] IS NULL) ';
//  FLeftDocLine.Filtered := True;
  FLeftDocLine.Open;

  FLeftMasterDataSource := TDataSource.Create(nil);
  FLeftMasterDataSource.DataSet := FLeftDocLine;

  FLeftModificationDataSet := TkbmMemTable.Create(nil);
  FLeftModificationDataSet.FieldDefs.Add('MASTERKEY', ftInteger, 0);
  FLeftModificationDataSet.FieldDefs.Add('MODIFYKEY', ftInteger, 0);
  FLeftModificationDataSet.FieldDefs.Add('NAME', ftString, 40);
  FLeftModificationDataSet.CreateTable;
  FLeftModificationDataSet.MasterSource := FLeftMasterDataSource;
  FLeftModificationDataSet.MasterFields := 'LINEKEY';
  FLeftModificationDataSet.DetailFields := 'MASTERKEY';
  FLeftModificationDataSet.Open;


  //2.

  FRightDoc := TkbmMemTable.Create(nil);
  FRightDoc.FieldDefs.Add('ID', ftInteger, 0);
  FRightDoc.FieldDefs.Add('NUMBER', ftString, 20);
  FRightDoc.FieldDefs.Add('SUMNCU', ftCurrency, 0);
  FRightDoc.FieldDefs.Add('usr$mn_printdate', ftDateTime, 0);
  FRightDoc.FieldDefs.Add('usr$sumncuwithdiscount', ftCurrency, 0);
  FRightDoc.FieldDefs.Add('usr$respkey', ftInteger, 0);
  FRightDoc.FieldDefs.Add('usr$guestcount', ftInteger, 0);
  FRightDoc.FieldDefs.Add('usr$pay', ftInteger, 0);
  FRightDoc.FieldDefs.Add('usr$timeorder', ftTime, 0);
  FRightDoc.FieldDefs.Add('usr$timecloseorder', ftTime, 0);
  FRightDoc.FieldDefs.Add('usr$logicdate', ftDate, 0);
  FRightDoc.FieldDefs.Add('usr$discountncu', ftCurrency, 0);
  FRightDoc.FieldDefs.Add('usr$sysnum', ftInteger, 0);
  FRightDoc.FieldDefs.Add('usr$register', ftString, 8);
  FRightDoc.FieldDefs.Add('usr$whopayoffkey', ftInteger, 0);
  FRightDoc.FieldDefs.Add('usr$vip', ftInteger, 0);
  FRightDoc.FieldDefs.Add('usr$disccardkey', ftInteger, 0);
  FRightDoc.FieldDefs.Add('usr$userdisckey', ftInteger, 0);
  FRightDoc.FieldDefs.Add('usr$discountkey', ftInteger, 0);
  FRightDoc.FieldDefs.Add('usr$bonussum', ftCurrency, 0);
  FRightDoc.FieldDefs.Add('editorkey', ftInteger, 0);
  FRightDoc.FieldDefs.Add('editiondate', ftTimeStamp, 0);
  FRightDoc.CreateTable;
  FRightDoc.Open;

  FRightDocLine := TkbmMemTable.Create(nil);
  FRightDocLine.FieldDefs.Add('ID', ftInteger, 0);
  FRightDocLine.FieldDefs.Add('number', ftString, 20);
  FRightDocLine.FieldDefs.Add('usr$mn_printdate', ftDateTime, 0);
  FRightDocLine.FieldDefs.Add('GOODNAME', ftString, 40);
  FRightDocLine.FieldDefs.Add('usr$quantity', ftCurrency, 0);
  FRightDocLine.FieldDefs.Add('usr$costncu', ftCurrency, 0);
  FRightDocLine.FieldDefs.Add('usr$goodkey', ftInteger, 0);
  FRightDocLine.FieldDefs.Add('usr$sumncuwithdiscount', ftCurrency, 0);
  FRightDocLine.FieldDefs.Add('usr$sumncu', ftCurrency, 0);
  FRightDocLine.FieldDefs.Add('usr$costncuwithdiscount', ftCurrency, 0);
  FRightDocLine.FieldDefs.Add('usr$sumdiscount', ftCurrency, 0);
  FRightDocLine.FieldDefs.Add('usr$persdiscount', ftCurrency, 0);
  FRightDocLine.FieldDefs.Add('usr$causedeletekey', ftInteger, 0);
  FRightDocLine.FieldDefs.Add('usr$deleteamount', ftCurrency, 0);
  FRightDocLine.FieldDefs.Add('usr$doublebonus', ftInteger, 0);
  FRightDocLine.FieldDefs.Add('editorkey', ftInteger, 0);
  FRightDocLine.FieldDefs.Add('editiondate', ftTimeStamp, 0);
  FRightDocLine.FieldDefs.Add('oldquantity', ftCurrency, 0);
  FRightDocLine.FieldDefs.Add('LINEKEY', ftInteger, 0);
  FRightDocLine.FieldDefs.Add('STATEFIELD', ftInteger, 0);
  FRightDocLine.FieldDefs.Add('MODIFYSTRING', ftString, 1024);
  FRightDocLine.FieldDefs.Add('PARENT', ftInteger, 0);
  FRightDocLine.CreateTable;
  FRightDocLine.BeforePost := OnBeforePostRightLine;
//  FRightDocLine.Filter := '([usr$quantity] > 0) AND ([usr$causedeletekey] IS NULL) ';
//  FRightDocLine.Filtered := True;
  FRightDocLine.Open;

  FRightMasterDataSource := TDataSource.Create(nil);
  FRightMasterDataSource.DataSet := FRightDocLine;

  FRightModificationDataSet := TkbmMemTable.Create(nil);
  FRightModificationDataSet.FieldDefs.Add('MASTERKEY', ftInteger, 0);
  FRightModificationDataSet.FieldDefs.Add('MODIFYKEY', ftInteger, 0);
  FRightModificationDataSet.FieldDefs.Add('NAME', ftString, 40);
  FRightModificationDataSet.CreateTable;
  FRightModificationDataSet.MasterSource := FRightMasterDataSource;
  FRightModificationDataSet.MasterFields := 'LINEKEY';
  FRightModificationDataSet.DetailFields := 'MASTERKEY';
  FRightModificationDataSet.Open;

  dsLeft.DataSet := FLeftDocLine;
  dsRight.DataSet := FRightDocLine;

  pnlLeft.Width := (Width div 2) - 50;
  pnlRight.Width := (Width div 2) - 50;

  btnLeft.Picture := FrontData.RestPictureContainer.FindPicture('Left');
  btnAllLeft.Picture := FrontData.RestPictureContainer.FindPicture('AllLeft');
  btnRight.Picture := FrontData.RestPictureContainer.FindPicture('Right');
  btnAllRight.Picture := FrontData.RestPictureContainer.FindPicture('AllRight');

  with DBGrLeft do
  begin
    Font.Size := cn_FontSize;
    TitleFont.Size := cn_TitleFontSize;
    OddRowColor := cn_OddRowColor;
    EvenRowColor := cn_EvenRowColor;
  end;

  with DBGrRight do
  begin
    Font.Size := cn_FontSize;
    TitleFont.Size := cn_TitleFontSize;
    OddRowColor := cn_OddRowColor;
    EvenRowColor := cn_EvenRowColor;
  end;
end;

procedure TSplitOrder.FormDestroy(Sender: TObject);
begin
  FLeftDoc.Free;
  FLeftDocLine.Free;
  FRightDoc.Free;
  FRightDocLine.Free;
  FLeftModificationDataSet.Free;
  FLeftMasterDataSource.Free;
  FRightModificationDataSet.Free;
  FRightMasterDataSource.Free;
end;

procedure TSplitOrder.FormShow(Sender: TObject);
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned!');

  FFrontBase.GetOrder(FLeftDoc, FLeftDocLine, FLeftModificationDataSet, MainOrderKey);
  FFrontBase.GetOrder(FRightDoc, FRightDocLine, FRightModificationDataSet, OrderKey);
end;

procedure TSplitOrder.SetFrontBase(const Value: TFrontBase);
begin
  FFrontBase := Value;
end;

procedure TSplitOrder.DBGrRightDblClick(Sender: TObject);
begin
  CopyDS(FRightDocLine, FLeftDocLine, FMainOrderKey);
  RefreshDataSets;
end;

procedure TSplitOrder.DBGrLeftDblClick(Sender: TObject);
begin
  CopyDS(FLeftDocLine, FRightDocLine, FOrderKey);
  RefreshDataSets;
end;

procedure TSplitOrder.btnOKClick(Sender: TObject);
{var
  OrderKey: Integer;  }
begin
//  FFrontBase.CreateNewOrder(FLeftDoc, FLeftDocLine, FLeftModificationDataSet, OrderKey);
//  FFrontBase.CreateNewOrder(FRightDoc, FRightDocLine, FRightModificationDataSet, OrderKey);
  ModalResult := mrOK;
end;

procedure TSplitOrder.btnRightClick(Sender: TObject);
begin
  CopyDS(FLeftDocLine, FRightDocLine, FOrderKey);
  RefreshDataSets;
end;

procedure TSplitOrder.btnLeftClick(Sender: TObject);
begin
  CopyDS(FRightDocLine, FLeftDocLine, FMainOrderKey);
  RefreshDataSets;
end;

procedure TSplitOrder.btnAllRightClick(Sender: TObject);
begin
  FLeftDocLine.First;
  while not FLeftDocLine.Eof do
  begin
    CopyDS(FLeftDocLine, FRightDocLine, FOrderKey, True);
//    FLeftDocLine.Next;
  end;
  RefreshDataSets;
end;

procedure TSplitOrder.btnAllLeftClick(Sender: TObject);
begin
  FRightDocLine.First;
  while not FRightDocLine.Eof do
  begin
      CopyDS(FRightDocLine, FLeftDocLine, FMainOrderKey, True);
//    FLeftDocLine.Next;
  end;
  RefreshDataSets;
end;


procedure TSplitOrder.OnBeforePostLeftLine(DataSet: TDataSet);
begin
  //1. Проверяем на скидку
  if FLeftDoc.FieldByName('USR$DISCOUNTKEY').AsInteger > 0 then
    DataSet.FieldByName('USR$PERSDISCOUNT').AsCurrency :=
      FFrontBase.GetDiscount(FLeftDoc.FieldByName('USR$DISCOUNTKEY').AsInteger,
        DataSet.FieldByName('usr$goodkey').AsInteger,
        FLeftDoc.FieldByName('usr$logicdate').AsDateTime,
        DataSet.FieldByName('usr$persdiscount').AsCurrency)
  else
    DataSet.FieldByName('USR$PERSDISCOUNT').AsCurrency := 0;

{ TODO : Двойной бонус? }
  if DataSet.FieldByName('STATEFIELD').AsInteger = 0 then
    DataSet.FieldByName('STATEFIELD').AsInteger := 2; //обновление

  DataSet.FieldByName('USR$SUMNCU').AsCurrency :=
    DataSet.FieldBYName('USR$COSTNCU').AsCurrency *
    DataSet.FieldBYName('USR$QUANTITY').AsCurrency;

  DataSet.FieldByName('USR$SUMNCUWITHDISCOUNT').AsCurrency :=
    FFrontBase.RoundCost(DataSet.FieldByName('USR$SUMNCU').AsCurrency *
    (1 - DataSet.FieldBYName('USR$PERSDISCOUNT').AsCurrency /100.00));

  if DataSet.FieldBYName('USR$QUANTITY').AsCurrency <> 0 then
    DataSet.FieldBYName('USR$COSTNCUWITHDISCOUNT').AsCurrency :=
      DataSet.FieldByName('USR$SUMNCUWITHDISCOUNT').AsCurrency /
      DataSet.FieldBYName('USR$QUANTITY').AsCurrency
  else
    DataSet.FieldBYName('USR$COSTNCUWITHDISCOUNT').AsCurrency :=
      DataSet.FieldBYName('USR$COSTNCU').AsCurrency;

  DataSet.FieldByName('USR$SUMDISCOUNT').AsCurrency :=
    DataSet.FieldByName('USR$SUMNCU').AsCurrency -
    DataSet.FieldByName('USR$SUMNCUWITHDISCOUNT').AsCurrency;
end;

procedure TSplitOrder.OnBeforePostRightLine(DataSet: TDataSet);
begin
  //1. Проверяем на скидку
  if FRightDoc.FieldByName('USR$DISCOUNTKEY').AsInteger > 0 then
    DataSet.FieldByName('USR$PERSDISCOUNT').AsCurrency :=
      FFrontBase.GetDiscount(FRightDoc.FieldByName('USR$DISCOUNTKEY').AsInteger,
        DataSet.FieldByName('usr$goodkey').AsInteger,
        FRightDoc.FieldByName('usr$logicdate').AsDateTime,
        DataSet.FieldByName('usr$persdiscount').AsCurrency)
  else
    DataSet.FieldByName('USR$PERSDISCOUNT').AsCurrency := 0;

{ TODO : Двойной бонус? }
  if DataSet.FieldByName('STATEFIELD').AsInteger = 0 then
    DataSet.FieldByName('STATEFIELD').AsInteger := 2; //обновление

  DataSet.FieldByName('USR$SUMNCU').AsCurrency :=
    DataSet.FieldBYName('USR$COSTNCU').AsCurrency *
    DataSet.FieldBYName('USR$QUANTITY').AsCurrency;

  DataSet.FieldByName('USR$SUMNCUWITHDISCOUNT').AsCurrency :=
    FFrontBase.RoundCost(DataSet.FieldByName('USR$SUMNCU').AsCurrency *
    (1 - DataSet.FieldBYName('USR$PERSDISCOUNT').AsCurrency /100.00));

  if DataSet.FieldBYName('USR$QUANTITY').AsCurrency <> 0 then
    DataSet.FieldBYName('USR$COSTNCUWITHDISCOUNT').AsCurrency :=
      DataSet.FieldByName('USR$SUMNCUWITHDISCOUNT').AsCurrency /
      DataSet.FieldBYName('USR$QUANTITY').AsCurrency
  else
    DataSet.FieldBYName('USR$COSTNCUWITHDISCOUNT').AsCurrency :=
      DataSet.FieldBYName('USR$COSTNCU').AsCurrency;

  DataSet.FieldByName('USR$SUMDISCOUNT').AsCurrency :=
    DataSet.FieldByName('USR$SUMNCU').AsCurrency -
    DataSet.FieldByName('USR$SUMNCUWITHDISCOUNT').AsCurrency;
end;

procedure TSplitOrder.RefreshDataSets;
var
  FOrderKey: Integer;
  FMainOrderKey: Integer;
begin
  FFrontBase.CreateNewOrder(FLeftDoc, FLeftDocLine, FLeftModificationDataSet, FMainOrderKey);
  FFrontBase.CreateNewOrder(FRightDoc, FRightDocLine, FRightModificationDataSet, FOrderKey);
  FFrontBase.GetOrder(FLeftDoc, FLeftDocLine, FLeftModificationDataSet, FMainOrderKey);
  FFrontBase.GetOrder(FRightDoc, FRightDocLine, FRightModificationDataSet, FOrderKey);
end;

end.
