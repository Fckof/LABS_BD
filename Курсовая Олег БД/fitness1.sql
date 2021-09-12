-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 12, 2021 at 10:33 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fitness`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Группа` ()  SELECT `Групповые программы`.`Наименование`, `Клиенты`.`ФИО клиента`, `Тренера`.`ФИО тренера`

FROM `Адреса клиентов` INNER JOIN (`Клиенты` INNER JOIN ((`Тренера` INNER JOIN `Групповые программы` ON `Тренера`.`ID тренера` = `Групповые программы`.`ID тренера`) INNER JOIN `Запись на груп программы` ON `Групповые программы`.`ID программы` = `Запись на груп программы`.`ID программы`) ON `Клиенты`.`ID клиента` = `Запись на груп программы`.`ID клиента`) ON `Адреса клиентов`.`ID адреса` = `Клиенты`.`ID адреса`

WHERE (((`Адреса клиентов`.`город`)="Москва") AND ((`Запись на груп программы`.`ID программы`)="6"))$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Дежурство_тренеров` ()  SELECT `Тренера`.`ФИО тренера`, `Залы ФК`.`Место`, `Расписание дежурств`.`Дата`

FROM `Тренера` INNER JOIN (`Залы ФК` INNER JOIN `Расписание дежурств` ON `Залы ФК`.`ID зала` = `Расписание дежурств`.`ID зала`) ON `Тренера`.`ID тренера` = `Расписание дежурств`.`ID Тренера`

WHERE (((`Расписание дежурств`.`Дата`)="#12/3/2020#") AND ((`Залы ФК`.`ID зала`)="4"))$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Добавить_адрес` (IN `Город` VARCHAR(25), IN `Улица` VARCHAR(25), IN `Дом` INT, IN `Квартира` INT)  INSERT INTO `адреса клиентов` VALUES(null, Город, Улица, Дом, Квартира)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Обновить_абонемент` (IN `Карта` VARCHAR(25), IN `Цена` VARCHAR(25))  MODIFIES SQL DATA
UPDATE `абонемент` SET `абонемент`.`Стоимость`= Цена WHERE `абонемент`.`№ карты`= Карта$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Поиск_возрастной_группы` ()  SELECT `Клиенты`.`ФИО клиента`, `Клиенты`.`Телефонный номер`, `Адреса клиентов`.`город`, `Адреса клиентов`.`улица`, `Адреса клиентов`.`дом`, `Адреса клиентов`.`квартика`, `Клиенты`.`Дата рождения`

FROM `Адреса клиентов` INNER JOIN `Клиенты` ON `Адреса клиентов`.`ID адреса` = `Клиенты`.`ID адреса`

WHERE (((`Клиенты`.`Дата рождения`)>"#1/1/1990#") AND ((`Клиенты`.`Дата рождения`)<"#1/1/2009#"))$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Поиск_по_инд_тренировке` ()  SELECT `Клиенты`.`ФИО клиента`, Клиенты.`№ карты`

FROM `Клиенты` INNER JOIN ((`Тренера` INNER JOIN `Индивидуальные тренировки` ON `Тренера`.`ID тренера` = `Индивидуальные тренировки`.`ID тренера`) INNER JOIN `Запись на инд тренировки` ON `Индивидуальные тренировки`.`ID тренировки` = `Запись на инд тренировки`.`ID тренировки`) ON `Клиенты`.`ID клиента` = `Запись на инд тренировки`.`ID клиента`

WHERE (((`Тренера`.`ID тренера`)="4"))$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Удалить_адрес` (IN `id` INT)  DELETE FROM `адреса клиентов` WHERE `ID адреса`=id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `абонемент`
--

CREATE TABLE `абонемент` (
  `№ карты` int(11) DEFAULT NULL,
  `Акция*` varchar(12) DEFAULT NULL,
  `Скидка` varchar(3) DEFAULT NULL,
  `Срок` tinyint(4) DEFAULT NULL,
  `Дата покупки` varchar(19) DEFAULT NULL,
  `Дата активации` varchar(19) DEFAULT NULL,
  `Дата окончания` varchar(19) DEFAULT NULL,
  `Стоимость` mediumint(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `абонемент`
--

INSERT INTO `абонемент` (`№ карты`, `Акция*`, `Скидка`, `Срок`, `Дата покупки`, `Дата активации`, `Дата окончания`, `Стоимость`) VALUES
(2951001, 'Семейная', '20%', 12, '2020-12-19 00:00:00', '2020-12-23 00:00:00', '2021-12-22 00:00:00', 17300),
(2951020, '8 Марта', '15%', 9, '2020-03-08 00:00:00', '2020-03-08 00:00:00', '2020-12-07 00:00:00', 16900),
(2951645, 'Детская', '30%', 9, '2020-05-22 00:00:00', '2020-05-24 00:00:00', '2021-02-23 00:00:00', 13900),
(2951002, 'Семейная', '20%', 12, '2020-12-19 00:00:00', '2020-12-23 00:00:00', '2021-12-22 00:00:00', 17500),
(2951004, 'Семейная', '20%', 12, '2020-12-19 00:00:00', '2020-12-23 00:00:00', '2021-12-22 00:00:00', 17500),
(2951003, 'Семейная', '20%', 12, '2020-12-19 00:00:00', '2020-12-23 00:00:00', '2021-12-22 00:00:00', 17500),
(2951654, 'Студенческая', '18%', 15, '2020-01-10 00:00:00', '2020-01-23 00:00:00', '2021-04-22 00:00:00', 20700),
(2951658, 'Семейная', '20%', 12, '2020-12-19 00:00:00', '2020-12-19 00:00:00', '2021-12-18 00:00:00', 17500),
(2951657, 'Семейная', '20%', 12, '2020-12-19 00:00:00', '2020-12-19 00:00:00', '2021-12-18 00:00:00', 17500),
(2951659, 'Семейная', '20%', 12, '2020-12-19 00:00:00', '2020-12-19 00:00:00', '2021-12-18 00:00:00', 17500),
(2951655, 'Октфест', '18%', 9, '2020-10-02 00:00:00', '2020-10-08 00:00:00', '2021-07-07 00:00:00', 15900),
(2951656, 'Семейная', '20%', 12, '2020-12-19 00:00:00', '2020-12-19 00:00:00', '2021-12-18 00:00:00', 17500),
(2951894, '-', '-', 9, '2020-06-25 00:00:00', '2020-07-01 00:00:00', '2021-03-30 00:00:00', 19900),
(2951321, '8 Марта', '15%', 9, '2020-03-08 00:00:00', '2020-03-13 00:00:00', '2020-12-12 00:00:00', 16900),
(2951054, '-', '-', 12, '2020-07-16 00:00:00', '2020-07-21 00:00:00', '2021-07-20 00:00:00', 21900),
(2951032, '23 Февраля', '10%', 9, '2020-02-23 00:00:00', '2020-02-25 00:00:00', '2020-11-24 00:00:00', 17800),
(2951844, 'Детская', '30%', 9, '2020-04-07 00:00:00', '2020-04-07 00:00:00', '2021-01-06 00:00:00', 13900),
(2951845, 'Студенческая', '18%', 15, '2020-05-05 00:00:00', '2020-05-06 00:00:00', '2021-08-05 00:00:00', 20700),
(2951721, '23 Февраля', '10%', 9, '2020-02-23 00:00:00', '2020-02-23 00:00:00', '2020-11-22 00:00:00', 17800),
(2951489, '8 Марта', '15%', 9, '2020-03-08 00:00:00', '2020-03-13 00:00:00', '2020-12-12 00:00:00', 16900);

--
-- Triggers `абонемент`
--
DELIMITER $$
CREATE TRIGGER `upcost` AFTER UPDATE ON `абонемент` FOR EACH ROW BEGIN
IF (old.`Стоимость` <> new.`Стоимость`) then
SET @old_date=(SELECT max(`Дата обновления`) as latest FROM `изменение абонемента` WHERE `№ карты`= new.`№ карты`);
IF @old_date is null THEN
	SET @old_date=(SELECT `Дата покупки` FROM `абонемент` WHERE `№ карты`=new.`№ карты`);
end IF;
 INSERT INTO `изменение абонемента` (`№ карты`, `Старая цена`, `Новая цена`, `Дата до обновления`, `Дата обновления` ) VALUES (new.`№ карты`,old.`Стоимость`,new.`Стоимость`,@old_date,NOW());
 end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `адреса клиентов`
--

CREATE TABLE `адреса клиентов` (
  `ID адреса` tinyint(4) NOT NULL,
  `город` varchar(9) DEFAULT NULL,
  `улица` varchar(15) DEFAULT NULL,
  `дом` int(25) DEFAULT NULL,
  `квартика` int(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `адреса клиентов`
--

INSERT INTO `адреса клиентов` (`ID адреса`, `город`, `улица`, `дом`, `квартика`) VALUES
(1, 'Тула', 'Авангардная', 4, 88),
(2, 'Москва', 'Фестивальная', 39, 15),
(3, 'Москва', 'Смольная', 37, 28),
(4, 'Питер', 'Флотская', 28, 16),
(5, 'Москва', 'Флотская', 78, 80),
(6, 'Москва', 'Онежская', 2, 3),
(7, 'Москва', 'Солнечногорская', 29, 1),
(8, 'Москва', 'Флотская', 78, 69),
(9, 'Краснодар', 'Лавочкина', 96, 35),
(10, 'Москва', 'Клинская', 25, 79),
(11, 'Москва', 'Фестивальная', 4, 19),
(12, 'Питер', 'Флотская', 76, 4),
(13, 'Москва', 'Лебедевского', 28, 41),
(14, 'Москва', 'Фестивальная', 20, 20),
(15, 'Москва', 'Петрозаводская', 3, 27),
(16, 'Москва', 'Левобережная', 41, 56),
(17, 'Питер', 'Солнечногорская', 3, 17),
(18, 'Москва', 'Онежская', 25, 81),
(19, 'Тула', 'Смольная', 4, 290),
(20, 'Питер', 'Беломорская', 13, 13);

-- --------------------------------------------------------

--
-- Table structure for table `адреса персонала`
--

CREATE TABLE `адреса персонала` (
  `ID адреса` tinyint(4) DEFAULT NULL,
  `город` varchar(6) DEFAULT NULL,
  `улица` varchar(15) DEFAULT NULL,
  `дом` smallint(6) DEFAULT NULL,
  `квартика` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `адреса персонала`
--

INSERT INTO `адреса персонала` (`ID адреса`, `город`, `улица`, `дом`, `квартика`) VALUES
(1, 'Москва', 'Авангардная', 14, 57),
(2, 'Москва', 'Лавочкина', 37, 23),
(3, 'Москва', 'Смольная', 74, 44),
(4, 'Москва', 'Флотская', 28, 64),
(5, 'Москва', 'Солнечногорская', 75, 70),
(6, 'Москва', 'Онежская', 101, 67),
(7, 'Москва', 'Фестивальная', 35, 8),
(8, 'Москва', 'Флотская', 42, 54),
(9, 'Москва', 'Лавочкина', 34, 64),
(10, 'Москва', 'Фестивальная', 35, 25),
(11, 'Москва', 'Фестивальная', 65, 4),
(12, 'Москва', 'Флотская', 42, 13);

-- --------------------------------------------------------

--
-- Table structure for table `график работы тренеров`
--

CREATE TABLE `график работы тренеров` (
  `ID графика` tinyint(4) DEFAULT NULL,
  `ID ПН` tinyint(4) DEFAULT NULL,
  `ID ВТ` tinyint(4) DEFAULT NULL,
  `ID СР` tinyint(4) DEFAULT NULL,
  `ID ЧТ` tinyint(4) DEFAULT NULL,
  `ID ПТ` tinyint(4) DEFAULT NULL,
  `ID СБ` tinyint(4) DEFAULT NULL,
  `ID ВС` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `график работы тренеров`
--

INSERT INTO `график работы тренеров` (`ID графика`, `ID ПН`, `ID ВТ`, `ID СР`, `ID ЧТ`, `ID ПТ`, `ID СБ`, `ID ВС`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1),
(2, 2, 2, 2, 2, 2, 2, 2),
(3, 3, 3, 3, 3, 3, 3, 3),
(4, 4, 4, 4, 4, 4, 4, 4),
(5, 5, 5, 5, 5, 5, 5, 5),
(6, 6, 6, 6, 6, 6, 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `групповые программы`
--

CREATE TABLE `групповые программы` (
  `ID программы` tinyint(4) DEFAULT NULL,
  `Наименование` varchar(13) DEFAULT NULL,
  `Целевая группа` varchar(9) DEFAULT NULL,
  `ПН` varchar(4) DEFAULT NULL,
  `ВТ` varchar(4) DEFAULT NULL,
  `СР` varchar(4) DEFAULT NULL,
  `ЧТ` varchar(4) DEFAULT NULL,
  `ПТ` varchar(4) DEFAULT NULL,
  `СБ` varchar(4) DEFAULT NULL,
  `ВС` varchar(4) DEFAULT NULL,
  `ID зала` tinyint(4) DEFAULT NULL,
  `ID тренера` tinyint(4) DEFAULT NULL,
  `Продолжительность` varchar(6) DEFAULT NULL,
  `Цена` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `групповые программы`
--

INSERT INTO `групповые программы` (`ID программы`, `Наименование`, `Целевая группа`, `ПН`, `ВТ`, `СР`, `ЧТ`, `ПТ`, `СБ`, `ВС`, `ID зала`, `ID тренера`, `Продолжительность`, `Цена`) VALUES
(1, 'YOGA(дет.)', '8-16 лет', '1300', '', '1300', '', '', '1000', '', 1, 9, '45 мин', 500),
(2, 'Лягушата', '0-8 лет', '1400', '', '', '1500', '', '', '', 3, 8, '45 мин', 500),
(3, 'YOGA', '16-45 лет', '', '1800', '', '1900', '', '', '1600', 1, 10, '90 мин', 1000),
(4, 'HEALTHY SPINE', '8-45 лет', '1500', '', '', '', '1700', '', '', 1, 9, '60 мин', 1000),
(5, 'PORT DE BRAS', '16-45 лет', '', '2000', '', '', '', '1600', '', 2, 11, '60 мин', 700),
(6, 'BELLYDANCE', '8-45 лет', '', '', '1900', '', '1830', '', '', 1, 12, '60 мин', 700),
(7, 'ZUMBA', '16-45 лет', '', '2100', '', '1700', '', '', '1300', 1, 12, '60 мин', 1000),
(8, 'BALETPROFI', '16-45 лет', '', '', '1700', '', '', '1100', '', 2, 11, '90 мин', 1500),
(9, 'AQUA-NOODLES', '16-45 лет', '1600', '', '', '', '1300', '', '1200', 3, 8, '60 мин', 700),
(10, 'AQUA-MIX', '16-45 лет', '', '1500', '', '', '', '1400', '', 3, 7, '60 мин', 1000),
(11, 'AQUA-INTERVAL', '16-45 лет', '', '', '1700', '', '1600', '', '', 3, 7, '60 мин', 700);

-- --------------------------------------------------------

--
-- Table structure for table `залы фк`
--

CREATE TABLE `залы фк` (
  `ID зала` tinyint(4) DEFAULT NULL,
  `Место` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `залы фк`
--

INSERT INTO `залы фк` (`ID зала`, `Место`) VALUES
(1, 'Зал1'),
(2, 'Зал2'),
(3, 'Бассейн'),
(4, 'Тренажерный зал');

-- --------------------------------------------------------

--
-- Table structure for table `запись на груп программы`
--

CREATE TABLE `запись на груп программы` (
  `ID записи(груп)` tinyint(4) DEFAULT NULL,
  `ID программы` tinyint(4) DEFAULT NULL,
  `ID клиента` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `запись на груп программы`
--

INSERT INTO `запись на груп программы` (`ID записи(груп)`, `ID программы`, `ID клиента`) VALUES
(1, 1, 3),
(2, 3, 10),
(3, 8, 16),
(4, 6, 6),
(5, 1, 4),
(6, 7, 5),
(7, 9, 11),
(8, 10, 11),
(9, 11, 13),
(10, 8, 3),
(11, 11, 10),
(12, 6, 10),
(13, 11, 5),
(14, 5, 11),
(15, 2, 4),
(16, 4, 15),
(17, 4, 19),
(18, 7, 20),
(19, 8, 18),
(20, 9, 12),
(21, 10, 9),
(22, 1, 15),
(23, 1, 7),
(24, 1, 8),
(25, 5, 15),
(26, 10, 10),
(27, 9, 4),
(28, 9, 15),
(29, 11, 17),
(30, 3, 11),
(31, 6, 14),
(32, 6, 18),
(33, 9, 16),
(34, 10, 5),
(35, 6, 20);

-- --------------------------------------------------------

--
-- Table structure for table `запись на инд тренировки`
--

CREATE TABLE `запись на инд тренировки` (
  `ID записи(инд)` tinyint(4) DEFAULT NULL,
  `ID тренировки` tinyint(4) DEFAULT NULL,
  `ID клиента` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `запись на инд тренировки`
--

INSERT INTO `запись на инд тренировки` (`ID записи(инд)`, `ID тренировки`, `ID клиента`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 4, 20),
(4, 2, 2),
(5, 5, 9),
(6, 1, 11),
(7, 1, 16),
(8, 6, 5),
(9, 5, 13),
(10, 3, 7),
(11, 6, 20),
(12, 4, 13),
(13, 4, 6),
(14, 4, 17),
(15, 1, 18),
(16, 1, 12),
(17, 6, 10);

-- --------------------------------------------------------

--
-- Table structure for table `изменение абонемента`
--

CREATE TABLE `изменение абонемента` (
  `№ карты` varchar(25) NOT NULL,
  `Старая цена` float NOT NULL,
  `Новая цена` float NOT NULL,
  `Дата до обновления` datetime NOT NULL,
  `Дата обновления` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `изменение абонемента`
--

INSERT INTO `изменение абонемента` (`№ карты`, `Старая цена`, `Новая цена`, `Дата до обновления`, `Дата обновления`) VALUES
('2951001', 17500, 17900, '2020-12-19 00:00:00', '2021-09-07 10:55:57'),
('2951001', 17900, 17300, '2021-09-07 10:55:57', '2021-09-07 10:58:55');

-- --------------------------------------------------------

--
-- Table structure for table `индивидуальные тренировки`
--

CREATE TABLE `индивидуальные тренировки` (
  `ID тренировки` tinyint(4) DEFAULT NULL,
  `ID тренера` tinyint(4) DEFAULT NULL,
  `ID зала` tinyint(4) DEFAULT NULL,
  `ID графика` tinyint(4) DEFAULT NULL,
  `Цена` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `индивидуальные тренировки`
--

INSERT INTO `индивидуальные тренировки` (`ID тренировки`, `ID тренера`, `ID зала`, `ID графика`, `Цена`) VALUES
(1, 1, 4, 1, 3000),
(2, 2, 4, 2, 3000),
(3, 3, 4, 3, 2000),
(4, 4, 4, 4, 2000),
(5, 5, 4, 5, 3000),
(6, 6, 4, 6, 3000);

-- --------------------------------------------------------

--
-- Table structure for table `клиенты`
--

CREATE TABLE `клиенты` (
  `ID клиента` tinyint(4) DEFAULT NULL,
  `ФИО клиента` varchar(29) DEFAULT NULL,
  `М` varchar(5) DEFAULT NULL,
  `Ж` varchar(5) DEFAULT NULL,
  `№ карты` int(11) DEFAULT NULL,
  `Паспортные данные` varchar(11) DEFAULT NULL,
  `ID адреса` tinyint(4) DEFAULT NULL,
  `Дата рождения` varchar(19) DEFAULT NULL,
  `Телефонный номер` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `клиенты`
--

INSERT INTO `клиенты` (`ID клиента`, `ФИО клиента`, `М`, `Ж`, `№ карты`, `Паспортные данные`, `ID адреса`, `Дата рождения`, `Телефонный номер`) VALUES
(1, 'Абасов Николай Романович', 'True', 'False', 2951001, '8645 132315', 10, '1973-02-15 00:00:00', 9168974651),
(2, 'Абасова Ирина Генадьевна', 'False', 'True', 2951002, '5614 986513', 10, '1977-04-30 00:00:00', 9162566545),
(3, 'Абасова Анастасия Николаевна', 'False', 'True', 2951003, '2319 846511', 10, '2006-12-02 00:00:00', 9162566545),
(4, 'Абасов Артем Николаевич', 'True', 'False', 2951004, '3518 956132', 10, '2005-09-24 00:00:00', 9162566545),
(5, 'Макарова Мария Алексеевна', 'False', 'True', 2951656, '1865 136532', 17, '1983-10-20 00:00:00', 9645896584),
(6, 'Макаров Павел Владимирович', 'True', 'False', 2951657, '1654 652305', 17, '1981-03-26 00:00:00', 9645896584),
(7, 'Макарова Есения Павловна', 'False', 'True', 2951658, '5649 846513', 17, '2004-06-07 00:00:00', 9645896584),
(8, 'Макарова Василиса Павловна', 'False', 'True', 2951659, '3154 646465', 17, '2004-06-07 00:00:00', 9645896584),
(9, 'Пискарева Дарья Сергеевна', 'False', 'True', 2951020, '2318 652313', 1, '1989-07-02 00:00:00', 9154893486),
(10, 'Киселева Екатерина Дмитриевна', 'False', 'True', 2951321, '2318 948123', 5, '1996-03-06 00:00:00', 9109532546),
(11, 'Федорова Лариса Николаева', 'False', 'True', 2951489, '6865 123132', 14, '1992-06-29 00:00:00', 9263548966),
(12, 'Пашин Александр Никитович', 'True', 'False', 2951721, '1321 052155', 9, '1984-08-15 00:00:00', 9640321054),
(13, 'Скорняков Артем Николаевич', 'True', 'False', 2951032, '2156 449877', 6, '1999-09-12 00:00:00', 9156549823),
(14, 'Зиновьева Полина Михайловна', 'False', 'True', 2951645, '', 8, '2009-05-19 00:00:00', 9154625469),
(15, 'Федоров Максим Викторович', 'True', 'False', 2951844, '', 14, '2010-07-04 00:00:00', 9263548966),
(16, 'Соболев Михаил Борисович', 'True', 'False', 2951654, '5649 874865', 20, '2001-03-09 00:00:00', 9154946554),
(17, 'Басков Виталий Викторович', 'True', 'False', 2951845, '4689 632132', 4, '2000-11-21 00:00:00', 9648963332),
(18, 'Щукин Илья Кириллович', 'True', 'False', 2951655, '9874 632131', 12, '1989-01-14 00:00:00', 9645498465),
(19, 'Фридьева Валерия Всеволодовна', 'False', 'True', 2951054, '3165 464645', 15, '1985-05-28 00:00:00', 9167031316),
(20, 'Пушкин Илья Сергеевич', 'True', 'False', 2951894, '5454 548975', 7, '1997-01-31 00:00:00', 9158984654);

-- --------------------------------------------------------

--
-- Table structure for table `пользователи`
--

CREATE TABLE `пользователи` (
  `логин` varchar(25) NOT NULL,
  `пароль` varchar(25) NOT NULL,
  `статус` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `пользователи`
--

INSERT INTO `пользователи` (`логин`, `пароль`, `статус`) VALUES
('admin', 'admin123', 'администратор'),
('moder', 'moder123', 'модератор');

-- --------------------------------------------------------

--
-- Table structure for table `расписание вс`
--

CREATE TABLE `расписание вс` (
  `ID ВС` tinyint(4) DEFAULT NULL,
  `8:00` varchar(5) DEFAULT NULL,
  `9:00` varchar(5) DEFAULT NULL,
  `10:00` varchar(5) DEFAULT NULL,
  `11:00` varchar(5) DEFAULT NULL,
  `12:00` varchar(5) DEFAULT NULL,
  `13:00` varchar(5) DEFAULT NULL,
  `14:00` varchar(5) DEFAULT NULL,
  `15:00` varchar(5) DEFAULT NULL,
  `16:00` varchar(5) DEFAULT NULL,
  `17:00` varchar(5) DEFAULT NULL,
  `18:00` varchar(5) DEFAULT NULL,
  `19:00` varchar(5) DEFAULT NULL,
  `20:00` varchar(5) DEFAULT NULL,
  `21:00` varchar(5) DEFAULT NULL,
  `22:00` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `расписание вс`
--

INSERT INTO `расписание вс` (`ID ВС`, `8:00`, `9:00`, `10:00`, `11:00`, `12:00`, `13:00`, `14:00`, `15:00`, `16:00`, `17:00`, `18:00`, `19:00`, `20:00`, `21:00`, `22:00`) VALUES
(1, 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False'),
(2, 'True', 'True', 'True', 'False', 'True', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False'),
(5, 'False', 'False', 'False', 'False', 'False', 'True', 'False', 'True', 'False', 'True', 'True', 'False', 'False', 'False', 'False'),
(6, 'False', 'False', 'False', 'False', 'False', 'False', 'True', 'False', 'True', 'True', 'True', 'False', 'False', 'False', 'False'),
(3, 'False', 'True', 'False', 'True', 'True', 'True', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False'),
(4, 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False');

-- --------------------------------------------------------

--
-- Table structure for table `расписание вт`
--

CREATE TABLE `расписание вт` (
  `ID ВТ` tinyint(4) DEFAULT NULL,
  `8:00` varchar(5) DEFAULT NULL,
  `9:00` varchar(5) DEFAULT NULL,
  `10:00` varchar(5) DEFAULT NULL,
  `11:00` varchar(5) DEFAULT NULL,
  `12:00` varchar(5) DEFAULT NULL,
  `13:00` varchar(5) DEFAULT NULL,
  `14:00` varchar(5) DEFAULT NULL,
  `15:00` varchar(5) DEFAULT NULL,
  `16:00` varchar(5) DEFAULT NULL,
  `17:00` varchar(5) DEFAULT NULL,
  `18:00` varchar(5) DEFAULT NULL,
  `19:00` varchar(5) DEFAULT NULL,
  `20:00` varchar(5) DEFAULT NULL,
  `21:00` varchar(5) DEFAULT NULL,
  `22:00` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `расписание вт`
--

INSERT INTO `расписание вт` (`ID ВТ`, `8:00`, `9:00`, `10:00`, `11:00`, `12:00`, `13:00`, `14:00`, `15:00`, `16:00`, `17:00`, `18:00`, `19:00`, `20:00`, `21:00`, `22:00`) VALUES
(1, 'False', 'True', 'True', 'False', 'True', 'True', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False'),
(2, 'True', 'True', 'False', 'True', 'False', 'True', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False'),
(3, 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False'),
(4, 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'True', 'True', 'False', 'False', 'True', 'False', 'True', 'False'),
(5, 'False', 'False', 'False', 'False', 'False', 'False', 'True', 'False', 'False', 'True', 'True', 'False', 'True', 'False', 'False'),
(6, 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False');

-- --------------------------------------------------------

--
-- Table structure for table `расписание дежурств`
--

CREATE TABLE `расписание дежурств` (
  `ID дежурств` tinyint(4) DEFAULT NULL,
  `Дата` varchar(19) DEFAULT NULL,
  `ID зала` tinyint(4) DEFAULT NULL,
  `ID Тренера` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `расписание дежурств`
--

INSERT INTO `расписание дежурств` (`ID дежурств`, `Дата`, `ID зала`, `ID Тренера`) VALUES
(22, '2020-12-01 00:00:00', 3, 8),
(23, '2020-12-01 00:00:00', 4, 3),
(24, '2020-12-02 00:00:00', 3, 8),
(25, '2020-12-02 00:00:00', 4, 1),
(26, '2020-12-03 00:00:00', 3, 7),
(27, '2020-12-03 00:00:00', 4, 2),
(28, '2020-12-04 00:00:00', 3, 8),
(29, '2020-12-04 00:00:00', 4, 4),
(30, '2020-12-05 00:00:00', 3, 8),
(31, '2020-12-05 00:00:00', 4, 6),
(32, '2020-12-06 00:00:00', 3, 7),
(33, '2020-12-06 00:00:00', 4, 1),
(34, '2020-12-07 00:00:00', 3, 7),
(35, '2020-12-07 00:00:00', 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `расписание пн`
--

CREATE TABLE `расписание пн` (
  `ID ПН` tinyint(4) DEFAULT NULL,
  `8:00` varchar(5) DEFAULT NULL,
  `9:00` varchar(5) DEFAULT NULL,
  `10:00` varchar(5) DEFAULT NULL,
  `11:00` varchar(5) DEFAULT NULL,
  `12:00` varchar(5) DEFAULT NULL,
  `13:00` varchar(5) DEFAULT NULL,
  `14:00` varchar(5) DEFAULT NULL,
  `15:00` varchar(5) DEFAULT NULL,
  `16:00` varchar(5) DEFAULT NULL,
  `17:00` varchar(5) DEFAULT NULL,
  `18:00` varchar(5) DEFAULT NULL,
  `19:00` varchar(5) DEFAULT NULL,
  `20:00` varchar(5) DEFAULT NULL,
  `21:00` varchar(5) DEFAULT NULL,
  `22:00` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `расписание пн`
--

INSERT INTO `расписание пн` (`ID ПН`, `8:00`, `9:00`, `10:00`, `11:00`, `12:00`, `13:00`, `14:00`, `15:00`, `16:00`, `17:00`, `18:00`, `19:00`, `20:00`, `21:00`, `22:00`) VALUES
(1, 'True', 'True', 'True', 'False', 'True', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False'),
(2, 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'True', 'False', 'False', 'True', 'True', 'True', 'False', 'False'),
(3, 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False'),
(4, 'False', 'False', 'True', 'False', 'True', 'False', 'True', 'False', 'True', 'False', 'False', 'False', 'False', 'False', 'False'),
(5, 'False', 'True', 'True', 'True', 'False', 'True', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False'),
(6, 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False');

-- --------------------------------------------------------

--
-- Table structure for table `расписание пт`
--

CREATE TABLE `расписание пт` (
  `ID ПТ` tinyint(4) DEFAULT NULL,
  `8:00` varchar(5) DEFAULT NULL,
  `9:00` varchar(5) DEFAULT NULL,
  `10:00` varchar(5) DEFAULT NULL,
  `11:00` varchar(5) DEFAULT NULL,
  `12:00` varchar(5) DEFAULT NULL,
  `13:00` varchar(5) DEFAULT NULL,
  `14:00` varchar(5) DEFAULT NULL,
  `15:00` varchar(5) DEFAULT NULL,
  `16:00` varchar(5) DEFAULT NULL,
  `17:00` varchar(5) DEFAULT NULL,
  `18:00` varchar(5) DEFAULT NULL,
  `19:00` varchar(5) DEFAULT NULL,
  `20:00` varchar(5) DEFAULT NULL,
  `21:00` varchar(5) DEFAULT NULL,
  `22:00` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `расписание пт`
--

INSERT INTO `расписание пт` (`ID ПТ`, `8:00`, `9:00`, `10:00`, `11:00`, `12:00`, `13:00`, `14:00`, `15:00`, `16:00`, `17:00`, `18:00`, `19:00`, `20:00`, `21:00`, `22:00`) VALUES
(1, 'False', 'True', 'True', 'False', 'True', 'True', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False'),
(2, 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'True', 'True', 'False', 'True', 'True', 'True'),
(3, 'True', 'True', 'False', 'True', 'False', 'False', 'True', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False'),
(4, 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False'),
(5, 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'True', 'True', 'True', 'True', 'False', 'False', 'False', 'False'),
(6, 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'True', 'True', 'True', 'False', 'True');

-- --------------------------------------------------------

--
-- Table structure for table `расписание сб`
--

CREATE TABLE `расписание сб` (
  `ID СБ` tinyint(4) DEFAULT NULL,
  `8:00` varchar(5) DEFAULT NULL,
  `9:00` varchar(5) DEFAULT NULL,
  `10:00` varchar(5) DEFAULT NULL,
  `11:00` varchar(5) DEFAULT NULL,
  `12:00` varchar(5) DEFAULT NULL,
  `13:00` varchar(5) DEFAULT NULL,
  `14:00` varchar(5) DEFAULT NULL,
  `15:00` varchar(5) DEFAULT NULL,
  `16:00` varchar(5) DEFAULT NULL,
  `17:00` varchar(5) DEFAULT NULL,
  `18:00` varchar(5) DEFAULT NULL,
  `19:00` varchar(5) DEFAULT NULL,
  `20:00` varchar(5) DEFAULT NULL,
  `21:00` varchar(5) DEFAULT NULL,
  `22:00` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `расписание сб`
--

INSERT INTO `расписание сб` (`ID СБ`, `8:00`, `9:00`, `10:00`, `11:00`, `12:00`, `13:00`, `14:00`, `15:00`, `16:00`, `17:00`, `18:00`, `19:00`, `20:00`, `21:00`, `22:00`) VALUES
(1, 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'True', 'False', 'True', 'True', 'False', 'True', 'False', 'False'),
(2, 'True', 'True', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'True', 'True', 'False'),
(3, 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False'),
(4, 'False', 'False', 'True', 'True', 'True', 'True', 'True', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False'),
(5, 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'True', 'True', 'False', 'True', 'True', 'False', 'False', 'False'),
(6, 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False');

-- --------------------------------------------------------

--
-- Table structure for table `расписание ср`
--

CREATE TABLE `расписание ср` (
  `ID СР` tinyint(4) DEFAULT NULL,
  `8:00` varchar(5) DEFAULT NULL,
  `9:00` varchar(5) DEFAULT NULL,
  `10:00` varchar(5) DEFAULT NULL,
  `11:00` varchar(5) DEFAULT NULL,
  `12:00` varchar(5) DEFAULT NULL,
  `13:00` varchar(5) DEFAULT NULL,
  `14:00` varchar(5) DEFAULT NULL,
  `15:00` varchar(5) DEFAULT NULL,
  `16:00` varchar(5) DEFAULT NULL,
  `17:00` varchar(5) DEFAULT NULL,
  `18:00` varchar(5) DEFAULT NULL,
  `19:00` varchar(5) DEFAULT NULL,
  `20:00` varchar(5) DEFAULT NULL,
  `21:00` varchar(5) DEFAULT NULL,
  `22:00` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `расписание ср`
--

INSERT INTO `расписание ср` (`ID СР`, `8:00`, `9:00`, `10:00`, `11:00`, `12:00`, `13:00`, `14:00`, `15:00`, `16:00`, `17:00`, `18:00`, `19:00`, `20:00`, `21:00`, `22:00`) VALUES
(1, 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False'),
(2, 'False', 'False', 'False', 'False', 'False', 'False', 'True', 'False', 'False', 'True', 'True', 'False', 'True', 'False', 'True'),
(3, 'True', 'False', 'True', 'False', 'True', 'True', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False'),
(4, 'True', 'True', 'False', 'True', 'False', 'False', 'True', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False'),
(5, 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False'),
(6, 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'True', 'True', 'False', 'False', 'True', 'True', 'False', 'False');

-- --------------------------------------------------------

--
-- Table structure for table `расписание чт`
--

CREATE TABLE `расписание чт` (
  `ID ЧТ` tinyint(4) DEFAULT NULL,
  `8:00` varchar(5) DEFAULT NULL,
  `9:00` varchar(5) DEFAULT NULL,
  `10:00` varchar(5) DEFAULT NULL,
  `11:00` varchar(5) DEFAULT NULL,
  `12:00` varchar(5) DEFAULT NULL,
  `13:00` varchar(5) DEFAULT NULL,
  `14:00` varchar(5) DEFAULT NULL,
  `15:00` varchar(5) DEFAULT NULL,
  `16:00` varchar(5) DEFAULT NULL,
  `17:00` varchar(5) DEFAULT NULL,
  `18:00` varchar(5) DEFAULT NULL,
  `19:00` varchar(5) DEFAULT NULL,
  `20:00` varchar(5) DEFAULT NULL,
  `21:00` varchar(5) DEFAULT NULL,
  `22:00` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `расписание чт`
--

INSERT INTO `расписание чт` (`ID ЧТ`, `8:00`, `9:00`, `10:00`, `11:00`, `12:00`, `13:00`, `14:00`, `15:00`, `16:00`, `17:00`, `18:00`, `19:00`, `20:00`, `21:00`, `22:00`) VALUES
(1, 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'True', 'True', 'True', 'True', 'True', 'False', 'False'),
(2, 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False'),
(3, 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'True', 'True', 'False', 'False', 'False', 'True', 'True', 'False'),
(4, 'False', 'True', 'True', 'True', 'False', 'False', 'True', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False'),
(5, 'True', 'True', 'False', 'False', 'True', 'True', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False'),
(6, 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'True', 'True', 'True', 'False');

-- --------------------------------------------------------

--
-- Table structure for table `тренера`
--

CREATE TABLE `тренера` (
  `ID тренера` tinyint(4) DEFAULT NULL,
  `ФИО тренера` varchar(28) DEFAULT NULL,
  `Специализация` varchar(34) DEFAULT NULL,
  `Категория` varchar(13) DEFAULT NULL,
  `Паспортные данные` varchar(11) DEFAULT NULL,
  `ID адреса` tinyint(4) DEFAULT NULL,
  `Дата рождения` int(11) DEFAULT NULL,
  `Номер телефона` varchar(17) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `тренера`
--

INSERT INTO `тренера` (`ID тренера`, `ФИО тренера`, `Специализация`, `Категория`, `Паспортные данные`, `ID адреса`, `Дата рождения`, `Номер телефона`) VALUES
(2, 'Федосеев Николай Вадимович', 'Силовые и функциональные программы', 'мастер-тренер', '2154 545545', 3, 23121986, '+7(915) 454-84-54'),
(3, 'Гуров Иван Антонович', 'Силовые и функциональные программы', 'тренер', '2654 456465', 4, 6011977, '+7(964) 548-65-37'),
(4, 'Невгад Мария Павловна', 'Силовые и функциональные программы', 'тренер', '1615 456487', 7, 6061991, '+7(916) 564-55-35'),
(5, 'Ананьев Алексей Георгиевич', 'Силовые и функциональные программы', 'мастер-тренер', '1346 849798', 7, 2071986, '+7(910) 125-46-89'),
(6, 'Гризер Ирина Дмитриевна', 'Водные программы и аквааэробика', 'мастер-тренер', '1454 895153', 6, 26011992, '+7(964) 548-31-23'),
(7, 'Донсков Евгений Владимирович', 'Водные программы и аквааэробика', 'тренер', '2565 485895', 1, 17091981, '+7(916) 454-89-86'),
(8, 'Устинов Леонид Васильевич', 'Водные программы и аквааэробика', 'инструктор', '9548 524654', 5, 30041995, '+7(916) 654-32-54'),
(9, 'Зарипова Галина Артуровна', 'Гибкость и восстановление', 'инструктор', '9498 745315', 8, 24091964, '+7(915) 549-86-54'),
(10, 'Потапкин Игорь Максимович', 'Гибкость и восстановление', 'инструктор', '4894 654984', 9, 31011970, '+7(916) 548-94-58'),
(11, 'Скитева Ирина Николаевна', 'Танцевальные программы', 'инструктор', '4986 221255', 10, 5051982, '+7(914) 746-54-98'),
(12, 'Козырева Юлия Сергеевна', 'Танцевальные программы', 'инструктор', '3525 455561', 11, 19081984, '+7(964) 987-31-87'),
(1, 'Никулин Павел Сергеевич', 'Силовые и функциональные программы', 'мастер-тренер', '1451 124563', 2, 12051971, '+7(964) 584-54-85');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `адреса клиентов`
--
ALTER TABLE `адреса клиентов`
  ADD PRIMARY KEY (`ID адреса`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `адреса клиентов`
--
ALTER TABLE `адреса клиентов`
  MODIFY `ID адреса` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
