object frmAbonent: TfrmAbonent
  Left = 222
  Top = 107
  Width = 765
  Height = 480
  Caption = #1040#1073#1086#1085#1077#1085#1090#1099
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
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 757
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    TabOrder = 1
    object BtnDel: TButton
      Left = 0
      Top = 2
      Width = 75
      Height = 24
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 0
      OnClick = BtnDelClick
    end
    object btADD: TButton
      Left = 75
      Top = 2
      Width = 75
      Height = 24
      Caption = #1076#1086#1073#1072#1074#1080#1090#1100'...'
      TabOrder = 1
      OnClick = btADDClick
    end
    object btEdit: TButton
      Left = 150
      Top = 2
      Width = 102
      Height = 24
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100'...'
      TabOrder = 2
      OnClick = btEditClick
    end
    object btnPoisk: TBitBtn
      Left = 252
      Top = 2
      Width = 75
      Height = 24
      Caption = #1055#1086#1080#1089#1082
      TabOrder = 3
      OnClick = btnPoiskClick
    end
    object btnFiltr: TBitBtn
      Left = 327
      Top = 2
      Width = 75
      Height = 24
      Caption = #1060#1080#1083#1100#1090#1088
      TabOrder = 4
      OnClick = btnFiltrClick
    end
    object ToolButton1: TToolButton
      Left = 402
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object BitBtn1: TBitBtn
      Left = 410
      Top = 2
      Width = 26
      Height = 24
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
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
    Top = 427
    Width = 757
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object GridAbonent: TRxDBGrid
    Left = 0
    Top = 29
    Width = 757
    Height = 398
    Align = alClient
    DataSource = DM.DSAbonent
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
    OnDrawColumnCell = GridAbonentDrawColumnCell
    OnDblClick = GridAbonentDblClick
    ShowGlyphs = False
    Columns = <
      item
        Expanded = False
        FieldName = 'id_abonent'
        Title.Alignment = taCenter
        Title.Caption = #8470
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'podrazd'
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'res_marka'
        Title.Alignment = taCenter
        Title.Caption = #1052#1072#1088#1082#1072' '#1056#1069#1057
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'res_serial'
        Title.Alignment = taCenter
        Title.Caption = #1057#1077#1088#1080#1081#1085#1099#1081' '#1085#1086#1084#1077#1088' '#1056#1069#1057
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abonent_num'
        Title.Alignment = taCenter
        Title.Caption = #1053#1086#1084#1077#1088' '#1072#1073#1086#1085#1077#1085#1090#1072
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'status'
        Title.Alignment = taCenter
        Title.Caption = #1057#1090#1072#1090#1091#1089
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prim'
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 102
        Visible = True
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 200
    Top = 120
    object N1: TMenuItem
      Caption = #1056#1069#1057' '#1072#1073#1086#1085#1077#1085#1090#1072
      OnClick = N1Click
    end
    object res_abon: TMenuItem
      Caption = #1056#1072#1076#1080#1086#1089#1077#1090#1080' '#1072#1073#1086#1085#1077#1085#1090#1072
      OnClick = res_abonClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnClick = N3Click
    end
  end
  object DS_Detail: TDataSource
    DataSet = Abonent_detail
    Left = 128
    Top = 248
  end
  object Abonent_detail: TSQLClientDataSet
    CommandText = 'abonenti'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DM.DBConnection
    Left = 248
    Top = 200
    object Abonent_detailid_abonent: TFMTBCDField
      FieldName = 'id_abonent'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object Abonent_detailid_res: TFMTBCDField
      FieldName = 'id_res'
      Precision = 20
      Size = 0
    end
    object Abonent_detailid_podrazd: TFMTBCDField
      FieldName = 'id_podrazd'
      Precision = 20
      Size = 0
    end
    object Abonent_detailid: TStringField
      FieldName = 'id'
      Size = 10
    end
    object Abonent_detailabonent_num: TStringField
      FieldName = 'abonent_num'
      Size = 10
    end
    object Abonent_detailstatus: TStringField
      FieldName = 'status'
      Size = 200
    end
    object Abonent_detailprim: TStringField
      FieldName = 'prim'
      Size = 255
    end
    object Abonent_detailres_marka: TStringField
      FieldKind = fkLookup
      FieldName = 'res_marka'
      LookupDataSet = DM.TblRES
      LookupKeyFields = 'id_res'
      LookupResultField = 'marka'
      KeyFields = 'id_res'
      Lookup = True
    end
    object Abonent_detailres_serial: TStringField
      FieldKind = fkLookup
      FieldName = 'res_serial'
      LookupDataSet = DM.TblRES
      LookupKeyFields = 'id_res'
      LookupResultField = 'serial_num'
      KeyFields = 'id_res'
      Lookup = True
    end
    object Abonent_detailpodrazd: TStringField
      FieldKind = fkLookup
      FieldName = 'podrazd'
      LookupDataSet = DM.TblPodrazd
      LookupKeyFields = 'id_podrazd'
      LookupResultField = 'name'
      KeyFields = 'id_podrazd'
      Lookup = True
    end
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredProps.Strings = (
      'GridAbonent.Columns')
    StoredValues = <>
    Left = 224
    Top = 80
  end
end
