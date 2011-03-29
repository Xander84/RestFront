unit Base_Display_unit;

interface

uses
  Windows;

 { TODO : Логировать недоступность дисплея }

type
  // Base interface for pole display
  IBaseDisplay = interface
  ['{8F009273-1887-46C3-82C6-BC1D93FBD31F}']
    procedure WritePos(const Name: String; const Quantity: Currency;
      const Cost: Currency);

    procedure WriteSum(const SumCheck: Currency; const SumPay: Currency;
      const SumRest: Currency);

    procedure Payed;
    procedure Clear;
    procedure Init;

    function GetDisplay: THandle;
    procedure SetDisplay(const Value: THandle);
    property Display: THandle read GetDisplay write SetDisplay;

    function GetInitialized: Boolean;
    procedure SetInitialized(const Value: Boolean);
    property Initialized: Boolean read GetInitialized write SetInitialized;

    function GetComPort: Integer;
    procedure SetComPort(const Value: Integer);
    property ComPort: Integer read GetComPort write SetComPort;

    function GetErrorInInit: Boolean;
    procedure SetErrorInInit(const Value: Boolean);
    property ErrorInInit: Boolean read GetErrorInInit write SetErrorInInit;

    function GetSelf: Integer;
    property Self: Integer read GetSelf;
  end;

  //Базовый класс работы с дисплеем.
  TBaseDisplay = class(TObject, IBaseDisplay)
  private
    FCom: Integer;
    FInitialized: Boolean;
    FDisplay: THandle; //Handle COM порта дисплея
    FErrorInInit: Boolean;

    function GetSelf: Integer;
    function GetDisplay: THandle;
    procedure SetDisplay(const Value: THandle);
    function GetInitialized: Boolean;
    procedure SetInitialized(const Value: Boolean);
    function GetComPort: Integer;
    procedure SetComPort(const Value: Integer);
    function GetErrorInInit: Boolean;
    procedure SetErrorInInit(const Value: Boolean);
  public
    constructor Create;
    destructor Destroy; override;

    procedure WritePos(const Name: String; const Quantity: Currency;
      const Cost: Currency); virtual; abstract;

    procedure WriteSum(const SumCheck: Currency; const SumPay: Currency;
      const SumRest: Currency); virtual; abstract;

    procedure Payed; virtual; abstract;
    procedure Clear; virtual; abstract;
    procedure Init; virtual; abstract;

    property Display: THandle read GetDisplay write SetDisplay;
    property Initialized: Boolean read GetInitialized write SetInitialized;
    property ComPort: Integer read GetComPort write SetComPort;
    property ErrorInInit: Boolean read GetErrorInInit write SetErrorInInit;
    property Self: Integer read GetSelf;

    { IInterface }
    function QueryInterface(const IID: TGUID; out Obj): HResult; virtual; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  end;

  TDisplay = class(TObject)
  private
    FBaseDisplay: IBaseDisplay;
    procedure SetComPort(const Value: Integer);
  public
    constructor Create;
    destructor Destroy; override;

    procedure WritePos(const Name: String; const Quantity: Currency;
      const Cost: Currency);

    procedure WriteSum(const SumCheck: Currency; const SumPay: Currency;
      const SumRest: Currency);

    procedure Payed;
    procedure Clear;

    procedure Init(const AnActive: Boolean; AnType: Integer);
    property ComPort: Integer write SetComPort;
  end;


implementation

uses SysUtils, Pole_Display_Unit, TouchMessageBoxForm_Unit, Dialogs;

{ TBaseDisplay }

constructor TBaseDisplay.Create;
begin
  inherited;

  FDisplay := 0;
  FCom := 0;
  FInitialized := False;
  FErrorInInit := False;
end;

destructor TBaseDisplay.Destroy;
begin
  if FDisplay <> 0 then
    CloseHandle(FDisplay);

  inherited;
end;

function TBaseDisplay.GetComPort: Integer;
begin
  Result := FCom;
end;

function TBaseDisplay.GetDisplay: THandle;
begin
  Result := FDisplay;
end;

function TBaseDisplay.GetErrorInInit: Boolean;
begin
  Result := FErrorInInit;
end;

function TBaseDisplay.GetInitialized: Boolean;
begin
  Result := FInitialized;
end;

function TBaseDisplay.GetSelf: Integer;
begin
  Result := Integer(Self);
end;

function TBaseDisplay.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

procedure TBaseDisplay.SetComPort(const Value: Integer);
begin
  FCom := Value;
end;

procedure TBaseDisplay.SetDisplay(const Value: THandle);
begin
  FDisplay := Value;
end;

procedure TBaseDisplay.SetErrorInInit(const Value: Boolean);
begin
  FErrorInInit := Value;
end;

procedure TBaseDisplay.SetInitialized(const Value: Boolean);
begin
  FInitialized := Value;
end;

function TBaseDisplay._AddRef: Integer;
begin
  Result := -1;
end;

function TBaseDisplay._Release: Integer;
begin
  Result := -1;
end;

{ TDisplay }

procedure TDisplay.Clear;
begin
  if Assigned(FBaseDisplay) then
    FBaseDisplay.Clear;
end;

constructor TDisplay.Create;
begin
  inherited;

  FBaseDisplay := nil;
end;

destructor TDisplay.Destroy;
var
  Obj: TObject;
begin
  if Assigned(FBaseDisplay) then
  begin
    Obj := TObject(FBaseDisplay.Self);
    if Assigned(Obj) then
      FreeAndNil(Obj);
  end;
  inherited;
end;

procedure TDisplay.Init(const AnActive: Boolean; AnType: Integer);
begin
  if AnActive then
  begin
    case AnType of
      1:
      begin
        FBaseDisplay := TPoleDisplay.Create;
        try
          FBaseDisplay.Init;
        except
          on E: Exception do
           Touch_MessageBox('Внимание', 'Ошибка инициализации дисплея покупателя ' + E.Message, MB_OK, mtError);
        end;
      end;

    else
      Touch_MessageBox('Внимание', 'Данный тип дисплея не поддерживается', MB_OK, mtError);
    end;
  end;
end;

procedure TDisplay.Payed;
begin
  if Assigned(FBaseDisplay) then
    FBaseDisplay.Payed;
end;

procedure TDisplay.SetComPort(const Value: Integer);
begin
  if Assigned(FBaseDisplay) then
    FBaseDisplay.ComPort := Value;
end;

procedure TDisplay.WritePos(const Name: String; const Quantity,
  Cost: Currency);
begin
  if Assigned(FBaseDisplay) then
    FBaseDisplay.WritePos(Name, Quantity, Cost);
end;

procedure TDisplay.WriteSum(const SumCheck, SumPay, SumRest: Currency);
begin
  if Assigned(FBaseDisplay) then
    FBaseDisplay.WriteSum(SumCheck, SumPay, SumRest);
end;

end.
 