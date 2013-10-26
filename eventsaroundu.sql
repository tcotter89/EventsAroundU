-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 21, 2013 at 12:02 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `eventsaroundu`
--
CREATE DATABASE IF NOT EXISTS `eventsaroundu` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `eventsaroundu`;

-- --------------------------------------------------------

--
-- Table structure for table `marker`
--

CREATE TABLE IF NOT EXISTS `marker` (
  `title` char(100) NOT NULL,
  `description` char(255) DEFAULT NULL,
  `time` datetime NOT NULL,
  `creat_user` char(100) NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `event_type` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_name` char(10) NOT NULL,
  `user_password` char(20) NOT NULL,
  `user_username` char(20) NOT NULL,
  `user_email` char(30) DEFAULT NULL,
  `user_gender` binary(1) DEFAULT NULL,
  `user_phone` char(20) DEFAULT NULL,
  `user_address` char(50) DEFAULT NULL,
  `user_picture` char(100) DEFAULT NULL,
  `user_register_time` datetime NOT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
