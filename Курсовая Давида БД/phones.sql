-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 13, 2021 at 12:33 PM
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
-- Database: `phones`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Всего продано единиц товаров каждым продавцом` ()  SELECT `Продавцы`.`ФИО`, Sum(`Продажи`.`Кол-во проданного`) AS `Всего продано единиц товаров`

FROM `Продавцы` INNER JOIN `Продажи` ON `Продавцы`.`ID_ПРОД` = `Продажи`.`ID_ПРОД`

GROUP BY `Продавцы`.`ФИО`, `Продажи`.`ID_ПРОД`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `добавить_продавца` (IN `fio` VARCHAR(40), IN `shop` INT)  INSERT INTO `продавцы` VALUES(fio,shop,NULL)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `обновить_цену_смартфона` (IN `cost` FLOAT, IN `id` INT)  UPDATE `смартфоны` SET `смартфоны`.`Цена`=cost WHERE
`смартфоны`.`ID_СМАРТ`=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `План продаж для отдельного магазина` ()  SELECT `План продаж`.`Код плана`, `Магазины`.`Название`, `Магазины`.`Адрес`, `Смартфоны`.`Наименование`, `План продаж`.`Кол-во`, `План продаж`.`Начало квартала (дата)`, `План продаж`.`Конец квартала (дата)`

FROM `Смартфоны` INNER JOIN (`Магазины` INNER JOIN `План продаж` ON `Магазины`.`ID_МАГ` = `План продаж`.`ID_МАГ`) ON `Смартфоны`.`ID_СМАРТ` = `План продаж`.`ID_СМАРТ`

WHERE (((`Магазины`.`ID_МАГ`)="1"))

ORDER BY `План продаж`.`Код плана`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Поиск смартфона в магазинах по аккумулятору` ()  SELECT `Смартфоны`.`Наименование`, `Смартфоны`.`Цена`, `Магазины`.`Название`, `Магазины`.`Адрес`, `Смартфоны в магазине`.`Кол-во`, `Смартфоны`.`Аккумулятор (мА·ч)`

FROM (`Магазины` INNER JOIN `Смартфоны в магазине` ON `Магазины`.`ID_МАГ` = `Смартфоны в магазине`.`ID_МАГ`) INNER JOIN Смартфоны ON `Смартфоны в магазине`.`ID_СМАРТ` = `Смартфоны`.`ID_СМАРТ`

WHERE (((`Смартфоны в магазине`.`Кол-во`)>0) AND ((`Смартфоны`.`Аккумулятор (мА·ч)`)>4500))$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Поиск смартфона определенного производителя на складе` ()  SELECT `Смартфоны`.`Производитель`, `Смартфоны`.`Наименование`

FROM `Смартфоны`

WHERE (((`Смартфоны`.`Производитель`)="Xiaomi"))$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Продажи по имени продавца` ()  SELECT `Продавцы`.`ФИО`, `Смартфоны`.`Наименование`, `Продажи`.`Кол-во проданного`, `Продажи`.`Дата`

FROM `Смартфоны` INNER JOIN (`Продавцы` INNER JOIN `Продажи` ON `Продавцы`.`ID_ПРОД` = `Продажи`.`ID_ПРОД`) ON `Смартфоны`.`ID_СМАРТ` = `Продажи`.`ID_СМАРТ`

WHERE (((`Продавцы`.`ФИО`)="Калашников Михаил Тимофеевич"))

ORDER BY `Продажи`.`Дата` DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Продажи смартфона по id` ()  SELECT `Продавцы`.`ФИО`, `Смартфоны`.`Наименование`, `Смартфоны`.`Цена`, `Продажи`.`Дата`, `Продажи`.`Кол-во проданного`

FROM `Смартфоны` INNER JOIN (`Продавцы` INNER JOIN `Продажи` ON `Продавцы`.`ID_ПРОД` = `Продажи`.`ID_ПРОД`) ON `Смартфоны`.`ID_СМАРТ` = `Продажи`.`ID_СМАРТ`

WHERE (((`Смартфоны`.`ID_СМАРТ`)="1"))$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `удалить_продавца` (IN `id` INT)  DELETE from `продавцы` where `продавцы`.`ID_ПРОД`=id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `заявки`
--

CREATE TABLE `заявки` (
  `Код` int(11) DEFAULT NULL,
  `ID_СМАРТ` varchar(255) DEFAULT NULL,
  `ID_МАГ` varchar(255) DEFAULT NULL,
  `Дата` varchar(40) DEFAULT NULL,
  `Кол-во` int(11) DEFAULT NULL,
  `Кол-во получено` varchar(255) DEFAULT NULL,
  `Дата получения` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `заявки`
--

INSERT INTO `заявки` (`Код`, `ID_СМАРТ`, `ID_МАГ`, `Дата`, `Кол-во`, `Кол-во получено`, `Дата получения`) VALUES
(1, '1', '2', '2020-11-01 00:00:00', 100, '100', '2020-11-02 00:00:00'),
(2, '1', '3', '2020-11-01 00:00:00', 100, '100', '2020-11-02 00:00:00'),
(3, '3', '1', '2020-11-01 00:00:00', 250, '250', '2020-11-02 00:00:00'),
(4, '3', '3', '2020-11-01 00:00:00', 250, '250', '2020-11-02 00:00:00'),
(5, '5', '3', '2020-11-01 00:00:00', 200, '200', '2020-11-02 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `изменение_цены_смартфона`
--

CREATE TABLE `изменение_цены_смартфона` (
  `Название` varchar(100) NOT NULL,
  `Старая цена` float NOT NULL,
  `Новая цена` float NOT NULL,
  `Дата до обновления` datetime NOT NULL,
  `Дата обновления` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `изменение_цены_смартфона`
--

INSERT INTO `изменение_цены_смартфона` (`Название`, `Старая цена`, `Новая цена`, `Дата до обновления`, `Дата обновления`) VALUES
('Xiaomi Redmi Note 9 Pro 6/128GB', 21480, 22000, '2020-09-15 00:00:00', '2021-09-12 20:50:19'),
('Xiaomi Redmi Note 9 Pro 6/128GB', 22000, 2350, '2021-09-12 20:50:19', '2021-09-12 22:19:01'),
('Xiaomi Redmi Note 9 Pro 6/128GB', 2350, 5, '2021-09-12 22:19:01', '2021-09-12 22:45:27'),
('Xiaomi Redmi Note 9 Pro 6/128GB', 5, 28, '2021-09-12 22:45:27', '2021-09-12 23:47:35'),
('Xiaomi Redmi Note 9 Pro 6/128GB', 28, 56000, '2021-09-12 23:47:35', '2021-09-13 00:00:43'),
('Xiaomi Redmi Note 9 Pro 6/128GB', 56000, 25, '2021-09-13 00:00:43', '2021-09-13 00:31:29'),
('Xiaomi Redmi Note 9 Pro 6/128GB', 25, 25700, '2021-09-13 00:31:29', '2021-09-13 15:29:47');

-- --------------------------------------------------------

--
-- Table structure for table `магазины`
--

CREATE TABLE `магазины` (
  `ID_МАГ` varchar(255) DEFAULT NULL,
  `Название` varchar(255) DEFAULT NULL,
  `Адрес` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `магазины`
--

INSERT INTO `магазины` (`ID_МАГ`, `Название`, `Адрес`) VALUES
('1', '\"21-ый век\", филиал 1', 'г. Москва, ул. Новослободская 45'),
('2', '\"21-ый век\", филиал 2', 'г. Москва, ул. Большая Лубянка 2'),
('3', '\"21-ый век\", филиал 3', 'г. Москва, ул. Фестивальная 2А');

-- --------------------------------------------------------

--
-- Table structure for table `план продаж`
--

CREATE TABLE `план продаж` (
  `Код плана` int(11) DEFAULT NULL,
  `ID_МАГ` varchar(255) DEFAULT NULL,
  `ID_СМАРТ` varchar(255) DEFAULT NULL,
  `Кол-во` int(11) DEFAULT NULL,
  `Начало квартала (дата)` datetime DEFAULT NULL,
  `Год` varchar(255) DEFAULT NULL,
  `Конец квартала (дата)` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `план продаж`
--

INSERT INTO `план продаж` (`Код плана`, `ID_МАГ`, `ID_СМАРТ`, `Кол-во`, `Начало квартала (дата)`, `Год`, `Конец квартала (дата)`) VALUES
(1, '1', '1', 125, '2020-12-01 00:00:00', '2021', '2021-02-28 00:00:00'),
(2, '1', '2', 125, '2020-12-01 00:00:00', '2021', '2021-02-28 00:00:00'),
(3, '1', '3', 125, '2020-12-01 00:00:00', '2021', '2021-02-28 00:00:00'),
(4, '1', '4', 125, '2020-12-01 00:00:00', '2021', '2021-02-28 00:00:00'),
(5, '1', '5', 125, '2020-12-01 00:00:00', '2021', '2021-02-28 00:00:00'),
(6, '2', '1', 200, '2020-12-01 00:00:00', '2021', '2021-02-28 00:00:00'),
(7, '2', '2', 200, '2020-12-01 00:00:00', '2021', '2021-02-28 00:00:00'),
(8, '2', '3', 200, '2020-12-01 00:00:00', '2021', '2021-02-28 00:00:00'),
(9, '2', '4', 200, '2020-12-01 00:00:00', '2021', '2021-02-28 00:00:00'),
(10, '2', '5', 200, '2020-12-01 00:00:00', '2021', '2021-02-28 00:00:00'),
(11, '3', '1', 300, '2020-12-01 00:00:00', '2021', '2021-02-28 00:00:00'),
(12, '3', '2', 300, '2020-12-01 00:00:00', '2021', '2021-02-28 00:00:00'),
(13, '3', '3', 300, '2020-12-01 00:00:00', '2021', '2021-02-28 00:00:00'),
(14, '3', '4', 300, '2020-12-01 00:00:00', '2021', '2021-02-28 00:00:00'),
(15, '3', '5', 300, '2020-12-01 00:00:00', '2021', '2021-02-28 00:00:00');

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
-- Table structure for table `поставки`
--

CREATE TABLE `поставки` (
  `Код` int(11) DEFAULT NULL,
  `ID_ПОСТОВ` varchar(255) DEFAULT NULL,
  `Дата поставки` datetime DEFAULT NULL,
  `ID_МАГ` varchar(255) DEFAULT NULL,
  `ID_СМАРТ` varchar(255) DEFAULT NULL,
  `Кол-во` int(11) DEFAULT NULL,
  `Цена за шт` double DEFAULT NULL,
  `Цена поставки` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `поставки`
--

INSERT INTO `поставки` (`Код`, `ID_ПОСТОВ`, `Дата поставки`, `ID_МАГ`, `ID_СМАРТ`, `Кол-во`, `Цена за шт`, `Цена поставки`) VALUES
(1, '1', '2020-11-02 00:00:00', '2', '1', 100, 20000, 2000000),
(2, '1', '2020-11-02 00:00:00', '3', '1', 100, 10000, 1000000),
(3, '1', '2020-11-02 00:00:00', '1', '3', 250, 15000, 3750000),
(4, '1', '2020-11-02 00:00:00', '3', '3', 250, 45000, 11250000),
(5, '1', '2020-11-02 00:00:00', NULL, '5', 200, 65000, 13000000);

-- --------------------------------------------------------

--
-- Table structure for table `продавцы`
--

CREATE TABLE `продавцы` (
  `ФИО` varchar(255) DEFAULT NULL,
  `ID_МАГ` varchar(255) DEFAULT NULL,
  `ID_ПРОД` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `продавцы`
--

INSERT INTO `продавцы` (`ФИО`, `ID_МАГ`, `ID_ПРОД`) VALUES
('Иванов Игорь Николаевич', '1', 1),
('Петров Дмитрий Сергеевич', '2', 2),
('Токарев Ярослав Игнатьевич', '1', 3),
('Калашников Михаил Тимофеевич', '3', 4),
('Виктор Иванович Баранов', '2', 5),
('Дегтярёв Василий Алексеевич', '3', 6),
('жмых пожилой', '55', 7);

-- --------------------------------------------------------

--
-- Table structure for table `продажи`
--

CREATE TABLE `продажи` (
  `Код` int(11) DEFAULT NULL,
  `ID_СМАРТ` varchar(255) DEFAULT NULL,
  `ID_ПРОД` varchar(255) DEFAULT NULL,
  `Кол-во проданного` int(11) DEFAULT NULL,
  `Дата` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `продажи`
--

INSERT INTO `продажи` (`Код`, `ID_СМАРТ`, `ID_ПРОД`, `Кол-во проданного`, `Дата`) VALUES
(1, NULL, NULL, NULL, NULL),
(2, '2', '1', 22, '2020-12-24 00:00:00'),
(3, '1', '5', 30, '2020-12-25 00:00:00'),
(4, '4', '2', 16, '2020-12-26 00:00:00'),
(5, '1', '6', 19, '2020-12-26 00:00:00'),
(6, '5', '4', 29, '2020-12-27 00:00:00'),
(7, '1', '3', 12, '2020-12-28 00:00:00'),
(8, '1', '3', 13, '2020-12-29 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `смартфоны`
--

CREATE TABLE `смартфоны` (
  `ID_СМАРТ` varchar(255) DEFAULT NULL,
  `Наименование` varchar(255) DEFAULT NULL,
  `Производитель` varchar(255) DEFAULT NULL,
  `Диагональ экрана (дюйм)` float DEFAULT NULL,
  `Оперативная память (ГБ)` int(11) DEFAULT NULL,
  `Процессор` varchar(255) DEFAULT NULL,
  `Аккумулятор (мА·ч)` int(11) DEFAULT NULL,
  `Память (ГБ)` int(11) DEFAULT NULL,
  `Цена` double DEFAULT NULL,
  `Кол-во на складе` int(11) DEFAULT NULL,
  `Дата выхода` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `смартфоны`
--

INSERT INTO `смартфоны` (`ID_СМАРТ`, `Наименование`, `Производитель`, `Диагональ экрана (дюйм)`, `Оперативная память (ГБ)`, `Процессор`, `Аккумулятор (мА·ч)`, `Память (ГБ)`, `Цена`, `Кол-во на складе`, `Дата выхода`) VALUES
('1', 'Xiaomi Redmi Note 9 Pro 6/128GB', 'Xiaomi', 6.67, 6, 'Qualcomm Snapdragon 720G', 5020, 128, 25700, 1523, '2020-09-15 00:00:00'),
('2', 'Xiaomi Poco M3 4/64GB', 'Xiaomi', 6.53, 4, 'Qualcomm Snapdragon 662', 6000, 64, 13380, 546, '2020-10-11 00:00:00'),
('3', 'Samsung Galaxy A51 64GB', 'Samsung', 6.5, 4, 'Samsung Exynos 9611', 4000, 64, 19900, 658, '2020-08-01 00:00:00'),
('4', 'Apple iPhone 11 64GB', 'Apple', 6.1, 4, 'Apple A13 Bionic', 3110, 64, 53490, 228, '2020-06-01 00:00:00'),
('5', 'Apple iPhone 12 64GB', 'Apple', 6.1, 4, 'Apple A14 Bionic', 2815, 64, 78139, 101, '2020-07-01 00:00:00');

--
-- Triggers `смартфоны`
--
DELIMITER $$
CREATE TRIGGER `cost_update` AFTER UPDATE ON `смартфоны` FOR EACH ROW BEGIN
if (old.`Цена` <> new.`Цена`) then
SET @old_date=(SELECT max(`Дата обновления`) as latest FROM `изменение_цены_смартфона` WHERE `Название`= new.`Наименование`);
IF @old_date is null THEN
	SET @old_date=(SELECT `Дата выхода` FROM `смартфоны` WHERE `Наименование`=new.`Наименование`);
end IF;
 INSERT INTO `изменение_цены_смартфона`(`Название`,`Старая цена`,`Новая цена`,`Дата до обновления`,`Дата обновления`) VALUES(new.`Наименование`,old.`Цена`,new.`Цена`,@old_date,NOW());
 end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `смартфоны в магазине`
--

CREATE TABLE `смартфоны в магазине` (
  `Код` int(11) DEFAULT NULL,
  `ID_СМАРТ` varchar(255) DEFAULT NULL,
  `Кол-во` int(11) DEFAULT NULL,
  `ID_МАГ` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `смартфоны в магазине`
--

INSERT INTO `смартфоны в магазине` (`Код`, `ID_СМАРТ`, `Кол-во`, `ID_МАГ`) VALUES
(1, '1', 121, '1'),
(2, '1', 0, '2'),
(3, '1', 0, '3'),
(4, '2', 23, '1'),
(5, '2', 15, '2'),
(6, '2', 34, '3'),
(7, '3', 0, '1'),
(8, '3', 12, '2'),
(9, '3', 0, '3'),
(10, '4', 123, '1'),
(11, '4', 41, '2'),
(12, '4', 42, '3'),
(13, '5', 2, '1'),
(14, '5', 21, '2'),
(15, '5', 13, '3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `продавцы`
--
ALTER TABLE `продавцы`
  ADD PRIMARY KEY (`ID_ПРОД`),
  ADD UNIQUE KEY `ID_ПРОД` (`ID_ПРОД`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `продавцы`
--
ALTER TABLE `продавцы`
  MODIFY `ID_ПРОД` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
