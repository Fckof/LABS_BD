-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 19, 2021 at 07:10 PM
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
-- Database: `pizza`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Добавление нового заказа` (IN `курьер` INT, IN `адрес` INT, IN `клиент` INT)  INSERT into `заказ` VALUES(null,now(),курьер,адрес,клиент)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Добавление нового сотрудника` (IN `fam` VARCHAR(100), IN `name` VARCHAR(100), IN `otch` VARCHAR(100), IN `tabel` VARCHAR(100), IN `passport` VARCHAR(100), IN `driver` VARCHAR(5))  INSERT INTO `курьер` VALUES(null,fam,name,otch,tabel,passport,driver)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Заказы на конкретную пиццу` ()  SELECT `заказ`.`КодЗаказа`,`заказ`.`Дата`,
`заказ`.`Код_курьера`,`заказ`.`Код_адреса`,`заказ`.`Код_клиента` from `заказ` INNER JOIN `заказпицца` on `заказпицца`.`КодЗаказа`=`заказ`.`КодЗаказа`
inner join `пицца` on `пицца`.`КодПиццы`=`заказпицца`.`КодПиццы` 
WHERE `пицца`.`Название`="Маргарита"$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Клиенты которые заказали эту пиццу` ()  SELECT `клиент`.`КодКлиента`, `клиент`.`Фамилия`,
`клиент`.`Имя`,`клиент`.`Отчество` FROM `клиент` 
INNER JOIN `заказ` on `заказ`.`Код_клиента`=`клиент`.`КодКлиента`
inner join `заказпицца` on `заказпицца`.`КодЗаказа`=`заказ`.`КодЗаказа`
inner join `пицца` on `пицца`.`КодПиццы`=`заказпицца`.`КодПиццы` WHERE 
`пицца`.`Название`="Американка"$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Курьеры которые доставляли эту пиццу` ()  SELECT `курьер`.`КодКурьера`,`курьер`.`Фамилия`,
`курьер`.`Имя`,`курьер`.`Отчетсво` FROM `курьер` INNER JOIN `заказ`
ON `заказ`.`Код_курьера`=`курьер`.`КодКурьера`
INNER JOIN `заказпицца` on 
`заказпицца`.`КодЗаказа`=`заказ`.`КодЗаказа`
inner JOIN `пицца` on `пицца`.`КодПиццы`=`заказпицца`.`КодПиццы` WHERE
`пицца`.`Название`="Ассорти"$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `обновить цену пиццы` (IN `id` INT, IN `cost` FLOAT)  UPDATE `пицца` SET `пицца`.`Стоимость`=cost WHERE 
`пицца`.`КодПиццы`=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Отображение сотрудников которые доставили больше N пицц` (IN `n` INT)  SELECT `курьер`.`КодКурьера`,
`курьер`.`Фамилия`,`курьер`.`Имя`,`курьер`.`Отчетсво`,
COUNT(`заказ`.`КодЗаказа`) as Доставок  FROM `курьер` inner JOIN
`заказ` on `курьер`.`КодКурьера`=`заказ`.`Код_курьера` GROUP by `курьер`.`КодКурьера` HAVING COUNT(`заказ`.`КодЗаказа`) > n$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Пиццы которые доставлял этот курьер` ()  SELECT `курьер`.`КодКурьера`, `пицца`.`Название`,`пицца`.`Стоимость` FROM
`пицца` inner JOIN `заказпицца` ON `заказпицца`.`КодПиццы`=`пицца`.`КодПиццы` INNER JOIN
`заказ` ON `заказ`.`КодЗаказа`=`заказпицца`.`КодЗаказа`
INNER JOIN `курьер` ON `курьер`.`КодКурьера`=`заказ`.`Код_курьера` WHERE
`курьер`.`КодКурьера`=1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `поиск курьера по фамилии` ()  SELECT `курьер`.`КодКурьера`,`курьер`.`Фамилия`,
`курьер`.`Имя`,`курьер`.`Отчетсво`,`курьер`.`ТабельныйНомер`
FROM `курьер` WHERE `курьер`.`Фамилия`="Ким"$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Удаление нового заказа` (IN `id` INT)  DELETE from `заказ` WHERE `заказ`.`КодЗаказа`=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Удаление сотрудника` (IN `id` INT)  DELETE from `курьер` WHERE `курьер`.`КодКурьера`=id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `автомобиль`
--

CREATE TABLE `автомобиль` (
  `КодАвтомобиля` tinyint(4) DEFAULT NULL,
  `Регистрационный номер` varchar(10) DEFAULT NULL,
  `Дата последнего ТО` varchar(19) DEFAULT NULL,
  `Цвет` varchar(10) DEFAULT NULL,
  `МаркаАвтомобиля` varchar(8) DEFAULT NULL,
  `Год выпуска` varchar(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `автомобиль`
--

INSERT INTO `автомобиль` (`КодАвтомобиля`, `Регистрационный номер`, `Дата последнего ТО`, `Цвет`, `МаркаАвтомобиля`, `Год выпуска`) VALUES
(1, '01.02.1993', '1992-12-12 00:00:00', 'зеленый', 'scoda', '1992-01-01 00:00:00'),
(2, '02.02.1994', '1993-11-11 00:00:00', 'красный', 'mercedez', '1993-02-02 00:00:00'),
(3, '03.031995', '1994-12-12 00:00:00', 'фиолетовый', 'lada', '2002-04-03 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `заказ`
--

CREATE TABLE `заказ` (
  `КодЗаказа` tinyint(4) NOT NULL,
  `Дата` varchar(200) DEFAULT NULL,
  `Код_курьера` tinyint(4) DEFAULT NULL,
  `Код_адреса` tinyint(4) DEFAULT NULL,
  `Код_клиента` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `заказ`
--

INSERT INTO `заказ` (`КодЗаказа`, `Дата`, `Код_курьера`, `Код_адреса`, `Код_клиента`) VALUES
(1, '24.12.2020', 1, 1, 1),
(2, '12.12.2020', 2, 2, 2),
(3, '11.11.2020', 3, 3, 3),
(4, '12.05.2002', 2, 2, 3),
(6, '2021-09-19 18:25:35', 1, 2, 2),
(7, '2021-09-19 21:53:01', 12, 8, 6);

-- --------------------------------------------------------

--
-- Table structure for table `заказпицца`
--

CREATE TABLE `заказпицца` (
  `КодЗаказа` tinyint(4) DEFAULT NULL,
  `КодПиццы` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `заказпицца`
--

INSERT INTO `заказпицца` (`КодЗаказа`, `КодПиццы`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `клиент`
--

CREATE TABLE `клиент` (
  `КодКлиента` tinyint(4) DEFAULT NULL,
  `Фамилия` varchar(7) DEFAULT NULL,
  `Имя` varchar(5) DEFAULT NULL,
  `Отчество` varchar(12) DEFAULT NULL,
  `Адрес` varchar(15) DEFAULT NULL,
  `Метро` varchar(14) DEFAULT NULL,
  `КодОтДомофона` mediumint(9) DEFAULT NULL,
  `Подъезд` tinyint(4) DEFAULT NULL,
  `Этаж` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `клиент`
--

INSERT INTO `клиент` (`КодКлиента`, `Фамилия`, `Имя`, `Отчество`, `Адрес`, `Метро`, `КодОтДомофона`, `Подъезд`, `Этаж`) VALUES
(1, 'Вареник', 'Илим', 'Бекович', 'Фестивальная, 4', 'Речной вокзал', 123321, 1, 2),
(2, 'Заремба', 'Алина', 'Олеговна', 'Красная, 5', 'Водный стадион', 222111, 3, 4),
(3, 'Кулик', 'Артем', 'Валентинович', 'Зеленая, 4', 'Ховрино', 21323, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `курьер`
--

CREATE TABLE `курьер` (
  `КодКурьера` tinyint(4) NOT NULL,
  `Фамилия` varchar(9) DEFAULT NULL,
  `Имя` varchar(7) DEFAULT NULL,
  `Отчетсво` varchar(14) DEFAULT NULL,
  `ТабельныйНомер` smallint(6) DEFAULT NULL,
  `ПоспортныеДанные` bigint(20) DEFAULT NULL,
  `ВодительскиеПрава` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `курьер`
--

INSERT INTO `курьер` (`КодКурьера`, `Фамилия`, `Имя`, `Отчетсво`, `ТабельныйНомер`, `ПоспортныеДанные`, `ВодительскиеПрава`) VALUES
(1, 'Епифанцев', 'Егор', 'Андреевич', 101, 310790482, 'есть'),
(2, 'Ким', 'Юрий', 'Константинович', 202, 342143123, 'есть'),
(3, 'Кураж', 'Евгений', 'Андреевич', 303, 231442213, 'есть');

-- --------------------------------------------------------

--
-- Table structure for table `курьеравтомобиль`
--

CREATE TABLE `курьеравтомобиль` (
  `КодКурьера` tinyint(4) DEFAULT NULL,
  `КодАвтомобиля` tinyint(4) DEFAULT NULL,
  `ДатаЗакреп` varchar(19) DEFAULT NULL,
  `ДатаОткреп` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `курьеравтомобиль`
--

INSERT INTO `курьеравтомобиль` (`КодКурьера`, `КодАвтомобиля`, `ДатаЗакреп`, `ДатаОткреп`) VALUES
(1, 1, '2019-12-01 00:00:00', ''),
(2, 2, '2020-12-01 00:00:00', ''),
(3, 3, '2020-12-01 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `обновление цены пиццы`
--

CREATE TABLE `обновление цены пиццы` (
  `Название` varchar(100) NOT NULL,
  `Старая цена` float NOT NULL,
  `Новая цена` float NOT NULL,
  `Дата до обновления` datetime NOT NULL,
  `Дата обновления` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `обновление цены пиццы`
--

INSERT INTO `обновление цены пиццы` (`Название`, `Старая цена`, `Новая цена`, `Дата до обновления`, `Дата обновления`) VALUES
('Маргарита', 300, 400, '2021-09-19 21:46:35', '2021-09-19 21:46:35'),
('Маргарита', 400, 250, '2021-09-19 21:46:35', '2021-09-19 21:55:33'),
('Маргарита', 250, 550, '2021-09-19 21:55:33', '2021-09-19 22:06:24'),
('Американка', 500, 300, '2021-09-19 22:06:35', '2021-09-19 22:06:35'),
('Американка', 300, 450, '2021-09-19 22:06:35', '2021-09-19 22:06:44');

-- --------------------------------------------------------

--
-- Table structure for table `пицца`
--

CREATE TABLE `пицца` (
  `КодПиццы` tinyint(4) DEFAULT NULL,
  `Название` varchar(10) DEFAULT NULL,
  `Вес` smallint(6) DEFAULT NULL,
  `Стоимость` smallint(6) DEFAULT NULL,
  `Размер` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `пицца`
--

INSERT INTO `пицца` (`КодПиццы`, `Название`, `Вес`, `Стоимость`, `Размер`) VALUES
(1, 'Маргарита', 300, 550, 'маленькая'),
(2, 'Американка', 400, 450, 'средняя'),
(3, 'Ассорти', 500, 600, 'большая');

--
-- Triggers `пицца`
--
DELIMITER $$
CREATE TRIGGER `cost_update` AFTER UPDATE ON `пицца` FOR EACH ROW BEGIN
if (old.`Стоимость` <> new.`Стоимость`) then
SET @old_date=(SELECT max(`Дата обновления`) as latest FROM `обновление цены пиццы` WHERE `Название`= new.`Название`);
IF @old_date is null THEN
	SET @old_date=NOW();
end IF;
 INSERT INTO `обновление цены пиццы` VALUES(new.`Название`,old.`Стоимость`,new.`Стоимость`,@old_date,NOW());
 end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `пиццапродукт`
--

CREATE TABLE `пиццапродукт` (
  `КодПиццы` tinyint(4) DEFAULT NULL,
  `КодПродукта` tinyint(4) DEFAULT NULL,
  `КодПродукта2` tinyint(4) DEFAULT NULL,
  `КодПродукта3` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `пиццапродукт`
--

INSERT INTO `пиццапродукт` (`КодПиццы`, `КодПродукта`, `КодПродукта2`, `КодПродукта3`) VALUES
(1, 1, 2, ''),
(2, 2, 1, '3'),
(3, 1, 1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `пользователи`
--

CREATE TABLE `пользователи` (
  `логин` varchar(100) NOT NULL,
  `пароль` varchar(100) NOT NULL,
  `статус` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `пользователи`
--

INSERT INTO `пользователи` (`логин`, `пароль`, `статус`) VALUES
('moder', 'moder123', 'модератор'),
('admin', 'admin123', 'администратор'),
('user', 'user123', 'пользователь');

-- --------------------------------------------------------

--
-- Table structure for table `продукт`
--

CREATE TABLE `продукт` (
  `КодПродукта` tinyint(4) DEFAULT NULL,
  `Наименование` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `продукт`
--

INSERT INTO `продукт` (`КодПродукта`, `Наименование`) VALUES
(1, 'Колбаса'),
(2, 'Мясо'),
(3, 'Грибы');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `заказ`
--
ALTER TABLE `заказ`
  ADD PRIMARY KEY (`КодЗаказа`);

--
-- Indexes for table `курьер`
--
ALTER TABLE `курьер`
  ADD PRIMARY KEY (`КодКурьера`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `заказ`
--
ALTER TABLE `заказ`
  MODIFY `КодЗаказа` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `курьер`
--
ALTER TABLE `курьер`
  MODIFY `КодКурьера` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
