unit Base_FiscalRegister_unit;

{
  ������� ���������, ������� ��������� �-������ ������������
  ����������� ������������
}

interface

uses
  Classes, Windows, kbmMemTable, DB, Front_DataBase_Unit;

type
  IBaseFiscalRegister = interface
  ['{308C2D25-B5F7-4801-B8E4-F09E92B7AFBA}']
    // �������� ����������
    function CheckDeviceInfo: Boolean;
    // �������������
    function Init: Boolean;
    // ������ ����
    function PrintCheck(const Doc, DocLine, PayLine: TkbmMemTable): Boolean;

    // ��������� ������� ����
    procedure SetFrontBase(const Value: TFrontBase);
    function GetFrontBase: TFrontBase;
    property FrontBase: TFrontBase read GetFrontBase write SetFrontBase;

    //����� Z1 � ��������
    function PrintZ1ReportWithCleaning: Boolean;
    //����� Z2 � ��������
    function PrintZ2ReportWithCleaning: Boolean;
    //����� X1 ��� �������
    function PrintX1ReportWithOutCleaning: Boolean;
    //����� X2 ��� �������
    function PrintX2ReportWithOutCleaning: Boolean;
    procedure OpenDrawer;
    procedure EndSession;
    //������ � �����
    procedure MoneyIn;
    //������ �� �����
    procedure MoneyOut;
    function GetDocumentNumber: Integer;
    //������� ������
    procedure ErrMessage(Err: Integer);

    function Get_Self: Integer;    
    property Self: Integer read Get_Self;
  end;

var
  BaseFiscalRegister: IBaseFiscalRegister;

implementation


initialization
  BaseFiscalRegister := nil;

finalization

end.
