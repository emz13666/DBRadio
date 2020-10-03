unit UnitFiltr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBGrids, DB, DBLocalS, RXCtrls;

type
  TfrmFiltr = class(TForm)
    value: TLabeledEdit;
    Field: TComboBox;
    Label1: TLabel;
    SetFiltr: TButton;
    Cancel: TButton;
    UnSetFiltr: TButton;
    Operation: TComboBox;
    Label2: TLabel;
    procedure CancelClick(Sender: TObject);
    procedure SetFiltrClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UnSetFiltrClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFiltr: TfrmFiltr;
  GridFiltr: TDBGrid;
  TableName1: string;
  my_fields1: array of string;
  Key_field1: string;
  DetailFiltr: string = '';

implementation

{$R *.dfm}

uses UnitDM, SqlExpr;

procedure TfrmFiltr.CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFiltr.SetFiltrClick(Sender: TObject);
begin
    GridFiltr.DisableAlign;
    GridFiltr.DataSource.DataSet.Filtered := False;

    with DM.Query do
    begin
      Close;
      if (value.Text <> '') then
      begin
       if Operation.Items[Operation.ItemIndex]='LIKE' then
        SQL.Text := 'select * from ' + TableName1 +' where '
        + my_Fields1[Field.itemindex] + ' ' + Operation.Items[Operation.ItemIndex] + ' ''%' + value.Text + '%'' order by ' + Key_field1
       else
        SQL.Text := 'select * from ' + TableName1 +' where '
        + my_Fields1[Field.itemindex] + ' ' + Operation.Items[Operation.ItemIndex] + ' ''' + value.Text + ''' order by ' + Key_field1;
      end
      else
      begin
        if Operation.Items[Operation.ItemIndex]='<>' then
            SQL.Text := 'select * from ' + TableName1 +' where NOT('
        + my_Fields1[Field.itemindex] + ' is NULL) order by ' + Key_field1
        else
            SQL.Text := 'select * from ' + TableName1 +' where '
        + my_Fields1[Field.itemindex] + ' is NULL order by ' + Key_field1
      end;

      Open;
      FindLast;
      if RecordCount <= 0 then
        GridFiltr.DataSource.DataSet.Filter := Key_field1 + '<0'
      else
      begin
        First;
        if GridFiltr.DataSource.DataSet.Filter = '' then
          GridFiltr.DataSource.DataSet.Filter := '(' + Key_field1 + '=' + fieldByName(Key_field1).AsString
        else
          GridFiltr.DataSource.DataSet.Filter := GridFiltr.DataSource.DataSet.Filter + ' AND (' + Key_field1 + '=' + fieldByName(Key_field1).AsString;
        next;
        while not Eof do
        begin
          GridFiltr.DataSource.DataSet.Filter := GridFiltr.DataSource.DataSet.Filter +
            ' OR ' + Key_field1 + '=' + fieldByName(Key_field1).AsString;
          Next;
        end;
        GridFiltr.DataSource.DataSet.Filter := GridFiltr.DataSource.DataSet.Filter + ')';
      end;
      GridFiltr.EnableAlign;
      GridFiltr.DataSource.DataSet.Filtered := true;
      Close;
    end;
    Close;
end;

procedure TfrmFiltr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.Query.Close;
end;

procedure TfrmFiltr.UnSetFiltrClick(Sender: TObject);
begin
  GridFiltr.DataSource.DataSet.Filtered := False;
  GridFiltr.DataSource.DataSet.Filter := DetailFiltr;
  if DetailFiltr <> '' then GridFiltr.DataSource.DataSet.Filtered := true;
  Close;
end;

procedure TfrmFiltr.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
end;

end.
