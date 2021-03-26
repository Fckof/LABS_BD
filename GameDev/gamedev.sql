-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 26, 2021 at 12:55 PM
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
-- Database: `gamedev`
--

-- --------------------------------------------------------

--
-- Table structure for table `должности`
--

CREATE TABLE `должности` (
  `ID должности` tinyint(4) NOT NULL,
  `Название должности` varchar(19) DEFAULT NULL
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
  `ID игры` tinyint(4) DEFAULT NULL,
  `ID разработчика` tinyint(4) DEFAULT NULL,
  `Название` varchar(22) DEFAULT NULL,
  `Дата начала работы` varchar(19) DEFAULT NULL,
  `Дата окончания работы` varchar(19) DEFAULT NULL,
  `Дата выпуска` varchar(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `игры`
--

INSERT INTO `игры` (`ID игры`, `ID разработчика`, `Название`, `Дата начала работы`, `Дата окончания работы`, `Дата выпуска`) VALUES
(1, 3, 'Watch Dogs', '2012-05-04 00:00:00', '2014-08-07 00:00:00', '2014-08-07 00:00:00'),
(2, 6, 'Metro 2033', '2008-07-03 00:00:00', '2010-05-23 00:00:00', '2010-07-23 00:00:00'),
(3, 6, 'Metro: Last Light', '2013-09-16 00:00:00', '2016-02-21 00:00:00', '2016-02-21 00:00:00'),
(4, 6, 'Metro Exodus', '2017-04-30 00:00:00', '2019-06-11 00:00:00', '2019-07-11 00:00:00'),
(5, 1, 'The Witcher', '2005-07-05 00:00:00', '2007-11-19 00:00:00', '2007-12-01 00:00:00'),
(6, 1, 'The Witcher 2', '2008-06-03 00:00:00', '2011-12-28 00:00:00', '2012-01-05 00:00:00'),
(7, 1, 'The Witcher 3', '2012-08-05 00:00:00', '2015-09-25 00:00:00', '2015-10-12 00:00:00'),
(8, 5, 'STALKER Тень Чернобыля', '2001-04-26 00:00:00', '2006-07-12 00:00:00', '2006-08-29 00:00:00'),
(9, 5, 'STALKER Чистое Небо', '2007-01-23 00:00:00', '2009-06-29 00:00:00', '2010-01-30 00:00:00'),
(10, 5, 'STALKER Зов Припяти', '2010-09-12 00:00:00', '2012-01-30 00:00:00', '2013-01-08 00:00:00'),
(11, 3, 'Watch Dogs Legion', '2018-06-06 00:00:00', '2020-09-05 00:00:00', '2020-09-05 00:00:00'),
(12, 3, 'Assassin`s Creed', '2000-04-12 00:00:00', '2002-02-07 00:00:00', '2002-04-09 00:00:00'),
(13, 4, 'The Last of Us', '2012-03-05 00:00:00', '2015-08-09 00:00:00', '2016-09-09 00:00:00'),
(14, 4, 'The Last of Us 2', '2016-07-03 00:00:00', '2020-03-15 00:00:00', '2020-03-20 00:00:00'),
(15, 4, 'Uncharted 4', '2014-08-27 00:00:00', '2018-12-06 00:00:00', '2018-01-06 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `исполнители`
--

CREATE TABLE `исполнители` (
  `ID исполнителя` tinyint(4) NOT NULL,
  `Фамилия` varchar(11) DEFAULT NULL,
  `Имя` varchar(8) DEFAULT NULL,
  `Отчество` varchar(13) DEFAULT NULL,
  `ID должности` tinyint(4) DEFAULT NULL
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
(27, 'Ыгорь', 'Ысмаил', 'Кагыров', 13);

-- --------------------------------------------------------

--
-- Table structure for table `команда проекта`
--

CREATE TABLE `команда проекта` (
  `ID команды` tinyint(4) NOT NULL,
  `ID игры` tinyint(4) DEFAULT NULL,
  `ID исполнителя` tinyint(4) DEFAULT NULL,
  `ID роли` tinyint(4) DEFAULT NULL,
  `ID этапа` tinyint(4) DEFAULT NULL,
  `Оклад за этап` mediumint(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `команда проекта`
--

INSERT INTO `команда проекта` (`ID команды`, `ID игры`, `ID исполнителя`, `ID роли`, `ID этапа`, `Оклад за этап`) VALUES
(6, 1, 1, 5, 2, 2000),
(7, 1, 2, 5, 2, 15000),
(8, 1, 3, 4, 2, 5000),
(9, 2, 4, 2, 2, 4500),
(10, 2, 5, 6, 5, 780),
(11, 6, 7, 4, 2, 1300),
(12, 6, 8, 1, 3, 8000),
(13, 10, 9, 5, 3, 56000),
(14, 10, 10, 1, 1, 10000),
(15, 12, 11, 4, 5, 46000),
(16, 12, 12, 2, 3, 630),
(17, 3, 13, 8, 3, 10000),
(18, 3, 14, 7, 3, 7000);

-- --------------------------------------------------------

--
-- Table structure for table `команда разработчиков`
--

CREATE TABLE `команда разработчиков` (
  `ID разработчика` tinyint(4) NOT NULL,
  `Название` varchar(14) DEFAULT NULL,
  `Дата начала работы` varchar(19) DEFAULT NULL
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
-- Table structure for table `роли`
--

CREATE TABLE `роли` (
  `ID роли` tinyint(4) NOT NULL,
  `Название роли` varchar(31) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `роли`
--

INSERT INTO `роли` (`ID роли`, `Название роли`) VALUES
(1, 'Разработка карты'),
(2, 'Тестирование'),
(3, 'Аналитика пргодаж'),
(4, 'Оптимизация кода'),
(5, 'Проектировка архитектуры'),
(6, 'Исследование медиа пространства'),
(7, 'Концептуальная разработка'),
(8, 'Введение логики');

-- --------------------------------------------------------

--
-- Table structure for table `этапы`
--

CREATE TABLE `этапы` (
  `ID этапа` tinyint(4) NOT NULL,
  `Название этапа` varchar(11) DEFAULT NULL
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
  ADD PRIMARY KEY (`ID должности`),
  ADD UNIQUE KEY `ID должности` (`ID должности`),
  ADD KEY `ID должности_2` (`ID должности`);

--
-- Indexes for table `исполнители`
--
ALTER TABLE `исполнители`
  ADD PRIMARY KEY (`ID исполнителя`),
  ADD UNIQUE KEY `ID исполнителя` (`ID исполнителя`),
  ADD KEY `ID исполнителя_2` (`ID исполнителя`);

--
-- Indexes for table `команда проекта`
--
ALTER TABLE `команда проекта`
  ADD PRIMARY KEY (`ID команды`),
  ADD UNIQUE KEY `ID команды` (`ID команды`);

--
-- Indexes for table `команда разработчиков`
--
ALTER TABLE `команда разработчиков`
  ADD PRIMARY KEY (`ID разработчика`),
  ADD UNIQUE KEY `ID разработчика` (`ID разработчика`);

--
-- Indexes for table `роли`
--
ALTER TABLE `роли`
  ADD PRIMARY KEY (`ID роли`),
  ADD UNIQUE KEY `ID роли` (`ID роли`);

--
-- Indexes for table `этапы`
--
ALTER TABLE `этапы`
  ADD PRIMARY KEY (`ID этапа`),
  ADD UNIQUE KEY `ID этапа` (`ID этапа`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
