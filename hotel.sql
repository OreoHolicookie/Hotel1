-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2023 at 09:57 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(10) UNSIGNED NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `phoneno` int(10) DEFAULT NULL,
  `email` text DEFAULT NULL,
  `cdate` date DEFAULT NULL,
  `approval` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `fullname`, `phoneno`, `email`, `cdate`, `approval`) VALUES
(2, 'Christine joy', 2147483647, 'christinejoy@gmail.com', '2023-12-11', 'Allowed');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(10) UNSIGNED NOT NULL,
  `usname` varchar(30) DEFAULT NULL,
  `pass` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `usname`, `pass`) VALUES
(1, 'Admin', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `newsletterlog`
--

CREATE TABLE `newsletterlog` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(52) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `news` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `newsletterlog`
--

INSERT INTO `newsletterlog` (`id`, `title`, `subject`, `news`) VALUES
(1, 'Hello', 'Hellow', 'duhdwsdw'),
(2, 'cvfv', 'vffvfd', 'fdvgv');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) DEFAULT NULL,
  `title` varchar(5) DEFAULT NULL,
  `fname` varchar(30) DEFAULT NULL,
  `lname` varchar(30) DEFAULT NULL,
  `troom` varchar(30) DEFAULT NULL,
  `tbed` varchar(30) DEFAULT NULL,
  `nroom` int(11) DEFAULT NULL,
  `cin` date DEFAULT NULL,
  `cout` date DEFAULT NULL,
  `ttot` double(8,2) DEFAULT NULL,
  `fintot` double(8,2) DEFAULT NULL,
  `mepr` double(8,2) DEFAULT NULL,
  `meal` varchar(30) DEFAULT NULL,
  `btot` double(8,2) DEFAULT NULL,
  `noofdays` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `title`, `fname`, `lname`, `troom`, `tbed`, `nroom`, `cin`, `cout`, `ttot`, `fintot`, `mepr`, `meal`, `btot`, `noofdays`) VALUES
(3, 'Dr.', 'Josd', 'Rz', 'Guest House', 'Triple', 1, '2023-12-10', '2023-12-11', 180.00, 185.40, 0.00, 'Room only', 5.40, 1),
(4, 'Miss.', 'Abi', 'Gail', 'Deluxe Room', 'Single', 1, '2023-12-11', '2023-12-13', 440.00, 457.60, 13.20, 'Half Board', 4.40, 2),
(5, 'Mr.', 'Roa', 'Wath', 'Deluxe Room', 'Single', 1, '2023-12-11', '2023-12-14', 660.00, 679.80, 13.20, 'Breakfast', 6.60, 3);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(15) DEFAULT NULL,
  `bedding` varchar(10) DEFAULT NULL,
  `place` varchar(10) DEFAULT NULL,
  `cusid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `type`, `bedding`, `place`, `cusid`) VALUES
(1, 'Superior Room', 'Single', 'Free', NULL),
(2, 'Superior Room', 'Double', 'Free', NULL),
(3, 'Superior Room', 'Triple', 'Free', NULL),
(4, 'Single Room', 'Quad', 'Free', NULL),
(5, 'Superior Room', 'Quad', 'Free', NULL),
(6, 'Deluxe Room', 'Single', 'NotFree', 5),
(7, 'Deluxe Room', 'Double', 'Free', NULL),
(8, 'Deluxe Room', 'Triple', 'Free', NULL),
(9, 'Deluxe Room', 'Quad', 'Free', NULL),
(10, 'Guest House', 'Single', 'Free', NULL),
(11, 'Guest House', 'Double', 'Free', NULL),
(12, 'Guest House', 'Quad', 'Free', NULL),
(13, 'Single Room', 'Single', 'Free', NULL),
(14, 'Single Room', 'Double', 'Free', NULL),
(15, 'Single Room', 'Triple', 'Free', NULL);

--
-- Triggers `room`
--
DELIMITER $$
CREATE TRIGGER `room_update_log` AFTER UPDATE ON `room` FOR EACH ROW BEGIN
  INSERT INTO room_audit_log (
    room_id,
    type_before,
    bedding_before,
    place_before,
    cusid_before,
    type_after,
    bedding_after,
    place_after,
    cusid_after,
    updated_at
  ) VALUES (
    OLD.id,
    OLD.type,
    OLD.bedding,
    OLD.place,
    OLD.cusid,
    NEW.type,
    NEW.bedding,
    NEW.place,
    NEW.cusid,
    NOW()
  );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `roombook`
--

CREATE TABLE `roombook` (
  `id` int(10) UNSIGNED NOT NULL,
  `Title` varchar(5) DEFAULT NULL,
  `FName` text DEFAULT NULL,
  `LName` text DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `National` varchar(30) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Phone` text DEFAULT NULL,
  `TRoom` varchar(20) DEFAULT NULL,
  `Bed` varchar(10) DEFAULT NULL,
  `NRoom` varchar(2) DEFAULT NULL,
  `Meal` varchar(15) DEFAULT NULL,
  `cin` date DEFAULT NULL,
  `cout` date DEFAULT NULL,
  `stat` varchar(15) DEFAULT NULL,
  `nodays` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `roombook`
--

INSERT INTO `roombook` (`id`, `Title`, `FName`, `LName`, `Email`, `National`, `Country`, `Phone`, `TRoom`, `Bed`, `NRoom`, `Meal`, `cin`, `cout`, `stat`, `nodays`) VALUES
(4, 'Miss.', 'Abi', 'Gail', 'abigail@gmail.com', 'Filipino', 'Philippines', '+639127370151', 'Deluxe Room', 'Single', '1', 'Half Board', '2023-12-11', '2023-12-13', 'Confirm', 2),
(5, 'Mr.', 'Roa', 'Wath', 'roa@gmail.com', 'International ', 'United States', '921839893824', 'Deluxe Room', 'Single', '1', 'Breakfast', '2023-12-11', '2023-12-14', 'Confirm', 3),
(6, 'Miss.', 'Mike', 'Smith', 'user@gmail.com', 'International ', 'United States', '+12345656673', 'Guest House', 'Single', '1', 'Full Board', '2023-12-11', '2023-12-12', 'Confirm', 1),
(8, 'Miss.', 'Anne', 'Ge', 'annie@gmail.com', 'International ', 'Mauritius', '+63912345678', 'Guest House', 'Double', '1', 'Breakfast', '2023-12-11', '2023-12-12', 'Confirm', 1),
(9, 'Miss.', 'Rona', 'Rodriquez', 'rona@gmail.com', 'Filipino', 'Philippines', '+63912345678', 'Guest House', 'Triple', '1', 'Full Board', '2023-12-12', '2023-12-13', 'Confirm', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `roombookview_4`
-- (See below for the actual view)
--
CREATE TABLE `roombookview_4` (
`id` int(10) unsigned
,`Title` varchar(5)
,`FName` text
,`LName` text
,`Email` varchar(50)
,`National` varchar(30)
,`Country` varchar(30)
,`Phone` text
,`TRoom` varchar(20)
,`Bed` varchar(10)
,`NRoom` varchar(2)
,`Meal` varchar(15)
,`cin` date
,`cout` date
,`stat` varchar(15)
,`nodays` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `roombookview_5`
-- (See below for the actual view)
--
CREATE TABLE `roombookview_5` (
`id` int(10) unsigned
,`Title` varchar(5)
,`FName` text
,`LName` text
,`Email` varchar(50)
,`National` varchar(30)
,`Country` varchar(30)
,`Phone` text
,`TRoom` varchar(20)
,`Bed` varchar(10)
,`NRoom` varchar(2)
,`Meal` varchar(15)
,`cin` date
,`cout` date
,`stat` varchar(15)
,`nodays` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_available_rooms`
-- (See below for the actual view)
--
CREATE TABLE `vw_available_rooms` (
`room_id` int(10) unsigned
,`room_type` varchar(15)
,`bedding` varchar(10)
,`place` varchar(10)
,`checkin_date` date
,`checkout_date` date
);

-- --------------------------------------------------------

--
-- Structure for view `roombookview_4`
--
DROP TABLE IF EXISTS `roombookview_4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `roombookview_4`  AS SELECT `roombook`.`id` AS `id`, `roombook`.`Title` AS `Title`, `roombook`.`FName` AS `FName`, `roombook`.`LName` AS `LName`, `roombook`.`Email` AS `Email`, `roombook`.`National` AS `National`, `roombook`.`Country` AS `Country`, `roombook`.`Phone` AS `Phone`, `roombook`.`TRoom` AS `TRoom`, `roombook`.`Bed` AS `Bed`, `roombook`.`NRoom` AS `NRoom`, `roombook`.`Meal` AS `Meal`, `roombook`.`cin` AS `cin`, `roombook`.`cout` AS `cout`, `roombook`.`stat` AS `stat`, `roombook`.`nodays` AS `nodays` FROM `roombook` WHERE `roombook`.`id` = 4 ;

-- --------------------------------------------------------

--
-- Structure for view `roombookview_5`
--
DROP TABLE IF EXISTS `roombookview_5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `roombookview_5`  AS SELECT `roombook`.`id` AS `id`, `roombook`.`Title` AS `Title`, `roombook`.`FName` AS `FName`, `roombook`.`LName` AS `LName`, `roombook`.`Email` AS `Email`, `roombook`.`National` AS `National`, `roombook`.`Country` AS `Country`, `roombook`.`Phone` AS `Phone`, `roombook`.`TRoom` AS `TRoom`, `roombook`.`Bed` AS `Bed`, `roombook`.`NRoom` AS `NRoom`, `roombook`.`Meal` AS `Meal`, `roombook`.`cin` AS `cin`, `roombook`.`cout` AS `cout`, `roombook`.`stat` AS `stat`, `roombook`.`nodays` AS `nodays` FROM `roombook` WHERE `roombook`.`id` = 5 ;

-- --------------------------------------------------------

--
-- Structure for view `vw_available_rooms`
--
DROP TABLE IF EXISTS `vw_available_rooms`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_available_rooms`  AS SELECT `r`.`id` AS `room_id`, `r`.`type` AS `room_type`, `r`.`bedding` AS `bedding`, `r`.`place` AS `place`, `rb`.`cin` AS `checkin_date`, `rb`.`cout` AS `checkout_date` FROM (`room` `r` left join `roombook` `rb` on(`r`.`id` = `rb`.`TRoom` and `rb`.`stat` = 'Booked')) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_contact_email` (`email`(3072));

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletterlog`
--
ALTER TABLE `newsletterlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roombook`
--
ALTER TABLE `roombook`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `newsletterlog`
--
ALTER TABLE `newsletterlog`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `roombook`
--
ALTER TABLE `roombook`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
