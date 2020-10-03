unit UnitSQL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Provider, SqlExpr, DB, DBClient, DBLocal, DBLocalS, ExtCtrls,
  StdCtrls, ToolWin, ComCtrls, UnitDM, Grids, DBGrids, RXDBCtrl, Placemnt,
  FMTBcd, Buttons, ShellAPI;

type
  TfrmSql = class(TForm)
    Script: TMemo;
    ToolBar1: TToolBar;
    Execute1: TButton;
    Clear: TButton;
    Close1: TButton;
    Splitter1: TSplitter;
    DataSource1: TDataSource;
    GridSQL: TRxDBGrid;
    StatusBar1: TStatusBar;
    SQL_tmp: TSQLClientDataSet;
    SQL_tmp1: TSQLQuery;
    Button1: TButton;
    ToolButton1: TToolButton;
    btHelp: TBitBtn;
    ToolButton2: TToolButton;
    BtStats: TBitBtn;
    Button2: TButton;
    Button3: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Close1Click(Sender: TObject);
    procedure Execute1Click(Sender: TObject);
    procedure ClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btHelpClick(Sender: TObject);
    procedure BtStatsClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSql: TfrmSql;
  script_select: boolean;
  stack: array of string;
  ind: integer;
implementation

{$R *.dfm}

function getword(s:string; var index:integer):string;
var w:string; h:integer;
begin
  w:='';
  h:=Length(s);
  while ((s[index]=' '))and(index<h) do index:=index+1;
  while (s[index]<>' ')and (index<>h+1) do begin
                                              w:=w+s[index];
                                              index:=index+1;
                                            end;
  getword:=w;
end;

procedure TfrmSql.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
   vk_escape: frmSql.Close;
   vk_F9: Execute1Click(Sender);
   vk_f8: ClearClick(Sender);
   vk_f4: Button1Click(Sender);
  end;
end;

procedure TfrmSql.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSql.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmSql.Execute1Click(Sender: TObject);
var
 row_affected: Longword;
 i: integer;
begin
  if Script.Lines.Text = '' then exit;
    i:=1;
    if AnsiUpperCase(getword(Script.Lines.Text,i))='SELECT' then script_select := true
    else script_select := false;
    SetLength(Stack,Length(stack)+1);
    stack[high(stack)] := Script.Lines.Text;
    ind := high(stack);
  if script_select then
  with SQL_tmp do
  begin
    Close;
    CommandText := Script.Lines.Text;
    Open;
    row_affected := SQL_tmp.RecordCount;
  end
  else
  with SQL_tmp1 do
  begin
    Close;
    SQL.Text := Script.Lines.Text;
    ExecSQL;
    row_affected := SQL_tmp1.RowsAffected;
    Close;
  end;
  Script.Lines.Clear;
  StatusBar1.Panels[0].Text := 'Rows affected = ' + IntToStr(row_affected);
end;

procedure TfrmSql.ClearClick(Sender: TObject);
begin
  Script.Lines.Clear;
  SQL_tmp.Close;
  StatusBar1.Panels[0].Text := '';
end;

procedure TfrmSql.FormCreate(Sender: TObject);
begin
  SetLength(stack,0);
end;

procedure TfrmSql.Button1Click(Sender: TObject);
begin
  if length(stack)=0 then exit;
  if ind<0 then ind := high(stack);
  Script.Lines.Text := stack[ind];
  dec(ind);
end;

procedure TfrmSql.btHelpClick(Sender: TObject);
begin
    if FileExists(ExtractFilePath(Application.ExeName)+'Help_SQL\manual.ru.html') then
    begin
      //можно переделать чтоб открывалс€ во встроенном браузере
      ShellExecute(Handle,nil,PChar(ExtractFilePath(Application.ExeName)+'Help_SQL\index.html'),nil,nil,SW_SHOWNORMAL);
    end
    else
      ShowMessage('Ќе удаетс€ найти файл справки.');
end;

procedure TfrmSql.BtStatsClick(Sender: TObject);
begin
  Script.Text := 'Select * from Statistics order by time_connect DESC';
  Execute1Click(Sender);
end;

procedure TfrmSql.Button2Click(Sender: TObject);
begin
  Script.Text := 'Select * from stats_operation order by time_execute DESC';
  Execute1Click(Sender);
end;

procedure TfrmSql.Button3Click(Sender: TObject);
begin
  Script.Text := 'Delete from statistics';
  Execute1Click(Sender);
  BtStatsClick(Sender);
end;

end.
