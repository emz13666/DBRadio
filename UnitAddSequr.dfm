object frmAddSequr: TfrmAddSequr
  Left = 439
  Top = 238
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  ClientHeight = 260
  ClientWidth = 215
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 127
    Width = 44
    Height = 13
    Caption = #1044#1086#1089#1090#1091#1087
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 172
    Width = 94
    Height = 13
    Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 12
    Top = 227
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 132
    Top = 227
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    TabOrder = 6
    OnClick = BitBtn2Click
  end
  object Login: TLabeledEdit
    Left = 24
    Top = 16
    Width = 169
    Height = 21
    EditLabel.Width = 37
    EditLabel.Height = 13
    EditLabel.Caption = #1051#1086#1075#1080#1085
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 0
  end
  object Passw2: TLabeledEdit
    Left = 24
    Top = 99
    Width = 169
    Height = 21
    EditLabel.Width = 124
    EditLabel.Height = 13
    EditLabel.Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100
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
  object Passw: TLabeledEdit
    Left = 24
    Top = 57
    Width = 169
    Height = 21
    EditLabel.Width = 45
    EditLabel.Height = 13
    EditLabel.Caption = #1055#1072#1088#1086#1083#1100
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    LabelPosition = lpAbove
    LabelSpacing = 3
    PasswordChar = '@'
    TabOrder = 1
  end
  object dostup: TComboBox
    Left = 24
    Top = 144
    Width = 169
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
    Items.Strings = (
      #1058#1086#1083#1100#1082#1086' '#1095#1090#1077#1085#1080#1077
      #1055#1086#1083#1085#1099#1081)
  end
  object Podrazd: TRxDBLookupCombo
    Left = 24
    Top = 189
    Width = 169
    Height = 21
    DropDownCount = 8
    LookupField = 'id_podrazd'
    LookupDisplay = 'name'
    LookupSource = DM.DSPodrazd
    TabOrder = 4
    OnKeyDown = PodrazdKeyDown
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 113
    Top = 119
  end
end
