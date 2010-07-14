unit Base_Display_unit;

interface

uses
  Windows;

type

  //Базовый класс работы с дисплеем.
  TBaseDisplay = class(TObject)
  private
    FCom: Integer;
    FInitialized: Boolean;
    FDisplay: THandle; //Handle COM порта дисплея
    FErrorInInit: Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    procedure WritePos(const Name: String; const Quantity: Currency;
      const Cost: Currency); virtual; abstract;

    procedure WriteSum(const SumCheck: Currency; const SumPay: Currency;
      const SumRest: Currency); virtual; abstract;

    procedure Payed; virtual; abstract;
    procedure Clear; virtual; abstract;

    property Display: THandle read FDisplay write FDisplay;
    property Initialized: Boolean read FInitialized write FInitialized;
    property ComPort: Integer read FCom write FCom;
    property ErrorInInit: Boolean read FErrorInInit write FErrorInInit;
  end;

implementation

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

end.
 