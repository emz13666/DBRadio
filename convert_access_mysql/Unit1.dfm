object Form1: TForm1
  Left = 313
  Top = 185
  Width = 408
  Height = 203
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 0
    Top = 156
    Width = 400
    Height = 20
    Align = alBottom
    Progress = 0
  end
  object Button1: TButton
    Left = 144
    Top = 16
    Width = 75
    Height = 25
    Caption = 'add freq'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 112
    Top = 96
    Width = 107
    Height = 25
    Caption = 'Update_podr_res'
    TabOrder = 1
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 232
    Top = 16
    Width = 75
    Height = 25
    Caption = 'add res'
    TabOrder = 2
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 232
    Top = 96
    Width = 89
    Height = 25
    Caption = 'Update_slmarka'
    TabOrder = 3
    OnClick = Button5Click
  end
  object Button2: TButton
    Left = 48
    Top = 16
    Width = 91
    Height = 25
    Caption = 'update_prim_res'
    TabOrder = 4
    OnClick = Button2Click
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\'#1052#1086#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1099'\pr' +
      'ojects\DBRadio\'#1041#1044' '#1056#1069#1057' '#1051#1043#1054#1050'.mdb;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 24
    Top = 56
  end
  object access: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = #1054#1073#1097#1072#1103
    Left = 56
    Top = 56
    object accessDSDesigner: TFloatField
      FieldName = #8470' '#1087#1087
    end
    object accessDSDesigner2: TWideStringField
      FieldName = #1052#1086#1076#1077#1083#1100' '#1056#1069#1057
      Size = 255
    end
    object accessDSDesigner3: TWideStringField
      FieldName = #1047#1072#1074#1086#1076#1089#1082#1086#1081' '#1085#1086#1084#1077#1088
      Size = 255
    end
    object accessDSDesigner4: TFloatField
      FieldName = #1052#1086#1097#1085#1086#1089#1090#1100
    end
    object accessDSDesigner5: TWideStringField
      FieldName = #1055#1086#1079#1099#1074#1085#1086#1081
      Size = 255
    end
    object accessDSDesigner6: TWideStringField
      FieldName = #1056#1072#1079#1084#1077#1097#1077#1085#1080#1077
      Size = 255
    end
    object accessDSDesigner7: TWideStringField
      FieldName = #1056#1072#1073#1086#1095#1080#1077' '#1095#1072#1089#1090#1086#1090#1099' '#1087#1077#1088#1077#1076#1072#1095#1080', '#1087#1088#1080#1105#1084#1072
      Size = 255
    end
    object accessDSDesigner8: TWideStringField
      FieldName = #8470' '#1056#1091#1079#1088#1077#1096#1077#1085#1080#1103' '#1056#1069#1057
      Size = 15
    end
    object accessDSDesigner9: TDateTimeField
      FieldName = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
    end
    object accessDSDesigner10: TWideStringField
      FieldName = #1057#1090#1072#1090#1091#1089
      Size = 15
    end
    object accessDSDesigner11: TWideStringField
      FieldName = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      Size = 25
    end
    object accessDSDesigner12: TWideStringField
      FieldName = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      Size = 250
    end
    object accessDSDesigner13: TWideStringField
      FieldName = #1050#1083#1072#1089#1089' '#1080#1079#1083#1091#1095#1077#1085#1080#1103
      Size = 50
    end
  end
  object SQLConnection1: TSQLConnection
    Connected = True
    ConnectionName = 'MSConnection'
    DriverName = 'MYSQL'
    GetDriverFunc = 'getSQLDriverMYSQL'
    LibraryName = 'dbexpmysql.dll'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=-1'
      'Database=DBRadio'
      'DriverName=MYSQL'
      'ErrorResourceFile='
      'HostName=10.60.60.60'
      'LocaleCode=0000'
      'Password=~ Dig123'
      'User_Name=root')
    VendorLib = 'LIBMYSQL.dll'
    Left = 288
    Top = 56
  end
  object mysql: TSQLQuery
    SQLConnection = SQLConnection1
    Params = <>
    Left = 256
    Top = 56
  end
  object tmp: TSQLQuery
    SQLConnection = SQLConnection1
    Params = <>
    Left = 152
    Top = 56
  end
  object radioseti: TSQLClientDataSet
    CommandText = 'radioseti'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = SQLConnection1
    Left = 184
    Top = 56
    object radiosetiid_radioseti: TFMTBCDField
      FieldName = 'id_radioseti'
      Required = True
      Precision = 20
      Size = 0
    end
    object radiosetiid_podrazd: TFMTBCDField
      FieldName = 'id_podrazd'
      Precision = 20
      Size = 0
    end
    object radiosetinumber: TIntegerField
      FieldName = 'number'
      Required = True
    end
    object radiosetifreq: TStringField
      FieldName = 'freq'
      Size = 200
    end
    object radiosetinum_razr: TStringField
      FieldName = 'num_razr'
      Size = 200
    end
    object radiosetidate_end_razr: TDateField
      FieldName = 'date_end_razr'
    end
    object radiosetiprim: TStringField
      FieldName = 'prim'
      Size = 255
    end
  end
  object RES: TSQLClientDataSet
    CommandText = 'res'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = SQLConnection1
    Left = 320
    Top = 56
    object RESid_res: TFMTBCDField
      FieldName = 'id_res'
      Required = True
      Precision = 20
      Size = 0
    end
    object RESid_podrazd: TFMTBCDField
      FieldName = 'id_podrazd'
      Precision = 20
      Size = 0
    end
    object REStype: TStringField
      FieldName = 'type'
      Size = 200
    end
    object RESplace_install: TStringField
      FieldName = 'place_install'
      Size = 200
    end
    object RESmarka: TStringField
      FieldName = 'marka'
      Size = 200
    end
    object RESpozivnoi: TStringField
      FieldName = 'pozivnoi'
      Size = 100
    end
    object RESklass_izluch: TStringField
      FieldName = 'klass_izluch'
      Size = 100
    end
    object RESinv_number: TStringField
      FieldName = 'inv_number'
      Size = 50
    end
    object RESserial_num: TStringField
      FieldName = 'serial_num'
      Size = 200
    end
    object RESpower: TFloatField
      FieldName = 'power'
    end
    object RESdate_vipusk: TDateField
      FieldName = 'date_vipusk'
    end
    object RESdate_vvoda: TDateField
      FieldName = 'date_vvoda'
    end
    object RESnum_razr_res: TStringField
      FieldName = 'num_razr_res'
      Size = 200
    end
    object RESdate_end_razr: TDateField
      FieldName = 'date_end_razr'
    end
    object RESstatus: TStringField
      FieldName = 'status'
      Size = 100
    end
    object RESprim: TStringField
      FieldName = 'prim'
      Size = 255
    end
  end
end
