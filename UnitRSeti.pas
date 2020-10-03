unit UnitRSeti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids,ShellAPI, DBGrids, RXDBCtrl, Buttons, StdCtrls, ToolWin, ComCtrls,UnitDM,
  Placemnt, MyDB, Provider, SqlExpr, DB, DBClient, DBLocal, DBLocalS, Menus, DateUtil,
  FMTBcd;

type
  TfrmRadioseti = class(TForm)
    ToolBar1: TToolBar;
    BtnDel: TButton;
    BtnChTP: TButton;
    btADD: TButton;
    btEdit: TButton;
    btnPoisk: TBitBtn;
    btnFiltr: TBitBtn;
    GridRSeti: TRxDBGrid;
    FormStorage1: TFormStorage;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    RSeti_detail: TSQLClientDataSet;
    RSeti_detailid_radioseti: TFMTBCDField;
    RSeti_detailid_podrazd: TFMTBCDField;
    RSeti_detailnumber: TIntegerField;
    RSeti_detailfreq: TStringField;
    RSeti_detailnum_razr: TStringField;
    RSeti_detaildate_end_razr: TDateField;
    RSeti_detailprim: TStringField;
    DS_detail: TDataSource;
    RSeti_query: TSQLClientDataSet;
    RSeti_detailPodrLook: TStringField;
    N4: TMenuItem;
    N5: TMenuItem;
    btUpload: TBitBtn;
    BitBtn1: TBitBtn;
    ToolButton1: TToolButton;
    N1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFiltrClick(Sender: TObject);
    procedure btnPoiskClick(Sender: TObject);
    procedure BtnChTPClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure PrintClick(Sender: TObject);
    procedure btADDClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RSeti_detailCalcFields(DataSet: TDataSet);
    procedure N5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure GridRSetiDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure N3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridRSetiTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure btUploadClick(Sender: TObject);
    procedure GridRSetiDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Detail: boolean; var Master_Sourse: TDataSource; Master_Field:string; KeyValue, ValueLookField: string); reintroduce;overload;
  end;

var
  frmRadioseti: TfrmRadioseti;
  Look_field: string;
  EditFlagRSeti: boolean = false;
  is_id_res: boolean = false;
  is_rseti_detail: boolean = false;
  FiltrRSeti_detail: string;

implementation

uses UnitProgress, UnitAddRSeti, UnitRES, UnitAbonent;

{$R *.dfm}

procedure TfrmRadioseti.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  Action := caFree;
end;

procedure TfrmRadioseti.btnFiltrClick(Sender: TObject);
begin
  Set_Filtr(TDBGrid(GridRSeti), 'Radioseti', 'id_radioseti', is_rseti_detail or ((not dostupAll_user)and(id_podrazd_user<>0)), FiltrRSeti_detail);
end;

procedure TfrmRadioseti.btnPoiskClick(Sender: TObject);
begin
  Find_Next(TDBGrid(GridRSeti), 'Radioseti', 'id_radioseti');
end;

procedure TfrmRadioseti.BtnChTPClick(Sender: TObject);
var i: LongWord;
  data: TMemoryStream;
  s,extension: Ansistring;
  tmpfilename: string;

begin
  if DM.TblRadioseti.RecordCount = 0 then exit;
  if ifNullFile(DM.TblRadiosetiid_radioseti.AsString,'id_radioseti','files') then
  begin
    ShowMessage('Нету ЧТП для этой радиосети.');
    exit;
  end;
  GetFileFromTableFiles('Files','id_radioseti',DM.TblRadiosetiid_radioseti.AsString,extension,s);
  data := TMemoryStream.Create;
   frmProgress.Show;
   Application.ProcessMessages;
   frmProgress.Indicator.Progress := 0;
   frmProgress.Indicator.MaxValue := Length(s);
   for i := 1 to Length(s) do
   begin
     data.Write(s[i],1);
     frmProgress.Indicator.Progress := frmProgress.Indicator.Progress + 1;
     Application.ProcessMessages;
   end;
   randomize;
   frmProgress.Indicator.Progress := 0;
   tmpfilename := ExtractFilePath(Application.ExeName)+'temp\'+ IntToHex(random(15000000),6)+extension;
   data.SaveToFile(tmpfilename);
  data.Free;
  frmProgress.Hide;
  ShellExecute(Handle,nil,pchar(tmpfilename),nil,nil,SW_SHOW);
end;

procedure TfrmRadioseti.BtnDelClick(Sender: TObject);
begin
 if DM.TblRadioseti.RecordCount = 0 then exit;
 if MessageDlg('При удалении радиосети удалятся также все связанные с этой радиосетью данные. Продолжать?', mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
  DeleteFromTable('RES_seti','id_radioseti',DM.TblRadiosetiid_radioseti.asstring,false);
  DeleteFromTable('Files','id_radioseti',DM.TblRadiosetiid_radioseti.asstring,False);
  DeleteFromTable('Abon_seti','id_radioseti',DM.TblRadiosetiid_radioseti.AsString,False);

  DeleteFromTable('Radioseti','id_radioseti',DM.TblRadiosetiid_radioseti.asstring,False);

  DM.TblRadioseti.Close;
  DM.TblRadioseti.Open;
 end;

end;

procedure TfrmRadioseti.PrintClick(Sender: TObject);
begin
  ExportToExcel(GridRSeti);
end;

procedure TfrmRadioseti.btADDClick(Sender: TObject);
begin
  frmAddRSeti := TfrmAddRSeti.Create(Application);
  frmAddRSeti.ShowModal;
  frmAddRSeti.Free;
  DM.TblRadioseti.Close;
  DM.TblRadioseti.Open;
  DM.TblRadioseti.Last;
end;

procedure TfrmRadioseti.btEditClick(Sender: TObject);
var
 i: LongWord;
begin
if GridRSeti.DataSource.DataSet.RecordCount = 0 then exit;
  i := GridRSeti.DataSource.DataSet.RecNo;
  EditFlagRSeti := true;
  frmAddRSeti := TfrmAddRSeti.Create(Application);
  frmAddRSeti.ShowModal;
  frmAddRSeti.Free;
  EditFlagRSeti := False;
  GridRSeti.DataSource.DataSet.Close;
  GridRSeti.DataSource.DataSet.Open;
  DM.TblRadioseti.MoveBy(i-1);
end;


constructor TfrmRadioseti.Create(AOwner: TComponent; Detail: boolean; var Master_Sourse: TDataSource;
  Master_Field:string; KeyValue, ValueLookField: string);
var Usl: string;
begin
  inherited Create(AOwner);

  Look_field := ValueLookField;

  if Detail then
  begin
    is_rseti_detail := true;
    BtnDel.Enabled := False;
    BtnChTP.Enabled := False;
    btADD.Enabled := False;
    btEdit.Enabled := False;
    btnPoisk.Enabled := False;
    btnFiltr.Enabled := False;
    GridRSeti.OnDblClick := nil;
    N1.Enabled := false;
    if Master_Field = 'id_res' then
    begin
      is_id_res := true;
      RSeti_query.Close;

{      if DM.TblRESid_podrazd.AsInteger <> 0 then
        RSeti_query.CommandText := 'select t1.number, t1.freq, t1.num_razr, t3.name as PodrLook, t1.date_end_razr, t1.prim ' +
         'from Radioseti as t1,res_seti as t2, podrazd as t3 where t1.id_radioseti=t2.id_radioseti and t1.id_podrazd=t3.id_podrazd and t2.id_res='+KeyValue
      else
}     RSeti_query.CommandText := 'select t1.id_radioseti from Radioseti as t1,' +
       'res_seti as t2 where t1.id_radioseti=t2.id_radioseti and t2.id_res='+KeyValue;
      RSeti_query.Open;
      RSeti_query.FindLast;
      Usl := '';
      if RSeti_query.RecordCount = 0 then Usl := 'id_radioseti<0'
      else
      begin
        RSeti_query.first;
        while not RSeti_query.Eof do
        begin
          if usl <> '' then Usl := Usl + ' OR ';
          Usl := Usl + 'id_radioseti=' + RSeti_query.Fields[0].AsString;
          RSeti_query.Next;
        end;
      end;
      RSeti_query.Close;
      DS_detail.DataSet := RSeti_detail;
      GridRSeti.DataSource := DS_detail;
      RSeti_detail.Open;
      Caption := 'Радиосети выбранной РЭС (№ ' + KeyValue + ')';
      Set_Filtr_quick(TDBGrid(GridRSeti),'radioseti','id_radioseti',Usl);
      FiltrRSeti_detail := GridRSeti.DataSource.DataSet.Filter;
    end
    else
      if Master_Field = 'id_abonent' then
      begin
        RSeti_query.Close;
        RSeti_query.CommandText := 'select t1.number, t1.freq, t1.num_razr, t1.date_end_razr, t1.prim ' +
           'from Radioseti as t1, abon_seti as t2 where t1.id_radioseti=t2.id_radioseti and t2.id_abonent='+KeyValue;
        RSeti_query.Open;
        DS_detail.DataSet := RSeti_query;
        GridRSeti.DataSource := DS_detail;
        Caption := 'Радиосети выбранного абонента (№ ' + KeyValue + ')';
      end
      else
      begin
       RSeti_detail.MasterFields := Master_Field;
       RSeti_detail.MasterSource := Master_Sourse;
       DS_detail.DataSet := RSeti_detail;
       GridRSeti.DataSource := DS_detail;
       RSeti_detail.Close;
       RSeti_detail.Open;
//       GridRSeti.Fields[1].Visible := false;
       if Master_Field = 'id_podrazd' then Caption := 'Радиосети выбранного подразделения';
      end;
  end;
end;

procedure TfrmRadioseti.FormCreate(Sender: TObject);
begin
  GridRSeti.DataSource.DataSet.Close;
  GridRSeti.DataSource.DataSet.Open;
 if not dostupAll_user then
 begin
   BtnDel.Enabled := false;
   btADD.Enabled := false;
   btEdit.Enabled := false;
   btnPoisk.Enabled := false;
   if id_podrazd_user <> 0 then
   begin
//     PopupMenu1.Free;
     dm.TblRadioseti.Filter := 'id_podrazd='+IntToStr(id_podrazd_user);
     FiltrRSeti_detail := dm.TblRadioseti.Filter;
     DM.TblRadioseti.Filtered := true;
   end;
 end;

end;

procedure TfrmRadioseti.RSeti_detailCalcFields(DataSet: TDataSet);
begin
  if DataSet.Active then
    DataSet.FieldByName('PodrLook').AsString := Look_field;
end;

procedure TfrmRadioseti.N5Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmRadioseti.N2Click(Sender: TObject);
begin

  frmRES := TfrmRES.Create(Application,true,DM.DSSeti,'id_radioseti',
    GridRSeti.DataSource.DataSet.FieldByName('id_radioseti').asstring);
end;

procedure TfrmRadioseti.GridRSetiDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var IndexOfDateEndRazr: integer;
begin
   IndexOfDateEndRazr := 0;
   while GridRSeti.Columns[IndexOfDateEndRazr].FieldName <> 'date_end_razr' do Inc(IndexOfDateEndRazr);

  StatusBar1.Panels[0].Text := 'Количество записей: ' +
    IntToStr(GridRSeti.DataSource.DataSet.RecordCount);

   if (DaysBetween(date,GridRSeti.Columns[IndexOfDateEndRazr].Field.AsDateTime) <= DateEndRazr) then
   begin
      GridRSeti.Canvas.Brush.Color := Color_EndRazrFon;
      GridRSeti.Canvas.Font.Color :=  Color_EndRazrText;
   end
   else
   begin
     if (DaysBetween(date,GridRSeti.Columns[IndexOfDateEndRazr].Field.AsDateTime) > DateEndRazr)
       and(DaysBetween(date,GridRSeti.Columns[IndexOfDateEndRazr].Field.AsDateTime) <= DatePreduprEndRazr) then
     begin
          GridRSeti.Canvas.Brush.Color := Color_PreduprEndRazrFon;
          GridRSeti.Canvas.Font.Color :=  Color_PreduprEndRazrText;
     end
     else
     begin
       GridRSeti.Canvas.Brush.Color := Color_DefaultFon;
       GridRSeti.Canvas.Font.Color :=  Color_DefaultText;
     end;
   end;

  if (gdSelected in State) then
  begin
    GridRSeti.Canvas.Brush.Color := Color_DefaultSelectedFon;
    GridRSeti.Canvas.Font.Color :=  Color_DefaultSelectedText;
  end;

  try
  if GridRSeti.DataSource.DataSet.FieldByName('status').AsInteger=1 then
  begin
    GridRSeti.Canvas.Brush.Color := Color_SpisRESFon;
    GridRSeti.Canvas.Font.Color :=  Color_DefaultText;
  end;
  except
  end;
  
  GridRSeti.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfrmRadioseti.N3Click(Sender: TObject);
begin
  frmAbonent := TfrmAbonent.Create(Application,true,DM.DSSeti,'id_radioseti',GridRSeti.DataSource.DataSet.FieldByName('id_radioseti').AsString);
end;

procedure TfrmRadioseti.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
end;

procedure TfrmRadioseti.GridRSetiTitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
begin
  if Field.Lookup and (Field.FieldName='PodrLook') then
  begin
    try
    (GridRSeti.DataSource.DataSet as TSQLClientDataSet).IndexFieldNames := 'id_podrazd';
    except
    end;
  end
  else
    try (GridRSeti.DataSource.DataSet as TSQLClientDataSet).IndexFieldNames := Field.FieldName;
    except
    end;
end;

procedure TfrmRadioseti.btUploadClick(Sender: TObject);
begin
  GridRSeti.DataSource.DataSet.Close;
  GridRSeti.DataSource.DataSet.Open;
end;

procedure TfrmRadioseti.GridRSetiDblClick(Sender: TObject);
begin
  btEditClick(Sender);
end;

end.
