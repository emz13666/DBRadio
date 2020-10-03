object frmAddRES: TfrmAddRES
  Left = 205
  Top = 125
  ActiveControl = Vis_ant
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1056#1069#1057
  ClientHeight = 559
  ClientWidth = 638
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
  object RxLabel1: TRxLabel
    Left = 360
    Top = 272
    Width = 59
    Height = 13
    Caption = #1056#1072#1076#1080#1086#1089#1077#1090#1080':'
  end
  object RxLabel2: TRxLabel
    Left = 29
    Top = 337
    Width = 68
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
  end
  object RxLabel3: TRxLabel
    Left = 21
    Top = 279
    Width = 74
    Height = 13
    Caption = #1040#1082#1090' '#1089#1087#1080#1089#1072#1085#1080#1103':'
  end
  object RxLabel4: TRxLabel
    Left = 57
    Top = 239
    Width = 39
    Height = 13
    Caption = #1057#1090#1072#1090#1091#1089':'
  end
  object RxLabel5: TRxLabel
    Left = 13
    Top = 13
    Width = 85
    Height = 13
    Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077':'
  end
  object RxLabel6: TRxLabel
    Left = 369
    Top = 12
    Width = 48
    Height = 13
    Caption = #1058#1080#1087' '#1056#1069#1057':'
  end
  object RxLabel7: TRxLabel
    Left = 327
    Top = 54
    Width = 91
    Height = 13
    Caption = #1057#1077#1088#1080#1081#1085#1099#1081' '#1085#1086#1084#1077#1088':'
  end
  object RxLabel8: TRxLabel
    Left = 6
    Top = 52
    Width = 92
    Height = 13
    Caption = #1052#1077#1089#1090#1086' '#1091#1089#1090#1072#1085#1086#1074#1082#1080':'
  end
  object RxLabel9: TRxLabel
    Left = 60
    Top = 92
    Width = 38
    Height = 13
    Caption = #1052#1072#1088#1082#1072':'
  end
  object RxLabel10: TRxLabel
    Left = 21
    Top = 167
    Width = 76
    Height = 13
    Caption = #1052#1086#1097#1085#1086#1089#1090#1100', '#1042#1090':'
  end
  object RxLabel11: TRxLabel
    Left = 344
    Top = 132
    Width = 77
    Height = 13
    Caption = #1044#1072#1090#1072' '#1074#1099#1087#1091#1089#1082#1072':'
  end
  object RxLabel12: TRxLabel
    Left = 314
    Top = 167
    Width = 109
    Height = 13
    Caption = #1044#1072#1090#1072' '#1074#1074#1086#1076#1072' '#1074' '#1101#1082#1089#1087#1083'.:'
  end
  object RxLabel14: TRxLabel
    Left = 315
    Top = 203
    Width = 104
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1103':'
  end
  object Label1: TLabel
    Left = 11
    Top = 199
    Width = 85
    Height = 26
    Alignment = taRightJustify
    Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1103':'
    WordWrap = True
  end
  object RxLabel20: TRxLabel
    Left = 359
    Top = 94
    Width = 63
    Height = 13
    Caption = #1048#1085#1074'. '#1085#1086#1084#1077#1088':'
  end
  object RxLabel21: TRxLabel
    Left = 41
    Top = 130
    Width = 57
    Height = 13
    Caption = #1055#1086#1079#1099#1074#1085#1086#1081':'
  end
  object RxLabel22: TRxLabel
    Left = 326
    Top = 237
    Width = 91
    Height = 13
    Caption = #1050#1083#1072#1089#1089' '#1080#1079#1083#1091#1095#1077#1085#1080#1103':'
  end
  object Label2: TLabel
    Left = 34
    Top = 301
    Width = 60
    Height = 26
    Caption = #1055#1088#1086#1090#1086#1082#1086#1083#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1081':'
    WordWrap = True
  end
  object cbType: TComboBox
    Left = 424
    Top = 8
    Width = 201
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = cbTypeChange
  end
  object Place_install: TEdit
    Left = 104
    Top = 48
    Width = 201
    Height = 21
    TabOrder = 2
  end
  object Marka: TComboBox
    Left = 104
    Top = 88
    Width = 201
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
  end
  object btNew_marka: TButton
    Left = 307
    Top = 88
    Width = 33
    Height = 22
    Caption = 'New..'
    TabOrder = 17
    TabStop = False
    OnClick = btNew_markaClick
  end
  object Serial_num: TEdit
    Left = 424
    Top = 50
    Width = 201
    Height = 21
    TabOrder = 3
  end
  object Date_vipusk: TDateTimePicker
    Left = 424
    Top = 128
    Width = 201
    Height = 21
    CalAlignment = dtaLeft
    Date = -363.242195983803
    Time = -363.242195983803
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 6
  end
  object Date_vvoda: TDateTimePicker
    Left = 424
    Top = 163
    Width = 201
    Height = 21
    CalAlignment = dtaLeft
    Date = -363.242195983803
    Time = -363.242195983803
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 8
  end
  object Num_razr: TEdit
    Left = 423
    Top = 198
    Width = 201
    Height = 21
    TabOrder = 10
  end
  object Date_end_razr: TDateTimePicker
    Left = 104
    Top = 201
    Width = 201
    Height = 21
    CalAlignment = dtaLeft
    Date = -363.242195983767
    Time = -363.242195983767
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 7
  end
  object Status: TComboBox
    Left = 103
    Top = 236
    Width = 201
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 9
  end
  object Prim: TMemo
    Left = 102
    Top = 336
    Width = 201
    Height = 62
    TabOrder = 12
  end
  object ADD: TButton
    Left = 128
    Top = 530
    Width = 99
    Height = 24
    Caption = #1054#1050
    TabOrder = 15
    OnClick = ADDClick
  end
  object Cancel: TButton
    Left = 423
    Top = 530
    Width = 90
    Height = 24
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 16
    OnClick = CancelClick
  end
  object AktSpis: TFilenameEdit
    Left = 102
    Top = 275
    Width = 200
    Height = 21
    NumGlyphs = 1
    TabOrder = 11
  end
  object cbPodrazdelenie: TRxDBLookupCombo
    Left = 104
    Top = 8
    Width = 201
    Height = 21
    DropDownCount = 8
    LookupField = 'id_podrazd'
    LookupDisplay = 'name'
    LookupSource = DM.DSPodrazd
    TabOrder = 0
    OnKeyDown = cbPodrazdelenieKeyDown
  end
  object RadioSeti: TRxCheckListBox
    Left = 424
    Top = 272
    Width = 201
    Height = 126
    Enabled = False
    ItemHeight = 13
    TabOrder = 14
    InternalVersion = 202
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 404
    Width = 320
    Height = 117
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1073#1072#1079#1086#1074#1086#1081' '#1056#1069#1057
    TabOrder = 13
    TabStop = True
    object RxLabel15: TRxLabel
      Left = 59
      Top = 21
      Width = 148
      Height = 13
      Caption = #1042#1099#1089#1086#1090#1072' '#1087#1086#1076#1074#1077#1089#1072' '#1072#1085#1090#1077#1085#1085#1099', '#1084':'
    end
    object RxLabel16: TRxLabel
      Left = 28
      Top = 71
      Width = 168
      Height = 13
      Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1099' '#1091#1089#1090#1072#1085#1086#1074#1082#1080' '#1072#1085#1090#1077#1085#1085#1099':'
    end
    object RxLabel18: TRxLabel
      Left = 29
      Top = 94
      Width = 25
      Height = 13
      Caption = #1089'.'#1096'.:'
    end
    object RxLabel19: TRxLabel
      Left = 194
      Top = 94
      Width = 23
      Height = 13
      Caption = #1079'.'#1076'.:'
    end
    object RxLabel23: TRxLabel
      Left = 8
      Top = 46
      Width = 199
      Height = 13
      Caption = #1042#1099#1089#1086#1090#1072' '#1072#1085#1090#1077#1085#1085#1099' '#1085#1072#1076' '#1091#1088#1086#1074#1085#1077#1084' '#1084#1086#1088#1103', '#1084':'
    end
    object Vis_ant: TRxCalcEdit
      Left = 215
      Top = 16
      Width = 97
      Height = 21
      AutoSize = False
      NumGlyphs = 2
      TabOrder = 0
    end
    object Shirota: TEdit
      Left = 58
      Top = 91
      Width = 59
      Height = 21
      TabOrder = 2
    end
    object Dolgota: TEdit
      Left = 221
      Top = 91
      Width = 57
      Height = 21
      TabOrder = 3
    end
    object Vis_ant_ocean: TRxCalcEdit
      Left = 215
      Top = 43
      Width = 97
      Height = 21
      AutoSize = False
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object power: TRxCalcEdit
    Left = 104
    Top = 163
    Width = 201
    Height = 21
    AutoSize = False
    NumGlyphs = 2
    TabOrder = 5
  end
  object IsAbonNum: TCheckBox
    Left = 425
    Top = 447
    Width = 152
    Height = 17
    Caption = #1040#1073#1086#1085#1077#1085#1090#1089#1082#1080#1081' '#1085#1086#1084#1077#1088
    TabOrder = 18
    OnClick = IsAbonNumClick
  end
  object GroupBox2: TGroupBox
    Left = 425
    Top = 462
    Width = 201
    Height = 61
    TabOrder = 19
    Visible = False
    object RxLabel13: TRxLabel
      Left = 48
      Top = 15
      Width = 16
      Height = 13
      Caption = 'ID:'
    end
    object RxLabel17: TRxLabel
      Left = 25
      Top = 38
      Width = 39
      Height = 13
      Caption = #1053#1086#1084#1077#1088':'
    end
    object ID: TEdit
      Left = 72
      Top = 11
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object AbonNum: TEdit
      Left = 72
      Top = 34
      Width = 121
      Height = 21
      TabOrder = 1
    end
  end
  object Inv_number: TEdit
    Left = 424
    Top = 90
    Width = 201
    Height = 21
    TabOrder = 20
  end
  object pozivnoi: TEdit
    Left = 104
    Top = 126
    Width = 201
    Height = 21
    TabOrder = 21
  end
  object Klass_izl: TEdit
    Left = 424
    Top = 233
    Width = 201
    Height = 21
    TabOrder = 22
  end
  object EditRSeti: TBitBtn
    Left = 424
    Top = 403
    Width = 201
    Height = 25
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1088#1072#1076#1080#1086#1089#1077#1090#1080'...'
    TabOrder = 23
    OnClick = EditRSetiClick
  end
  object ProtIzm: TFilenameEdit
    Left = 102
    Top = 304
    Width = 200
    Height = 21
    NumGlyphs = 1
    TabOrder = 24
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 336
    Top = 16
  end
end
