-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 26, 2021 at 10:56 AM
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
-- Database: `gamedev`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteuser` (IN `id` INT(20), IN `name` VARCHAR(15) CHARSET utf8mb4)  MODIFIES SQL DATA
    DETERMINISTIC
DELETE FROM `исполнители` WHERE `Имя`=`name` and `ID исполнителя`=`id`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updatecost` (IN `id` INT(20), IN `cost` FLOAT(20))  MODIFIES SQL DATA
BEGIN
SET @old_date=(SELECT max(`Дата обновления`) as latest FROM `изменение цен игр` WHERE `ID игры`= id);
IF @old_date is null THEN
	SET @old_date=(SELECT `Дата выпуска` FROM `игры` WHERE `игры`.`ID игры`=id);
end IF;
 SET @old_cost = (SELECT `Цена за копию` FROM `игры` WHERE `игры`.`ID игры`=id);
 INSERT INTO `изменение цен игр`(`ID игры`,`Старая цена`,`Новая цена`,`Дата до обновления`,`Дата обновления`) VALUES(id,@old_cost,cost,@old_date,NOW());
UPDATE `игры` SET `Цена за копию`=cost WHERE `игры`.`ID игры`=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updaterating` (IN `id` INT(20), IN `rating` INT(20))  MODIFIES SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
SET @old_date=(SELECT max(`Дата обновления`) as latest FROM `изменение рейтинга` WHERE `ID игры`= id);
IF @old_date is null THEN
	SET @old_date=(SELECT `Дата выпуска` FROM `игры` WHERE `игры`.`ID игры`=id);
end IF;
 SET @old_rate = (SELECT `Рейтинг` FROM `игры` WHERE `игры`.`ID игры`=id);
 INSERT INTO `изменение рейтинга`(`ID игры`,`Старый рейтинг`,`Новый рейтинг`,`Дата до обновления`,`Дата обновления`) VALUES(id,@old_rate,rating,@old_date,NOW());
UPDATE `игры` SET `Рейтинг`=rating WHERE  `игры`.`ID игры`=id ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_cost` (IN `id` INT, IN `cost` FLOAT)  MODIFIES SQL DATA
UPDATE `игры` SET `Цена за копию`=cost WHERE `игры`.`ID игры`=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_rating` (IN `id` INT, IN `rating` INT)  MODIFIES SQL DATA
UPDATE `игры` SET `Рейтинг`=rating WHERE  `игры`.`ID игры`=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `zapros1` ()  READS SQL DATA
SELECT `игры`.`Название`, COUNT(`команда проекта`.`ID этапа`) AS `Количество`
FROM `игры` INNER JOIN `команда проекта` ON `игры`.`ID игры` = `команда проекта`.`ID игры`
GROUP BY `игры`.`Название`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `zapros10` ()  READS SQL DATA
SELECT `команда разработчиков`.`Название`, Sum(`команда проекта`.`Оклад за этап`) AS `Затраты`
FROM `команда разработчиков` INNER JOIN (`игры` INNER JOIN `команда проекта` ON `игры`.`ID игры` = `команда проекта`.`ID игры`) ON `команда разработчиков`.`ID разработчика` = `игры`.`ID разработчика`
GROUP BY `команда разработчиков`.`Название`
ORDER BY Sum(`команда проекта`.`Оклад за этап`) DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `zapros14` ()  READS SQL DATA
SELECT * FROM `исполнители` INNER JOIN `должности` ON `должности`.`ID должности`=`исполнители`.`ID должности` WHERE `Имя` LIKE 'И%'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `zapros2` ()  READS SQL DATA
SELECT `исполнители`.`Фамилия`, `исполнители`.`Имя`, `исполнители`.`Отчество`, `команда проекта`.`Оклад за этап` FROM `исполнители` INNER JOIN `команда проекта` ON `исполнители`.`ID исполнителя` = `команда проекта`.`ID исполнителя`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `zapros3` ()  READS SQL DATA
SELECT `игры`.`Название`, `этапы`.`Название этапа`, SUM(`команда проекта`.`Оклад за этап`) AS `Общая сумма` FROM `игры` INNER JOIN (`этапы` INNER JOIN `команда проекта` ON `этапы`.`ID этапа` = `команда проекта`.`ID этапа`) ON `игры`.`ID игры` = `команда проекта`.`ID игры`
GROUP BY `игры`.`Название`, `этапы`.`Название этапа`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `zapros4` ()  READS SQL DATA
SELECT `роли`.`Название роли`, Count(`исполнители`.`ID исполнителя`) AS `Люди`
FROM `роли` INNER JOIN (`исполнители` INNER JOIN `команда проекта` ON `исполнители`.`ID исполнителя` = `команда проекта`.`ID исполнителя`) ON `роли`.`ID роли` = `команда проекта`.`ID роли`
GROUP BY `роли`.`Название роли`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `zapros5` ()  READS SQL DATA
SELECT `Должности`.`Название должности`, Sum(`Команда проекта`.`Оклад за этап`) AS `Общий оклад`
FROM (`должности` INNER JOIN `исполнители` ON `должности`.`ID должности` = `исполнители`.`ID должности`) INNER JOIN `команда проекта` ON `исполнители`.`ID исполнителя` = `команда проекта`.`ID исполнителя`
GROUP BY `должности`.`Название должности`
ORDER BY Sum(`команда проекта`.`Оклад за этап`) DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `zapros6` ()  READS SQL DATA
SELECT `игры`.`Название`, Count(`исполнители`.`ID исполнителя`) AS `Исполнители`
FROM `игры` INNER JOIN (`исполнители` INNER JOIN `команда проекта` ON `исполнители`.`ID исполнителя` = `команда проекта`.`ID исполнителя`) ON `игры`.`ID игры` = `команда проекта`.`ID игры`
GROUP BY `игры`.`Название`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `zapros7` ()  READS SQL DATA
SELECT `команда разработчиков`.`Название`, Count(`игры`.`Название`) AS `Количество`
FROM `команда разработчиков` INNER JOIN `игры` ON `команда разработчиков`.`ID разработчика` = `игры`.`ID разработчика`
GROUP BY `команда разработчиков`.`Название`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `zapros8` ()  READS SQL DATA
SELECT `игры`.`Название`, Year(`игры`.`Дата окончания работы`)-Year(`игры`.`Дата начала работы`) AS `Лет` FROM `игры`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `zapros9` ()  READS SQL DATA
SELECT DISTINCT `игры`.`Название`, Sum(`команда проекта`.`Оклад за этап`) AS `Стоимость`
FROM игры INNER JOIN `команда проекта` ON `игры`.`ID игры` = `команда проекта`.`ID игры`
GROUP BY `игры`.`Название`$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `должности`
--

CREATE TABLE `должности` (
  `ID должности` int(50) NOT NULL,
  `Название должности` varchar(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `должности`
--

INSERT INTO `должности` (`ID должности`, `Название должности`) VALUES
(1, 'Дизайнер'),
(2, 'Художник'),
(3, 'Программист'),
(4, 'Ведущий разработчик'),
(5, 'Геймдиректор'),
(6, 'Продюсер'),
(12, 'Тестер'),
(13, 'Пиарщик');

-- --------------------------------------------------------

--
-- Table structure for table `игры`
--

CREATE TABLE `игры` (
  `ID игры` int(50) NOT NULL,
  `ID разработчика` int(50) NOT NULL,
  `Название` varchar(50) NOT NULL,
  `Рейтинг` varchar(50) NOT NULL,
  `Цена за копию` float DEFAULT NULL,
  `Дата начала работы` varchar(50) NOT NULL,
  `Дата окончания работы` varchar(50) NOT NULL,
  `Дата выпуска` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `игры`
--

INSERT INTO `игры` (`ID игры`, `ID разработчика`, `Название`, `Рейтинг`, `Цена за копию`, `Дата начала работы`, `Дата окончания работы`, `Дата выпуска`) VALUES
(1, 3, 'Watch Dogs', '21', 3000, '2012-05-04 00:00:00', '2014-08-07 00:00:00', '2014-08-07 00:00:00'),
(2, 6, 'Metro 2033', '14', 1000, '2008-07-03 00:00:00', '2010-05-23 00:00:00', '2010-07-23 00:00:00'),
(3, 6, 'Metro: Last Light', '15', 1400, '2013-09-16 00:00:00', '2016-02-21 00:00:00', '2016-02-21 00:00:00'),
(4, 6, 'Metro Exodus', '17', 1999, '2017-04-30 00:00:00', '2019-06-11 00:00:00', '2019-07-11 00:00:00'),
(5, 1, 'The Witcher', '12', 480, '2005-07-05 00:00:00', '2007-11-19 00:00:00', '2007-12-01 00:00:00'),
(6, 1, 'The Witcher 2', '18', 514, '2008-06-03 00:00:00', '2011-12-28 00:00:00', '2012-01-05 00:00:00'),
(7, 1, 'The Witcher 3', '18', 1699, '2012-08-05 00:00:00', '2015-09-25 00:00:00', '2015-10-12 00:00:00'),
(8, 5, 'STALKER Тень Чернобыля', '16', 349, '2001-04-26 00:00:00', '2006-07-12 00:00:00', '2006-08-29 00:00:00'),
(9, 5, 'STALKER Чистое Небо', '17', 500, '2007-01-23 00:00:00', '2009-06-29 00:00:00', '2010-01-30 00:00:00'),
(10, 5, 'STALKER Зов Припяти', '9', 800, '2010-09-12 00:00:00', '2012-01-30 00:00:00', '2013-01-08 00:00:00'),
(11, 3, 'Watch Dogs Legion', '18', 798, '2018-06-06 00:00:00', '2020-09-05 00:00:00', '2020-09-05 00:00:00'),
(12, 3, 'Assassin`s Creed', '10', 560, '2000-04-12 00:00:00', '2002-02-07 00:00:00', '2002-04-09 00:00:00'),
(13, 4, 'The Last of Us', '16', 1290, '2012-03-05 00:00:00', '2015-08-09 00:00:00', '2016-09-09 00:00:00'),
(14, 4, 'The Last of Us 2', '18', 3000, '2016-07-03 00:00:00', '2020-03-15 00:00:00', '2020-03-20 00:00:00'),
(15, 4, 'Uncharted 4', '12', 2000, '2014-08-27 00:00:00', '2018-12-06 00:00:00', '2018-12-06 00:00:00');

--
-- Triggers `игры`
--
DELIMITER $$
CREATE TRIGGER `cost_update` AFTER UPDATE ON `игры` FOR EACH ROW BEGIN
SET @old_date=(SELECT max(`Дата обновления`) as latest FROM `изменение цен игр` WHERE `ID игры`= new.`ID игры`);
IF @old_date is null THEN
	SET @old_date=(SELECT `Дата выпуска` FROM `игры` WHERE `игры`.`ID игры`=new.`ID игры`);
end IF;
 INSERT INTO `изменение цен игр`(`ID игры`,`Старая цена`,`Новая цена`,`Дата до обновления`,`Дата обновления`) VALUES(new.`ID игры`,old.`Цена за копию`,new.`Цена за копию`,@old_date,NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `rating_update` AFTER UPDATE ON `игры` FOR EACH ROW BEGIN
SET @old_date=(SELECT max(`Дата обновления`) as latest FROM `изменение рейтинга` WHERE `ID игры`= new.`ID игры`);
IF @old_date is null THEN
	SET @old_date=(SELECT `Дата выпуска` FROM `игры` WHERE `игры`.`ID игры`=new.`ID игры`);
end IF;
 INSERT INTO `изменение рейтинга`(`ID игры`,`Старый рейтинг`,`Новый рейтинг`,`Дата до обновления`,`Дата обновления`) VALUES(new.`ID игры`,old.`Рейтинг`,new.`Рейтинг`,@old_date,NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `изменение рейтинга`
--

CREATE TABLE `изменение рейтинга` (
  `ID игры` int(100) NOT NULL,
  `Старый рейтинг` int(100) NOT NULL,
  `Новый рейтинг` int(100) NOT NULL,
  `Дата до обновления` datetime NOT NULL,
  `Дата обновления` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `изменение рейтинга`
--

INSERT INTO `изменение рейтинга` (`ID игры`, `Старый рейтинг`, `Новый рейтинг`, `Дата до обновления`, `Дата обновления`) VALUES
(1, 15, 16, '2014-08-07 00:00:00', '2021-05-25 23:13:42'),
(15, 20, 12, '2018-12-06 00:00:00', '2021-05-25 23:21:57'),
(10, 15, 9, '2013-01-08 00:00:00', '2021-05-25 23:33:07'),
(1, 16, 21, '2021-05-25 23:13:42', '2021-05-26 12:49:33'),
(1, 21, 21, '2021-05-26 12:49:33', '2021-05-26 12:57:25'),
(2, 14, 14, '2010-07-23 00:00:00', '2021-05-26 12:58:40');

-- --------------------------------------------------------

--
-- Table structure for table `изменение цен игр`
--

CREATE TABLE `изменение цен игр` (
  `ID игры` int(20) NOT NULL,
  `Старая цена` float NOT NULL,
  `Новая цена` float NOT NULL,
  `Дата до обновления` datetime NOT NULL,
  `Дата обновления` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `изменение цен игр`
--

INSERT INTO `изменение цен игр` (`ID игры`, `Старая цена`, `Новая цена`, `Дата до обновления`, `Дата обновления`) VALUES
(2, 2300, 1900, '2010-07-23 00:00:00', '2021-05-25 23:19:00'),
(2, 1900, 1499, '2021-05-25 23:19:00', '2021-05-25 23:20:40'),
(1, 899, 3000, '2014-08-07 00:00:00', '2021-05-26 12:57:25'),
(2, 1499, 1000, '2021-05-25 23:20:40', '2021-05-26 12:58:40');

-- --------------------------------------------------------

--
-- Table structure for table `исполнители`
--

CREATE TABLE `исполнители` (
  `ID исполнителя` int(50) NOT NULL,
  `Фамилия` varchar(50) NOT NULL,
  `Имя` varchar(50) NOT NULL,
  `Отчество` varchar(50) NOT NULL,
  `ID должности` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `исполнители`
--

INSERT INTO `исполнители` (`ID исполнителя`, `Фамилия`, `Имя`, `Отчество`, `ID должности`) VALUES
(1, 'Богов', 'Ииуда', 'Хаскович', 1),
(2, 'Жиглов', 'Скрип', 'Татарович', 2),
(3, 'Щегол', 'Иван', ' Базарович', 3),
(4, 'Лыткин', 'Роман', 'Станиславович', 4),
(5, 'Евдокимов', ' Гурий', 'Евсеевич', 5),
(7, 'Гущин', 'Емельян', 'Пётрович', 6),
(8, 'Шилов', ' Карл', 'Федорович', 12),
(9, 'Соболев', 'Матвей', 'Антонинович', 13),
(10, 'Горбачёв', ' Лев', 'Артемович', 1),
(11, 'Кириллов', 'Матвей', 'Альвианович', 2),
(12, 'Шестаков', 'Федор', 'Натанович', 3),
(13, 'Сидоров', 'Евдоким', 'Ростиславович', 4),
(14, 'Чеботова', 'Алла', 'Брониславовна', 5),
(15, 'Яшина', 'Ираида', 'Тимофеевна', 6),
(16, 'Папанов', 'Зиновий', 'Самуилович', 12),
(17, 'Надервель', 'Парфен', 'Самуилович', 13),
(18, 'Дарюшин', ' Василий', 'Даниилович', 1),
(19, 'Щукина', 'Оксана', 'Данилевна', 2),
(20, 'Сиян', 'Герасим', 'Глебович', 3),
(21, 'Черенчикова', 'Нона', 'Ростиславовна', 4),
(22, 'Язов', 'Николай', 'Епифанович', 5),
(23, 'Сычкина', 'Евгения', 'Захаровна', 6),
(24, 'Мальчикова', 'Фаина', 'Ростиславовна', 12),
(27, 'Ыгорь', 'Ысмаил', 'Кагыров', 13),
(28, 'Алекс', 'Кларк', 'Кент', 2),
(29, 'Крэкс', 'Пэкс', 'Фэкс', 5),
(40, 'Flip', 'Gucci', 'Flap', 12);

-- --------------------------------------------------------

--
-- Table structure for table `команда проекта`
--

CREATE TABLE `команда проекта` (
  `Поле` int(50) NOT NULL,
  `ID команды` int(50) NOT NULL,
  `ID игры` int(50) NOT NULL,
  `ID исполнителя` int(50) NOT NULL,
  `ID роли` int(50) NOT NULL,
  `ID этапа` int(50) NOT NULL,
  `Оклад за этап` int(200) NOT NULL,
  `Начало этапа` date DEFAULT NULL,
  `Конец этапа` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `команда проекта`
--

INSERT INTO `команда проекта` (`Поле`, `ID команды`, `ID игры`, `ID исполнителя`, `ID роли`, `ID этапа`, `Оклад за этап`, `Начало этапа`, `Конец этапа`) VALUES
(1, 1, 1, 1, 5, 2, 30000, NULL, NULL),
(2, 1, 1, 2, 7, 1, 120000, NULL, NULL),
(3, 1, 1, 3, 4, 2, 5000, NULL, NULL),
(4, 2, 2, 4, 2, 2, 4500, NULL, NULL),
(5, 2, 2, 5, 6, 5, 780, NULL, NULL),
(6, 11, 6, 7, 4, 2, 1300, NULL, NULL),
(7, 12, 6, 8, 1, 3, 8000, NULL, NULL),
(8, 13, 10, 9, 5, 3, 56000, NULL, NULL),
(9, 14, 10, 10, 1, 1, 10000, NULL, NULL),
(10, 15, 12, 11, 4, 5, 46000, NULL, NULL),
(11, 16, 12, 12, 2, 3, 630, NULL, NULL),
(12, 17, 3, 13, 8, 3, 10000, NULL, NULL),
(13, 18, 3, 14, 7, 3, 7000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `команда разработчиков`
--

CREATE TABLE `команда разработчиков` (
  `ID разработчика` int(50) NOT NULL,
  `Название` varchar(50) NOT NULL,
  `Дата начала работы` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `команда разработчиков`
--

INSERT INTO `команда разработчиков` (`ID разработчика`, `Название`, `Дата начала работы`) VALUES
(1, 'CD Project RED', '2000-05-12 00:00:00'),
(3, 'Ubisoft', '2005-04-08 00:00:00'),
(4, 'Naughty Dog', '2008-08-25 00:00:00'),
(5, 'GSC', '2030-02-05 00:00:00'),
(6, 'Deep Silver', '2003-06-05 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `пользователи`
--

CREATE TABLE `пользователи` (
  `Логин` varchar(10) CHARACTER SET utf8mb4 NOT NULL,
  `Пароль` varchar(10) CHARACTER SET utf8mb4 NOT NULL,
  `ID доступа` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `пользователи`
--

INSERT INTO `пользователи` (`Логин`, `Пароль`, `ID доступа`) VALUES
('root', 'root123', 0),
('moderator', 'moder123', 1),
('user', 'user123', 2);

-- --------------------------------------------------------

--
-- Table structure for table `роли`
--

CREATE TABLE `роли` (
  `ID роли` tinyint(4) NOT NULL,
  `Название роли` varchar(31) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `роли`
--

INSERT INTO `роли` (`ID роли`, `Название роли`) VALUES
(1, 'Разработка карты'),
(2, 'Тестирование'),
(3, 'Аналитика продаж'),
(4, 'Оптимизация кода'),
(5, 'Проектировка архитектуры'),
(6, 'Исследование медиа пространства'),
(7, 'Концептуальная разработка'),
(8, 'Введение логики');

-- --------------------------------------------------------

--
-- Table structure for table `уровни доступа`
--

CREATE TABLE `уровни доступа` (
  `ID доступа` int(11) NOT NULL,
  `Доступ` varchar(10) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `уровни доступа`
--

INSERT INTO `уровни доступа` (`ID доступа`, `Доступ`) VALUES
(0, 'root'),
(1, 'moderator'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `этапы`
--

CREATE TABLE `этапы` (
  `ID этапа` tinyint(4) NOT NULL,
  `Название этапа` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `этапы`
--

INSERT INTO `этапы` (`ID этапа`, `Название этапа`) VALUES
(1, 'Идея'),
(2, 'Реализация'),
(3, 'Компоновка'),
(4, 'Доработка'),
(5, 'Выпуск игры');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `должности`
--
ALTER TABLE `должности`
  ADD PRIMARY KEY (`ID должности`);

--
-- Indexes for table `игры`
--
ALTER TABLE `игры`
  ADD PRIMARY KEY (`ID игры`),
  ADD UNIQUE KEY `ID игры` (`ID игры`),
  ADD KEY `ID разработчика` (`ID разработчика`);

--
-- Indexes for table `изменение рейтинга`
--
ALTER TABLE `изменение рейтинга`
  ADD KEY `ID игры` (`ID игры`);

--
-- Indexes for table `исполнители`
--
ALTER TABLE `исполнители`
  ADD PRIMARY KEY (`ID исполнителя`),
  ADD UNIQUE KEY `ID исполнителя` (`ID исполнителя`),
  ADD KEY `ID должности` (`ID должности`);

--
-- Indexes for table `команда проекта`
--
ALTER TABLE `команда проекта`
  ADD PRIMARY KEY (`Поле`),
  ADD KEY `ID роли` (`ID роли`),
  ADD KEY `ID исполнителя` (`ID исполнителя`),
  ADD KEY `ID игры` (`ID игры`),
  ADD KEY `ID этапа` (`ID этапа`);

--
-- Indexes for table `команда разработчиков`
--
ALTER TABLE `команда разработчиков`
  ADD PRIMARY KEY (`ID разработчика`),
  ADD UNIQUE KEY `ID разработчика` (`ID разработчика`);

--
-- Indexes for table `пользователи`
--
ALTER TABLE `пользователи`
  ADD KEY `ID доступа` (`ID доступа`);

--
-- Indexes for table `роли`
--
ALTER TABLE `роли`
  ADD PRIMARY KEY (`ID роли`),
  ADD UNIQUE KEY `ID роли` (`ID роли`);

--
-- Indexes for table `уровни доступа`
--
ALTER TABLE `уровни доступа`
  ADD KEY `ID доступа` (`ID доступа`);

--
-- Indexes for table `этапы`
--
ALTER TABLE `этапы`
  ADD PRIMARY KEY (`ID этапа`),
  ADD UNIQUE KEY `ID этапа` (`ID этапа`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `должности`
--
ALTER TABLE `должности`
  MODIFY `ID должности` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `игры`
--
ALTER TABLE `игры`
  MODIFY `ID игры` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `исполнители`
--
ALTER TABLE `исполнители`
  MODIFY `ID исполнителя` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `команда проекта`
--
ALTER TABLE `команда проекта`
  MODIFY `Поле` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `команда разработчиков`
--
ALTER TABLE `команда разработчиков`
  MODIFY `ID разработчика` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `исполнители`
--
ALTER TABLE `исполнители`
  ADD CONSTRAINT `исполнители_ibfk_1` FOREIGN KEY (`ID должности`) REFERENCES `должности` (`ID должности`);

--
-- Constraints for table `команда проекта`
--
ALTER TABLE `команда проекта`
  ADD CONSTRAINT `команда проекта_ibfk_1` FOREIGN KEY (`ID игры`) REFERENCES `игры` (`ID игры`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
