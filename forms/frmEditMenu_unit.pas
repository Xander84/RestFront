unit frmEditMenu_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EditReportForm_Unit, DB, kbmMemTable, Grids, AdvObj, BaseGrid,
  AdvGrid, DBAdvGrid, AdvSmoothButton, ExtCtrls, AdvPanel;

type
  TEditMenu = class(TEditReport)
    procedure FormShow(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure DBGrLeftDblClick(Sender: TObject);
  private
    procedure EditMenu;
  public
    { Public declarations }
  end;

var
  EditMenu: TEditMenu;

implementation

uses
  frmMenuLine_unit;

{$R *.dfm}

procedure TEditMenu.btnEditClick(Sender: TObject);
begin
  EditMenu;
end;

procedure TEditMenu.DBGrLeftDblClick(Sender: TObject);
begin
  EditMenu;
end;

procedure TEditMenu.EditMenu;
var
  FForm: TMenuLine;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');
  FForm := TMenuLine.Create(Self);
  try
    FForm.FrontBase := FFrontBase;
    FForm.Caption := FForm.Caption + ' - ' + MemTable.FieldByName('NAME').AsString;
    FForm.MenuKey := MemTable.FieldByName('ID').AsInteger;
    FForm.ShowModal;
  finally
    FForm.Free;
  end;
end;

procedure TEditMenu.FormShow(Sender: TObject);
var
  FMenuCount: Integer;
begin
  Assert(Assigned(FFrontBase), 'FrontBase not assigned');

  FFrontBase.GetMenuList(MemTable, FMenuCount);
  MemTable.First;
end;

end.
