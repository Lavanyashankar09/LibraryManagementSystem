-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2020 at 09:25 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `librarynew`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAccount` ()  SELECT * FROM Account$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `Username` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Password` int(50) NOT NULL,
  `Sec_Q` varchar(50) NOT NULL,
  `Answer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`Username`, `Name`, `Password`, `Sec_Q`, `Answer`) VALUES
('jennifer', 'jenny', 12345, 'What is your mother toungue?', 'english'),
('lavanya', 'lava', 12345, 'What is your favorite colour?', 'pink'),
('sushma', 'S Sushma', 123, 'What is your favorite colour?', 'orange');

--
-- Triggers `account`
--
DELIMITER $$
CREATE TRIGGER `insertLog` AFTER INSERT ON `account` FOR EACH ROW INSERT INTO logs VALUES(new.Username,new.Name,'Inserted',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `Book_ID` int(10) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Edition` int(10) NOT NULL,
  `Publisher` varchar(30) NOT NULL,
  `Price` int(30) NOT NULL,
  `Pages` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`Book_ID`, `Name`, `Edition`, `Publisher`, `Price`, `Pages`) VALUES
(112, 'java', 7, 'McGraw Hill', 780, 800),
(174, 'automata', 3, 'sapna', 599, 300),
(361, 'dbms', 4, 'pearson', 699, 1200),
(569, 'Computer Networks', 1, 'Pearson', 600, 1200),
(636, 'physics', 1, 'pearson', 1234, 679),
(663, 'unix', 4, 'sapna', 299, 300),
(897, 'chemistry', 3, 'peorson', 1289, 234);

-- --------------------------------------------------------

--
-- Table structure for table `issue`
--

CREATE TABLE `issue` (
  `Book_ID` int(30) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Edition` int(30) NOT NULL,
  `Student_ID` int(30) NOT NULL,
  `SName` varchar(30) NOT NULL,
  `FName` varchar(30) NOT NULL,
  `Course` varchar(30) NOT NULL,
  `DateOfIssue` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issue`
--

INSERT INTO `issue` (`Book_ID`, `Name`, `Edition`, `Student_ID`, `SName`, `FName`, `Course`, `DateOfIssue`) VALUES
(361, 'dbms', 4, 806, 'lavanya', 'shankar', 'B Tech', 'Nov 30, 2018'),
(569, 'Computer Networks', 1, 806, 'lavanya', 'shankar', 'B Tech', 'Nov 28, 2018');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `Username` varchar(30) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Action` varchar(30) NOT NULL,
  `cdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`Username`, `Name`, `Action`, `cdate`) VALUES
('jennifer', 'jenny', 'Inserted', '2018-12-10 14:47:38'),
('sushma', 'S Sushma', 'Inserted', '2018-11-28 16:52:10');

-- --------------------------------------------------------

--
-- Table structure for table `returnb`
--

CREATE TABLE `returnb` (
  `Student_ID` int(30) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Book_ID` int(30) NOT NULL,
  `BName` varchar(30) NOT NULL,
  `DOI` varchar(30) NOT NULL,
  `DOR` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `returnb`
--

INSERT INTO `returnb` (`Student_ID`, `Name`, `Book_ID`, `BName`, `DOI`, `DOR`) VALUES
(335, 'sushma', 112, 'java', 'Nov 28, 2018', 'Nov 29, 2018'),
(286, 'jennifer', 663, 'unix', 'Dec 9, 2018', 'Dec 13, 2018'),
(375, 'jenny', 636, 'physics', 'Dec 12, 2018', 'Dec 13, 2018'),
(375, 'jenny', 112, 'java', 'Dec 14, 2018', 'Dec 21, 2018');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Student_ID` int(30) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Father` varchar(30) NOT NULL,
  `Course` varchar(30) NOT NULL,
  `Branch` varchar(30) NOT NULL,
  `Year` int(30) NOT NULL,
  `Semester` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Student_ID`, `Name`, `Father`, `Course`, `Branch`, `Year`, `Semester`) VALUES
(286, 'jennifer', 'robin', 'B Tech', 'CS', 2, 4),
(335, 'sushma', 'shankar', 'B Tech', 'IS', 1, 1),
(375, 'jenny', 'joy', 'B Tech', 'civil', 3, 6),
(509, 'raja', 'michel', 'B Tech', 'cs', 3, 5),
(806, 'lavanya', 'shankar', 'B Tech', 'CS', 3, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Username`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`Book_ID`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`Username`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Student_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
