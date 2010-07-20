unit Base_FiscalRegister_unit;

{
  базовый интерфейс, который реальзует ф-ционал абстрактного
  фискального регистратора
}

interface

uses
  Classes, Windows, kbmMemTable, DB, Front_DataBase_Unit;

type
  IBaseFiscalRegister = interface
  ['{308C2D25-B5F7-4801-B8E4-F09E92B7AFBA}']
    // Проверка устройства
    function CheckDeviceInfo: Boolean;
    // Инициализация
    function Init: Boolean;
    // Печать чека
    function PrintCheck(const Doc, DocLine, PayLine: TkbmMemTable): Boolean;

    // Установка рабочей базы
    procedure SetFrontBase(const Value: TFrontBase);
    function GetFrontBase: TFrontBase;
    property FrontBase: TFrontBase read GetFrontBase write SetFrontBase;

    //отчет Z1 с гашением
    function PrintZ1ReportWithCleaning: Boolean;
    //отчет Z2 с гашением
    function PrintZ2ReportWithCleaning: Boolean;
    //отчет X1 без гашения
    function PrintX1ReportWithOutCleaning: Boolean;
    //отчет X2 без гашения
    function PrintX2ReportWithOutCleaning: Boolean;
    procedure OpenDrawer;
    procedure EndSession;
    //деньги в кассу
    procedure MoneyIn;
    //деньги из кассы
    procedure MoneyOut;
    function GetDocumentNumber: Integer;
    //возврат ошибки
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
