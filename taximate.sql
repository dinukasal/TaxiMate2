/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : taximate

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-01-19 11:59:57
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `badges`
-- ----------------------------
DROP TABLE IF EXISTS `badges`;
CREATE TABLE `badges` (
  `VerifiedDriver` tinyint(1) DEFAULT NULL,
  `HotDriver` varchar(45) DEFAULT NULL,
  `Driver_id` int(11) NOT NULL,
  PRIMARY KEY (`Driver_id`),
  CONSTRAINT `fk_Badges_Driver1` FOREIGN KEY (`Driver_id`) REFERENCES `driver` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of badges
-- ----------------------------

-- ----------------------------
-- Table structure for `driver`
-- ----------------------------
DROP TABLE IF EXISTS `driver`;
CREATE TABLE `driver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `nic` varchar(10) DEFAULT NULL,
  `availability` int(45) NOT NULL,
  `contactNo` varchar(45) NOT NULL,
  `password` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of driver
-- ----------------------------
INSERT INTO `driver` VALUES ('1', 'Nimal', 'Perera', 'nimal@gmail.com', null, '1', '1234567890', '1234');
INSERT INTO `driver` VALUES ('2', 'Sunil', 'Nanayakkara', 'sunil@gmail.com', null, '1', '123456789', '1234');
INSERT INTO `driver` VALUES ('3', '123', '', 'wasantha@gmail.com', null, '1', '123', '1234');

-- ----------------------------
-- Table structure for `driverprofile`
-- ----------------------------
DROP TABLE IF EXISTS `driverprofile`;
CREATE TABLE `driverprofile` (
  `Driver_id` int(11) NOT NULL,
  `vehicleType` varchar(45) NOT NULL,
  `vehicleModel` varchar(45) DEFAULT NULL,
  `discription` varchar(45) NOT NULL,
  `rating` float DEFAULT NULL,
  `registeredDate` date NOT NULL,
  PRIMARY KEY (`Driver_id`),
  CONSTRAINT `fk_driverProfile_Driver` FOREIGN KEY (`Driver_id`) REFERENCES `driver` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of driverprofile
-- ----------------------------
INSERT INTO `driverprofile` VALUES ('1', 'Car', 'Corolla', 'Iam a good driver', null, '2016-01-18');
INSERT INTO `driverprofile` VALUES ('2', 'Tuk Tuk', '4stroke', 'I am a friendly tuk tuk friver', null, '2016-01-18');

-- ----------------------------
-- Table structure for `fare`
-- ----------------------------
DROP TABLE IF EXISTS `fare`;
CREATE TABLE `fare` (
  `Driver_id` int(11) NOT NULL,
  `dayTimeFare` float NOT NULL,
  `nightTimeFare` float NOT NULL,
  `specialFare` float DEFAULT NULL,
  PRIMARY KEY (`Driver_id`),
  CONSTRAINT `fk_fare_Driver1` FOREIGN KEY (`Driver_id`) REFERENCES `driver` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fare
-- ----------------------------
INSERT INTO `fare` VALUES ('1', '100', '150', null);
INSERT INTO `fare` VALUES ('2', '40', '50', null);

-- ----------------------------
-- Table structure for `favoritedrivers`
-- ----------------------------
DROP TABLE IF EXISTS `favoritedrivers`;
CREATE TABLE `favoritedrivers` (
  `Customer_id` varchar(45) NOT NULL,
  `Driver_id` int(11) NOT NULL,
  PRIMARY KEY (`Customer_id`,`Driver_id`),
  KEY `fk_FavoriteDrivers_Driver1_idx` (`Driver_id`),
  CONSTRAINT `fk_FavoriteDrivers_Customer1` FOREIGN KEY (`Customer_id`) REFERENCES `passenger` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_FavoriteDrivers_Driver1` FOREIGN KEY (`Driver_id`) REFERENCES `driver` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of favoritedrivers
-- ----------------------------
INSERT INTO `favoritedrivers` VALUES ('1', '1');

-- ----------------------------
-- Table structure for `hire`
-- ----------------------------
DROP TABLE IF EXISTS `hire`;
CREATE TABLE `hire` (
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
  KEY `fk_Hire_Customer1_idx` (`Customer_id`),
  CONSTRAINT `fk_Hire_Customer1` FOREIGN KEY (`Customer_id`) REFERENCES `passenger` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hire_Driver1` FOREIGN KEY (`Driver_id`) REFERENCES `driver` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hire
-- ----------------------------

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2014_10_12_100000_create_password_resets_table', '1');

-- ----------------------------
-- Table structure for `passenger`
-- ----------------------------
DROP TABLE IF EXISTS `passenger`;
CREATE TABLE `passenger` (
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

-- ----------------------------
-- Records of passenger
-- ----------------------------
INSERT INTO `passenger` VALUES ('1', 'Sunil', 'Perera', '1234567', null, '0000-00-00', '1234');
INSERT INTO `passenger` VALUES ('2', 'Nimal', 'Shantha', '12345678', null, '0000-00-00', '1234');
INSERT INTO `passenger` VALUES ('3', 'Asela', 'Pieris', '123456789', null, '0000-00-00', '1234');
INSERT INTO `passenger` VALUES ('4', 'Mega', 'Kularatne', '345629390', null, '0000-00-00', '1234');
INSERT INTO `passenger` VALUES ('5', 'Dinesh', 'Senvairatne', '123', null, '0000-00-00', '1234');

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'dinuka', 'dinukasal@gmail.com', '1234', null, '2016-01-18 07:20:50', '2016-01-18 07:20:50');
