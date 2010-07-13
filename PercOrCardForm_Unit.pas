unit PercOrCardForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FrontData_Unit, ExtCtrls, AdvPanel, AdvSmoothButton;

type
  TPercOrCard = class(TForm)
    AdvPanel1: TAdvPanel;
    btnPercent: TAdvSmoothButton;
    btnCard: TAdvSmoothButton;
    procedure btnPercentClick(Sender: TObject);
    procedure btnCardClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FDiscountType: Integer;
    { Private declarations }
  public
    property DiscountType: Integer read FDiscountType write FDiscountType;
  end;

var
  PercOrCard: TPercOrCard;

implementation

{$R *.dfm}

procedure TPercOrCard.btnPercentClick(Sender: TObject);
begin
  FDiscountType := 1;
  ModalResult := mrOK;
end;

procedure TPercOrCard.btnCardClick(Sender: TObject);
begin
  FDiscountType := 2;
  ModalResult := mrOK;
end;

procedure TPercOrCard.FormCreate(Sender: TObject);
begin
  FDiscountType := 0;
end;

end.
