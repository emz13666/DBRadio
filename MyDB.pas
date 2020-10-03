unit MyDB;

interface

uses
  SysUtils,  Classes,  Controls, StdCtrls, Forms,
  Dialogs, DBLocalS, Registry, Graphics, DateUtils, Variants,
  Windows, SqlExpr, DB, DBGrids, RxDBCtrl, ComObj, ActiveX;

procedure AddToListFromDB(Query: TSQLQuery; List: TStrings; Pole, Table: string);
procedure AddFilesToTable(TblFilesName:string;Fields, Values: array of string);
procedure AddToTable(Table: string; Fields, Values: array of string);
procedure AddToStats_operTable(Fields, Values: array of string);
procedure UpdateToTable(Table, KeyField, KeyValue: string; Fields, Values: array of string);
procedure UpdateToFilesTable(TblFilesName, KeyField, KeyValue: string; Fields, Values: array of string);
Procedure UpdateRESFrequency(var Query1, Query2: TSQLQuery);
function DeleteFromTable(Table, KeyField, ValueKeyField: string; ShowConf: boolean): boolean;
function CountRecordInMySQLTable(Query: TSQLQuery; Pole, Znach, Base: String): longint;
function FindIndex(Value: Integer; ArrInt: array of integer): Integer;
function StrToHex(Value: string): String;
function Crpt(value: string): string;
function ifNullFile(id,KeyName, TableFilesName: string): boolean;
function isNullField(Table,Field,id,Value_id: string): boolean;
Procedure GetFileFromTableFiles(NameTblFiles,KeyField,KeyValue: string; var extension,data: string);
procedure Find_Next(var Grid: TDBGrid; Table_Name, KeyField: string);
procedure Set_Filtr(var Grid: TDBGrid; Table_Name, KeyField: string; IsDetail: boolean; FDetailFiltr: string);
procedure Set_Filtr_quick(var Grid: TDBGrid; Table_Name, KeyFieldName, Uslovie: string);
function MaxValue(Table, Field: string): Integer;
function Null_Query(var Query: TSQLQuery; TableName, Uslovie: string): boolean;
procedure LoadColorAdnDateFromRegistry;
procedure SaveColorAdnDateToRegistry;
procedure saveVersionToRegistry;
procedure LoadAutologinFromRegistry;
procedure SaveAutologinToRegistry;
procedure DeleteFromStatistics;
function DelDBRadioFromRegistry: boolean;
procedure ExportToExcel(Var Grid: TRxDBGrid);

var
  Add_Edit: boolean = true; //текущий режим - добавления (true) или редактирования записей

implementation

uses  UnitDM, UnitProgress, UnitPoisk, UnitFiltr;

//добавляет запись в таблицу статистики операций
procedure AddToStats_operTable(Fields, Values: array of string);
var
  i: integer;
  q, Table: string;

begin
  Table := 'stats_operation';
  if Length(Fields) <> Length (Values) then
  begin
    ShowMessage('Length(Fields) <> Length (Values)');
    exit;
  end;
  q := 'Insert into ' + Table + '(';
  for i := 0 to High(Fields)-1 do    q := q + Fields[i] + ',';
  q := q + Fields[high(Fields)] + ') values(';
  for i := 0 to high(values)-1 do
     if Fields[i]='operation' then
     begin
       q := q + '''' + StringReplace( Values[i],'''','',[rfReplaceAll]) + ''',';
     end
     else q := q + '''' + values[i] + ''',';
  q := q + '''' + Values[high(Values)] + ''')';
  with DM.Query do
  begin
    try
      Close;
      SQL.Text := q;
      Prepared := true;
      ExecSQL;
      close;
    except
      MessageDlg('Ошибка обращения к базе данных (AddToStats_operTable)',mtError,[mbOK],0);
    end;
  end;
end;

//процедура добавляет в список List все значения поля Pole из таблицы Table
procedure AddToListFromDB(Query: TSQLQuery;List: TStrings; Pole, Table: string);
begin
  Query.Close;
  Query.SQL.Text := 'select distinct ' + Pole + ' from ' + Table + ' order by ' + Pole;
 try
  Query.Open;
  Query.First;
  while not Query.Eof do
  begin
    if (Query.FieldByName(Pole).AsString) <> '' then
      List.Add(query.FieldByName(Pole).AsString);
    Query.Next;
  end;
 except
  MessageDlg('Ошибка обращения к базе данных',mtError,[mbOK],0);
 end;
 Query.Close;
end;

//функция возвращает количество связанных с полем Pole записей в таблице Base
function CountRecordinMySQLTable(Query: TSQLQuery; Pole, Znach, Base: String): longint;
begin
  Result := 0;
  Query.Close;
  if Znach='' then znach:='-1';
  Query.SQL.Text := 'select count(*) as kol_vo from ' + Base + ' where ' + Pole + '=' + Znach;
  try
    Query.Open;
    Result := Query.Fields.Fields[0].AsInteger;
  except
    MessageDlg('Ошибка обращения к базе данных',mtError,[mbOK],0);
  end;
  Query.Close;
end;

//возвращает индекс элемента массива, ззначение которого = value
function FindIndex(Value: Integer; ArrInt: array of integer): Integer;
begin
  Result := 0;
  while (Result <= high(ArrInt)) and (Value <> ArrInt[Result]) do inc(Result);
  if Value <> arrint[Result] then Result := -1;
end;

function StrToHex(Value: string): String;
var
  c: char;
  b: byte;
  i: Longword;
begin
  Result := '';
  for i := 1 to length(Value) do
  begin
    c := Value[i];
    asm
      mov al, c
      mov b, al
    end;
    Result := Result + IntToHex(b,2);
  end;
end;


//процедура добавления записи в таблицу
procedure AddToTable(Table: string; Fields, Values: array of string);
var
  i: integer;
  q: string;
begin
  if Length(Fields) <> Length (Values) then
  begin
    ShowMessage('Length(Fields) <> Length (Values)');
    exit;
  end;
  q := 'Insert into ' + Table + '(';
  for i := 0 to High(Fields)-1 do
  begin
    q := q + Fields[i] + ',';
  end;
  q := q + Fields[high(Fields)] + ') values(';
  for i := 0 to high(values)-1 do
  begin
   if Fields[i] = 'passwd' then q := q + 'PASSWORD(''' + values[i] + '''),'
   else
     if Values[i]='' then q := q + 'NULL,'
     else  q := q + '''' + values[i] + ''',';
  end;

  if Fields[High(fields)] = 'passwd' then q := q + 'PASSWORD(''' + Values[high(Values)] + '''))'
  else
    if Values[high(Values)]='' then q := q + 'NULL)'
    else  q := q + '''' + Values[high(Values)] + ''')';
  with DM.Query do
  begin
    try
      Close;
      SQL.Text := q;
      Prepared := true;
      ExecSQL;
      close;
      if UpperCase(Table)<>'STATISTICS' then AddToStats_operTable(['login','operation','time_execute'],[user_name, q, FormatDateTime('yyyy-mm-dd hh-nn-ss',Now)]);
    except
      MessageDlg('Ошибка обращения к базе данных',mtError,[mbOK],0);
    end;
  end;
end;

procedure AddFilesToTable(TblFilesName:string;Fields, Values: array of string);
var
  i: integer;
  q, q1, table: string;

begin
  table := TblFilesName;
  if Length(Fields) <> Length (Values) then
  begin
    ShowMessage('Length(Fields) <> Length (Values)');
    exit;
  end;
  q := 'Insert into ' + Table + '(';
  for i := 0 to High(Fields)-1 do
  begin
    q := q + Fields[i] + ',';
  end;
  q := q + Fields[high(Fields)] + ') values(';
  q1 := q;
  for i := 0 to high(values)-1 do
  begin
   if Values[i]='' then begin q := q + 'NULL,';q1 := q1 + 'NULL,'; end
   else
     if Fields[i] = 'data' then begin q := q + values[i] + ','; q1 := q1 + 'BINARY_DATA,' end
     else
       begin q := q + '''' + values[i] + ''','; q1 := q1 + '''' + values[i] + ''','; end;
  end;

  if Values[high(Values)]='' then begin  q := q + 'NULL)'; q1 := q1 + 'NULL)' end
  else
    if Fields[high(Fields)] = 'data' then begin q := q + values[high(values)] + ')'; q1 := q1 + 'BYNARY_DATA)'; end
    else
     begin q := q + '''' + Values[high(Values)] + ''')'; q1 := q1 + '''' + Values[high(Values)] + ''')'; end;
  with DM.Query do
  begin
    try
      Close;
      SQL.Text := q;
      Prepared := true;
      ExecSQL;
      close;
      AddToStats_operTable(['login','operation','time_execute'],[user_name, q1, FormatDateTime('yyyy-mm-dd hh-nn-ss',Now)]);
    except
      MessageDlg('Ошибка обращения к базе данных',mtError,[mbOK],0);
    end;
  end;
end;

//процедура изменения записи
procedure UpdateToTable(Table, KeyField, KeyValue: string; Fields, Values: array of string);
var
  i: integer;
  query: string;
begin
  query := 'Update ' + Table + ' set ';

  for i := 0 to high(Fields)-1 do
   if Fields[i] = 'passwd' then
     query := query + fields[i] + '=' + 'PASSWORD(''' + values[i] + '''),'
   else
     if Values[i] = '' then query := query + fields[i] + '=NULL,'
     else  query := query + fields[i] + '=' + '''' + values[i] + ''',';

   if Fields[high(fields)] = 'passwd' then
     query := query + fields[high(fields)] + '=' + 'PASSWORD(''' + values[high(values)] + ''')'
   else
      if Values[High(Values)] = '' then query := query + fields[High(Fields)] + '=NULL'
      else  query := query + fields[High(Fields)] + '=' + '''' + values[High(Fields)] + '''';

  query := query + ' where ' + KeyField + '=''' + KeyValue + '''';

  with DM.Query do
    try
      Close;
      SQL.Text := query;
      Prepared := true;
      ExecSQL;
      close;
      if UpperCase(Table)<>'SEQUR' then AddToStats_operTable(['login','operation','time_execute'],[user_name, query, FormatDateTime('yyyy-mm-dd hh-nn-ss',Now)]);
    except
      MessageDlg('Ошибка обращения к базе данных',mtError,[mbOK],0);
    end;
end;

procedure UpdateToFilesTable(TblFilesName, KeyField, KeyValue: string; Fields, Values: array of string);
var
  i: integer;
  query, query_1, Table: string;
begin
  Table :=TblFilesName;
  query := 'Update ' + Table + ' set ';
  query_1 := query;
  for i := 0 to high(Fields)-1 do
     if Values[i] = '' then begin  query := query + fields[i] + '=NULL,'; query_1 := query_1 + fields[i] + '=NULL,' end
     else
       if Fields[i] = 'data' then begin query := query + fields[i] + '=' + values[i] + ','; query_1 := query_1 + fields[i] + '=BYNARY_DATA,'; end
       else begin query := query + fields[i] + '=' + '''' + values[i] + ''','; query_1 := query_1 + fields[i] + '=' + '''' + values[i] + ''','; end;

  if Values[High(Values)] = '' then begin query := query + fields[High(Fields)] + '=NULL'; query_1 := query_1 + fields[High(Fields)] + '=NULL' end
  else
       if Fields[High(Fields)] = 'data' then begin query := query + fields[High(Fields)] + '=' + values[High(Fields)]; query_1 := query_1 + fields[High(Fields)] + '=BYNARY_DATA'; end
       else begin query := query + fields[High(Fields)] + '=' + '''' + values[High(Fields)] + ''''; query_1 := query_1 + fields[High(Fields)] + '=' + '''' + values[High(Fields)] + ''''; end;

  query := query + ' where ' + KeyField + '=''' + KeyValue + '''';
  query_1 := query_1 + ' where ' + KeyField + '=''' + KeyValue + '''';

  with DM.Query do
    try
      Close;
      SQL.Text := query;
      Prepared := true;
      ExecSQL;
      close;
      AddToStats_operTable(['login','operation','time_execute'],[user_name, query_1, FormatDateTime('yyyy-mm-dd hh-nn-ss',Now)]);
    except
      MessageDlg('Ошибка обращения к базе данных',mtError,[mbOK],0);
    end;
end;

function DeleteFromTable(Table, KeyField, ValueKeyField: string; ShowConf: boolean): boolean;
var query1: string;
begin
  //удаление выбранной записи
  Result := false;
  if ShowConf then
  begin
    if MessageDlg('Точно удалить запись "' + ValueKeyField + '" ?', mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
        try
          DM.Query.Close;
          DM.Query.SQL.Text := 'Delete from ' + Table + ' where ' +
            KeyField + '=' + ValueKeyField;
          query1 := DM.Query.SQL.Text;
          DM.Query.Prepared := true;
          DM.Query.ExecSQL;
          Result := true;
          DM.Query.Close;
          AddToStats_operTable(['login','operation','time_execute'],[user_name, query1, FormatDateTime('yyyy-mm-dd hh-nn-ss',Now)]);
        except
          MessageDlg('Ошибка удаления записи',mtError,[mbOK],0);
        end
    end
  end
  else
  begin
      try
        DM.Query.Close;
        DM.Query.SQL.Text := 'Delete from ' + Table + ' where ' +
          KeyField + '=' + ValueKeyField;
        query1 := DM.Query.SQL.Text;
        DM.Query.Prepared := true;
        DM.Query.ExecSQL;
        Result := true;
        DM.Query.Close;
        AddToStats_operTable(['login','operation','time_execute'],[user_name, query1, FormatDateTime('yyyy-mm-dd hh-nn-ss',Now)]);
      except
        MessageDlg('Ошибка удаления записи',mtError,[mbOK],0);
      end
  end;
end;

function ifNullFile(id,KeyName, TableFilesName: string): boolean;
begin
  Result := True;
  if CountRecordInMySQLTable(DM.Query,keyname,id,TableFilesName)=1 then
  begin
    with DM.Query do
    begin
      Close;
      SQL.Text := 'SELECT * from '+ TableFilesName + ' WHERE ' + KeyName+'='+id;
      Open;
      First;
      if FieldByName('data').AsString <> '' then Result := False;
      Close;
    end;
  end;
end;

Procedure GetFileFromTableFiles(NameTblFiles,KeyField,KeyValue: string; var extension,data: string);
begin
  with DM.Query do
  begin
    Close;
    SQL.Text := 'SELECT * FROM '+NameTblFiles +' WHERE ' + KeyField + '=' + KeyValue;
    Open;
    First;
    extension := fieldByName('extension').AsString;
    data := fieldByName('data').AsString;
    Close;
  end;
end;

procedure Find_Next(var Grid: TDBGrid; Table_Name, KeyField: string);
var
  i: byte;
begin
  if not Grid.DataSource.DataSet.Active then exit;
  SetLength(my_fields, 0);
  frmPoisk.Field.Items.Clear;
  frmPoisk.value.Text := '';
  for i := 0 to grid.Columns.Count - 1 do
  begin
    if Grid.Columns[i].Field.Calculated or Grid.Columns[i].Field.Lookup or Grid.Columns[i].Field.IsBlob then continue;
    SetLength(my_fields,length(my_fields)+1);
    my_fields[high(my_fields)] := Grid.Columns[i].FieldName;
    frmPoisk.Field.Items.Add(Grid.Columns[i].Title.Caption);
  end;
  frmPoisk.Field.ItemIndex := 0;
  gridPoisk := grid;
  TableName := Table_Name;
  Key_field := KeyField;
  frmPoisk.Show;
end;

procedure Set_Filtr(var Grid: TDBGrid; Table_Name, KeyField: string; IsDetail: boolean; FDetailFiltr: string);
var
  i: byte;
begin
  if not Grid.DataSource.DataSet.Active then exit;
  if IsDetail  then DetailFiltr := FDetailFiltr;
  SetLength(my_fields1, 0);
  frmFiltr.Field.Items.Clear;
  frmFiltr.value.Text := '';
  for i := 0 to grid.Columns.Count - 1 do
  begin
    if Grid.Columns[i].Field.Calculated or Grid.Columns[i].Field.Lookup or Grid.Columns[i].Field.IsBlob then continue;
    SetLength(my_fields1,length(my_fields1)+1);
    my_fields1[high(my_fields1)] := Grid.Columns[i].FieldName;
    frmFiltr.Field.Items.Add(Grid.Columns[i].Title.Caption);
  end;
  frmFiltr.Field.ItemIndex := 0;
  frmFiltr.Operation.ItemIndex := 0;
  GridFiltr := Grid;
  TableName1 := Table_Name;
  Key_field1 := KeyField;
  frmFiltr.Show;
end;

function MaxValue(Table, Field: string): Integer;
begin
  with DM.Query do
  begin
    Close;
    SQL.Text := 'SELECT MAX(' + Field + ') as maxvalue FROM ' + Table;
    Open;
    First;
    Result := FieldByName('maxvalue').AsInteger;
    Close;
  end;
end;

function isNullField(Table,Field,id,Value_id: string): boolean;
begin
  Result := false;
  begin
    with DM.Query do
    begin
      Close;
      SQL.Text := 'SELECT * from ' + Table + ' WHERE ' + id+'='+Value_id +' and ';
      Open;
      First;
      if FieldByName('data').AsString <> '' then Result := False;
      Close;
    end;
  end;
end;

procedure Set_Filtr_quick(var Grid: TDBGrid; Table_Name, KeyFieldName, Uslovie: string);
begin
  if not Grid.DataSource.DataSet.Active then exit;
  Grid.DisableAlign;
  with DM.Query do
    begin
      Close;
      SQL.Text := 'select * from ' + Table_Name +' where ' + uslovie + ' order by ' + KeyFieldName;
      Open;
      FindLast;
      if RecordCount <= 0 then
        Grid.DataSource.DataSet.Filter := KeyFieldName + '<0'
      else
      begin
        First;
        if Grid.DataSource.DataSet.Filter = '' then
          Grid.DataSource.DataSet.Filter := '(' + KeyFieldName + '=' + fieldByName(KeyFieldName).AsString
        else
          Grid.DataSource.DataSet.Filter := Grid.DataSource.DataSet.Filter + ' AND (' + KeyFieldName + '=' + fieldByName(KeyFieldName).AsString;
        next;
        while not Eof do
        begin
          Grid.DataSource.DataSet.Filter := Grid.DataSource.DataSet.Filter +
            ' OR ' + KeyFieldName + '=' + fieldByName(KeyFieldName).AsString;
          Next;
        end;
        Grid.DataSource.DataSet.Filter := Grid.DataSource.DataSet.Filter + ')';
      end;
      Grid.EnableAlign;
      Grid.DataSource.DataSet.Filtered := true;
      Close;
    end;
end;

function Null_Query(var Query: TSQLQuery; TableName, Uslovie: string): boolean;
begin
  Query.Close;
  Query.SQL.Text := 'SELECT * FROM ' + TableName + ' WHERE ' + Uslovie;
  Query.Open;
  Result := Query.IsEmpty;
  Query.Close;
end;

Procedure UpdateRESFrequency(var Query1, Query2: TSQLQuery);
var
  FValue: string;
begin
    FValue := '';
    Query2.Close;
    Query2.SQL.Text := 'SELECT id_res FROM RES';
    Query2.Open;
    Query2.First;
    while not Query2.Eof do
    begin
      Query1.Close;
      Query1.SQL.Text := 'select RES_seti.id_res, Radioseti.freq from RES_seti, Radioseti where RES_seti.id_res='
        + Query2.FieldByName('id_res').AsString + ' and Radioseti.id_radioseti=RES_seti.id_radioseti';
      Query1.Open;
      Query1.First;
      FValue := Query1.FieldByName('freq').AsString + '; ';
      Query1.Next;
      while not Query1.Eof do
      begin
        FValue := FValue + Query1.FieldByName('freq').AsString + '; ';
        Query1.next;
      end;
      UpdateToTable('RES', 'id_res', Query2.FieldByName('id_res').AsString,['Frequency'],[FValue]);
      Query1.Close;
      Query2.Next;
    end;
    Query2.Close;
end;

procedure LoadAutologinFromRegistry;
var
  Reestr: TRegistry;
begin
  Reestr := TRegistry.Create;
  Reestr.RootKey := HKEY_CURRENT_USER;
  try
  if Reestr.KeyExists('SOFTWARE\DBRadio\0') then
  begin
    Reestr.OpenKey('SOFTWARE\DBRadio\0', true);
    if Reestr.ValueExists('AutoLOGON') then
      Auto_Login := Reestr.ReadBool('AutoLOGON')
    else begin Auto_Login := false; saveautologintoregistry end;

    Reestr.CloseKey;
    Reestr.Free;

  end
  else
  begin
    Reestr.Free;
    Auto_Login := false;
    SaveAutologinToRegistry;
  end;
  except
    Reestr.Free;
  end;
end;

procedure SaveAutologinToRegistry;
var
  Reestr: TRegistry;
begin
  Reestr := TRegistry.Create;
  Reestr.RootKey := HKEY_CURRENT_USER;
  try
  if not Reestr.KeyExists('SOFTWARE\DBRadio\0') then  Reestr.CreateKey('SOFTWARE\DBRadio\0');
  Reestr.OpenKey('SOFTWARE\DBRadio\0', false);
  Reestr.WriteBool('AutoLOGON', Auto_Login);
  finally
  Reestr.CloseKey;
  Reestr.Free;
  end;
end;

procedure SaveColorAdnDateToRegistry;
var
  Reestr: TRegistry;
begin
  Reestr := TRegistry.Create;
  Reestr.RootKey := HKEY_CURRENT_USER;
  try
  if Reestr.KeyExists('SOFTWARE\DBRadio\ColorAndDates') then  Reestr.DeleteKey('SOFTWARE\DBRadio\ColorAndDates');
  Reestr.OpenKey('SOFTWARE\DBRadio\ColorAndDates', true);
  Reestr.WriteInteger('Color_EndRazrFon', Color_EndRazrFon);
  Reestr.WriteInteger('Color_SpisRES_fon', Color_SpisRESFon);
  Reestr.WriteInteger('Color_EndRazrText',Color_EndRazrText);
  Reestr.WriteInteger('Color_PreduprEndRazrFon', Color_PreduprEndRazrFon);
  Reestr.WriteInteger('Color_PreduprEndRazrText',Color_PreduprEndRazrText);
  Reestr.WriteInteger('Color_DefaultText', Color_DefaultText);
  Reestr.WriteInteger('Color_DefaultFon',Color_DefaultFon);
  Reestr.WriteInteger('Color_DefaultSelectedFon', Color_DefaultSelectedFon);
  Reestr.WriteInteger('Color_DefaultSelectedText', Color_DefaultSelectedText);
  Reestr.WriteInteger('DatePreduprEndRazr',DatePreduprEndRazr);
  Reestr.WriteInteger('DateEndRazr', DateEndRazr);
  finally
  Reestr.CloseKey;
  Reestr.Free;
  end;
end;

procedure LoadColorAdnDateFromRegistry;
var
 Reestr: TRegistry;
begin
  Reestr := TRegistry.Create;
  Reestr.RootKey := HKEY_CURRENT_USER;
  try
  if Reestr.KeyExists('SOFTWARE\DBRadio\ColorAndDates') then
  begin
    Reestr.OpenKey('SOFTWARE\DBRadio\ColorAndDates', true);
    Color_EndRazrFon := Reestr.ReadInteger('Color_EndRazrFon');
    Color_EndRazrText := Reestr.ReadInteger('Color_EndRazrText');
    Color_PreduprEndRazrFon := Reestr.ReadInteger('Color_PreduprEndRazrFon');
    Color_PreduprEndRazrText := Reestr.ReadInteger('Color_PreduprEndRazrText');
    Color_DefaultText := Reestr.ReadInteger('Color_DefaultText');
    Color_DefaultFon := Reestr.ReadInteger('Color_DefaultFon');
    Color_DefaultSelectedFon := Reestr.ReadInteger('Color_DefaultSelectedFon');
    Color_DefaultSelectedText := Reestr.ReadInteger('Color_DefaultSelectedText');
    try
      Color_SpisRESFon := Reestr.ReadInteger('Color_SpisRES_fon');
    except
      Color_SpisRESFon := clGray;
      Reestr.WriteInteger('Color_SpisRES_fon', Color_SpisRESFon);
    end;
    DatePreduprEndRazr := Reestr.ReadInteger('DatePreduprEndRazr');
    DateEndRazr := Reestr.ReadInteger('DateEndRazr');
    Reestr.CloseKey;
    Reestr.Free;
  end
  else
  begin
    Reestr.Free;
    Color_EndRazrFon := $c080ff;
    Color_EndRazrText := clBlack;
    Color_PreduprEndRazrFon := clYellow;
    Color_PreduprEndRazrText := clBlue;
    Color_DefaultFon := clWhite;
    Color_DefaultText := clBlack;
    Color_DefaultSelectedFon := clBlack;
    Color_DefaultSelectedText := clWhite;
    Color_SpisRESFon := clGray;
    DatePreduprEndRazr := 60; {предупреждать за 60 дней}
    DateEndRazr := 10;        {окончание разрешения - индикатор срабатывает за 10 дней}
    SaveColorAdnDateToRegistry;
  end;
  except
    Reestr.Free
  end;
end;

function DelDBRadioFromRegistry: boolean;
var reest: TRegistry;
begin
  Result := True;
  reest := TRegistry.Create;
  try
  reest.RootKey := HKEY_CURRENT_USER;
  if reest.KeyExists('SOFTWARE\DBRadio') then
    Result := reest.DeleteKey('SOFTWARE\DBRadio');
  finally
  reest.Free;
  end;
end;

procedure DeleteFromStatistics;
var years, months, days: word;
   query1: string;
begin
  with DM.Query do
  begin
    Close;
    SQL.Text := 'Select COUNT(*) from Statistics';
    Open;
    First;
    if Fields[0].AsInteger > 10000 then
    begin
      Close;
      DecodeDate(Date, years,months,days);
      IncAMonth(years,months,days,-1);
      SQL.Text := 'Delete from Statistics where time_connect < ' + FormatDateTime('yyyy-mm-dd',EncodeDate(years,months,days));
      query1 := SQL.Text;
      ExecSQL;
      Close;
      AddToStats_operTable(['login','operation','time_execute'],[user_name, query1, FormatDateTime('yyyy-mm-dd hh-nn-ss',Now)]);
    end;
    Close;
    SQL.Text := 'Select COUNT(*) from Statistics';
    Open;
    First;
    if Fields[0].AsInteger > 10000 then
    begin
      Close;
      SQL.Text := 'Delete from Statistics where time_connect < ' + FormatDateTime('yyyy-mm-dd',IncDay(Date,-14));
      query1 := SQL.Text;
      ExecSQL;
      Close;
      AddToStats_operTable(['login','operation','time_execute'],[user_name, query1, FormatDateTime('yyyy-mm-dd hh-nn-ss',Now)]);
    end;
    Close;
  end;
end;

function WhichLanguage:string;
var
  ID: LangID;
  Language: array [0..100] of char;
begin
  ID := GetSystemDefaultLangID;
  VerLanguageName(ID, Language, 100);
  Result := string(Language);
end;

function IsOLEObjectInstalled(Name: String): boolean;
var
  ClassID: TCLSID;
  Rez : HRESULT;
begin
  // Ищем CLSID OLE-объекта
  Rez := CLSIDFromProgID(PWideChar(WideString(Name)), ClassID);
  if Rez = S_OK then  // Объект найден
    Result := true
  else
    Result := false;
end;

procedure ExportToExcel(Var Grid: TRxDBGrid);
var
  ExcelApp, WorkBook: Variant;
var
  bm: TBookmark;
  col, row: Integer;
  sline: string;
  mem: TMemo;
  Layout: array[0.. KL_NAMELENGTH] of char;
begin
//установлен ли EXCEL
  if not IsOLEObjectInstalled('Excel.Application') then
  begin
    ShowMessage('Экспорт невозможен. Excel не установлен.');
    exit;
  end;

 // Создание Excel
      ExcelApp := CreateOleObject('Excel.Application');


  WorkBook := ExcelApp.WorkBooks.Add;
  frmProgress.Show;
  frmProgress.Indicator.MaxValue := Grid.DataSource.DataSet.RecordCount;
  frmProgress.Indicator.Progress := 0;
  Screen.Cursor := crHourglass;
  Grid.DataSource.DataSet.DisableControls;
  bm := Grid.DataSource.DataSet.GetBookmark;
  Grid.DataSource.DataSet.First;

  // Сперва отправляем данные в memo
  // работает быстрее, чем отправлять их напрямую в Excel
  mem := TMemo.Create(frmFiltr);
  mem.Parent := frmFiltr;
  mem.Visible := false;
  mem.Clear;
  sline := '';

  // добавляем информацию для имён колонок
  for col := 0 to Grid.Columns.Count-1 do
    sline := sline + Grid.Columns[col].Title.Caption + #9;
  mem.Lines.Add(sline);

  // получаем данные из DBGrid
  for row := 0 to Grid.DataSource.DataSet.RecordCount-1 do
  begin
    frmProgress.Indicator.Progress := frmProgress.Indicator.Progress + 1;
    sline := '';
    for col := 0 to Grid.Columns.Count-1 do
      if Grid.Columns[col].Field.AsString='30.12.1899' then
        sline := sline + #9
      else
        sline := sline + Grid.Columns[col].Field.AsString + #9;
    mem.Lines.Add(sline);
    Grid.DataSource.DataSet.Next;
  end;

  // копируем данные в clipboard
  mem.SelectAll;
  // переключаем раскладку на русский
  LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);
  mem.CopyToClipboard;
  mem.Free;

  frmProgress.Close;

  // отправляем их в Excel

  Workbook.WorkSheets[1].Paste;
  Workbook.WorkSheets[1].Range['A1','AA1'].Font.Size := 11;
  Workbook.WorkSheets[1].Range['A1','AA1'].Font.Bold := true;
  Workbook.WorkSheets[1].Columns.AutoFit;
  Workbook.WorkSheets[1].Range['A1',EmptyParam].Select;

  ExcelApp.Visible := true;

  Grid.DataSource.DataSet.GotoBookmark(bm);
  Grid.DataSource.DataSet.FreeBookmark(bm);
  Grid.DataSource.DataSet.EnableControls;
  Screen.Cursor := crDefault;

end;

function Crpt(value: string): string;
var i: Longword;
begin
  Result := '';
  for i:=1 to length(value) do
    Result := Result + chr(ord(value[i]) xor 13);
end;

procedure saveVersionToRegistry;
var reestr: TRegistry;
begin
  reestr := TRegistry.Create;
  reestr.RootKey := HKEY_CURRENT_USER;
  try
  if reestr.OpenKey('SOFTWARE\DBRadio\Version',true) then
  begin
    reestr.WriteString('VersionDBRadio',VersionDBRadio);
    reestr.CloseKey;
  end;
  finally
  reestr.Free;
  end;
end;

end.
