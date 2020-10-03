unit UnitAuth;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Placemnt, Registry, MyDB;

type
  TfrmAuth = class(TForm)
    btOK: TButton;
    btCancel: TButton;
    Login: TLabeledEdit;
    Passw: TLabeledEdit;
    Host: TLabeledEdit;
    FormStorage1: TFormStorage;
    CheckBox1: TCheckBox;
    Timer1: TTimer;
    procedure btOKClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAuth: TfrmAuth;
  FlSavePass: boolean = false;

implementation

uses UnitDM, DB, SqlExpr;

{$R *.dfm}

procedure TfrmAuth.btOKClick(Sender: TObject);
var
  res: integer;
  reestr: TRegistry;
begin
  try
    DM.DBConnection.LoadParamsOnConnect := false;
    DM.DBConnection.Params.Values['HostName'] := Host.Text;
    DM.DBConnection.Open;
    DM.DBConnection.Close;
  except
    MessageDlg('Нет доступа к серверу.',mtError,[mbOK],0);
    ModalResult := mrNone;
    exit;
  end;
  DM.DBConnection.Open;
  reestr := TRegistry.Create;
  reestr.RootKey := HKEY_CURRENT_USER;
  try
  if reestr.OpenKey('SOFTWARE\DBRadio\0', False) then
  begin
    if FlSavePass then
    begin
      if reestr.ValueExists('dfjkol') then
      begin
        if reestr.ReadString('dfjkol') <> crpt(Passw.Text) then
          reestr.WriteString('dfjkol', crpt(Passw.Text));
      end
      else reestr.WriteString('dfjkol', crpt(Passw.Text));
    end
    else
    begin
      if reestr.ValueExists('dfjkol') then reestr.DeleteValue('dfjkol');
    end
  end;
  finally
  reestr.CloseKey;
  reestr.Free;
  end;
  with DM.Query do
  begin
    Close;
    SQL.Text := 'select * from sequr where login="' +
                 Login.Text + '" and passwd = password("' + Passw.Text + '")';
    Open;
    FindLast;
    res := RecordCount;
    if res = 1 then
    begin
      First;
      id_user := FieldByName('id_user').AsInteger;
      user_name := fieldByName('login').AsString;
      if FieldByName('dostup').AsString = 'read' then dostupAll_user := false else dostupAll_user := true;
      id_podrazd_user := fieldByName('id_podrazd').AsInteger;
      counter_user := fieldByName('counter').AsInteger;
    end;
    Close;
    DM.DBConnection.Close;
    if res = 1 then frmAuth.ModalResult := mrOk else frmAuth.ModalResult := mrCancel;
  end;
end;

procedure TfrmAuth.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then btOKClick(Sender);
  if key=vk_escape then ModalResult := mrAbort;
end;

procedure TfrmAuth.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  if FlSavePass then begin btOKClick(sender); end;
end;

procedure TfrmAuth.CheckBox1Click(Sender: TObject);
begin
  FlSavePass := CheckBox1.Checked;
end;

procedure TfrmAuth.btCancelClick(Sender: TObject);
begin
  ModalResult := mrAbort;
end;

end.
