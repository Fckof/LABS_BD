-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Аппаратура`
--

DROP TABLE IF EXISTS `Аппаратура`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Аппаратура` (
  `ID_филм` varchar(4) DEFAULT NULL,
  `ID_аппаратуры` varchar(4) DEFAULT NULL,
  `Наименование` varchar(27) DEFAULT NULL,
  `Год_выпуска` varchar(4) DEFAULT NULL,
  `Инвентарный_номер` varchar(5) DEFAULT NULL,
  `Стоимость_аренды` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Аппаратура`
--

LOCK TABLES `Аппаратура` WRITE;
/*!40000 ALTER TABLE `Аппаратура` DISABLE KEYS */;
INSERT INTO `Аппаратура` VALUES ('','','','','',''),('1098','13.1','Накамерный мониор Portkeys','2006','14','8000'),('1122','13.3','Микрофон Saramonic','2007','344','20000'),('1457','12.9','Гибкий видеосвет NiceFoto','2010','84','10000'),('1627','13.4','Видеосендер Moma','2009','31','20000'),('1653','12.8','Электронный стедикам Zhiyun','2006','908','4000'),('1762','13.9','Режиссерский монитор LUTS','2009','913','40000'),('1870','14.1','Квадрокоптер Autel','2008','349','100000'),('1897','12.7','Видоискатель Kamerar','2005','57','1500'),('1999','11.5','Компендиум Fotga','2008','497','10000'),('1021','13.8','Видеокамера ISSU','2010','1111','111110'),('1020','8907','Штатив Woi8','2012','12309','4500');
/*!40000 ALTER TABLE `Аппаратура` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Аренда_аппаратуры`
--

DROP TABLE IF EXISTS `Аренда_аппаратуры`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Аренда_аппаратуры` (
  `Инвентарный_номер` smallint(6) DEFAULT NULL,
  `Дата_аренды` varchar(19) DEFAULT NULL,
  `ID_члена_группы` decimal(3,1) DEFAULT NULL,
  `Срок_аренды` varchar(2) DEFAULT NULL,
  `Дата_возврата` varchar(19) DEFAULT NULL,
  `Возврат` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Аренда_аппаратуры`
--

LOCK TABLES `Аренда_аппаратуры` WRITE;
/*!40000 ALTER TABLE `Аренда_аппаратуры` DISABLE KEYS */;
INSERT INTO `Аренда_аппаратуры` VALUES (123,'2020-12-02 00:00:00',12.0,'2','2020-02-02 00:00:00','True'),(14,'2020-09-20 00:00:00',12.1,'3','2020-12-20 00:00:00','True'),(31,'2015-10-14 00:00:00',12.6,'12','2016-10-14 00:00:00','True'),(344,'2020-07-06 00:00:00',12.2,'8','2021-03-06 00:00:00','False'),(349,'2016-12-13 00:00:00',12.7,'6','2017-05-13 00:00:00','True'),(497,'2011-12-10 00:00:00',12.9,'12','2012-12-10 00:00:00','True'),(57,'2019-03-19 00:00:00',12.3,'12','2020-03-19 00:00:00','False'),(84,'2016-09-24 00:00:00',12.8,'24','2018-09-14 00:00:00','True'),(908,'2020-10-23 00:00:00',12.4,' 3','2020-01-23 00:00:00','True'),(913,'2019-09-06 00:00:00',12.5,'6','2020-03-06 00:00:00','False');
/*!40000 ALTER TABLE `Аренда_аппаратуры` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Источники финансирования`
--

DROP TABLE IF EXISTS `Источники финансирования`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Источники финансирования` (
  `ID_филм` smallint(6) DEFAULT NULL,
  `Источник` varchar(16) DEFAULT NULL,
  `Название_источника` varchar(18) DEFAULT NULL,
  `Бюджет` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Источники финансирования`
--

LOCK TABLES `Источники финансирования` WRITE;
/*!40000 ALTER TABLE `Источники финансирования` DISABLE KEYS */;
INSERT INTO `Источники финансирования` VALUES (1020,'Государство','Ленфильм',3500000),(1098,'Государство','Фонд Кино',2000000),(1122,'Государство','Фонд Кино',2500000),(1457,'Государство','The Asylum',4000000),(1627,'Частная компания','СТВ',16000000),(1653,'Частная компания','Art Pictures',23000000),(1762,'Государство','Мосфильм',14000000),(1870,'Частная компания','Amedia',25000000),(1897,'Частная компания','Централ Партнершип',20000000),(1999,'Частная компания','Форвард Фильм',20000000);
/*!40000 ALTER TABLE `Источники финансирования` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Участники съемочного процесса`
--

DROP TABLE IF EXISTS `Участники съемочного процесса`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Участники съемочного процесса` (
  `ID_участника` mediumint(9) DEFAULT NULL,
  `ФИО` varchar(33) DEFAULT NULL,
  `Должность` varchar(22) DEFAULT NULL,
  `Паспортные данные` varchar(11) DEFAULT NULL,
  `Номер_договора` mediumint(9) DEFAULT NULL,
  `Телефон` bigint(20) DEFAULT NULL,
  `Гонорар` mediumint(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Участники съемочного процесса`
--

LOCK TABLES `Участники съемочного процесса` WRITE;
/*!40000 ALTER TABLE `Участники съемочного процесса` DISABLE KEYS */;
INSERT INTO `Участники съемочного процесса` VALUES (3,'Гаврилов Вадим Семенович','продюсер','4518 293837',827373,89059373643,100000),(1000,'Пчелинцев Александр Александрович','звукооператор','4516 299866',446180,89091728299,50000),(111111,'Аксенов Денис Иванович','оператор','4512 345987',123098,89052839321,70000),(1784,'Давидова Ирина Олеговна','оператор-постановщик','4516 948365',247198,89152349087,55000),(2029,'Медня Ксения Сергеевна','сценарист','4513 293726',834743,89030985489,95000),(28495,'Борисенко Савелий Владимирович','декоратор сцены','4510 350123',649821,89054237865,65000),(34856,'Захарова Анастасия Дмитриевна','координатор-оформитель','4513 274926',122311,89198239938,55000),(666,'Зайцев Дмитрий Юрьевич','линейный продюссер','4519 465021',987209,89051989999,90000),(773,'Листратова Ольга Дмитриевна','режиссер массовок','4512 273098',364981,89169283737,55000),(9857,'Кирхеев Семен Михайлович','помощник оператора','4511 283111',729404,89198273292,50000);
/*!40000 ALTER TABLE `Участники съемочного процесса` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Фильмы`
--

DROP TABLE IF EXISTS `Фильмы`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Фильмы` (
  `ID_филм` smallint(6) DEFAULT NULL,
  `Рабочее название` varchar(20) DEFAULT NULL,
  `Окончательно название` varchar(28) DEFAULT NULL,
  `Год` smallint(6) DEFAULT NULL,
  `Тематика` varchar(9) DEFAULT NULL,
  `Режиссёр` varchar(13) DEFAULT NULL,
  `Длительность` decimal(2,1) DEFAULT NULL,
  `Бюджет` int(11) DEFAULT NULL,
  `Реальные_затраты` int(11) DEFAULT NULL,
  `Дата решения о съёмке` varchar(19) DEFAULT NULL,
  `Дата начала съёмки` varchar(19) DEFAULT NULL,
  `Дата конца съёмки` varchar(19) DEFAULT NULL,
  `Дата премьеры` varchar(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Фильмы`
--

LOCK TABLES `Фильмы` WRITE;
/*!40000 ALTER TABLE `Фильмы` DISABLE KEYS */;
INSERT INTO `Фильмы` VALUES (1020,'Дворянское гнездо','Князь',2013,'История','Н.И. Михеев',4.0,3000000,3500000,'2010-07-12 00:00:00','2011-12-10 00:00:00','2013-09-20 00:00:00','2013-12-21 00:00:00'),(1098,'Капитал','Боги серпа и молота',2007,'История','Р.Ю. Коршунов',2.5,2500000,2500000,'2005-02-19 00:00:00','2005-07-16 00:00:00','2007-10-20 00:00:00','2007-11-18 00:00:00'),(1122,'Приезд Горького','Приезд',2020,'Биография','Д. Я. Иванов',3.0,1750000,1750000,'2016-09-16 00:00:00','2017-01-30 00:00:00','2020-09-14 00:00:00','2020-11-08 00:00:00'),(1457,'Земля','Земля: Один потрясающий день',2010,'Наука','Р. Дэйл',1.5,3500000,3600000,'2007-03-20 00:00:00','2007-09-29 00:00:00','2010-07-30 00:00:00','2010-12-11 00:00:00'),(1627,'Позывной: \"Колумбия\"','Аполлон-11',2021,'История','Т. Миллер',2.0,15000000,15300000,'2018-09-12 00:00:00','2018-12-10 00:00:00','2020-07-20 00:00:00','2021-12-18 00:00:00'),(1653,'Медаль почёта','По соображениям совести',2016,'История','М. Гибсон',2.0,20000000,22000000,'2012-08-22 00:00:00','2013-09-10 00:00:00','2016-02-20 00:00:00','2016-11-19 00:00:00'),(1762,'За изгибом','За изгибом',2018,'Наука','Б. Соболев',1.5,14000000,14500000,'2016-06-19 00:00:00','2016-12-20 00:00:00','2018-01-15 00:00:00','2018-09-28 00:00:00'),(1870,'Genesis','Генезис 2.0',2018,'Наука','М. Арбугаев',2.0,25000000,25000000,'2015-09-27 00:00:00','2016-03-20 00:00:00','2018-02-15 00:00:00','2018-11-29 00:00:00'),(1897,'Tell me who I am','Скажи мне, кто я',2019,'Биография','Э. Перкинс',1.5,20000000,20000000,'2016-09-11 00:00:00','2017-02-10 00:00:00','2019-01-12 00:00:00','2019-10-19 00:00:00'),(1999,'С. Е. Петров','Человек, который спас мир',2014,'Биография','П. Энтони',2.0,19000000,20000000,'2011-12-11 00:00:00','2012-07-23 00:00:00','2014-01-28 00:00:00','2014-10-25 00:00:00');
/*!40000 ALTER TABLE `Фильмы` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Член съемочной группы`
--

DROP TABLE IF EXISTS `Член съемочной группы`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Член съемочной группы` (
  `ID_члена_группы` decimal(3,1) DEFAULT NULL,
  `ID_филм` smallint(6) DEFAULT NULL,
  `ID_участника` mediumint(9) DEFAULT NULL,
  `Дата_приема` varchar(19) DEFAULT NULL,
  `Дата_ухода` varchar(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Член съемочной группы`
--

LOCK TABLES `Член съемочной группы` WRITE;
/*!40000 ALTER TABLE `Член съемочной группы` DISABLE KEYS */;
INSERT INTO `Член съемочной группы` VALUES (12.0,1020,666,'2011-06-13 00:00:00','2020-02-12 00:00:00'),(12.1,1098,1000,'2005-12-09 00:00:00','2020-09-10 00:00:00'),(12.2,1122,111111,'2017-02-12 00:00:00','2020-12-12 00:00:00'),(12.3,1627,1784,'2018-06-29 00:00:00','2021-12-19 00:00:00'),(12.4,1457,773,'2007-10-19 00:00:00','2011-01-12 00:00:00'),(12.5,1897,1000,'2017-01-09 00:00:00','2021-02-19 00:00:00'),(12.6,1653,666,'2013-09-13 00:00:00','2018-08-28 00:00:00'),(12.7,1762,1784,'2016-12-12 00:00:00','2019-09-21 00:00:00'),(12.8,1870,2029,'2015-10-01 00:00:00','2019-11-29 00:00:00'),(12.9,1999,666,'2011-12-10 00:00:00','2014-10-26 00:00:00');
/*!40000 ALTER TABLE `Член съемочной группы` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-22 15:20:25
