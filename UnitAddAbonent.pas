unit UnitAddAbonent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, RxLookup, UnitDM, MyDB, StdCtrls, ExtCtrls, DBLocalS;

type
  TfrmAddAbonent = class(TForm)
    cbPodrazdelenie: TRxDBLookupCombo;
    RxLabel5: TRxLabel;
    cbRES: TRxDBLookupCombo;
    RxLabel1: TRxLabel;
    ID: TEdit;
    RxLabel2: TRxLabel;
    NumAbon: TEdit;
    RxLabel3: TRxLabel;
    Status: TComboBox;
    RxLabel4: TRxLabel;
    Prim: TMemo;
    RxLabel6: TRxLabel;
    RadioSeti: TRxCheckListBox;
    RxLabel7: TRxLabel;
    ADD: TButton;
    Cancel: TButton;
    Timer1: TTimer;
    procedure cbPodrazdelenieKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure cbRESKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ADDClick(Sender: TObject);
    procedure cbRESChange(Sender: TObject);
    procedure cbPodrazdelenieChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddAbonent: TfrmAddAbonent;

implementation

{$R *.dfm}

uses UnitAbonent, DB, DBLocal, DBGrids;

var
  id_radioseti: array of integer;

procedure TfrmAddAbonent.cbPodrazdelenieKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_delete then cbPodrazdelenie.Value := '';
end;

procedure TfrmAddAbonent.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  AddToListFromDB(dm.Query,Status.Items,'abon_status','slAbonStatus');
  Status.ItemIndex := 0;
  DM.Query.Close;
  dm.Query.SQL.Text := 'select * from Radioseti';
  DM.Query.Open;
  with DM.Query do
  begin
    First;
    SetLength(Id_radioseti,0);
    RadioSeti.Items.Clear;
    while not Eof do
    begin
      RadioSeti.Items.Add(FieldByName('freq').AsString);
      SetLength(id_radioseti,length(id_radioseti)+1);
      id_radioseti[High(id_radioseti)] := FieldByName('id_radioseti').AsInteger;
      next;
    end;
    Close;
  end;
  if EditFlagAbon then
  begin
    frmAddAbonent.Caption := 'Редактирование абонента';
    cbPodrazdelenie.KeyValue := frmAbonent.GridAbonent.DataSource.DataSet.fieldByName('id_podrazd').AsInteger;
    cbRES.KeyValue := frmAbonent.GridAbonent.DataSource.DataSet.FieldByName('id_res').AsInteger;
    Status.ItemIndex := Status.Items.IndexOf(frmAbonent.GridAbonent.DataSource.DataSet.FieldByName('status').AsString);
    ID.Text := frmAbonent.GridAbonent.DataSource.DataSet.FieldByName('id').AsString;
    NumAbon.Text := frmAbonent.GridAbonent.DataSource.DataSet.FieldByName('abonent_num').AsString;
    Prim.Text := frmAbonent.GridAbonent.DataSource.DataSet.FieldByName('prim').AsString;

    with DM.Query do
    begin
      Close;
      SQL.Text := 'select * from abon_seti where id_abonent=' + frmAbonent.GridAbonent.DataSource.DataSet.FieldByName('id_abonent').AsString;
      Open;
      FindLast;
      if RecordCount > 0 then
      begin
        First;
        while not Eof do
        begin
          RadioSeti.Checked[FindIndex(FieldByName('id_radioseti').AsInteger,id_radioseti)] := true;
          next;
        end;
      end;
      Close;
    end;
  end;
end;

procedure TfrmAddAbonent.CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddAbonent.cbRESKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then cbRES.Value := '';
end;

procedure TfrmAddAbonent.ADDClick(Sender: TObject);
var
  Status_1, Podr_znach, Res_znach: string;
  i: LongWord;
label exiit;
begin
  if not dostupAll_user then goto exiit;

  ADD.Enabled := False;
  Cancel.Enabled := False;
  Status_1 := Status.Items[Status.itemIndex];
  if cbPodrazdelenie.Value = '' then Podr_znach := '' else Podr_znach := VarToStr(cbPodrazdelenie.KeyValue);
  if cbRES.Value = '' then Res_znach := '' else Res_znach := VarToStr(cbRES.KeyValue);

  if EditFlagAbon then
  begin
    UpdateToTable('Abonenti','id_abonent',frmAbonent.GridAbonent.DataSource.DataSet.FieldByName('id_abonent').AsString,
     ['id_podrazd','id_res','id','abonent_num','status','prim'],
     [Podr_znach,Res_znach,ID.text,NumAbon.text,Status_1,Prim.Lines.Text]);
    with DM.Query do
     begin
       Close;
       SQL.Text := 'Delete from abon_seti where id_abonent=' + frmAbonent.GridAbonent.DataSource.DataSet.FieldByName('id_abonent').AsString;
       ExecSQL;
       Close;
       if RadioSeti.Items.Count <> 0 then
         for i := 0 to RadioSeti.Items.Count - 1 do
         begin
           if RadioSeti.Checked[i] then AddToTable('Abon_seti',['id_abonent','id_radioseti'],
                                             [frmAbonent.GridAbonent.DataSource.DataSet.FieldByName('id_abonent').AsString,IntToStr(id_radioseti[i])]);
         end;
     end;
  end
  else
  begin
    AddToTable('Abonenti',['id_podrazd','id_res','id','abonent_num','status','prim'],
     [Podr_znach,Res_znach,ID.text,NumAbon.text,Status_1,Prim.Lines.Text]);
     frmAbonent.GridAbonent.DataSource.DataSet.Close;
     frmAbonent.GridAbonent.DataSource.DataSet.Open;
     //ищем только что добавленную запись и добавляем радиосети
     (frmAbonent.GridAbonent.DataSource.DataSet as TSQLClientDataSet).IndexFieldNames := 'id_abonent';
     Application.ProcessMessages;
     frmAbonent.GridAbonent.DataSource.DataSet.FindLast;
     if RadioSeti.Items.Count <> 0 then
         for i := 0 to RadioSeti.Items.Count - 1 do
         begin
           if RadioSeti.Checked[i] then AddToTable('Abon_seti',['id_abonent','id_radioseti'],
                                             [frmAbonent.GridAbonent.DataSource.DataSet.FieldByName('id_abonent').AsString,IntToStr(id_radioseti[i])]);
         end;
  end;
 exiit: Close;
end;

procedure TfrmAddAbonent.cbRESChange(Sender: TObject);
begin
  if cbRES.Value = '' then exit;
  cbPodrazdelenie.KeyValue := cbRES.LookupSource.DataSet.fieldByName('id_podrazd').AsString;
end;

procedure TfrmAddAbonent.cbPodrazdelenieChange(Sender: TObject);
begin
  if cbPodrazdelenie.Value = '' then begin
    cbRES.LookupSource.DataSet.Filtered := false;
  end
  else
  begin
    cbRES.LookupSource.DataSet.Filter := 'id_podrazd='+VarToStr(cbPodrazdelenie.KeyValue);
    cbRES.LookupSource.DataSet.Filtered := true;
    cbRES.Value := '';
  end;
end;

procedure TfrmAddAbonent.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.TblRES.Filter := '';
  DM.TblRES.Filtered := false;
end;

procedure TfrmAddAbonent.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
end;

end.
