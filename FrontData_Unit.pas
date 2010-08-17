unit FrontData_Unit;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  SysUtils, Windows, Classes, AdvPanel, AdvSmoothMessageDialog, AdvStyleIF,
  SysConst, Graphics, ImgList, Controls, AdvAppStyler, GDIPPictureContainer,
  DBGridEh, AdvGrid, DBAdvGrid;

type
  TApplicationFile = (afApplicationData);

  TFrontData = class(TDataModule)
    FrontPanelStyler: TAdvPanelStyler;
    AdvSmoothMessageDialog1: TAdvSmoothMessageDialog;
    RestPictureContainer: TGDIPPictureContainer;
    ApStyler: TAdvAppStyler;
    procedure DataModuleCreate(Sender: TObject);
  private
    FPanelColor: TColor;
    FPanelColorTo: TColor;

    function CheckUserDataDirectory: Boolean;
    function GetUserApplicationFileName(const AFile: TApplicationFile): String;
    function GetDefaultTheme: TTMSStyle;
  public

    property PanelColor: TColor read FPanelColor write FPanelColor;
    property PanelColorTo: TColor read FPanelColorTo write FPanelColorTo;
  end;

  procedure SetupGrid(const Grid: TDBGridEh);
  procedure SetupAdvGrid(const AnGrid: TDBAdvGrid);
  function GetFrontStyle: TTMSStyle;

// настройки для гридов
const
  cn_TitleFontSize = 10;
  cn_FontSize = 16;
  cn_EvenRowColor = clInfoBk;
  cn_OddRowColor = clGradientActiveCaption;
  DATA_DIR = '..\data';
  APP_DATA_FILENAME = 'data.ini';
  STYLE_SECTION_NAME = 'STYLE_SECTION';
  DEFAULT_STYLE_IDENT = 'STYLE';

var
  FrontData: TFrontData;
  FFormatSettings: TFormatSettings;
  FFrontStyle: TTMSStyle;
  
implementation

uses
  UxTheme, IniFiles, Dialogs, Grids;

{$R *.dfm}

{ TFrontData }

procedure SetupGrid(const Grid: TDBGridEh);
begin
  with Grid do
  begin
    Font.Size := cn_FontSize;
    TitleFont.Size := cn_TitleFontSize;
    OddRowColor := cn_OddRowColor;
    EvenRowColor := cn_EvenRowColor;
  end;
end;

procedure SetupAdvGrid(const AnGrid: TDBAdvGrid);
var
  I: Integer;
begin
  with AnGrid do
  begin
    DefaultRowHeight := 2 * cn_FontSize;
    FixedFont.Size := cn_FontSize;
    for I := 0 to Columns.Count - 1 do
    begin
      Columns[I].Font.Size := cn_FontSize;
      Columns[I].HeaderFont.Size := cn_FontSize;
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
var
  IconID: PChar;
  FPicture: TPicture;
begin
  ApStyler.Style := GetDefaultTheme;
  FrontPanelStyler.SetComponentStyle(GetDefaultTheme);
  FPanelColor := FrontPanelStyler.Settings.Color;
  FPanelColorTo := FrontPanelStyler.Settings.ColorTo;

  //загрузим стандартные иконки
  FPicture := TPicture.Create;
  try
    IconID := IconIDs[mtWarning];
    if IconID <> nil then
      with RestPictureContainer.Items.Add do
      begin
        FPicture.Icon.Handle := LoadIcon(0, IconID);
        Picture.Assign(FPicture);
        Name := 'Warning';
      end;

    IconID := IconIDs[mtError];
    if IconID <> nil then
      with RestPictureContainer.Items.Add do
      begin
        FPicture.Icon.Handle := LoadIcon(0, IconID);
        Picture.Assign(FPicture);
        Name := 'Error';
      end;

    IconID := IconIDs[mtInformation];
    if IconID <> nil then
      with RestPictureContainer.Items.Add do
      begin
        FPicture.Icon.Handle := LoadIcon(0, IconID);
        Picture.Assign(FPicture);
        Name := 'Information';
      end;

    IconID := IconIDs[mtConfirmation];
    if IconID <> nil then
      with RestPictureContainer.Items.Add do
      begin
        FPicture.Icon.Handle := LoadIcon(0, IconID);
        Picture.Assign(FPicture);
        Name := 'Confirmation';
      end;
  finally
    FPicture.Free;
  end;
end;

function TFrontData.CheckUserDataDirectory: Boolean;
var
  CurrentDir: String;
begin
  Result := False;
  CurrentDir := GetCurrentDir;
  SetCurrentDir(ExtractFileDir(ParamStr(0)));
  if DirectoryExists(ExpandFileName(DATA_DIR)) then
  begin
    Result := True;
  end
  else
  begin
    if CreateDir(ExpandFileName(DATA_DIR)) then
      Result := True;
  end;
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
    SetCurrentDir(ExtractFileDir(ParamStr(0)));
    Result := IncludeTrailingBackslash(ExpandFileName(DATA_DIR)) + FileName;
  end;
end;

function TFrontData.GetDefaultTheme: TTMSStyle;
var
  FunctionFile: TIniFile;
  ValueText: String;
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
  finally
    FreeAndNil(FunctionFile);
  end;
  FFrontStyle := Result;
end;

initialization
  FFrontStyle := tsOffice2003Blue;
  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, FFormatSettings);
  InitThemeLibrary;

finalization


end.
