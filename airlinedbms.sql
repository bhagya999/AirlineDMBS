-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2018 at 02:54 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `aeroplane_type`
--
CREATE TABLE `admin` (
  `admin_id` int(6) NOT NULL,
  `username` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


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
  `customer_id` int(6) NOT NULL,
  `scheduler_id` int(6) NOT NULL,
  `payment` double NOT NULL,
  `booked_time` datetime NOT NULL,
  `no_of_seats` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `customer_id`, `scheduler_id`, `payment`, `booked_time`, `no_of_seats`) VALUES
(1, 4, 8, 50000, '2018-11-06 23:00:00', 2),
(2, 1, 10, 45000, '2018-11-06 23:00:00', 1),
(3, 6, 12, 55000, '2018-11-06 23:00:00', 1),
(4, 2, 16, 90000, '2018-11-06 23:00:00', 4),
(6, 6, 2, 40000, '2018-11-12 12:00:00', 1),
(7, 6, 2, 40000, '2018-11-12 12:00:00', 1),
(8, 5, 1, 90000, '2018-11-12 12:00:00', 1),
(9, 4, 21, 38500, '2018-11-12 12:00:00', 1),
(10, 5, 21, 38500, '2018-11-12 12:00:00', 1),
(11, 4, 21, 38500, '2018-11-12 12:00:00', 1);

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
  `customer_id` int(6) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `package_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `address`, `email`, `user_name`, `password`, `package_type`) VALUES
(1, 'CustomerFirst1', 'CustomerLast1', 'CustomerAddress1', 'customer1@example.com', 'customerUser1', 'password', 'Frequent'),
(2, 'CustomerFirst2', 'CustomerLast2', 'CustomerAddress2', 'customer2@example.com', 'customerUser2', 'password', 'Gold'),
(3, 'CustomerFirst3', 'CustomerLast3', 'CustomerAddress3', 'customer3@example.com', 'customerUser3', 'password', 'Gold'),
(4, 'CustomerFirst4', 'CustomerLast4', 'CustomerAddress4', 'customer4@example.com', 'customerUser4', 'password', 'Frequent'),
(5, 'CustomerFirst5', 'CustomerLast5', 'CustomerAddress5', 'customer5@example.com', 'customerUser5', 'password', 'Guest'),
(6, 'CustomerFirst6', 'CustomerLast6', 'CustomerAddress6', 'customer6@example.com', 'customerUser6', 'password', 'Guest'),
(7, 'Ravindu', 'Nuradha', '117/1,Maharagama.', 'nuradhamunasinghe@gmail.com', 'nuradha', '123456', 'Gold'),
(197, '1', 'Sh', '19/2', 'b@1.com', 'b9', '123', 'GOLD'),
(198, 'bhagya', 'Sh', '19/2', 'b@1.com', 'b9', '123', 'GOLD'),
(199, '1', 'sh', '19/2', 'b@1.com', 'b9', '123', 'GOLD'),
(201, 'bhagya', 'sh', '19/2', 'b@1.com', 'b9', '123', 'GOLD'),
(203, '1g', 'sh', '19/2', 'b@1.com', 'b9', '123', 'GOLD'),
(204, '1', 'sh', '19/2', 'b@1.com', 'b9', '123', 'GOLD'),
(299, '1', 'sh', '19/2', 'b@1.com', 'b9', '123', 'GOLD'),
(300, '1', 'sh', '19/2', 'b@1.com', 'b9', '123', 'GOLD'),
(1456, '1df', 'sh', '19/2', 'b@1.com', 'b', '6116afedcb0bc31083935c1c262ff4c9', 'GOLD');

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `before_customer_insert` BEFORE INSERT ON `customer` FOR EACH ROW BEGIN
	declare msg varchar(128);
  declare passwordtemp varchar(40);
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
  IF new.user_name  REGEXP '[^a-zA-Z]+$' or length(trim(new.user_name)) = 0 THEN
  set msg = "Invalid user_name";
    signal sqlstate '45000' set message_text = msg;
  end if;
  IF length(trim(new.password)) = 0 THEN
  set msg = "Invalid password";
    signal sqlstate '45000' set message_text = msg;
  ELSE 
    set passwordtemp = md5(sha1(new.password));
    set new.password = passwordtemp;
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
(21, 12, '0000-00-00', 'Not Delayed', '6'),
(100, 10, '2018-11-30', 'Not Delayed', '3');

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
  IF new.flight_date <=dt THEN
    set msg1 = "Invalid flight_date";
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
  `passport_id` varchar(10) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `seat_no` int(3) NOT NULL,
  `booking_id` int(6) NOT NULL,
  `class_type` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


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

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `route_id` int(6) NOT NULL,
  `flight_from` varchar(3) NOT NULL,
  `flight_to` varchar(3) NOT NULL,
  `distance(km)` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`route_id`, `flight_from`, `flight_to`, `distance(km)`) VALUES
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
(21, 3, 0, 'Available'),
(21, 4, 0, 'Available'),
(21, 5, 0, 'Available'),
(21, 6, 0, 'Available'),
(21, 7, 0, 'Available'),
(21, 8, 0, 'Booked'),
(21, 9, 0, 'Available'),
(21, 10, 0, 'Available'),
(21, 11, 0, 'Available'),
(21, 12, 0, 'Available'),
(21, 13, 0, 'Available'),
(21, 14, 0, 'Available'),
(21, 15, 0, 'Available'),
(21, 16, 0, 'Available'),
(21, 17, 0, 'Available'),
(21, 18, 0, 'Available'),
(21, 19, 0, 'Available'),
(21, 20, 0, 'Available'),
(21, 21, 0, 'Available'),
(21, 22, 0, 'Available'),
(21, 23, 0, 'Available'),
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
(21, 215, 0, 'Available');

--
-- Indexes for dumped tables
--

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
  ADD KEY `FK_customer` (`customer_id`),
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
  ADD PRIMARY KEY (`customer_id`),
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
  ADD PRIMARY KEY (`scheduler_id`,`seat_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `flight_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `FK_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
