object frmAddInfo: TfrmAddInfo
  Left = 387
  Top = 148
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
  ClientHeight = 303
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
    Left = 20
    Top = 37
    Width = 81
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
  end
  object RxLabel4: TRxLabel
    Left = 29
    Top = 108
    Width = 70
    Height = 13
    Caption = #1056#1072#1079#1088#1072#1073#1086#1090#1095#1080#1082':'
  end
  object RxLabel5: TRxLabel
    Left = 68
    Top = 76
    Width = 31
    Height = 13
    Caption = #1044#1072#1090#1072':'
  end
  object RxLabel6: TRxLabel
    Left = 31
    Top = 175
    Width = 68
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
  end
  object RxLabel2: TRxLabel
    Left = 62
    Top = 145
    Width = 34
    Height = 13
    Caption = #1060#1072#1081#1083':'
  end
  object Label1: TLabel
    Left = 41
    Top = 8
    Width = 57
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1087'/'#1087':'
  end
  object Name_info: TEdit
    Left = 104
    Top = 34
    Width = 177
    Height = 21
    TabOrder = 0
  end
  object Razr_info: TEdit
    Left = 103
    Top = 104
    Width = 179
    Height = 21
    TabOrder = 1
  end
  object Prim: TMemo
    Left = 104
    Top = 177
    Width = 177
    Height = 81
    TabOrder = 3
  end
  object btnOK: TBitBtn
    Left = 24
    Top = 268
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 4
    OnClick = btnOKClick
  end
  object btnCancel: TBitBtn
    Left = 200
    Top = 269
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 5
    OnClick = btnCancelClick
  end
  object Data_info: TFilenameEdit
    Left = 103
    Top = 142
    Width = 179
    Height = 21
    NumGlyphs = 1
    TabOrder = 2
  end
  object Date_info: TDateTimePicker
    Left = 104
    Top = 70
    Width = 180
    Height = 21
    CalAlignment = dtaLeft
    Date = 39595.5826173611
    Time = 39595.5826173611
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 6
  end
  object edtNumber: TSpinEdit
    Left = 104
    Top = 4
    Width = 177
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 7
    Value = 0
  end
  object Timer1: TTimer
    Interval = 10
    OnTimer = Timer1Timer
    Left = 33
    Top = 221
  end
end
