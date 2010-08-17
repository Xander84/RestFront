unit Pole_Display_Unit;

interface

uses
  Base_Display_unit, Windows, SysUtils;

type
  // Ñòàíäàðòíûé äèñïëåé äëÿ COM ïîðòà.
  TPoleDisplay = class(TBaseDisplay)
  private
    procedure Init;
    procedure WriteSingleByte(const Param: Byte);
    procedure WriteString(const S: String);
  public
    destructor Destroy; override;

    procedure WritePos(const Name: String; const Quantity: Currency;
      const Cost: Currency); override;
    procedure WriteSum(const SumCheck: Currency; const SumPay: Currency;
      const SumRest: Currency); override;

    procedure Payed; override;
    procedure Clear; override;

    property ComPort;
    property Initialized;
    property Display;
  end;

implementation

{ TPoleDisplay }

function StrAnsiToOem(const S: AnsiString): AnsiString;
begin
  SetLength(Result, Length(S));
  AnsiToOemBuff(@S[1], @Result[1], Length(S));
end;

procedure TPoleDisplay.Clear;
begin
  if Initialized then
  begin
    WriteSingleByte(27);
    WriteSingleByte(64);

    WriteSingleByte(27);
    WriteSingleByte(116);
    WriteSingleByte(6);

    WriteSingleByte(12);
    WriteSingleByte(11);
  end;
end;

destructor TPoleDisplay.Destroy;
begin
  Clear;
  inherited;
end;

procedure TPoleDisplay.Init;
var
  dcb: TDCB;
begin
  if (not Initialized) and (not ErrorInInit) then
  begin
    Initialized := False;
    try
      try
        Display := CreateFile(PChar('COM' + IntToStr(ComPort)), GENERIC_READ or GENERIC_WRITE, 0, nil, OPEN_EXISTING, 0, 0);
        if Display = INVALID_HANDLE_VALUE then
          raise Exception.Create('Error opening port');
        if not SetCommMask(Display, EV_RXCHAR) then
          raise Exception.Create('Error setting port mask');
        if not GetCommState(Display, Dcb) then
          raise Exception.Create('Error setting port state');
        Dcb.BaudRate := CBR_9600;
        Dcb.Parity := NOPARITY;
        Dcb.ByteSize := 8;
        Dcb.StopBits := ONESTOPBIT;
        if not SetCommState(Display, Dcb)then
          raise Exception.Create('Error setting port state');

        if not PurgeComm(Display, PURGE_TXCLEAR or PURGE_RXCLEAR) then
          raise Exception.Create('Error purging port');

        WriteSingleByte(27);
        WriteSingleByte(64);

        WriteSingleByte(27);
        WriteSingleByte(116);
        WriteSingleByte(6);
      except
        ErrorInInit := True;
        Display := 0;
        raise;
      end;
    finally
      Initialized := True;
    end;
  end;
  Clear;
end;

procedure TPoleDisplay.Payed;
begin
  Init;
  if Initialized then
    WriteString('ÎÏËÀ×ÅÍÎ');
end;

procedure TPoleDisplay.WritePos(const Name: String; const Quantity,
  Cost: Currency);
var
  LastLen: Integer;
  WS, S: String;
begin
  Init;
  if Initialized then
  begin
    LastLen := 20;
    WriteString(Copy(Name, 1, LastLen));
    WriteSingleByte(10);
    WriteSingleByte(13);

    WS := CurrToStr(Quantity) + 'x ';
    S := CurrToStr(Cost);
    LastLen := 20 - Length(S);
    while Length(WS) < LastLen do
      WS := WS + ' ';

    WS := WS + S;
    WriteString(WS);
  end;
end;

procedure TPoleDisplay.WriteSum(const SumCheck, SumPay, SumRest: Currency);
var
  LastLen: Integer;
  WS, S: String;
begin
  Init;
  if Initialized then
  begin
    WS := 'ÑÓÌÌÀ:';
    S := CurrToStr(SumCheck);
    LastLen := 20 - Length(S);
    while Length(WS) < LastLen do
      WS := WS + ' ';

    WS := WS + S;
    WriteString(WS);
    WriteSingleByte(10);
    WriteSingleByte(13);

    WS := 'ÑÄÀ×À:';
    S := CurrToStr(SumRest);
    LastLen := 20 - Length(S);
    while Length(WS) < LastLen do
      WS := WS + ' ';

    WS := WS + S;
    WriteString(WS);
  end;
end;

procedure TPoleDisplay.WriteSingleByte(const Param: Byte);
var
  dwWrite: DWORD;
begin
  if Display > 0 then
  begin
    WriteFile(Display, Param, SizeOf(Param), dwWrite, nil);
  end;
end;

procedure TPoleDisplay.WriteString(const S: String);
var
  OemStr: String;
  I: Integer;
begin
  if Display > 0 then
  begin
    OemStr := StrAnsiToOem(S);
    for I := 1 to Length(OemStr) do
      WriteSingleByte(Ord(OemStr[I]));
  end;    
end;

end.
