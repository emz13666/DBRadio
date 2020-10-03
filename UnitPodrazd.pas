unit UnitPodrazd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitDM, MyDB, Grids, DBGrids, RXDBCtrl, Buttons, StdCtrls, DB, DBLocalS,
  ToolWin, ComCtrls, UnitAddPodrazd, Placemnt, Menus, UnitRSeti, UnitAbonent, UnitSequr;

type
  TfrmPodrazd = class(TForm)
    ToolBar1: TToolBar;
    BtnDel: TButton;
    btADD: TButton;
    btEdit: TButton;
    btnPoisk: TBitBtn;
    btnFiltr: TBitBtn;
    Print: TBitBtn;
    GridPodrazd: TRxDBGrid;
    FormStorage1: TFormStorage;
    PopupMenu1: TPopupMenu;
    RSeti_podr: TMenuItem;
    abon_podr: TMenuItem;
    Sequr_podr: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    StatusBar1: TStatusBar;
    ToolButton1: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnDelClick(Sender: TObject);
    procedure btADDClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btnPoiskClick(Sender: TObject);
    procedure btnFiltrClick(Sender: TObject);
    procedure PrintClick(Sender: TObject);
    procedure RSeti_podrClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure res_podrClick(Sender: TObject);
    procedure GridPodrazdDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure abon_podrClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Sequr_podrClick(Sender: TObject);
    procedure GridPodrazdTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure GridPodrazdDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPodrazd: TfrmPodrazd;
  EditFlagPodrazd: boolean = false;
  FiltrPodrazd_detail: string;

implementation

{$R *.dfm}
uses UnitRes;

procedure TfrmPodrazd.FormCreate(Sender: TObject);
begin
  dm.TblPodrazd.Close;
  DM.TblPodrazd.Open;
 if not dostupAll_user then
 begin
   BtnDel.Enabled := false;
   btADD.Enabled := false;
   btEdit.Enabled := false;
   btnPoisk.Enabled := false;
   Sequr_podr.Enabled := false;
   GridPodrazd.OnDblClick := nil;
   if id_podrazd_user <> 0 then
   begin
//     PopupMenu1.Free;
     dm.TblPodrazd.Filter := 'id_podrazd='+IntToStr(id_podrazd_user);
     FiltrPodrazd_detail := dm.TblPodrazd.Filter;
     DM.TblPodrazd.Filtered := true;
   end;
 end;
end;

procedure TfrmPodrazd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPodrazd.BtnDelClick(Sender: TObject);
begin
 if DM.TblPodrazd.RecordCount = 0 then exit;
 if MessageDlg('При удалении подразделения удалятся также все связанные с этим подразделением ссылки. Продолжать?', mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
  UpdateToTable('abonenti','id_podrazd',DM.TblPodrazdid_podrazd.asstring,['id_podrazd'],['0']);
  UpdateToTable('Radioseti','id_podrazd',DM.TblPodrazdid_podrazd.asstring,['id_podrazd'],['0']);
  UpdateToTable('RES','id_podrazd',DM.TblPodrazdid_podrazd.asstring,['id_podrazd'],['0']);
  UpdateToTable('Sequr','id_podrazd',DM.TblPodrazdid_podrazd.asstring,['id_podrazd'],['0']);

  DeleteFromTable('Podrazd','id_podrazd',DM.TblPodrazdid_podrazd.asstring,False);

  DM.TblPodrazd.Close;
  DM.TblPodrazd.Open;
 end;
end;

procedure TfrmPodrazd.btADDClick(Sender: TObject);
begin
  frmAddPodrazd := TfrmAddPodrazd.Create(Application);
  frmAddPodrazd.ShowModal;
  frmAddPodrazd.Free;
  DM.TblPodrazd.Close;
  DM.TblPodrazd.Open;
  DM.TblPodrazd.Last;
end;

procedure TfrmPodrazd.btEditClick(Sender: TObject);
var i: LongWord;
begin
if DM.TblPodrazd.RecordCount = 0 then exit;
  i := DM.TblPodrazd.RecNo;
  EditFlagPodrazd := true;
  frmAddPodrazd := TfrmAddPodrazd.Create(Application);
  frmAddPodrazd.ShowModal;
  frmAddPodrazd.Free;
  EditFlagPodrazd := False;
  GridPodrazd.DataSource.DataSet.Close;
  GridPodrazd.DataSource.DataSet.Open;
  DM.TblPodrazd.MoveBy(i-1);
end;

procedure TfrmPodrazd.btnPoiskClick(Sender: TObject);
begin
  Find_Next(TDBGrid(GridPodrazd), 'Podrazd', 'id_podrazd');
end;

procedure TfrmPodrazd.btnFiltrClick(Sender: TObject);
begin
  Set_Filtr(TDBGrid(GridPodrazd), 'Podrazd', 'id_podrazd', (not dostupAll_user)and(id_podrazd_user<>0), FiltrPodrazd_detail);
end;

procedure TfrmPodrazd.PrintClick(Sender: TObject);
begin
  ExportToExcel(gridPodrazd);
end;

procedure TfrmPodrazd.RSeti_podrClick(Sender: TObject);
begin
  frmRadioseti := TfrmRadioseti.Create(Application,true,dm.DSPodrazd,'id_podrazd','', GridPodrazd.Columns.Items[1].Field.AsString);
end;

procedure TfrmPodrazd.N2Click(Sender: TObject);
begin
Close;
end;

procedure TfrmPodrazd.res_podrClick(Sender: TObject);
var id_pod: string;
begin
  id_pod := GridPodrazd.DataSource.DataSet.FieldByName('id_podrazd').asstring;
  frmRES := TfrmRES.Create(Application,true,dm.DSPodrazd,'id_podrazd',id_pod);
end;

procedure TfrmPodrazd.GridPodrazdDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  StatusBar1.SimpleText :=  'Количество записей: ' +
    IntToStr(GridPodrazd.DataSource.DataSet.RecordCount);
  if (gdSelected in State) then
  begin
    GridPodrazd.Canvas.Brush.Color := Color_DefaultSelectedFon;
    GridPodrazd.Canvas.Font.Color :=  Color_DefaultSelectedText;
  end
  else
  begin
    GridPodrazd.Canvas.Brush.Color := Color_DefaultFon;
    GridPodrazd.Canvas.Font.Color := Color_DefaultText;
  end;
  GridPodrazd.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfrmPodrazd.abon_podrClick(Sender: TObject);
begin
  frmAbonent := TfrmAbonent.Create(Application,true,dm.DSPodrazd,'id_podrazd',GridPodrazd.DataSource.DataSet.FieldByName('id_podrazd').asstring);
end;

procedure TfrmPodrazd.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
end;

procedure TfrmPodrazd.Sequr_podrClick(Sender: TObject);
begin
  frmSequr := TfrmSequr.Create(Application,true,dm.DSSequr,'id_podrazd',GridPodrazd.DataSource.DataSet.FieldByName('id_podrazd').asstring);
end;

procedure TfrmPodrazd.GridPodrazdTitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
begin
    (GridPodrazd.DataSource.DataSet as TSQLClientDataSet).IndexFieldNames := Field.FieldName;
end;

procedure TfrmPodrazd.GridPodrazdDblClick(Sender: TObject);
begin
  btEditClick(Sender);
end;

end.
