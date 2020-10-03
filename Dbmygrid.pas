unit Dbmygrid;

interface

uses

  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, StdCtrls, ExtCtrls, Grids, DBGrids;

type

  TMultiLineDBGrid = class(TRxDBGrid)
  private
    FLinesPerRow: Integer;
    procedure DrawDataCell(Sender: TObject; const Rect: TRect; Field: TField;
      State: TGridDrawState);
    procedure LayoutChanged; override;
    procedure SetLinesPerRow(ALinesPerRow: Integer);
  public
    property LinesPerRow: Integer read FLinesPerRow write SetLinesPerRow default
      1;
    constructor Create(AOwner: TComponent); override;
  end;

implementation

constructor TMultiLineDBGrid.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);
  FLinesPerRow := 1;
  OnDrawDataCell := DrawDataCell;
end;

procedure TMultiLineDBGrid.LayOutChanged;
begin

  inherited LayOutChanged;
  DefaultRowHeight := DefaultRowHeight * LinesPerRow;
end;

procedure TMultiLineDBGrid.DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
var

  Format: Word;
  C: array[0..255] of Char;
begin

  if LinesPerRow = 1 then
    Format := DT_SINGLELINE or DT_LEFT
  else
    Format := DT_LEFT or DT_WORDBREAK;

  Canvas.FillRect(Rect);

  StrPCopy(C, Field.AsString);
  WinProcs.DrawText(Canvas.Handle, C, StrLen(C), Rect, Format);
end;

procedure TMultiLineDBGrid.SetLinesPerRow(ALinesPerRow: Integer);
begin

  if ALinesPerRow <> FLinesPerRow then
  begin
    FLinesPerRow := ALinesPerRow;
    LayoutChanged;
  end;
end;

end.

