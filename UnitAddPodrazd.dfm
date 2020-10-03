object frmAddPodrazd: TfrmAddPodrazd
  Left = 327
  Top = 168
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077'  '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
  ClientHeight = 341
  ClientWidth = 202
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
  object Label1: TLabel
    Left = 8
    Top = 192
    Width = 66
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
  end
  object name: TLabeledEdit
    Left = 8
    Top = 16
    Width = 185
    Height = 21
    EditLabel.Width = 134
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103':'
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 0
  end
  object Dolg_otv: TLabeledEdit
    Left = 8
    Top = 64
    Width = 185
    Height = 21
    EditLabel.Width = 144
    EditLabel.Height = 13
    EditLabel.Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1086#1075#1086':'
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 1
  end
  object FIO_otv: TLabeledEdit
    Left = 8
    Top = 111
    Width = 185
    Height = 21
    EditLabel.Width = 113
    EditLabel.Height = 13
    EditLabel.Caption = #1060#1048#1054' '#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1086#1075#1086':'
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 2
  end
  object Tel_otv: TLabeledEdit
    Left = 8
    Top = 159
    Width = 185
    Height = 21
    EditLabel.Width = 128
    EditLabel.Height = 13
    EditLabel.Caption = #1058#1077#1083#1077#1092#1086#1085' '#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1086#1075#1086
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 3
  end
  object Prim: TMemo
    Left = 8
    Top = 208
    Width = 185
    Height = 89
    TabOrder = 4
  end
  object btOK: TBitBtn
    Left = 8
    Top = 312
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 5
    OnClick = btOKClick
  end
  object btCancel: TBitBtn
    Left = 120
    Top = 312
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    TabOrder = 6
    OnClick = btCancelClick
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 72
    Top = 120
  end
end
