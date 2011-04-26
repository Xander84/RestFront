unit rfUtils_unit;

interface

procedure RemoveWrongPassChar(var Key: Char);
function WinExec32(Cmd: string; const CmdShow: Integer): Boolean;
function GetLocalComputerName: String;
function IPAddrToName(IPAddr : AnsiString): AnsiString;

implementation

uses
  Windows, SysUtils, WinSock;

procedure RemoveWrongPassChar(var Key: Char);
begin
  if (Key = 'ж') or (Key = 'Ж') then
    Key := ';';
  if (Key = ',') or (Key = '.') then
    Key := '?';
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

end.
