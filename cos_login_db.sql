-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 05, 2018 at 12:32 PM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cos_login_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
CREATE TABLE IF NOT EXISTS `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `msg` text NOT NULL,
  `user_id` int(5) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `username`, `msg`, `user_id`, `date_created`) VALUES
(1, 'admin', 'hello evry 1', NULL, '2018-06-04 14:05:57'),
(2, 'test1', 'hi', NULL, '2018-06-04 14:06:07'),
(3, 'admin', 'hello', NULL, '2018-06-04 14:07:42'),
(4, 'test1', 'hiyers', NULL, '2018-06-04 14:07:48'),
(5, 'test2', 'hyerss', NULL, '2018-06-04 14:08:53'),
(6, 'admin', 'ohhh', NULL, '2018-06-04 14:09:03'),
(7, 'test1', 'yes', NULL, '2018-06-04 14:09:11'),
(8, 'admin', 'yeah', NULL, '2018-06-04 14:09:17'),
(9, 'test2', 'hello', NULL, '2018-06-04 14:09:26'),
(10, 'test2', ':)', NULL, '2018-06-04 14:09:46'),
(11, 'test1', 'yo!', NULL, '2018-06-04 14:16:51'),
(12, 'test1', 'hallo', NULL, '2018-06-04 14:17:33'),
(13, 'test1', ':)', NULL, '2018-06-04 14:18:13'),
(14, 'test1', ':)', NULL, '2018-06-04 14:18:20'),
(15, 'admin', 'http://localhost/cos_login/admin/chat', NULL, '2018-06-04 14:18:33'),
(16, 'test1', 'hallo', NULL, '2018-06-04 14:25:27'),
(17, 'test1', 'http://youtube.com', NULL, '2018-06-04 14:25:45'),
(18, 'admin', 'heelo', NULL, '2018-06-04 14:34:37'),
(19, 'test2', 'hi', NULL, '2018-06-04 16:16:16'),
(20, 'test2', 'heee', NULL, '2018-06-04 16:17:37'),
(21, 'test2', 'hi', NULL, '2018-06-04 16:19:51'),
(22, 'admin', 'asd', 2, '2018-06-04 16:25:10'),
(23, 'test1', 'hello', 1, '2018-06-04 16:35:29');

-- --------------------------------------------------------

--
-- Table structure for table `leave_tbl`
--

DROP TABLE IF EXISTS `leave_tbl`;
CREATE TABLE IF NOT EXISTS `leave_tbl` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reason` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leave_tbl`
--

INSERT INTO `leave_tbl` (`id`, `user_id`, `date_from`, `date_to`, `status`, `date_created`, `reason`) VALUES
(1, 2, '2018-06-04', '2018-06-06', 'approved', '2018-06-01 13:58:18', 'test'),
(2, 2, '2018-06-04', '2018-06-06', 'pending', '2018-06-01 14:50:25', 'test2'),
(3, 3, '2018-06-04', '2018-06-06', 'approved', '2018-06-01 14:51:09', 'test1');

-- --------------------------------------------------------

--
-- Table structure for table `task_tbl`
--

DROP TABLE IF EXISTS `task_tbl`;
CREATE TABLE IF NOT EXISTS `task_tbl` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(2) NOT NULL,
  `task` text NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) NOT NULL DEFAULT 'ongoing',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `task_tbl`
--

INSERT INTO `task_tbl` (`id`, `user_id`, `task`, `date_created`, `status`) VALUES
(1, 3, 'task test', '2018-05-31 13:32:26', 'ongoing'),
(2, 2, '-test task1\r\n-test task2', '2018-05-31 13:33:38', 'ongoing'),
(3, 3, 'task3', '2018-05-31 14:28:10', 'ongoing'),
(4, 2, 'task again', '2018-05-31 14:31:30', 'done'),
(5, 3, 'task\r\ntask\r\ntask\r\n', '2018-05-31 14:31:47', 'ongoing'),
(6, 3, 'a', '2018-05-31 14:32:50', 'done'),
(7, 2, 'taskking dem', '2018-05-31 14:33:35', 'done'),
(8, 3, 'task ni', '2018-05-31 14:34:57', 'done'),
(9, 3, 'task nsud\r\n', '2018-05-31 14:43:06', 'ongoing'),
(10, 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2018-05-31 16:53:35', 'done');

-- --------------------------------------------------------

--
-- Table structure for table `timesheets_tbl`
--

DROP TABLE IF EXISTS `timesheets_tbl`;
CREATE TABLE IF NOT EXISTS `timesheets_tbl` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(2) NOT NULL,
  `time_in` time DEFAULT NULL,
  `time_out` time DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timesheets_tbl`
--

INSERT INTO `timesheets_tbl` (`id`, `user_id`, `time_in`, `time_out`, `note`, `date`) VALUES
(1, 2, '21:18:00', '21:18:27', NULL, '2018-05-30 13:18:00'),
(2, 3, '21:18:07', '21:18:11', NULL, '2018-05-30 13:18:07'),
(3, 3, '21:18:40', '21:22:48', NULL, '2018-05-30 13:18:40'),
(4, 2, '22:35:54', '22:47:49', NULL, '2018-05-30 14:35:54'),
(5, 2, '01:09:34', '01:10:12', NULL, '2018-05-30 17:09:34'),
(8, 2, '19:56:16', '19:57:24', NULL, '2018-06-01 11:56:16'),
(9, 2, '19:57:34', NULL, NULL, '2018-06-01 11:57:34'),
(10, 3, '22:50:50', '00:08:21', NULL, '2018-06-01 14:50:50');

-- --------------------------------------------------------

--
-- Table structure for table `user_tbl`
--

DROP TABLE IF EXISTS `user_tbl`;
CREATE TABLE IF NOT EXISTS `user_tbl` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `utype` int(2) NOT NULL COMMENT '1-admin, 2-staff',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_status` varchar(20) NOT NULL DEFAULT 'active',
  `is_timein` varchar(10) NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_tbl`
--

INSERT INTO `user_tbl` (`id`, `uname`, `password`, `fname`, `lname`, `utype`, `date_created`, `user_status`, `is_timein`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'admin', 'admin', 1, '2018-05-29 13:01:46', 'active', 'no'),
(2, 'test1', '5f4dcc3b5aa765d61d8327deb882cf99', 'test1', 'test1', 2, '2018-05-29 14:32:33', 'active', 'yes'),
(3, 'test2', '5f4dcc3b5aa765d61d8327deb882cf99', 'test2', 'test2', 2, '2018-05-29 14:33:28', 'active', 'no');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
