-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 27, 2021 at 08:43 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `films`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `аренда` ()  SELECT `аппаратура`.`Инвентарный_номер`,`аппаратура`.`Стоимость_аренды`, `аренда_аппаратуры`.`Срок_аренды`, `аппаратура`.`Стоимость_аренды` * `аренда_аппаратуры`.`Срок_аренды` AS `Общая стоимость` FROM `аренда_аппаратуры` INNER JOIN `аппаратура` ON `аренда_аппаратуры`.`Инвентарный_номер` = `аппаратура`.`Инвентарный_номер` GROUP BY `аппаратура`.`Инвентарный_номер`, `аппаратура`.`Стоимость_аренды`, `аренда_аппаратуры`.`Срок_аренды`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `бюджеты_на_тематики` ()  SELECT `фильмы`.`Тематика`, Sum(`фильмы`.`Бюджет`) AS `Бюджет`

FROM `фильмы`

GROUP BY `фильмы`.`Тематика`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `возврат` ()  SELECT `аренда_аппаратуры`.`Инвентарный_номер`, `аренда_аппаратуры`.`ID_члена_группы`, Sum(`аренда_аппаратуры`.`Возврат`) AS `Возврат` FROM `аренда_аппаратуры` GROUP BY `аренда_аппаратуры`.`Инвентарный_номер`, `аренда_аппаратуры`.`ID_члена_группы` HAVING(((Sum(`аренда_аппаратуры`.`Возврат`))=Sum(`Возврат`)))$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `гонорар` ()  SELECT `член съемочной группы`.`ID_участника`, `участники съемочного процесса`.`Гонорар`, Count(`член съемочной группы`.`ID_участника`) AS `Кол-во участий`, Sum(`участники съемочного процесса`.`Гонорар`) AS `Общий гонорар`

FROM `участники съемочного процесса` INNER JOIN `член съемочной группы` ON `участники съемочного процесса`.`ID_участника` = `член съемочной группы`.`ID_участника`

GROUP BY `член съемочной группы`.`ID_участника`, `участники съемочного процесса`.`Гонорар`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `добавить источник финансирования` (IN `id` INT, IN `istochnik` VARCHAR(20), IN `naz_istoch` VARCHAR(20), IN `budget` INT)  INSERT INTO `источники финансирования` VALUES(`id`,`istochnik`,`naz_istoch`,`budget`)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `зп за все время работы` ()  SELECT `участники съемочного процесса`.`ID_участника`, `участники съемочного процесса`.`Гонорар`, `член съемочной группы`.`Дата_приема`, `член съемочной группы`.`Дата_ухода`,  `Гонорар` * (month(`Дата_приема`)-month(`Дата_ухода`)) AS `Гонорар за все время` FROM `участники съемочного процесса` INNER JOIN `член съемочной группы` ON `участники съемочного процесса`.`ID_участника` = `член съемочной группы`.`ID_участника`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `какие фильмы частная компания финансирует` ()  SELECT `фильмы`.`Окончательно название`, `источники финансирования`.`Источник`

FROM `фильмы` INNER JOIN `источники финансирования` ON `фильмы`.`ID_филм` = `источники финансирования`.`ID_филм`

WHERE (((`источники финансирования`.`Источник`)="Частная компания"))

GROUP BY `фильмы`.`Окончательно название`, `источники финансирования`.`Источник`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `кол-во дней с решения о съемке` ()  SELECT `фильмы`.`Дата решения о съёмке`, `фильмы`.`Дата премьеры`, timestampDiff(day,`Дата решения о съёмке`,`Дата премьеры`) AS `Дни`
FROM `фильмы`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `кол-во компаний` ()  SELECT `источники финансирования`.`Источник`, Count(`источники финансирования`.`Название_источника`) AS `количество компаний`, Sum(`источники финансирования`.`Бюджет`) AS `Общий бюджет`

FROM `источники финансирования`

GROUP BY `источники финансирования`.`Источник`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `кол-во фильмов разных тематик` ()  SELECT `фильмы`.`Тематика`, Count(`фильмы`.`Тематика`) AS `Количество фильмов`

FROM `фильмы`

GROUP BY `фильмы`.`Тематика`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `обновить_стоимость_аппаратуры` (IN `ID` VARCHAR(10), IN `Новая_стоимость` VARCHAR(10))  UPDATE `аппаратура` SET `аппаратура`.`Стоимость_аренды`=Новая_стоимость WHERE
`аппаратура`.`ID_аппаратуры`=ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `разница между бюджетом и реальными затратами` ()  SELECT `фильмы`.`Окончательно название`, `источники финансирования`.`Название_источника`, `фильмы`.`Реальные_затраты`, `фильмы`.`Бюджет`, (`фильмы`.`Реальные_затраты`)-(`фильмы`.`Бюджет`) AS `Разница`

FROM `фильмы` INNER JOIN `источники финансирования` ON `фильмы`.`ID_филм` = `источники финансирования`.`ID_филм`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `удалить источник` (IN `id` INT, IN `name` VARCHAR(30))  DELETE FROM `источники финансирования` WHERE  `источники финансирования`.`ID_филм`=`id` and `источники финансирования`.`Название_источника`=`name`$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `аппаратура`
--

CREATE TABLE `аппаратура` (
  `ID_филм` varchar(4) DEFAULT NULL,
  `ID_аппаратуры` varchar(4) NOT NULL,
  `Наименование` varchar(27) DEFAULT NULL,
  `Год_выпуска` varchar(4) DEFAULT NULL,
  `Инвентарный_номер` varchar(5) DEFAULT NULL,
  `Стоимость_аренды` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `аппаратура`
--

INSERT INTO `аппаратура` (`ID_филм`, `ID_аппаратуры`, `Наименование`, `Год_выпуска`, `Инвентарный_номер`, `Стоимость_аренды`) VALUES
('', '', '', '', '', ''),
('1999', '11.5', 'Компендиум Fotga', '2008', '497', '4564'),
('1897', '12.7', 'Видоискатель Kamerar', '2005', '57', '1500'),
('1653', '12.8', 'Электронный стедикам Zhiyun', '2006', '908', '4000'),
('1457', '12.9', 'Гибкий видеосвет NiceFoto', '2010', '84', '10000'),
('1098', '13.1', 'Накамерный мониор Portkeys', '2006', '14', '9000'),
('1122', '13.3', 'Микрофон Saramonic', '2007', '344', '20000'),
('1627', '13.4', 'Видеосендер Moma', '2009', '31', '20000'),
('1021', '13.8', 'Видеокамера ISSU', '2010', '1111', '111110'),
('1762', '13.9', 'Режиссерский монитор LUTS', '2009', '913', '40000'),
('1870', '14.1', 'Квадрокоптер Autel', '2008', '349', '100000'),
('1020', '8907', 'Штатив Woi8', '2012', '12309', '4500');

--
-- Triggers `аппаратура`
--
DELIMITER $$
CREATE TRIGGER `upcost` AFTER UPDATE ON `аппаратура` FOR EACH ROW BEGIN
IF (old.`Стоимость_аренды` <> new.`Стоимость_аренды`) then
SET @old_date=(SELECT max(`Дата обновления`) as latest FROM `изменение_стоимости_аренды_аппаратуры` WHERE `Название`= new.`Наименование`);
IF @old_date is null THEN
	SET @old_date=(SELECT `Год_выпуска` FROM `аппаратура` WHERE `аппаратура`.`Наименование`=new.`Наименование`);
end IF;
 INSERT INTO `изменение_стоимости_аренды_аппаратуры`(`Название`,`Старая стоимость`,`Новая стоимость`,`Дата до обновления`,`Дата обновления`) VALUES(new.`Наименование`,old.`Стоимость_аренды`,new.`Стоимость_аренды`,@old_date,NOW());
 end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `аренда_аппаратуры`
--

CREATE TABLE `аренда_аппаратуры` (
  `Инвентарный_номер` smallint(6) DEFAULT NULL,
  `Дата_аренды` varchar(19) DEFAULT NULL,
  `ID_члена_группы` decimal(3,1) DEFAULT NULL,
  `Срок_аренды` varchar(2) DEFAULT NULL,
  `Дата_возврата` varchar(19) DEFAULT NULL,
  `Возврат` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `аренда_аппаратуры`
--

INSERT INTO `аренда_аппаратуры` (`Инвентарный_номер`, `Дата_аренды`, `ID_члена_группы`, `Срок_аренды`, `Дата_возврата`, `Возврат`) VALUES
(123, '2020-12-02 00:00:00', '12.0', '2', '2020-02-02 00:00:00', 'True'),
(14, '2020-09-20 00:00:00', '12.1', '3', '2020-12-20 00:00:00', 'True'),
(31, '2015-10-14 00:00:00', '12.6', '12', '2016-10-14 00:00:00', 'True'),
(344, '2020-07-06 00:00:00', '12.2', '8', '2021-03-06 00:00:00', 'False'),
(349, '2016-12-13 00:00:00', '12.7', '6', '2017-05-13 00:00:00', 'True'),
(497, '2011-12-10 00:00:00', '12.9', '12', '2012-12-10 00:00:00', 'True'),
(57, '2019-03-19 00:00:00', '12.3', '12', '2020-03-19 00:00:00', 'False'),
(84, '2016-09-24 00:00:00', '12.8', '24', '2018-09-14 00:00:00', 'True'),
(908, '2020-10-23 00:00:00', '12.4', ' 3', '2020-01-23 00:00:00', 'True'),
(913, '2019-09-06 00:00:00', '12.5', '6', '2020-03-06 00:00:00', 'False');

-- --------------------------------------------------------

--
-- Table structure for table `изменение_стоимости_аренды_аппаратуры`
--

CREATE TABLE `изменение_стоимости_аренды_аппаратуры` (
  `Название` varchar(40) NOT NULL,
  `Старая стоимость` float NOT NULL,
  `Новая стоимость` float NOT NULL,
  `Дата до обновления` varchar(40) NOT NULL,
  `Дата обновления` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `изменение_стоимости_аренды_аппаратуры`
--

INSERT INTO `изменение_стоимости_аренды_аппаратуры` (`Название`, `Старая стоимость`, `Новая стоимость`, `Дата до обновления`, `Дата обновления`) VALUES
('Накамерный мониор Portkeys', 8000, 80, '2006', '2021-08-24 15:02:08'),
('Накамерный мониор Portkeys', 80, 9000, '2021-08-24 15:02:08', '2021-08-24 15:03:06'),
('Компендиум Fotga', 10000, 4564, '2008', '2021-08-27 23:01:15');

-- --------------------------------------------------------

--
-- Table structure for table `источники финансирования`
--

CREATE TABLE `источники финансирования` (
  `ID_филм` smallint(6) DEFAULT NULL,
  `Источник` varchar(16) DEFAULT NULL,
  `Название_источника` varchar(18) DEFAULT NULL,
  `Бюджет` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `источники финансирования`
--

INSERT INTO `источники финансирования` (`ID_филм`, `Источник`, `Название_источника`, `Бюджет`) VALUES
(1020, 'Государство', 'Ленфильм', 3500000),
(1098, 'Государство', 'Фонд Кино', 2000000),
(1122, 'Государство', 'Фонд Кино', 2500000),
(1457, 'Государство', 'The Asylum', 4000000),
(1627, 'Частная компания', 'СТВ', 16000000),
(1653, 'Частная компания', 'Art Pictures', 23000000),
(1762, 'Государство', 'Мосфильм', 14000000),
(1870, 'Частная компания', 'Amedia', 25000000),
(1897, 'Частная компания', 'Централ Партнершип', 20000000),
(1999, 'Частная компания', 'Форвард Фильм', 20000000),
(4, 'Государство', 'qwe', 5645);

-- --------------------------------------------------------

--
-- Table structure for table `пользователи`
--

CREATE TABLE `пользователи` (
  `логин` varchar(20) NOT NULL,
  `пароль` varchar(20) NOT NULL,
  `статус` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `пользователи`
--

INSERT INTO `пользователи` (`логин`, `пароль`, `статус`) VALUES
('admin', 'admin123', 'администратор'),
('moder', 'moder123', 'модератор');

-- --------------------------------------------------------

--
-- Table structure for table `участники съемочного процесса`
--

CREATE TABLE `участники съемочного процесса` (
  `ID_участника` mediumint(9) DEFAULT NULL,
  `ФИО` varchar(33) DEFAULT NULL,
  `Должность` varchar(22) DEFAULT NULL,
  `Паспортные данные` varchar(11) DEFAULT NULL,
  `Номер_договора` mediumint(9) DEFAULT NULL,
  `Телефон` bigint(20) DEFAULT NULL,
  `Гонорар` mediumint(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `участники съемочного процесса`
--

INSERT INTO `участники съемочного процесса` (`ID_участника`, `ФИО`, `Должность`, `Паспортные данные`, `Номер_договора`, `Телефон`, `Гонорар`) VALUES
(3, 'Гаврилов Вадим Семенович', 'продюсер', '4518 293837', 827373, 89059373643, 100000),
(1000, 'Пчелинцев Александр Александрович', 'звукооператор', '4516 299866', 446180, 89091728299, 50000),
(111111, 'Аксенов Денис Иванович', 'оператор', '4512 345987', 123098, 89052839321, 70000),
(1784, 'Давидова Ирина Олеговна', 'оператор-постановщик', '4516 948365', 247198, 89152349087, 55000),
(2029, 'Медня Ксения Сергеевна', 'сценарист', '4513 293726', 834743, 89030985489, 95000),
(28495, 'Борисенко Савелий Владимирович', 'декоратор сцены', '4510 350123', 649821, 89054237865, 65000),
(34856, 'Захарова Анастасия Дмитриевна', 'координатор-оформитель', '4513 274926', 122311, 89198239938, 55000),
(666, 'Зайцев Дмитрий Юрьевич', 'линейный продюссер', '4519 465021', 987209, 89051989999, 90000),
(773, 'Листратова Ольга Дмитриевна', 'режиссер массовок', '4512 273098', 364981, 89169283737, 55000),
(9857, 'Кирхеев Семен Михайлович', 'помощник оператора', '4511 283111', 729404, 89198273292, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `фильмы`
--

CREATE TABLE `фильмы` (
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

--
-- Dumping data for table `фильмы`
--

INSERT INTO `фильмы` (`ID_филм`, `Рабочее название`, `Окончательно название`, `Год`, `Тематика`, `Режиссёр`, `Длительность`, `Бюджет`, `Реальные_затраты`, `Дата решения о съёмке`, `Дата начала съёмки`, `Дата конца съёмки`, `Дата премьеры`) VALUES
(1020, 'Дворянское гнездо', 'Князь', 2013, 'История', 'Н.И. Михеев', '4.0', 3000000, 3500000, '2010-07-12 00:00:00', '2011-12-10 00:00:00', '2013-09-20 00:00:00', '2013-12-21 00:00:00'),
(1098, 'Капитал', 'Боги серпа и молота', 2007, 'История', 'Р.Ю. Коршунов', '2.5', 2500000, 2500000, '2005-02-19 00:00:00', '2005-07-16 00:00:00', '2007-10-20 00:00:00', '2007-11-18 00:00:00'),
(1122, 'Приезд Горького', 'Приезд', 2020, 'Биография', 'Д. Я. Иванов', '3.0', 1750000, 1750000, '2016-09-16 00:00:00', '2017-01-30 00:00:00', '2020-09-14 00:00:00', '2020-11-08 00:00:00'),
(1457, 'Земля', 'Земля: Один потрясающий день', 2010, 'Наука', 'Р. Дэйл', '1.5', 3500000, 3600000, '2007-03-20 00:00:00', '2007-09-29 00:00:00', '2010-07-30 00:00:00', '2010-12-11 00:00:00'),
(1627, 'Позывной: \"Колумбия\"', 'Аполлон-11', 2021, 'История', 'Т. Миллер', '2.0', 15000000, 15300000, '2018-09-12 00:00:00', '2018-12-10 00:00:00', '2020-07-20 00:00:00', '2021-12-18 00:00:00'),
(1653, 'Медаль почёта', 'По соображениям совести', 2016, 'История', 'М. Гибсон', '2.0', 20000000, 22000000, '2012-08-22 00:00:00', '2013-09-10 00:00:00', '2016-02-20 00:00:00', '2016-11-19 00:00:00'),
(1762, 'За изгибом', 'За изгибом', 2018, 'Наука', 'Б. Соболев', '1.5', 14000000, 14500000, '2016-06-19 00:00:00', '2016-12-20 00:00:00', '2018-01-15 00:00:00', '2018-09-28 00:00:00'),
(1870, 'Genesis', 'Генезис 2.0', 2018, 'Наука', 'М. Арбугаев', '2.0', 25000000, 25000000, '2015-09-27 00:00:00', '2016-03-20 00:00:00', '2018-02-15 00:00:00', '2018-11-29 00:00:00'),
(1897, 'Tell me who I am', 'Скажи мне, кто я', 2019, 'Биография', 'Э. Перкинс', '1.5', 20000000, 20000000, '2016-09-11 00:00:00', '2017-02-10 00:00:00', '2019-01-12 00:00:00', '2019-10-19 00:00:00'),
(1999, 'С. Е. Петров', 'Человек, который спас мир', 2014, 'Биография', 'П. Энтони', '2.0', 19000000, 20000000, '2011-12-11 00:00:00', '2012-07-23 00:00:00', '2014-01-28 00:00:00', '2014-10-25 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `член съемочной группы`
--

CREATE TABLE `член съемочной группы` (
  `ID_члена_группы` decimal(3,1) DEFAULT NULL,
  `ID_филм` smallint(6) DEFAULT NULL,
  `ID_участника` mediumint(9) DEFAULT NULL,
  `Дата_приема` varchar(19) DEFAULT NULL,
  `Дата_ухода` varchar(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `член съемочной группы`
--

INSERT INTO `член съемочной группы` (`ID_члена_группы`, `ID_филм`, `ID_участника`, `Дата_приема`, `Дата_ухода`) VALUES
('12.0', 1020, 666, '2011-06-13 00:00:00', '2020-02-12 00:00:00'),
('12.1', 1098, 1000, '2005-12-09 00:00:00', '2020-09-10 00:00:00'),
('12.2', 1122, 111111, '2017-02-12 00:00:00', '2020-12-12 00:00:00'),
('12.3', 1627, 1784, '2018-06-29 00:00:00', '2021-12-19 00:00:00'),
('12.4', 1457, 773, '2007-10-19 00:00:00', '2011-01-12 00:00:00'),
('12.5', 1897, 1000, '2017-01-09 00:00:00', '2021-02-19 00:00:00'),
('12.6', 1653, 666, '2013-09-13 00:00:00', '2018-08-28 00:00:00'),
('12.7', 1762, 1784, '2016-12-12 00:00:00', '2019-09-21 00:00:00'),
('12.8', 1870, 2029, '2015-10-01 00:00:00', '2019-11-29 00:00:00'),
('12.9', 1999, 666, '2011-12-10 00:00:00', '2014-10-26 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `аппаратура`
--
ALTER TABLE `аппаратура`
  ADD PRIMARY KEY (`ID_аппаратуры`),
  ADD KEY `ID_филм` (`ID_филм`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
