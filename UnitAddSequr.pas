unit UnitAddSequr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, UnitDM, MyDB, RxLookup;

type
  TfrmAddSequr = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Login: TLabeledEdit;
    Passw2: TLabeledEdit;
    Passw: TLabeledEdit;
    dostup: TComboBox;
    Label1: TLabel;
    Podrazd: TRxDBLookupCombo;
    Label2: TLabel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure PodrazdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddSequr: TfrmAddSequr;

implementation

{$R *.dfm}
uses UnitSequr, DB;
procedure TfrmAddSequr.FormCreate(Sender: TObject);
begin
  if not dostupAll_user then
  begin
    dostup.Items.Clear;
    dostup.Items.Add('Только чтение');
    Podrazd.Enabled := false;
    Podrazd.KeyValue := id_podrazd_user;
  end;
  dostup.ItemIndex := 0;
end;

procedure TfrmAddSequr.PodrazdKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_delete then Podrazd.Value := '';
end;

procedure TfrmAddSequr.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddSequr.BitBtn1Click(Sender: TObject);
var
  dost1: string;
  id__podrazd: integer;
label exiit;
begin
  if not dostupAll_user then goto exiit;
  case dostup.ItemIndex of
  0: dost1 := 'read';
  1: dost1 := 'all';
  end;
  if Podrazd.Value = '' then id__podrazd := 0
  else id__podrazd := Podrazd.KeyValue;
  if Passw2.Text<>Passw.Text then
  begin
    ShowMessage('Пароли не совпадают!');
    exit;
  end;
  if Passw2.Text = '' then
  begin
    ShowMessage('Пустой пароль не допустим!');
    exit;
  end;
  BitBtn1.Enabled := False;
  BitBtn2.Enabled := False;
  if EditFlagSequr then
  begin
    if dost1='all' then
    UpdateToTable('Sequr','id_user',frmSequr.GridSequr.DataSource.DataSet.FieldByName('id_user').AsString,['login','passwd','passw1',
     'dostup'],[Login.Text,Passw.Text,Passw2.text,dost1])
     else
    UpdateToTable('Sequr','id_user',frmSequr.GridSequr.DataSource.DataSet.FieldByName('id_user').AsString,['login','passwd','passw1',
     'dostup','id_podrazd'],[Login.Text,Passw.Text,Passw2.text,dost1,IntToStr(id__podrazd)])
  end
  else
  begin
    if dost1='all' then
    AddToTable('Sequr',['login','passwd','passw1','dostup'],[Login.Text,Passw.Text,Passw2.text,dost1])
     else
    AddToTable('Sequr',['login','passwd','passw1','dostup','id_podrazd'],
     [Login.Text,Passw.Text,Passw2.text,dost1,IntToStr(id__podrazd)]);
  end;
  exiit: Close;
end;

procedure TfrmAddSequr.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  if EditFlagSequr then
  begin
    Caption := 'Редактирование пользователя';
    Login.Text := frmSequr.GridSequr.DataSource.DataSet.FieldByName('login').AsString;
    Passw2.Text := frmSequr.GridSequr.DataSource.DataSet.FieldByName('passw1').AsString;
    Passw.Text := Passw2.Text;
    if frmSequr.GridSequr.DataSource.DataSet.FieldByName('dostup').AsString = 'all' then dostup.ItemIndex := 1
    else dostup.ItemIndex := 0;
    Podrazd.KeyValue := frmSequr.GridSequr.DataSource.DataSet.FieldByName('id_podrazd').AsInteger;
  end
end;

procedure TfrmAddSequr.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
end;

end.
