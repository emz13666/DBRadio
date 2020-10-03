object frmAddRSeti: TfrmAddRSeti
  Left = 387
  Top = 148
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1088#1072#1076#1080#1086#1089#1077#1090#1080
  ClientHeight = 372
  ClientWidth = 293
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
  object RxLabel1: TRxLabel
    Left = 29
    Top = 49
    Width = 85
    Height = 13
    Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077':'
  end
  object RxLabel2: TRxLabel
    Left = 48
    Top = 17
    Width = 65
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1089#1077#1090#1080':'
  end
  object RxLabel3: TRxLabel
    Left = 64
    Top = 84
    Width = 49
    Height = 13
    Caption = #1063#1072#1089#1090#1086#1090#1099':'
  end
  object RxLabel4: TRxLabel
    Left = 8
    Top = 118
    Width = 104
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1103':'
  end
  object RxLabel5: TRxLabel
    Left = 16
    Top = 154
    Width = 99
    Height = 13
    Caption = #1044#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1086' '#1076#1086':'
  end
  object RxLabel6: TRxLabel
    Left = 49
    Top = 248
    Width = 68
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
  end
  object RxLabel7: TRxLabel
    Left = 84
    Top = 219
    Width = 28
    Height = 13
    Caption = #1063#1058#1055':'
  end
  object RxLabel8: TRxLabel
    Left = 75
    Top = 186
    Width = 39
    Height = 13
    Caption = #1057#1090#1072#1090#1091#1089':'
  end
  object Podrazd: TRxDBLookupCombo
    Left = 119
    Top = 46
    Width = 151
    Height = 21
    DropDownCount = 8
    LookupField = 'id_podrazd'
    LookupDisplay = 'name'
    LookupSource = DM.DSPodrazd
    TabOrder = 0
    OnKeyDown = PodrazdKeyDown
  end
  object NumSeti: TRxSpinEdit
    Left = 119
    Top = 13
    Width = 151
    Height = 21
    TabOrder = 1
  end
  object Freq: TEdit
    Left = 118
    Top = 80
    Width = 151
    Height = 21
    TabOrder = 2
  end
  object Num_razr: TEdit
    Left = 118
    Top = 114
    Width = 151
    Height = 21
    TabOrder = 3
  end
  object DateEndRazr: TDateEdit
    Left = 119
    Top = 149
    Width = 151
    Height = 21
    NumGlyphs = 2
    TabOrder = 4
  end
  object Prim: TMemo
    Left = 120
    Top = 250
    Width = 151
    Height = 81
    TabOrder = 5
  end
  object btnOK: TBitBtn
    Left = 24
    Top = 341
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 6
    OnClick = btnOKClick
  end
  object btnCancel: TBitBtn
    Left = 200
    Top = 342
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 7
    OnClick = btnCancelClick
  end
  object ChTP: TFilenameEdit
    Left = 120
    Top = 215
    Width = 151
    Height = 21
    NumGlyphs = 1
    TabOrder = 8
  end
  object cbStatus: TComboBox
    Left = 120
    Top = 182
    Width = 150
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 9
    Items.Strings = (
      #1042' '#1088#1072#1073#1086#1090#1077
      #1047#1072#1082#1088#1099#1090#1072#1103)
  end
  object Timer1: TTimer
    Interval = 10
    OnTimer = Timer1Timer
    Left = 33
    Top = 223
  end
end
