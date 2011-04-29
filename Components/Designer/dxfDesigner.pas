{**************************************************}
{                                                  }
{         Delphi VCL Extensions                    }
{                                                  }
{ Copyright (c) 1998-2001 Developer Express Inc.   }
{           All Rights Reserved                    }
{                                                  }
{**************************************************}

unit dxfDesigner;

{$I dxFLVer.inc}

interface

uses
  Classes, Graphics, Forms, Windows, Controls, Messages, Menus, SysUtils, IniFiles,
  RestTable_Unit, Types;

type
  TOrderInfo = class
    FControl: TControl;
    FOrder: Integer;
  end;

  PdxfDesignerInfo = ^TdxfDesignerInfo;
  TdxfDesignerInfo = record
    Form: TForm;
    Active: Boolean;
  end;

  TdxfDsCount = class
  private
    FList: TList;
  public
    constructor Create;
    destructor  Destroy; override;
    procedure Add(Value: TForm);
    procedure Delete(Value: TForm);
    function  DesignerInForm(Value: TForm): Boolean;
    procedure SetActive(AForm: TForm; Value : Boolean);
    function  DesignerIsActive(Value: TForm): Boolean;
  end;

  TdxfDesigner = class(TComponent)
  private
    FActive: Boolean;
    FIniFile: String;
    FForm: TForm;
    FStepToGrid: Integer;
    FDownPoint : TPoint;
    FOldLeft: Integer;
    FOldTop: Integer;
    FOldWidth: Integer;
    FOldHeight: Integer;
    FMoveControl: TControl;
    FPopupControl: TControl;
    FOldControl: TControl;
    FMode: Integer;
    FPopupMenu: TPopupMenu;
    FEditingControls: TStrings;
    FEditControl: TWinControl;
    procedure SetStepToGrid(Value: Integer);
    procedure SetActive(Value: Boolean);
    procedure ApplicationMessages(var Msg: TMsg; var Handled: Boolean);
    function  FindMoveControl(AControl: TWinControl; P: TPoint; var Mode: Integer): TControl;
    procedure SetMyCursor(AControl: TControl; Mode: Integer);
    procedure PopupMenuClick(Sender: TObject);
    procedure SetChecked(AControl: TControl);
    function GetActiveForm: TForm;
    procedure SetEditingControls(Value: TStrings);
    procedure SetEditControl(const Value: TWinControl);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure LoadPosition;
    procedure SavePosition;
    property EditControl: TWinControl read FEditControl write SetEditControl;
  published
    property StepToGrid: Integer read FStepToGrid write SetStepToGrid;
    property Active: Boolean read FActive write SetActive;
    property IniFile: string read FIniFile write FIniFile;
    property EditingControls: TStrings read FEditingControls write SetEditingControls;
  end;

var dxfDsCount: TdxfDsCount;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RestFront', [TdxfDesigner]);
end;

{TdxfDsCount}

constructor TdxfDsCount.Create;
begin
  inherited;
  FList := TList.Create;
end;

destructor TdxfDsCount.Destroy;
var
  I: Integer;
begin
  for I := 0 to FList.Count - 1 do
    Dispose(PdxfDesignerInfo(FList[I]));
  FList.Free;
  inherited;
end;

procedure TdxfDsCount.Add(Value: TForm);
var
  AInfo: PdxfDesignerInfo;
begin
  New(AInfo);
  AInfo^.Form := Value;
  AInfo^.Active := False;
  FList.Add(AInfo);
end;

procedure TdxfDsCount.Delete(Value: TForm);
var
  I: Integer;
begin
  for I := FList.Count - 1 downto 0 do
    if PdxfDesignerInfo(FList[I])^.Form = Value then
    begin
      Dispose(PdxfDesignerInfo(FList[I]));
      FList.Delete(I);
    end;
end;

function  TdxfDsCount.DesignerInForm(Value: TForm): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to FList.Count - 1 do
    if PdxfDesignerInfo(FList[I])^.Form = Value then
    begin
      Result := True;
      Break;
    end;
end;

procedure TdxfDsCount.SetActive(AForm: TForm; Value : Boolean);
var
  I: Integer;
begin
  for I := 0 to FList.Count - 1 do
    if PdxfDesignerInfo(FList[I])^.Form = AForm then
    begin
      PdxfDesignerInfo(FList[I])^.Active := Value;
      Break;
    end;
end;

function TdxfDsCount.DesignerIsActive(Value: TForm): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to FList.Count - 1 do
    if PdxfDesignerInfo(FList[I])^.Form = Value then
    begin
      Result := PdxfDesignerInfo(FList[I])^.Active;
      Break;
    end;
end;

{TdxfDesigner}

constructor TdxfDesigner.Create(AOwner: TComponent);
begin
  if not (AOwner is TForm) then
    raise Exception.Create('TdxfDesigner must be placed onto a TForm instance');
  if dxfDsCount.DesignerInForm(TForm(AOwner)) then
    raise Exception.Create('Form should have only a single TdxfDesigner');
  inherited;
  FForm := TForm(AOwner);
  FStepToGrid := 1;
  dxfDsCount.Add(FForm);
  FEditingControls := TStringList.Create;
  FPopupMenu := TPopupMenu.Create(Self);
  with FPopupMenu do
  begin
    Items.Add(TMenuItem.Create(FPopupMenu));
    Items[0].Caption := 'Align to Grid';
    Items[0].Tag := 1;
    Items[0].OnClick := PopupMenuClick;

    Items.Add(TMenuItem.Create(FPopupMenu));
    Items[1].Caption := 'Bring To Front';
    Items[1].Tag := 2;
    Items[1].OnClick := PopupMenuClick;
    Items[1].Visible := False;

    Items.Add(TMenuItem.Create(FPopupMenu));
    Items[2].Caption := 'Send To Back';
    Items[2].Tag := 3;
    Items[2].OnClick := PopupMenuClick;
    Items[2].Visible := False;

    Items.Add(TMenuItem.Create(FPopupMenu));
    Items[3].Caption := '-';
    Items[3].Visible := False;

    Items.Add(TMenuItem.Create(FPopupMenu));
    Items[4].Caption := 'Align';
    Items[4].Visible := False;

    Items[4].Add(TMenuItem.Create(Items[4]));
    Items[4].Items[0].Caption := 'None';
    Items[4].Items[0].Tag := 4;
    Items[4].Items[0].OnClick := PopupMenuClick;

    Items[4].Add(TMenuItem.Create(Items[4]));
    Items[4].Items[1].Caption := 'Top';
    Items[4].Items[1].Tag := 5;
    Items[4].Items[1].OnClick := PopupMenuClick;

    Items[4].Add(TMenuItem.Create(Items[4]));
    Items[4].Items[2].Caption := 'Bottom';
    Items[4].Items[2].Tag := 6;
    Items[4].Items[2].OnClick := PopupMenuClick;

    Items[4].Add(TMenuItem.Create(Items[4]));
    Items[4].Items[3].Caption := 'Left';
    Items[4].Items[3].Tag := 7;
    Items[4].Items[3].OnClick := PopupMenuClick;

    Items[4].Add(TMenuItem.Create(Items[4]));
    Items[4].Items[4].Caption := 'Right';
    Items[4].Items[4].Tag := 8;
    Items[4].Items[4].OnClick := PopupMenuClick;

    Items[4].Add(TMenuItem.Create(Items[4]));
    Items[4].Items[5].Caption := 'Client';
    Items[4].Items[5].Tag := 9;
    Items[4].Items[5].OnClick := PopupMenuClick;
  end;

  Application.OnMessage := ApplicationMessages;
end;

destructor TdxfDesigner.Destroy;
begin
  FPopupMenu.Free;
  FEditingControls.Free;
  dxfDsCount.Delete(FForm);
  inherited;
  if dxfDsCount.FList.Count = 0 then
    Application.OnMessage := nil;
end;

procedure TdxfDesigner.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
  begin
    if AComponent = FMoveControl then
      FMoveControl := nil;
    if AComponent = FOldControl then
      FOldControl := nil;
  end;
end;

procedure TdxfDesigner.SetEditControl(const Value: TWinControl);
begin
  FEditControl := Value;
end;

procedure TdxfDesigner.SetEditingControls(Value: TStrings);
begin
  FEditingControls.Assign(Value);
end;

procedure TdxfDesigner.SetStepToGrid(Value: Integer);
begin
  FStepToGrid := Value;
  if FStepToGrid < 1 then
    FStepToGrid := 1;
end;

procedure TdxfDesigner.SetActive(Value: Boolean);
begin
  FActive := Value;
  dxfDsCount.SetActive(FForm, FActive);
end;

procedure TdxfDesigner.ApplicationMessages(var Msg: TMsg; var Handled: Boolean);
var
  dX, dY, Mode, I: Integer;
  P: TPoint;
  AControl: TControl;
  ALeft, AWidth, ATop, AHeight: Integer;
  FEdit: Boolean;
begin
  if not dxfDsCount.DesignerIsActive(GetActiveForm) then
    Exit;
  with Msg do
    case Message of
      WM_LBUTTONDOWN:
        begin
          P := SmallPointToPoint(TSmallPoint(lParam));
          MapWindowPoints(hwnd, 0, P, 1);
          FMode := 0;
          FMoveControl := FindMoveControl(GetActiveForm, P, FMode);
          if FMoveControl = nil then
            Exit;
          if FEditingControls.Count > 0 then
          begin
            FEdit := False;
            for I := 0 to FEditingControls.Count -1 do
              if UpperCase(FEditingControls.Strings[I]) = UpperCase(FMoveControl.Name) then
              begin
                FEdit := True;
                Break;
              end;
            if not FEdit then
            begin
              FMoveControl := nil;
              Exit;
            end;
          end;
          FDownPoint.X := P.X;
          FDownPoint.Y := P.Y;
          FOldLeft := FMoveControl.Left;
          FOldTop := FMoveControl.Top;
          FOldWidth := FMoveControl.Width;
          FOldHeight := FMoveControl.Height;
        end;
      WM_MOUSEMOVE:
        if FMoveControl <> nil then
        begin
          P := SmallPointToPoint(TSmallPoint(lParam));
          MapWindowPoints(hwnd, 0, P, 1);
          dX := P.X - FDownPoint.X;
          dY := P.Y - FDownPoint.Y;
          with FMoveControl do
          begin
            ALeft := Left;
            AWidth := Width;
            ATop := Top;
            AHeight := Height;
            case FMode of
              0:
                if Align = alNone then
                begin
                  ALeft := FOldLeft + dX;
                  ATop := FOldTop + dY;
                end;
{              1:
              begin
                ALeft := FOldLeft + dX;
                ATop := FOldTop + dY;
                AWidth := FOldWidth - dX;
                AHeight := FOldHeight - dY;
              end;
              2:
              begin
                ATop := FOldTop + dY;
                AHeight := FOldHeight - dY;
              end;
              3:
              begin
                ATop := FOldTop + dY;
                AWidth := FOldWidth + dX;
                AHeight := FOldHeight - dY;
              end;
              4: AWidth := FOldWidth + dX;
              5:
              begin
                AWidth := FOldWidth + dX;
                AHeight := FOldHeight + dY;
              end;
              6: AHeight := FOldHeight + dY;
              7:
              begin
                ALeft := FOldLeft + dX;
                AWidth := FOldWidth - dX;
                AHeight := FOldHeight + dY;
              end;
              8:
              begin
                ALeft := FOldLeft + dX;
                AWidth := FOldWidth - dX;
              end;     }
            end;
            if FMode <> 0 then
            begin
              AWidth := (AWidth  div StepToGrid) * StepToGrid;
              AHeight := (AHeight  div StepToGrid) * StepToGrid;
            end
            else
            begin
              ALeft := (ALeft div StepToGrid) * StepToGrid;
              ATop  := (ATop  div StepToGrid) * StepToGrid;
            end;
            if AWidth <= 10 then AWidth := 10;
            if AHeight <= 10 then AHeight := 10;
            Left := ALeft;
            Top  := ATop;
            Width := AWidth;
            Height := AHeight;
          end;
        end
        else
        begin
          P := SmallPointToPoint(TSmallPoint(lParam));
          MapWindowPoints(hwnd, 0, P, 1);
          AControl := FindMoveControl(GetActiveForm, P, Mode);
          FEdit := False;
          if AControl = nil then Exit;
          if FEditingControls.Count = 0 then
            FEdit := True
          else
          begin
            for I := 0 to FEditingControls.Count - 1 do
              if UpperCase(FEditingControls.Strings[I]) = UpperCase(AControl.Name) then
              begin
                FEdit := True;
                Break;
              end;
          end;
          if not FEdit then Exit;
          SetMyCursor(AControl, Mode);
          if AControl <> FOldControl then
          begin
            SetMyCursor(FOldControl, 9);
            FOldControl := AControl;
          end;
        end;
      WM_LBUTTONUP:
        begin
          SetMyCursor(FMoveControl, 9);
          FMoveControl := nil;
        end;
      WM_RBUTTONDOWN:
        begin
          P := SmallPointToPoint(TSmallPoint(lParam));
          MapWindowPoints(hwnd, 0, P, 1);
          FPopupControl := FindMoveControl(GetActiveForm, P, Mode);
          if FPopupControl <> nil then
          begin
            if FEditingControls.Count > 0 then
            begin
              FEdit := False;
              for I := 0 to FEditingControls.Count -1 do
                if UpperCase(FEditingControls.Strings[I]) = UpperCase(FPopupControl.Name) then
                begin
                  FEdit := True;
                  break;
                end;
                if not FEdit then Exit;
            end;
            SetChecked(FPopupControl);
            FPopupMenu.Popup(P.X, P.Y);
          end;
        end;
      end;
end;

function TdxfDesigner.FindMoveControl(AControl: TWinControl;P: TPoint; var Mode: Integer): TControl;
const
  D = 5;
var
  I: Integer;
  PC: TPoint;
  ARect: TRect;
begin
  Result := nil;
  if FEditControl <> nil then
    AControl := FEditControl;

  for I := AControl.ControlCount - 1 downto 0 do
    with AControl.Controls[I] do
    begin
     PC.X := Left;
     PC.Y := Top;
     MapWindowPoints(AControl.Handle, 0, PC, 1);
     ARect := Rect(PC.X, PC.Y, PC.X + Width, PC.Y + Height);
     if PtInRect(ARect, P) then begin
       Result := AControl.Controls[I];
       Mode := 0;

       ARect := Rect(PC.X, PC.Y, PC.X + D, PC.Y + D);
       if PtInRect(ARect, P) then Mode := 1;

       ARect := Rect(PC.X + D, PC.Y, PC.X + Width - D, PC.Y + D);
       if PtInRect(ARect, P) then Mode := 2;

       ARect := Rect(PC.X + Width - D, PC.Y, PC.X + Width , PC.Y + D);
       if PtInRect(ARect, P) then Mode := 3;

       ARect := Rect(PC.X + Width - D, PC.Y + D , PC.X + Width , PC.Y + Height - D);
       if PtInRect(ARect, P) then Mode := 4;

       ARect := Rect(PC.X + Width - D, PC.Y + Height -D , PC.X + Width , PC.Y + Height);
       if PtInRect(ARect, P) then Mode := 5;

       ARect := Rect(PC.X +  D, PC.Y + Height -D , PC.X + Width - D , PC.Y + Height);
       if PtInRect(ARect, P) then Mode := 6;

       ARect := Rect(PC.X , PC.Y + Height - D , PC.X + D , PC.Y + Height);
       if PtInRect(ARect, P) then Mode := 7;

       ARect := Rect(PC.X , PC.Y +  D , PC.X + D , PC.Y + Height - D);
       if PtInRect(ARect, P) then Mode := 8;

       if AControl.Controls[I] is TRestTable {TWinControl} then
       begin
//         Result := FindMoveControl(AControl.Controls[I] as TWinControl, P, Mode);
//         if Result = nil then
           Result := AControl.Controls[I];
       end;
       Break;
     end;
   end;
end;

procedure TdxfDesigner.SetMyCursor(AControl: TControl; Mode: Integer);
begin
  if AControl = nil then Exit;
  case Mode of
    0, 9: AControl.Cursor := crDefault;
//    1, 5: AControl.Cursor := crSizeNWSE;
//    2, 6: AControl.Cursor := crSizeNS;
//    3, 7: AControl.Cursor := crSizeNESW;
//    4, 8: AControl.Cursor := crSizeWE;
  else
    AControl.Cursor := crDefault;
  end;
end;

procedure TdxfDesigner.SetChecked(AControl: TControl);
var I: Integer;
begin
  for I := 0 to 5 do
    FPopupMenu.Items[4].Items[I].Checked := False;
  FPopupMenu.Items[4].Items[Integer(AControl.Align)].Checked := True;
end;

procedure TdxfDesigner.PopupMenuClick(Sender: TObject);
begin
  case TMenuItem(Sender).Tag of
    1: begin
         FPopupControl.Left := (FPopupControl.Left div StepToGrid) * StepToGrid;
         FPopupControl.Top  := (FPopupControl.Top  div StepToGrid) * StepToGrid;
       end;
    2: FPopupControl.BringToFront;
    3: FPopupControl.SendToBack;
    4..9: FPopupControl.Align := TAlign(TMenuItem(Sender).Tag - 4);
  end;
end;

function TdxfDesigner.GetActiveForm: TForm;
var
  I: Integer;
begin
  Result := nil;
  if dxfDsCount <> nil then
    for I := 0 to dxfDsCount.FList.Count - 1 do
      if TForm(PdxfDesignerInfo(dxfDsCount.FList[I])^.Form).Active then
      begin
        Result := TForm(PdxfDesignerInfo(dxfDsCount.FList[I])^.Form);
        Break;
      end;
end;

procedure TdxfDesigner.SavePosition;
var
  IniFile: TIniFile;

  procedure Save(AControl: TWinControl; BeginTabOrder: Integer);
  var I: Integer;
  begin
    for I := 0 to AControl.ControlCount - 1 do
      with AControl.Controls[I] do
      begin
        IniFile.WriteInteger(FForm.Name, Name+'.Left', Left);
        IniFile.WriteInteger(FForm.Name, Name+'.Top', Top);
        IniFile.WriteInteger(FForm.Name, Name+'.Width', Width);
        IniFile.WriteInteger(FForm.Name, Name+'.Height', Height);
        IniFile.WriteInteger(FForm.Name, Name+'.Align', Integer(Align));
        IniFile.WriteInteger(FForm.Name, Name+'.TabOrder', BeginTabOrder + I);

        if AControl.Controls[I] is TWinControl then
          Save(AControl.Controls[I] as TWinControl, BeginTabOrder + 1000);
      end;
  end;

begin
  IniFile := TIniFile.Create(FIniFile);
  try
    Save(FForm, 0);
  finally
    IniFile.Free;
  end;
end;


procedure TdxfDesigner.LoadPosition;
var
  IniFile: TIniFile;
  OrderList: TList;
  N, MinOrder, I: Integer;

  procedure Load(AControl: TWinControl);
  var
    I,j: Integer;
    FLoad: Boolean;
  begin
    for I := 0 to AControl.ControlCount - 1 do
      with AControl.Controls[I] do
      begin
        FLoad := False;
        if FEditingControls.Count = 0 then FLoad := True
        else begin
          for j := 0 to FEditingControls.Count - 1 do
            if AnsiUpperCase(FEditingControls.Strings[j]) = AnsiUpperCase(Name) then begin
              FLoad := True;
              break;
            end;
        end;

        if FLoad then begin
          Align  := TAlign(IniFile.ReadInteger(FForm.Name, Name+'.Align', Integer(Align)));
          Left   := IniFile.ReadInteger(FForm.Name, Name+'.Left', Left);
          Top    := IniFile.ReadInteger(FForm.Name, Name+'.Top', Top);
          Width  := IniFile.ReadInteger(FForm.Name, Name+'.Width', Width);
          Height := IniFile.ReadInteger(FForm.Name, Name+'.Height', Height);

          OrderList.Add(TOrderInfo.Create);
          TOrderInfo(OrderList.Items[OrderList.Count - 1]).FControl := AControl.Controls[I];
          TOrderInfo(OrderList.Items[OrderList.Count - 1]).FOrder   :=
             IniFile.ReadInteger(FForm.Name, Name+'.TabOrder', 0);
        end;
        if AControl.Controls[I] is TWinControl then
          Load(AControl.Controls[I] as TWinControl);
      end;
  end;

begin
  IniFile := TIniFile.Create(FIniFile);
  try
    if IniFile <> nil then begin
      OrderList := TList.Create;
      try
        Load(FForm);
        while OrderList.Count > 0 do begin
          MinOrder := TOrderInfo(OrderList.Items[0]).FOrder;
          N := 0;
          for I := 1 to OrderList.Count - 1 do
            if TOrderInfo(OrderList.Items[I]).FOrder < MinOrder then begin
              MinOrder := TOrderInfo(OrderList.Items[I]).FOrder;
              N := I;
            end;
          TControl(TOrderInfo(OrderList.Items[N]).FControl).BringToFront;
          TOrderInfo(OrderList.Items[N]).Free;
          OrderList.Delete(N);
        end;
      finally
        OrderList.Free;
      end;
    end;
  finally
    IniFile.Free;
  end;
end;

initialization
  dxfDsCount := TdxfDsCount.Create;

finalization
  dxfDsCount.Free;

end.
