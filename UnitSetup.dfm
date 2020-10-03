object frmSetup: TfrmSetup
  Left = 350
  Top = 135
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 464
  ClientWidth = 461
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 461
    Height = 423
    ActivePage = TabSheet3
    Align = alClient
    HotTrack = True
    Style = tsFlatButtons
    TabIndex = 2
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1062#1074#1077#1090#1072
      object BtColorPreduprEndRazrFon: TSpeedButton
        Left = 376
        Top = 23
        Width = 67
        Height = 27
        Caption = #1042#1099#1073#1088#1072#1090#1100'...'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = BtColorPreduprEndRazrFonClick
      end
      object ColorPreduprEndRazrFon: TImage
        Left = 341
        Top = 24
        Width = 25
        Height = 25
        Stretch = True
      end
      object Label1: TLabel
        Left = 31
        Top = 29
        Width = 301
        Height = 13
        Alignment = taRightJustify
        Caption = #1055#1088#1077#1076#1091#1087#1088#1077#1078#1076#1077#1085#1080#1077' '#1086#1073' '#1086#1082#1086#1085#1095#1072#1085#1080#1080' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1103' ('#1092#1086#1085'):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 17
        Top = 112
        Width = 315
        Height = 13
        Alignment = taRightJustify
        Caption = #1056#1072#1079#1088#1077#1096#1077#1085#1080#1103' '#1085#1077#1090' '#1080#1083#1080' '#1089#1088#1086#1082' '#1077#1075#1086' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1080#1089#1090#1105#1082' ('#1092#1086#1085'):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ColorEndRazrFon: TImage
        Left = 341
        Top = 106
        Width = 25
        Height = 25
        Stretch = True
      end
      object BtColorEndRazrFon: TSpeedButton
        Left = 376
        Top = 105
        Width = 67
        Height = 27
        Caption = #1042#1099#1073#1088#1072#1090#1100'...'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = BtColorEndRazrFonClick
      end
      object BtColorDefaultFon: TSpeedButton
        Left = 376
        Top = 188
        Width = 67
        Height = 27
        Caption = #1042#1099#1073#1088#1072#1090#1100'...'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = BtColorDefaultFonClick
      end
      object ColorDefaultFon: TImage
        Left = 341
        Top = 189
        Width = 25
        Height = 25
        Stretch = True
      end
      object Label3: TLabel
        Left = 176
        Top = 195
        Width = 156
        Height = 13
        Alignment = taRightJustify
        Caption = #1062#1074#1077#1090' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' ('#1092#1086#1085'):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 21
        Top = 70
        Width = 311
        Height = 13
        Alignment = taRightJustify
        Caption = #1055#1088#1077#1076#1091#1087#1088#1077#1078#1076#1077#1085#1080#1077' '#1086#1073' '#1086#1082#1086#1085#1095#1072#1085#1080#1080' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1103' ('#1090#1077#1082#1089#1090'):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ColorPreduprEndRazrText: TImage
        Left = 341
        Top = 65
        Width = 25
        Height = 25
        Stretch = True
      end
      object BtColorPreduprEndRazrText: TSpeedButton
        Left = 376
        Top = 64
        Width = 67
        Height = 27
        Caption = #1042#1099#1073#1088#1072#1090#1100'...'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = BtColorPreduprEndRazrTextClick
      end
      object Label5: TLabel
        Left = 7
        Top = 153
        Width = 325
        Height = 13
        Alignment = taRightJustify
        Caption = #1056#1072#1079#1088#1077#1096#1077#1085#1080#1103' '#1085#1077#1090' '#1080#1083#1080' '#1089#1088#1086#1082' '#1077#1075#1086' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1080#1089#1090#1105#1082' ('#1090#1077#1082#1089#1090'):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ColorEndRazrText: TImage
        Left = 341
        Top = 147
        Width = 25
        Height = 25
        Stretch = True
      end
      object BtColorEndRazrText: TSpeedButton
        Left = 376
        Top = 146
        Width = 67
        Height = 27
        Caption = #1042#1099#1073#1088#1072#1090#1100'...'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = BtColorEndRazrTextClick
      end
      object Label6: TLabel
        Left = 166
        Top = 237
        Width = 166
        Height = 13
        Alignment = taRightJustify
        Caption = #1062#1074#1077#1090' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' ('#1090#1077#1082#1089#1090'):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ColorDefaultText: TImage
        Left = 341
        Top = 231
        Width = 25
        Height = 25
        Stretch = True
      end
      object BtColorDefaultText: TSpeedButton
        Left = 376
        Top = 230
        Width = 67
        Height = 27
        Caption = #1042#1099#1073#1088#1072#1090#1100'...'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = BtColorDefaultTextClick
      end
      object Label7: TLabel
        Left = 51
        Top = 322
        Width = 281
        Height = 13
        Alignment = taRightJustify
        Caption = #1062#1074#1077#1090' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1079#1072#1087#1080#1089#1080' ('#1090#1077#1082#1089#1090'):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ColorDefaultSelectedText: TImage
        Left = 341
        Top = 316
        Width = 25
        Height = 25
        Stretch = True
      end
      object BtColorDefaultSelectedText: TSpeedButton
        Left = 376
        Top = 315
        Width = 67
        Height = 27
        Caption = #1042#1099#1073#1088#1072#1090#1100'...'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = BtColorDefaultSelectedTextClick
      end
      object BtColorDefaultSelectedFon: TSpeedButton
        Left = 376
        Top = 273
        Width = 67
        Height = 27
        Caption = #1042#1099#1073#1088#1072#1090#1100'...'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = BtColorDefaultSelectedFonClick
      end
      object ColorDefaultSelectedFon: TImage
        Left = 341
        Top = 274
        Width = 25
        Height = 25
        Stretch = True
      end
      object Label8: TLabel
        Left = 61
        Top = 280
        Width = 271
        Height = 13
        Alignment = taRightJustify
        Caption = #1062#1074#1077#1090' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1079#1072#1087#1080#1089#1080' ('#1092#1086#1085'):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btColorSpisRes_fon: TSpeedButton
        Left = 376
        Top = 359
        Width = 67
        Height = 27
        Caption = #1042#1099#1073#1088#1072#1090#1100'...'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btColorSpisRes_fonClick
      end
      object ColorSpisRES_fon: TImage
        Left = 341
        Top = 360
        Width = 25
        Height = 25
        Stretch = True
      end
      object Label13: TLabel
        Left = 168
        Top = 366
        Width = 164
        Height = 13
        Alignment = taRightJustify
        Caption = #1062#1074#1077#1090' '#1089#1087#1080#1089#1072#1085#1085#1086#1081' '#1056#1069#1057' ('#1092#1086#1085'):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1044#1072#1090#1099
      ImageIndex = 1
      object Label9: TLabel
        Left = 69
        Top = 85
        Width = 182
        Height = 26
        Alignment = taRightJustify
        Caption = #1055#1088#1077#1076#1091#1087#1088#1077#1078#1076#1072#1090#1100' '#1086#1073' '#1086#1082#1086#1085#1095#1072#1085#1080#1080' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1103' '#1079#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label10: TLabel
        Left = 313
        Top = 98
        Width = 29
        Height = 13
        Caption = #1076#1085#1077#1081
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 19
        Top = 206
        Width = 232
        Height = 26
        Alignment = taRightJustify
        Caption = #1048#1085#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1086' '#1090#1086#1084', '#1095#1090#1086' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1077' '#1091#1078#1077' '#1085#1077' '#1076#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1086' '#1079#1072' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label12: TLabel
        Left = 313
        Top = 218
        Width = 119
        Height = 26
        Caption = #1076#1085#1077#1081' '#1076#1086' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1089#1088#1086#1082#1072' '#1077#1075#1086' '#1076#1077#1081#1089#1090#1074#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Date_PreduprEndRazr: TSpinEdit
        Left = 256
        Top = 94
        Width = 49
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 0
        Value = 0
      end
      object Date_endRazr: TSpinEdit
        Left = 256
        Top = 215
        Width = 49
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1056#1072#1079#1085#1086#1077
      ImageIndex = 2
      object CheckBox1: TCheckBox
        Left = 24
        Top = 24
        Width = 97
        Height = 17
        Caption = #1040#1074#1090#1086' '#1051#1086#1075#1080#1085
        TabOrder = 0
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 423
    Width = 461
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btOK: TBitBtn
      Left = 42
      Top = 8
      Width = 111
      Height = 25
      Caption = 'OK'
      Default = True
      TabOrder = 0
      OnClick = btOKClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btCancel: TBitBtn
      Left = 328
      Top = 8
      Width = 106
      Height = 25
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = btCancelClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BitBtn1: TBitBtn
      Left = 184
      Top = 8
      Width = 113
      Height = 25
      Caption = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      TabOrder = 2
      OnClick = BitBtn1Click
      Kind = bkAll
    end
  end
  object ColorDialog1: TColorDialog
    Ctl3D = True
    Left = 416
    Top = 8
  end
end
