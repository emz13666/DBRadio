unit UnitSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, RxCombos, UnitDM, MyDB,
  Spin;

type
  TfrmSetup = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    btOK: TBitBtn;
    btCancel: TBitBtn;
    ColorDialog1: TColorDialog;
    BtColorPreduprEndRazrFon: TSpeedButton;
    ColorPreduprEndRazrFon: TImage;
    Label1: TLabel;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    ColorEndRazrFon: TImage;
    BtColorEndRazrFon: TSpeedButton;
    BtColorDefaultFon: TSpeedButton;
    ColorDefaultFon: TImage;
    Label3: TLabel;
    Label4: TLabel;
    ColorPreduprEndRazrText: TImage;
    BtColorPreduprEndRazrText: TSpeedButton;
    Label5: TLabel;
    ColorEndRazrText: TImage;
    BtColorEndRazrText: TSpeedButton;
    Label6: TLabel;
    ColorDefaultText: TImage;
    BtColorDefaultText: TSpeedButton;
    Label7: TLabel;
    ColorDefaultSelectedText: TImage;
    BtColorDefaultSelectedText: TSpeedButton;
    BtColorDefaultSelectedFon: TSpeedButton;
    ColorDefaultSelectedFon: TImage;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Date_PreduprEndRazr: TSpinEdit;
    Label11: TLabel;
    Date_endRazr: TSpinEdit;
    Label12: TLabel;
    TabSheet3: TTabSheet;
    CheckBox1: TCheckBox;
    BitBtn1: TBitBtn;
    btColorSpisRes_fon: TSpeedButton;
    ColorSpisRES_fon: TImage;
    Label13: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btCancelClick(Sender: TObject);
    procedure BtColorPreduprEndRazrFonClick(Sender: TObject);
    procedure BtColorPreduprEndRazrTextClick(Sender: TObject);
    procedure BtColorEndRazrFonClick(Sender: TObject);
    procedure BtColorEndRazrTextClick(Sender: TObject);
    procedure BtColorDefaultFonClick(Sender: TObject);
    procedure BtColorDefaultTextClick(Sender: TObject);
    procedure BtColorDefaultSelectedFonClick(Sender: TObject);
    procedure BtColorDefaultSelectedTextClick(Sender: TObject);
    procedure btOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btColorSpisRes_fonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetup: TfrmSetup;

implementation

{$R *.dfm}

procedure TfrmSetup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSetup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

procedure TfrmSetup.btCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSetup.BtColorPreduprEndRazrFonClick(Sender: TObject);
begin
  ColorDialog1.Execute;
  with ColorPreduprEndRazrFon do
  begin
    Canvas.Brush.Color := ColorDialog1.Color;
    Canvas.FillRect(Rect(0,0,Width,Height));
  end;
end;

procedure TfrmSetup.BtColorPreduprEndRazrTextClick(Sender: TObject);
begin
  ColorDialog1.Execute;
  with ColorPreduprEndRazrText do
  begin
    Canvas.Brush.Color := ColorDialog1.Color;
    Canvas.FillRect(Rect(0,0,Width,Height));
  end;
end;

procedure TfrmSetup.BtColorEndRazrFonClick(Sender: TObject);
begin
  ColorDialog1.Execute;
  with ColorEndRazrFon do
  begin
    Canvas.Brush.Color := ColorDialog1.Color;
    Canvas.FillRect(Rect(0,0,Width,Height));
  end;
end;

procedure TfrmSetup.BtColorEndRazrTextClick(Sender: TObject);
begin
  ColorDialog1.Execute;
  with ColorEndRazrText do
  begin
    Canvas.Brush.Color := ColorDialog1.Color;
    Canvas.FillRect(Rect(0,0,Width,Height));
  end;
end;

procedure TfrmSetup.BtColorDefaultFonClick(Sender: TObject);
begin
  ColorDialog1.Execute;
  with ColorDefaultFon do
  begin
    Canvas.Brush.Color := ColorDialog1.Color;
    Canvas.FillRect(Rect(0,0,Width,Height));
  end;
end;

procedure TfrmSetup.BtColorDefaultTextClick(Sender: TObject);
begin
  ColorDialog1.Execute;
  with ColorDefaultText do
  begin
    Canvas.Brush.Color := ColorDialog1.Color;
    Canvas.FillRect(Rect(0,0,Width,Height));
  end;
end;

procedure TfrmSetup.BtColorDefaultSelectedFonClick(Sender: TObject);
begin
  ColorDialog1.Execute;
  with ColorDefaultSelectedFon do
  begin
    Canvas.Brush.Color := ColorDialog1.Color;
    Canvas.FillRect(Rect(0,0,Width,Height));
  end;
end;

procedure TfrmSetup.BtColorDefaultSelectedTextClick(Sender: TObject);
begin
  ColorDialog1.Execute;
  with ColorDefaultSelectedText do
  begin
    Canvas.Brush.Color := ColorDialog1.Color;
    Canvas.FillRect(Rect(0,0,Width,Height));
  end;
end;

procedure TfrmSetup.btOKClick(Sender: TObject);
begin
  Color_EndRazrFon := ColorEndRazrFon.Canvas.Brush.Color;
  Color_SpisRESFon := ColorSpisRES_fon.Canvas.Brush.Color;
  Color_EndRazrText := ColorEndRazrText.Canvas.Brush.Color;
  Color_PreduprEndRazrFon := ColorPreduprEndRazrFon.Canvas.Brush.Color;
  Color_PreduprEndRazrText := ColorPreduprEndRazrText.Canvas.Brush.Color;
  Color_DefaultFon := ColorDefaultFon.Canvas.Brush.Color;
  Color_DefaultText := ColorDefaultText.Canvas.Brush.Color;
  Color_DefaultSelectedFon := ColorDefaultSelectedFon.Canvas.Brush.Color;
  Color_DefaultSelectedText := ColorDefaultSelectedText.Canvas.Brush.Color;
  DatePreduprEndRazr := Date_PreduprEndRazr.Value;
  DateEndRazr := Date_endRazr.Value;
  Auto_Login := CheckBox1.Checked;
  SaveColorAdnDateToRegistry;
  SaveAutologinToRegistry;
  Close;
end;

procedure TfrmSetup.FormCreate(Sender: TObject);
begin
  Date_PreduprEndRazr.Value := DatePreduprEndRazr;
  Date_endRazr.Value := DateEndRazr;
  CheckBox1.Checked := Auto_Login;
  with ColorEndRazrFon do
  begin
    Canvas.Brush.Color := Color_EndRazrFon;
    Canvas.FillRect(Rect(0,0,Width,Height));
  end;

  with ColorSpisRES_fon do
  begin
    Canvas.Brush.Color := Color_SpisRESFon;
    Canvas.FillRect(Rect(0,0,Width,Height));
  end;

  with ColorEndRazrText do
  begin
    Canvas.Brush.Color := Color_EndRazrText;
    Canvas.FillRect(Rect(0,0,Width,Height));
  end;
  with ColorPreduprEndRazrFon do
  begin
    Canvas.Brush.Color := Color_PreduprEndRazrFon;
    Canvas.FillRect(Rect(0,0,Width,Height));
  end;
  with ColorPreduprEndRazrText do
  begin
    Canvas.Brush.Color := Color_PreduprEndRazrText;
    Canvas.FillRect(Rect(0,0,Width,Height));
  end;
  with ColorDefaultFon do
  begin
    Canvas.Brush.Color := Color_DefaultFon;
    Canvas.FillRect(Rect(0,0,Width,Height));
  end;
  with ColorDefaultText do
  begin
    Canvas.Brush.Color := Color_DefaultText;
    Canvas.FillRect(Rect(0,0,Width,Height));
  end;
  with ColorDefaultSelectedText do
  begin
    Canvas.Brush.Color := Color_DefaultSelectedText;
    Canvas.FillRect(Rect(0,0,Width,Height));
  end;
  with ColorDefaultSelectedFon do
  begin
    Canvas.Brush.Color := Color_DefaultSelectedFon;
    Canvas.FillRect(Rect(0,0,Width,Height));
  end;
end;

procedure TfrmSetup.BitBtn1Click(Sender: TObject);
begin
    Color_EndRazrFon := $c080ff;
    Color_SpisRESFon := clGray;
    Color_EndRazrText := clBlack;
    Color_PreduprEndRazrFon := clYellow;
    Color_PreduprEndRazrText := clBlue;
    Color_DefaultFon := clWhite;
    Color_DefaultText := clBlack;
    Color_DefaultSelectedFon := clBlack;
    Color_DefaultSelectedText := clWhite;
    DatePreduprEndRazr := 60; {предупреждать за 60 дней}
    DateEndRazr := 10;        {окончание разрешения - индикатор срабатывает за 10 дней}
    Auto_Login := False;
    FormCreate(Sender);
    PageControl1.ActivePage := TabSheet1;
    Application.ProcessMessages;
    if  DelDBRadioFromRegistry then ShowMessage('Установлены настройки по умолчанию.');
    SaveColorAdnDateToRegistry;
    SaveAutologinToRegistry;
    saveVersionToRegistry;
end;

procedure TfrmSetup.btColorSpisRes_fonClick(Sender: TObject);
begin
  ColorDialog1.Execute;
  with ColorSpisRES_fon do
  begin
    Canvas.Brush.Color := ColorDialog1.Color;
    Canvas.FillRect(Rect(0,0,Width,Height));
  end;
end;

end.
