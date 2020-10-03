object frmMain: TfrmMain
  Left = 82
  Top = 163
  Width = 899
  Height = 480
  Caption = #1059#1095#1077#1090' '#1056#1069#1057
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 891
    Height = 29
    Caption = 'ToolBar1'
    TabOrder = 0
    object btnMenu: TBitBtn
      Left = 0
      Top = 2
      Width = 97
      Height = 22
      Caption = #1043#1083#1072#1074#1085#1086#1077' '#1084#1077#1085#1102
      TabOrder = 0
      OnClick = btnMenuClick
    end
  end
  object MainMenu1: TMainMenu
    Left = 72
    Top = 40
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object MnuConnect: TMenuItem
        Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103' '#1082' '#1041#1044'...'
        OnClick = MnuConnectClick
      end
      object mnuDisconnect: TMenuItem
        Caption = 'O'#1090#1082#1083#1102#1095#1080#1090#1100#1089#1103' '#1086#1090' '#1041#1044
        Enabled = False
        OnClick = mnuDisconnectClick
      end
      object mnuMenu: TMenuItem
        Caption = #1043#1083#1072#1074#1085#1086#1077' '#1084#1077#1085#1102'...'
        OnClick = mnuMenuClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object MnuExit: TMenuItem
        Caption = #1042#1099#1093#1086#1076' '
        ShortCut = 32856
        OnClick = MnuExitClick
      end
    end
    object mnuTabls: TMenuItem
      Caption = #1058#1072#1073#1083#1080#1094#1099
      Enabled = False
      object mnuPodrazd: TMenuItem
        Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103'...'
        OnClick = mnuPodrazdClick
      end
      object mnuRSeti: TMenuItem
        Caption = #1056#1072#1076#1080#1086#1089#1077#1090#1080'...'
        OnClick = mnuRSetiClick
      end
      object mnuAbonenti: TMenuItem
        Caption = #1040#1073#1086#1085#1077#1085#1090#1099'...'
        OnClick = mnuAbonentiClick
      end
      object MnuRES: TMenuItem
        Caption = #1056#1069#1057'...'
        OnClick = MnuRESClick
      end
      object mnuSequr: TMenuItem
        Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080' '#1080' '#1087#1072#1088#1086#1083#1080'...'
        OnClick = mnuSequrClick
      end
      object mnuInfo: TMenuItem
        Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103'...'
        OnClick = mnuInfoClick
      end
    end
    object C1: TMenuItem
      Caption = 'C'#1077#1088#1074#1080#1089
      object mnuSQL_sript: TMenuItem
        Caption = 'SQL script'
        Enabled = False
        Visible = False
        OnClick = mnuSQL_sriptClick
      end
      object N7: TMenuItem
        Caption = '-'
        Visible = False
      end
      object mnuReservDB: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1088#1077#1079#1077#1088#1074#1085#1091#1102' '#1082#1086#1087#1080#1102' '#1041#1044
        Enabled = False
        OnClick = mnuReservDBClick
      end
      object mnuRestoreDB: TMenuItem
        Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1041#1044' '#1080#1079' '#1088#1077#1079#1077#1088#1074#1085#1086#1081' '#1082#1086#1087#1080#1080'...'
        Enabled = False
        OnClick = mnuRestoreDBClick
      end
      object mnuSetup: TMenuItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080'...'
        OnClick = mnuSetupClick
      end
    end
    object N5: TMenuItem
      Caption = #1054#1082#1085#1072
      object mnuCloseAll: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100' '#1074#1089#1077
        OnClick = mnuCloseAllClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object mnuTileKaskad: TMenuItem
        Caption = #1050#1072#1089#1082#1072#1076#1086#1084
        OnClick = mnuTileKaskadClick
      end
      object mnuTileVert: TMenuItem
        Caption = #1055#1086' '#1074#1077#1088#1090#1080#1082#1072#1083#1080
        OnClick = mnuTileVertClick
      end
      object mnuTileHoriz: TMenuItem
        Caption = #1055#1086' '#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1080
        OnClick = mnuTileHorizClick
      end
    end
    object N3: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      object MySQL1: TMenuItem
        Caption = #1056#1091#1082#1086#1074#1086#1076#1089#1090#1074#1086' '#1087#1086' MySQL'
        Enabled = False
        OnClick = MySQL1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuAbout: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = mnuAboutClick
      end
    end
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 224
    Top = 80
  end
  object OpenDialog1: TOpenDialog
    Filter = #1056#1077#1079#1077#1088#1074#1085#1099#1077' '#1082#1086#1087#1080#1080' '#1041#1044'|*.sql'
    Title = #1042#1099#1073#1086#1088' '#1088#1077#1079#1077#1088#1074#1085#1086#1081' '#1082#1086#1087#1080#1080' '#1076#1083#1103' '#1074#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103
    Left = 336
    Top = 144
  end
end
