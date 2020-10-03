object frmPoisk: TfrmPoisk
  Left = 357
  Top = 275
  BorderStyle = bsDialog
  Caption = #1055#1086#1080#1089#1082
  ClientHeight = 144
  ClientWidth = 258
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 41
    Width = 43
    Height = 13
    Caption = #1055#1086' '#1087#1086#1083#1102
  end
  object CountFindFields: TRxLabel
    Left = 40
    Top = 88
    Width = 49
    Height = 13
    Caption = #1053#1072#1081#1076#1077#1085#1086':'
  end
  object value: TLabeledEdit
    Left = 8
    Top = 16
    Width = 238
    Height = 21
    EditLabel.Width = 57
    EditLabel.Height = 13
    EditLabel.Caption = #1063#1090#1086' '#1080#1089#1082#1072#1090#1100
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 0
    OnChange = valueChange
  end
  object Field: TComboBox
    Left = 9
    Top = 56
    Width = 240
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = valueChange
  end
  object Find: TButton
    Left = 8
    Top = 110
    Width = 75
    Height = 25
    Caption = 'Find'
    TabOrder = 2
    OnClick = FindClick
  end
  object Cancel: TButton
    Left = 174
    Top = 110
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = CancelClick
  end
end
