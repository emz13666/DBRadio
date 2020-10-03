unit UnitAddPodrazd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TfrmAddPodrazd = class(TForm)
    name: TLabeledEdit;
    Dolg_otv: TLabeledEdit;
    FIO_otv: TLabeledEdit;
    Tel_otv: TLabeledEdit;
    Label1: TLabel;
    Prim: TMemo;
    btOK: TBitBtn;
    btCancel: TBitBtn;
    Timer1: TTimer;
    procedure btOKClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddPodrazd: TfrmAddPodrazd;

implementation

{$R *.dfm}

uses UnitPodrazd, UnitDM, MyDB;

procedure TfrmAddPodrazd.btOKClick(Sender: TObject);
label exiit;
begin
  if not dostupAll_user then goto exiit;
  btOK.Enabled := False;
  btCancel.Enabled := False;
  if EditFlagPodrazd then
  begin
   UpdateToTable('Podrazd','id_podrazd',DM.TblPodrazdid_podrazd.AsString,
      ['name','dolg_otv','fio_otv','teleph_otv','prim'],
      [name.text,Dolg_otv.Text,FIO_otv.Text,Tel_otv.Text,Prim.Lines.Text]);

  end
  else
  begin
    AddToTable('Podrazd',['name','dolg_otv','fio_otv','teleph_otv','prim'],
      [name.text,Dolg_otv.Text,FIO_otv.Text,Tel_otv.Text,Prim.Lines.Text]);
  end;
exiit:  Close;
end;

procedure TfrmAddPodrazd.btCancelClick(Sender: TObject);
begin
Close;
end;

procedure TfrmAddPodrazd.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  if EditFlagPodrazd then
  begin
    Caption := 'Редактирование подразделения';
    name.Text := DM.TblPodrazdname.AsString;
    Dolg_otv.Text := DM.TblPodrazddolg_otv.AsString;
    FIO_otv.Text := DM.TblPodrazdfio_otv.AsString;
    Tel_otv.Text := DM.TblPodrazdteleph_otv.AsString;
    Prim.Lines.Text := DM.TblPodrazdprim.AsString;
  end
end;

procedure TfrmAddPodrazd.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
end;

end.
