unit UnitDM;

interface

uses
  SysUtils, Classes, Provider, SqlExpr, DB, DBClient, DBLocal, DBLocalS,
  DBXpress, FMTBcd, Graphics, WinSock;

type
  TDM = class(TDataModule)
    DBConnection: TSQLConnection;
    Query: TSQLQuery;
    DSRES: TDataSource;
    TblPodrazd: TSQLClientDataSet;
    DSPodrazd: TDataSource;
    TblRadioseti: TSQLClientDataSet;
    DSSeti: TDataSource;
    TblPodrazdid_podrazd: TFMTBCDField;
    TblPodrazdname: TStringField;
    TblPodrazddolg_otv: TStringField;
    TblPodrazdfio_otv: TStringField;
    TblPodrazdteleph_otv: TStringField;
    TblRadiosetiid_radioseti: TFMTBCDField;
    TblRadiosetiid_podrazd: TFMTBCDField;
    TblRadiosetinumber: TIntegerField;
    TblRadiosetifreq: TStringField;
    TblRadiosetinum_razr: TStringField;
    TblRadiosetidate_end_razr: TDateField;
    TblPodrazdprim: TStringField;
    TblRadiosetiprim: TStringField;
    TblRadiosetiPodrLook: TStringField;
    tblSequr: TSQLClientDataSet;
    DSSequr: TDataSource;
    tblSequrid_user: TFMTBCDField;
    tblSequrlogin: TStringField;
    tblSequrpasswd: TStringField;
    tblSequrid_podrazd: TFMTBCDField;
    tblSequrdostup: TStringField;
    tblSequrcounter: TFMTBCDField;
    tblSequrpassw1: TStringField;
    tblSequrDostupCalc: TStringField;
    TblRES: TSQLClientDataSet;
    TblRESid_res: TFMTBCDField;
    TblRESid_podrazd: TFMTBCDField;
    TblREStype: TStringField;
    TblRESplace_install: TStringField;
    TblRESmarka: TStringField;
    TblRESpozivnoi: TStringField;
    TblRESklass_izluch: TStringField;
    TblRESinv_number: TStringField;
    TblRESserial_num: TStringField;
    TblRESpower: TFloatField;
    TblRESdate_vipusk: TDateField;
    TblRESdate_vvoda: TDateField;
    TblRESnum_razr_res: TStringField;
    TblRESdate_end_razr: TDateField;
    TblRESstatus: TStringField;
    TblRESprim: TStringField;
    TblRESPodrazd: TStringField;
    tblPar_Base_stat: TSQLClientDataSet;
    tblPar_Base_statid_par: TFMTBCDField;
    tblPar_Base_statid_res: TFMTBCDField;
    tblPar_Base_statkoord: TStringField;
    tblPar_Base_statshirota: TStringField;
    tblPar_Base_statdolgota: TStringField;
    tblPar_Base_statvisota_anten: TFloatField;
    TblAbonent: TSQLClientDataSet;
    TblAbonentid_abonent: TFMTBCDField;
    TblAbonentid_res: TFMTBCDField;
    TblAbonentid_podrazd: TFMTBCDField;
    TblAbonentid: TStringField;
    TblAbonentabonent_num: TStringField;
    TblAbonentstatus: TStringField;
    TblAbonentprim: TStringField;
    DSAbonent: TDataSource;
    TblAbonentres_marka: TStringField;
    TblAbonentres_serial: TStringField;
    TblAbonentpodrazd: TStringField;
    tblSequrPodrLook: TStringField;
    TblRESFrequency: TStringField;
    tmp_freq1: TSQLQuery;
    tmp_freq2: TSQLQuery;
    tblSequrbegin_last_session: TSQLTimeStampField;
    tblSequrend_last_session: TSQLTimeStampField;
    tblInfo: TSQLClientDataSet;
    tblInfoid_info: TFMTBCDField;
    tblInfoname_info: TStringField;
    tblInfodate: TDateField;
    tblInforazrabotchik: TStringField;
    tblInfoprim: TStringField;
    tblPar_Base_statvis_anten_ocean: TFloatField;
    TblRadiosetistatus: TSmallintField;
    TblRadiosetiStatus_calc: TStringField;
    tblInfonumber: TFMTBCDField;
    procedure tblSequrCalcFields(DataSet: TDataSet);
    procedure DBConnectionBeforeConnect(Sender: TObject);
    procedure TblRadiosetiCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetLocalIP: String;

const VersionDBRadio='1.4.0';
const DateOfRelease='19.04.2016';

var
  DM: TDM;
  id_user: integer;
  user_name: string;
  dostupAll_user: boolean;
  id_podrazd_user: integer;
  counter_user: Longword;
  Auto_Login: boolean;

  Color_EndRazrFon, Color_EndRazrText, Color_SpisRESFon,
  Color_PreduprEndRazrFon, Color_PreduprEndRazrText,
  Color_DefaultFon, Color_DefaultText,
  Color_DefaultSelectedFon, Color_DefaultSelectedText: TColor;
  DatePreduprEndRazr, DateEndRazr: integer;

implementation

uses UnitRES;

{$R *.dfm}

function GetLocalIP: String;
const WSVer = $101;
var
  wsaData: TWSAData;
  P: PHostEnt;
  Buf: array [0..127] of Char;
begin
  Result := '';
  if WSAStartup(WSVer, wsaData) = 0 then begin
    if GetHostName(@Buf, 128) = 0 then begin
      P := GetHostByName(@Buf);
      if P <> nil then Result := iNet_ntoa(PInAddr(p^.h_addr_list^)^);
    end;
    WSACleanup;
  end;
end;

procedure TDM.tblSequrCalcFields(DataSet: TDataSet);
begin
  if DataSet.Active then
    with DataSet do
    begin
      if FieldByName('dostup').AsString = 'read' then FieldByName('DostupCalc').AsString := 'Только чтение'
      else FieldByName('DostupCalc').AsString := 'Полный'
    end;
end;

procedure TDM.DBConnectionBeforeConnect(Sender: TObject);
begin
  DBConnection.LibraryName := 'dbexpmysql.dll';
end;

procedure TDM.TblRadiosetiCalcFields(DataSet: TDataSet);
begin
  if DataSet.FieldByName('status').AsInteger = 0 then
    DataSet.FieldByName('status_calc').AsString := 'В работе'
  else
    DataSet.FieldByName('status_calc').AsString := 'Закрытая'
end;

end.
