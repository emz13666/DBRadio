object frmAddAbonent: TfrmAddAbonent
  Left = 354
  Top = 173
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1072#1073#1086#1085#1077#1085#1090#1072
  ClientHeight = 449
  ClientWidth = 355
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
  object RxLabel5: TRxLabel
    Left = 40
    Top = 13
    Width = 85
    Height = 13
    Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077':'
  end
  object RxLabel1: TRxLabel
    Left = 6
    Top = 53
    Width = 120
    Height = 13
    Caption = #1056#1069#1057' ('#1089#1077#1088#1080#1081#1085#1099#1081' '#1085#1086#1084#1077#1088'):'
  end
  object RxLabel2: TRxLabel
    Left = 109
    Top = 93
    Width = 16
    Height = 13
    Caption = 'ID:'
  end
  object RxLabel3: TRxLabel
    Left = 35
    Top = 132
    Width = 89
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1072#1073#1086#1085#1077#1085#1090#1072':'
  end
  object RxLabel4: TRxLabel
    Left = 83
    Top = 172
    Width = 39
    Height = 13
    Caption = #1057#1090#1072#1090#1091#1089':'
  end
  object RxLabel6: TRxLabel
    Left = 54
    Top = 204
    Width = 68
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
  end
  object RxLabel7: TRxLabel
    Left = 64
    Top = 271
    Width = 59
    Height = 13
    Caption = #1056#1072#1076#1080#1086#1089#1077#1090#1080':'
  end
  object cbPodrazdelenie: TRxDBLookupCombo
    Left = 134
    Top = 8
    Width = 201
    Height = 21
    DropDownCount = 8
    LookupField = 'id_podrazd'
    LookupDisplay = 'name'
    LookupSource = DM.DSPodrazd
    TabOrder = 0
    OnChange = cbPodrazdelenieChange
    OnKeyDown = cbPodrazdelenieKeyDown
  end
  object cbRES: TRxDBLookupCombo
    Left = 134
    Top = 48
    Width = 201
    Height = 21
    DropDownCount = 8
    LookupField = 'id_res'
    LookupDisplay = 'serial_num'
    LookupSource = DM.DSRES
    TabOrder = 1
    OnChange = cbRESChange
    OnKeyDown = cbRESKeyDown
  end
  object ID: TEdit
    Left = 134
    Top = 88
    Width = 201
    Height = 21
    TabOrder = 2
  end
  object NumAbon: TEdit
    Left = 134
    Top = 128
    Width = 201
    Height = 21
    TabOrder = 3
  end
  object Status: TComboBox
    Left = 134
    Top = 168
    Width = 202
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
  end
  object Prim: TMemo
    Left = 134
    Top = 206
    Width = 200
    Height = 51
    TabOrder = 5
  end
  object RadioSeti: TRxCheckListBox
    Left = 134
    Top = 272
    Width = 201
    Height = 129
    ItemHeight = 13
    TabOrder = 6
    InternalVersion = 202
  end
  object ADD: TButton
    Left = 19
    Top = 412
    Width = 99
    Height = 25
    Caption = #1054#1050
    TabOrder = 7
    OnClick = ADDClick
  end
  object Cancel: TButton
    Left = 243
    Top = 412
    Width = 90
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 8
    OnClick = CancelClick
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 24
    Top = 320
  end
end
