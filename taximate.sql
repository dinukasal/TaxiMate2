-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 18, 2016 at 08:13 PM
-- Server version: 5.5.46-0ubuntu0.14.04.2
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `taximate`
--

-- --------------------------------------------------------

--
-- Table structure for table `badges`
--

CREATE TABLE IF NOT EXISTS `badges` (
  `VerifiedDriver` tinyint(1) DEFAULT NULL,
  `HotDriver` varchar(45) DEFAULT NULL,
  `Driver_id` int(11) NOT NULL,
  PRIMARY KEY (`Driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `id` varchar(45) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `contactNo` varchar(20) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `date` date NOT NULL,
  `password` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contactNo` (`contactNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `firstName`, `lastName`, `contactNo`, `email`, `date`, `password`) VALUES
('1', 'Sunil', 'Perera', '1234567', NULL, '0000-00-00', '1234'),
('2', 'Nimal', 'Shantha', '12345678', NULL, '0000-00-00', '1234'),
('3', 'Asela', 'Pieris', '123456789', NULL, '0000-00-00', '1234'),
('4', 'Mega', 'Kularatne', '345629390', NULL, '0000-00-00', '1234'),
('5', 'Dinesh', 'Senvairatne', '123', NULL, '0000-00-00', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE IF NOT EXISTS `driver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `availability` int(45) NOT NULL,
  `contactNo` varchar(45) NOT NULL,
  `password` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`id`, `firstName`, `lastName`, `email`, `availability`, `contactNo`, `password`) VALUES
(1, 'Nimal', 'Perera', 'nimal@gmail.com', 1, '1234567890', '1234'),
(2, 'Sunil', 'Nanayakkara', 'sunil@gmail.com', 1, '123456789', '1234'),
(3, 'Wasantha', 'Perera', 'wasantha@gmail.com', 1, '123', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `driverprofile`
--

CREATE TABLE IF NOT EXISTS `driverprofile` (
  `Driver_id` int(11) NOT NULL,
  `vehicleType` varchar(45) NOT NULL,
  `vehicleModel` varchar(45) DEFAULT NULL,
  `discription` varchar(45) NOT NULL,
  `rating` float DEFAULT NULL,
  `registeredDate` date NOT NULL,
  PRIMARY KEY (`Driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `driverprofile`
--

INSERT INTO `driverprofile` (`Driver_id`, `vehicleType`, `vehicleModel`, `discription`, `rating`, `registeredDate`) VALUES
(1, 'Car', 'Corolla', 'Iam a good driver', NULL, '2016-01-18'),
(2, 'Tuk Tuk', '4stroke', 'I am a friendly tuk tuk friver', NULL, '2016-01-18');

-- --------------------------------------------------------

--
-- Table structure for table `fare`
--

CREATE TABLE IF NOT EXISTS `fare` (
  `Driver_id` int(11) NOT NULL,
  `dayTimeFare` float NOT NULL,
  `nightTimeFare` float NOT NULL,
  `specialFare` float DEFAULT NULL,
  PRIMARY KEY (`Driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fare`
--

INSERT INTO `fare` (`Driver_id`, `dayTimeFare`, `nightTimeFare`, `specialFare`) VALUES
(1, 100, 150, NULL),
(2, 40, 50, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `favoritedrivers`
--

CREATE TABLE IF NOT EXISTS `favoritedrivers` (
  `Customer_id` varchar(45) NOT NULL,
  `Driver_id` int(11) NOT NULL,
  PRIMARY KEY (`Customer_id`,`Driver_id`),
  KEY `fk_FavoriteDrivers_Driver1_idx` (`Driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `favoritedrivers`
--

INSERT INTO `favoritedrivers` (`Customer_id`, `Driver_id`) VALUES
('1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hire`
--

CREATE TABLE IF NOT EXISTS `hire` (
  `date` date NOT NULL,
  `time` varchar(45) NOT NULL,
  `distance` float NOT NULL,
  `customerNo` varchar(45) NOT NULL,
  `startLat` varchar(45) NOT NULL,
  `startLong` varchar(45) NOT NULL,
  `endLat` varchar(45) NOT NULL,
  `endLong` varchar(45) NOT NULL,
  `Driver_id` int(11) NOT NULL,
  `Customer_id` varchar(45) NOT NULL,
  PRIMARY KEY (`Driver_id`,`Customer_id`),
  KEY `fk_Hire_Customer1_idx` (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'dinuka', 'dinukasal@gmail.com', '1234', NULL, '2016-01-18 01:50:50', '2016-01-18 01:50:50');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `badges`
--
ALTER TABLE `badges`
  ADD CONSTRAINT `fk_Badges_Driver1` FOREIGN KEY (`Driver_id`) REFERENCES `driver` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `driverprofile`
--
ALTER TABLE `driverprofile`
  ADD CONSTRAINT `fk_driverProfile_Driver` FOREIGN KEY (`Driver_id`) REFERENCES `driver` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fare`
--
ALTER TABLE `fare`
  ADD CONSTRAINT `fk_fare_Driver1` FOREIGN KEY (`Driver_id`) REFERENCES `driver` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `favoritedrivers`
--
ALTER TABLE `favoritedrivers`
  ADD CONSTRAINT `fk_FavoriteDrivers_Customer1` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_FavoriteDrivers_Driver1` FOREIGN KEY (`Driver_id`) REFERENCES `driver` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hire`
--
ALTER TABLE `hire`
  ADD CONSTRAINT `fk_Hire_Customer1` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Hire_Driver1` FOREIGN KEY (`Driver_id`) REFERENCES `driver` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
