unit UnitInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, WinProcs,
  Dialogs, Grids,ShellAPI, DBGrids, RXDBCtrl, Buttons, StdCtrls, ToolWin, ComCtrls,UnitDM,
  Placemnt, MyDB, Provider, SqlExpr, DB, DBClient, DBLocal, DBLocalS, Menus, DateUtil,
  FMTBcd, TTDBGrid;

type
  TfrmInfo = class(TForm)
    ToolBar1: TToolBar;
    BtnDel: TButton;
    btADD: TButton;
    btEdit: TButton;
    btnPoisk: TBitBtn;
    btnFiltr: TBitBtn;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    DS_info: TDataSource;
    Info_query: TSQLClientDataSet;
    N4: TMenuItem;
    N5: TMenuItem;
    btUpload: TBitBtn;
    BitBtn1: TBitBtn;
    ToolButton1: TToolButton;
    N1: TMenuItem;
    BtnView: TButton;
    GridInfo: TToolTipsDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFiltrClick(Sender: TObject);
    procedure btnPoiskClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure PrintClick(Sender: TObject);
    procedure btADDClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure GridInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridInfoTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure btUploadClick(Sender: TObject);
    procedure BtnViewClick(Sender: TObject);
    procedure GridInfoDblClick(Sender: TObject);
    procedure GridInfoTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInfo: TfrmInfo;
  EditFlagInfo: boolean;

implementation

uses UnitProgress, UnitAddInfo;

{$R *.dfm}

procedure TfrmInfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmInfo.btnFiltrClick(Sender: TObject);
begin
  Set_Filtr(TDBGrid(GridInfo), 'Info', 'id_info', false, '');
end;

procedure TfrmInfo.btnPoiskClick(Sender: TObject);
begin
  Find_Next(TDBGrid(GridInfo), 'info', 'id_info');
end;


procedure TfrmInfo.BtnDelClick(Sender: TObject);
begin
 if DM.tblInfo.RecordCount = 0 then exit;
  DeleteFromTable('info','id_info',DM.tblInfoid_info.asstring,True);
  DM.tblInfo.Close;
  DM.tblInfo.Open;
end;

procedure TfrmInfo.PrintClick(Sender: TObject);
begin
  ExportToExcel(TRxDBGrid(GridInfo));
end;

procedure TfrmInfo.btADDClick(Sender: TObject);
begin
  frmAddInfo := TfrmAddInfo.Create(Application);
  EditFlagInfo := false;
  frmAddInfo.ShowModal;
  frmAddInfo.Free;
  DM.tblInfo.Close;
  DM.tblInfo.Open;
  DM.tblInfo.Last;
end;

procedure TfrmInfo.btEditClick(Sender: TObject);
var
 i: LongWord;
begin
if DM.TblInfo.RecordCount = 0 then exit;
  i := DM.tblInfo.RecNo;
  EditFlagInfo := true;
  frmAddInfo := TfrmAddInfo.Create(Application);
  frmAddInfo.ShowModal;
  frmAddInfo.Free;
  EditFlagInfo := False;
  GridInfo.DataSource.DataSet.Close;
  GridInfo.DataSource.DataSet.Open;
  DM.tblInfo.MoveBy(i-1);
end;


procedure TfrmInfo.FormCreate(Sender: TObject);
begin
  GridInfo.DataSource.DataSet.Close;
  GridInfo.DataSource.DataSet.Open;
  dm.tblInfo.IndexFieldNames := 'number';
 if not dostupAll_user then
 begin
   BtnDel.Enabled := false;
   btADD.Enabled := false;
   btEdit.Enabled := false;
 end;
end;

procedure TfrmInfo.N5Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmInfo.GridInfoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  StatusBar1.SimpleText := 'Количество записей: ' +
    IntToStr(GridInfo.DataSource.DataSet.RecordCount);

  if (gdSelected in State) then
  begin
    GridInfo.Canvas.Brush.Color := Color_DefaultSelectedFon;
    GridInfo.Canvas.Font.Color :=  Color_DefaultSelectedText;
  end
  else
  begin
    GridInfo.Canvas.Brush.Color := Color_DefaultFon;
    GridInfo.Canvas.Font.Color :=  Color_DefaultText;
  end;
  GridInfo.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;



procedure TfrmInfo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
  if key=vk_return then GridInfoDblClick(Sender);
end;

procedure TfrmInfo.GridInfoTitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
begin
    try (GridInfo.DataSource.DataSet as TSQLClientDataSet).IndexFieldNames := Field.FieldName;
    except
    end;
end;

procedure TfrmInfo.btUploadClick(Sender: TObject);
begin
  GridInfo.DataSource.DataSet.Close;
  GridInfo.DataSource.DataSet.Open;
end;


procedure TfrmInfo.BtnViewClick(Sender: TObject);
var i: LongWord;
  data: TMemoryStream;
  s,extension: Ansistring;
  tmpfilename: string;

begin
  if DM.tblInfo.RecordCount = 0 then exit;
  if ifNullFile(DM.tblInfoid_info.AsString,'id_info','info') then
  begin
    ShowMessage('Нету файла для этой записи.');
    exit;
  end;
  GetFileFromTableFiles('info','id_info',DM.tblInfoid_info.AsString,extension,s);
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

procedure TfrmInfo.GridInfoDblClick(Sender: TObject);
begin
  BtnViewClick(sender);
end;

procedure TfrmInfo.GridInfoTitleClick(Column: TColumn);
begin
    try (GridInfo.DataSource.DataSet as TSQLClientDataSet).IndexFieldNames := Column.Field.FieldName;
    except
    end;
end;

end.
