unit UnitAbout;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, jpeg, UnitDM;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Image2: TImage;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Image2DblClick(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

procedure TAboutBox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TAboutBox.OKButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TAboutBox.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_return)or(Key = VK_ESCAPE) then Close;
end;

procedure TAboutBox.FormCreate(Sender: TObject);
begin
  Label1.Caption := VersionDBRadio;
  Label3.Caption := DateOfRelease;
end;

procedure TAboutBox.Image2DblClick(Sender: TObject);
begin
  Image1.Visible := not Image1.Visible;
  Image2.Visible := not Image2.Visible;
end;

procedure TAboutBox.Image1DblClick(Sender: TObject);
begin
  Image1.Visible := not Image1.Visible;
  Image2.Visible := not Image2.Visible;
end;

procedure TAboutBox.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  if Image2.Width = 76 then
  begin
    Image2.Width := 166;
    Image2.Height := 153;
  end
  else
  begin
    Image2.Width := 76;
    Image2.Height := 70;
  end;
  Application.ProcessMessages;
end;

end.

