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
INSERT INTO podrazd VALUES (1,'���',NULL,NULL,NULL,'+'),(2,'���',NULL,NULL,NULL,'+'),(3,'����','��������� ������� ���������� ����','������� �������','45-15 (����-2 8-908-788-10-36)','�������� ������� ����������    52-44'),(4,'��','������� ������� �� ����','�������� ����� ���������','57-60','+'),(5,'����','��� ������� �� ��� � ����� �������������','������� �������� ������������','42-41,  46-74','+'),(6,'����-2',NULL,NULL,NULL,'+'),(7,'���','��� ��� ���� - ������� �������','����� ���� ��������','59-17','+'),(8,'��� �����','���. ���. ��','���������� �. �.','48-00',NULL),(9,'�����','��������� ������� ������������','�������� ��������� ����������','52-39','+'),(10,'�����',NULL,NULL,NULL,NULL),(11,'�������','��������� ����','����� ����� �����������','55-77','+'),(12,'���',NULL,NULL,NULL,'+'),(13,'��',NULL,'������ ����� �','19-01',NULL),(16,'����� ���',NULL,'������ ����������','44-78, 44-50','+'),(17,'����������������',NULL,NULL,NULL,'+'),(21,'����� ��������',NULL,NULL,NULL,'��������� ������� (�������� ���)'),(22,'�������������� ����',NULL,NULL,NULL,NULL);

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
INSERT INTO sequr VALUES (1,'emz','12a5bc184d70c5ef','123qwe+',0,'all',112,'2007-11-10 23:25:19','2007-11-10 23:26:34'),(2,'Kong','4956f3752e7493d0','c castaneda',0,'all',31,'2007-10-01 08:02:18','2007-10-01 09:53:04'),(3,'alex','4fad3ddb3750935f','~ Awe321',0,'all',185,'2007-11-30 13:41:16','2007-11-30 14:41:10'),(5,'�������','66774bda7e5b97d9','070490',3,'read',7,'2007-10-18 14:42:19','2007-10-18 14:43:38'),(4,'�������_�_�','7aa98dc05eb7b443','5858',0,'read',14,'2007-08-16 10:48:10','2007-08-16 10:48:23'),(6,'�������_�_�','022b434502b509f5','4900',0,'read',0,'2007-04-03 10:30:20','2007-04-03 10:30:31'),(8,'123','773359240eb9a1d9','123',3,'read',0,'2007-09-15 15:06:02','2007-09-15 15:08:34'),(9,'������_�_�','47219abe0d4d880d','1951',0,'read',1,'2007-05-06 15:11:16','2007-05-06 15:12:38'),(10,'radio','684ba92920eecee8','io4779',0,'read',6,'2007-08-30 14:11:06','2007-08-30 14:12:29'),(12,'��������','4723399a0d467b8c','1982',0,'read',21,'2007-10-09 12:53:55','2007-10-09 12:58:10');

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
INSERT INTO slabonstatus VALUES (1,'�������'),(2,'��������');

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
INSERT INTO slmarka VALUES (1,'�����   ���'),(2,'��������-5�-1   ���'),(3,'�������-1 ���'),(4,'Ericsson GE'),(5,'Motorola GM-350'),(6,'GP-300 (VHF)'),(7,'Motorola P040'),(8,'MOTOROLA GM 300'),(9,'KENWOOD TK-278'),(10,'GP-320 (PW302B)'),(11,'16�22�-1� (����)'),(12,'72���-�2-��(��-�-��)'),(13,'Motorola P080'),(14,'11�22�-3,2'),(15,'45�32�-2 (����-160/9)'),(16,'23��H-2-��(������)'),(17,'Motorola GP-300'),(18,'11�32H-1(���������-H)'),(19,'GP-68 (UHF)'),(20,'16�22�-1(����)'),(21,'16�22�-1(����-�)'),(22,'����� ��-���'),(23,'���-1�'),(24,'���-400�� (��)'),(25,'����-4'),(26,'���-1�'),(27,'���-400�� (��)'),(28,'�������-2   ���'),(29,'1�21�-3(���-�)'),(30,'1�21�-4(���-�)'),(31,'���� 40/8 ��18'),(32,'������ �'),(33,'Motorola M-208'),(34,'MOTOROLA GM-360'),(35,'45�31� (����-40/8)'),(36,'STU (��-����������)'),(37,'3�31H-1(������-�)'),(38,'F-800 (��-3)'),(39,'F-800 (��-1)'),(40,'F-800 (��-2)'),(41,'F-800 (��-4)'),(42,'���-�'),(43,'TX-250 (��-����������)'),(44,'Motorola CM140'),(45,'����-160/20'),(46,'Motorola GM-140'),(47,'Motorola GP-340');

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
INSERT INTO slstatus VALUES (1,'�������'),(2,'�������'),(3,'������� ���'),(4,'�����');

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
INSERT INTO sltyperes VALUES (1,'�������'),(2,'�������'),(3,'������������'),(4,'�������');

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

