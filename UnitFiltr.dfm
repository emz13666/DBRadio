object frmFiltr: TfrmFiltr
  Left = 357
  Top = 275
  BorderStyle = bsDialog
  Caption = #1060#1080#1083#1100#1090#1088
  ClientHeight = 194
  ClientWidth = 265
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
    Top = 2
    Width = 113
    Height = 13
    Caption = #1060#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1087#1086#1083#1102
  end
  object Label2: TLabel
    Left = 10
    Top = 50
    Width = 50
    Height = 13
    Caption = #1054#1087#1077#1088#1072#1094#1080#1103
  end
  object value: TLabeledEdit
    Left = 8
    Top = 119
    Width = 249
    Height = 21
    EditLabel.Width = 94
    EditLabel.Height = 13
    EditLabel.Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1092#1080#1083#1100#1090#1088#1072
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 0
  end
  object Field: TComboBox
    Left = 9
    Top = 19
    Width = 248
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
  end
  object SetFiltr: TButton
    Left = 8
    Top = 158
    Width = 75
    Height = 25
    Caption = 'Set'
    TabOrder = 2
    OnClick = SetFiltrClick
  end
  object Cancel: TButton
    Left = 182
    Top = 158
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = CancelClick
  end
  object UnSetFiltr: TButton
    Left = 96
    Top = 158
    Width = 75
    Height = 25
    Caption = 'UnSet'
    TabOrder = 4
    OnClick = UnSetFiltrClick
  end
  object Operation: TComboBox
    Left = 9
    Top = 69
    Width = 248
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 5
    Items.Strings = (
      'LIKE'
      '='
      '<>'
      '>'
      '<'
      '>='
      '<=')
  end
end
