unit UnitAbonent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,UnitDM,MyDB, Buttons, StdCtrls, ToolWin, ComCtrls, Grids,
  DBGrids, RXDBCtrl, UnitAddAbonent, UnitRSeti, Menus, DB, Provider,
  SqlExpr, DBClient, DBLocal, DBLocalS, Placemnt;

type
  TfrmAbonent = class(TForm)
    ToolBar1: TToolBar;
    BtnDel: TButton;
    btADD: TButton;
    btEdit: TButton;
    btnPoisk: TBitBtn;
    btnFiltr: TBitBtn;
    StatusBar1: TStatusBar;
    GridAbonent: TRxDBGrid;
    PopupMenu1: TPopupMenu;
    res_abon: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    DS_Detail: TDataSource;
    Abonent_detail: TSQLClientDataSet;
    Abonent_detailid_abonent: TFMTBCDField;
    Abonent_detailid_res: TFMTBCDField;
    Abonent_detailid_podrazd: TFMTBCDField;
    Abonent_detailid: TStringField;
    Abonent_detailabonent_num: TStringField;
    Abonent_detailstatus: TStringField;
    Abonent_detailprim: TStringField;
    Abonent_detailres_marka: TStringField;
    Abonent_detailres_serial: TStringField;
    Abonent_detailpodrazd: TStringField;
    N1: TMenuItem;
    BitBtn1: TBitBtn;
    ToolButton1: TToolButton;
    FormStorage1: TFormStorage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnFiltrClick(Sender: TObject);
    procedure PrintClick(Sender: TObject);
    procedure btnPoiskClick(Sender: TObject);
    procedure btADDClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure res_abonClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure GridAbonentDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure N1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridAbonentDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Detail: boolean;
      var Master_Sourse: TDataSource; Master_Field, MasterField_Value: string);
      reintroduce;overload;
  end;

var
  frmAbonent: TfrmAbonent;
  EditFlagAbon: boolean = false;
  is_abon_detail: boolean = false;
  FiltrAbonent: string;

implementation

{$R *.dfm}
uses unitRES;
procedure TfrmAbonent.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmAbonent.FormCreate(Sender: TObject);
begin
 GridAbonent.DataSource.DataSet.Close;
 GridAbonent.DataSource.DataSet.Open;
 if not dostupAll_user then
 begin
   BtnDel.Enabled := false;
   btADD.Enabled := false;
   btEdit.Enabled := false;
   GridAbonent.OnDblClick := nil;
   if id_podrazd_user <> 0 then
   begin
//     PopupMenu1.Free;
     dm.TblAbonent.Filter := 'id_podrazd='+IntToStr(id_podrazd_user);
     FiltrAbonent := DM.TblAbonent.Filter;
     DM.TblAbonent.Filtered := true;
   end;
 end;
end;

procedure TfrmAbonent.btnFiltrClick(Sender: TObject);
begin
  Set_Filtr(TDBGrid(GridAbonent), 'Abonenti', 'id_abonent', is_abon_detail or ((not dostupAll_user)and(id_podrazd_user<>0)),FiltrAbonent);
end;

procedure TfrmAbonent.PrintClick(Sender: TObject);
begin
  ExportToExcel(GridAbonent);
end;

procedure TfrmAbonent.btnPoiskClick(Sender: TObject);
begin
  Find_Next(TDBGrid(GridAbonent), 'Abonenti', 'id_abonent');
end;

procedure TfrmAbonent.btADDClick(Sender: TObject);
begin
  frmAddAbonent := TfrmAddAbonent.Create(Application);
  frmAddAbonent.ShowModal;
  frmAddAbonent.Free;
  DM.TblAbonent.Close;
  DM.TblAbonent.Open;
  DM.TblAbonent.FindLast;
end;

procedure TfrmAbonent.BtnDelClick(Sender: TObject);
begin
  if DM.TblAbonent.RecordCount = 0 then exit;
  if MessageDlg('Вы действительно хотите удалить абонента?',mtConfirmation,[mbYes, mbNo],0) = mrYes then
  begin
    DeleteFromTable('Abon_seti','id_abonent',DM.TblAbonentid_abonent.asstring,false);
    DeleteFromTable('Abonenti','id_abonent',DM.TblAbonentid_abonent.asstring,false);
    GridAbonent.DataSource.DataSet.Close;
    GridAbonent.DataSource.DataSet.Open;
  end;
end;

procedure TfrmAbonent.btEditClick(Sender: TObject);
var i: Longword;
begin
if DM.TblAbonent.RecordCount = 0 then exit;
  i := DM.TblAbonent.RecNo;
  EditFlagAbon := true;
  frmAddAbonent := TfrmAddAbonent.Create(Application);
  frmAddAbonent.ShowModal;
  frmAddAbonent.Free;
  EditFlagAbon := False;
  GridAbonent.DataSource.DataSet.Close;
  GridAbonent.DataSource.DataSet.Open;
  DM.TblAbonent.MoveBy(i-1);
end;

procedure TfrmAbonent.res_abonClick(Sender: TObject);
begin
  if GridAbonent.DataSource.DataSet.RecordCount = 0 then exit;
  frmRadioseti := TfrmRadioseti.Create(Application,true,DM.DSRES,'id_abonent',
    GridAbonent.DataSource.DataSet.FieldByName('id_abonent').asString, GridAbonent.Columns[1].Field.AsString);
end;

procedure TfrmAbonent.N3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmAbonent.GridAbonentDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  StatusBar1.SimpleText :=  'Количество записей: ' +
    IntToStr(GridAbonent.DataSource.DataSet.RecordCount);
  if (gdSelected in State) then
  begin
    GridAbonent.Canvas.Brush.Color := Color_DefaultSelectedFon;
    GridAbonent.Canvas.Font.Color :=  Color_DefaultSelectedText;
  end
  else
  begin
    GridAbonent.Canvas.Brush.Color := Color_DefaultFon;
    GridAbonent.Canvas.Font.Color := Color_DefaultText;
  end;
  GridAbonent.DefaultDrawColumnCell(Rect,DataCol,Column,State);

end;

constructor TfrmAbonent.Create(AOwner: TComponent; Detail: boolean;
  var Master_Sourse: TDataSource; Master_Field, MasterField_Value: string);
var
  usl: string;
begin
  inherited Create(AOwner);
  if Detail then
  begin
    is_abon_detail := true;
    if Master_Field = 'id_radioseti' then
    begin
      dm.Query.Close;
      DM.Query.SQL.Text := 'select abonenti.id_abonent from abonenti,' +
       'abon_seti where abonenti.id_abonent=abon_seti.id_abonent and abon_seti.id_radioseti='+MasterField_Value;
      DM.Query.Open;
      DM.Query.FindLast;
      Usl := '';
      if DM.Query.IsEmpty then Usl := 'id_abonent<0'
      else
      begin
        DM.Query.FindFirst;
        if usl <> '' then Usl := Usl + ' OR ';
        Usl := Usl + 'id_abonent=' + DM.Query.FieldByName('id_abonent').AsString;
        DM.Query.Next;
        while not dm.Query.Eof do
        begin
          if usl <> '' then Usl := Usl + ' OR ';
          Usl := Usl + 'id_abonent=' + DM.Query.FieldByName('id_abonent').AsString;
          DM.Query.Next;
        end;
      end;
      dm.Query.Close;
      GridAbonent.DataSource := DS_Detail;
      Abonent_detail.Close;
      Abonent_detail.Open;
      Caption := 'Абоненты выбранной радиосети (№ ' + MasterField_Value + ')';
      Set_Filtr_quick(TDBGrid(GridAbonent),'abonenti','id_abonent',Usl);
      FiltrAbonent := GridAbonent.DataSource.DataSet.Filter;
    end
    else
      if Master_Field = 'id_res' then
      begin
        Usl := Master_Field + '=' + MasterField_Value;
        GridAbonent.DataSource := DS_Detail;
        Abonent_detail.Close;
        Abonent_detail.Open;
        Caption := 'Абоненты выбранной РЭС (№ ' + MasterField_Value + ')';
        Set_Filtr_quick(TDBGrid(GridAbonent),'abonenti','id_abonent',Usl);
        FiltrAbonent := GridAbonent.DataSource.DataSet.Filter;
      end
      else
        if Master_Field = 'id_podrazd' then
        begin
          Usl := Master_Field + '=' + MasterField_Value;
          GridAbonent.DataSource := DS_Detail;
          Abonent_detail.Close;
          Abonent_detail.Open;
          Caption := 'Абоненты выбранного подразделения (№ ' + MasterField_Value + ')';
          Set_Filtr_quick(TDBGrid(GridAbonent),'abonenti','id_abonent',Usl);
          FiltrAbonent := GridAbonent.DataSource.DataSet.Filter;
        end;
  end;
end;

procedure TfrmAbonent.N1Click(Sender: TObject);
begin
  if GridAbonent.DataSource.DataSet.RecordCount = 0 then exit;
  frmRES := TfrmRES.Create(Application,true,dm.DSAbonent,'id_res',GridAbonent.DataSource.DataSet.FieldByName('id_res').asstring);
end;

procedure TfrmAbonent.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
end;

procedure TfrmAbonent.GridAbonentDblClick(Sender: TObject);
begin
  btEditClick(sender);
end;

end.
