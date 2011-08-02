unit rfFindGood_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrontData_Unit, BaseFrontForm_Unit, AdvSmoothTouchKeyBoard, ExtCtrls,
  AdvPanel, StdCtrls, Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, DB,
  kbmMemTable, AdvSmoothButton;

type
  TFindGood = class(TBaseFrontForm)
    pnlMain: TAdvPanel;
    TouchKeyBoard: TAdvSmoothTouchKeyBoard;
    lblGoodName: TLabel;
    edGoodName: TEdit;
    MemTable: TkbmMemTable;
    dsMain: TDataSource;
    DBGrLeft: TDBAdvGrid;
    btnOK: TAdvSmoothButton;
    btnCancel: TAdvSmoothButton;
    procedure MemTableFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure edGoodNameChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TouchKeyBoardKeyClick(Sender: TObject; Index: Integer);
  private
    function GetGoodKey: Integer;
  public
    property GoodKey: Integer read GetGoodKey;
  end;

var
  FindGood: TFindGood;

implementation

{$R *.dfm}

procedure TFindGood.edGoodNameChange(Sender: TObject);
begin
  MemTable.DisableControls;
  try
    MemTable.Filtered := False;
    MemTable.Filtered := True;
  finally
    MemTable.EnableControls;
  end;
end;

procedure TFindGood.FormCreate(Sender: TObject);
begin
  edGoodName.Text := '';

  MemTable.FieldDefs.Add('ID', ftInteger, 0);
  MemTable.FieldDefs.Add('NAME', ftString, 60);
  MemTable.CreateTable;
  MemTable.Open;

  SetupAdvGrid(DBGrLeft);
end;

procedure TFindGood.FormShow(Sender: TObject);
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  FFrontBase.GetAllGoodList(MemTable);
  MemTable.First;
end;

function TFindGood.GetGoodKey: Integer;
begin
  Result := -1;
  if not MemTable.IsEmpty then
    Result := MemTable.FieldByName('ID').AsInteger;
end;

procedure TFindGood.MemTableFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if Length(edGoodName.Text) > 1 then
    Accept := (AnsiPos(AnsiUpperCase(edGoodName.Text),
      AnsiUpperCase(MemTable.FieldByName('NAME').AsString)) <> 0)
  else
    Accept := False;
end;

procedure TFindGood.TouchKeyBoardKeyClick(Sender: TObject; Index: Integer);
begin
  if not edGoodName.Focused then
  begin
    edGoodName.SetFocus;
    edGoodName.SelStart := Length(edGoodName.Text);
  end;
end;

end.
