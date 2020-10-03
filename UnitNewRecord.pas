unit UnitNewRecord;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmNewRecord = class(TForm)
    New_value: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNewRecord: TfrmNewRecord;

implementation

{$R *.dfm}

end.
