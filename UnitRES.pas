unit UnitRES;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ShellAPI, ToolWin, Grids, DBGrids, UnitDM, StdCtrls,
  AppEvnts, UnitProgress, Placemnt, MyDB, Buttons, DBClient, Menus,
  Provider, SqlExpr, DB, DBLocal, DBLocalS, ExtCtrls, UnitAbonent, DateUtil,
  RXDBCtrl;

type
  TfrmRES = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    BttAktSpis: TButton;
    BtnDel: TButton;
    btADD: TButton;
    FormStorage1: TFormStorage;
    btEdit: TButton;
    btnPoisk: TBitBtn;
    btnFiltr: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RSeti_res: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    btUpload: TBitBtn;
    DS_res_detail: TDataSource;
    Res_query: TSQLClientDataSet;
    Timer1: TTimer;
    RES_detail: TSQLClientDataSet;
    FMTBCDField1: TFMTBCDField;
    FMTBCDField2: TFMTBCDField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    FloatField1: TFloatField;
    DateField1: TDateField;
    DateField2: TDateField;
    StringField8: TStringField;
    DateField3: TDateField;
    StringField9: TStringField;
    StringField10: TStringField;
    RES_detailPodrazd: TStringField;
    RES_detailFrequency: TStringField;
    GridRES: TRxDBGrid;
    BitBtn1: TBitBtn;
    ToolButton1: TToolButton;
    N4: TMenuItem;
    btnProtIzm: TButton;
    N5: TMenuItem;
    cbFiltrShow: TComboBox;
    Button1: TButton;
    procedure GridRESDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnDelClick(Sender: TObject);
    procedure BttAktSpisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btADDClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btnPoiskClick(Sender: TObject);
    procedure btnFiltrClick(Sender: TObject);
    procedure PrintClick(Sender: TObject);
    procedure RSeti_resClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure btUploadClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridRESTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure btnProtIzmClick(Sender: TObject);
    procedure GridRESDblClick(Sender: TObject);
    procedure cbFiltrShowChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Detail: boolean; var Master_Sourse: TDataSource; Master_Field:string; KeyValue: string); reintroduce;overload;
  end;

var
  frmRES: TfrmRES;
  EditFlagRES: boolean = false;
  is_res_detail: boolean = false;
  FiltrRES_Detail: string;

implementation

uses unitAddRES,  UnitRSeti;

{$R *.dfm}


procedure TfrmRES.GridRESDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var IndexOfDateEndRazr, index_of_status: integer;
begin
   IndexOfDateEndRazr := 0;
   index_of_status := 0;
   while GridRES.Columns[IndexOfDateEndRazr].FieldName <> 'date_end_razr' do Inc(IndexOfDateEndRazr);
   while GridRES.Columns[index_of_status].FieldName <> 'status' do Inc(index_of_status);
   if (DaysBetween(date,GridRES.Columns[IndexOfDateEndRazr].Field.AsDateTime) <= DateEndRazr) then
   begin
      GridRES.Canvas.Brush.Color := Color_EndRazrFon;
      GridRES.Canvas.Font.Color :=  Color_EndRazrText;
   end
   else
   begin
     if (DaysBetween(date,GridRES.Columns[IndexOfDateEndRazr].Field.AsDateTime) > DateEndRazr)
       and(DaysBetween(date,GridRES.Columns[IndexOfDateEndRazr].Field.AsDateTime) <= DatePreduprEndRazr) then
     begin
          GridRES.Canvas.Brush.Color := Color_PreduprEndRazrFon;
          GridRES.Canvas.Font.Color :=  Color_PreduprEndRazrText;
     end
     else
     begin
       GridRES.Canvas.Brush.Color := Color_DefaultFon;
       GridRES.Canvas.Font.Color :=  Color_DefaultText;
     end;
   end;

  if gdSelected in State then
  begin
    GridRES.Canvas.Brush.Color := Color_DefaultSelectedFon;
    GridRES.Canvas.Font.Color :=  Color_DefaultSelectedText;
  end;

  if GridRES.Columns[index_of_status].Field.AsString = 'Списано' then
  begin
    GridRES.Canvas.Brush.Color := Color_SpisRESFon;
    GridRES.Canvas.Font.Color :=  Color_DefaultText;
  end;

  if GridRES.Columns[index_of_status].Field.AsString = 'Активно' then
  begin
    GridRES.Canvas.Brush.Color := $FFFF00;
    GridRES.Canvas.Font.Color :=  Color_DefaultText;
    if (gdSelected in State) then
    begin
      GridRES.Canvas.Brush.Color := Color_DefaultText;
      GridRES.Canvas.Font.Color :=  $FFFF00;
    end;

  end;


  GridRES.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  StatusBar1.Panels[0].Text := 'Количество записей: ' + IntToStr(GridRES.DataSource.DataSet.RecordCount);
end;

procedure TfrmRES.BtnDelClick(Sender: TObject);
begin
  if frmRES.GridRES.DataSource.DataSet.RecordCount = 0 then
  begin
   GridRES.SetFocus;
   exit;
  end;
  DeleteFromTable('RES_seti','id_res',frmRES.GridRES.DataSource.DataSet.fieldByName('id_res').asstring,false);
  DeleteFromTable('Par_base_station','id_res',frmRES.GridRES.DataSource.DataSet.fieldbyname('id_res').asstring,false);
  DeleteFromTable('Files','id_res',frmRES.GridRES.DataSource.DataSet.fieldbyname('id_res').asstring,False);
  UpdateToTable('Abonenti','id_res',frmRES.GridRES.DataSource.DataSet.fieldbyname('id_res').AsString,['id_res'],['']);

  DeleteFromTable('RES','id_res',frmRES.GridRES.DataSource.DataSet.fieldByName('id_res').asstring,true);

  frmRES.GridRES.DataSource.DataSet.Close;
  frmRES.GridRES.DataSource.DataSet.Open;
  GridRES.SetFocus;
end;


procedure TfrmRES.BttAktSpisClick(Sender: TObject);
var i: LongWord;
  data: TMemoryStream;
  s,extension: Ansistring;
  tmpfilename: string;

begin
  if frmRES.GridRES.DataSource.DataSet.RecordCount = 0 then
  begin
   GridRES.SetFocus;
   exit;
  end;
  if ifNullFile(frmRES.GridRES.DataSource.DataSet.fieldbyname('id_res').AsString,'id_res','Files') then
  begin
    ShowMessage('Нету акта списания для этой РЭС.');
    GridRES.SetFocus;
    exit;
  end;
  GetFileFromTableFiles('Files','id_res',frmRES.GridRES.DataSource.DataSet.fieldbyname('id_res').AsString,extension,s);
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
   frmProgress.Indicator.Progress := 0;
   randomize;
   tmpfilename := ExtractFilePath(Application.ExeName)+'temp\'+ IntToHex(random(15000000),6)+extension;
   data.SaveToFile(tmpfilename);
  data.Free;
  frmProgress.Hide;
  GridRES.SetFocus;
  ShellExecute(Handle,nil,pchar(tmpfilename),nil,nil,SW_SHOW);
end;

procedure TfrmRES.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmRES.btADDClick(Sender: TObject);
begin
  frmAddRES := TfrmAddRES.Create(Application);
  frmAddRES.ShowModal;
  frmAddRES.Free;
  frmRES.GridRES.DataSource.DataSet.Close;
  frmRES.GridRES.DataSource.DataSet.Open;
  frmRES.GridRES.DataSource.DataSet.FindLast;
end;

procedure TfrmRES.btEditClick(Sender: TObject);
var
 i: LongWord;
begin
if frmRES.GridRES.DataSource.DataSet.RecordCount = 0 then exit;
  i := frmRES.GridRES.DataSource.DataSet.RecNo;
  EditFlagRES := true;
  frmAddRES := TfrmAddRES.Create(Application);
  frmAddRES.ShowModal;
  frmAddRES.Free;
  EditFlagRES := False;
  GridRES.DataSource.DataSet.Close;
  GridRES.DataSource.DataSet.Open;
  frmRES.GridRES.DataSource.DataSet.MoveBy(i-1);
end;

procedure TfrmRES.btnPoiskClick(Sender: TObject);
begin
  Find_Next(TDBGrid(GridRES), 'RES', 'id_res');
end;

procedure TfrmRES.btnFiltrClick(Sender: TObject);
begin
  Set_Filtr(TDBGrid(gridRES), 'RES', 'id_res', is_res_detail or ((not dostupAll_user)and(id_podrazd_user<>0)), FiltrRES_Detail);
end;

procedure TfrmRES.PrintClick(Sender: TObject);
begin
  ExportToExcel(GridRes);
  GridRES.SetFocus;
end;

procedure TfrmRES.RSeti_resClick(Sender: TObject);
begin
  frmRadioseti := TfrmRadioseti.Create(Application,true,DM.DSRES,'id_res',
    GridRES.DataSource.DataSet.FieldByName('id_res').asstring, GridRES.Columns[1].Field.AsString);
end;

procedure TfrmRES.N3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmRES.btUploadClick(Sender: TObject);
begin
  GridRES.DataSource.DataSet.Close;
  GridRES.DataSource.DataSet.Open;
  GridRES.SetFocus;
end;

constructor TfrmRES.Create(AOwner: TComponent; Detail: boolean; var Master_Sourse: TDataSource;
  Master_Field:string; KeyValue: string);
var usl: string;
begin
  inherited Create(AOwner);

  if Detail then
  begin
    is_res_detail := true;
    if Master_Field = 'id_radioseti' then
    begin
      dm.Query.Close;
      DM.Query.SQL.Text := 'select res.id_res from res,' +
       'res_seti where res.id_res=res_seti.id_res and res_seti.id_radioseti='+KeyValue;
      DM.Query.Open;
      DM.Query.FindLast;
      Usl := '';
      if DM.Query.IsEmpty then Usl := 'id_res<0'
      else
      begin
        DM.Query.FindFirst;
        if usl <> '' then Usl := Usl + ' OR ';
        Usl := Usl + 'id_res=' + DM.Query.FieldByName('id_res').AsString;
        DM.Query.Next;
        while not dm.Query.Eof do
        begin
          if usl <> '' then Usl := Usl + ' OR ';
          Usl := Usl + 'id_res=' + DM.Query.FieldByName('id_res').AsString;
          DM.Query.Next;
        end;
      end;
      dm.Query.Close;
      GridRES.DataSource := DS_res_detail;
      DS_res_detail.DataSet := RES_detail;
      RES_detail.Close;
      RES_detail.Open;
      Caption := 'РЭС выбранной радиосети (№ ' + KeyValue + ')';
      Set_Filtr_quick(TDBGrid(GridRES),'RES','id_res',Usl);
      FiltrRES_Detail := GridRES.DataSource.DataSet.Filter;
    end
    else
      if Master_Field = 'id_podrazd' then
      begin
        Usl := Master_Field + '=' + KeyValue;
        GridRES.DataSource := DS_res_detail;
        DS_res_detail.DataSet := RES_detail;
        RES_detail.Close;
        RES_detail.Open;
        Caption := 'РЭС выбранного подразделения';
        Set_Filtr_quick(TDBGrid(GridRES),'res','id_res',Usl);
        FiltrRES_Detail := GridRES.DataSource.DataSet.Filter;
      end
      else
        if  Master_Field = 'id_res' then
        begin
          Usl := Master_Field + '=' + KeyValue;
          GridRES.DataSource := DS_res_detail;
          DS_res_detail.DataSet := RES_detail;
          RES_detail.Close;
          RES_detail.Open;
          Caption := 'РЭС выбранного абонента';
          Set_Filtr_quick(TDBGrid(GridRES),'res','id_res',Usl);
          FiltrRES_Detail := GridRES.DataSource.DataSet.Filter;
        end
  end
  else
    is_res_detail := false;
end;

procedure TfrmRES.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  frmRES.GridRES.DataSource.DataSet.Close;
  frmRES.GridRES.DataSource.DataSet.Open;
 if not dostupAll_user then
 begin
   BtnDel.Enabled := false;
   btADD.Enabled := false;
   if id_podrazd_user <> 0 then
   begin
//     PopupMenu1.Free;
     dm.TblRES.Filter := 'id_podrazd='+IntToStr(id_podrazd_user);
     DM.TblRES.Filtered := true;
     FiltrRES_Detail := dm.TblRES.Filter;
     is_res_detail := true;
   end;
 end;
 cbFiltrShow.ItemIndex := 0;
 cbFiltrShowChange(sender);
 GridRES.SetFocus;
end;

procedure TfrmRES.N1Click(Sender: TObject);
begin
  frmAbonent := TfrmAbonent.Create(Application,true,dm.DSRES,'id_res',GridRES.DataSource.DataSet.FieldByName('id_res').asstring);
end;

procedure TfrmRES.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
end;


procedure TfrmRES.GridRESTitleBtnClick(Sender: TObject; ACol: Integer;
  Field: TField);
begin
  if Field.Lookup and (Field.FieldName='Podrazd') then
  begin
    try
    (GridRES.DataSource.DataSet as TSQLClientDataSet).IndexFieldNames := 'id_podrazd';
    except
    end;
  end
  else
    (GridRES.DataSource.DataSet as TSQLClientDataSet).IndexFieldNames := Field.FieldName;

end;

procedure TfrmRES.btnProtIzmClick(Sender: TObject);
var i: LongWord;
  data: TMemoryStream;
  s,extension: Ansistring;
  tmpfilename: string;

begin
  if frmRES.GridRES.DataSource.DataSet.RecordCount = 0 then
  begin
   GridRES.SetFocus;
   exit;
  end;
  if ifNullFile(frmRES.GridRES.DataSource.DataSet.fieldbyname('id_res').AsString,'id_res','FilesProtIzm') then
  begin
    ShowMessage('Нету протоколов измерений для этой РЭС.');
    GridRES.SetFocus;
    exit;
  end;
  GetFileFromTableFiles('FilesProtIzm','id_res',frmRES.GridRES.DataSource.DataSet.fieldbyname('id_res').AsString,extension,s);
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
   frmProgress.Indicator.Progress := 0;
   Randomize;
   tmpfilename := ExtractFilePath(Application.ExeName)+'temp\'+ IntToHex(random(15000000),6)+extension;
   data.SaveToFile(tmpfilename);
  data.Free;
  frmProgress.Hide;
  GridRES.SetFocus;
  ShellExecute(Handle,nil,pchar(tmpfilename),nil,nil,SW_SHOW);
end;

procedure TfrmRES.GridRESDblClick(Sender: TObject);
begin
  btEditClick(Sender);
end;

procedure TfrmRES.cbFiltrShowChange(Sender: TObject);
begin
  case cbFiltrShow.ItemIndex of
    0:
    begin
      GridRES.DataSource.DataSet.Filtered := False;
      if is_res_detail then
      begin
        GridRES.DataSource.DataSet.Filter := FiltrRES_Detail;
        GridRES.DataSource.DataSet.Filtered := true;
      end
      else
        GridRES.DataSource.DataSet.Filter := '';
    end;
    1:
    begin
      GridRES.DataSource.DataSet.Filtered := false;
      if is_res_detail then
        GridRES.DataSource.DataSet.Filter := FiltrRES_Detail
      else
        GridRES.DataSource.DataSet.Filter := '';

      Set_Filtr_quick(TDBGrid(GridRES),'res','id_res','binary status=''Активно РЧЦ''');
    end;
    2:
    begin
      GridRES.DataSource.DataSet.Filtered := false;
      if is_res_detail then
        GridRES.DataSource.DataSet.Filter := FiltrRES_Detail
      else
        GridRES.DataSource.DataSet.Filter := '';
      Set_Filtr_quick(TDBGrid(GridRES),'res','id_res','binary status=''Активно''');
    end;
    3:
    begin
      GridRES.DataSource.DataSet.Filtered := false;
      if is_res_detail then
        GridRES.DataSource.DataSet.Filter := FiltrRES_Detail
      else
        GridRES.DataSource.DataSet.Filter := '';
      Set_Filtr_quick(TDBGrid(GridRES),'res','id_res','binary status=''Списано''');
    end;
  end;
  GridRES.SetFocus;
end;

procedure TfrmRES.Button1Click(Sender: TObject);
var
  id_res_1: integer;
begin
if frmRES.GridRES.DataSource.DataSet.RecordCount = 0 then exit;
  EditFlagRES := true;
  frmAddRES := TfrmAddRES.Create(Application);
  Flag_copy := true;

  frmAddRES.ShowModal;
  frmAddRES.Free;
  EditFlagRES := False;
  GridRES.DataSource.DataSet.Close;
  GridRES.DataSource.DataSet.Open;
  id_res_1 := MaxValue('res','id_res');
  GridRES.DataSource.DataSet.Locate('id_res',id_res_1,[]);
end;

end.
