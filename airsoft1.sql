-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 20, 2017 at 11:17 AM
-- Server version: 10.1.9-MariaDB-log
-- PHP Version: 7.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airsoft1`
--

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` int(15) NOT NULL,
  `title` tinytext,
  `date` date DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `title`, `date`, `location`) VALUES
(3, 'final battle2', '2017-07-16', 'Subotica'),
(8, 'Star Wars', '2017-08-04', 'Avala'),
(9, 'Bitka2', '2017-08-10', 'Novi Sad'),
(10, 'rat', '2017-08-19', 'Novi Sad');

-- --------------------------------------------------------

--
-- Table structure for table `guns`
--

CREATE TABLE `guns` (
  `id` int(15) NOT NULL,
  `title` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `guns`
--

INSERT INTO `guns` (`id`, `title`) VALUES
(1, 'Berreta'),
(2, 'Glock'),
(4, 'Desert eagle');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(15) NOT NULL,
  `user_id` int(11) NOT NULL,
  `games_id` int(11) NOT NULL,
  `get_killed` varchar(45) DEFAULT NULL,
  `kills` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `user_id`, `games_id`, `get_killed`, `kills`) VALUES
(5, 2, 3, '66', '99'),
(6, 2, 8, '4', '7'),
(7, 1, 8, '44', '33'),
(9, 1, 3, '57', '3'),
(10, 4, 3, '55', '88'),
(11, 6, 8, '77', '12'),
(12, 5, 8, '89', '76'),
(13, 7, 3, '7777', '8888'),
(14, 6, 3, '88', '99');

-- --------------------------------------------------------

--
-- Table structure for table `rifles`
--

CREATE TABLE `rifles` (
  `id` int(15) NOT NULL,
  `title` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rifles`
--

INSERT INTO `rifles` (`id`, `title`) VALUES
(1, 'AK-47'),
(2, 'M4'),
(3, 'G36'),
(4, 'Sniper');

-- --------------------------------------------------------

--
-- Table structure for table `rolls`
--

CREATE TABLE `rolls` (
  `id` int(15) NOT NULL,
  `rolle` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rolls`
--

INSERT INTO `rolls` (`id`, `rolle`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(15) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`) VALUES
(1, 'admin team');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(15) NOT NULL,
  `nickname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `avatar` varchar(45) DEFAULT NULL,
  `gun_id` int(11) DEFAULT NULL,
  `rifle_id` int(11) DEFAULT NULL,
  `teams_id` int(11) DEFAULT NULL,
  `roll_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nickname`, `email`, `password`, `avatar`, `gun_id`, `rifle_id`, `teams_id`, `roll_id`) VALUES
(1, 'Niki', 'nikoletavlaskovic@hotmail.com', 'a29f47705209ff5c52c6a7eb7374841a', NULL, 1, 4, 1, 1),
(2, 'Masa', 'masa@hotmail.com', 'b871954a3003cb418dae73a63a629a74', NULL, 2, 3, 1, 2),
(3, 'Milivoj', 'masa@hotmail.com', '677c76dd3876f4b1c68a3df52bb2d7d8', NULL, 2, 1, 1, 2),
(4, 'Ana Jovanovic', 'ana@hotmail.com', '5390489da3971cbbcd22c159d54d24da', NULL, 1, 1, 1, 2),
(5, 'Dusan', 'duca@yahoo.com', 'f6fd9bb09682d26c058d83d420ecd1ad', NULL, 2, 3, 1, 2),
(6, 'Simona', 'simona@hotmail.com', 'c1ef1eb7e9de0b30fa55f95de4429c9c', NULL, 4, 4, 1, 2),
(7, 'Kaca', 'kaca@hotmail.com', '7558b1d3ed1cc80baba54dd4073a7b5e', NULL, 2, 3, 1, 2),
(9, 'Mara', 'mara@hotmail.com', 'f3f54b076867988993b8895bccc94805', NULL, 1, 1, 1, 2),
(21, 'Z dusan', 'dusan@gmail.com', 'f6fd9bb09682d26c058d83d420ecd1ad', NULL, 2, 2, 1, 2),
(22, 'Mlata Zamlata', 'mlata@gmail.com', '4996e9eedf90be86f4d8268ec4249ad4', NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guns`
--
ALTER TABLE `guns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_results_users1_idx` (`user_id`),
  ADD KEY `fk_results_games1_idx` (`games_id`);

--
-- Indexes for table `rifles`
--
ALTER TABLE `rifles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rolls`
--
ALTER TABLE `rolls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_guns_idx` (`gun_id`),
  ADD KEY `fk_users_rifle1_idx` (`rifle_id`),
  ADD KEY `fk_users_teams1_idx` (`teams_id`),
  ADD KEY `fk_users_rolls1_idx` (`roll_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `guns`
--
ALTER TABLE `guns`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `rifles`
--
ALTER TABLE `rifles`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `rolls`
--
ALTER TABLE `rolls`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `fk_results_games1` FOREIGN KEY (`games_id`) REFERENCES `games` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_results_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_guns` FOREIGN KEY (`gun_id`) REFERENCES `guns` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_rifle1` FOREIGN KEY (`rifle_id`) REFERENCES `rifles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_rolls1` FOREIGN KEY (`roll_id`) REFERENCES `rolls` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_teams1` FOREIGN KEY (`teams_id`) REFERENCES `teams` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
