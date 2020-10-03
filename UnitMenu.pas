unit UnitMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, RxGrdCpt, ExtCtrls;

type
  TfrmMenu = class(TForm)
    btnPodrazd: TSpeedButton;
    btnRadioseti: TSpeedButton;
    btnAbonenti: TSpeedButton;
    btnRES: TSpeedButton;
    btnSequr: TSpeedButton;
    Timer1: TTimer;
    btnInfo: TSpeedButton;
    procedure btnRESClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure btnRadiosetiClick(Sender: TObject);
    procedure btnSequrClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnPodrazdClick(Sender: TObject);
    procedure btnAbonentiClick(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;
  old_width,old_height: integer;

implementation

{$R *.dfm}

uses UnitMain;

procedure TfrmMenu.btnRESClick(Sender: TObject);
begin
  frmMain.MnuRESClick(Sender);
  Close;
end;

procedure TfrmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmMain.mnuMenu.Enabled := true;
  Action :=caFree;
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
begin
  frmMain.mnuMenu.Enabled := false;
end;

procedure TfrmMenu.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
end;

procedure TfrmMenu.Timer1Timer(Sender: TObject);
var i:byte;
begin
 Timer1.Enabled := false;
  if frmMain.MnuConnect.Enabled then
  begin
   for i := 0 to frmMenu.ComponentCount - 1 do
    if frmMenu.Components[i] is TSpeedButton then
      (frmMenu.Components[i] as TSpeedButton).enabled := false;
  end
  else
   for i := 0 to frmMenu.ComponentCount - 1 do
    if frmMenu.Components[i] is TSpeedButton then
      (frmMenu.Components[i] as TSpeedButton).enabled := true;
  old_width := Width;
  old_height := Height;
end;

procedure TfrmMenu.btnRadiosetiClick(Sender: TObject);
begin
  frmMain.mnuRSetiClick(Sender);
  Close;
end;

procedure TfrmMenu.btnSequrClick(Sender: TObject);
begin
  frmMain.mnuSequrClick(Sender);
  Close;
end;

procedure TfrmMenu.FormResize(Sender: TObject);
begin
  Width := old_width;
  Height := old_height;
end;

procedure TfrmMenu.btnPodrazdClick(Sender: TObject);
begin
  frmMain.mnuPodrazdClick(Sender);
  Close;
end;

procedure TfrmMenu.btnAbonentiClick(Sender: TObject);
begin
  frmMain.mnuAbonentiClick(Sender);
  Close;
end;

procedure TfrmMenu.btnInfoClick(Sender: TObject);
begin
  frmMain.mnuInfoClick(Sender);
  Close;
end;

end.
