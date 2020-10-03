unit UEditRSeti_in_RES;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, RXCtrls,MyDB;

type
  TfrmEditRSeti_in_res = class(TForm)
    RxCheckListBox1: TRxCheckListBox;
    Panel1: TPanel;
    btOK: TBitBtn;
    btCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btOKClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditRSeti_in_res: TfrmEditRSeti_in_res;
  id_radioseti_new: array of integer;
  
implementation

{$R *.dfm}
uses UnitAddRES;

procedure TfrmEditRSeti_in_res.FormCreate(Sender: TObject);
begin
  SetLength(id_radioseti_new,0);
end;

procedure TfrmEditRSeti_in_res.btOKClick(Sender: TObject);
var i: Longword;
begin
  frmAddRES.RadioSeti.Clear;
  SetLength(id_radioseti,0);
  for i := 0 to RxCheckListBox1.Items.Count - 1 do
  begin
    if RxCheckListBox1.Checked[i] then
    begin
      frmAddRES.RadioSeti.Items.Add(RxCheckListBox1.Items[i]);
      SetLength(id_radioseti, Length(id_radioseti)+1);
      id_radioseti[high(id_radioseti)] := id_radioseti_new[i];
      frmAddRES.RadioSeti.Checked[FindIndex(id_radioseti_new[i],id_radioseti)] := true;
    end;
  end;
  Close;
end;

procedure TfrmEditRSeti_in_res.btCancelClick(Sender: TObject);
begin
  Close;
end;

end.
