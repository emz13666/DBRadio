unit UnitSequr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Placemnt, Grids, DBGrids, RXDBCtrl, ToolWin, ComCtrls, UnitDM,
  StdCtrls, Buttons, UnitAddSequr, ExtCtrls, Provider, SqlExpr, DB,
  DBClient, DBLocal, DBLocalS;

type
  TfrmSequr = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    GridSequr: TRxDBGrid;
    FormStorage1: TFormStorage;
    btAdd: TBitBtn;
    btDel: TBitBtn;
    btEdit: TBitBtn;
    btnNullCounter: TButton;
    Sequr_Detail: TSQLClientDataSet;
    Sequr_Detailid_user: TFMTBCDField;
    Sequr_Detaillogin: TStringField;
    Sequr_Detailpasswd: TStringField;
    Sequr_Detailid_podrazd: TFMTBCDField;
    Sequr_Detaildostup: TStringField;
    Sequr_Detailcounter: TFMTBCDField;
    Sequr_Detailpassw1: TStringField;
    Sequr_DetailPodrLook: TStringField;
    Sequr_DetailDostupCalc: TStringField;
    DS_Detail: TDataSource;
    BitBtn1: TBitBtn;
    ToolButton1: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btAddClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure FormStorage1RestorePlacement(Sender: TObject);
    procedure btnNullCounterClick(Sender: TObject);
    procedure btDelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridSequrDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Sequr_DetailCalcFields(DataSet: TDataSet);
    procedure GridSequrTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure BitBtn1Click(Sender: TObject);
    procedure GridSequrDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Detail: boolean;
      var Master_Sourse: TDataSource; Master_Field, MasterField_Value: string);
      reintroduce;overload;

  end;

var
  frmSequr: TfrmSequr;
  EditFlagSequr: boolean = false;
implementation

{$R *.dfm}
uses MyDB;

procedure TfrmSequr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSequr.btAddClick(Sender: TObject);
begin
  frmAddSequr := TfrmAddSequr.Create(Application);
  frmAddSequr.ShowModal;
  frmAddSequr.Free;
  GridSequr.DataSource.DataSet.Close;
  GridSequr.DataSource.DataSet.Open;
  GridSequr.DataSource.DataSet.FindLast;
end;

procedure TfrmSequr.btEditClick(Sender: TObject);
var
 i: LongWord;
begin
  if GridSequr.DataSource.DataSet.RecordCount = 0 then exit;
  i := GridSequr.DataSource.DataSet.RecNo;
  EditFlagSequr := true;
  frmAddSequr := TfrmAddSequr.Create(Application);
  frmAddSequr.ShowModal;
  EditFlagSequr := false;
  frmAddSequr.Free;
  GridSequr.DataSource.DataSet.Close;
  GridSequr.DataSource.DataSet.Open;
  GridSequr.DataSource.DataSet.MoveBy(i-1);
end;

procedure TfrmSequr.FormStorage1RestorePlacement(Sender: TObject);
begin
  inherited;
  {if dostupAll_user then begin GridSequr.Columns[2].FieldName := 'passw1'; GridSequr.DataSource.DataSet.Filtered := false; end
  else
  begin
  GridSequr.Columns[2].FieldName := 'passwd';
  GridSequr.DataSource.DataSet.Filter := 'id_user='+IntToStr(id_user);
  GridSequr.DataSource.DataSet.Filtered := true;
  end;}
end;

procedure TfrmSequr.btnNullCounterClick(Sender: TObject);
var
 i: LongWord;
begin
  if GridSequr.DataSource.DataSet.RecordCount = 0 then exit;
  i := GridSequr.DataSource.DataSet.RecNo;
  UpdateToTable('Sequr','id_user',GridSequr.DataSource.DataSet.FieldByName('id_user').AsString,['counter'],['0']);
  GridSequr.DataSource.DataSet.Close;
  GridSequr.DataSource.DataSet.Open;
  GridSequr.DataSource.DataSet.MoveBy(i-1);
end;

procedure TfrmSequr.btDelClick(Sender: TObject);
begin
  if GridSequr.DataSource.DataSet.RecordCount = 0 then exit;

  DeleteFromTable('Sequr','id_user',GridSequr.DataSource.DataSet.fieldByName('id_user').AsString,True);

  GridSequr.DataSource.DataSet.Close;
  GridSequr.DataSource.DataSet.Open;
  GridSequr.DataSource.DataSet.First;

end;

procedure TfrmSequr.FormCreate(Sender: TObject);
begin
  GridSequr.DataSource.DataSet.Close;
  GridSequr.DataSource.DataSet.Open;
  if not dostupAll_user then
  begin
    btAdd.Enabled := false;
    btDel.Enabled := false;
    btnNullCounter.Enabled := false;
    
    dm.tblSequr.Filter := 'id_user='+IntToStr(id_user);
    DM.tblSequr.Filtered := true;
  end;
end;

procedure TfrmSequr.GridSequrDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  StatusBar1.SimpleText :=  'Количество записей: ' +
    IntToStr(GridSequr.DataSource.DataSet.RecordCount);
  if (gdSelected in State) then
  begin
    GridSequr.Canvas.Brush.Color := Color_DefaultSelectedFon;
    GridSequr.Canvas.Font.Color :=  Color_DefaultSelectedText;
  end
  else
  begin
    GridSequr.Canvas.Brush.Color := Color_DefaultFon;
    GridSequr.Canvas.Font.Color := Color_DefaultText;
  end;
  GridSequr.DefaultDrawColumnCell(Rect,DataCol,Column,State);

end;

procedure TfrmSequr.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
end;

constructor TfrmSequr.Create(AOwner: TComponent; Detail: boolean;
  var Master_Sourse: TDataSource; Master_Field, MasterField_Value: string);
var Usl: string;
begin
  inherited Create(AOwner);
  if Detail then
  begin
    Usl := Master_Field + '=' + MasterField_Value;
    GridSequr.DataSource := DS_Detail;
    Sequr_Detail.Close;
    Sequr_Detail.Open;
    Caption := 'Пользователи выбранного подразделения';
    Set_Filtr_quick(TDBGrid(GridSequr),'sequr','id_user',Usl);
  end;
end;

procedure TfrmSequr.Sequr_DetailCalcFields(DataSet: TDataSet);
begin
  if DataSet.Active then
    with DataSet do
    begin
      if FieldByName('dostup').AsString = 'read' then FieldByName('DostupCalc').AsString := 'Только чтение'
      else FieldByName('DostupCalc').AsString := 'Полный'
    end;
end;

procedure TfrmSequr.GridSequrTitleBtnClick(Sender: TObject; ACol: Integer;
  Field: TField);
begin
  if Field.Lookup and (Field.FieldName='PodrLook') then
  begin
    try
    (GridSequr.DataSource.DataSet as TSQLClientDataSet).IndexFieldNames := 'id_podrazd';
    except
    end;
  end
  else
   if (Field.FieldName='DostupCalc') then
     (GridSequr.DataSource.DataSet as TSQLClientDataSet).IndexFieldNames := 'dostup'
   else
    (GridSequr.DataSource.DataSet as TSQLClientDataSet).IndexFieldNames := Field.FieldName;

end;

procedure TfrmSequr.BitBtn1Click(Sender: TObject);
begin
  ExportToExcel(GridSequr);
end;

procedure TfrmSequr.GridSequrDblClick(Sender: TObject);
begin
  btEditClick(Sender);
end;

end.
