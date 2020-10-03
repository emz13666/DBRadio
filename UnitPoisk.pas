unit UnitPoisk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBGrids, DB, DBLocalS, RXCtrls;

type
  TfrmPoisk = class(TForm)
    value: TLabeledEdit;
    Field: TComboBox;
    Label1: TLabel;
    Find: TButton;
    Cancel: TButton;
    CountFindFields: TRxLabel;
    procedure CancelClick(Sender: TObject);
    procedure valueChange(Sender: TObject);
    procedure FindClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPoisk: TfrmPoisk;
  GridPoisk: TDBGrid;
  TableName: string;
  my_fields: array of string;
  flNext: boolean;
  Key_field: string;

implementation

{$R *.dfm}
uses UnitDM, SqlExpr;

procedure TfrmPoisk.CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPoisk.valueChange(Sender: TObject);
begin
  dm.Query.Close;
  flNext := false;
  Find.Caption := 'Find';
  CountFindFields.Caption := 'Найдено:'
end;

procedure TfrmPoisk.FindClick(Sender: TObject);
begin
  if value.Text = '' then exit;
  if flNext then
  begin
    if not(dm.Query.eof)then
    begin
      Dm.Query.Next;
      try
         (GridPoisk.DataSource.DataSet as TSQLClientDataSet).Locate(Key_Field,DM.Query.FieldByName(Key_field).AsString,[])
      except
         flNext := false;
         FindClick(Sender);
      end;
    end
    else
    begin
      dm.Query.First;
    end
  end
  else
    with DM.Query do
    begin
      Close;
      if dostupAll_user then
        SQL.Text := 'select * from ' + TableName +' where '
        + my_Fields[Field.itemindex] + ' like ''%' + value.Text + '%'' order by ' + Key_field
      else
        SQL.Text := 'select * from ' + TableName +' where '
        + my_Fields[Field.itemindex] + ' like ''%' + value.Text + '%'' and id_podrazd=' +
        IntToStr(id_podrazd_user) + ' order by ' + Key_field;
      Open;
      FindLast;
      CountFindFields.Caption := 'Найдено: ' + IntToStr(RecordCount) + ' записей.';
      if RecordCount <= 0 then
       close
      else
      begin
        First;
        flNext := true;
        Find.Caption := 'Next';
        (GridPoisk.DataSource.DataSet as TSQLClientDataSet).Locate(Key_Field,FieldByName(Key_field).AsString,[]);
      end;
    end;
end;

procedure TfrmPoisk.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.Query.Close;
  flNext := false;
end;

procedure TfrmPoisk.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
end;

end.
