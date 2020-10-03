object frmEditRSeti_in_res: TfrmEditRSeti_in_res
  Left = 426
  Top = 256
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 287
  ClientWidth = 174
  Color = clGrayText
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RxCheckListBox1: TRxCheckListBox
    Left = 0
    Top = 0
    Width = 174
    Height = 246
    Align = alClient
    Color = clScrollBar
    ItemHeight = 13
    TabOrder = 0
    InternalVersion = 202
  end
  object Panel1: TPanel
    Left = 0
    Top = 246
    Width = 174
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btOK: TBitBtn
      Left = 7
      Top = 9
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = btOKClick
    end
    object btCancel: TBitBtn
      Left = 92
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btCancelClick
    end
  end
end
