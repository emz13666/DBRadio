unit UnitAddRSeti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RxLookup, RXCtrls, StdCtrls, Buttons, Mask, ToolEdit,
  RXSpin,MyDB;

type
  TfrmAddRSeti = class(TForm)
    Timer1: TTimer;
    RxLabel1: TRxLabel;
    Podrazd: TRxDBLookupCombo;
    NumSeti: TRxSpinEdit;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    Freq: TEdit;
    Num_razr: TEdit;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    DateEndRazr: TDateEdit;
    RxLabel6: TRxLabel;
    Prim: TMemo;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    ChTP: TFilenameEdit;
    RxLabel7: TRxLabel;
    RxLabel8: TRxLabel;
    cbStatus: TComboBox;
    procedure Timer1Timer(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure PodrazdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddRSeti: TfrmAddRSeti;
  OldPodrazd: integer;
  
implementation

{$R *.dfm}

uses UnitRSeti, UnitDM, UnitProgress;

procedure TfrmAddRSeti.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  if EditFlagRSeti then
  begin
    Caption := 'Редактирование радиосети';
    Podrazd.KeyValue := DM.TblRadioseti.fieldbyname('id_podrazd').AsInteger;
    OldPodrazd := DM.TblRadioseti.fieldbyname('id_podrazd').AsInteger;
    NumSeti.Value := DM.TblRadiosetinumber.AsInteger;
    Freq.Text := DM.TblRadiosetifreq.AsString;
    Num_razr.Text := DM.TblRadiosetinum_razr.AsString;
    DateEndRazr.Date := DM.TblRadiosetidate_end_razr.AsDateTime;
    cbStatus.ItemIndex := DM.TblRadiosetistatus.AsInteger;
    if ifNullFile(DM.TblRadiosetiid_radioseti.AsString,'id_radioseti', 'Files') then
      ChTP.Text := 'Нет'
    else
      ChTP.Text := 'Есть';
    Prim.Text := DM.TblRadiosetiprim.AsString;
  end
  else
  begin
    NumSeti.Value := MaxValue('Radioseti', 'number') + 1;
    cbStatus.ItemIndex := 0;
  end;
end;

procedure TfrmAddRSeti.btnOKClick(Sender: TObject);
var
  extension, s: string;
  i: LongWord;
var
  data: TMemoryStream;
  b1: byte;
  re: TSearchRec;
  podrazd_id: integer;
label exiit;
begin
  if not dostupAll_user then goto exiit;
  btnOK.Enabled := False;
  btnCancel.Enabled := False;
  if Podrazd.Value = '' then podrazd_id := 0
  else podrazd_id := Podrazd.KeyValue;
  if EditFlagRSeti then
  begin
     if (ChTP.Text <> 'Есть')and(ChTP.Text <> 'Нет') then
     begin
       if ChTP.Text <> '' then
       begin
                  FindFirst(ChTP.FileName,faAnyFile,re);
                  if (re.Size > 3*1024*1024) then
                  begin
                    ShowMessage('Слишком большой файл.'#13'Размер файла не должен превышать 3 МБ');
                    exit
                  end;
                  extension := ExtractFileExt(ChTP.FileName);
                  data := TMemoryStream.Create;
                  data.LoadFromFile(ChTP.FileName);
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

                 if CountRecordInMySQLTable(DM.Query,'id_radioseti',DM.TblRadiosetiid_radioseti.AsString,'Files')=1 then
                  UpdateToFilesTable('Files','id_radioseti',dm.TblRadiosetiid_radioseti.AsString,['extension','data'],[extension,s])
                  else
                  AddFilesToTable('Files',['id_radioseti','extension','data'],[DM.TblRadiosetiid_radioseti.AsString,extension,s]);

       end
       else
       begin
         DeleteFromTable('Files','id_radioseti',DM.TblRadiosetiid_radioseti.AsString,false);
       end;
     end;

    UpdateToTable('Radioseti','id_radioseti',DM.TblRadiosetiid_radioseti.AsString,['id_podrazd','number','freq',
     'num_razr','date_end_razr','prim','status'],[IntToStr(podrazd_id),NumSeti.Text,Freq.Text,Num_razr.Text,FormatDateTime('yyyy-MM-dd',DateEndRazr.Date),
      Prim.Lines.Text,IntToStr(cbStatus.ItemIndex)]);
    if OldPodrazd <> podrazd_id then
    begin
//      'select t1.* from res t1, res_seti t2 where t2.id_radioseti=3 and t1.id_res=t2.id_res'
    end;
  end
  else
  begin
    AddToTable('Radioseti',['id_podrazd','number','freq','num_razr','date_end_razr','prim','status'],
      [IntToStr(podrazd_id),NumSeti.Text,Freq.Text,Num_razr.Text,FormatDateTime('yyyy-MM-dd',DateEndRazr.Date),
      Prim.Lines.Text,IntToStr(cbStatus.ItemIndex)]);

     DM.TblRadioseti.Close;
     dm.TblRadioseti.Open;
     //ищем только что добавленную запись и добавляем ЧТП
     DM.TblRadioseti.IndexFieldNames := 'id_radioseti';
     Application.ProcessMessages;
     DM.TblRadioseti.FindLast;

       if ChTP.Text <> '' then
       begin
                  FindFirst(ChTP.FileName,faAnyFile,re);
                  if (re.Size > 3*1024*1024) then
                  begin
                    ShowMessage('Слишком большой файл.'#13'Размер файла не должен превышать 3 МБ');
                    exit
                  end;
                  extension := ExtractFileExt(ChTP.FileName);
                  data := TMemoryStream.Create;
                  data.LoadFromFile(ChTP.FileName);
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
                  AddFilesToTable('Files',['id_radioseti','extension','data'],[DM.TblRadiosetiid_radioseti.AsString,extension,s]);
       end;
  end;
  DM.TblPodrazd.Close;
  DM.TblPodrazd.Open;
  exiit: Close;
end;

procedure TfrmAddRSeti.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddRSeti.PodrazdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_delete then Podrazd.Value := '';
end;

procedure TfrmAddRSeti.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
end;

end.
