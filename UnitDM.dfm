object DM: TDM
  OldCreateOrder = False
  Left = 290
  Top = 191
  Height = 312
  Width = 595
  object DBConnection: TSQLConnection
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
      'HostName=10.1.0.11'
      'LocaleCode=0000'
      'Password=~ Dig123'
      'User_Name=root')
    VendorLib = 'LIBMYSQL.dll'
    BeforeConnect = DBConnectionBeforeConnect
    Left = 24
    Top = 8
  end
  object Query: TSQLQuery
    SQLConnection = DBConnection
    Params = <>
    Left = 112
    Top = 8
  end
  object DSRES: TDataSource
    AutoEdit = False
    DataSet = TblRES
    Left = 32
    Top = 120
  end
  object TblPodrazd: TSQLClientDataSet
    CommandText = 'Podrazd'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 95
    Top = 66
    object TblPodrazdid_podrazd: TFMTBCDField
      FieldName = 'id_podrazd'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object TblPodrazdname: TStringField
      FieldName = 'name'
      Required = True
      Size = 200
    end
    object TblPodrazddolg_otv: TStringField
      FieldName = 'dolg_otv'
      Size = 200
    end
    object TblPodrazdfio_otv: TStringField
      FieldName = 'fio_otv'
      Size = 200
    end
    object TblPodrazdteleph_otv: TStringField
      FieldName = 'teleph_otv'
      Size = 200
    end
    object TblPodrazdprim: TStringField
      FieldName = 'prim'
      Size = 255
    end
  end
  object DSPodrazd: TDataSource
    AutoEdit = False
    DataSet = TblPodrazd
    Left = 96
    Top = 120
  end
  object TblRadioseti: TSQLClientDataSet
    CommandText = 'Radioseti'
    Aggregates = <>
    IndexFieldNames = 'number'
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    OnCalcFields = TblRadiosetiCalcFields
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 159
    Top = 66
    object TblRadiosetiid_radioseti: TFMTBCDField
      FieldName = 'id_radioseti'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object TblRadiosetiid_podrazd: TFMTBCDField
      FieldName = 'id_podrazd'
      Precision = 20
      Size = 0
    end
    object TblRadiosetinumber: TIntegerField
      FieldName = 'number'
      Required = True
    end
    object TblRadiosetifreq: TStringField
      FieldName = 'freq'
      Size = 200
    end
    object TblRadiosetinum_razr: TStringField
      FieldName = 'num_razr'
      Size = 200
    end
    object TblRadiosetidate_end_razr: TDateField
      FieldName = 'date_end_razr'
    end
    object TblRadiosetiprim: TStringField
      FieldName = 'prim'
      Size = 255
    end
    object TblRadiosetiPodrLook: TStringField
      FieldKind = fkLookup
      FieldName = 'PodrLook'
      LookupDataSet = TblPodrazd
      LookupKeyFields = 'id_podrazd'
      LookupResultField = 'name'
      KeyFields = 'id_podrazd'
      Lookup = True
    end
    object TblRadiosetistatus: TSmallintField
      FieldName = 'status'
      Required = True
    end
    object TblRadiosetiStatus_calc: TStringField
      FieldKind = fkCalculated
      FieldName = 'Status_calc'
      Calculated = True
    end
  end
  object DSSeti: TDataSource
    AutoEdit = False
    DataSet = TblRadioseti
    Left = 160
    Top = 120
  end
  object tblSequr: TSQLClientDataSet
    CommandText = 'Sequr'
    Aggregates = <>
    Constraints = <
      item
        FromDictionary = False
      end>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    OnCalcFields = tblSequrCalcFields
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 280
    Top = 64
    object tblSequrid_user: TFMTBCDField
      FieldName = 'id_user'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object tblSequrlogin: TStringField
      FieldName = 'login'
      Required = True
    end
    object tblSequrpasswd: TStringField
      FieldName = 'passwd'
      Required = True
    end
    object tblSequrid_podrazd: TFMTBCDField
      FieldName = 'id_podrazd'
      Precision = 20
      Size = 0
    end
    object tblSequrdostup: TStringField
      FieldName = 'dostup'
      Required = True
      FixedChar = True
      Size = 4
    end
    object tblSequrcounter: TFMTBCDField
      FieldName = 'counter'
      Precision = 20
      Size = 0
    end
    object tblSequrpassw1: TStringField
      FieldName = 'passw1'
    end
    object tblSequrDostupCalc: TStringField
      FieldKind = fkCalculated
      FieldName = 'DostupCalc'
      Calculated = True
    end
    object tblSequrPodrLook: TStringField
      FieldKind = fkLookup
      FieldName = 'PodrLook'
      LookupDataSet = TblPodrazd
      LookupKeyFields = 'id_podrazd'
      LookupResultField = 'name'
      KeyFields = 'id_podrazd'
      Lookup = True
    end
    object tblSequrbegin_last_session: TSQLTimeStampField
      FieldName = 'begin_last_session'
    end
    object tblSequrend_last_session: TSQLTimeStampField
      FieldName = 'end_last_session'
    end
  end
  object DSSequr: TDataSource
    AutoEdit = False
    DataSet = tblSequr
    Left = 280
    Top = 120
  end
  object TblRES: TSQLClientDataSet
    CommandText = 'res'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 32
    Top = 64
    object TblRESid_res: TFMTBCDField
      FieldName = 'id_res'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object TblRESid_podrazd: TFMTBCDField
      FieldName = 'id_podrazd'
      Precision = 20
      Size = 0
    end
    object TblREStype: TStringField
      FieldName = 'type'
      Size = 200
    end
    object TblRESplace_install: TStringField
      FieldName = 'place_install'
      Size = 200
    end
    object TblRESmarka: TStringField
      FieldName = 'marka'
      Size = 200
    end
    object TblRESpozivnoi: TStringField
      FieldName = 'pozivnoi'
      Size = 100
    end
    object TblRESklass_izluch: TStringField
      FieldName = 'klass_izluch'
      Size = 100
    end
    object TblRESinv_number: TStringField
      FieldName = 'inv_number'
      Size = 50
    end
    object TblRESserial_num: TStringField
      FieldName = 'serial_num'
      Size = 200
    end
    object TblRESpower: TFloatField
      FieldName = 'power'
    end
    object TblRESdate_vipusk: TDateField
      FieldName = 'date_vipusk'
    end
    object TblRESdate_vvoda: TDateField
      FieldName = 'date_vvoda'
    end
    object TblRESnum_razr_res: TStringField
      FieldName = 'num_razr_res'
      Size = 200
    end
    object TblRESdate_end_razr: TDateField
      FieldName = 'date_end_razr'
    end
    object TblRESstatus: TStringField
      FieldName = 'status'
      Size = 100
    end
    object TblRESprim: TStringField
      FieldName = 'prim'
      Size = 255
    end
    object TblRESPodrazd: TStringField
      FieldKind = fkLookup
      FieldName = 'Podrazd'
      LookupDataSet = TblPodrazd
      LookupKeyFields = 'id_podrazd'
      LookupResultField = 'name'
      KeyFields = 'id_podrazd'
      Lookup = True
    end
    object TblRESFrequency: TStringField
      FieldName = 'Frequency'
      Size = 255
    end
  end
  object tblPar_Base_stat: TSQLClientDataSet
    CommandText = 'par_base_station'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 416
    Top = 112
    object tblPar_Base_statid_par: TFMTBCDField
      FieldName = 'id_par'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object tblPar_Base_statid_res: TFMTBCDField
      FieldName = 'id_res'
      Precision = 20
      Size = 0
    end
    object tblPar_Base_statkoord: TStringField
      FieldName = 'koord'
      Size = 200
    end
    object tblPar_Base_statshirota: TStringField
      FieldName = 'shirota'
      Size = 100
    end
    object tblPar_Base_statdolgota: TStringField
      FieldName = 'dolgota'
      Size = 100
    end
    object tblPar_Base_statvisota_anten: TFloatField
      FieldName = 'visota_anten'
    end
    object tblPar_Base_statvis_anten_ocean: TFloatField
      FieldName = 'vis_anten_ocean'
    end
  end
  object TblAbonent: TSQLClientDataSet
    CommandText = 'abonenti'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 224
    Top = 64
    object TblAbonentid_abonent: TFMTBCDField
      FieldName = 'id_abonent'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object TblAbonentid_res: TFMTBCDField
      FieldName = 'id_res'
      Precision = 20
      Size = 0
    end
    object TblAbonentid_podrazd: TFMTBCDField
      FieldName = 'id_podrazd'
      Precision = 20
      Size = 0
    end
    object TblAbonentid: TStringField
      FieldName = 'id'
      Size = 10
    end
    object TblAbonentabonent_num: TStringField
      FieldName = 'abonent_num'
      Size = 10
    end
    object TblAbonentstatus: TStringField
      FieldName = 'status'
      Size = 200
    end
    object TblAbonentprim: TStringField
      FieldName = 'prim'
      Size = 255
    end
    object TblAbonentres_marka: TStringField
      FieldKind = fkLookup
      FieldName = 'res_marka'
      LookupDataSet = TblRES
      LookupKeyFields = 'id_res'
      LookupResultField = 'marka'
      KeyFields = 'id_res'
      Lookup = True
    end
    object TblAbonentres_serial: TStringField
      FieldKind = fkLookup
      FieldName = 'res_serial'
      LookupDataSet = TblRES
      LookupKeyFields = 'id_res'
      LookupResultField = 'serial_num'
      KeyFields = 'id_res'
      Lookup = True
    end
    object TblAbonentpodrazd: TStringField
      FieldKind = fkLookup
      FieldName = 'podrazd'
      LookupDataSet = TblPodrazd
      LookupKeyFields = 'id_podrazd'
      LookupResultField = 'name'
      KeyFields = 'id_podrazd'
      Lookup = True
    end
  end
  object DSAbonent: TDataSource
    AutoEdit = False
    DataSet = TblAbonent
    Left = 224
    Top = 120
  end
  object tmp_freq1: TSQLQuery
    SQLConnection = DBConnection
    Params = <>
    Left = 176
    Top = 8
  end
  object tmp_freq2: TSQLQuery
    SQLConnection = DBConnection
    Params = <>
    Left = 232
    Top = 8
  end
  object tblInfo: TSQLClientDataSet
    CommandText = 'info'
    Aggregates = <>
    Constraints = <
      item
        FromDictionary = False
      end>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    OnCalcFields = tblSequrCalcFields
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 384
    Top = 56
    object tblInfoid_info: TFMTBCDField
      FieldName = 'id_info'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object tblInfoname_info: TStringField
      FieldName = 'name_info'
      Required = True
      Size = 255
    end
    object tblInfodate: TDateField
      FieldName = 'date'
    end
    object tblInforazrabotchik: TStringField
      FieldName = 'razrabotchik'
      Size = 255
    end
    object tblInfoprim: TStringField
      FieldName = 'prim'
      Size = 255
    end
    object tblInfonumber: TFMTBCDField
      FieldName = 'number'
      Precision = 20
      Size = 0
    end
  end
end
