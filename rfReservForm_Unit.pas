unit rfReservForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrontForm_Unit, FrontData_Unit, Front_DataBase_Unit, ExtCtrls,
  AdvPanel, AdvSmoothButton, AdvSmoothTouchKeyBoard, StdCtrls, Mask, DBCtrls,
  DB, kbmMemTable;

type
  TReservForm = class(TBaseFrontForm)
    pnlMain: TAdvPanel;
    btnOK: TAdvSmoothButton;
    btnCancel: TAdvSmoothButton;
    MainTable: TkbmMemTable;
    dsMain: TDataSource;
    Label1: TLabel;
    dbeNumber: TDBEdit;
    AdvTouchKeyBoard: TAdvSmoothTouchKeyBoard;
    Label2: TLabel;
    DBEdit1: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReservForm: TReservForm;

implementation

{$R *.dfm}

end.
