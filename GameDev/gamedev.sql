-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 24 2021 г., 19:35
-- Версия сервера: 5.7.24
-- Версия PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `gamedev`
--

-- --------------------------------------------------------

--
-- Структура таблицы `изменение цен игр`
--

CREATE TABLE `изменение цен игр` (
  `ID игры` int(20) NOT NULL,
  `Старая цена` float NOT NULL,
  `Новая цена` float NOT NULL,
  `Дата до обновления` datetime NOT NULL,
  `Дата обновления` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `изменение цен игр`
--

INSERT INTO `изменение цен игр` (`ID игры`, `Старая цена`, `Новая цена`, `Дата до обновления`, `Дата обновления`) VALUES
(2, 2339, 2350, '2021-05-24 19:34:53', '2021-05-24 19:34:53'),
(2, 2350, 2300, '2021-05-24 19:34:53', '2021-05-24 21:49:54'),
(5, 236, 547, '2021-05-24 21:51:04', '2021-05-24 21:51:04'),
(5, 547, 250, '2021-05-24 21:51:04', '2021-05-24 21:52:19'),
(5, 250, 480, '2021-05-24 21:52:19', '2021-05-24 22:34:30');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
