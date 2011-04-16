unit FrontData_Unit;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  SysUtils, Windows, Classes, AdvPanel, AdvStyleIF, AdvSmoothButton,
  SysConst, Graphics, ImgList, Controls, AdvAppStyler, GDIPPictureContainer,
  DBGridEh, AdvGrid, DBAdvGrid, Forms, obj_QueryList;

type
  TApplicationFile = (afApplicationData);

  TFrontData = class(TDataModule)
    FrontPanelStyler: TAdvPanelStyler;
    RestPictureContainer: TGDIPPictureContainer;
    ApStyler: TAdvAppStyler;
    procedure DataModuleCreate(Sender: TObject);
  private
    FPanelColor: TColor;
    FPanelColorTo: TColor;
    FQueryList: TgsQueryList;

    function CheckUserDataDirectory: Boolean;
    function GetUserApplicationFileName(const AFile: TApplicationFile): String;
    function GetDefaultTheme: TTMSStyle;
  public

    property PanelColor: TColor read FPanelColor write FPanelColor;
    property PanelColorTo: TColor read FPanelColorTo write FPanelColorTo;
    property BaseQueryList: TgsQueryList read FQueryList write FQueryList;
  end;

  procedure SetupGrid(const Grid: TDBGridEh);
  procedure SetupAdvGrid(const AnGrid: TDBAdvGrid);
  function GetFrontStyle: TTMSStyle;
  procedure AdjustResolution(const FForm: TWinControl);
  function AdjustWidth(const FWidth: Integer): Integer;
  procedure SetButtonStyle(const FButton: TAdvSmoothButton);

// настройки для гридов
const
  cn_FontSize = 16;
  cn_EvenRowColor = TColor($00ECFFFF);//clInfoBk;
  cn_OddRowColor = TColor($00F8E6D6);//clGradientActiveCaption;
  cn_FontType = 'Tahoma';
  DATA_DIR = '..\data';
  APP_DATA_FILENAME = 'data.ini';
  STYLE_SECTION_NAME = 'STYLE_SECTION';
  DEFAULT_STYLE_IDENT = 'STYLE';
  RES_SECTION_NAME = 'RESOLUTION_SECTION';
  RES_IDENT = 'RESOLUTION';
  SYS_SECTION_NAME = 'SYSTEM_SECTION';
  SYS_SHUTDOWN_ON_EXIT = 'SHUTDOWN_ON_EXIT';
  GRID_FONT_SECTION_NAME = 'GRID_FONT';
  GRID_HEADER_FONT_SIZE = 'HEADER_FONT_SIZE';
  GRID_FONT_SIZE = 'FONT_SIZE';
  BTN_FONT_SECTION_NAME = 'BUTTON_FONT';
  BTN_SMALL_FONT_SIZE = 'BUTTON_SMALL_FONT_SIZE';
  BTN_FONT_SIZE = 'BTN_FONT_SIZE';
  cn_defaultHeight = 768;
  cn_defaultWidth = 1024;
  LOG_SECTION_NAME = 'LOG';
  LOG_DB_PATH = 'LOG_DB_PATH';

var
  FrontData: TFrontData;
  FFormatSettings: TFormatSettings;
  FFrontStyle: TTMSStyle;
  cn_Height: Integer;
  cn_Width: Integer;
  cn_MainPercent: Integer;
  cn_ShutDownOnExit: Boolean;
  cn_TitleFontSize: Integer;
  cn_GridFontSize: Integer;
  cn_ButtonFontSize: Integer;
  cn_ButtonSmallFontSize: Integer;
  cn_LodDataBasePath: String;
  AppHandle: THandle;

implementation

uses
  UxTheme, IniFiles, Dialogs, Grids;

{$R *.dfm}

{ TFrontData }

procedure SetButtonStyle(const FButton: TAdvSmoothButton);
begin
  FButton.SetComponentStyle(tsTerminal);
  FButton.BevelColor := clBlack{clSilver};
  FButton.Bevel := True;
  FButton.Appearance.Font.Style := [fsBold];
  FButton.Appearance.Font.Name := cn_FontType;
  FButton.DisabledColor := clGray;
  FButton.Color := TColor($00E7DCD5);
end;

procedure SetupGrid(const Grid: TDBGridEh);
var
  I: Integer;
begin
  with Grid do
  begin
    Font.Name := cn_FontType;
    Font.Size := cn_GridFontSize;
    TitleFont.Size := cn_TitleFontSize;
    OddRowColor := cn_OddRowColor;
    EvenRowColor := cn_EvenRowColor;
    FooterFont.Size := cn_TitleFontSize;
    for I := 0 to Columns.Count - 1 do
    begin
      Columns[I].Font.Name := cn_FontType;
      Columns[I].Font.Size := cn_GridFontSize;
      Columns[I].Title.Font.Name := cn_FontType;
      Columns[I].Title.Font.Size := cn_TitleFontSize;
    end;
  end;
end;

procedure SetupAdvGrid(const AnGrid: TDBAdvGrid);
var
  I: Integer;
begin
  with AnGrid do
  begin
    DefaultRowHeight := 3 * cn_GridFontSize;
    FixedFont.Size := 12;
    FixedFont.Name := cn_FontType;
    Bands.PrimaryColor := cn_EvenRowColor;
    Bands.SecondaryColor := cn_OddRowColor;
    Bands.Active := True;
    for I := 0 to Columns.Count - 1 do
    begin
      Columns[I].Font.Size := 12;
      Columns[I].Font.Name := cn_FontType;
      Columns[I].Font.Style := [fsBold];
      Columns[I].HeaderFont.Size := 12;
      Columns[I].ShowBands := True;
    end;
  end;
end;

function GetFrontStyle: TTMSStyle;
begin
  Result := FFrontStyle;
end;

var
  IconIDs: array[TMsgDlgType] of PChar = (IDI_EXCLAMATION, IDI_HAND,
    IDI_ASTERISK, IDI_QUESTION, nil);

procedure TFrontData.DataModuleCreate(Sender: TObject);
begin
  cn_Height := Screen.Height;
  cn_Width := Screen.Width;
  cn_MainPercent := 100;
  cn_ShutDownOnExit := False;
  cn_LodDataBasePath := '';

  ApStyler.Style := GetDefaultTheme;
  FrontPanelStyler.SetComponentStyle(GetDefaultTheme);
  FPanelColor := FrontPanelStyler.Settings.Color;
  FPanelColorTo := FrontPanelStyler.Settings.ColorTo;
end;

function TFrontData.CheckUserDataDirectory: Boolean;
begin
  Result := True;
{  Result := False;
  SetCurrentDir(ExtractFileDir(ParamStr(0)));
  if DirectoryExists(ExpandFileName(DATA_DIR)) then
  begin
    Result := True;
  end
  else
  begin
    if CreateDir(ExpandFileName(DATA_DIR)) then
      Result := True;
  end; }
end;

function TFrontData.GetUserApplicationFileName(
  const AFile: TApplicationFile): String;
var
  FileName: String;
begin
  Result := '';
  if CheckUserDataDirectory then
  begin
    // Получим наименование файла
    case AFile of

      afApplicationData:
        FileName := APP_DATA_FILENAME;
    else
      FileName := '';
    end;

    // Сформируем пути к файлу в директориях данных
    Result := IncludeTrailingPathDelimiter(ExtractFileDir(ParamStr(0))) + FileName;
  end;
end;

function TFrontData.GetDefaultTheme: TTMSStyle;
var
  FunctionFile: TIniFile;
  ValueText: String;
  Pos: Integer;
begin
  Result := tsOffice2003Blue;
  FunctionFile := TIniFile.Create(GetUserApplicationFileName(afApplicationData));
  try
    if FunctionFile.ValueExists(STYLE_SECTION_NAME, DEFAULT_STYLE_IDENT) then
    begin
      ValueText := FunctionFile.ReadString(STYLE_SECTION_NAME, DEFAULT_STYLE_IDENT, 'tsOffice2003Blue');
      if ValueText = 'tsOffice2003Blue' then
        Result := tsOffice2003Blue
      else if ValueText = 'tsOffice2003Silver' then
        Result := tsOffice2003Silver
      else if ValueText = 'tsOffice2003Olive' then
        Result := tsOffice2003Olive
      else if ValueText = 'tsOffice2003Classic' then
        Result := tsOffice2003Classic
      else if ValueText = 'tsOffice2007Luna' then
        Result := tsOffice2007Luna
      else if ValueText = 'tsOffice2007Obsidian' then
        Result := tsOffice2007Obsidian
      else if ValueText = 'tsWindowsVista' then
        Result := tsWindowsVista
      else if ValueText = 'tsWindows7' then
        Result := tsWindows7
      else if ValueText = 'tsTerminal' then
        Result := tsTerminal
      else
        Result := tsOffice2003Blue;

    end else
      FunctionFile.WriteString(STYLE_SECTION_NAME, DEFAULT_STYLE_IDENT, 'tsOffice2003Blue');

    if FunctionFile.ValueExists(RES_SECTION_NAME, RES_IDENT) then
    begin
      ValueText := AnsiUpperCase(FunctionFile.ReadString(RES_SECTION_NAME, RES_IDENT, 'DEFAULT'));
      if ValueText = 'DEFAULT' then
      begin
        cn_Height := cn_defaultHeight;
        cn_Width := cn_defaultWidth;
      end else
      if ValueText = 'CLIENT' then
      begin
        cn_Height := Screen.Height;
        cn_Width := Screen.Width;
      end else
      if AnsiPos(':', ValueText) > 0 then
      begin
        Pos := AnsiPos(':', ValueText);
        try
          cn_Width := StrToInt(Copy(ValueText, 1, Pos - 1));
          cn_Height := StrToInt(Copy(ValueText, Pos + 1, 255));
        except
          cn_Height := cn_defaultHeight;
          cn_Width := cn_defaultWidth;
          raise;
        end;
      end else
      if AnsiPos('x', ValueText) > 0 then
      begin
        Pos := AnsiPos('x', ValueText);
        try
          cn_Width := StrToInt(Copy(ValueText, 1, Pos - 1));
          cn_Height := StrToInt(Copy(ValueText, Pos + 1, 255));
        except
          cn_Height := cn_defaultHeight;
          cn_Width := cn_defaultWidth;
          raise;
        end;
      end else
      begin
        cn_Height := cn_defaultHeight;
        cn_Width := cn_defaultWidth;
      end;
    end else
      FunctionFile.WriteString(RES_SECTION_NAME, RES_IDENT, 'DEFAULT');

    if FunctionFile.ValueExists(SYS_SECTION_NAME, SYS_SHUTDOWN_ON_EXIT) then
    begin
      ValueText := AnsiUpperCase(FunctionFile.ReadString(SYS_SECTION_NAME, SYS_SHUTDOWN_ON_EXIT, 'FALSE'));
      cn_ShutDownOnExit := (ValueText = 'TRUE');
    end else
      FunctionFile.WriteString(SYS_SECTION_NAME, SYS_SHUTDOWN_ON_EXIT, 'FALSE');

    if FunctionFile.ValueExists(GRID_FONT_SECTION_NAME, GRID_HEADER_FONT_SIZE) then
    begin
      ValueText := AnsiUpperCase(FunctionFile.ReadString(GRID_FONT_SECTION_NAME, GRID_HEADER_FONT_SIZE, '10'));
      try
        cn_TitleFontSize := StrToInt(ValueText);
      except
        cn_TitleFontSize := 10;
      end;
    end else
      FunctionFile.WriteString(GRID_FONT_SECTION_NAME, GRID_HEADER_FONT_SIZE, '10');

    if FunctionFile.ValueExists(GRID_FONT_SECTION_NAME, GRID_FONT_SIZE) then
    begin
      ValueText := AnsiUpperCase(FunctionFile.ReadString(GRID_FONT_SECTION_NAME, GRID_FONT_SIZE, '10'));
      try
        cn_GridFontSize := StrToInt(ValueText);
      except
        cn_GridFontSize := 10;
      end;
    end else
      FunctionFile.WriteString(GRID_FONT_SECTION_NAME, GRID_FONT_SIZE, '10');

    if FunctionFile.ValueExists(BTN_FONT_SECTION_NAME, BTN_SMALL_FONT_SIZE) then
    begin
      ValueText := AnsiUpperCase(FunctionFile.ReadString(BTN_FONT_SECTION_NAME, BTN_SMALL_FONT_SIZE, '8'));
      try
        cn_ButtonSmallFontSize := StrToInt(ValueText);
      except
        cn_ButtonSmallFontSize := 8;
      end;
    end else
      FunctionFile.WriteString(BTN_FONT_SECTION_NAME, BTN_SMALL_FONT_SIZE, '8');

    if FunctionFile.ValueExists(BTN_FONT_SECTION_NAME, BTN_FONT_SIZE) then
    begin
      ValueText := AnsiUpperCase(FunctionFile.ReadString(BTN_FONT_SECTION_NAME, BTN_FONT_SIZE, '10'));
      try
        cn_ButtonFontSize := StrToInt(ValueText);
      except
        cn_ButtonFontSize := 10;
      end;
    end else
      FunctionFile.WriteString(BTN_FONT_SECTION_NAME, BTN_FONT_SIZE, '10');

    if FunctionFile.ValueExists(LOG_SECTION_NAME, LOG_DB_PATH) then
    begin
      cn_LodDataBasePath := FunctionFile.ReadString(LOG_SECTION_NAME, LOG_DB_PATH, '')
    end else
      FunctionFile.WriteString(LOG_SECTION_NAME, LOG_DB_PATH, '');

  finally
    FreeAndNil(FunctionFile);
  end;
  FFrontStyle := Result;
end;

procedure AdjustResolution(const FForm: TWinControl);
var
  Perc: Integer;
  Perc2: Integer;
begin
  cn_MainPercent := 100;
  if Screen.Width <> cn_defaultWidth then
  begin
    Perc := Round(((cn_Width - cn_defaultWidth) / cn_defaultWidth) * 100) + 100;
    Perc2 := Round(((cn_Height - cn_defaultHeight) / cn_defaultHeight) * 100) + 100;
    if Perc2 >= Perc then
    begin
      FForm.ScaleBy(Perc, 100);
      cn_MainPercent := Perc;
    end else
    begin
      FForm.ScaleBy(Perc2, 100);
      cn_MainPercent := Perc2;
    end;
  end;
end;

function AdjustWidth(const FWidth: Integer): Integer;
begin
  Result := Round(FWidth / 100 * cn_MainPercent);
end;


initialization
  FFrontStyle := tsOffice2003Blue;
  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, FFormatSettings);
  InitThemeLibrary;

finalization


end.
