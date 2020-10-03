unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, Provider, SqlExpr, DBClient, DBLocal, DBLocalS, DB,
  ADODB, StdCtrls, FMTBcd, MyDB, Gauges;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ADOConnection1: TADOConnection;
    access: TADOTable;
    accessDSDesigner: TFloatField;
    accessDSDesigner2: TWideStringField;
    accessDSDesigner3: TWideStringField;
    accessDSDesigner4: TFloatField;
    accessDSDesigner5: TWideStringField;
    accessDSDesigner6: TWideStringField;
    accessDSDesigner7: TWideStringField;
    accessDSDesigner8: TWideStringField;
    accessDSDesigner9: TDateTimeField;
    accessDSDesigner10: TWideStringField;
    accessDSDesigner11: TWideStringField;
    accessDSDesigner12: TWideStringField;
    accessDSDesigner13: TWideStringField;
    SQLConnection1: TSQLConnection;
    mysql: TSQLQuery;
    Gauge1: TGauge;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    tmp: TSQLQuery;
    radioseti: TSQLClientDataSet;
    radiosetiid_radioseti: TFMTBCDField;
    radiosetiid_podrazd: TFMTBCDField;
    radiosetinumber: TIntegerField;
    radiosetifreq: TStringField;
    radiosetinum_razr: TStringField;
    radiosetidate_end_razr: TDateField;
    radiosetiprim: TStringField;
    Button2: TButton;
    RES: TSQLClientDataSet;
    RESid_res: TFMTBCDField;
    RESid_podrazd: TFMTBCDField;
    REStype: TStringField;
    RESplace_install: TStringField;
    RESmarka: TStringField;
    RESpozivnoi: TStringField;
    RESklass_izluch: TStringField;
    RESinv_number: TStringField;
    RESserial_num: TStringField;
    RESpower: TFloatField;
    RESdate_vipusk: TDateField;
    RESdate_vvoda: TDateField;
    RESnum_razr_res: TStringField;
    RESdate_end_razr: TDateField;
    RESstatus: TStringField;
    RESprim: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function getword(s:string; var index:integer):string;
var w:string; h:integer;
begin
  w:='';
  h:=Length(s);
  while ((s[index]=' ')or(s[index]=';'))and(index<h) do index:=index+1;
  while (s[index]<>' ') and(s[index]<>';')and (index<>h+1) do begin
                                              w:=w+s[index];
                                              index:=index+1;
                                            end;
  while (s[index]=' ')and(s[index]=';')and(index<h) do index:=index+1;
  getword:=w;
end;

function getword_slash(s:string;var index:integer):string;
var w:string;h:integer;
begin
  w:='';
  h:=Length(s);
  while (s[index]<>'/')and(index<>h+1) do begin
                                              w:=w+s[index];
                                              index:=index+1;
                                            end;
  Result:=w;
end;

procedure TForm1.Button1Click(Sender: TObject);
var i,j,number_seti: integer;
    freq,freq1,freq2: string;
begin
  access.Open;
  access.Last;
  Gauge1.MaxValue := access.RecordCount;
  Gauge1.Progress := 0;
  while not access.Bof do
  begin
    i := 1;
    freq := access.Fields[6].AsString;
    while i<Length(freq) do
    begin
      freq1 := getword(freq,i);
      freq1 := StringReplace(freq1,',','.',[rfReplaceAll]);
      j := 1;
      freq2 := getword_slash(freq1,j);
      with mysql do
      begin
        Close;
        SQL.Text := 'SELECT number FROM Radioseti where freq LIKE ''%'+freq2+'%''';
        Open;
        FindLast;
        if mysql.RecordCount = 0 then
        begin
          Close;
          number_seti := MaxValue(mysql,'Radioseti','number')+1;
          AddToTable(mysql,'Radioseti',['number','freq'],[IntToStr(number_seti),freq1]);
        end;
        Close;
      end;
    end;
    Gauge1.Progress := Gauge1.Progress + 1;
    Button1.Caption := IntToStr(Gauge1.Progress);
    Application.ProcessMessages;
    sleep(100);
    access.Prior;
  end;
  access.Close;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  SQLConnection1.Open;
  radioseti.Open;
  radioseti.First;
  Gauge1.MaxValue := radioseti.RecordCount;
  Gauge1.Progress := 0;
  while not radioseti.Eof do
  begin
{    if radiosetiid_podrazd.AsInteger = 0 then begin
      radioseti.Next; Gauge1.Progress := Gauge1.Progress + 1;Continue end;
 }   tmp.Close;
    tmp.SQL.Text := 'SELECT t1.* from RES as t1, RES_seti as t2 where t1.id_res=t2.id_res and t2.id_radioseti='+
      radiosetiid_radioseti.AsString;
    tmp.Open;
    tmp.First;
    while not tmp.Eof do
    begin
      UpdateToTable(mysql,'RES','id_res',tmp.fieldByName('id_res').AsString,['id_podrazd'],[radiosetiid_podrazd.AsString]);
      tmp.Next;
    end;
    tmp.Close;
    radioseti.Next;
    Gauge1.Progress := Gauge1.Progress + 1;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var status, type1,power: string;
  id_res, id_radioseti, id_podrazd: LongWord;
  freq,freq1,freq2: string;
  i,j: integer;
begin
  ADOConnection1.Open;
  SQLConnection1.Open;
  access.Open;
  Gauge1.MaxValue := access.RecordCount;
  Gauge1.Progress := 0;
  while not access.Eof do
  begin
   access.First;
   //добавляем РЭС
   if access.Fields[5].AsString = 'носимая' then type1 := 'Носимая' else type1 := '';

   if access.Fields[9].AsString = 'РЧЦ ЦФО' then status := 'Активно РЧЦ'
   else
     if access.Fields[9].AsString = 'Новое' then status := 'Новое'
     else status := 'Активно';

   power := StringReplace(FloatToStr(access.Fields[3].AsFloat),',','.',[rfReplaceAll]);

   AddToTable(mysql,'RES',['type','marka','serial_num','power','pozivnoi','place_install','num_razr_res',
    'date_end_razr','klass_izluch','prim','status'],
   [type1,access.Fields[1].AsString,access.Fields[2].AsString,power,access.Fields[4].AsString,
    access.Fields[5].AsString,access.Fields[7].AsString,FormatDateTime('yyyy-MM-dd',access.Fields[8].AsDateTime),access.Fields[12].AsString,
    access.Fields[11].AsString,status]);
   id_res := MaxValue(mysql,'RES','id_res');
  //добавляем связи с радиосетями и c подразделением
    i := 1;
    freq := access.Fields[6].AsString;
    while i<Length(freq) do
    begin
      freq1 := getword(freq,i);
      freq1 := StringReplace(freq1,',','.',[rfReplaceAll]);
      j := 1;
      freq2 := getword_slash(freq1,j);
      with mysql do
      begin
        Close;
        SQL.Text := 'SELECT id_radioseti, id_podrazd FROM Radioseti where freq LIKE ''%'+freq2+'%''';
        Open;
        FindLast;
        if mysql.RecordCount = 1 then
        begin
          First;
          id_radioseti := FieldByName('id_radioseti').AsInteger;
          id_podrazd := FieldByName('id_podrazd').AsInteger;
          Close;
          AddToTable(mysql,'Res_seti',['id_res','id_radioseti'],[IntToStr(id_res),IntToStr(id_radioseti)]);
          if id_podrazd <> 0 then
            UpdateToTable(mysql,'RES','id_res',IntToStr(id_res),['id_podrazd'],[IntToStr(id_podrazd)]);
        end;
        Close;
      end;
    end;
    Gauge1.Progress := Gauge1.Progress + 1;
    Button4.Caption := IntToStr(Gauge1.Progress);
    Application.ProcessMessages;
    sleep(10);
    access.Delete;
  end;
  access.Close;
  ADOConnection1.Close;
  SQLConnection1.Close;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  mysql.Close;
  mysql.SQL.Text := 'select distinct marka from RES';
  mysql.Open;
  mysql.First;
  while not mysql.Eof do
  begin
    AddToTable(tmp,'slmarka',['marka'],[mysql.Fields[0].AsString]);
    mysql.Next;
  end;
  Close;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  SQLConnection1.Open;
  RES.Open;
  RES.First;
  Gauge1.MaxValue := RES.RecordCount - 1;
  Gauge1.Progress := 0;
  while not RES.Eof do
  begin
    tmp.Close;
    tmp.SQL.Text := 'update res set prim='''+RESprim.AsString + ' (по данным РЧЦ)'' where id_res='+RESid_res.AsString;
    tmp.ExecSQL;
    Close;
    Sleep(1000);
    Gauge1.Progress := Gauge1.Progress + 1;
    Button2.Caption := inttostr(Gauge1.Progress);
    Application.ProcessMessages;
    RES.Next;
  end;
end;

end.
