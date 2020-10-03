unit UnitAddRES;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, MyDB, Mask, ToolEdit, RxLookup, RXCtrls,
  CurrEdit, ExtCtrls, DBLocalS, Buttons, UEditRSeti_in_RES;

type
  TfrmAddRES = class(TForm)
    cbType: TComboBox;
    Place_install: TEdit;
    Marka: TComboBox;
    btNew_marka: TButton;
    Serial_num: TEdit;
    Date_vipusk: TDateTimePicker;
    Date_vvoda: TDateTimePicker;
    Num_razr: TEdit;
    Date_end_razr: TDateTimePicker;
    Status: TComboBox;
    Prim: TMemo;
    ADD: TButton;
    Cancel: TButton;
    AktSpis: TFilenameEdit;
    cbPodrazdelenie: TRxDBLookupCombo;
    RadioSeti: TRxCheckListBox;
    GroupBox1: TGroupBox;
    Vis_ant: TRxCalcEdit;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel8: TRxLabel;
    RxLabel9: TRxLabel;
    RxLabel10: TRxLabel;
    power: TRxCalcEdit;
    RxLabel11: TRxLabel;
    RxLabel12: TRxLabel;
    RxLabel14: TRxLabel;
    RxLabel15: TRxLabel;
    RxLabel16: TRxLabel;
    Shirota: TEdit;
    Label1: TLabel;
    Timer1: TTimer;
    IsAbonNum: TCheckBox;
    GroupBox2: TGroupBox;
    RxLabel13: TRxLabel;
    ID: TEdit;
    AbonNum: TEdit;
    RxLabel17: TRxLabel;
    RxLabel18: TRxLabel;
    Dolgota: TEdit;
    RxLabel19: TRxLabel;
    RxLabel20: TRxLabel;
    Inv_number: TEdit;
    RxLabel21: TRxLabel;
    pozivnoi: TEdit;
    RxLabel22: TRxLabel;
    Klass_izl: TEdit;
    EditRSeti: TBitBtn;
    ProtIzm: TFilenameEdit;
    Label2: TLabel;
    Vis_ant_ocean: TRxCalcEdit;
    RxLabel23: TRxLabel;
    procedure powerKeyPress(Sender: TObject; var Key: Char);
    procedure ADDClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure btNew_markaClick(Sender: TObject);
    procedure cbTypeChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure IsAbonNumClick(Sender: TObject);
    procedure cbPodrazdelenieKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure EditRSetiClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddRES: TfrmAddRES;
  NewMarka: String;
  id__res: string;
  Flag_copy: boolean = false;
var
  id_radioseti: array of integer;

implementation

uses UnitDM, UnitNewRecord, UnitProgress, UnitRes, DB, DBClient, SqlExpr;
{$R *.dfm}

procedure TfrmAddRES.powerKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ',' then Key := '.';
  if not (Key in ['0','1','2','3','4','5','6','7','8','9','.']) then Key := #0;
end;

procedure TfrmAddRES.ADDClick(Sender: TObject);
var
  Status_1: string;
  extension, s: string;
  i: LongWord;
  power1,vis_antenni, vis__ant_ocean: string;
  frequency1: string;

  data: TMemoryStream;
  b1: byte;
  re: TSearchRec;
label exiit;
begin
  if not dostupAll_user then goto exiit;
  //проверка уникальности серийного номера РЭС
  if not EditFlagRES then
  begin
    dm.Query.Close;
    DM.Query.SQL.Text := 'select id_res from res where serial_num='''+Serial_num.Text+'''';
    DM.Query.Open;
    if not DM.Query.IsEmpty then
    begin
      DM.Query.Close;
      MessageDlg('РЭС с таким серийным номером уже есть в базе данных.',mtError,[mbOK],0);
      Serial_num.SetFocus;
      exit;
    end;
    dm.Query.Close;
  end;

  ADD.Enabled := False;
  Cancel.Enabled := False;
  Status_1 := Status.Items[Status.itemIndex];
  power1 := StringReplace(power.Text,',','.',[rfReplaceAll]);
  vis_antenni := StringReplace(Vis_ant.Text,',','.',[rfReplaceAll]);
  vis__ant_ocean := StringReplace(Vis_ant_ocean.Text,',','.',[rfReplaceAll]);



  if EditFlagRES then
  begin
     if (AktSpis.Text <> 'Есть')and(AktSpis.Text <> 'Нет') then
     begin
       if AktSpis.Text <> '' then
       begin
                  FindFirst(AktSpis.FileName,faAnyFile,re);
                  if (re.Size > 3*1024*1024) then
                  begin
                    ShowMessage('Слишком большой файл акта списания.'#13'Размер файла не должен превышать 3 МБ');
                    exit
                  end;
                  extension := ExtractFileExt(AktSpis.FileName);
                  data := TMemoryStream.Create;
                  data.LoadFromFile(AktSpis.FileName);
                  data.Seek(0,soFromBeginning);
                  s := '0x';
                  frmProgress.Show;
                  frmProgress.Indicator.Progress := 0;
                  frmProgress.Indicator.MaxValue := data.Size;
                  for i := 0 to data.Size - 1 do
                  begin
                    data.Read(b1,1);
                    s := s+ inttohex(b1,2);
                    frmProgress.Indicator.Progress := frmProgress.Indicator.Progress + 1;
                    Application.ProcessMessages;
                  end;
                    data.Free;
                    frmProgress.Hide;
                 if CountRecordInMySQLTable(DM.Query,'id_res',id__res,'Files')=1 then
                  UpdateToFilesTable('Files','id_res',id__res,['extension','data'],[extension,s])
                  else
                  AddFilesToTable('Files',['id_res','extension','data'],[id__res,extension,s]);
       end
       else
       begin
         DeleteFromTable('Files','id_res',id__res,false);
       end;
     end;

     if (ProtIzm.Text <> 'Есть')and(ProtIzm.Text <> 'Нет') then
     begin
       if ProtIzm.Text <> '' then
       begin
                  FindFirst(ProtIzm.FileName,faAnyFile,re);
                  if (re.Size > 3*1024*1024) then
                  begin
                    ShowMessage('Слишком большой файл протокола измерений.'#13'Размер файла не должен превышать 3 МБ');
                    exit
                  end;
                  extension := ExtractFileExt(ProtIzm.FileName);
                  data := TMemoryStream.Create;
                  data.LoadFromFile(ProtIzm.FileName);
                  data.Seek(0,soFromBeginning);
                  s := '0x';
                  frmProgress.Show;
                  frmProgress.Indicator.Progress := 0;
                  frmProgress.Indicator.MaxValue := data.Size;
                  for i := 0 to data.Size - 1 do
                  begin
                    data.Read(b1,1);
                    s := s+ inttohex(b1,2);
                    frmProgress.Indicator.Progress := frmProgress.Indicator.Progress + 1;
                    Application.ProcessMessages;
                  end;
                    data.Free;
                    frmProgress.Hide;
                 if CountRecordInMySQLTable(DM.Query,'id_res',id__res,'FilesProtIzm')=1 then
                  UpdateToFilesTable('FilesProtIzm','id_res',id__res,['extension','data'],[extension,s])
                  else
                  AddFilesToTable('FilesProtIzm',['id_res','extension','data'],[id__res,extension,s]);
       end
       else
       begin
         DeleteFromTable('FilesProtIzm','id_res',id__res,false);
       end;
     end;

    if cbPodrazdelenie.Value = '' then
    UpdateToTable('RES','id_res',id__res,['id_podrazd','type','place_install','marka','serial_num','power',
     'date_vipusk','date_vvoda','num_razr_res','date_end_razr','status','inv_number','pozivnoi','klass_izluch'],
     ['',cbType.Items[cbType.itemindex],Place_install.text,Marka.Items[Marka.itemindex],
      Serial_num.text,power1,FormatDateTime('yyyy-MM-dd',Date_vipusk.Date),
      FormatDateTime('yyyy-MM-dd',Date_vvoda.Date),Num_razr.text,FormatDateTime('yyyy-mm-dd',Date_end_razr.Date),
      Status_1,Inv_number.text,pozivnoi.text,Klass_izl.text])
     else
    UpdateToTable('RES','id_res',id__res,['id_podrazd','type','place_install','marka','serial_num','power',
     'date_vipusk','date_vvoda','num_razr_res','date_end_razr','status','inv_number','pozivnoi','klass_izluch'],
     [VarToStr(cbPodrazdelenie.KeyValue),cbType.Items[cbType.itemindex],Place_install.text,Marka.Items[Marka.itemindex],
      Serial_num.text,power1,FormatDateTime('yyyy-MM-dd',Date_vipusk.Date),
      FormatDateTime('yyyy-MM-dd',Date_vvoda.Date),Num_razr.text,FormatDateTime('yyyy-MM-dd',Date_end_razr.Date),
      Status_1,Inv_number.text,pozivnoi.text,Klass_izl.text]);

     with DM.Query do
     begin
       Close;
       SQL.Text := 'Delete from RES_seti where id_res=' + id__res;
       ExecSQL;
       Close;
       frequency1 := '';
       if RadioSeti.Items.Count <> 0 then
       begin
         for i := 0 to RadioSeti.Items.Count - 1 do
         begin
           if RadioSeti.Checked[i] then
           begin
            AddToTable('RES_seti',['id_res','id_radioseti'],[id__res,IntToStr(id_radioseti[i])]);
            frequency1 := frequency1 + RadioSeti.Items[i] + '; ';
           end;
         end;
         UpdateToTable('RES','id_res',id__res,['Frequency'],[frequency1]);
       end;
     end;

     with DM.Query do
     begin
       Close;
       SQL.Text := 'Delete from Par_base_station where id_res=' + id__res;
       ExecSQL;
       Close;
     end;

     if GroupBox1.Visible then
     begin
       if Null_Query(DM.Query,'Par_base_station','id_res='+id__res) then
        AddToTable('Par_base_station',['id_res','shirota','dolgota','visota_anten','vis_anten_ocean'],[id__res,
           Shirota.text,Dolgota.text,vis_antenni,vis__ant_ocean])
       else
        UpdateToTable('Par_base_station','id_res',id__res,['shirota','dolgota','visota_anten','vis_anten_ocean'],
          [Shirota.text,Dolgota.text,vis_antenni,vis__ant_ocean]);
     end;

     if not IsAbonNum.Checked then
     begin
       UpdateToTable('Abonenti','id_res',id__res,['id_res','id_podrazd'],['','']);
     end
     else
         with DM.Query do
         begin
           Close;
           SQL.Text := 'select * from Abonenti where id=''' + ID.Text + ''' and abonent_num='''+AbonNum.Text+'''';
           Open;
           FindLast;
           if recordcount>0 then
           begin
             First;
             i := FieldByName('id_abonent').AsInteger;
             Close;
             UpdateToTable('Abonenti','id_abonent',IntToStr(i),['id_res','id_podrazd'],[id__res,frmRES.GridRES.DataSource.DataSet.FieldByName('id_podrazd').AsString]);
           end
           else
           begin
             if cbPodrazdelenie.Text = '' then
               AddToTable('Abonenti',['id_res','id','abonent_num','status'],[id__res,ID.text,AbonNum.text,'true'])
             else
               AddToTable('Abonenti',['id_res','id','abonent_num','id_podrazd','status'],[id__res,ID.text,AbonNum.text,VarToStr(cbPodrazdelenie.KeyValue),'true']);
           end;
           Close;
         end;
     UpdateToTable('RES','id_res',id__res,['prim'],[Prim.Lines.Text]);
  end
  else
  begin
    if cbPodrazdelenie.Text = '' then
    AddToTable('RES',['type','place_install','marka','serial_num','power',
     'date_vipusk','date_vvoda','num_razr_res','date_end_razr','status','inv_number','pozivnoi','klass_izluch'],
     [cbType.Items[cbType.itemindex],Place_install.text,Marka.Items[Marka.itemindex],
      Serial_num.text,power1,FormatDateTime('yyyy-MM-dd',Date_vipusk.Date),
      FormatDateTime('yyyy-MM-dd',Date_vvoda.Date),Num_razr.text,FormatDateTime('yyyy-MM-dd',Date_end_razr.Date),
      Status_1,Inv_number.text,pozivnoi.text,Klass_izl.text])
     else
    AddToTable('RES',['id_podrazd','type','place_install','marka','serial_num','power',
     'date_vipusk','date_vvoda','num_razr_res','date_end_razr','status','inv_number','pozivnoi','klass_izluch'],
     [VarToStr(cbPodrazdelenie.KeyValue),cbType.Items[cbType.itemindex],Place_install.text,Marka.Items[Marka.itemindex],
      Serial_num.text,power1,FormatDateTime('yyyy-MM-dd',Date_vipusk.Date),
      FormatDateTime('yyyy-MM-dd',Date_vvoda.Date),Num_razr.text,FormatDateTime('yyyy-MM-dd',Date_end_razr.Date),
      Status_1,Inv_number.text,pozivnoi.text,Klass_izl.text]);

     frmRES.GridRES.DataSource.DataSet.Close;
     frmRES.GridRES.DataSource.DataSet.Open;
     DM.TblRES.Close;
     DM.TblRES.Open;
     //ищем только что добавленную запись и добавляем акт списания, радиосети и примечание
     DM.TblRES.IndexFieldNames := 'id_res';
     Application.ProcessMessages;
     DM.TblRES.FindLast;
     id__res := DM.TblRESid_res.AsString;

     if IsAbonNum.Checked then
         with DM.Query do
         begin
           Close;
           SQL.Text := 'select * from Abonenti where id=''' + ID.Text + ''' and abonent_num='''+AbonNum.Text+'''';
           Open;
           FindLast;
           if recordcount>0 then
           begin
             First;
             i := FieldByName('id_abonent').AsInteger;
             Close;
             UpdateToTable('Abonenti','id_abonent',IntToStr(i),['id_res','id_podrazd'],[id__res, frmRES.GridRES.DataSource.DataSet.fieldbyname('id_podrazd').AsString]);
           end
           else
           begin
             if cbPodrazdelenie.Text = '' then
               AddToTable('Abonenti',['id_res','id','abonent_num','status'],[id__res,ID.text,AbonNum.text,'true'])
             else
               AddToTable('Abonenti',['id_res','id','abonent_num','id_podrazd','status'],[id__res,ID.text,AbonNum.text,VarToStr(cbPodrazdelenie.KeyValue),'true']);
           end;
           Close;
         end;


     UpdateToTable('RES','id_res',id__res,['prim'],[Prim.Lines.Text]);
     if GroupBox1.Visible then
     begin
       if Null_Query(DM.Query,'Par_base_station','id_res='+id__res) then
        AddToTable('Par_base_station',['id_res','shirota','dolgota','visota_anten','vis_anten_ocean'],[id__res,
           Shirota.text,Dolgota.text,vis_antenni,vis__ant_ocean])
       else
        UpdateToTable('Par_base_station','id_res',id__res,['shirota','dolgota','visota_anten','vis_anten_ocean'],
          [Shirota.text,Dolgota.text,vis_antenni,vis__ant_ocean]);
     end;

     frequency1 := '';
     if RadioSeti.Items.Count <> 0 then
     begin
       for i := 0 to RadioSeti.Items.Count - 1 do
       begin
         if RadioSeti.Checked[i] then
         begin
          AddToTable('RES_seti',['id_res','id_radioseti'],[id__res,IntToStr(id_radioseti[i])]);
          frequency1 := frequency1 + RadioSeti.Items[i] + '; ';
         end;
       end;
       UpdateToTable('RES','id_res',id__res,['Frequency'],[frequency1]);
     end;

     if AktSpis.FileName <> '' then
     begin
                  FindFirst(AktSpis.FileName,faAnyFile,re);
                  if (re.Size > 3*1024*1024) then
                  begin
                    ShowMessage('Слишком большой файл.'#13'Размер файла не должен превышать 3 МБ');
                    exit
                  end;
                  extension := ExtractFileExt(AktSpis.FileName);
                  data := TMemoryStream.Create;
                  data.LoadFromFile(AktSpis.FileName);
                  data.Seek(0,soFromBeginning);
                  s := '0x';
                  frmProgress.Show;
                  frmProgress.Indicator.Progress := 0;
                  frmProgress.Indicator.MaxValue := data.Size;
                  for i := 0 to data.Size - 1 do
                  begin
                    data.Read(b1,1);
                    s := s+ inttohex(b1,2);
                    frmProgress.Indicator.Progress := frmProgress.Indicator.Progress + 1;
                    Application.ProcessMessages;
                  end;
                    data.Free;
                    frmProgress.Hide;
       AddToTable('Files',['id_res'],[id__res]);
       UpdateToFilesTable('Files','id_res',id__res,['extension','data'],[extension,s]);
     end;
     if ProtIzm.FileName <> '' then
     begin
                  FindFirst(ProtIzm.FileName,faAnyFile,re);
                  if (re.Size > 3*1024*1024) then
                  begin
                    ShowMessage('Слишком большой файл.'#13'Размер файла не должен превышать 3 МБ');
                    exit
                  end;
                  extension := ExtractFileExt(ProtIzm.FileName);
                  data := TMemoryStream.Create;
                  data.LoadFromFile(ProtIzm.FileName);
                  data.Seek(0,soFromBeginning);
                  s := '0x';
                  frmProgress.Show;
                  frmProgress.Indicator.Progress := 0;
                  frmProgress.Indicator.MaxValue := data.Size;
                  for i := 0 to data.Size - 1 do
                  begin
                    data.Read(b1,1);
                    s := s+ inttohex(b1,2);
                    frmProgress.Indicator.Progress := frmProgress.Indicator.Progress + 1;
                    Application.ProcessMessages;
                  end;
                    data.Free;
                    frmProgress.Hide;
       AddToTable('FilesProtIzm',['id_res'],[id__res]);
       UpdateToFilesTable('FilesProtIzm','id_res',id__res,['extension','data'],[extension,s]);
     end;

  end;
  exiit: Close;
end;

procedure TfrmAddRES.CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddRES.btNew_markaClick(Sender: TObject);
begin
  frmNewRecord := TfrmNewRecord.Create(Application);
  if frmNewRecord.ShowModal = mrOk then
  begin
    NewMarka := frmNewRecord.New_value.Text;
    AddToTable('slMarka',['marka'],[NewMarka]);
    Marka.Items.Clear;
    AddToListFromDB(DM.Query,Marka.Items,'marka','slMarka');
    Marka.ItemIndex := Marka.Items.IndexOf(NewMarka);
  end;
  frmNewRecord.Free;
end;

procedure TfrmAddRES.cbTypeChange(Sender: TObject);
begin
  if (cbType.ItemIndex = cbType.Items.indexOf('Базовое'))or(cbType.ItemIndex = cbType.Items.indexOf('Стационарное')) then
    GroupBox1.Visible := true
  else GroupBox1.Visible := False;
end;

procedure TfrmAddRES.Timer1Timer(Sender: TObject);
var i: integer;
begin

 if not dostupAll_user then
 begin
   for i := 0 to ComponentCount-1 do
   if Components[i] is TControl then (Components[i] as TControl).Enabled := false;
   Cancel.Enabled := true;
 end;

  Timer1.Enabled := False;
  SetLength(id_radioseti, 0);
  AddToListFromDB(dm.Query,Status.Items,'status','slStatus');
  if EditFlagRES then
  begin
    cbPodrazdelenie.KeyValue := frmRES.GridRES.DataSource.DataSet.fieldbyname('id_podrazd').AsInteger;
    AddToListFromDB(DM.Query,cbType.Items,'type','slTypeRES');
    Place_install.Text := frmRES.GridRES.DataSource.DataSet.fieldbyname('place_install').AsString;
    AddToListFromDB(DM.Query,Marka.Items,'marka','slMarka');
    Marka.ItemIndex := Marka.Items.IndexOf(frmRES.GridRES.DataSource.DataSet.fieldbyname('marka').AsString);
    Serial_num.Text := frmRES.GridRES.DataSource.DataSet.fieldbyname('serial_num').AsString;
    power.Text := frmRES.GridRES.DataSource.DataSet.fieldbyname('power').AsString;
    Date_vipusk.Date := frmRES.GridRES.DataSource.DataSet.fieldbyname('date_vipusk').AsDateTime;
    Date_vvoda.Date := frmRES.GridRES.DataSource.DataSet.fieldbyname('date_vvoda').AsDateTime;
    Num_razr.Text := frmRES.GridRES.DataSource.DataSet.fieldbyname('num_razr_res').AsString;
    Date_end_razr.Date := frmRES.GridRES.DataSource.DataSet.fieldbyname('date_end_razr').AsDateTime;
    Inv_number.Text := frmRES.GridRES.DataSource.DataSet.fieldbyname('inv_number').AsString;
    pozivnoi.Text := frmRES.GridRES.DataSource.DataSet.fieldbyname('pozivnoi').AsString;
    Klass_izl.Text := frmRES.GridRES.DataSource.DataSet.fieldbyname('klass_izluch').AsString;
    Status.ItemIndex := Status.Items.IndexOf(frmRES.GridRES.DataSource.DataSet.fieldbyname('status').AsString);
    if ifNullFile(id__res,'id_res', 'Files') then
      AktSpis.Text := 'Нет'
    else
      AktSpis.Text := 'Есть';
    if ifNullFile(id__res,'id_res', 'FilesProtIzm') then
      ProtIzm.Text := 'Нет'
    else
      ProtIzm.Text := 'Есть';
    Prim.Text := frmRES.GridRES.DataSource.DataSet.fieldbyname('prim').AsString;
    with DM.Query do
    begin
      RadioSeti.Clear;
      Close;
      SQL.Text := 'select * from RES_seti, Radioseti where RES_seti.id_res='
        + id__res + ' and Radioseti.id_radioseti=RES_seti.id_radioseti';
      Open;
        First;
        while not Eof do
        begin
          RadioSeti.Items.Add(FieldByName('freq').AsString);
          SetLength(id_radioseti, Length(id_radioseti)+1);
          id_radioseti[high(id_radioseti)] := fieldByName('id_radioseti').AsInteger;
          RadioSeti.Checked[FindIndex(FieldByName('id_radioseti').AsInteger,id_radioseti)] := true;
          next;
        end;
      Close;
    end;

    cbType.ItemIndex := cbType.Items.IndexOf(frmRES.GridRES.DataSource.DataSet.fieldbyname('type').AsString);
    cbTypeChange(sender);
    Application.ProcessMessages;
    if GroupBox1.Visible then
    begin
      DM.tblPar_Base_stat.Open;
      if DM.tblPar_Base_stat.Locate('id_res',id__res,[]) then
      begin
        Vis_ant.Value := DM.tblPar_Base_statvisota_anten.AsFloat;
        Vis_ant_ocean.Value :=  dm.tblPar_Base_statvis_anten_ocean.AsFloat;
        Shirota.Text := DM.tblPar_Base_statshirota.AsString;
        Dolgota.Text := DM.tblPar_Base_statdolgota.AsString;
      end;
      DM.tblPar_Base_stat.Close;
    end;

    frmAddRES.Caption := 'Редактирование РЭС';
    with DM.Query do
    begin
      Close;
      SQL.Text := 'select * from Abonenti where id_res=' + id__res;
      Open;
      FindLast;
      if RecordCount = 1 then
      begin
        First;
        ID.Text := fieldbyname('id').AsString;
        AbonNum.Text := FieldByName('abonent_num').AsString;
        GroupBox2.Visible := true;
        IsAbonNum.Checked := true;
      end;
      Close;
    end;
  end
  else
  begin
    IsAbonNum.Checked := false;
    AddToListFromDB(DM.Query,Marka.Items,'marka','slMarka');
    AddToListFromDB(DM.Query,cbType.Items,'type','slTypeRES');
    cbTypeChange(sender);
  end;
  if Flag_copy then
  begin
    frmAddRES.Caption := 'Копирование РЭС';
    Serial_num.Text := '';
    AktSpis.Text := '';
    ProtIzm.Text := '';
    Serial_num.SetFocus;
    EditFlagRES := false;
  end;
end;

procedure TfrmAddRES.IsAbonNumClick(Sender: TObject);
begin
  if IsAbonNum.Checked then GroupBox2.Visible := true
  else GroupBox2.Visible := False;
end;

procedure TfrmAddRES.cbPodrazdelenieKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DELETE then cbPodrazdelenie.Value := '';
end;

procedure TfrmAddRES.FormCreate(Sender: TObject);
begin
  if EditFlagRES then
  id__res := frmRES.GridRES.DataSource.DataSet.fieldByName('id_res').AsString;
end;

procedure TfrmAddRES.EditRSetiClick(Sender: TObject);
begin
  frmEditRSeti_in_res := TfrmEditRSeti_in_res.Create(Application);
  with DM.Query do
  begin
    // добавляем все радиосети в список
    Close;
    SQL.Text := 'Select * from radioseti';
    Open;
    First;
    if RecordCount > 0 then
    begin
      while not Eof do
      begin
      frmEditRSeti_in_res.RxCheckListBox1.Items.Add(FieldByName('freq').AsString);
      SetLength(id_radioseti_new, Length(id_radioseti_new)+1);
      id_radioseti_new[high(id_radioseti_new)] := fieldByName('id_radioseti').AsInteger;
      next;
      end;
    end;
    Close;

    //отмечаем галочками те, которые присутствуют у рэс
    if EditFlagRES then
    begin
      Close;
      SQL.Text := 'select * from RES_seti where id_res=' + id__res;
      Open;
      FindLast;
      if RecordCount > 0 then
      begin
        First;
        while not Eof do
        begin
          frmEditRSeti_in_res.RxCheckListBox1.Checked[FindIndex(FieldByName('id_radioseti').AsInteger,id_radioseti_new)] := true;
          next;
        end;
      end;
      Close;
    end;
  end;
  
  frmEditRSeti_in_res.ShowModal;
  frmEditRSeti_in_res.Free;
end;

procedure TfrmAddRES.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
end;

end.
