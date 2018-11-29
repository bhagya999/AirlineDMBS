-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2018 at 05:59 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airlinedbms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` varchar(8) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `first_name`, `last_name`, `address`, `email`) VALUES
('a-1', 'AdminFirst', 'AdminLast', 'address', 'admin@example.com');

--
-- Triggers `admin`
--
DELIMITER $$
CREATE TRIGGER `before_admin_insert` BEFORE INSERT ON `admin` FOR EACH ROW BEGIN
  declare msg varchar(128);
  declare passwordtemp varchar(40);
  IF length(trim(new.id)) = 0 THEN
  set msg = "Invalid id";
    signal sqlstate '45000' set message_text = msg;
  end if;
  IF NEW.`email` NOT LIKE '%_@%_.__%'  THEN
  set msg = "Invalid Email";
    signal sqlstate '45000' set message_text = msg;
  end if;
  IF new.first_name REGEXP '[^a-zA-Z]+$' or length(trim(new.first_name)) = 0 THEN
  set msg = "Invalid first_name";
    signal sqlstate '45000' set message_text = msg;
  end if;
  IF new.last_name  REGEXP '[^a-zA-Z]+$' or length(trim(new.last_name)) = 0  THEN
  set msg = "Invalid last_name";
    signal sqlstate '45000' set message_text = msg;
  end if;
  
  IF length(trim(new.address)) = 0 THEN
  set msg = "Invalid Address";
    signal sqlstate '45000' set message_text = msg;
  end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `aeroplane_type`
--

CREATE TABLE `aeroplane_type` (
  `type_id` varchar(6) NOT NULL,
  `no_of_seats` int(3) NOT NULL,
  `max_flight_duration` int(2) NOT NULL,
  `type_of_engine` varchar(50) NOT NULL,
  `number_of_engine` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aeroplane_type`
--

INSERT INTO `aeroplane_type` (`type_id`, `no_of_seats`, `max_flight_duration`, `type_of_engine`, `number_of_engine`) VALUES
('AB380', 350, 15, 'engine type 1', 4),
('BO737', 175, 10, 'engine type 3', 4),
('BO757', 215, 12, 'engine type 2', 4);

--
-- Triggers `aeroplane_type`
--
DELIMITER $$
CREATE TRIGGER `before_aeroplane_type_insert` BEFORE INSERT ON `aeroplane_type` FOR EACH ROW BEGIN
	declare msg varchar(128);
  IF new.no_of_seats<=0  THEN
  set msg = "Invalid no_of_seats";
    signal sqlstate '45000' set message_text = msg;
	end if;
  IF new.max_flight_duration<0  THEN
  set msg = "Invalid max_flight_duration";
    signal sqlstate '45000' set message_text = msg;
	end if;
  IF new.number_of_engine<=0  THEN
  set msg = "Invalid number_of_engine";
    signal sqlstate '45000' set message_text = msg;
	end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

CREATE TABLE `airport` (
  `airport_code` varchar(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  `country` varchar(25) NOT NULL,
  `state` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `longtitude` double NOT NULL,
  `latitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`airport_code`, `name`, `country`, `state`, `city`, `longtitude`, `latitude`) VALUES
('BIA', 'Bandaranaike International Airport', 'Sri Lanka', 'Colombo', 'Colombo', 79.8843, 7.1802),
('BKK', 'Suvarnabhumi Airport', 'Thailand', 'Bangkok', 'Prakan', 100.7501, 13.69),
('BOM', 'Chhatrapati Shivaji International Airport', 'India', 'Mumbai', 'Mumbai', 72.8656, 19.0896),
('CGK', 'Soekarno–Hatta International Airport', 'Indonesia', 'Banten', 'Tangeran', 106.6537, 6.1275),
('DEL', 'Indira Gandhi International Airport', 'India', 'Delhi', 'Delhi', 108.3682, 11.7503),
('DMK', 'Don Mueang International Airport', 'Thailand', 'Bangkok', 'Bangkok', 100.6042, 13.9133),
('DPS', 'Ngurah Rai International Airport', 'Indonesia', 'Denpasar', 'Bali', 115.1668, 8.7467),
('HRI', 'Mattala Rajapaksa International Airport', 'Sri Lanka', 'Hambantota', 'Mattala', 81.1239, 6.293),
('MAA', 'Chennai International Airport', 'India', 'Chennai', 'Chennai', 80.1709, 12.9941),
('SIN', 'Singapore Changi Airport', 'Singapore', 'Singapore', 'Singapore', 103.9915, 1.3644);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(6) NOT NULL,
  `id` varchar(8) NOT NULL,
  `scheduler_id` int(6) NOT NULL,
  `payment` double NOT NULL,
  `booked_time` datetime NOT NULL,
  `no_of_seats` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `id`, `scheduler_id`, `payment`, `booked_time`, `no_of_seats`) VALUES
(1, '4', 8, 50000, '2018-11-06 23:00:00', 2),
(2, '1', 10, 45000, '2018-11-06 23:00:00', 1),
(3, '6', 12, 55000, '2018-11-06 23:00:00', 1),
(4, '2', 16, 90000, '2018-11-06 23:00:00', 4),
(6, '6', 2, 40000, '2018-11-12 12:00:00', 1),
(7, '6', 2, 40000, '2018-11-12 12:00:00', 1),
(8, '5', 1, 90000, '2018-11-12 12:00:00', 1),
(9, '4', 21, 38500, '2018-11-12 12:00:00', 1),
(10, '5', 21, 38500, '2018-11-12 12:00:00', 1),
(11, '4', 21, 38500, '2018-11-12 12:00:00', 1),
(12, 'u-18', 21, 110000, '2018-11-29 04:18:31', 2),
(13, 'u-18', 21, 110000, '2018-11-29 04:20:34', 2),
(14, 'u-18', 21, 55000, '2018-11-29 04:21:37', 1),
(15, 'u-18', 21, 55000, '2018-11-29 04:22:33', 1),
(16, 'u-18', 21, 55000, '2018-11-29 04:26:45', 1),
(17, 'u-18', 21, 55000, '2018-11-29 04:30:21', 1),
(18, 'u-18', 21, 55000, '2018-11-29 04:34:09', 1),
(19, 'u-18', 21, 55000, '2018-11-29 04:42:12', 1),
(20, 'u-20', 21, 55000, '2018-11-29 05:00:14', 1),
(21, 'u-20', 21, 55000, '2018-11-29 05:10:10', 1),
(22, 'u-20', 21, 55000, '2018-11-29 09:41:10', 1),
(23, 'u-20', 26, 150000, '2018-11-29 10:12:44', 2);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `class_type` int(1) NOT NULL,
  `class_name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `additional_charge` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`class_type`, `class_name`, `description`, `additional_charge`) VALUES
(1, 'First Class', 'Generally the most expensive and most comfortable accommodations available.', 70),
(2, 'Business Class', 'High quality, traditionally purchased by business travelers ', 40),
(3, 'Premium Economy Clas', 'Slightly better Economy Class seating ', 30),
(4, 'Economy Class', 'Basic accommodation, commonly purchased by leisure travelers', 0);

--
-- Triggers `class`
--
DELIMITER $$
CREATE TRIGGER `before_class_insert` BEFORE INSERT ON `class` FOR EACH ROW BEGIN
	declare msg varchar(128);
  IF new.additional_charge<0  THEN
  set msg = "Invalid additonal_charges";
    signal sqlstate '45000' set message_text = msg;
	end if;
  IF new.class_type<=0  THEN
  set msg = "Invalid class_type";
    signal sqlstate '45000' set message_text = msg;
	end if;
  
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_class_update` BEFORE UPDATE ON `class` FOR EACH ROW BEGIN
	declare msg varchar(128);
  IF new.additional_charge<0  THEN
  set msg = "Invalid additonal_charges";
    signal sqlstate '45000' set message_text = msg;
	end if;
  
  
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` varchar(8) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `package_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `first_name`, `last_name`, `address`, `email`, `package_type`) VALUES
('1', 'CustomerFirst1', 'CustomerLast1', 'CustomerAddress1', 'customer1@example.com', 'Frequent'),
('1456', '1df', 'sh', '19/2', 'b@1.com', 'GOLD'),
('197', '1', 'Sh', '19/2', 'b@1.com', 'GOLD'),
('198', 'bhagya', 'Sh', '19/2', 'b@1.com', 'GOLD'),
('199', '1', 'sh', '19/2', 'b@1.com', 'GOLD'),
('2', 'CustomerFirst2', 'CustomerLast2', 'CustomerAddress2', 'customer2@example.com', 'Gold'),
('201', 'bhagya', 'sh', '19/2', 'b@1.com', 'GOLD'),
('203', '1g', 'sh', '19/2', 'b@1.com', 'GOLD'),
('204', '1', 'sh', '19/2', 'b@1.com', 'GOLD'),
('299', '1', 'sh', '19/2', 'b@1.com', 'GOLD'),
('3', 'CustomerFirst3', 'CustomerLast3', 'CustomerAddress3', 'customer3@example.com', 'Gold'),
('300', '1', 'sh', '19/2', 'b@1.com', 'GOLD'),
('4', 'CustomerFirst4', 'CustomerLast4', 'CustomerAddress4', 'customer4@example.com', 'Frequent'),
('5', 'CustomerFirst5', 'CustomerLast5', 'CustomerAddress5', 'customer5@example.com', 'Guest'),
('6', 'CustomerFirst6', 'CustomerLast6', 'CustomerAddress6', 'customer6@example.com', 'Guest'),
('7', 'Ravindu', 'Nuradha', '117/1,Maharagama.', 'nuradhamunasinghe@gmail.com', 'Gold'),
('u-18', 'Dulaj', 'Panapitiya', 'No:51/B\r\nKanduboda', 'tharindu@123.com', 'Guest'),
('u-19', 'Dulaj', 'Panapitiya', 'No:51/B\r\nKanduboda', 'tharindu@123.com', 'Guest'),
('u-20', 'Ravindu', 'Davinci', '151', 'ravindudavnci@gmail.com', 'Guest'),
('u-567', 'firstname', 'lastname', 'address', 'email@123.com', 'Guest');

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `before_customer_insert` BEFORE INSERT ON `customer` FOR EACH ROW BEGIN
	declare msg varchar(128);
  declare passwordtemp varchar(40);
  IF length(trim(new.id)) = 0 THEN
  set msg = "Invalid id";
    signal sqlstate '45000' set message_text = msg;
  end if;
  IF NEW.`email` NOT LIKE '%_@%_.__%'  THEN
  set msg = "Invalid Email";
    signal sqlstate '45000' set message_text = msg;
	end if;
  IF new.first_name REGEXP '[^a-zA-Z]+$' or length(trim(new.first_name)) = 0 THEN
  set msg = "Invalid first_name";
    signal sqlstate '45000' set message_text = msg;
	end if;
  IF new.last_name  REGEXP '[^a-zA-Z]+$' or length(trim(new.last_name)) = 0  THEN
  set msg = "Invalid last_name";
    signal sqlstate '45000' set message_text = msg;
  end if;
 
  IF length(trim(new.address)) = 0 THEN
  set msg = "Invalid Address";
    signal sqlstate '45000' set message_text = msg;
  end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `flight_id` int(6) NOT NULL,
  `flight_day` varchar(3) NOT NULL,
  `flight_time` time NOT NULL,
  `route_id` int(6) NOT NULL,
  `ticket_value` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`flight_id`, `flight_day`, `flight_time`, `route_id`, `ticket_value`) VALUES
(1, 'SUN', '08:00:00', 1, 30000),
(2, 'SUN', '16:00:00', 3, 40000),
(3, 'SUN', '15:00:00', 6, 50000),
(4, 'MON', '12:00:00', 4, 40000),
(5, 'MON', '22:00:00', 6, 70000),
(6, 'TUE', '09:00:00', 8, 60000),
(7, 'TUE', '22:00:00', 10, 80000),
(8, 'WED', '10:00:00', 1, 70000),
(9, 'WED', '20:00:00', 2, 50000),
(10, 'WED', '22:00:00', 5, 40000),
(11, 'THU', '07:00:00', 9, 70000),
(12, 'THU', '14:00:00', 7, 55000),
(13, 'FRI', '10:00:00', 12, 75000),
(14, 'FRI', '16:00:00', 1, 50000),
(15, 'FRI', '20:00:00', 3, 60000),
(16, 'SAT', '09:00:00', 5, 45000),
(17, 'SAT', '17:00:00', 8, 90000),
(18, 'SAT', '20:00:00', 10, 80000),
(19, 'SAT', '21:00:00', 6, 70000),
(20, 'SAT', '22:00:00', 4, 65000);

--
-- Triggers `flight`
--
DELIMITER $$
CREATE TRIGGER `before_flight_insert` BEFORE INSERT ON `flight` FOR EACH ROW BEGIN
  declare msg varchar(128);
  IF not(new.flight_day="SUN" or new.flight_day="MON" or new.flight_day="TUE" or new.flight_day="WED" or new.flight_day="THU" or new.flight_day="FRI" or new.flight_day="SAT") THEN
  set msg = "Invalid flight_day";
    signal sqlstate '45000' set message_text = msg;
  end if;
  IF new.route_id<=0  THEN
  set msg = "Invalid route_id";
    signal sqlstate '45000' set message_text = msg;
  end if;
  IF new.ticket_value<=0  THEN
  set msg = "Invalid ticket_value";
    signal sqlstate '45000' set message_text = msg;
  end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `flightview`
-- (See below for the actual view)
--
CREATE TABLE `flightview` (
`flight_id` int(6)
,`flight_day` varchar(3)
,`flight_time` time
,`route_id` int(6)
);

-- --------------------------------------------------------

--
-- Table structure for table `flight_scheduler`
--

CREATE TABLE `flight_scheduler` (
  `scheduler_id` int(6) NOT NULL,
  `flight_id` int(6) NOT NULL,
  `flight_date` date NOT NULL,
  `flight_delay` enum('Not Delayed','Delayed','','') NOT NULL,
  `plane_id` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flight_scheduler`
--

INSERT INTO `flight_scheduler` (`scheduler_id`, `flight_id`, `flight_date`, `flight_delay`, `plane_id`) VALUES
(1, 1, '2018-11-04', 'Not Delayed', '1'),
(2, 2, '2018-11-04', 'Not Delayed', '3'),
(3, 3, '2018-11-04', 'Not Delayed', '8'),
(4, 4, '2018-11-05', 'Not Delayed', '7'),
(5, 5, '2018-11-05', 'Not Delayed', '4'),
(6, 6, '2018-11-06', 'Not Delayed', '5'),
(7, 7, '2018-11-06', 'Not Delayed', '5'),
(8, 8, '2018-11-07', 'Not Delayed', '6'),
(9, 9, '2018-11-07', 'Not Delayed', '1'),
(10, 10, '2018-11-07', 'Not Delayed', '7'),
(11, 11, '2018-11-08', 'Not Delayed', '4'),
(12, 12, '2018-11-08', 'Not Delayed', '3'),
(13, 13, '2018-11-09', 'Not Delayed', '8'),
(14, 14, '2018-11-09', 'Not Delayed', '7'),
(15, 15, '2018-11-09', 'Not Delayed', '4'),
(16, 16, '2018-11-10', 'Not Delayed', '3'),
(17, 17, '2018-11-10', 'Not Delayed', '2'),
(18, 18, '2018-11-10', 'Not Delayed', '1'),
(19, 19, '2018-11-10', 'Not Delayed', '6'),
(20, 20, '2018-11-10', 'Not Delayed', '4'),
(21, 12, '2018-11-15', 'Not Delayed', '6'),
(22, 3, '2018-12-02', 'Delayed', '2'),
(23, 3, '2018-12-02', 'Not Delayed', '4'),
(24, 5, '2018-12-04', 'Delayed', '1'),
(25, 5, '2018-12-04', 'Not Delayed', '7'),
(26, 13, '2018-12-08', 'Delayed', '7'),
(27, 4, '2018-12-10', 'Not Delayed', '8'),
(29, 12, '2018-12-15', 'Not Delayed', '1'),
(30, 3, '2018-12-18', 'Not Delayed', '2'),
(36, 5, '2018-12-06', 'Not Delayed', '7'),
(40, 12, '2018-12-07', 'Not Delayed', '2');

--
-- Triggers `flight_scheduler`
--
DELIMITER $$
CREATE TRIGGER `before_flight_scheduler_insert` BEFORE INSERT ON `flight_scheduler` FOR EACH ROW BEGIN
  declare msg1 varchar(128);
  declare dt date;
  set dt = current_date();
  IF new.flight_id <=0 THEN
    set msg1 = "Invalid flight_id";
    signal sqlstate '45000' set message_text = msg1;
	end if;
  IF new.scheduler_id <=0 THEN
    set msg1 = "Invalid scheduler_id";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  IF length(trim(new.plane_id)) = 0 THEN
    set msg1 = "Invalid plane_id";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `package_type` varchar(10) NOT NULL,
  `discount_percentage` double NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`package_type`, `discount_percentage`, `description`) VALUES
('Frequent', 5, 'This is about frequent class customers'),
('Gold', 9, 'This is about gold class customers'),
('Guest', 0, 'this is about guest class customers');

--
-- Triggers `package`
--
DELIMITER $$
CREATE TRIGGER `before_package_insert` BEFORE INSERT ON `package` FOR EACH ROW BEGIN
  declare msg1 varchar(128);
  
  IF (new.discount_percentage <=0  or new.discount_percentage>100 )THEN
    set msg1 = "Invalid discount_percentage";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  IF length(trim(new.package_type)) =0 THEN
    set msg1 = "Invalid package_type";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  IF length(trim(new.description)) = 0 THEN
    set msg1 = "Invalid description";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `ticket_no` int(6) NOT NULL,
  `passport_id` int(10) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `seat_no` int(3) NOT NULL,
  `booking_id` int(6) NOT NULL,
  `class_type` int(1) NOT NULL,
  `age` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`ticket_no`, `passport_id`, `first_name`, `last_name`, `seat_no`, `booking_id`, `class_type`, `age`) VALUES
(1, 1234567890, 'Ravindu', 'Dulaj', 13, 18, 1, 20),
(2, 1234567890, 'Ravindu', 'Dulaj', 17, 19, 1, 21),
(3, 1234567890, 'Bagya', 'Nuradha', 12, 20, 1, 17),
(4, 1234567890, 'Bagya', 'Dulaj', 23, 21, 1, 17),
(5, 1234567890, 'Ravindu', 'Nuradha', 16, 22, 1, 17),
(6, 1234567890, 'Bagya', 'Nuradha', 2, 23, 1, 17),
(7, 2147483647, 'Dulaj', 'Bagya', 3, 23, 1, 21);

--
-- Triggers `passenger`
--
DELIMITER $$
CREATE TRIGGER `before_passenger_insert` BEFORE INSERT ON `passenger` FOR EACH ROW BEGIN
  declare msg1 varchar(128);
  
 
  IF (new.passport_id<=0)THEN
    set msg1 = "Invalid passport_id";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  IF new.first_name REGEXP '[^a-zA-Z]+$' or length(trim(new.first_name)) = 0 THEN
  set msg1 = "Invalid first_name";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  IF new.last_name  REGEXP '[^a-zA-Z]+$' or length(trim(new.last_name)) = 0  THEN
  set msg1 = "Invalid last_name";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  
  IF (new.seat_no<=0) THEN
    set msg1 = "Invalid seat_no";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  IF (new.booking_id<=0) THEN
    set msg1 = "Invalid booking_id";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  IF (new.class_type<=0) THEN
    set msg1 = "Invalid class_type";
    signal sqlstate '45000' set message_text = msg1;
  end if;

  
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `passengercount`
-- (See below for the actual view)
--
CREATE TABLE `passengercount` (
`scheduler_id` int(6)
,`count(*)` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `passenger_destination`
-- (See below for the actual view)
--
CREATE TABLE `passenger_destination` (
`booking_Id` int(6)
,`scheduler_id` int(6)
,`flight_date` date
);

-- --------------------------------------------------------

--
-- Table structure for table `plane`
--

CREATE TABLE `plane` (
  `plane_id` varchar(6) NOT NULL,
  `plane_name` varchar(25) NOT NULL,
  `type_id` varchar(6) NOT NULL,
  `bought_year` year(4) NOT NULL,
  `last_maintained_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plane`
--

INSERT INTO `plane` (`plane_id`, `plane_name`, `type_id`, `bought_year`, `last_maintained_date`) VALUES
('1', 'BOING 737 2015', 'BO737', 2015, '2018-01-01'),
('2', 'BOING 737 2015(II)', 'BO737', 2015, '2018-01-01'),
('3', 'BOING 737 2015(III)', 'BO737', 2016, '2017-01-01'),
('4', 'BOING 737 2016', 'BO737', 2016, '2018-06-01'),
('5', 'BOING 757 2016', 'BO757', 2016, '2018-06-01'),
('6', 'BOING 757 2016(II)', 'BO757', 2016, '2018-03-01'),
('7', 'BOING 757 2015', 'BO757', 2015, '2018-01-01'),
('8', 'AIR BUS 380', 'AB380', 2018, '2018-01-01');

--
-- Triggers `plane`
--
DELIMITER $$
CREATE TRIGGER `before_plane_insert` BEFORE INSERT ON `plane` FOR EACH ROW BEGIN
  declare msg1 varchar(128);
  declare dt date;
  set dt = current_date();
  IF (length(trim(new.plane_id)) =0)THEN
    set msg1 = "Invalid plane_id";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  IF length(trim(new.plane_name)) =0 THEN
    set msg1 = "Invalid plane_name";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  IF length(trim(new.type_id)) = 0 THEN
    set msg1 = "Invalid type_id";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  IF dt<new.bought_year THEN
    set msg1 = "Invalid bought_year";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  IF dt<new.last_maintained_date THEN
    set msg1 = "Invalid last_maintained_date";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `revenue`
--

CREATE TABLE `revenue` (
  `booking_id` int(6) NOT NULL,
  `sub_total` double NOT NULL,
  `discounting_amount` double NOT NULL,
  `final_amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `revenue`
--

INSERT INTO `revenue` (`booking_id`, `sub_total`, `discounting_amount`, `final_amount`) VALUES
(21, 55000, 5, 52250),
(22, 55000, 5, 52250),
(23, 150000, 5, 142500);

--
-- Triggers `revenue`
--
DELIMITER $$
CREATE TRIGGER `before_revenue_insert` BEFORE INSERT ON `revenue` FOR EACH ROW BEGIN
  declare msg1 varchar(128);
  
  IF new.booking_id<=0 THEN
    set msg1 = "Invalid booking_id";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  IF new.sub_total<=0 THEN
    set msg1 = "Invalid sub_total";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  IF new.discounting_amount<=0 THEN
    set msg1 = "Invalid discounting_amount";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  IF new.final_amount<=0 THEN
    set msg1 = "Invalid final_amount";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `route_id` int(6) NOT NULL,
  `flight_from` varchar(3) NOT NULL,
  `flight_to` varchar(3) NOT NULL,
  `distance` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`route_id`, `flight_from`, `flight_to`, `distance`) VALUES
(1, 'BIA', 'CGK', 300),
(2, 'CGK', 'BIA', 300),
(3, 'DPS', 'BOM', 430),
(4, 'BOM', 'DPS', 430),
(5, 'DEL', 'CGK', 400),
(6, 'CGK', 'DEL', 400),
(7, 'HRI', 'SIN', 350),
(8, 'SIN', 'HRI', 350),
(9, 'BIA', 'MAA', 200),
(10, 'MAA', 'BIA', 200),
(11, 'BKK', 'DPS', 350),
(12, 'DPS', 'BKK', 350),
(13, 'HRI', 'DEL', 250),
(14, 'DEL', 'HRI', 250),
(15, 'SIN', 'DMK', 300),
(16, 'DMK', 'SIN', 300),
(17, 'BIA', 'SIN', 400),
(18, 'SIN', 'BIA', 400),
(19, 'BOM', 'DMK', 350),
(20, 'DMK', 'BOM', 350);

--
-- Triggers `route`
--
DELIMITER $$
CREATE TRIGGER `before_route_insert` BEFORE INSERT ON `route` FOR EACH ROW BEGIN
  declare msg1 varchar(128);
  
  IF new.route_id<=0 THEN
    set msg1 = "Invalid route_id";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  IF length(trim(new.flight_from)) = 0 THEN
    set msg1 = "Invalid flight_from";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  IF length(trim(new.flight_to)) = 0 THEN
    set msg1 = "Invalid flight_to";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  IF new.distance<=0 THEN
    set msg1 = "Invalid distance";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

CREATE TABLE `seat` (
  `scheduler_id` int(6) NOT NULL,
  `seat_no` int(3) NOT NULL,
  `ticket_no` int(6) NOT NULL,
  `state` enum('Booked','Available','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seat`
--

INSERT INTO `seat` (`scheduler_id`, `seat_no`, `ticket_no`, `state`) VALUES
(1, 1, 1, 'Booked'),
(1, 2, 2, 'Booked'),
(2, 1, 4, 'Booked'),
(2, 2, 5, 'Booked'),
(2, 3, 6, 'Booked'),
(2, 4, 7, 'Booked'),
(21, 1, 0, 'Booked'),
(21, 2, 0, 'Booked'),
(21, 3, 0, 'Booked'),
(21, 4, 0, 'Booked'),
(21, 5, 0, 'Booked'),
(21, 6, 0, 'Booked'),
(21, 7, 0, 'Booked'),
(21, 8, 0, 'Booked'),
(21, 9, 0, 'Booked'),
(21, 10, 0, 'Booked'),
(21, 11, 0, 'Booked'),
(21, 12, 0, 'Booked'),
(21, 13, 0, 'Booked'),
(21, 14, 0, 'Available'),
(21, 15, 0, 'Booked'),
(21, 16, 0, 'Booked'),
(21, 17, 0, 'Booked'),
(21, 18, 0, 'Available'),
(21, 19, 0, 'Booked'),
(21, 20, 0, 'Booked'),
(21, 21, 0, 'Booked'),
(21, 22, 0, 'Available'),
(21, 23, 0, 'Booked'),
(21, 24, 0, 'Available'),
(21, 25, 0, 'Available'),
(21, 26, 0, 'Available'),
(21, 27, 0, 'Available'),
(21, 28, 0, 'Available'),
(21, 29, 0, 'Available'),
(21, 30, 0, 'Available'),
(21, 31, 0, 'Available'),
(21, 32, 0, 'Available'),
(21, 33, 0, 'Available'),
(21, 34, 0, 'Available'),
(21, 35, 0, 'Available'),
(21, 36, 0, 'Available'),
(21, 37, 0, 'Available'),
(21, 38, 0, 'Available'),
(21, 39, 0, 'Available'),
(21, 40, 0, 'Available'),
(21, 41, 0, 'Available'),
(21, 42, 0, 'Available'),
(21, 43, 0, 'Available'),
(21, 44, 0, 'Available'),
(21, 45, 0, 'Available'),
(21, 46, 0, 'Available'),
(21, 47, 0, 'Available'),
(21, 48, 0, 'Available'),
(21, 49, 0, 'Available'),
(21, 50, 0, 'Available'),
(21, 51, 0, 'Available'),
(21, 52, 0, 'Available'),
(21, 53, 0, 'Available'),
(21, 54, 0, 'Available'),
(21, 55, 0, 'Available'),
(21, 56, 0, 'Available'),
(21, 57, 0, 'Available'),
(21, 58, 0, 'Available'),
(21, 59, 0, 'Available'),
(21, 60, 0, 'Available'),
(21, 61, 0, 'Available'),
(21, 62, 0, 'Available'),
(21, 63, 0, 'Available'),
(21, 64, 0, 'Available'),
(21, 65, 0, 'Available'),
(21, 66, 0, 'Available'),
(21, 67, 0, 'Available'),
(21, 68, 0, 'Available'),
(21, 69, 0, 'Available'),
(21, 70, 0, 'Available'),
(21, 71, 0, 'Available'),
(21, 72, 0, 'Available'),
(21, 73, 0, 'Available'),
(21, 74, 0, 'Available'),
(21, 75, 0, 'Available'),
(21, 76, 0, 'Available'),
(21, 77, 0, 'Available'),
(21, 78, 0, 'Available'),
(21, 79, 0, 'Available'),
(21, 80, 0, 'Available'),
(21, 81, 0, 'Available'),
(21, 82, 0, 'Available'),
(21, 83, 0, 'Available'),
(21, 84, 0, 'Available'),
(21, 85, 0, 'Available'),
(21, 86, 0, 'Available'),
(21, 87, 0, 'Available'),
(21, 88, 0, 'Available'),
(21, 89, 0, 'Available'),
(21, 90, 0, 'Available'),
(21, 91, 0, 'Available'),
(21, 92, 0, 'Available'),
(21, 93, 0, 'Available'),
(21, 94, 0, 'Available'),
(21, 95, 0, 'Available'),
(21, 96, 0, 'Available'),
(21, 97, 0, 'Available'),
(21, 98, 0, 'Available'),
(21, 99, 0, 'Available'),
(21, 100, 0, 'Available'),
(21, 101, 0, 'Available'),
(21, 102, 0, 'Available'),
(21, 103, 0, 'Available'),
(21, 104, 0, 'Available'),
(21, 105, 0, 'Available'),
(21, 106, 0, 'Available'),
(21, 107, 0, 'Available'),
(21, 108, 0, 'Available'),
(21, 109, 0, 'Available'),
(21, 110, 0, 'Available'),
(21, 111, 0, 'Available'),
(21, 112, 0, 'Available'),
(21, 113, 0, 'Available'),
(21, 114, 0, 'Available'),
(21, 115, 0, 'Available'),
(21, 116, 0, 'Available'),
(21, 117, 0, 'Available'),
(21, 118, 0, 'Available'),
(21, 119, 0, 'Available'),
(21, 120, 0, 'Available'),
(21, 121, 0, 'Available'),
(21, 122, 0, 'Available'),
(21, 123, 0, 'Available'),
(21, 124, 0, 'Available'),
(21, 125, 0, 'Available'),
(21, 126, 0, 'Available'),
(21, 127, 0, 'Available'),
(21, 128, 0, 'Available'),
(21, 129, 0, 'Available'),
(21, 130, 0, 'Available'),
(21, 131, 0, 'Available'),
(21, 132, 0, 'Available'),
(21, 133, 0, 'Available'),
(21, 134, 0, 'Available'),
(21, 135, 0, 'Available'),
(21, 136, 0, 'Available'),
(21, 137, 0, 'Available'),
(21, 138, 0, 'Available'),
(21, 139, 0, 'Available'),
(21, 140, 0, 'Available'),
(21, 141, 0, 'Available'),
(21, 142, 0, 'Available'),
(21, 143, 0, 'Available'),
(21, 144, 0, 'Available'),
(21, 145, 0, 'Available'),
(21, 146, 0, 'Available'),
(21, 147, 0, 'Available'),
(21, 148, 0, 'Available'),
(21, 149, 0, 'Available'),
(21, 150, 0, 'Available'),
(21, 151, 0, 'Available'),
(21, 152, 0, 'Available'),
(21, 153, 0, 'Available'),
(21, 154, 0, 'Available'),
(21, 155, 0, 'Available'),
(21, 156, 0, 'Available'),
(21, 157, 0, 'Available'),
(21, 158, 0, 'Available'),
(21, 159, 0, 'Available'),
(21, 160, 0, 'Available'),
(21, 161, 0, 'Available'),
(21, 162, 0, 'Available'),
(21, 163, 0, 'Available'),
(21, 164, 0, 'Available'),
(21, 165, 0, 'Available'),
(21, 166, 0, 'Available'),
(21, 167, 0, 'Available'),
(21, 168, 0, 'Available'),
(21, 169, 0, 'Available'),
(21, 170, 0, 'Available'),
(21, 171, 0, 'Available'),
(21, 172, 0, 'Available'),
(21, 173, 0, 'Available'),
(21, 174, 0, 'Available'),
(21, 175, 0, 'Available'),
(21, 176, 0, 'Available'),
(21, 177, 0, 'Available'),
(21, 178, 0, 'Available'),
(21, 179, 0, 'Available'),
(21, 180, 0, 'Available'),
(21, 181, 0, 'Available'),
(21, 182, 0, 'Available'),
(21, 183, 0, 'Available'),
(21, 184, 0, 'Available'),
(21, 185, 0, 'Available'),
(21, 186, 0, 'Available'),
(21, 187, 0, 'Available'),
(21, 188, 0, 'Available'),
(21, 189, 0, 'Available'),
(21, 190, 0, 'Available'),
(21, 191, 0, 'Available'),
(21, 192, 0, 'Available'),
(21, 193, 0, 'Available'),
(21, 194, 0, 'Available'),
(21, 195, 0, 'Available'),
(21, 196, 0, 'Available'),
(21, 197, 0, 'Available'),
(21, 198, 0, 'Available'),
(21, 199, 0, 'Available'),
(21, 200, 0, 'Available'),
(21, 201, 0, 'Available'),
(21, 202, 0, 'Available'),
(21, 203, 0, 'Available'),
(21, 204, 0, 'Available'),
(21, 205, 0, 'Available'),
(21, 206, 0, 'Available'),
(21, 207, 0, 'Available'),
(21, 208, 0, 'Available'),
(21, 209, 0, 'Available'),
(21, 210, 0, 'Available'),
(21, 211, 0, 'Available'),
(21, 212, 0, 'Available'),
(21, 213, 0, 'Available'),
(21, 214, 0, 'Available'),
(21, 215, 0, 'Available'),
(26, 1, 1, 'Available'),
(26, 2, 1, 'Booked'),
(26, 3, 1, 'Booked'),
(26, 4, 1, 'Available'),
(26, 5, 1, 'Available'),
(26, 6, 1, 'Available'),
(26, 7, 1, 'Available'),
(26, 8, 1, 'Available'),
(26, 9, 1, 'Available'),
(26, 10, 1, 'Available'),
(26, 11, 1, 'Available'),
(26, 12, 1, 'Available'),
(26, 13, 1, 'Available'),
(26, 14, 1, 'Available'),
(26, 15, 1, 'Available'),
(26, 16, 1, 'Available'),
(26, 17, 1, 'Available'),
(26, 18, 1, 'Available'),
(26, 19, 1, 'Available'),
(26, 20, 1, 'Available'),
(26, 21, 1, 'Available'),
(26, 22, 1, 'Available'),
(26, 23, 1, 'Available'),
(26, 24, 1, 'Available'),
(26, 25, 1, 'Available'),
(26, 26, 1, 'Available'),
(26, 27, 1, 'Available'),
(26, 28, 1, 'Available'),
(26, 29, 1, 'Available'),
(26, 30, 1, 'Available'),
(26, 31, 1, 'Available'),
(26, 32, 1, 'Available'),
(26, 33, 1, 'Available'),
(26, 34, 1, 'Available'),
(26, 35, 1, 'Available'),
(26, 36, 1, 'Available'),
(26, 37, 1, 'Available'),
(26, 38, 1, 'Available'),
(26, 39, 1, 'Available'),
(26, 40, 1, 'Available'),
(26, 41, 1, 'Available'),
(26, 42, 1, 'Available'),
(26, 43, 1, 'Available'),
(26, 44, 1, 'Available'),
(26, 45, 1, 'Available'),
(26, 46, 1, 'Available'),
(26, 47, 1, 'Available'),
(26, 48, 1, 'Available'),
(26, 49, 1, 'Available'),
(26, 50, 1, 'Available'),
(26, 51, 1, 'Available'),
(26, 52, 1, 'Available'),
(26, 53, 1, 'Available'),
(26, 54, 1, 'Available'),
(26, 55, 1, 'Available'),
(26, 56, 1, 'Available'),
(26, 57, 1, 'Available'),
(26, 58, 1, 'Available'),
(26, 59, 1, 'Available'),
(26, 60, 1, 'Available'),
(26, 61, 1, 'Available'),
(26, 62, 1, 'Available'),
(26, 63, 1, 'Available'),
(26, 64, 1, 'Available'),
(26, 65, 1, 'Available'),
(26, 66, 1, 'Available'),
(26, 67, 1, 'Available'),
(26, 68, 1, 'Available'),
(26, 69, 1, 'Available'),
(26, 70, 1, 'Available'),
(26, 71, 1, 'Available'),
(26, 72, 1, 'Available'),
(26, 73, 1, 'Available'),
(26, 74, 1, 'Available'),
(26, 75, 1, 'Available'),
(26, 76, 1, 'Available'),
(26, 77, 1, 'Available'),
(26, 78, 1, 'Available'),
(26, 79, 1, 'Available'),
(26, 80, 1, 'Available'),
(26, 81, 1, 'Available'),
(26, 82, 1, 'Available'),
(26, 83, 1, 'Available'),
(26, 84, 1, 'Available'),
(26, 85, 1, 'Available'),
(26, 86, 1, 'Available'),
(26, 87, 1, 'Available'),
(26, 88, 1, 'Available'),
(26, 89, 1, 'Available'),
(26, 90, 1, 'Available'),
(26, 91, 1, 'Available'),
(26, 92, 1, 'Available'),
(26, 93, 1, 'Available'),
(26, 94, 1, 'Available'),
(26, 95, 1, 'Available'),
(26, 96, 1, 'Available'),
(26, 97, 1, 'Available'),
(26, 98, 1, 'Available'),
(26, 99, 1, 'Available'),
(26, 100, 1, 'Available'),
(26, 101, 1, 'Available'),
(26, 102, 1, 'Available'),
(26, 103, 1, 'Available'),
(26, 104, 1, 'Available'),
(26, 105, 1, 'Available'),
(26, 106, 1, 'Available'),
(26, 107, 1, 'Available'),
(26, 108, 1, 'Available'),
(26, 109, 1, 'Available'),
(26, 110, 1, 'Available'),
(26, 111, 1, 'Available'),
(26, 112, 1, 'Available'),
(26, 113, 1, 'Available'),
(26, 114, 1, 'Available'),
(26, 115, 1, 'Available'),
(26, 116, 1, 'Available'),
(26, 117, 1, 'Available'),
(26, 118, 1, 'Available'),
(26, 119, 1, 'Available'),
(26, 120, 1, 'Available'),
(26, 121, 1, 'Available'),
(26, 122, 1, 'Available'),
(26, 123, 1, 'Available'),
(26, 124, 1, 'Available'),
(26, 125, 1, 'Available'),
(26, 126, 1, 'Available'),
(26, 127, 1, 'Available'),
(26, 128, 1, 'Available'),
(26, 129, 1, 'Available'),
(26, 130, 1, 'Available'),
(26, 131, 1, 'Available'),
(26, 132, 1, 'Available'),
(26, 133, 1, 'Available'),
(26, 134, 1, 'Available'),
(26, 135, 1, 'Available'),
(26, 136, 1, 'Available'),
(26, 137, 1, 'Available'),
(26, 138, 1, 'Available'),
(26, 139, 1, 'Available'),
(26, 140, 1, 'Available'),
(26, 141, 1, 'Available'),
(26, 142, 1, 'Available'),
(26, 143, 1, 'Available'),
(26, 144, 1, 'Available'),
(26, 145, 1, 'Available'),
(26, 146, 1, 'Available'),
(26, 147, 1, 'Available'),
(26, 148, 1, 'Available'),
(26, 149, 1, 'Available'),
(26, 150, 1, 'Available'),
(26, 151, 1, 'Available'),
(26, 152, 1, 'Available'),
(26, 153, 1, 'Available'),
(26, 154, 1, 'Available'),
(26, 155, 1, 'Available'),
(26, 156, 1, 'Available'),
(26, 157, 1, 'Available'),
(26, 158, 1, 'Available'),
(26, 159, 1, 'Available'),
(26, 160, 1, 'Available'),
(26, 161, 1, 'Available'),
(26, 162, 1, 'Available'),
(26, 163, 1, 'Available'),
(26, 164, 1, 'Available'),
(26, 165, 1, 'Available'),
(26, 166, 1, 'Available'),
(26, 167, 1, 'Available'),
(26, 168, 1, 'Available'),
(26, 169, 1, 'Available'),
(26, 170, 1, 'Available'),
(26, 171, 1, 'Available'),
(26, 172, 1, 'Available'),
(26, 173, 1, 'Available'),
(26, 174, 1, 'Available'),
(26, 175, 1, 'Available'),
(26, 176, 1, 'Available'),
(26, 177, 1, 'Available'),
(26, 178, 1, 'Available'),
(26, 179, 1, 'Available'),
(26, 180, 1, 'Available'),
(26, 181, 1, 'Available'),
(26, 182, 1, 'Available'),
(26, 183, 1, 'Available'),
(26, 184, 1, 'Available'),
(26, 185, 1, 'Available'),
(26, 186, 1, 'Available'),
(26, 187, 1, 'Available'),
(26, 188, 1, 'Available'),
(26, 189, 1, 'Available'),
(26, 190, 1, 'Available'),
(26, 191, 1, 'Available'),
(26, 192, 1, 'Available'),
(26, 193, 1, 'Available'),
(26, 194, 1, 'Available'),
(26, 195, 1, 'Available'),
(26, 196, 1, 'Available'),
(26, 197, 1, 'Available'),
(26, 198, 1, 'Available'),
(26, 199, 1, 'Available'),
(26, 200, 1, 'Available'),
(26, 201, 1, 'Available'),
(26, 202, 1, 'Available'),
(26, 203, 1, 'Available'),
(26, 204, 1, 'Available'),
(26, 205, 1, 'Available'),
(26, 206, 1, 'Available'),
(26, 207, 1, 'Available'),
(26, 208, 1, 'Available'),
(26, 209, 1, 'Available'),
(26, 210, 1, 'Available'),
(26, 211, 1, 'Available'),
(26, 212, 1, 'Available'),
(26, 213, 1, 'Available'),
(26, 214, 1, 'Available'),
(26, 215, 1, 'Available'),
(27, 1, 1, 'Available'),
(27, 2, 1, 'Available'),
(27, 3, 1, 'Available'),
(27, 4, 1, 'Available'),
(27, 5, 1, 'Available'),
(27, 6, 1, 'Available'),
(27, 7, 1, 'Available'),
(27, 8, 1, 'Available'),
(27, 9, 1, 'Available'),
(27, 10, 1, 'Available'),
(27, 11, 1, 'Available'),
(27, 12, 1, 'Available'),
(27, 13, 1, 'Available'),
(27, 14, 1, 'Available'),
(27, 15, 1, 'Available'),
(27, 16, 1, 'Available'),
(27, 17, 1, 'Available'),
(27, 18, 1, 'Available'),
(27, 19, 1, 'Available'),
(27, 20, 1, 'Available'),
(27, 21, 1, 'Available'),
(27, 22, 1, 'Available'),
(27, 23, 1, 'Available'),
(27, 24, 1, 'Available'),
(27, 25, 1, 'Available'),
(27, 26, 1, 'Available'),
(27, 27, 1, 'Available'),
(27, 28, 1, 'Available'),
(27, 29, 1, 'Available'),
(27, 30, 1, 'Available'),
(27, 31, 1, 'Available'),
(27, 32, 1, 'Available'),
(27, 33, 1, 'Available'),
(27, 34, 1, 'Available'),
(27, 35, 1, 'Available'),
(27, 36, 1, 'Available'),
(27, 37, 1, 'Available'),
(27, 38, 1, 'Available'),
(27, 39, 1, 'Available'),
(27, 40, 1, 'Available'),
(27, 41, 1, 'Available'),
(27, 42, 1, 'Available'),
(27, 43, 1, 'Available'),
(27, 44, 1, 'Available'),
(27, 45, 1, 'Available'),
(27, 46, 1, 'Available'),
(27, 47, 1, 'Available'),
(27, 48, 1, 'Available'),
(27, 49, 1, 'Available'),
(27, 50, 1, 'Available'),
(27, 51, 1, 'Available'),
(27, 52, 1, 'Available'),
(27, 53, 1, 'Available'),
(27, 54, 1, 'Available'),
(27, 55, 1, 'Available'),
(27, 56, 1, 'Available'),
(27, 57, 1, 'Available'),
(27, 58, 1, 'Available'),
(27, 59, 1, 'Available'),
(27, 60, 1, 'Available'),
(27, 61, 1, 'Available'),
(27, 62, 1, 'Available'),
(27, 63, 1, 'Available'),
(27, 64, 1, 'Available'),
(27, 65, 1, 'Available'),
(27, 66, 1, 'Available'),
(27, 67, 1, 'Available'),
(27, 68, 1, 'Available'),
(27, 69, 1, 'Available'),
(27, 70, 1, 'Available'),
(27, 71, 1, 'Available'),
(27, 72, 1, 'Available'),
(27, 73, 1, 'Available'),
(27, 74, 1, 'Available'),
(27, 75, 1, 'Available'),
(27, 76, 1, 'Available'),
(27, 77, 1, 'Available'),
(27, 78, 1, 'Available'),
(27, 79, 1, 'Available'),
(27, 80, 1, 'Available'),
(27, 81, 1, 'Available'),
(27, 82, 1, 'Available'),
(27, 83, 1, 'Available'),
(27, 84, 1, 'Available'),
(27, 85, 1, 'Available'),
(27, 86, 1, 'Available'),
(27, 87, 1, 'Available'),
(27, 88, 1, 'Available'),
(27, 89, 1, 'Available'),
(27, 90, 1, 'Available'),
(27, 91, 1, 'Available'),
(27, 92, 1, 'Available'),
(27, 93, 1, 'Available'),
(27, 94, 1, 'Available'),
(27, 95, 1, 'Available'),
(27, 96, 1, 'Available'),
(27, 97, 1, 'Available'),
(27, 98, 1, 'Available'),
(27, 99, 1, 'Available'),
(27, 100, 1, 'Available'),
(27, 101, 1, 'Available'),
(27, 102, 1, 'Available'),
(27, 103, 1, 'Available'),
(27, 104, 1, 'Available'),
(27, 105, 1, 'Available'),
(27, 106, 1, 'Available'),
(27, 107, 1, 'Available'),
(27, 108, 1, 'Available'),
(27, 109, 1, 'Available'),
(27, 110, 1, 'Available'),
(27, 111, 1, 'Available'),
(27, 112, 1, 'Available'),
(27, 113, 1, 'Available'),
(27, 114, 1, 'Available'),
(27, 115, 1, 'Available'),
(27, 116, 1, 'Available'),
(27, 117, 1, 'Available'),
(27, 118, 1, 'Available'),
(27, 119, 1, 'Available'),
(27, 120, 1, 'Available'),
(27, 121, 1, 'Available'),
(27, 122, 1, 'Available'),
(27, 123, 1, 'Available'),
(27, 124, 1, 'Available'),
(27, 125, 1, 'Available'),
(27, 126, 1, 'Available'),
(27, 127, 1, 'Available'),
(27, 128, 1, 'Available'),
(27, 129, 1, 'Available'),
(27, 130, 1, 'Available'),
(27, 131, 1, 'Available'),
(27, 132, 1, 'Available'),
(27, 133, 1, 'Available'),
(27, 134, 1, 'Available'),
(27, 135, 1, 'Available'),
(27, 136, 1, 'Available'),
(27, 137, 1, 'Available'),
(27, 138, 1, 'Available'),
(27, 139, 1, 'Available'),
(27, 140, 1, 'Available'),
(27, 141, 1, 'Available'),
(27, 142, 1, 'Available'),
(27, 143, 1, 'Available'),
(27, 144, 1, 'Available'),
(27, 145, 1, 'Available'),
(27, 146, 1, 'Available'),
(27, 147, 1, 'Available'),
(27, 148, 1, 'Available'),
(27, 149, 1, 'Available'),
(27, 150, 1, 'Available'),
(27, 151, 1, 'Available'),
(27, 152, 1, 'Available'),
(27, 153, 1, 'Available'),
(27, 154, 1, 'Available'),
(27, 155, 1, 'Available'),
(27, 156, 1, 'Available'),
(27, 157, 1, 'Available'),
(27, 158, 1, 'Available'),
(27, 159, 1, 'Available'),
(27, 160, 1, 'Available'),
(27, 161, 1, 'Available'),
(27, 162, 1, 'Available'),
(27, 163, 1, 'Available'),
(27, 164, 1, 'Available'),
(27, 165, 1, 'Available'),
(27, 166, 1, 'Available'),
(27, 167, 1, 'Available'),
(27, 168, 1, 'Available'),
(27, 169, 1, 'Available'),
(27, 170, 1, 'Available'),
(27, 171, 1, 'Available'),
(27, 172, 1, 'Available'),
(27, 173, 1, 'Available'),
(27, 174, 1, 'Available'),
(27, 175, 1, 'Available'),
(29, 1, 1, 'Available'),
(29, 2, 1, 'Available'),
(29, 3, 1, 'Available'),
(29, 4, 1, 'Available'),
(29, 5, 1, 'Available'),
(29, 6, 1, 'Available'),
(29, 7, 1, 'Available'),
(29, 8, 1, 'Available'),
(29, 9, 1, 'Available'),
(29, 10, 1, 'Available'),
(29, 11, 1, 'Available'),
(29, 12, 1, 'Available'),
(29, 13, 1, 'Available'),
(29, 14, 1, 'Available'),
(29, 15, 1, 'Available'),
(29, 16, 1, 'Available'),
(29, 17, 1, 'Available'),
(29, 18, 1, 'Available'),
(29, 19, 1, 'Available'),
(29, 20, 1, 'Available'),
(29, 21, 1, 'Available'),
(29, 22, 1, 'Available'),
(29, 23, 1, 'Available'),
(29, 24, 1, 'Available'),
(29, 25, 1, 'Available'),
(29, 26, 1, 'Available'),
(29, 27, 1, 'Available'),
(29, 28, 1, 'Available'),
(29, 29, 1, 'Available'),
(29, 30, 1, 'Available'),
(29, 31, 1, 'Available'),
(29, 32, 1, 'Available'),
(29, 33, 1, 'Available'),
(29, 34, 1, 'Available'),
(29, 35, 1, 'Available'),
(29, 36, 1, 'Available'),
(29, 37, 1, 'Available'),
(29, 38, 1, 'Available'),
(29, 39, 1, 'Available'),
(29, 40, 1, 'Available'),
(29, 41, 1, 'Available'),
(29, 42, 1, 'Available'),
(29, 43, 1, 'Available'),
(29, 44, 1, 'Available'),
(29, 45, 1, 'Available'),
(29, 46, 1, 'Available'),
(29, 47, 1, 'Available'),
(29, 48, 1, 'Available'),
(29, 49, 1, 'Available'),
(29, 50, 1, 'Available'),
(29, 51, 1, 'Available'),
(29, 52, 1, 'Available'),
(29, 53, 1, 'Available'),
(29, 54, 1, 'Available'),
(29, 55, 1, 'Available'),
(29, 56, 1, 'Available'),
(29, 57, 1, 'Available'),
(29, 58, 1, 'Available'),
(29, 59, 1, 'Available'),
(29, 60, 1, 'Available'),
(29, 61, 1, 'Available'),
(29, 62, 1, 'Available'),
(29, 63, 1, 'Available'),
(29, 64, 1, 'Available'),
(29, 65, 1, 'Available'),
(29, 66, 1, 'Available'),
(29, 67, 1, 'Available'),
(29, 68, 1, 'Available'),
(29, 69, 1, 'Available'),
(29, 70, 1, 'Available'),
(29, 71, 1, 'Available'),
(29, 72, 1, 'Available'),
(29, 73, 1, 'Available'),
(29, 74, 1, 'Available'),
(29, 75, 1, 'Available'),
(29, 76, 1, 'Available'),
(29, 77, 1, 'Available'),
(29, 78, 1, 'Available'),
(29, 79, 1, 'Available'),
(29, 80, 1, 'Available'),
(29, 81, 1, 'Available'),
(29, 82, 1, 'Available'),
(29, 83, 1, 'Available'),
(29, 84, 1, 'Available'),
(29, 85, 1, 'Available'),
(29, 86, 1, 'Available'),
(29, 87, 1, 'Available'),
(29, 88, 1, 'Available'),
(29, 89, 1, 'Available'),
(29, 90, 1, 'Available'),
(29, 91, 1, 'Available'),
(29, 92, 1, 'Available'),
(29, 93, 1, 'Available'),
(29, 94, 1, 'Available'),
(29, 95, 1, 'Available'),
(29, 96, 1, 'Available'),
(29, 97, 1, 'Available'),
(29, 98, 1, 'Available'),
(29, 99, 1, 'Available'),
(29, 100, 1, 'Available'),
(29, 101, 1, 'Available'),
(29, 102, 1, 'Available'),
(29, 103, 1, 'Available'),
(29, 104, 1, 'Available'),
(29, 105, 1, 'Available'),
(29, 106, 1, 'Available'),
(29, 107, 1, 'Available'),
(29, 108, 1, 'Available'),
(29, 109, 1, 'Available'),
(29, 110, 1, 'Available'),
(29, 111, 1, 'Available'),
(29, 112, 1, 'Available'),
(29, 113, 1, 'Available'),
(29, 114, 1, 'Available'),
(29, 115, 1, 'Available'),
(29, 116, 1, 'Available'),
(29, 117, 1, 'Available'),
(29, 118, 1, 'Available'),
(29, 119, 1, 'Available'),
(29, 120, 1, 'Available'),
(29, 121, 1, 'Available'),
(29, 122, 1, 'Available'),
(29, 123, 1, 'Available'),
(29, 124, 1, 'Available'),
(29, 125, 1, 'Available'),
(29, 126, 1, 'Available'),
(29, 127, 1, 'Available'),
(29, 128, 1, 'Available'),
(29, 129, 1, 'Available'),
(29, 130, 1, 'Available'),
(29, 131, 1, 'Available'),
(29, 132, 1, 'Available'),
(29, 133, 1, 'Available'),
(29, 134, 1, 'Available'),
(29, 135, 1, 'Available'),
(29, 136, 1, 'Available'),
(29, 137, 1, 'Available'),
(29, 138, 1, 'Available'),
(29, 139, 1, 'Available'),
(29, 140, 1, 'Available'),
(29, 141, 1, 'Available'),
(29, 142, 1, 'Available'),
(29, 143, 1, 'Available'),
(29, 144, 1, 'Available'),
(29, 145, 1, 'Available'),
(29, 146, 1, 'Available'),
(29, 147, 1, 'Available'),
(29, 148, 1, 'Available'),
(29, 149, 1, 'Available'),
(29, 150, 1, 'Available'),
(29, 151, 1, 'Available'),
(29, 152, 1, 'Available'),
(29, 153, 1, 'Available'),
(29, 154, 1, 'Available'),
(29, 155, 1, 'Available'),
(29, 156, 1, 'Available'),
(29, 157, 1, 'Available'),
(29, 158, 1, 'Available'),
(29, 159, 1, 'Available'),
(29, 160, 1, 'Available'),
(29, 161, 1, 'Available'),
(29, 162, 1, 'Available'),
(29, 163, 1, 'Available'),
(29, 164, 1, 'Available'),
(29, 165, 1, 'Available'),
(29, 166, 1, 'Available'),
(29, 167, 1, 'Available'),
(29, 168, 1, 'Available'),
(29, 169, 1, 'Available'),
(29, 170, 1, 'Available'),
(29, 171, 1, 'Available'),
(29, 172, 1, 'Available'),
(29, 173, 1, 'Available'),
(29, 174, 1, 'Available'),
(29, 175, 1, 'Available'),
(30, 1, 1, 'Available'),
(30, 2, 1, 'Available'),
(30, 3, 1, 'Available'),
(30, 4, 1, 'Available'),
(30, 5, 1, 'Available'),
(30, 6, 1, 'Available'),
(30, 7, 1, 'Available'),
(30, 8, 1, 'Available'),
(30, 9, 1, 'Available'),
(30, 10, 1, 'Available'),
(30, 11, 1, 'Available'),
(30, 12, 1, 'Available'),
(30, 13, 1, 'Available'),
(30, 14, 1, 'Available'),
(30, 15, 1, 'Available'),
(30, 16, 1, 'Available'),
(30, 17, 1, 'Available'),
(30, 18, 1, 'Available'),
(30, 19, 1, 'Available'),
(30, 20, 1, 'Available'),
(30, 21, 1, 'Available'),
(30, 22, 1, 'Available'),
(30, 23, 1, 'Available'),
(30, 24, 1, 'Available'),
(30, 25, 1, 'Available'),
(30, 26, 1, 'Available'),
(30, 27, 1, 'Available'),
(30, 28, 1, 'Available'),
(30, 29, 1, 'Available'),
(30, 30, 1, 'Available'),
(30, 31, 1, 'Available'),
(30, 32, 1, 'Available'),
(30, 33, 1, 'Available'),
(30, 34, 1, 'Available'),
(30, 35, 1, 'Available'),
(30, 36, 1, 'Available'),
(30, 37, 1, 'Available'),
(30, 38, 1, 'Available'),
(30, 39, 1, 'Available'),
(30, 40, 1, 'Available'),
(30, 41, 1, 'Available'),
(30, 42, 1, 'Available'),
(30, 43, 1, 'Available'),
(30, 44, 1, 'Available'),
(30, 45, 1, 'Available'),
(30, 46, 1, 'Available'),
(30, 47, 1, 'Available'),
(30, 48, 1, 'Available'),
(30, 49, 1, 'Available'),
(30, 50, 1, 'Available'),
(30, 51, 1, 'Available'),
(30, 52, 1, 'Available'),
(30, 53, 1, 'Available'),
(30, 54, 1, 'Available'),
(30, 55, 1, 'Available'),
(30, 56, 1, 'Available'),
(30, 57, 1, 'Available'),
(30, 58, 1, 'Available'),
(30, 59, 1, 'Available'),
(30, 60, 1, 'Available'),
(30, 61, 1, 'Available'),
(30, 62, 1, 'Available'),
(30, 63, 1, 'Available'),
(30, 64, 1, 'Available'),
(30, 65, 1, 'Available'),
(30, 66, 1, 'Available'),
(30, 67, 1, 'Available'),
(30, 68, 1, 'Available'),
(30, 69, 1, 'Available'),
(30, 70, 1, 'Available'),
(30, 71, 1, 'Available'),
(30, 72, 1, 'Available'),
(30, 73, 1, 'Available'),
(30, 74, 1, 'Available'),
(30, 75, 1, 'Available'),
(30, 76, 1, 'Available'),
(30, 77, 1, 'Available'),
(30, 78, 1, 'Available'),
(30, 79, 1, 'Available'),
(30, 80, 1, 'Available'),
(30, 81, 1, 'Available'),
(30, 82, 1, 'Available'),
(30, 83, 1, 'Available'),
(30, 84, 1, 'Available'),
(30, 85, 1, 'Available'),
(30, 86, 1, 'Available'),
(30, 87, 1, 'Available'),
(30, 88, 1, 'Available'),
(30, 89, 1, 'Available'),
(30, 90, 1, 'Available'),
(30, 91, 1, 'Available'),
(30, 92, 1, 'Available'),
(30, 93, 1, 'Available'),
(30, 94, 1, 'Available'),
(30, 95, 1, 'Available'),
(30, 96, 1, 'Available'),
(30, 97, 1, 'Available'),
(30, 98, 1, 'Available'),
(30, 99, 1, 'Available'),
(30, 100, 1, 'Available'),
(30, 101, 1, 'Available'),
(30, 102, 1, 'Available'),
(30, 103, 1, 'Available'),
(30, 104, 1, 'Available'),
(30, 105, 1, 'Available'),
(30, 106, 1, 'Available'),
(30, 107, 1, 'Available'),
(30, 108, 1, 'Available'),
(30, 109, 1, 'Available'),
(30, 110, 1, 'Available'),
(30, 111, 1, 'Available'),
(30, 112, 1, 'Available'),
(30, 113, 1, 'Available'),
(30, 114, 1, 'Available'),
(30, 115, 1, 'Available'),
(30, 116, 1, 'Available'),
(30, 117, 1, 'Available'),
(30, 118, 1, 'Available'),
(30, 119, 1, 'Available'),
(30, 120, 1, 'Available'),
(30, 121, 1, 'Available'),
(30, 122, 1, 'Available'),
(30, 123, 1, 'Available'),
(30, 124, 1, 'Available'),
(30, 125, 1, 'Available'),
(30, 126, 1, 'Available'),
(30, 127, 1, 'Available'),
(30, 128, 1, 'Available'),
(30, 129, 1, 'Available'),
(30, 130, 1, 'Available'),
(30, 131, 1, 'Available'),
(30, 132, 1, 'Available'),
(30, 133, 1, 'Available'),
(30, 134, 1, 'Available'),
(30, 135, 1, 'Available'),
(30, 136, 1, 'Available'),
(30, 137, 1, 'Available'),
(30, 138, 1, 'Available'),
(30, 139, 1, 'Available'),
(30, 140, 1, 'Available'),
(30, 141, 1, 'Available'),
(30, 142, 1, 'Available'),
(30, 143, 1, 'Available'),
(30, 144, 1, 'Available'),
(30, 145, 1, 'Available'),
(30, 146, 1, 'Available'),
(30, 147, 1, 'Available'),
(30, 148, 1, 'Available'),
(30, 149, 1, 'Available'),
(30, 150, 1, 'Available'),
(30, 151, 1, 'Available'),
(30, 152, 1, 'Available'),
(30, 153, 1, 'Available'),
(30, 154, 1, 'Available'),
(30, 155, 1, 'Available'),
(30, 156, 1, 'Available'),
(30, 157, 1, 'Available'),
(30, 158, 1, 'Available'),
(30, 159, 1, 'Available'),
(30, 160, 1, 'Available'),
(30, 161, 1, 'Available'),
(30, 162, 1, 'Available'),
(30, 163, 1, 'Available'),
(30, 164, 1, 'Available'),
(30, 165, 1, 'Available'),
(30, 166, 1, 'Available'),
(30, 167, 1, 'Available'),
(30, 168, 1, 'Available'),
(30, 169, 1, 'Available'),
(30, 170, 1, 'Available'),
(30, 171, 1, 'Available'),
(30, 172, 1, 'Available'),
(30, 173, 1, 'Available'),
(30, 174, 1, 'Available'),
(30, 175, 1, 'Available'),
(33, 1, 1, 'Available'),
(33, 2, 1, 'Available'),
(33, 3, 1, 'Available'),
(33, 4, 1, 'Available'),
(33, 5, 1, 'Available'),
(33, 6, 1, 'Available'),
(33, 7, 1, 'Available'),
(33, 8, 1, 'Available'),
(33, 9, 1, 'Available'),
(33, 10, 1, 'Available'),
(33, 11, 1, 'Available'),
(33, 12, 1, 'Available'),
(33, 13, 1, 'Available'),
(33, 14, 1, 'Available'),
(33, 15, 1, 'Available'),
(33, 16, 1, 'Available'),
(33, 17, 1, 'Available'),
(33, 18, 1, 'Available'),
(33, 19, 1, 'Available'),
(33, 20, 1, 'Available'),
(33, 21, 1, 'Available'),
(33, 22, 1, 'Available'),
(33, 23, 1, 'Available'),
(33, 24, 1, 'Available'),
(33, 25, 1, 'Available'),
(33, 26, 1, 'Available'),
(33, 27, 1, 'Available'),
(33, 28, 1, 'Available'),
(33, 29, 1, 'Available'),
(33, 30, 1, 'Available'),
(33, 31, 1, 'Available'),
(33, 32, 1, 'Available'),
(33, 33, 1, 'Available'),
(33, 34, 1, 'Available'),
(33, 35, 1, 'Available'),
(33, 36, 1, 'Available'),
(33, 37, 1, 'Available'),
(33, 38, 1, 'Available'),
(33, 39, 1, 'Available'),
(33, 40, 1, 'Available'),
(33, 41, 1, 'Available'),
(33, 42, 1, 'Available'),
(33, 43, 1, 'Available'),
(33, 44, 1, 'Available'),
(33, 45, 1, 'Available'),
(33, 46, 1, 'Available'),
(33, 47, 1, 'Available'),
(33, 48, 1, 'Available'),
(33, 49, 1, 'Available'),
(33, 50, 1, 'Available'),
(33, 51, 1, 'Available'),
(33, 52, 1, 'Available'),
(33, 53, 1, 'Available'),
(33, 54, 1, 'Available'),
(33, 55, 1, 'Available'),
(33, 56, 1, 'Available'),
(33, 57, 1, 'Available'),
(33, 58, 1, 'Available'),
(33, 59, 1, 'Available'),
(33, 60, 1, 'Available'),
(33, 61, 1, 'Available'),
(33, 62, 1, 'Available'),
(33, 63, 1, 'Available'),
(33, 64, 1, 'Available'),
(33, 65, 1, 'Available'),
(33, 66, 1, 'Available'),
(33, 67, 1, 'Available'),
(33, 68, 1, 'Available'),
(33, 69, 1, 'Available'),
(33, 70, 1, 'Available'),
(33, 71, 1, 'Available'),
(33, 72, 1, 'Available'),
(33, 73, 1, 'Available'),
(33, 74, 1, 'Available'),
(33, 75, 1, 'Available'),
(33, 76, 1, 'Available'),
(33, 77, 1, 'Available'),
(33, 78, 1, 'Available'),
(33, 79, 1, 'Available'),
(33, 80, 1, 'Available'),
(33, 81, 1, 'Available'),
(33, 82, 1, 'Available'),
(33, 83, 1, 'Available'),
(33, 84, 1, 'Available'),
(33, 85, 1, 'Available'),
(33, 86, 1, 'Available'),
(33, 87, 1, 'Available'),
(33, 88, 1, 'Available'),
(33, 89, 1, 'Available'),
(33, 90, 1, 'Available'),
(33, 91, 1, 'Available'),
(33, 92, 1, 'Available'),
(33, 93, 1, 'Available'),
(33, 94, 1, 'Available'),
(33, 95, 1, 'Available'),
(33, 96, 1, 'Available'),
(33, 97, 1, 'Available'),
(33, 98, 1, 'Available'),
(33, 99, 1, 'Available'),
(33, 100, 1, 'Available'),
(33, 101, 1, 'Available'),
(33, 102, 1, 'Available'),
(33, 103, 1, 'Available'),
(33, 104, 1, 'Available'),
(33, 105, 1, 'Available'),
(33, 106, 1, 'Available'),
(33, 107, 1, 'Available'),
(33, 108, 1, 'Available'),
(33, 109, 1, 'Available'),
(33, 110, 1, 'Available'),
(33, 111, 1, 'Available'),
(33, 112, 1, 'Available'),
(33, 113, 1, 'Available'),
(33, 114, 1, 'Available'),
(33, 115, 1, 'Available'),
(33, 116, 1, 'Available'),
(33, 117, 1, 'Available'),
(33, 118, 1, 'Available'),
(33, 119, 1, 'Available'),
(33, 120, 1, 'Available'),
(33, 121, 1, 'Available'),
(33, 122, 1, 'Available'),
(33, 123, 1, 'Available'),
(33, 124, 1, 'Available'),
(33, 125, 1, 'Available'),
(33, 126, 1, 'Available'),
(33, 127, 1, 'Available'),
(33, 128, 1, 'Available'),
(33, 129, 1, 'Available'),
(33, 130, 1, 'Available'),
(33, 131, 1, 'Available'),
(33, 132, 1, 'Available'),
(33, 133, 1, 'Available'),
(33, 134, 1, 'Available'),
(33, 135, 1, 'Available'),
(33, 136, 1, 'Available'),
(33, 137, 1, 'Available'),
(33, 138, 1, 'Available'),
(33, 139, 1, 'Available'),
(33, 140, 1, 'Available'),
(33, 141, 1, 'Available'),
(33, 142, 1, 'Available'),
(33, 143, 1, 'Available'),
(33, 144, 1, 'Available'),
(33, 145, 1, 'Available'),
(33, 146, 1, 'Available'),
(33, 147, 1, 'Available'),
(33, 148, 1, 'Available'),
(33, 149, 1, 'Available'),
(33, 150, 1, 'Available'),
(33, 151, 1, 'Available'),
(33, 152, 1, 'Available'),
(33, 153, 1, 'Available'),
(33, 154, 1, 'Available'),
(33, 155, 1, 'Available'),
(33, 156, 1, 'Available'),
(33, 157, 1, 'Available'),
(33, 158, 1, 'Available'),
(33, 159, 1, 'Available'),
(33, 160, 1, 'Available'),
(33, 161, 1, 'Available'),
(33, 162, 1, 'Available'),
(33, 163, 1, 'Available'),
(33, 164, 1, 'Available'),
(33, 165, 1, 'Available'),
(33, 166, 1, 'Available'),
(33, 167, 1, 'Available'),
(33, 168, 1, 'Available'),
(33, 169, 1, 'Available'),
(33, 170, 1, 'Available'),
(33, 171, 1, 'Available'),
(33, 172, 1, 'Available'),
(33, 173, 1, 'Available'),
(33, 174, 1, 'Available'),
(33, 175, 1, 'Available'),
(40, 1, 1, 'Available'),
(40, 2, 1, 'Available'),
(40, 3, 1, 'Available'),
(40, 4, 1, 'Available'),
(40, 5, 1, 'Available'),
(40, 6, 1, 'Available'),
(40, 7, 1, 'Available'),
(40, 8, 1, 'Available'),
(40, 9, 1, 'Available'),
(40, 10, 1, 'Available'),
(40, 11, 1, 'Available'),
(40, 12, 1, 'Available'),
(40, 13, 1, 'Available'),
(40, 14, 1, 'Available'),
(40, 15, 1, 'Available'),
(40, 16, 1, 'Available'),
(40, 17, 1, 'Available'),
(40, 18, 1, 'Available'),
(40, 19, 1, 'Available'),
(40, 20, 1, 'Available'),
(40, 21, 1, 'Available'),
(40, 22, 1, 'Available'),
(40, 23, 1, 'Available'),
(40, 24, 1, 'Available'),
(40, 25, 1, 'Available'),
(40, 26, 1, 'Available'),
(40, 27, 1, 'Available'),
(40, 28, 1, 'Available'),
(40, 29, 1, 'Available'),
(40, 30, 1, 'Available'),
(40, 31, 1, 'Available'),
(40, 32, 1, 'Available'),
(40, 33, 1, 'Available'),
(40, 34, 1, 'Available'),
(40, 35, 1, 'Available'),
(40, 36, 1, 'Available'),
(40, 37, 1, 'Available'),
(40, 38, 1, 'Available'),
(40, 39, 1, 'Available'),
(40, 40, 1, 'Available'),
(40, 41, 1, 'Available'),
(40, 42, 1, 'Available'),
(40, 43, 1, 'Available'),
(40, 44, 1, 'Available'),
(40, 45, 1, 'Available'),
(40, 46, 1, 'Available'),
(40, 47, 1, 'Available'),
(40, 48, 1, 'Available'),
(40, 49, 1, 'Available'),
(40, 50, 1, 'Available'),
(40, 51, 1, 'Available'),
(40, 52, 1, 'Available'),
(40, 53, 1, 'Available'),
(40, 54, 1, 'Available'),
(40, 55, 1, 'Available'),
(40, 56, 1, 'Available'),
(40, 57, 1, 'Available'),
(40, 58, 1, 'Available'),
(40, 59, 1, 'Available'),
(40, 60, 1, 'Available'),
(40, 61, 1, 'Available'),
(40, 62, 1, 'Available'),
(40, 63, 1, 'Available'),
(40, 64, 1, 'Available'),
(40, 65, 1, 'Available'),
(40, 66, 1, 'Available'),
(40, 67, 1, 'Available'),
(40, 68, 1, 'Available'),
(40, 69, 1, 'Available'),
(40, 70, 1, 'Available'),
(40, 71, 1, 'Available'),
(40, 72, 1, 'Available'),
(40, 73, 1, 'Available'),
(40, 74, 1, 'Available'),
(40, 75, 1, 'Available'),
(40, 76, 1, 'Available'),
(40, 77, 1, 'Available'),
(40, 78, 1, 'Available'),
(40, 79, 1, 'Available'),
(40, 80, 1, 'Available'),
(40, 81, 1, 'Available'),
(40, 82, 1, 'Available'),
(40, 83, 1, 'Available'),
(40, 84, 1, 'Available'),
(40, 85, 1, 'Available'),
(40, 86, 1, 'Available'),
(40, 87, 1, 'Available'),
(40, 88, 1, 'Available'),
(40, 89, 1, 'Available'),
(40, 90, 1, 'Available'),
(40, 91, 1, 'Available'),
(40, 92, 1, 'Available'),
(40, 93, 1, 'Available'),
(40, 94, 1, 'Available'),
(40, 95, 1, 'Available'),
(40, 96, 1, 'Available'),
(40, 97, 1, 'Available'),
(40, 98, 1, 'Available'),
(40, 99, 1, 'Available'),
(40, 100, 1, 'Available'),
(40, 101, 1, 'Available'),
(40, 102, 1, 'Available'),
(40, 103, 1, 'Available'),
(40, 104, 1, 'Available'),
(40, 105, 1, 'Available'),
(40, 106, 1, 'Available'),
(40, 107, 1, 'Available'),
(40, 108, 1, 'Available'),
(40, 109, 1, 'Available'),
(40, 110, 1, 'Available'),
(40, 111, 1, 'Available'),
(40, 112, 1, 'Available'),
(40, 113, 1, 'Available'),
(40, 114, 1, 'Available'),
(40, 115, 1, 'Available'),
(40, 116, 1, 'Available'),
(40, 117, 1, 'Available'),
(40, 118, 1, 'Available'),
(40, 119, 1, 'Available'),
(40, 120, 1, 'Available'),
(40, 121, 1, 'Available'),
(40, 122, 1, 'Available'),
(40, 123, 1, 'Available'),
(40, 124, 1, 'Available'),
(40, 125, 1, 'Available'),
(40, 126, 1, 'Available'),
(40, 127, 1, 'Available'),
(40, 128, 1, 'Available'),
(40, 129, 1, 'Available'),
(40, 130, 1, 'Available'),
(40, 131, 1, 'Available'),
(40, 132, 1, 'Available'),
(40, 133, 1, 'Available'),
(40, 134, 1, 'Available'),
(40, 135, 1, 'Available'),
(40, 136, 1, 'Available'),
(40, 137, 1, 'Available'),
(40, 138, 1, 'Available'),
(40, 139, 1, 'Available'),
(40, 140, 1, 'Available'),
(40, 141, 1, 'Available'),
(40, 142, 1, 'Available'),
(40, 143, 1, 'Available'),
(40, 144, 1, 'Available'),
(40, 145, 1, 'Available'),
(40, 146, 1, 'Available'),
(40, 147, 1, 'Available'),
(40, 148, 1, 'Available'),
(40, 149, 1, 'Available'),
(40, 150, 1, 'Available'),
(40, 151, 1, 'Available'),
(40, 152, 1, 'Available'),
(40, 153, 1, 'Available'),
(40, 154, 1, 'Available'),
(40, 155, 1, 'Available'),
(40, 156, 1, 'Available'),
(40, 157, 1, 'Available'),
(40, 158, 1, 'Available'),
(40, 159, 1, 'Available'),
(40, 160, 1, 'Available'),
(40, 161, 1, 'Available'),
(40, 162, 1, 'Available'),
(40, 163, 1, 'Available'),
(40, 164, 1, 'Available'),
(40, 165, 1, 'Available'),
(40, 166, 1, 'Available'),
(40, 167, 1, 'Available'),
(40, 168, 1, 'Available'),
(40, 169, 1, 'Available'),
(40, 170, 1, 'Available'),
(40, 171, 1, 'Available'),
(40, 172, 1, 'Available'),
(40, 173, 1, 'Available'),
(40, 174, 1, 'Available'),
(40, 175, 1, 'Available');

--
-- Triggers `seat`
--
DELIMITER $$
CREATE TRIGGER `before_seat_insert` BEFORE INSERT ON `seat` FOR EACH ROW BEGIN
  declare msg1 varchar(128);
  
  IF new.scheduler_id<=0 THEN
    set msg1 = "Invalid scheduler_id";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  IF new.seat_no<=0 THEN
    set msg1 = "Invalid seat_no";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  IF new.ticket_no<=0 THEN
    set msg1 = "Invalid ticket_no";
    signal sqlstate '45000' set message_text = msg1;
  end if;
  
  
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(8) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_name`, `password`) VALUES
('a-1', 'admin', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220'),
('u-18', 'dulaj', 'dulaj'),
('u-19', 'dulaj', 'dulaj'),
('u-20', 'akibaba', '824b2ed3215169a5a4a558dc8e05e86f49bbb2cd'),
('u-567', 'user_name', 'password');

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `before_user_insert` BEFORE INSERT ON `user` FOR EACH ROW BEGIN
  declare msg varchar(128);
  declare passwordtemp varchar(40);
  declare userlist varchar(40);
  IF length(trim(new.id)) = 0 THEN
  set msg = "Invalid id";
    signal sqlstate '45000' set message_text = msg;
  end if;
  IF length(trim(new.password)) = 0 THEN
  set msg = "Invalid password";
    signal sqlstate '45000' set message_text = msg;
  ELSE
    set passwordtemp = sha1(new.password);
    set new.password = passwordtemp;
  end if;
  
  IF new.user_name REGEXP '[^a-zA-Z]+$' or length(trim(new.user_name)) = 0 THEN
  set msg = "Invalid user_name";
    signal sqlstate '45000' set message_text = msg;
  end if;
  select user_name into userlist from user where user_name=new.user_name limit 1;
  IF not length(userlist)=0 THEN
  set msg = "Invalid user_name";
    signal sqlstate '45000' set message_text = msg;
  end if;
  
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `flightview`
--
DROP TABLE IF EXISTS `flightview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `flightview`  AS  select `flight`.`flight_id` AS `flight_id`,`flight`.`flight_day` AS `flight_day`,`flight`.`flight_time` AS `flight_time`,`flight`.`route_id` AS `route_id` from `flight` ;

-- --------------------------------------------------------

--
-- Structure for view `passengercount`
--
DROP TABLE IF EXISTS `passengercount`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `passengercount`  AS  select `seat`.`scheduler_id` AS `scheduler_id`,count(0) AS `count(*)` from `seat` where (`seat`.`state` = 'Booked') group by `seat`.`scheduler_id` ;

-- --------------------------------------------------------

--
-- Structure for view `passenger_destination`
--
DROP TABLE IF EXISTS `passenger_destination`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `passenger_destination`  AS  select `booking`.`booking_id` AS `booking_Id`,`booking`.`scheduler_id` AS `scheduler_id`,`flight_scheduler`.`flight_date` AS `flight_date` from (`booking` join `flight_scheduler`) where (`booking`.`scheduler_id` = `flight_scheduler`.`scheduler_id`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aeroplane_type`
--
ALTER TABLE `aeroplane_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`airport_code`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `FK_customer` (`id`),
  ADD KEY `FK_scheduler` (`scheduler_id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_type`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_package` (`package_type`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`flight_id`),
  ADD KEY `FK_route` (`route_id`);

--
-- Indexes for table `flight_scheduler`
--
ALTER TABLE `flight_scheduler`
  ADD PRIMARY KEY (`scheduler_id`),
  ADD KEY `FK_flight` (`flight_id`),
  ADD KEY `FK_plane` (`plane_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_type`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`ticket_no`),
  ADD KEY `FK_booking` (`booking_id`),
  ADD KEY `FK_class` (`class_type`);

--
-- Indexes for table `plane`
--
ALTER TABLE `plane`
  ADD PRIMARY KEY (`plane_id`),
  ADD KEY `FK_plane_type` (`type_id`);

--
-- Indexes for table `revenue`
--
ALTER TABLE `revenue`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `FK_flight_from` (`flight_from`),
  ADD KEY `FK_flight_to` (`flight_to`);

--
-- Indexes for table `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`scheduler_id`,`seat_no`),
  ADD KEY `seatindex` (`scheduler_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `flight_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `ticket_no` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `FK_customer` FOREIGN KEY (`id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_scheduler` FOREIGN KEY (`scheduler_id`) REFERENCES `flight_scheduler` (`scheduler_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK_package` FOREIGN KEY (`package_type`) REFERENCES `package` (`package_type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `FK_route` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flight_scheduler`
--
ALTER TABLE `flight_scheduler`
  ADD CONSTRAINT `FK_flight` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_plane` FOREIGN KEY (`plane_id`) REFERENCES `plane` (`plane_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_planes` FOREIGN KEY (`plane_id`) REFERENCES `plane` (`plane_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `passenger`
--
ALTER TABLE `passenger`
  ADD CONSTRAINT `FK_booking` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_class` FOREIGN KEY (`class_type`) REFERENCES `class` (`class_type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `plane`
--
ALTER TABLE `plane`
  ADD CONSTRAINT `FK_plane_type` FOREIGN KEY (`type_id`) REFERENCES `aeroplane_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `FK_flight_from` FOREIGN KEY (`flight_from`) REFERENCES `airport` (`airport_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_flight_to` FOREIGN KEY (`flight_to`) REFERENCES `airport` (`airport_code`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
