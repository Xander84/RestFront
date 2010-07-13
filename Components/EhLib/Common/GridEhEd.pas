{*******************************************************}
{                                                       }
{                       EhLib 4.5                       }
{              Design window for TDBGridEh              }
{                     (Build 4.5.02)                    }
{   Copyright (c) 1998-2004 by Dmitry V. Bolshakov      }
{                                                       }
{*******************************************************}


unit GridEhEd {$IFDEF CIL} platform{$ENDIF};

{$I EhLib.Inc}
interface

uses
  Windows, Messages, SysUtils,
{$IFDEF CIL} Borland.Vcl.Design.DesignIntf,
             Borland.Vcl.Design.DesignEditors,
             Borland.Vcl.Design.ColnEdit,
             Variants,
{$ELSE}
  ColnEdit,
  {$IFDEF EH_LIB_6}Variants, DesignEditors, DesignIntf,
  {$ELSE}DsgnWnds, DsgnIntf, LibIntf, {$ENDIF}
{$ENDIF}
  Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ActnList, ExtCtrls, ComCtrls,
  DBGridEh, {DBGrids,} DBLookupEh,
{$IFDEF CIL}
  EhLibVCLNET,
{$ELSE}
  EhLibVCL,
{$ENDIF}
//  ColectEditorEh,
  ToolWin, ToolCtrlsEh, GridsEh,
  Classes;

type
  TDBGridEhColumnsEditor = class(TCollectionEditor)
//  TDBGridEhColumnsEditor = class(TCollectionEditorEh)
    N1: TMenuItem;
    AddAllFields1: TMenuItem;
    RestoreDefaults1: TMenuItem;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    AddAllFieldsCmd: TAction;
    RestoreDefaultsCmd: TAction;
    procedure AddAllFieldsCmdExecute(Sender: TObject);
    procedure RestoreDefaultsCmdExecute(Sender: TObject);
    procedure AddAllFieldsCmdUpdate(Sender: TObject);
    procedure RestoreDefaultsCmdUpdate(Sender: TObject);
  private
    { Private declarations }
  protected
    function CanAdd(Index: Integer): Boolean; override;
  public
    { Public declarations }
  end;

{ TDBGridEhColumnsProperty }

  TDBGridEhColumnsProperty = class(TPropertyEditor {TClassProperty})
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure Edit; override;
  end;

{ TDBGridEhEditor }

  TDBGridEhEditor = class(TComponentEditor)
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

{ TDBGridEhFieldProperty }

  TDBGridEhFieldProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValueList(List: TStrings); virtual;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

{ TDBGridEhFieldProperty }

  TDBGridEhFieldAggProperty = class(TDBGridEhFieldProperty)
  public
    procedure GetValueList(List: TStrings); override;
  end;

{ TDBLookupComboboxEhEditor }

  TDBLookupComboboxEhEditor = class(TComponentEditor)
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;


{ TDesignControlerEh }

  TDBGridEhDesignControler = class(TDesignControlerEh, IDesignNotification)
  private
    FGridList: TList;
  protected
   { IDesignNotification }
   {$IFDEF EH_LIB_6}
    procedure ItemDeleted(const ADesigner: IDesigner; AItem: TPersistent);
    procedure ItemInserted(const ADesigner: IDesigner; AItem: TPersistent);
    procedure ItemsModified(const ADesigner: IDesigner);
    procedure SelectionChanged(const ADesigner: IDesigner; const ASelection: IDesignerSelections);
    procedure DesignerOpened(const ADesigner: IDesigner; AResurrecting: Boolean);
    procedure DesignerClosed(const ADesigner: IDesigner; AGoingDormant: Boolean);
    {$ELSE}
    procedure ItemDeleted(const AItem: IPersistent);
    procedure ItemInserted(const AItem: IPersistent);
    procedure ItemsModified(const ADesigner: IUnknown);
    procedure SelectionChanged(const ASelection: IDesignerSelections);
    procedure DesignerInitialized(const ADesigner: IUnknown);
    procedure DesignerClosed(const ADesigner: IUnknown);
    {$ENDIF}
  public
    constructor Create;
    destructor Destroy; override;
    function IsDesignHitTest(Control: TPersistent; X, Y: Integer; AShift: TShiftState): Boolean; override;
    function ControlIsObjInspSelected(Control: TPersistent): Boolean; override;
    function GetObjInspSelectedControl(BaseControl: TPersistent): TPersistent; override;
    procedure DesignMouseDown(Control: TPersistent; X, Y: Integer; AShift: TShiftState); override;
    procedure RegisterChangeSelectedNotification(Control: TPersistent); override;
    procedure UnregisterChangeSelectedNotification(Control: TPersistent); override;
  end;

var
  DBGridEhColumnsEditor: TDBGridEhColumnsEditor;

implementation

{$R *.dfm}

{ TDBGridEhColumnsProperty }

procedure TDBGridEhColumnsProperty.Edit;
var
  Obj: TPersistent;
begin
  Obj := GetComponent(0);
  while (Obj <> nil) and not (Obj is TComponent) do
    Obj := GetUltimateOwner(Obj);
  ShowCollectionEditorClass(Designer, TDBGridEhColumnsEditor, TComponent(Obj),
//    TCustomDBGridEh(Obj).Columns, 'Columns', [coAdd, coDelete, coMove]);
{$IFDEF CIL}
    TCollection(GetObjValue),
{$ELSE}
    TCollection(GetOrdValue),
{$ENDIF}
     'Columns', [coAdd, coDelete, coMove]);
end;

function TDBGridEhColumnsProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paReadOnly {, paSubProperties}];
end;

function TDBGridEhColumnsProperty.GetValue: string;
begin
{$IFDEF CIL}
  FmtStr(Result, '(%s)', [GetPropType.Name]);
{$ELSE}
  FmtStr(Result, '(%s)', [GetPropType^.Name]);
{$ENDIF}
end;

{ TDBGridEhEditor }

procedure TDBGridEhEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0:
      ShowCollectionEditorClass(Designer, TDBGridEhColumnsEditor, Component,
        TCustomDBGridEh(Component).Columns, 'Columns', [coAdd, coDelete, coMove]);
  end;
end;

function TDBGridEhEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'Columns Editor ...';
  end;
end;

function TDBGridEhEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;


{ TCustomDBGridEhCracker }

type
  TCustomDBGridEhCracker = class(TCustomDBGridEh)
  public
    procedure BeginLayout;
    procedure EndLayout;
  end;

procedure TCustomDBGridEhCracker.BeginLayout;
begin
  inherited BeginLayout;
end;

procedure TCustomDBGridEhCracker.EndLayout;
begin
  inherited EndLayout;
end;

type
  TCollectionCracker = class(TCollection);
{ TDBGridEhColumnsEditor }

procedure TDBGridEhColumnsEditor.AddAllFieldsCmdExecute(Sender: TObject);
var msgValue: Word;
//    i:Integer;
//    Col:TColumnEh;
  DBGridEh: TCustomDBGridEh;
begin
{$IFDEF CIL}
  DBGridEh := TCustomDBGridEh(Collection.Owner);
{$ELSE}
  DBGridEh := TCustomDBGridEh(TCollectionCracker(Collection).GetOwner);
{$ENDIF}
  if not Assigned(DBGridEh) then Exit;
  if (DBGridEh.Columns.State = csDefault) then
    DBGridEh.Columns.State := csCustomized
  else
  begin
{$IFDEF CIL}
    DBGridEh.Columns.BeginUpdate;
{$ELSE}
    TCustomDBGridEhCracker(DBGridEh).BeginLayout;
{$ENDIF}
    try
      if (DBGridEh.Columns.Count > 0) then
      begin
        msgValue := MessageDlg('Delete existing columns?',
          mtConfirmation, [mbYes, mbNo, mbCancel], 0);
        case msgValue of
          mrYes: DBGridEh.Columns.Clear;
          mrCancel: Exit;
        end;
      end;
     {for i := 0 to DBGridEh.DataSource.DataSet.FieldCount - 1 do
     begin
       Col := DBGridEh.Columns.Add;
       Col.FieldName := DBGridEh.DataSource.DataSet.Fields[i].FieldName;
     end;}
      DBGridEh.Columns.AddAllColumns(False);
    finally
{$IFDEF CIL}
      DBGridEh.Columns.EndUpdate;
{$ELSE}
      TCustomDBGridEhCracker(DBGridEh).EndLayout;
{$ENDIF}
      UpdateListbox;
    end;
  end;
  Designer.Modified;
end;

procedure TDBGridEhColumnsEditor.RestoreDefaultsCmdExecute(Sender: TObject);
var i: Integer;
  DBGridEh: TCustomDBGridEh;
begin
{$IFDEF CIL}
  DBGridEh := TCustomDBGridEh(Collection.Owner);
{$ELSE}
  DBGridEh := TCustomDBGridEh(TCollectionCracker(Collection).GetOwner);
{$ENDIF}
  if not Assigned(DBGridEh) then Exit;
  if (ListView1.SelCount > 0) then
  begin
    for i := 0 to ListView1.SelCount - 1 do
      DBGridEh.Columns[i].RestoreDefaults;
    Designer.Modified;
    UpdateListbox;
  end;
end;

procedure TDBGridEhColumnsEditor.AddAllFieldsCmdUpdate(Sender: TObject);
var DBGridEh: TCustomDBGridEh;
begin
{$IFDEF CIL}
  DBGridEh := TCustomDBGridEh(Collection.Owner);
{$ELSE}
  DBGridEh := TCustomDBGridEh(TCollectionCracker(Collection).GetOwner);
{$ENDIF}
  AddAllFieldsCmd.Enabled := Assigned(DBGridEh) and
    Assigned(DBGridEh.DataSource) and Assigned(DBGridEh.Datasource.Dataset) and
    (DBGridEh.Datasource.Dataset.FieldCount > 0);
end;

procedure TDBGridEhColumnsEditor.RestoreDefaultsCmdUpdate(Sender: TObject);
begin
  RestoreDefaultsCmd.Enabled := ListView1.Items.Count > 0;
end;

function TDBGridEhColumnsEditor.CanAdd(Index: Integer): Boolean;
var DBGridEh: TCustomDBGridEh;
begin
  Result := False;
{$IFDEF CIL}
  DBGridEh := TCustomDBGridEh(Collection.Owner);
{$ELSE}
  DBGridEh := TCustomDBGridEh(TCollectionCracker(Collection).GetOwner);
{$ENDIF}
  if Assigned(DBGridEh) then
    Result := (DBGridEh.Columns.State = csCustomized);
end;

{ TDBGridEhFieldProperty }

function TDBGridEhFieldProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList, paMultiSelect];
end;

procedure TDBGridEhFieldProperty.GetValueList(List: TStrings);
var
  Ehg: TCustomDBGridEh;
begin
  if (GetComponent(0) = nil) then Exit;
  if (GetComponent(0) is TColumnEh) then
    Ehg := (GetComponent(0) as TColumnEh).Grid
  else if (GetComponent(0) is TColumnFooterEh) then
    Ehg := (GetComponent(0) as TColumnFooterEh).Column.Grid
  else Exit;

  if (Ehg <> nil) and (TCustomDBGridEh(Ehg).DataSource <> nil) and (TCustomDBGridEh(Ehg).DataSource.DataSet <> nil) then
  begin
    TCustomDBGridEh(Ehg).DataSource.DataSet.GetFieldNames(List);
//    ShowMessage('TDBGridEhFieldProperty.GetValueList'); 
  end;
end;

procedure TDBGridEhFieldProperty.GetValues(Proc: TGetStrProc);
var
  i: Integer;
  Values: TStringList;
begin
  Values := TStringList.Create;
  try
    GetValueList(Values);
    for i := 0 to Values.Count - 1 do Proc(Values[i]);
  finally
    Values.Free;
  end;
end;

{ TDBGridEhFieldAggProperty }

procedure TDBGridEhFieldAggProperty.GetValueList(List: TStrings);
var
  Ehg: TCustomDBGridEh;
  AggList: TStringList;
begin
  if (GetComponent(0) = nil) then Exit;
  if (GetComponent(0) is TColumnEh) then
    Ehg := (GetComponent(0) as TColumnEh).Grid
  else if (GetComponent(0) is TColumnFooterEh) then
    Ehg := (GetComponent(0) as TColumnFooterEh).Column.Grid
  else Exit;

  if (Ehg <> nil) and (TCustomDBGridEh(Ehg).DataSource <> nil) and (TCustomDBGridEh(Ehg).DataSource.DataSet <> nil) then
  begin
    TCustomDBGridEh(Ehg).DataSource.DataSet.GetFieldNames(List);
    if TCustomDBGridEh(Ehg).DataSource.DataSet.AggFields.Count > 0 then
    begin
      AggList := TStringList.Create;
      try
        TCustomDBGridEh(Ehg).DataSource.DataSet.AggFields.GetFieldNames(AggList);
        List.AddStrings(AggList);
      finally
        AggList.Free;
      end;
    end;
  end;
end;

{ TDBLookupComboboxEhEditor }

procedure TDBLookupComboboxEhEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0:
      ShowCollectionEditorClass(Designer, TDBGridEhColumnsEditor, Component,
        TDBLookupComboboxEh(Component).DropDownBox.Columns, 'Columns', [coAdd, coDelete, coMove]);
  end;
end;

function TDBLookupComboboxEhEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'DropDownBox.Columns Editor ...';
  end;
end;

function TDBLookupComboboxEhEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

{ TDBGridEhDesignControler }

constructor TDBGridEhDesignControler.Create;
var
  LIDesignNotification: IDesignNotification;
begin
  inherited Create;
  FGridList := TList.Create;
  if Supports(TObject(Self), IDesignNotification, LIDesignNotification) then
  begin
  {$IFDEF EH_LIB_6}
    RegisterDesignNotification(LIDesignNotification);
  {$ENDIF}
  end;
end;

destructor TDBGridEhDesignControler.Destroy;
//var
//  LIDesignNotification: IDesignNotification;
begin
  FreeAndNil(FGridList);
//  if Supports(Self, IDesignNotification, LIDesignNotification) then
//    UnregisterDesignNotification(LIDesignNotification);
  inherited Destroy;
end;

function TDBGridEhDesignControler.ControlIsObjInspSelected(
  Control: TPersistent): Boolean;
begin
  Result := False;
  if GetObjInspSelectedControl(Control) = Control then
    Result := True;
end;

function TDBGridEhDesignControler.GetObjInspSelectedControl(BaseControl: TPersistent): TPersistent;
var
  List: IDesignerSelections;
{$IFDEF EH_LIB_6}
    LDesigner: IDesigner;
{$ELSE}
    LDesigner: IFormDesigner;
{$ENDIF}
begin
  Result := nil;
{$IFDEF EH_LIB_6}
  if Supports(FindRootDesigner(BaseControl), IDesigner, LDesigner) then
{$ELSE}
  if Supports(FindRootDesigner(BaseControl), IFormDesigner, LDesigner) then
{$ENDIF}
  begin
    List := CreateSelectionList;
    LDesigner.GetSelections(List);
    if (List <> nil) and (List.Count = 1) then
{$IFDEF EH_LIB_6}
      Result := List[0];
{$ELSE}
      Result := ExtractPersistent(List[0]);
{$ENDIF}
  end;
end;

procedure TDBGridEhDesignControler.DesignMouseDown(Control: TPersistent; X,
  Y: Integer; AShift: TShiftState);
var
  DBGridEh: TCustomDBGridEh;
  Column: TColumnEh;
  Cell: TGridCoord;
{$IFDEF EH_LIB_6}
  LDesigner: IDesigner;
{$ELSE}
  LDesigner: IFormDesigner;
{$ENDIF}
begin
  if not IsDesignHitTest(Control, X, Y, AShift) then
    Exit;
  DBGridEh := (Control as TCustomDBGridEh);
  Cell := DBGridEh.MouseCoord(X, Y);
  if (DBGridEh.Columns.State = csCustomized) and (dgTitles in DBGridEh.Options)
    and (Cell.Y = 0) and (Cell.X >= DBGridEh.IndicatorOffset) then
  begin
    Column := DBGridEh.Columns[Cell.X-DBGridEh.IndicatorOffset];
{$IFDEF EH_LIB_6}
    if Supports(FindRootDesigner(DBGridEh), IDesigner, LDesigner) then
{$ELSE}
    if Supports(FindRootDesigner(DBGridEh), IFormDesigner, LDesigner) then
{$ENDIF}
    begin
      LDesigner.SelectComponent(Column);
      DBGridEh.Invalidate;
    end;
  end;
end;

function TDBGridEhDesignControler.IsDesignHitTest(Control: TPersistent; X,
  Y: Integer; AShift: TShiftState): Boolean;
var
  DBGridEh: TCustomDBGridEhCracker;
  Cell: TGridCoord;
begin
  Result := False;
  if not (Control is TCustomDBGridEh)
    then Exit
    else DBGridEh := TCustomDBGridEhCracker(Control as TCustomDBGridEh);
  Cell := DBGridEh.MouseCoord(X, Y);
{$IFDEF CIL}
// To do
{$ELSE}
  if DBGridEh.FrozenSizing(X,Y) or DBGridEh.Sizing(X,Y) then
    Exit;
{$ENDIF}
  if (ssLeft in AShift) and (dgTitles in DBGridEh.Options) and
     (Cell.Y = 0) and (Cell.X >= DBGridEh.IndicatorOffset) then
  begin
    Result := True;
  end;
end;

{$IFDEF EH_LIB_6}
procedure TDBGridEhDesignControler.DesignerClosed(
  const ADesigner: IDesigner; AGoingDormant: Boolean);
{$ELSE}
procedure TDBGridEhDesignControler.DesignerClosed(const ADesigner: IUnknown);
{$ENDIF}
begin

end;

{$IFDEF EH_LIB_6}
procedure TDBGridEhDesignControler.DesignerOpened(
  const ADesigner: IDesigner; AResurrecting: Boolean);
{$ELSE}
procedure TDBGridEhDesignControler.DesignerInitialized(const ADesigner: IUnknown);
{$ENDIF}
begin

end;

{$IFDEF EH_LIB_6}
procedure TDBGridEhDesignControler.ItemDeleted(const ADesigner: IDesigner;
  AItem: TPersistent);
{$ELSE}
procedure TDBGridEhDesignControler.ItemDeleted(const AItem: IPersistent);
{$ENDIF}
begin

end;

{$IFDEF EH_LIB_6}
procedure TDBGridEhDesignControler.ItemInserted(const ADesigner: IDesigner;
  AItem: TPersistent);
{$ELSE}
procedure TDBGridEhDesignControler.ItemInserted(const AItem: IPersistent);
{$ENDIF}
begin

end;

{$IFDEF EH_LIB_6}
procedure TDBGridEhDesignControler.ItemsModified(
  const ADesigner: IDesigner);
{$ELSE}
procedure TDBGridEhDesignControler.ItemsModified(const ADesigner: IUnknown);
{$ENDIF}
begin

end;

{$IFDEF EH_LIB_6}
procedure TDBGridEhDesignControler.SelectionChanged(
  const ADesigner: IDesigner; const ASelection: IDesignerSelections);
{$ELSE}
procedure TDBGridEhDesignControler.SelectionChanged(const ASelection: IDesignerSelections);
{$ENDIF}
var
  i: Integer;
begin
  if FGridList = nil then Exit;
  for i := 0 to FGridList.Count-1 do
  begin
    TCustomDBGridEh(FGridList[i]).InvalidateTitle;
  end;
end;

procedure TDBGridEhDesignControler.RegisterChangeSelectedNotification(
  Control: TPersistent);
begin
  if FGridList = nil then Exit;
  if FGridList.IndexOf(Control) < 0 then
    FGridList.Add(Control);
end;

procedure TDBGridEhDesignControler.UnregisterChangeSelectedNotification(
  Control: TPersistent);
begin
  if FGridList = nil then Exit;
  FGridList.Remove(Control);
end;

var
  LIDesignNotification: IDesignNotification;

initialization
  DBGridEhDesigntControler := TDBGridEhDesignControler.Create;
finalization
  if Assigned(DBGridEhDesigntControler) then
  begin
    Supports(TObject(DBGridEhDesigntControler), IDesignNotification, LIDesignNotification);
{$IFDEF EH_LIB_6}
    UnregisterDesignNotification(LIDesignNotification);
{$ENDIF}
  end;
  DBGridEhDesigntControler := nil;
end.
