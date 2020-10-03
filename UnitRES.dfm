object frmRES: TfrmRES
  Left = 150
  Top = 147
  Width = 856
  Height = 495
  Caption = #1056#1069#1057
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 848
    Height = 29
    ButtonHeight = 21
    ButtonWidth = 25
    Caption = 'ToolBar1'
    TabOrder = 1
    object cbFiltrShow: TComboBox
      Left = 0
      Top = 2
      Width = 73
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 9
      OnChange = cbFiltrShowChange
      Items.Strings = (
        #1042#1089#1077' '#1056#1069#1057
        #1056#1063#1062
        #1051#1043#1054#1050
        #1057#1087#1080#1089#1072#1085#1099#1077)
    end
    object BtnDel: TButton
      Left = 73
      Top = 2
      Width = 75
      Height = 21
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 1
      OnClick = BtnDelClick
    end
    object BttAktSpis: TButton
      Left = 148
      Top = 2
      Width = 82
      Height = 21
      Caption = #1040#1082#1090' '#1089#1087#1080#1089#1072#1085#1080#1103
      TabOrder = 0
      OnClick = BttAktSpisClick
    end
    object btnProtIzm: TButton
      Left = 230
      Top = 2
      Width = 132
      Height = 21
      Caption = #1055#1088#1086#1090#1086#1082#1086#1083#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1081
      TabOrder = 8
      OnClick = btnProtIzmClick
    end
    object btADD: TButton
      Left = 362
      Top = 2
      Width = 75
      Height = 21
      Caption = #1076#1086#1073#1072#1074#1080#1090#1100'...'
      TabOrder = 2
      OnClick = btADDClick
    end
    object btEdit: TButton
      Left = 437
      Top = 2
      Width = 102
      Height = 21
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100'...'
      TabOrder = 3
      OnClick = btEditClick
    end
    object Button1: TButton
      Left = 539
      Top = 2
      Width = 75
      Height = 21
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 10
      OnClick = Button1Click
    end
    object btnPoisk: TBitBtn
      Left = 614
      Top = 2
      Width = 75
      Height = 21
      Caption = #1055#1086#1080#1089#1082
      TabOrder = 4
      OnClick = btnPoiskClick
    end
    object btnFiltr: TBitBtn
      Left = 689
      Top = 2
      Width = 75
      Height = 21
      Caption = #1060#1080#1083#1100#1090#1088
      TabOrder = 5
      OnClick = btnFiltrClick
    end
    object btUpload: TBitBtn
      Left = 764
      Top = 2
      Width = 43
      Height = 21
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btUploadClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
        33333333333F8888883F33330000324334222222443333388F3833333388F333
        000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
        F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
        223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
        3338888300003AAAAAAA33333333333888888833333333330000333333333333
        333333333333333333FFFFFF000033333333333344444433FFFF333333888888
        00003A444333333A22222438888F333338F3333800003A2243333333A2222438
        F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
        22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
        33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object ToolButton1: TToolButton
      Left = 807
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object BitBtn1: TBitBtn
      Left = 815
      Top = 2
      Width = 28
      Height = 21
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      TabStop = False
      OnClick = PrintClick
      Glyph.Data = {
        6A080000424D6A0800000000000036000000280000001C000000190000000100
        1800000000003408000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000407A5644A35E44A35E44A35E44A35E3E9E593E9E593E9E59
        389754389754348C4E348C4E2C87462C87462C8746217E3F217E3F19793B1979
        3B117336117336117336096C2F091E18000000000000000000000000407A566B
        977D5075655075655075655075655075655075654A6A5F4A6A5F4A6A5F4A6A5F
        4A6A5F4A6A5F4A6A5F425E58425E58425E58425E58425E58425E58425E580E6B
        32091E1800000000000000000000000046805C6B977DE8F1E8E8F1E8E6F0E6E4
        EFE4E2EEE3E2EEE3DFECDFDEEBDEDCEADBDCEADBDAE9DAD9E8D9D8E7D8D5E5D5
        D5E5D5D5E5D5D2E4D2D2E4D2D2E4D2D2E4D2117336091E180000000000000000
        0000000046805C6B977DEBF3EBEAF2E9E8F1E8E8F1E8E6F0E6E4EFE4E2EEE3E0
        EEE0DFECDFDEEBDEDCEADBDCEADBDAE9DAD8E7D8D8E7D8D5E5D5D5E5D5D5E5D5
        D2E4D2D2E4D21173360C271E0000000000000000000000004C87616B977DEDF5
        EDEBF3EBEAF2E9E8F1E8E8F1E8E6F0E6E2EEE3E2EEE3E0EEE0DFECDFDEEBDEDC
        EADBDCEADBD9E8D9D8E7D8D8E7D8D5E5D5D5E5D5D5E5D5D2E4D219793B0C271E
        0000000000000000000000004C87616B977DEDF5EDEDF5EDEBF3EBEAF2E9E8F1
        E8E8F1E8E4EFE4E2EEE3E2EEE3E0EEE0DFECDFAAD6B2609963203A26203A2620
        3A26203A26203A26203A26D5E5D519793B0C271E000000000000000000000000
        4C876175A086EFF6EF4A964C25412C25412C25412C25412C25412C25412C2541
        2C25412C194C290E5F143187341173361B6B392B65412B6541395E50203A26D5
        E5D5217E3F0C271E000000000000000000000000548E6675A086F3F8F3DAE9DA
        4A964C6CB67472BB7B72BB7B67B06E5BAA6454A4590368033F93469DD0A76CB6
        74348C4E2C87462C874603680394C79CD8E7D8D8E7D8217E3F12342800000000
        0000000000000000548E6675A086F3F8F3F3F8F3DAE9DA4A964C6CB67472BB7B
        63AC6854A4590368033F93469DD0A767B06E489B533F9346348C4E036803194C
        29A8C2A8D9E8D9D8E7D82C874612342800000000000000000000000057966A75
        A086F5F9F5F3F8F3F3F8F3DAE9DA4A964C6CB67454A4590368033F93469DD0A7
        6CB67454A45954A459489B530368032C8746217E3F0E5F14DAE9DAD9E8D92C87
        4612342800000000000000000000000057966A81AA8DF6FAF5F5F9F5F3F8F3F3
        F8F3DAE9DA4A964C0368033F9346AAD6B272BB7B54A45954A45954A459036803
        39724B568259548E66568259DCEADBDAE9DA2C87461234280000000000000000
        000000005E9B7181AA8DF8FAF8F6FAF6F6FAF5F5F9F5F3F8F394C79CBADEC088
        C79263AC6863AC685BAA6454A459568259CDDACDE2EEE3E2EEE3E0EEE0DFECDF
        DEEBDEDCEADB348C4E1944320000000000000000000000005E9B7181AA8DF9FB
        FAF8FAF8F6FAF6F6FAF594C79C489B5394C79C6CB67467B06E63AC685BAA6456
        8259569A5D036803CDDACDE2EEE3E2EEE3E0EEE0DFECDFDEEBDE389754194432
        00000000000000000000000065A07681AA8DFAFDFAF9FBFAF8FAF894C79C54A4
        59C4E5CA72BB7B72BB7B6CB67463AC6856825967B06E6CB674568259036803CD
        DACDE2EEE3E2EEE3E0EEE0DFECDF389754194432000000000000000000000000
        6BA67B8AB795FBFEFB94C79C67B06EC4E5CA9DD0A788C7927BC18572BB7B6099
        63A8C2A86099636CB67472BB7B6CB67454A459568259036803CDDACDE2EEE3E2
        EEE33E9E591944320000000000000000000000006BA67B8AB795FDFEFD6CB674
        C4E5CA9DD0A788C79288C79272BA83609963D8E7D8F3F8F3CDDACD6099636CB6
        7472BB7B6CB67454A459568259036803E4EFE4E2EEE33E9E5919443200000000
        00000000000000006BA67B8AB795FEFFFE6CB6746CB67467B06E63AC6863AC68
        609963E3EBE3F5F9F5F3F8F3F3F8F3CDDACD609963609963548E665682595682
        59568259E6F0E6E4EFE43E9E59204E3800000000000000000000000070AA808A
        B795FFFFFFFEFFFEFDFEFDFBFEFBFAFDFAFAFDFAF8FAF8F6FAF6F6FAF5F5F9F5
        F3F8F3F3F8F3F1F7F1EDF5EDEDF5EDEBF3EBEAF2E9E8F1E8E8F1E8E6F0E644A3
        5E204E3800000000000000000000000070AA808AB795FFFFFFFFFFFFFFFFFFFE
        FFFEFDFEFDFBFEFBFAFDFAF9FBFAF8FAF8F6FAF6F6FAF5F5F9F5F3F8F3F1F7F1
        EFF6EFEDF5EDEDF5EDEBF3EBEAF2E9E8F1E844A35E204E380000000000000000
        0000000075AF8581AA8D8AB7958AB7958AB7958AB7958AB7958AB79581AA8D81
        AA8D81AA8D81AA8D81AA8D75A08675A08675A08675A08675A0866B977D6B977D
        6B977D6B977D44A35E204E3800000000000000000000000075AF85CCE9D2CCE9
        D2C4E5CAC4E5CAC4E5CABADEC0BADEC0AAD6B2AAD6B2AAD6B29DD0A79DD0A794
        C79C94C79C81BC907BC18572BA8372BA8362B27562B27562B2755BAA64204E38
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000}
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 442
    Width = 848
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object GridRES: TRxDBGrid
    Left = 0
    Top = 29
    Width = 848
    Height = 413
    Align = alClient
    DataSource = DM.DSRES
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = GridRESDrawColumnCell
    OnDblClick = GridRESDblClick
    ShowGlyphs = False
    TitleButtons = True
    OnTitleBtnClick = GridRESTitleBtnClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id_res'
        Title.Caption = #8470
        Width = 22
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Podrazd'
        Title.Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Frequency'
        Title.Caption = #1063#1072#1089#1090#1086#1090#1099
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'type'
        Title.Caption = #1058#1080#1087
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'place_install'
        Title.Caption = #1052#1077#1089#1090#1086' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'marka'
        Title.Caption = #1052#1072#1088#1082#1072
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pozivnoi'
        Title.Caption = #1055#1086#1079#1099#1074#1085#1086#1081
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'serial_num'
        Title.Caption = #1057#1077#1088#1080#1081#1085#1099#1081' '#1085#1086#1084#1077#1088
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_number'
        Title.Caption = #1048#1085#1074'. '#1085#1086#1084#1077#1088
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'power'
        Title.Caption = #1052#1086#1097#1085#1086#1089#1090#1100', '#1042#1090
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'klass_izluch'
        Title.Caption = #1050#1083#1072#1089#1089' '#1080#1079#1083#1091#1095'.'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_vipusk'
        Title.Caption = #1048#1079#1075#1086#1090#1086#1074#1083#1077#1085#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_vvoda'
        Title.Caption = #1042#1074#1086#1076' '#1074' '#1101#1082#1089#1087#1083'.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'num_razr_res'
        Title.Caption = #8470' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1103
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_end_razr'
        Title.Caption = #1044#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1086' '#1076#1086
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'status'
        Title.Caption = #1057#1090#1072#1090#1091#1089
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prim'
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 263
        Visible = True
      end>
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredProps.Strings = (
      'GridRES.Columns')
    StoredValues = <>
    Left = 136
    Top = 176
  end
  object PopupMenu1: TPopupMenu
    Left = 240
    Top = 120
    object N5: TMenuItem
      Caption = #1055#1088#1086#1090#1086#1082#1086#1083#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1081' '#1056#1069#1057
      OnClick = btnProtIzmClick
    end
    object N4: TMenuItem
      Caption = #1040#1082#1090' '#1089#1087#1080#1089#1072#1085#1080#1103' '#1056#1069#1057
      OnClick = BttAktSpisClick
    end
    object N1: TMenuItem
      Caption = #1040#1073#1086#1085#1077#1085#1090#1099' '#1056#1069#1057
      OnClick = N1Click
    end
    object RSeti_res: TMenuItem
      Caption = #1056#1072#1076#1080#1086#1089#1077#1090#1080' '#1056#1069#1057
      OnClick = RSeti_resClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnClick = N3Click
    end
  end
  object DS_res_detail: TDataSource
    AutoEdit = False
    Left = 344
    Top = 136
  end
  object Res_query: TSQLClientDataSet
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    DBConnection = DM.DBConnection
    Left = 440
    Top = 200
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 168
    Top = 104
  end
  object RES_detail: TSQLClientDataSet
    CommandText = 'res'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DM.DBConnection
    Left = 32
    Top = 176
    object FMTBCDField1: TFMTBCDField
      FieldName = 'id_res'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object FMTBCDField2: TFMTBCDField
      FieldName = 'id_podrazd'
      Precision = 20
      Size = 0
    end
    object RES_detailFrequency: TStringField
      FieldName = 'Frequency'
      Size = 255
    end
    object StringField1: TStringField
      FieldName = 'type'
      Size = 200
    end
    object StringField2: TStringField
      FieldName = 'place_install'
      Size = 200
    end
    object StringField3: TStringField
      FieldName = 'marka'
      Size = 200
    end
    object StringField4: TStringField
      FieldName = 'pozivnoi'
      Size = 100
    end
    object StringField5: TStringField
      FieldName = 'klass_izluch'
      Size = 100
    end
    object StringField6: TStringField
      FieldName = 'inv_number'
      Size = 50
    end
    object StringField7: TStringField
      FieldName = 'serial_num'
      Size = 200
    end
    object FloatField1: TFloatField
      FieldName = 'power'
    end
    object DateField1: TDateField
      FieldName = 'date_vipusk'
    end
    object DateField2: TDateField
      FieldName = 'date_vvoda'
    end
    object StringField8: TStringField
      FieldName = 'num_razr_res'
      Size = 200
    end
    object DateField3: TDateField
      FieldName = 'date_end_razr'
    end
    object StringField9: TStringField
      FieldName = 'status'
      Size = 100
    end
    object StringField10: TStringField
      FieldName = 'prim'
      Size = 255
    end
    object RES_detailPodrazd: TStringField
      FieldKind = fkLookup
      FieldName = 'Podrazd'
      LookupDataSet = DM.TblPodrazd
      LookupKeyFields = 'id_podrazd'
      LookupResultField = 'name'
      KeyFields = 'id_podrazd'
      Lookup = True
    end
  end
end
