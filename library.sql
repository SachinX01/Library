-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2025 at 06:38 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `AdminEmail` varchar(120) DEFAULT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `FullName`, `AdminEmail`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin', 'f925916e2754e5e03f75dd58a5733251', '2024-12-01 18:11:42'),
(2, 'librarian', 'lib@gmail.com', 'librarian', 'f925916e2754e5e03f75dd58a5733251', '2024-12-01 18:11:42');

-- --------------------------------------------------------

--
-- Table structure for table `overdue`
--

CREATE TABLE `overdue` (
  `StudentID` varchar(11) NOT NULL,
  `StudentName` varchar(40) NOT NULL,
  `MobNumber` varchar(11) NOT NULL,
  `Fine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `overdue`
--

INSERT INTO `overdue` (`StudentID`, `StudentName`, `MobNumber`, `Fine`) VALUES
('SDV4', 'Tanmay Upadhayay', '2222222222', 630),
('SID010', 'Amit Patel', '8585856224', 630),
('SID012', 'Sakshi Gaikwad', '1234567890', 630);

-- --------------------------------------------------------

--
-- Table structure for table `tblauthors`
--

CREATE TABLE `tblauthors` (
  `id` int(11) NOT NULL,
  `AuthorName` varchar(159) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblauthors`
--

INSERT INTO `tblauthors` (`id`, `AuthorName`, `creationDate`, `UpdationDate`) VALUES
(2, 'Chetan Bhagatt', '2017-07-08 14:30:23', '2017-07-08 15:15:09'),
(3, 'Anita Desai', '2017-07-08 14:35:08', NULL),
(4, 'HC Verma', '2017-07-08 14:35:21', NULL),
(5, 'Vipul', '2024-12-16 04:45:16', NULL),
(6, 'Techmax', '2024-12-16 04:45:26', NULL),
(7, 'Techneo', '2024-12-16 04:45:38', NULL),
(8, 'Techknowledge ', '2024-12-16 04:45:57', '2024-12-16 04:46:44'),
(9, 'Sheth', '2024-12-16 04:48:43', NULL),
(10, 'Nirali', '2024-12-16 04:49:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblbooks`
--

CREATE TABLE `tblbooks` (
  `id` int(11) NOT NULL,
  `BookName` varchar(255) DEFAULT NULL,
  `Copies` int(3) NOT NULL,
  `IssuedCopies` int(3) NOT NULL,
  `CatId` int(11) DEFAULT NULL,
  `AuthorId` int(11) DEFAULT NULL,
  `ISBNNumber` int(11) DEFAULT NULL,
  `BookPrice` int(11) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblbooks`
--

INSERT INTO `tblbooks` (`id`, `BookName`, `Copies`, `IssuedCopies`, `CatId`, `AuthorId`, `ISBNNumber`, `BookPrice`, `RegDate`, `UpdationDate`) VALUES
(7, 'Chemistry', 10, 1, 6, 2, 123, NULL, '2024-12-01 20:14:43', '2024-12-16 05:16:09'),
(8, 'Physics', 10, 1, 8, 4, 789, NULL, '2024-12-01 20:16:14', '2024-12-16 05:43:46'),
(9, 'C Programming', 10, 0, 15, 7, 909, NULL, '2024-12-16 04:57:06', NULL),
(10, 'Maths', 10, 0, 6, 6, 456, NULL, '2024-12-16 05:00:24', NULL),
(11, 'Cloud Computing', 10, 0, 15, 8, 212, NULL, '2024-12-16 05:03:21', NULL),
(12, 'Data Science', 10, 1, 15, 7, 312, NULL, '2024-12-16 05:04:53', '2024-12-16 05:47:37'),
(13, 'Ethical Hacking', 10, 0, 15, 8, 521, NULL, '2024-12-16 05:07:39', '2024-12-16 05:29:32'),
(14, 'Customer Relationship Management ', 10, 1, 15, 7, 412, NULL, '2024-12-16 05:08:28', '2024-12-16 05:44:30'),
(15, 'Wireless and Sensor Network ', 10, 0, 15, 6, 776, NULL, '2024-12-16 05:11:41', NULL),
(16, 'Artificial Intelligence ', 10, 0, 15, 8, 812, NULL, '2024-12-16 05:12:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(150) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `Status`, `CreationDate`, `UpdationDate`) VALUES
(4, 'Knowledge', 1, '2017-07-04 18:35:25', '2018-06-07 18:55:37'),
(5, 'Technology', 1, '2017-07-04 18:35:39', '2017-07-08 17:13:03'),
(7, 'Management', 1, '2017-07-04 18:36:16', '2018-06-06 18:46:41'),
(8, 'Physics', 1, '2018-06-11 17:31:43', '2024-12-01 20:16:45'),
(9, 'History', 1, '2018-06-11 18:24:53', '2024-12-01 20:17:24'),
(14, 'LifeStyle', 1, '2018-07-13 05:17:16', '0000-00-00 00:00:00'),
(15, 'Computer Science', 1, '2024-12-16 04:31:31', '2025-01-02 16:49:35'),
(16, 'Information Technology ', 1, '2024-12-16 04:32:00', '0000-00-00 00:00:00'),
(17, 'Arts', 0, '2024-12-16 04:32:18', '2024-12-16 04:32:25');

-- --------------------------------------------------------

--
-- Table structure for table `tblfine`
--

CREATE TABLE `tblfine` (
  `fine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblfine`
--

INSERT INTO `tblfine` (`fine`) VALUES
(15);

-- --------------------------------------------------------

--
-- Table structure for table `tblissuedbookdetails`
--

CREATE TABLE `tblissuedbookdetails` (
  `id` int(11) NOT NULL,
  `BookId` int(11) DEFAULT NULL,
  `StudentID` varchar(150) DEFAULT NULL,
  `IssuesDate` timestamp NULL DEFAULT current_timestamp(),
  `ReturnDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `ReturnStatus` int(1) NOT NULL,
  `fine` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblissuedbookdetails`
--

INSERT INTO `tblissuedbookdetails` (`id`, `BookId`, `StudentID`, `IssuesDate`, `ReturnDate`, `ReturnStatus`, `fine`) VALUES
(17, 7, 'SID009', '2024-12-05 05:16:09', '2024-12-16 05:49:18', 1, 60),
(18, 13, 'SDV7', '2024-12-06 05:29:27', '2024-12-16 05:53:46', 1, NULL),
(19, 12, 'SDV7', '2024-12-05 05:29:40', '2024-12-16 05:49:04', 1, NULL),
(20, 8, 'SDV4', '2024-12-16 05:43:46', NULL, 0, NULL),
(21, 12, 'SID010', '2024-12-16 05:44:17', NULL, 0, NULL),
(22, 14, 'SID012', '2024-12-16 05:44:30', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblrequestedbookdetails`
--

CREATE TABLE `tblrequestedbookdetails` (
  `StudentID` varchar(20) NOT NULL,
  `StudName` varchar(40) NOT NULL,
  `BookName` varchar(50) NOT NULL,
  `CategoryName` varchar(20) NOT NULL,
  `AuthorName` varchar(50) NOT NULL,
  `ISBNNumber` int(11) NOT NULL,
  `BookPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblrequestedbookdetails`
--

INSERT INTO `tblrequestedbookdetails` (`StudentID`, `StudName`, `BookName`, `CategoryName`, `AuthorName`, `ISBNNumber`, `BookPrice`) VALUES
('SID009', 'test student ', 'Maths', 'Science', 'Techmax', 456, 0),
('SID009', 'test student ', 'Customer Relationship Management ', 'Computer Science', 'Techneo', 412, 0),
('SID010', 'Amit', 'Physics', 'Physics', 'HC Verma', 789, 0),
('SDV4', 'Test User', 'Artificial Intelligence ', 'Computer Science', 'Techknowledge ', 812, 0),
('SID012', 'sakshi g', 'Maths', 'Science', 'Techmax', 456, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblstudents`
--

CREATE TABLE `tblstudents` (
  `id` int(11) NOT NULL,
  `StudentId` varchar(100) DEFAULT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `Class` varchar(10) NOT NULL,
  `MobileNumber` char(11) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblstudents`
--

INSERT INTO `tblstudents` (`id`, `StudentId`, `FullName`, `EmailId`, `Class`, `MobileNumber`, `Password`, `Status`, `RegDate`, `UpdationDate`) VALUES
(1, 'SID002', 'Anuj kumar', 'ak@gmail.com', 'TYCS', '9865472555', 'f925916e2754e5e03f75dd58a5733251', 1, '2024-11-07 15:37:05', '2025-02-03 17:06:33'),
(4, 'SID005', 'Santosh Gupta', 'csfsd@dfsfks.com', 'TYCS', '8569710025', 'f925916e2754e5e03f75dd58a5733251', 1, '2024-11-09 15:41:27', '2025-02-03 17:06:38'),
(8, 'SID009', 'Prashant Gawai', 'pb@gmail.com', 'TYCS', '8329629259', 'f925916e2754e5e03f75dd58a5733251', 1, '2024-11-10 15:58:28', '2025-02-03 17:06:41'),
(9, 'SID010', 'Amit Patel', 'amit@gmail.com', 'TYCS', '8585856224', 'f925916e2754e5e03f75dd58a5733251', 1, '2024-11-12 13:40:30', '2025-02-03 17:06:44'),
(10, 'SID011', 'Sarita Pandey', 'sarita@gmail.com', 'TYCS', '4672423754', 'f925916e2754e5e03f75dd58a5733251', 1, '2024-11-10 18:00:59', '2025-02-03 17:06:46'),
(11, 'SID012', 'Sakshi Gaikwad', 'sakshi@gmail.com', 'TYCS', '1234567890', 'f925916e2754e5e03f75dd58a5733251', 1, '2024-11-10 17:55:21', '2025-02-03 17:06:50'),
(12, 'SDV2', 'Kamal Thakur', 'kt@gmail.com', 'TYCS', '0101010101', 'f925916e2754e5e03f75dd58a5733251', 0, '2024-12-01 19:11:56', '2025-02-03 17:06:53'),
(13, 'SDV3', 'Ashish Kumar Nishad', 'an@gmail.com', 'TYCS', '7738205133', 'f925916e2754e5e03f75dd58a5733251', 0, '2024-12-01 19:17:19', '2025-02-03 17:06:55'),
(14, 'SDV4', 'Tanmay Upadhayay', 'tu@gmail.com', 'TYCS', '2222222222', 'f925916e2754e5e03f75dd58a5733251', 1, '2024-12-01 19:26:56', '2025-02-03 17:07:01'),
(15, 'SDV5', 'Ravi Gupta', 'rg@gmail.com', 'TYCS', '9998772626', 'f925916e2754e5e03f75dd58a5733251', 1, '2024-12-01 19:56:19', '2025-02-03 17:07:04'),
(16, 'SDV6', 'Ramesh Kumar', 'rk@gmail.com', 'TYCS', '9025665458', 'f925916e2754e5e03f75dd58a5733251', 1, '2024-12-16 05:17:50', '2025-02-03 17:07:07'),
(17, 'SDV7', 'Deepu Panday ', 'dp@gmail.com', 'TYCS', '8052455675', 'f925916e2754e5e03f75dd58a5733251', 1, '2024-12-16 05:20:14', '2025-02-03 17:07:09'),
(18, 'SDV8', 'Chintu Kalash Gaikwad', 'ch@gmail.com', 'FYCS', '7785458541', 'f925916e2754e5e03f75dd58a5733251', 0, '2025-02-03 17:09:09', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblauthors`
--
ALTER TABLE `tblauthors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbooks`
--
ALTER TABLE `tblbooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblissuedbookdetails`
--
ALTER TABLE `tblissuedbookdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblstudents`
--
ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `StudentId` (`StudentId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblauthors`
--
ALTER TABLE `tblauthors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblbooks`
--
ALTER TABLE `tblbooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblissuedbookdetails`
--
ALTER TABLE `tblissuedbookdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tblstudents`
--
ALTER TABLE `tblstudents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
