unit rfUtils_unit;

interface

uses
  Windows;

procedure RemoveWrongPassChar(var Key: Char);
function IsKeyCalculatorValid(const Key: Word): Boolean;
function WinExec32(Cmd: string; const CmdShow: Integer): Boolean;
function GetLocalComputerName: String;
function IPAddrToName(IPAddr : AnsiString): AnsiString;
function EqualPoints(const a, b: TPoint): Boolean;
// code from http://stackoverflow.com/questions/397934/writing-to-the-event-log-in-delphi
procedure WriteToEventLog(const Msg: string);

implementation

uses
  SysUtils, WinSock;

procedure WriteToEventLog(const Msg: string);
var
  h: THandle;
  ss: array [0..0] of PChar;
begin
  ss[0] := PChar(Msg);
  // uses local computer
  // source name
  h := RegisterEventSource(nil, 'RestFront');
  try
    if h <> 0 then
      ReportEvent(h,              // event log handle
            EVENTLOG_ERROR_TYPE,  // event type
            0,                    // category zero
            0,                    // event identifier
            nil,                  // no user security identifier
            1,                    // one substitution string
            0,                    // no data
            @ss,                  // pointer to string array
            nil);                 // pointer to data
  finally
    DeregisterEventSource(h);
  end;
end;

procedure RemoveWrongPassChar(var Key: Char);
begin
  if (Key = 'ж') or (Key = 'Ж') then
    Key := ';';
  if (Key = ',') or (Key = '.') then
    Key := '?';
end;

function IsKeyCalculatorValid(const Key: Word): Boolean;
begin
  Result := (Key in [8, 48..57, 96..105]);
end;

function WinExec32(Cmd: string; const CmdShow: Integer): Boolean;
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;

  procedure ResetMemory(out P; Size: Longint);
  begin
    if Size > 0 then
    begin
      Byte(P) := 0;
      FillChar(P, Size, 0);
    end;
  end;

begin
  ResetMemory(StartupInfo, SizeOf(TStartupInfo));
  ResetMemory(ProcessInfo, SizeOf(ProcessInfo));
  StartupInfo.cb := SizeOf(TStartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := CmdShow;
  UniqueString(Cmd);//in the Unicode version the parameter lpCommandLine needs to be writable
  Result := CreateProcess(nil, PChar(Cmd), nil, nil, False,
    NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo);
  if Result then
  begin
    WaitForInputIdle(ProcessInfo.hProcess, INFINITE);
    CloseHandle(ProcessInfo.hThread);
    CloseHandle(ProcessInfo.hProcess);
  end;
end;

function GetLocalComputerName: String;
var
  ComputerName: array[0..MAX_COMPUTERNAME_LENGTH + 1] of Char;
  ComputerNameSize: DWORD;
begin
  ComputerNameSize := SizeOf(ComputerName);
  if GetComputerName(ComputerName, ComputerNameSize) = BOOL(0) then
    Result := ''
  else
    Result := AnsiUpperCase(ComputerName);
end;

//inet_addr является устаревшей
function IPAddrToName(IPAddr : AnsiString): AnsiString;
var
  SockAddrIn: TSockAddrIn;
  HostEnt: PHostEnt;
  WSAData: TWSAData;
begin
  WSAData.wVersion := 0;
  WSAStartup(MAKEWORD(2, 2), WSAData);
  try
    SockAddrIn.sin_addr.s_addr:= inet_addr(PAnsiChar(IPAddr));
    HostEnt:= gethostbyaddr(@SockAddrIn.sin_addr.S_addr, 4, AF_INET);
    if HostEnt <> nil then
      Result := StrPas(Hostent^.h_name)
    else
      Result := '';
  finally
    if WSAData.wVersion = 2 then
      WSACleanup;
  end;
end;

function EqualPoints(const a, b: TPoint): Boolean; inline;
begin
  Result := (a.x = b.x) and (a.y = b.y);
end;

end.
