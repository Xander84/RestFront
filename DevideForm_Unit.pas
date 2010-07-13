unit DevideForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OrderNumber_Unit, StdCtrls, AdvSmoothButton,
  AdvSmoothTouchKeyBoard, ExtCtrls, AdvPanel;

type
  TDevideForm = class(TOrderNumber)
  private
    { Private declarations }
  public
    property Number;
  end;

var
  DevideForm: TDevideForm;

implementation

{$R *.dfm}

end.
