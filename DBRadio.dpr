program DBRadio;

uses
  Forms, Previnst, Windows,
  UnitMain in 'UnitMain.pas' {frmMain},
  UnitDM in 'UnitDM.pas' {DM: TDataModule},
  UnitRES in 'UnitRES.pas' {frmRES},
  UnitProgress in 'UnitProgress.pas' {frmProgress},
  UnitAuth in 'UnitAuth.pas' {frmAuth},
  UnitAddRES in 'UnitAddRES.pas' {frmAddRES},
  UnitNewRecord in 'UnitNewRecord.pas' {frmNewRecord},
  UnitAbout in 'UnitAbout.pas' {AboutBox},
  UnitMenu in 'UnitMenu.pas' {frmMenu},
  UnitPoisk in 'UnitPoisk.pas' {frmPoisk},
  UnitFiltr in 'UnitFiltr.pas' {frmFiltr},
  UnitRSeti in 'UnitRSeti.pas' {frmRadioseti},
  UnitAddRSeti in 'UnitAddRSeti.pas' {frmAddRSeti},
  UnitSequr in 'UnitSequr.pas' {frmSequr},
  UnitAddSequr in 'UnitAddSequr.pas' {frmAddSequr},
  UnitPodrazd in 'UnitPodrazd.pas' {frmPodrazd},
  UnitAddPodrazd in 'UnitAddPodrazd.pas' {frmAddPodrazd},
  UnitAbonent in 'UnitAbonent.pas' {frmAbonent},
  UnitAddAbonent in 'UnitAddAbonent.pas' {frmAddAbonent},
  UnitSQL in 'UnitSQL.pas' {frmSql},
  UEditRSeti_in_RES in 'UEditRSeti_in_RES.pas' {frmEditRSeti_in_res},
  UnitSetup in 'UnitSetup.pas' {frmSetup},
  UnitInfo in 'UnitInfo.pas' {frmInfo},
  UnitAddInfo in 'UnitAddInfo.pas' {frmAddInfo};

{$R *.res}

begin
  if mmm then
  begin
    Application.MessageBox('Приложение уже запущено', 'Сообщение');
    halt // выходим не создавая ничего
  end;
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmProgress, frmProgress);
  Application.CreateForm(TfrmPoisk, frmPoisk);
  Application.CreateForm(TfrmFiltr, frmFiltr);
  Application.Run;
end.
