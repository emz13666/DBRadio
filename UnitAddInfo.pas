unit UnitAddInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RxLookup, RXCtrls, StdCtrls, Buttons, Mask, ToolEdit,
  RXSpin,MyDB, Spin, ComCtrls;

type
  TfrmAddInfo = class(TForm)
    Timer1: TTimer;
    RxLabel1: TRxLabel;
    Name_info: TEdit;
    Razr_info: TEdit;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    Prim: TMemo;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    Data_info: TFilenameEdit;
    RxLabel2: TRxLabel;
    Date_info: TDateTimePicker;
    edtNumber: TSpinEdit;
    Label1: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddInfo: TfrmAddInfo;
  OldPodrazd: integer;
  
implementation

{$R *.dfm}

uses UnitInfo, UnitDM, UnitProgress;

procedure TfrmAddInfo.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  if EditFlagInfo then
  begin
    Caption := 'Редактирование информационной записи';
    edtNumber.Value := DM.tblInfonumber.AsInteger;
    Date_info.Date := dm.tblInfodate.AsDateTime;
    Name_info.Text := DM.tblInfoname_info.AsString;
    Razr_info.Text := DM.tblInforazrabotchik.AsString;
    Prim.Text := dm.tblInfoprim.AsString;

    if ifNullFile(DM.tblInfoid_info.AsString,'id_info', 'info') then
      Data_info.Text := 'Нет'
    else
      Data_info.Text := 'Есть';
  end
  else
  begin
    Date_info.Date := Date;
  end;
end;

procedure TfrmAddInfo.btnOKClick(Sender: TObject);
var
  extension, s: string;
  i: LongWord;
var
  data: TMemoryStream;
  b1: byte;
  re: TSearchRec;
label exiit;
begin
  if not dostupAll_user then goto exiit;
  if Name_info.Text = '' then
  begin
    ShowMessage('Поле "Наименование" должно быть заполнено!');
    exit;
  end;
  if EditFlagInfo then
  begin
     if (Data_info.Text <> 'Есть')and(Data_info.Text <> 'Нет') then
     begin
       if Data_info.Text <> '' then
       begin
                  FindFirst(Data_info.FileName,faAnyFile,re);
                  if (re.Size > 3*1024*1024) then
                  begin
                    ShowMessage('Слишком большой файл.'#13'Размер файла не должен превышать 3 МБ');
                    exit
                  end;
                  extension := ExtractFileExt(Data_info.FileName);
                  data := TMemoryStream.Create;
                  data.LoadFromFile(Data_info.FileName);
                  data.Seek(0,soFromBeginning);
                  s := '0x';
                  frmProgress.Show;
                  frmProgress.Indicator.Progress := 0;
                  frmProgress.Indicator.MaxValue := data.Size;
                  for i := 0 to data.Size - 1 do
                  begin
                    data.Read(b1,1);
                    s := s + inttohex(b1,2);
                    frmProgress.Indicator.Progress := frmProgress.Indicator.Progress + 1;
                    Application.ProcessMessages;
                  end;
                    data.Free;
                    frmProgress.Hide;
                  UpdateToFilesTable('info','id_info',dm.tblInfoid_info.AsString,['extension','data'],[extension,s])
       end
       else
       begin
         s:='';
         extension := '';
         UpdateToFilesTable('info','id_info',dm.tblInfoid_info.AsString,['extension','data'],[extension,s])
       end;
     end;

    UpdateToTable('Info','id_info',DM.tblInfoid_info.AsString,['number','name_info','date','razrabotchik','prim'],
      [IntToStr(edtNumber.Value),Name_info.text,FormatDateTime('yyyy-MM-dd',Date_info.Date),Razr_info.Text, Prim.Lines.Text]);
  end
  else
  begin
    AddToTable('info',['number','name_info','date','razrabotchik','prim'],
      [IntToStr(edtNumber.Value),Name_info.text,FormatDateTime('yyyy-MM-dd',Date_info.Date),Razr_info.Text, Prim.Lines.Text]);

     DM.tblInfo.Close;
     dm.tblInfo.Open;
     //ищем только что добавленную запись и добавляем файл
     DM.tblInfo.IndexFieldNames := 'id_info';
     Application.ProcessMessages;
     DM.tblInfo.FindLast;

       if (Data_info.Text <> '')and (Data_info.Text <> 'Есть') then
       begin
                  FindFirst(Data_info.FileName,faAnyFile,re);
                  if (re.Size > 3*1024*1024) then
                  begin
                    ShowMessage('Слишком большой файл.'#13'Размер файла не должен превышать 3 МБ');
                    exit
                  end;
                  extension := ExtractFileExt(Data_info.FileName);
                  data := TMemoryStream.Create;
                  data.LoadFromFile(Data_info.FileName);
                  data.Seek(0,soFromBeginning);
                  s := '0x';
                  frmProgress.Show;
                  frmProgress.Indicator.Progress := 0;
                  frmProgress.Indicator.MaxValue := data.Size;
                  for i := 0 to data.Size - 1 do
                  begin
                    data.Read(b1,1);
                    s := s + inttohex(b1,2);
                    frmProgress.Indicator.Progress := frmProgress.Indicator.Progress + 1;
                    Application.ProcessMessages;
                  end;
                    data.Free;
                    frmProgress.Hide;
                  UpdateToFilesTable('info','id_info',dm.tblInfoid_info.AsString,['extension','data'],[extension,s])
       end
       else
       begin
         s:='';
         extension := '';
         UpdateToFilesTable('info','id_info',dm.tblInfoid_info.AsString,['extension','data'],[extension,s])
       end;
  end;
 exiit: Close;
end;

procedure TfrmAddInfo.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddInfo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
end;

end.
