unit UnitProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges;

type
  TfrmProgress = class(TForm)
    Indicator: TGauge;
  private
    { Private declarations }
    procedure WMClose(var WM_Close: TWMClose); message wm_close;
  public
    { Public declarations }
  end;

var
  frmProgress: TfrmProgress;

implementation

{$R *.dfm}

{ TfrmProgress }

procedure TfrmProgress.WMClose(var WM_Close: TWMClose);
begin
   WM_Close.Result := 0;
end;

end.
