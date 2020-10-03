unit MyDB;

interface

uses
  SysUtils,  Classes,  Controls,
  Dialogs, DBLocalS,
  SqlExpr, DB, DBGrids;

procedure AddToListFromDB(var Query: TSQLQuery; List: TStrings; Pole, Table: string);
procedure AddToTable(var Query: TSQLQuery; Table: string; Fields, Values: array of string);
procedure UpdateToTable(var Query: TSQLQuery; Table, KeyField, KeyValue: string; Fields, Values: array of string);
function DeleteFromTable(var Query:TSQLQuery; Table, KeyField, ValueKeyField: string; ShowConf: boolean): boolean;
function CountRecordInMySQLTable(var Query: TSQLQuery; Pole, Znach, Base: String): longint;
function FindIndex(Value: Integer; ArrInt: array of integer): Integer;
function StrToHex(Value: string): String;
function MaxValue(var Query: TSQLQuery; Table, Field: string): Integer;

var
  Add_Edit: boolean = true; //текущий режим - добавления (true) или редактирования записей

implementation

//процедура добавляет в список List все значения поля Pole из таблицы Table
procedure AddToListFromDB(var Query: TSQLQuery;List: TStrings; Pole, Table: string);
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
function CountRecordinMySQLTable(var Query: TSQLQuery; Pole, Znach, Base: String): longint;
begin
  Result := 0;
  Query.Close;
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
procedure AddToTable(var Query: TSQLQuery; Table: string; Fields, Values: array of string);
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
  with Query do
  begin
    try
      Close;
      SQL.Text := q;
      Prepared := true;
      ExecSQL;
      close;
    except
      MessageDlg('Ошибка обращения к базе данных',mtError,[mbOK],0);
    end;
  end;
end;

//процедура изменения записи
procedure UpdateToTable(var Query: TSQLQuery; Table, KeyField, KeyValue: string; Fields, Values: array of string);
var
  i: integer;
  q: string;
begin
  q := 'Update ' + Table + ' set ';

  for i := 0 to high(Fields)-1 do
   if Fields[i] = 'passwd' then
     q := q + fields[i] + '=' + 'PASSWORD(''' + values[i] + '''),'
   else
     if Values[i] = '' then q := q + fields[i] + '=NULL,'
     else  q := q + fields[i] + '=' + '''' + values[i] + ''',';

   if Fields[high(fields)] = 'passwd' then
     q := q + fields[high(fields)] + '=' + 'PASSWORD(''' + values[high(values)] + ''')'
   else
      if Values[High(Values)] = '' then q := q + fields[High(Fields)] + '=NULL'
      else  q := q + fields[High(Fields)] + '=' + '''' + values[High(Fields)] + '''';

  q := q + ' where ' + KeyField + '=''' + KeyValue + '''';

  with Query do
    try
      Close;
      SQL.Text := q;
      Prepared := true;
      ExecSQL;
      close;
    except
      MessageDlg('Ошибка обращения к базе данных',mtError,[mbOK],0);
    end;
end;

function DeleteFromTable(var Query:TSQLQuery; Table, KeyField, ValueKeyField: string; ShowConf: boolean): boolean;
begin
  //удаление выбранной записи
  Result := false;
  if ShowConf then
  begin
    if MessageDlg('Точно удалить запись "' + ValueKeyField + '" ?', mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
        try
          Query.Close;
          Query.SQL.Text := 'Delete from ' + Table + ' where ' +
            KeyField + '=' + ValueKeyField;
          Query.Prepared := true;
          Query.ExecSQL;
          Result := true;
          Query.Close;
        except
          MessageDlg('Ошибка удаления записи',mtError,[mbOK],0);
        end
    end
  end
  else
  begin
      try
        Query.Close;
        Query.SQL.Text := 'Delete from ' + Table + ' where ' +
          KeyField + '=' + ValueKeyField;
        Query.Prepared := true;
        Query.ExecSQL;
        Result := true;
        Query.Close;
      except
        MessageDlg('Ошибка удаления записи',mtError,[mbOK],0);
      end
  end;
end;

function MaxValue(var Query: TSQLQuery; Table, Field: string): Integer;
begin
  with Query do
  begin
    Close;
    SQL.Text := 'SELECT MAX(' + Field + ') as maxvalue FROM ' + Table;
    Open;
    First;
    Result := FieldByName('maxvalue').AsInteger;
    Close;
  end;
end;

end.
