unit rfReservListForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrontForm_Unit, FrontData_Unit, Front_DataBase_Unit, ExtCtrls,
  AdvPanel, Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, DB, kbmMemTable,
  AdvSmoothButton, ActnList;

type
  TReservList = class(TBaseFrontForm)
    pnlMain: TAdvPanel;
    MemTable: TkbmMemTable;
    dsMain: TDataSource;
    DBGrLeft: TDBAdvGrid;
    alMain: TActionList;
    btnOK: TAdvSmoothButton;
    AdvSmoothButton1: TAdvSmoothButton;
    AdvSmoothButton2: TAdvSmoothButton;
    AdvSmoothButton3: TAdvSmoothButton;
    AdvSmoothButton4: TAdvSmoothButton;
    AdvSmoothButton5: TAdvSmoothButton;
    actDeleteReserv: TAction;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actDeleteReservUpdate(Sender: TObject);
    procedure actDeleteReservExecute(Sender: TObject);
  private
    FTableKey: Integer;
  public
    property TableKey: Integer read FTableKey write FTableKey;
  end;

var
  ReservList: TReservList;

implementation

uses
  rfReservForm_Unit;

{$R *.dfm}

procedure TReservList.actDeleteReservExecute(Sender: TObject);
begin
  FFrontBase.DeleteReservation(MemTable.FieldByName('ID').AsInteger);
  FrontBase.GetReservListByTable(FTableKey, MemTable);
  MemTable.First;
end;

procedure TReservList.actDeleteReservUpdate(Sender: TObject);
begin
  actDeleteReserv.Enabled := (not MemTable.IsEmpty) and
    (MemTable.FieldByName('USR$AVANSSUM').AsCurrency = 0);
end;

procedure TReservList.btnOKClick(Sender: TObject);
var
  FReservForm: TReservForm;
begin
  FReservForm := TReservForm.Create(nil);
  try
    FReservForm.FrontBase := FrontBase;
    FReservForm.TableKey := FTableKey;
    FReservForm.ShowModal;
    if FReservForm.ModalResult = mrOk then
    begin
      FrontBase.GetReservListByTable(FTableKey, MemTable);
      MemTable.First;
    end;
  finally
    FReservForm.Free;
  end;
end;

procedure TReservList.FormCreate(Sender: TObject);
begin
  MemTable.FieldDefs.Add('ID', ftInteger, 0);
  MemTable.FieldDefs.Add('NAME', ftString, 120);
  MemTable.FieldDefs.Add('USR$RESERVTIME', ftTime, 0);
  MemTable.FieldDefs.Add('USR$RESERVDATE', ftDate, 0);
  MemTable.FieldDefs.Add('USR$DOCUMENTDATE', ftDate, 0);
  MemTable.FieldDefs.Add('USR$DOCUMENTNUMBER', ftString, 120);
  MemTable.FieldDefs.Add('USR$AVANSSUM', ftInteger, 0);
  MemTable.CreateTable;
  MemTable.Open;

  SetupAdvGrid(DBGrLeft);
end;

procedure TReservList.FormShow(Sender: TObject);
begin
  Assert(Assigned(FrontBase), 'FrontBase not assigned');

  FrontBase.GetReservListByTable(FTableKey, MemTable);
  MemTable.First;
end;

end.
