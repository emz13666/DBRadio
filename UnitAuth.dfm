object frmAuth: TfrmAuth
  Left = 346
  Top = 276
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
  ClientHeight = 196
  ClientWidth = 218
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object btOK: TButton
    Left = 8
    Top = 168
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 3
    OnClick = btOKClick
  end
  object btCancel: TButton
    Left = 136
    Top = 168
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    OnClick = btCancelClick
  end
  object Login: TLabeledEdit
    Left = 8
    Top = 64
    Width = 201
    Height = 21
    EditLabel.Width = 117
    EditLabel.Height = 13
    EditLabel.Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103':'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 1
  end
  object Passw: TLabeledEdit
    Left = 8
    Top = 110
    Width = 201
    Height = 21
    EditLabel.Width = 49
    EditLabel.Height = 13
    EditLabel.Caption = #1055#1072#1088#1086#1083#1100':'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    LabelPosition = lpAbove
    LabelSpacing = 3
    PasswordChar = '@'
    TabOrder = 2
  end
  object Host: TLabeledEdit
    Left = 8
    Top = 16
    Width = 201
    Height = 21
    TabStop = False
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = #1057#1077#1088#1074#1077#1088':'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 0
    Text = '10.60.60.60'
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 142
    Width = 129
    Height = 17
    Hint = #1042#1085#1080#1084#1072#1085#1080#1077'! '#1055#1072#1088#1086#1083#1100' '#1093#1088#1072#1085#1080#1090#1089#1103' '#1074' '#1085#1077#1079#1072#1096#1080#1092#1088#1086#1074#1072#1085#1085#1086#1084' '#1074#1080#1076#1077'!'
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = CheckBox1Click
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredProps.Strings = (
      'Host.Text'
      'Login.Text')
    StoredValues = <>
    Left = 136
    Top = 32
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 168
    Top = 128
  end
end
