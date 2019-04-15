-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 13, 2019 at 07:00 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tinaye`
--

DELIMITER $$
--
-- Functions
--
DROP FUNCTION IF EXISTS `autoInc`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `autoInc` () RETURNS INT(10) BEGIN
        DECLARE getCount INT(10);

        SET getCount = (
            SELECT COUNT(id)
            FROM staff) + 1;

        RETURN getCount;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(255) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_password`) VALUES
(1, 'a', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customerid` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`customerid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerid`, `name`, `email`, `password`) VALUES
(1, 'Wednesday', 'odin@gungnir.war', 'valhala'),
(11, 'Rugby', 'ruby@yahoo.com', 'rugby'),
(10, 'Eyasu', 'eyasu@tkp.org', 'eyasu'),
(9, 'a', 'a@a.a', 'a'),
(8, 'Shadow', 'shadow@moon.og', 'moon'),
(12, 'Savor', 's@t.o', 'time'),
(13, 'Tinaye', 'tinayetsina@yahoo.com', 'hamufari123'),
(14, 'giddy', 'asaregideon015@gmail.com', '607461');

-- --------------------------------------------------------

--
-- Table structure for table `generatorval`
--

DROP TABLE IF EXISTS `generatorval`;
CREATE TABLE IF NOT EXISTS `generatorval` (
  `staffid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`staffid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `id` int(10) DEFAULT NULL,
  `staffid` varchar(7) NOT NULL DEFAULT '0',
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`staffid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `staff`
--
DROP TRIGGER IF EXISTS `tg_staff_insert`;
DELIMITER $$
CREATE TRIGGER `tg_staff_insert` BEFORE INSERT ON `staff` FOR EACH ROW BEGIN
  INSERT INTO generatorval VALUES (NULL);
  SET NEW.staffid = CONCAT('SFCG', LPAD(LAST_INSERT_ID(), 3, '0'));
  
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE IF NOT EXISTS `transaction` (
  `trans_id` int(255) NOT NULL AUTO_INCREMENT,
  `source` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `leave_date` varchar(255) NOT NULL,
  `leave_time` varchar(255) NOT NULL,
  PRIMARY KEY (`trans_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`trans_id`, `source`, `destination`, `class`, `leave_date`, `leave_time`) VALUES
(1, 'Nanjing', 'Beijing', 'Economy', '18/04/2019', '5:30 AM'),
(2, 'Nanjing', 'Shanghai', 'Business', '18/04/2019', '3:30 AM'),
(3, 'Sichuan', 'Nanjing', 'Economy', '24/04/2019', '10:50 AM'),
(4, 'Shenzhen', 'Guangzhou', 'Prestige', '11/04/2019', '10:57 PM'),
(5, 'Nanjing', 'Shanghai', 'Business', '16/04/2019', '1:05 AM'),
(6, 'Nanjing', 'Shanghai', 'Business', '17/04/2019', '2:15 PM'),
(7, 'Nanjing', 'Guangzhou', 'Prestige', '15/04/2019', '3:21 AM'),
(8, 'Sichuan', 'Nanjing', 'Economy', '23/04/2019', '12:49 AM');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
