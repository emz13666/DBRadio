unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SqlExpr, Grids, DBGrids, FMTBcd, ShellAPI,
  DBClient, DBLocalS, StdCtrls, DBTables,
  ComCtrls, ExtCtrls, DBCtrls, AppEvnts, UnitDM, Menus, unitAuth, unitRES,
  UnitRSeti, UnitSequr, MyDB, UnitPodrazd, UnitAbonent, UnitSQL, UnitSetup, UnitInfo,
  Placemnt, UnitAbout, Buttons, RXDBCtrl, ToolWin, Registry;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    MnuConnect: TMenuItem;
    MnuExit: TMenuItem;
    N4: TMenuItem;
    mnuTabls: TMenuItem;
    MnuRES: TMenuItem;
    N5: TMenuItem;
    mnuCloseAll: TMenuItem;
    N3: TMenuItem;
    mnuAbout: TMenuItem;
    mnuDisconnect: TMenuItem;
    FormStorage1: TFormStorage;
    mnuMenu: TMenuItem;
    mnuRSeti: TMenuItem;
    N6: TMenuItem;
    mnuTileKaskad: TMenuItem;
    mnuTileVert: TMenuItem;
    mnuTileHoriz: TMenuItem;
    mnuSequr: TMenuItem;
    mnuPodrazd: TMenuItem;
    mnuAbonenti: TMenuItem;
    C1: TMenuItem;
    mnuSQL_sript: TMenuItem;
    ToolBar1: TToolBar;
    btnMenu: TBitBtn;
    N2: TMenuItem;
    MySQL1: TMenuItem;
    N7: TMenuItem;
    mnuSetup: TMenuItem;
    mnuReservDB: TMenuItem;
    mnuRestoreDB: TMenuItem;
    OpenDialog1: TOpenDialog;
    mnuInfo: TMenuItem;
    procedure MnuExitClick(Sender: TObject);
    procedure MnuConnectClick(Sender: TObject);
    procedure MnuRESClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnuDisconnectClick(Sender: TObject);
    procedure mnuCloseAllClick(Sender: TObject);
    procedure mnuAboutClick(Sender: TObject);
    procedure mnuMenuClick(Sender: TObject);
    procedure mnuRSetiClick(Sender: TObject);
    procedure mnuSequrClick(Sender: TObject);
    procedure mnuPodrazdClick(Sender: TObject);
    procedure mnuAbonentiClick(Sender: TObject);
    procedure mnuTileKaskadClick(Sender: TObject);
    procedure mnuTileVertClick(Sender: TObject);
    procedure mnuTileHorizClick(Sender: TObject);
    procedure mnuSQL_sriptClick(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
    procedure MySQL1Click(Sender: TObject);
    procedure mnuSetupClick(Sender: TObject);
    procedure mnuReservDBClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mnuRestoreDBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuInfoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses UnitMenu;

{$R *.dfm}


procedure TfrmMain.MnuExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.MnuConnectClick(Sender: TObject);
var
 i: byte;
 reestr: TRegistry;
begin
  frmAuth := TfrmAuth.Create(Application);
  LoadAutologinFromRegistry;
  reestr := TRegistry.Create;
  reestr.RootKey := HKEY_CURRENT_USER;
  reestr.OpenKeyReadOnly('SOFTWARE\DBRadio\0');
  if reestr.ValueExists('dfjkol') then begin
     FlSavePass := true;
     if Auto_Login then frmAuth.Timer1.Enabled := true;
     frmAuth.CheckBox1.Checked := true;
     frmAuth.Passw.Text := Crpt(reestr.ReadString('dfjkol'));
  end;
  reestr.CloseKey;
  reestr.Free;
          case frmAuth.ShowModal of
   mrOK: begin
          mnuTabls.Enabled := True;
          dm.DBConnection.Open;
          for i := 0 to DM.ComponentCount - 1 do
            if dm.Components[i] is TSQLClientDataSet then
               (dm.Components[i] as TSQLClientDataSet).Filtered := false;
          MnuConnect.Enabled := false;
          mnuDisconnect.Enabled := true;
          UpdateToTable('Sequr','id_user',IntToStr(id_user),['counter', 'begin_last_session'],[IntToStr(counter_user+1), FormatDateTime('yyyy-mm-dd hh-nn-ss',Now)]);
          AddToTable('Statistics',['login','ip','time_connect'],[user_name,GetLocalIP,FormatDateTime('yyyy-mm-dd hh-nn-ss',Now)]);
          DeleteFromStatistics;
          if dostupAll_user then
          begin
            mnuSQL_sript.Enabled := true;
            mnuReservDB.Enabled := true;
//            OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName)+'Backup';
            mnuRestoreDB.Enabled := true;
            MySQL1.Enabled := true;
            if user_name = 'emz' then
            begin
              mnuSQL_sript.Visible := true;
              N7.Visible := true;
            end
            else
            begin
              mnuSQL_sript.Visible := False;
              N7.Visible := False;
            end;
          end;
          //UpdateRESFrequency(DM.tmp_freq1,DM.tmp_freq2);
          LoadColorAdnDateFromRegistry;
          frmMenu := TfrmMenu.Create(Application);
         end;
   mrCancel:
              begin
                dostupAll_user := false;
                id_user := 0;
                reestr := TRegistry.Create;
                reestr.RootKey := HKEY_CURRENT_USER;
                reestr.OpenKey('SOFTWARE\DBRadio\0',true);
                if reestr.ValueExists('dfjkol') then
                begin
                  reestr.DeleteValue('dfjkol');
                end;
                reestr.CloseKey;
                reestr.Free;
                MessageDlg('Неправильный логин и/или пароль.',mtError,[mbOk],0);
              end;
   mrAbort: Close;
  end;
  frmAuth.Free;
end;

procedure TfrmMain.MnuRESClick(Sender: TObject);
begin
  frmRES := TfrmRES.Create(Application,false,dm.DSRES,'','');
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  MnuConnectClick(Sender);
end;

procedure TfrmMain.mnuDisconnectClick(Sender: TObject);
begin
  UpdateToTable('Sequr','id_user',IntToStr(id_user),['end_last_session'],[FormatDateTime('yyyy-mm-dd hh-nn-ss',Now)]);
  MnuConnect.Enabled := true;
  mnuDisconnect.Enabled := false;
  mnuTabls.Enabled := false;
  mnuSQL_sript.Enabled := false;
  mnuReservDB.Enabled := false;
  mnuRestoreDB.Enabled := false;
  MySQL1.Enabled := False;
  DM.DBConnection.CloseDataSets;
  DM.DBConnection.Close;
  mnuCloseAllClick(Sender);
end;

procedure TfrmMain.mnuCloseAllClick(Sender: TObject);
var
 i: integer;
begin
  for i := 0 to MDIChildCount - 1 do
  begin
    MDIChildren[i].Close;
  end;
end;

procedure TfrmMain.mnuAboutClick(Sender: TObject);
begin
  AboutBox := TAboutBox.Create(Application);
end;

procedure TfrmMain.mnuMenuClick(Sender: TObject);
begin
  frmMenu := TfrmMenu.Create(Application);
end;

procedure TfrmMain.mnuRSetiClick(Sender: TObject);
begin
  frmRadioseti := TfrmRadioseti.Create(Application);
end;

procedure TfrmMain.mnuSequrClick(Sender: TObject);
begin
  frmSequr := TfrmSequr.Create(Application);
end;

procedure TfrmMain.mnuPodrazdClick(Sender: TObject);
begin
  frmPodrazd := TfrmPodrazd.Create(Application);
end;

procedure TfrmMain.mnuAbonentiClick(Sender: TObject);
begin
  frmAbonent := TfrmAbonent.Create(Application);
end;

procedure TfrmMain.mnuTileKaskadClick(Sender: TObject);
begin
  Cascade;
end;

procedure TfrmMain.mnuTileVertClick(Sender: TObject);
begin
  TileMode := tbVertical;
  Tile;
end;

procedure TfrmMain.mnuTileHorizClick(Sender: TObject);
begin
  TileMode := tbHorizontal;
  Tile;
end;

procedure TfrmMain.mnuSQL_sriptClick(Sender: TObject);
begin
  frmSql := TfrmSql.Create(Application);
end;

procedure TfrmMain.btnMenuClick(Sender: TObject);
begin
  mnuMenuClick(Sender);
end;

procedure TfrmMain.MySQL1Click(Sender: TObject);
begin
  if dostupAll_user then
  begin
    if FileExists(ExtractFilePath(Application.ExeName)+'Help_SQL\index.html') then
    begin
      //можно переделать чтоб открывался во встроенном браузере
      ShellExecute(Handle,nil,PChar(ExtractFilePath(Application.ExeName)+'Help_SQL\index.html'),nil,nil,SW_SHOWNORMAL);
    end
    else
      ShowMessage('Не удается найти файл справки.');
  end;
end;

procedure TfrmMain.mnuSetupClick(Sender: TObject);
begin
  frmSetup := TfrmSetup.Create(Application);
end;

procedure TfrmMain.mnuReservDBClick(Sender: TObject);
var
  parametersss: string;
  reestr: TRegistry;
begin
 reestr := TRegistry.Create;
 reestr.RootKey := HKEY_CURRENT_USER;
 reestr.OpenKey('SOFTWARE\DBRadio\TfrmAuth', true);

 parametersss := '-u root -h ' + reestr.ReadString('Host_Text') + ' -p"~ Dig123" --add-locks -e -v --opt -r ';
 parametersss := parametersss + '"' + ExtractFilePath(Application.ExeName)+'Backup\'+FormatDateTime('dd.mm.yy-hh.nn.ss',Now)+'.sql" DBRadio';
// CharToOem(PChar(parametersss),PChar(parametersss));
 parametersss := '"' + ExtractFilePath(Application.ExeName)+'mysqldump.exe" ' + parametersss;
 WinExec(PChar(parametersss),SW_SHOWNORMAL);
// ShellExecute(Handle,nil,pchar(parametersss),nil,nil,SW_SHOWNORMAL);
// if ShellExecute(Handle,nil,pchar(parametersss),nil,nil,SW_SHOWNORMAL)>=32 then ShowMessage('Выполнено.');
 reestr.CloseKey;
 reestr.Free;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if user_name <> '' then
    UpdateToTable('Sequr','id_user',IntToStr(id_user),['end_last_session'],[FormatDateTime('yyyy-mm-dd hh-nn-ss',Now)]);
  DM.DBConnection.CloseDataSets;
  dm.DBConnection.Close;
end;

procedure TfrmMain.mnuRestoreDBClick(Sender: TObject);
var
  parametersss, File_name: string;
  reestr: TRegistry;
begin
{ShowMessage('Пока не работает');
exit;
 }
 reestr := TRegistry.Create;
 reestr.RootKey := HKEY_CURRENT_USER;
 reestr.OpenKey('SOFTWARE\DBRadio\TfrmAuth', true);
 OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName) + 'Backup';
 if not OpenDialog1.Execute then exit;
{ parametersss := '-u root -h 10.60.60.60 -p"~ Dig123" --add-locks -e -v --opt -r ';
 File_name := FormatDateTime('dd.mm.yy-hh.nn.ss',Now)+'.sql';
 parametersss := parametersss + '"' + ExtractFilePath(Application.ExeName)+'Backup\'+ File_name + '" DBRadio';
 parametersss := '"' + ExtractFilePath(Application.ExeName)+'mysqldump.exe" ' + parametersss;
 WinExec(PChar(parametersss),SW_SHOWNORMAL);
 ShowMessage('Старая БД сохранена в файле '+File_name);}
 File_name := '"' + StringReplace(OpenDialog1.FileName,'\','/',[rfReplaceAll]) + '"';
 parametersss := '-u root -h ' + reestr.ReadString('Host_Text') + ' -p -v DBRadio < ' + File_name;
 parametersss := '"' + ExtractFilePath(Application.ExeName) + 'mysql.exe" ' + parametersss;
 parametersss := 'cmd.exe /C ' + '"' + parametersss + '"';
 WinExec(PChar(parametersss),SW_SHOWNORMAL);
 //ShowMessage('База данных восстановлена из резервной копии. Произведите подключение к базе данных.');
 reestr.CloseKey;
 reestr.Free;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  reestr: TRegistry;
  tmpdir: string;
  Search_Res: TSearchRec;
  FindedFile: file of byte;
begin
  reestr := TRegistry.Create;
  reestr.RootKey := HKEY_CURRENT_USER;
  if not reestr.KeyExists('SOFTWARE\DBRadio') then
  begin
    reestr.Free;
    saveVersionToRegistry;
    exit;
  end;
  if reestr.OpenKey('SOFTWARE\DBRadio\Version',false) then
  begin
    if VersionDBRadio <> reestr.ReadString('VersionDBRadio') then
    begin
      reestr.CloseKey;
      reestr.DeleteKey('SOFTWARE\DBRadio');
      reestr.Free;
      ShowMessage('Обнаружен запуск новой версии программы.' +
        #13+ 'Настройки установлены по умолчанию.'+#13+'Смотрите историю версий программы в таблице "Информация"');
      saveVersionToRegistry;
    end
    else   reestr.Free;
  end
  else
  begin
      reestr.CloseKey;
      reestr.DeleteKey('SOFTWARE\DBRadio');
      reestr.Free;
      ShowMessage('Обнаружен запуск новой версии программы.' +
        #13+ 'Настройки установлены по умолчанию.'+#13+'Смотрите историю версий программы в таблице "Информация"');
      saveVersionToRegistry;
  end;


  //удаляем все файлы из директории temp
  tmpdir := ExtractFileDir(Application.ExeName)+'\temp';
  if FindFirst(tmpdir+'\*.*',faAnyFile,Search_Res)=0 then
  begin
    repeat
      if (Search_Res.Name <>'.')and(Search_Res.Name <>'..') then
      begin
        AssignFile(FindedFile,tmpdir+'\'+Search_Res.Name);
        Erase(FindedFile);
      //  DeleteFile(tmpdir+'\'+Search_Res.Name);
      end;

    until FindNext(Search_Res) <> 0;
    FindClose(Search_Res);
  end;
end;

procedure TfrmMain.mnuInfoClick(Sender: TObject);
begin
  frmInfo := TfrmInfo.Create(Application);
end;

end.
