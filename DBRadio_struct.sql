-- MySQL dump 8.22
--
-- Host: 10.60.60.60    Database: DBRadio
---------------------------------------------------------
-- Server version	3.23.54-max-debug-log

--
-- Table structure for table 'abon_seti'
--

DROP TABLE IF EXISTS abon_seti;
CREATE TABLE abon_seti (
  id_radioseti bigint(20) unsigned NOT NULL default '0',
  id_abonent bigint(20) unsigned NOT NULL default '0'
) TYPE=MyISAM;

/*!40000 ALTER TABLE abon_seti DISABLE KEYS */;

--
-- Dumping data for table 'abon_seti'
--


LOCK TABLES abon_seti WRITE;

/*!40000 ALTER TABLE abon_seti ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'abonenti'
--

DROP TABLE IF EXISTS abonenti;
CREATE TABLE abonenti (
  id_abonent bigint(20) unsigned NOT NULL auto_increment,
  id_res bigint(20) unsigned default NULL,
  id_podrazd bigint(20) unsigned default NULL,
  id varchar(10) default NULL,
  abonent_num varchar(10) default NULL,
  status varchar(200) default NULL,
  prim varchar(255) default NULL,
  PRIMARY KEY  (id_abonent)
) TYPE=MyISAM;

/*!40000 ALTER TABLE abonenti DISABLE KEYS */;

--
-- Dumping data for table 'abonenti'
--


LOCK TABLES abonenti WRITE;

/*!40000 ALTER TABLE abonenti ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'files'
--

DROP TABLE IF EXISTS files;
CREATE TABLE files (
  id_res bigint(20) unsigned default NULL,
  id_radioseti bigint(20) unsigned default NULL,
  extension varchar(10) default NULL,
  data longblob
) TYPE=MyISAM;

/*!40000 ALTER TABLE files DISABLE KEYS */;

--
-- Dumping data for table 'files'
--


--
-- Table structure for table 'par_base_station'
--

DROP TABLE IF EXISTS par_base_station;
CREATE TABLE par_base_station (
  id_par bigint(20) unsigned NOT NULL auto_increment,
  id_res bigint(20) unsigned default NULL,
  koord varchar(200) default NULL,
  shirota varchar(100) default NULL,
  dolgota varchar(100) default NULL,
  visota_anten float unsigned default NULL,
  vis_anten_ocean float unsigned default NULL,
  PRIMARY KEY  (id_par)
) TYPE=MyISAM;

/*!40000 ALTER TABLE par_base_station DISABLE KEYS */;

--
-- Dumping data for table 'par_base_station'
--




--
-- Table structure for table 'podrazd'
--

DROP TABLE IF EXISTS podrazd;
CREATE TABLE podrazd (
  id_podrazd bigint(20) unsigned NOT NULL auto_increment,
  name varchar(200) NOT NULL default '',
  dolg_otv varchar(200) default NULL,
  fio_otv varchar(200) default NULL,
  teleph_otv varchar(200) default NULL,
  prim varchar(255) default NULL,
  PRIMARY KEY  (id_podrazd)
) TYPE=MyISAM;

/*!40000 ALTER TABLE podrazd DISABLE KEYS */;

--
-- Dumping data for table 'podrazd'
--


LOCK TABLES podrazd WRITE;
INSERT INTO podrazd VALUES (1,'ФОК',NULL,NULL,NULL,'+'),(2,'ЦХХ',NULL,NULL,NULL,'+'),(3,'УЖДТ','Начальник участка радиосвязи УЖДТ','Ермаков Евгений','45-15 (Теле-2 8-908-788-10-36)','Сапрыкин Николай Васильевич    52-44'),(4,'ОФ','Ведущий инженер по АСУП','Тимофеев Денис Сергеевич','57-60','+'),(5,'ЦГБЖ','Нач участка по рем и экспл электрооборуд','Маликов Вячеслав Владимирович','42-41,  46-74','+'),(6,'ЗГБЖ-2',NULL,NULL,NULL,'+'),(7,'ЦСП','Зам нач цеха - Главный инженер','Агеев Юрий Иванович','59-17','+'),(8,'Цех связи','Зам. нач. ЦС','Столбченко А. Ю.','48-00',NULL),(9,'ЦАиИТ','Начальник участка телемеханики','Булгаков Александр Алексеевич','52-39','+'),(10,'ЦМиВХ',NULL,NULL,NULL,NULL),(11,'УАСРиГО','Начальник ЕЦПН','Исаев Вадим Алефтинович','55-77','+'),(12,'АТУ',NULL,NULL,NULL,'+'),(13,'РУ',NULL,'Ерыгин Вадим Л','19-01',NULL),(16,'Взрыв Цех',NULL,'Сергей Михайлович','44-78, 44-50','+'),(17,'Гидромеханизация',NULL,NULL,NULL,'+'),(21,'Трест Рудстрой',NULL,NULL,NULL,'Радиосети закрыты (Остались РЭС)'),(22,'Аннулированные сети',NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE podrazd ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'radioseti'
--

DROP TABLE IF EXISTS radioseti;
CREATE TABLE radioseti (
  id_radioseti bigint(20) unsigned NOT NULL auto_increment,
  id_podrazd bigint(20) unsigned default '0',
  number int(10) unsigned NOT NULL default '0',
  freq varchar(200) default NULL,
  num_razr varchar(200) default NULL,
  date_end_razr date default NULL,
  prim varchar(255) default NULL,
  PRIMARY KEY  (id_radioseti)
) TYPE=MyISAM;

/*!40000 ALTER TABLE radioseti DISABLE KEYS */;
--
-- Table structure for table 'res'
--

DROP TABLE IF EXISTS res;
CREATE TABLE res (
  id_res bigint(20) unsigned NOT NULL auto_increment,
  id_podrazd bigint(20) unsigned default NULL,
  type varchar(200) default NULL,
  place_install varchar(200) default NULL,
  marka varchar(200) default NULL,
  pozivnoi varchar(100) default NULL,
  klass_izluch varchar(100) default NULL,
  inv_number varchar(50) default NULL,
  serial_num varchar(200) default NULL,
  power float unsigned default NULL,
  date_vipusk date default NULL,
  date_vvoda date default NULL,
  num_razr_res varchar(200) default NULL,
  date_end_razr date default NULL,
  status varchar(100) default NULL,
  prim varchar(255) default NULL,
  Frequency varchar(255) default NULL,
  PRIMARY KEY  (id_res),
  UNIQUE KEY serial_num (serial_num),
  FULLTEXT KEY status (status)
) TYPE=MyISAM;

/*!40000 ALTER TABLE res DISABLE KEYS */;


--
-- Table structure for table 'res_seti'
--

DROP TABLE IF EXISTS res_seti;
CREATE TABLE res_seti (
  id_res bigint(20) unsigned NOT NULL default '0',
  id_radioseti bigint(20) unsigned NOT NULL default '0'
) TYPE=MyISAM;

--
-- Table structure for table 'sequr'
--

DROP TABLE IF EXISTS sequr;
CREATE TABLE sequr (
  id_user bigint(20) unsigned NOT NULL auto_increment,
  login varchar(20) NOT NULL default '',
  passwd varchar(20) default NULL,
  passw1 varchar(20) default NULL,
  id_podrazd bigint(20) unsigned default '0',
  dostup enum('all','read') NOT NULL default 'read',
  counter bigint(20) unsigned default '0',
  begin_last_session datetime default NULL,
  end_last_session datetime default NULL,
  PRIMARY KEY  (id_user),
  UNIQUE KEY login (login)
) TYPE=MyISAM;

/*!40000 ALTER TABLE sequr DISABLE KEYS */;

--
-- Dumping data for table 'sequr'
--


LOCK TABLES sequr WRITE;
INSERT INTO sequr VALUES (1,'emz','12a5bc184d70c5ef','123qwe+',0,'all',112,'2007-11-10 23:25:19','2007-11-10 23:26:34'),(2,'Kong','4956f3752e7493d0','c castaneda',0,'all',31,'2007-10-01 08:02:18','2007-10-01 09:53:04'),(3,'alex','4fad3ddb3750935f','~ Awe321',0,'all',185,'2007-11-30 13:41:16','2007-11-30 14:41:10'),(5,'Ермаков','66774bda7e5b97d9','070490',3,'read',7,'2007-10-18 14:42:19','2007-10-18 14:43:38'),(4,'Сорокин_О_И','7aa98dc05eb7b443','5858',0,'read',14,'2007-08-16 10:48:10','2007-08-16 10:48:23'),(6,'Головко_В_И','022b434502b509f5','4900',0,'read',0,'2007-04-03 10:30:20','2007-04-03 10:30:31'),(8,'123','773359240eb9a1d9','123',3,'read',0,'2007-09-15 15:06:02','2007-09-15 15:08:34'),(9,'Кленин_А_А','47219abe0d4d880d','1951',0,'read',1,'2007-05-06 15:11:16','2007-05-06 15:12:38'),(10,'radio','684ba92920eecee8','io4779',0,'read',6,'2007-08-30 14:11:06','2007-08-30 14:12:29'),(12,'Сурушкин','4723399a0d467b8c','1982',0,'read',21,'2007-10-09 12:53:55','2007-10-09 12:58:10');

/*!40000 ALTER TABLE sequr ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'slabonstatus'
--

DROP TABLE IF EXISTS slabonstatus;
CREATE TABLE slabonstatus (
  id_status bigint(20) unsigned NOT NULL auto_increment,
  abon_status varchar(255) default NULL,
  PRIMARY KEY  (id_status)
) TYPE=MyISAM;

/*!40000 ALTER TABLE slabonstatus DISABLE KEYS */;

--
-- Dumping data for table 'slabonstatus'
--


LOCK TABLES slabonstatus WRITE;
INSERT INTO slabonstatus VALUES (1,'Включен'),(2,'Выключен');

/*!40000 ALTER TABLE slabonstatus ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'slmarka'
--

DROP TABLE IF EXISTS slmarka;
CREATE TABLE slmarka (
  id_marka bigint(20) unsigned NOT NULL auto_increment,
  marka varchar(200) NOT NULL default '',
  PRIMARY KEY  (id_marka),
  UNIQUE KEY marka (marka)
) TYPE=MyISAM;

/*!40000 ALTER TABLE slmarka DISABLE KEYS */;

--
-- Dumping data for table 'slmarka'
--


LOCK TABLES slmarka WRITE;
INSERT INTO slmarka VALUES (1,'ФЛОКС   РРС'),(2,'КОМПЛЕКС-5М-1   РРС'),(3,'Малютка-1 РРС'),(4,'Ericsson GE'),(5,'Motorola GM-350'),(6,'GP-300 (VHF)'),(7,'Motorola P040'),(8,'MOTOROLA GM 300'),(9,'KENWOOD TK-278'),(10,'GP-320 (PW302B)'),(11,'16Р22С-1Г (Маяк)'),(12,'72РТМ-А2-ЧМ(ЖР-У-ЛС)'),(13,'Motorola P080'),(14,'11Р22С-3,2'),(15,'45Р32Н-2 (ВЭБР-160/9)'),(16,'23РТH-2-ЧМ(Сирена)'),(17,'Motorola GP-300'),(18,'11Р32H-1(Транспорт-H)'),(19,'GP-68 (UHF)'),(20,'16Р22В-1(Маяк)'),(21,'16Р22С-1(Маяк-С)'),(22,'Алтай АС-СПК'),(23,'УТК-1А'),(24,'Лес-400РТ (АС)'),(25,'Карт-4'),(26,'УТК-1Ц'),(27,'Лес-400РТ (ЦС)'),(28,'Перевал-2   РРС'),(29,'1Р21В-3(Лен-В)'),(30,'1Р21С-4(Лен-В)'),(31,'ВЭБР 40/8 РД18'),(32,'Гранит Д'),(33,'Motorola M-208'),(34,'MOTOROLA GM-360'),(35,'45Р31У (ВЭБР-40/8)'),(36,'STU (ТВ-передатчик)'),(37,'3Р31H-1(Кактус-М)'),(38,'F-800 (БС-3)'),(39,'F-800 (БС-1)'),(40,'F-800 (БС-2)'),(41,'F-800 (БС-4)'),(42,'Лен-Д'),(43,'TX-250 (РВ-передатчик)'),(44,'Motorola CM140'),(45,'ВЭБР-160/20'),(46,'Motorola GM-140'),(47,'Motorola GP-340');

/*!40000 ALTER TABLE slmarka ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'slstatus'
--

DROP TABLE IF EXISTS slstatus;
CREATE TABLE slstatus (
  id_status bigint(20) unsigned NOT NULL auto_increment,
  status varchar(255) default NULL,
  PRIMARY KEY  (id_status)
) TYPE=MyISAM;

/*!40000 ALTER TABLE slstatus DISABLE KEYS */;

--
-- Dumping data for table 'slstatus'
--


LOCK TABLES slstatus WRITE;
INSERT INTO slstatus VALUES (1,'Списано'),(2,'Активно'),(3,'Активно РЧЦ'),(4,'Новое');

/*!40000 ALTER TABLE slstatus ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'sltyperes'
--

DROP TABLE IF EXISTS sltyperes;
CREATE TABLE sltyperes (
  id_type bigint(20) unsigned NOT NULL auto_increment,
  type varchar(200) NOT NULL default '',
  PRIMARY KEY  (id_type),
  UNIQUE KEY type (type)
) TYPE=MyISAM;

/*!40000 ALTER TABLE sltyperes DISABLE KEYS */;

--
-- Dumping data for table 'sltyperes'
--


LOCK TABLES sltyperes WRITE;
INSERT INTO sltyperes VALUES (1,'Носимое'),(2,'Возимое'),(3,'Стационарное'),(4,'Базовое');

/*!40000 ALTER TABLE sltyperes ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'statistics'
--

DROP TABLE IF EXISTS statistics;
CREATE TABLE statistics (
  login varchar(20) NOT NULL default '',
  ip varchar(30) NOT NULL default '',
  time_connect datetime NOT NULL default '0000-00-00 00:00:00'
) TYPE=MyISAM;

--
-- Table structure for table 'stats_operation'
--

DROP TABLE IF EXISTS stats_operation;
CREATE TABLE stats_operation (
  id bigint(20) unsigned NOT NULL auto_increment,
  login varchar(30) NOT NULL default '',
  operation varchar(255) NOT NULL default '',
  time_execute datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (id)
) TYPE=MyISAM;

