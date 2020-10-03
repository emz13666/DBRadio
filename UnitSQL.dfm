object frmSql: TfrmSql
  Left = 222
  Top = 107
  Width = 696
  Height = 480
  Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1080#1077' SQL-'#1089#1082#1088#1080#1087#1090#1086#1074
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
  object Splitter1: TSplitter
    Left = 0
    Top = 137
    Width = 688
    Height = 2
    Cursor = crVSplit
    Align = alTop
  end
  object Script: TMemo
    Left = 0
    Top = 29
    Width = 688
    Height = 108
    Align = alTop
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 688
    Height = 29
    Caption = 'ToolBar1'
    TabOrder = 1
    object Execute1: TButton
      Left = 0
      Top = 2
      Width = 75
      Height = 22
      Caption = 'Execute (F9)'
      TabOrder = 0
      OnClick = Execute1Click
    end
    object Clear: TButton
      Left = 75
      Top = 2
      Width = 75
      Height = 22
      Caption = 'Clear(F8)'
      TabOrder = 1
      OnClick = ClearClick
    end
    object Close1: TButton
      Left = 150
      Top = 2
      Width = 75
      Height = 22
      Caption = 'Close(Esc)'
      TabOrder = 2
      OnClick = Close1Click
    end
    object Button1: TButton
      Left = 225
      Top = 2
      Width = 88
      Height = 22
      Caption = 'From stack (F4)'
      TabOrder = 3
      OnClick = Button1Click
    end
    object ToolButton1: TToolButton
      Left = 313
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object BtStats: TBitBtn
      Left = 321
      Top = 2
      Width = 75
      Height = 22
      Caption = 'Statistics'
      TabOrder = 5
      OnClick = BtStatsClick
    end
    object Button3: TButton
      Left = 396
      Top = 2
      Width = 75
      Height = 22
      Caption = 'Clear statistics'
      TabOrder = 7
      OnClick = Button3Click
    end
    object Button2: TButton
      Left = 471
      Top = 2
      Width = 85
      Height = 22
      Caption = 'Stats_operation'
      TabOrder = 6
      OnClick = Button2Click
    end
    object ToolButton2: TToolButton
      Left = 556
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object btHelp: TBitBtn
      Left = 564
      Top = 2
      Width = 75
      Height = 22
      Caption = '&'#1057#1087#1088#1072#1074#1082#1072
      TabOrder = 4
      OnClick = btHelpClick
      Kind = bkHelp
    end
  end
  object GridSQL: TRxDBGrid
    Left = 0
    Top = 139
    Width = 688
    Height = 295
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 434
    Width = 688
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object DataSource1: TDataSource
    DataSet = SQL_tmp
    Left = 184
    Top = 216
  end
  object SQL_tmp: TSQLClientDataSet
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    DBConnection = DM.DBConnection
    Left = 344
    Top = 296
  end
  object SQL_tmp1: TSQLQuery
    SQLConnection = DM.DBConnection
    Params = <>
    Left = 104
    Top = 216
  end
end
