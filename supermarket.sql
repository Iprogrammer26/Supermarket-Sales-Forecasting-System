-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 28, 2023 at 09:05 AM
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
-- Database: `supermarket`
--

-- --------------------------------------------------------

--
-- Table structure for table `forecast`
--

CREATE TABLE `forecast` (
  `forecast_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `Date` datetime(6) NOT NULL,
  `predicted_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `available_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `price`, `available_quantity`) VALUES
(1, 'Apple', 1200, 2300),
(2, 'Banana', 500, 1000),
(3, 'Orange', 1800, 750),
(4, 'Milk', 2900, 200),
(5, 'Bread', 2500, 80);

-- --------------------------------------------------------

--
-- Table structure for table `salesdata`
--

CREATE TABLE `salesdata` (
  `salesdata_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  `sales` int(11) DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `profit` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salesdata`
--

INSERT INTO `salesdata` (`salesdata_id`, `product_id`, `category`, `subcategory`, `orderDate`, `sales`, `discount`, `quantity`, `profit`) VALUES
(1, 1, 'Oil & Masala', 'Masalas', '2017-11-08', 1254, 0.12, 0, 401.28),
(2, 2, 'Beverages', 'Health Drinks', '2017-11-08', 749, 0.18, 0, 149.8),
(3, 3, 'Food Grains', 'Atta & Flour', '2017-06-12', 2360, 0.21, 0, 165.2),
(4, 4, 'Fruits & Veggies', 'Fresh Vegetables', '2016-10-11', 896, 0.25, 0, 89.6),
(5, 5, 'Food Grains', 'Organic Staples', '2016-10-11', 2355, 0.26, 0, 918.45),
(6, 5, 'Food Grains', 'Organic Staples', '2015-06-09', 2305, 0.26, 0, 322.7),
(7, 4, 'Fruits & Veggies', 'Fresh Vegetables', '2015-06-09', 826, 0.33, 0, 346.92),
(8, 6, 'Fruits & Veggies', 'Fresh Fruits', '2015-06-09', 1847, 0.32, 0, 147.76),
(9, 7, 'Bakery', 'Biscuits', '2015-06-09', 791, 0.23, 0, 181.93),
(10, 8, 'Bakery', 'Cakes', '2015-06-09', 1795, 0.27, 0, 484.65),
(11, 9, 'Snacks', 'Chocolates', '2015-06-09', 1903, 0.13, 0, 437.69),
(12, 10, 'Eggs, Meat & Fish', 'Eggs', '2015-06-09', 701, 0.1, 0, 308.44),
(13, 11, 'Snacks', 'Cookies', '2018-04-15', 1659, 0.19, 0, 315.21),
(14, 4, 'Fruits & Veggies', 'Fresh Vegetables', '2017-12-05', 1277, 0.25, 0, 63.85),
(15, 12, 'Eggs, Meat & Fish', 'Chicken', '2016-11-22', 831, 0.22, 0, 207.75),
(16, 13, 'Oil & Masala', 'Edible Oil & Ghee', '2016-11-22', 1440, 0.11, 0, 100.8),
(17, 8, 'Bakery', 'Cakes', '2015-11-11', 1678, 0.28, 0, 318.82),
(18, 2, 'Beverages', 'Health Drinks', '2015-05-13', 1617, 0.19, 0, 113.19),
(19, 14, 'Eggs, Meat & Fish', 'Mutton', '2015-08-27', 1757, 0.35, 0, 386.54),
(20, 15, 'Beverages', 'Soft Drinks', '2015-08-27', 692, 0.29, 0, 159.16),
(21, 2, 'Beverages', 'Health Drinks', '2015-08-27', 522, 0.19, 0, 208.8),
(22, 16, 'Food Grains', 'Dals & Pulses', '2017-12-09', 948, 0.13, 0, 47.4),
(23, 15, 'Beverages', 'Soft Drinks', '2017-12-09', 707, 0.34, 0, 148.47),
(24, 17, 'Fruits & Veggies', 'Organic Vegetables', '2018-07-16', 969, 0.29, 0, 77.52),
(25, 10, 'Eggs, Meat & Fish', 'Eggs', '2016-09-25', 1100, 0.11, 0, 495),
(26, 9, 'Snacks', 'Chocolates', '2017-01-16', 2022, 0.11, 0, 202.2),
(27, 11, 'Snacks', 'Cookies', '2017-01-16', 541, 0.12, 0, 43.28),
(28, 7, 'Bakery', 'Biscuits', '2016-09-17', 979, 0.22, 0, 401.39),
(29, 15, 'Beverages', 'Soft Drinks', '2016-09-17', 1988, 0.22, 0, 874.72),
(30, 1, 'Oil & Masala', 'Masalas', '2016-09-17', 989, 0.17, 0, 69.23),
(31, 15, 'Beverages', 'Soft Drinks', '2016-09-17', 1845, 0.24, 0, 166.05),
(32, 18, 'Snacks', 'Noodles', '2016-09-17', 1400, 0.11, 0, 420),
(33, 13, 'Oil & Masala', 'Edible Oil & Ghee', '2016-09-17', 2163, 0.26, 0, 670.53),
(34, 1, 'Oil & Masala', 'Masalas', '2016-09-17', 1689, 0.34, 0, 337.8),
(35, 2, 'Beverages', 'Health Drinks', '2018-10-19', 809, 0.32, 0, 80.9),
(36, 10, 'Eggs, Meat & Fish', 'Eggs', '2017-12-08', 1265, 0.22, 0, 569.25),
(37, 15, 'Beverages', 'Soft Drinks', '2017-12-08', 934, 0.35, 0, 56.04),
(38, 17, 'Fruits & Veggies', 'Organic Vegetables', '2016-12-27', 1354, 0.16, 0, 446.82),
(39, 6, 'Fruits & Veggies', 'Fresh Fruits', '2016-12-27', 1751, 0.19, 0, 280.16),
(40, 12, 'Eggs, Meat & Fish', 'Chicken', '2016-12-27', 2045, 0.23, 0, 879.35),
(41, 2, 'Beverages', 'Health Drinks', '2016-12-27', 660, 0.19, 0, 92.4),
(42, 15, 'Beverages', 'Soft Drinks', '2018-09-10', 1868, 0.18, 0, 616.44),
(43, 11, 'Snacks', 'Cookies', '2017-07-17', 1017, 0.25, 0, 345.78),
(44, 11, 'Snacks', 'Cookies', '2018-09-19', 2311, 0.2, 0, 1039.95),
(45, 7, 'Bakery', 'Biscuits', '2017-03-11', 1663, 0.17, 0, 731.72),
(46, 10, 'Eggs, Meat & Fish', 'Eggs', '2017-03-11', 1420, 0.19, 0, 355),
(47, 17, 'Fruits & Veggies', 'Organic Vegetables', '2015-10-20', 1415, 0.31, 0, 509.4),
(48, 18, 'Snacks', 'Noodles', '2017-06-20', 1488, 0.3, 0, 610.08),
(49, 18, 'Snacks', 'Noodles', '2017-06-20', 726, 0.18, 0, 43.56),
(50, 8, 'Bakery', 'Cakes', '2016-04-18', 1259, 0.15, 0, 415.47),
(51, 15, 'Beverages', 'Soft Drinks', '2016-04-18', 902, 0.29, 0, 153.34),
(52, 15, 'Beverages', 'Soft Drinks', '2016-04-18', 2306, 0.3, 0, 553.44),
(53, 8, 'Bakery', 'Cakes', '2016-04-18', 1417, 0.19, 0, 99.19),
(54, 4, 'Fruits & Veggies', 'Fresh Vegetables', '2017-12-11', 627, 0.33, 0, 181.83),
(55, 19, 'Fruits & Veggies', 'Organic Fruits', '2017-12-11', 760, 0.28, 0, 60.8),
(56, 3, 'Food Grains', 'Atta & Flour', '2017-06-17', 2350, 0.15, 0, 611),
(57, 20, 'Eggs, Meat & Fish', 'Fish', '2017-06-17', 1179, 0.34, 0, 271.17),
(58, 16, 'Food Grains', 'Dals & Pulses', '2017-06-17', 1624, 0.35, 0, 194.88),
(59, 14, 'Eggs, Meat & Fish', 'Mutton', '2017-06-17', 1316, 0.35, 0, 421.12),
(60, 2, 'Beverages', 'Health Drinks', '2017-06-17', 2121, 0.12, 0, 678.72),
(61, 1, 'Oil & Masala', 'Masalas', '2017-06-17', 1428, 0.28, 0, 271.32),
(62, 18, 'Snacks', 'Noodles', '2017-06-17', 706, 0.33, 0, 289.46),
(63, 20, 'Eggs, Meat & Fish', 'Fish', '2016-11-24', 921, 0.25, 0, 184.2),
(64, 6, 'Fruits & Veggies', 'Fresh Fruits', '2016-11-24', 1741, 0.31, 0, 661.58),
(65, 10, 'Eggs, Meat & Fish', 'Eggs', '2016-11-24', 607, 0.22, 0, 200.31),
(66, 14, 'Eggs, Meat & Fish', 'Mutton', '2016-11-24', 1824, 0.25, 0, 766.08),
(67, 3, 'Food Grains', 'Atta & Flour', '2016-04-30', 1368, 0.11, 0, 383.04),
(68, 4, 'Fruits & Veggies', 'Fresh Vegetables', '2015-12-05', 1160, 0.16, 0, 510.4),
(69, 3, 'Food Grains', 'Atta & Flour', '2015-12-05', 1294, 0.23, 0, 77.64),
(70, 1, 'Oil & Masala', 'Masalas', '2017-06-04', 1232, 0.14, 0, 554.4),
(71, 14, 'Eggs, Meat & Fish', 'Mutton', '2017-09-18', 994, 0.31, 0, 357.84),
(72, 18, 'Snacks', 'Noodles', '2018-09-14', 2468, 0.18, 0, 1011.88),
(73, 11, 'Snacks', 'Cookies', '2016-04-26', 721, 0.27, 0, 100.94),
(74, 17, 'Fruits & Veggies', 'Organic Vegetables', '2016-04-26', 2375, 0.21, 0, 475),
(75, 15, 'Beverages', 'Soft Drinks', '2016-04-26', 1965, 0.13, 0, 117.9),
(76, 15, 'Beverages', 'Soft Drinks', '2018-12-09', 1489, 0.12, 0, 193.57),
(77, 19, 'Fruits & Veggies', 'Organic Fruits', '2018-12-09', 1250, 0.27, 0, 75),
(78, 18, 'Snacks', 'Noodles', '2018-12-09', 1358, 0.31, 0, 488.88),
(79, 11, 'Snacks', 'Cookies', '2015-11-26', 719, 0.2, 0, 64.71),
(80, 19, 'Fruits & Veggies', 'Organic Fruits', '2017-06-12', 2303, 0.26, 0, 621.81),
(81, 2, 'Beverages', 'Health Drinks', '2017-06-12', 2027, 0.34, 0, 912.15),
(82, 3, 'Food Grains', 'Atta & Flour', '2015-10-12', 1739, 0.29, 0, 765.16),
(83, 21, 'Oil & Masala', 'Spices', '2015-10-12', 990, 0.26, 0, 227.7),
(84, 15, 'Beverages', 'Soft Drinks', '2016-09-03', 2354, 0.11, 0, 682.66),
(85, 19, 'Fruits & Veggies', 'Organic Fruits', '2018-11-13', 1044, 0.1, 0, 344.52),
(86, 21, 'Oil & Masala', 'Spices', '2018-05-28', 2129, 0.25, 0, 659.99),
(87, 22, 'Food Grains', 'Rice', '2018-10-26', 1759, 0.1, 0, 615.65),
(88, 10, 'Eggs, Meat & Fish', 'Eggs', '2018-10-26', 1663, 0.26, 0, 665.2),
(89, 23, 'Bakery', 'Breads & Buns', '2017-04-05', 2111, 0.21, 0, 189.99),
(90, 16, 'Food Grains', 'Dals & Pulses', '2017-09-17', 1878, 0.12, 0, 450.72),
(91, 12, 'Eggs, Meat & Fish', 'Chicken', '2017-09-17', 769, 0.34, 0, 46.14),
(92, 2, 'Beverages', 'Health Drinks', '2017-09-17', 1241, 0.14, 0, 409.53),
(93, 3, 'Food Grains', 'Atta & Flour', '2016-01-31', 2128, 0.14, 0, 383.04),
(94, 6, 'Fruits & Veggies', 'Fresh Fruits', '2016-01-31', 2257, 0.33, 0, 270.84),
(95, 9, 'Snacks', 'Chocolates', '2016-01-31', 1285, 0.28, 0, 218.45),
(96, 20, 'Eggs, Meat & Fish', 'Fish', '2018-11-06', 1230, 0.13, 0, 442.8),
(97, 3, 'Food Grains', 'Atta & Flour', '2018-11-09', 1856, 0.21, 0, 723.84),
(98, 6, 'Fruits & Veggies', 'Fresh Fruits', '2018-06-17', 545, 0.31, 0, 125.35),
(99, 9, 'Snacks', 'Chocolates', '2017-09-06', 2301, 0.28, 0, 391.17),
(100, 21, 'Oil & Masala', 'Spices', '2017-08-29', 1475, 0.26, 0, 531),
(101, 8, 'Bakery', 'Cakes', '2017-08-29', 2118, 0.35, 0, 910.74),
(102, 15, 'Beverages', 'Soft Drinks', '2017-08-29', 1527, 0.17, 0, 671.88),
(103, 9, 'Snacks', 'Chocolates', '2017-12-01', 567, 0.18, 0, 175.77),
(104, 6, 'Fruits & Veggies', 'Fresh Fruits', '2016-11-13', 969, 0.27, 0, 184.11),
(105, 16, 'Food Grains', 'Dals & Pulses', '2016-11-13', 2300, 0.14, 0, 1035),
(106, 1, 'Oil & Masala', 'Masalas', '2016-11-13', 1575, 0.33, 0, 78.75),
(107, 2, 'Beverages', 'Health Drinks', '2018-11-23', 540, 0.12, 0, 108),
(108, 11, 'Snacks', 'Cookies', '2018-11-23', 536, 0.34, 0, 176.88),
(109, 10, 'Eggs, Meat & Fish', 'Eggs', '2018-11-23', 556, 0.21, 0, 155.68),
(110, 6, 'Fruits & Veggies', 'Fresh Fruits', '2016-10-15', 1179, 0.16, 0, 271.17),
(111, 16, 'Food Grains', 'Dals & Pulses', '2018-12-25', 1487, 0.12, 0, 505.58),
(112, 23, 'Bakery', 'Breads & Buns', '2017-11-03', 2220, 0.1, 0, 111),
(113, 13, 'Oil & Masala', 'Edible Oil & Ghee', '2017-11-03', 2155, 0.3, 0, 581.85),
(114, 4, 'Fruits & Veggies', 'Fresh Vegetables', '2015-08-25', 1154, 0.1, 0, 69.24),
(115, 18, 'Snacks', 'Noodles', '2015-08-25', 2420, 0.11, 0, 242),
(116, 9, 'Snacks', 'Chocolates', '2015-08-25', 1305, 0.24, 0, 287.1),
(117, 19, 'Fruits & Veggies', 'Organic Fruits', '2015-08-25', 927, 0.2, 0, 157.59),
(118, 17, 'Fruits & Veggies', 'Organic Vegetables', '2016-03-02', 983, 0.11, 0, 186.77),
(119, 22, 'Food Grains', 'Rice', '2016-04-05', 903, 0.1, 0, 90.3),
(120, 12, 'Eggs, Meat & Fish', 'Chicken', '2017-06-12', 1235, 0.12, 0, 74.1),
(121, 17, 'Fruits & Veggies', 'Organic Vegetables', '2017-06-12', 1243, 0.24, 0, 174.02),
(122, 8, 'Bakery', 'Cakes', '2017-06-12', 649, 0.34, 0, 201.19),
(123, 14, 'Eggs, Meat & Fish', 'Mutton', '2017-06-12', 2354, 0.11, 0, 188.32),
(124, 15, 'Beverages', 'Soft Drinks', '2017-06-12', 1443, 0.27, 0, 187.59),
(125, 23, 'Bakery', 'Breads & Buns', '2015-12-26', 975, 0.26, 0, 390),
(126, 17, 'Fruits & Veggies', 'Organic Vegetables', '2015-09-20', 889, 0.19, 0, 71.12),
(127, 14, 'Eggs, Meat & Fish', 'Mutton', '2018-11-05', 2352, 0.17, 0, 870.24),
(128, 21, 'Oil & Masala', 'Spices', '2018-11-05', 1293, 0.23, 0, 336.18),
(129, 22, 'Food Grains', 'Rice', '2017-11-06', 1458, 0.29, 0, 597.78),
(130, 3, 'Food Grains', 'Atta & Flour', '2017-11-06', 1801, 0.22, 0, 126.07),
(131, 9, 'Snacks', 'Chocolates', '2018-02-02', 1261, 0.29, 0, 416.13),
(132, 15, 'Beverages', 'Soft Drinks', '2018-02-02', 2112, 0.28, 0, 105.6),
(133, 20, 'Eggs, Meat & Fish', 'Fish', '2018-02-02', 640, 0.24, 0, 140.8),
(134, 8, 'Bakery', 'Cakes', '2017-10-13', 1658, 0.12, 0, 315.02),
(135, 2, 'Beverages', 'Health Drinks', '2017-10-13', 2373, 0.18, 0, 664.44),
(136, 19, 'Fruits & Veggies', 'Organic Fruits', '2017-10-13', 1430, 0.19, 0, 514.8),
(137, 21, 'Oil & Masala', 'Spices', '2017-10-13', 1873, 0.3, 0, 674.28),
(138, 10, 'Eggs, Meat & Fish', 'Eggs', '2017-10-13', 867, 0.14, 0, 329.46),
(139, 18, 'Snacks', 'Noodles', '2017-10-13', 1101, 0.19, 0, 484.44),
(140, 14, 'Eggs, Meat & Fish', 'Mutton', '2017-10-13', 1088, 0.28, 0, 424.32),
(141, 7, 'Bakery', 'Biscuits', '2017-09-05', 866, 0.32, 0, 381.04),
(142, 1, 'Oil & Masala', 'Masalas', '2018-09-18', 2483, 0.14, 0, 223.47),
(143, 3, 'Food Grains', 'Atta & Flour', '2018-09-18', 1335, 0.11, 0, 293.7),
(144, 20, 'Eggs, Meat & Fish', 'Fish', '2018-09-18', 765, 0.24, 0, 252.45),
(145, 14, 'Eggs, Meat & Fish', 'Mutton', '2018-12-22', 2403, 0.2, 0, 624.78),
(146, 13, 'Oil & Masala', 'Edible Oil & Ghee', '2016-09-07', 1551, 0.13, 0, 573.87),
(147, 5, 'Food Grains', 'Organic Staples', '2015-10-22', 1564, 0.27, 0, 187.68),
(148, 4, 'Fruits & Veggies', 'Fresh Vegetables', '2017-12-05', 1125, 0.33, 0, 292.5),
(149, 2, 'Beverages', 'Health Drinks', '2017-12-05', 768, 0.1, 0, 184.32),
(150, 20, 'Eggs, Meat & Fish', 'Fish', '2017-12-05', 1985, 0.26, 0, 734.45),
(151, 22, 'Food Grains', 'Rice', '2017-12-05', 2287, 0.13, 0, 1029.15),
(152, 9, 'Snacks', 'Chocolates', '2017-03-13', 1016, 0.34, 0, 335.28),
(153, 11, 'Snacks', 'Cookies', '2017-03-13', 852, 0.26, 0, 76.68),
(154, 5, 'Food Grains', 'Organic Staples', '2016-05-31', 1233, 0.28, 0, 234.27),
(155, 18, 'Snacks', 'Noodles', '2016-05-31', 2236, 0.14, 0, 626.08),
(156, 4, 'Fruits & Veggies', 'Fresh Vegetables', '2016-05-31', 2188, 0.32, 0, 809.56),
(157, 11, 'Snacks', 'Cookies', '2016-05-28', 1114, 0.2, 0, 456.74),
(158, 13, 'Oil & Masala', 'Edible Oil & Ghee', '2015-03-01', 1774, 0.15, 0, 620.9),
(159, 15, 'Beverages', 'Soft Drinks', '2017-11-20', 2364, 0.21, 0, 1040.16),
(160, 16, 'Food Grains', 'Dals & Pulses', '2017-11-20', 1487, 0.11, 0, 148.7),
(161, 15, 'Beverages', 'Soft Drinks', '2017-05-11', 713, 0.3, 0, 192.51),
(162, 20, 'Eggs, Meat & Fish', 'Fish', '2016-12-28', 737, 0.2, 0, 280.06),
(163, 9, 'Snacks', 'Chocolates', '2017-11-16', 1004, 0.26, 0, 341.36),
(164, 11, 'Snacks', 'Cookies', '2017-11-07', 1516, 0.32, 0, 121.28),
(165, 3, 'Food Grains', 'Atta & Flour', '2015-09-08', 1442, 0.28, 0, 605.64),
(166, 2, 'Beverages', 'Health Drinks', '2015-09-08', 1690, 0.33, 0, 422.5),
(167, 9, 'Snacks', 'Chocolates', '2015-09-08', 2021, 0.13, 0, 343.57),
(168, 14, 'Eggs, Meat & Fish', 'Mutton', '2015-09-08', 2340, 0.25, 0, 491.4),
(169, 21, 'Oil & Masala', 'Spices', '2015-09-08', 705, 0.15, 0, 176.25),
(170, 12, 'Eggs, Meat & Fish', 'Chicken', '2015-09-08', 1215, 0.2, 0, 60.75),
(171, 16, 'Food Grains', 'Dals & Pulses', '2015-09-08', 552, 0.25, 0, 237.36),
(172, 2, 'Beverages', 'Health Drinks', '2015-08-05', 1412, 0.11, 0, 564.8),
(173, 16, 'Food Grains', 'Dals & Pulses', '2015-08-05', 791, 0.32, 0, 150.29),
(174, 17, 'Fruits & Veggies', 'Organic Vegetables', '2015-08-05', 2476, 0.33, 0, 420.92),
(175, 4, 'Fruits & Veggies', 'Fresh Vegetables', '2015-09-14', 1747, 0.27, 0, 471.69),
(176, 19, 'Fruits & Veggies', 'Organic Fruits', '2015-09-14', 1973, 0.15, 0, 848.39),
(177, 21, 'Oil & Masala', 'Spices', '2018-04-21', 2025, 0.24, 0, 546.75),
(178, 18, 'Snacks', 'Noodles', '2016-11-21', 1016, 0.29, 0, 223.52),
(179, 19, 'Fruits & Veggies', 'Organic Fruits', '2016-11-21', 689, 0.3, 0, 55.12),
(180, 3, 'Food Grains', 'Atta & Flour', '2016-12-15', 1322, 0.16, 0, 343.72),
(181, 11, 'Snacks', 'Cookies', '2015-12-05', 1605, 0.25, 0, 433.35),
(182, 2, 'Beverages', 'Health Drinks', '2015-12-05', 1718, 0.2, 0, 171.8),
(183, 13, 'Oil & Masala', 'Edible Oil & Ghee', '2015-11-19', 2177, 0.35, 0, 783.72),
(184, 5, 'Food Grains', 'Organic Staples', '2015-11-19', 578, 0.19, 0, 236.98),
(185, 16, 'Food Grains', 'Dals & Pulses', '2015-11-19', 782, 0.28, 0, 195.5),
(186, 18, 'Snacks', 'Noodles', '2017-11-28', 1388, 0.35, 0, 97.16),
(187, 8, 'Bakery', 'Cakes', '2015-08-26', 2264, 0.21, 0, 792.4),
(188, 15, 'Beverages', 'Soft Drinks', '2017-07-16', 813, 0.16, 0, 138.21),
(189, 19, 'Fruits & Veggies', 'Organic Fruits', '2017-07-16', 2015, 0.24, 0, 564.2),
(190, 15, 'Beverages', 'Soft Drinks', '2016-10-12', 1433, 0.3, 0, 472.89),
(191, 19, 'Fruits & Veggies', 'Organic Fruits', '2016-10-12', 2093, 0.11, 0, 334.88),
(192, 4, 'Fruits & Veggies', 'Fresh Vegetables', '2016-10-12', 2149, 0.17, 0, 623.21),
(193, 2, 'Beverages', 'Health Drinks', '2016-10-12', 1972, 0.32, 0, 414.12),
(194, 1, 'Oil & Masala', 'Masalas', '2016-10-12', 2060, 0.25, 0, 432.6),
(195, 10, 'Eggs, Meat & Fish', 'Eggs', '2016-10-31', 1175, 0.12, 0, 340.75),
(196, 13, 'Oil & Masala', 'Edible Oil & Ghee', '2015-03-21', 1006, 0.25, 0, 191.14),
(197, 23, 'Bakery', 'Breads & Buns', '2015-03-21', 1409, 0.16, 0, 380.43),
(198, 5, 'Food Grains', 'Organic Staples', '2018-11-06', 914, 0.34, 0, 338.18),
(199, 14, 'Eggs, Meat & Fish', 'Mutton', '2018-07-06', 1352, 0.3, 0, 527.28),
(200, 10, 'Eggs, Meat & Fish', 'Eggs', '2018-07-06', 682, 0.25, 0, 170.5),
(201, 5, 'Food Grains', 'Organic Staples', '2018-06-24', 1738, 0.22, 0, 243.32),
(202, 8, 'Bakery', 'Cakes', '2015-08-03', 2421, 0.25, 0, 484.2),
(203, 5, 'Food Grains', 'Organic Staples', '2015-08-03', 2245, 0.24, 0, 404.1),
(204, 1, 'Oil & Masala', 'Masalas', '2018-12-17', 896, 0.12, 0, 295.68),
(205, 21, 'Oil & Masala', 'Spices', '2018-06-03', 1033, 0.3, 0, 185.94),
(206, 14, 'Eggs, Meat & Fish', 'Mutton', '2018-12-09', 1998, 0.29, 0, 139.86),
(207, 12, 'Eggs, Meat & Fish', 'Chicken', '2018-12-01', 1469, 0.15, 0, 646.36),
(208, 10, 'Eggs, Meat & Fish', 'Eggs', '2018-12-01', 1899, 0.25, 0, 360.81),
(209, 14, 'Eggs, Meat & Fish', 'Mutton', '2018-12-01', 2194, 0.2, 0, 153.58),
(210, 15, 'Beverages', 'Soft Drinks', '2018-12-01', 1942, 0.29, 0, 504.92),
(211, 17, 'Fruits & Veggies', 'Organic Vegetables', '2018-12-01', 609, 0.3, 0, 207.06),
(212, 12, 'Eggs, Meat & Fish', 'Chicken', '2016-02-09', 2353, 0.26, 0, 423.54),
(213, 15, 'Beverages', 'Soft Drinks', '2016-01-02', 1591, 0.15, 0, 270.47),
(214, 22, 'Food Grains', 'Rice', '2016-01-02', 1353, 0.11, 0, 527.67),
(215, 2, 'Beverages', 'Health Drinks', '2016-01-02', 1020, 0.21, 0, 81.6),
(216, 18, 'Snacks', 'Noodles', '2016-01-02', 1362, 0.31, 0, 177.06),
(217, 22, 'Food Grains', 'Rice', '2016-01-02', 1733, 0.31, 0, 433.25),
(218, 1, 'Oil & Masala', 'Masalas', '2017-10-28', 1949, 0.17, 0, 97.45),
(219, 19, 'Fruits & Veggies', 'Organic Fruits', '2017-10-28', 2368, 0.34, 0, 876.16),
(220, 4, 'Fruits & Veggies', 'Fresh Vegetables', '2016-12-24', 2110, 0.25, 0, 485.3),
(221, 16, 'Food Grains', 'Dals & Pulses', '2016-12-24', 1940, 0.2, 0, 795.4),
(222, 20, 'Eggs, Meat & Fish', 'Fish', '2016-12-24', 1557, 0.2, 0, 638.37),
(223, 20, 'Eggs, Meat & Fish', 'Fish', '2016-12-24', 1443, 0.19, 0, 274.17),
(224, 15, 'Beverages', 'Soft Drinks', '2016-12-24', 2024, 0.11, 0, 910.8),
(225, 12, 'Eggs, Meat & Fish', 'Chicken', '2016-12-24', 2168, 0.16, 0, 563.68),
(226, 12, 'Eggs, Meat & Fish', 'Chicken', '2016-08-09', 621, 0.24, 0, 173.88),
(227, 5, 'Food Grains', 'Organic Staples', '2016-08-09', 1230, 0.17, 0, 295.2),
(228, 11, 'Snacks', 'Cookies', '2016-08-09', 560, 0.34, 0, 240.8),
(229, 13, 'Oil & Masala', 'Edible Oil & Ghee', '2016-02-28', 1286, 0.22, 0, 282.92),
(230, 2, 'Beverages', 'Health Drinks', '2016-02-28', 1242, 0.34, 0, 149.04),
(231, 23, 'Bakery', 'Breads & Buns', '2015-09-13', 717, 0.21, 0, 43.02),
(232, 15, 'Beverages', 'Soft Drinks', '2018-04-07', 1480, 0.22, 0, 444),
(233, 16, 'Food Grains', 'Dals & Pulses', '2018-04-07', 826, 0.18, 0, 247.8),
(234, 11, 'Snacks', 'Cookies', '2018-04-07', 1846, 0.22, 0, 276.9),
(235, 15, 'Beverages', 'Soft Drinks', '2018-04-07', 2045, 0.12, 0, 552.15),
(236, 19, 'Fruits & Veggies', 'Organic Fruits', '2018-04-07', 1983, 0.17, 0, 773.37),
(237, 8, 'Bakery', 'Cakes', '2018-11-12', 650, 0.16, 0, 247),
(238, 23, 'Bakery', 'Breads & Buns', '2017-06-04', 2163, 0.31, 0, 216.3),
(239, 17, 'Fruits & Veggies', 'Organic Vegetables', '2017-06-04', 1481, 0.15, 0, 518.35),
(240, 11, 'Snacks', 'Cookies', '2017-06-04', 2492, 0.14, 0, 124.6),
(241, 8, 'Bakery', 'Cakes', '2017-06-04', 962, 0.33, 0, 423.28),
(242, 2, 'Beverages', 'Health Drinks', '2017-06-04', 1432, 0.3, 0, 214.8),
(243, 13, 'Oil & Masala', 'Edible Oil & Ghee', '2017-06-04', 523, 0.12, 0, 78.45),
(244, 1, 'Oil & Masala', 'Masalas', '2017-06-04', 1540, 0.11, 0, 646.8),
(245, 7, 'Bakery', 'Biscuits', '2015-06-01', 817, 0.15, 0, 326.8),
(246, 20, 'Eggs, Meat & Fish', 'Fish', '2015-06-01', 2462, 0.31, 0, 369.3),
(247, 19, 'Fruits & Veggies', 'Organic Fruits', '2015-06-01', 962, 0.21, 0, 288.6),
(248, 2, 'Beverages', 'Health Drinks', '2015-06-01', 538, 0.19, 0, 59.18),
(249, 11, 'Snacks', 'Cookies', '2015-06-01', 1556, 0.17, 0, 482.36),
(250, 2, 'Beverages', 'Health Drinks', '2017-12-10', 2133, 0.26, 0, 959.85),
(251, 2, 'Beverages', 'Health Drinks', '2017-09-11', 1474, 0.14, 0, 235.84),
(252, 2, 'Beverages', 'Health Drinks', '2017-09-11', 531, 0.14, 0, 127.44),
(253, 22, 'Food Grains', 'Rice', '2017-12-10', 1769, 0.19, 0, 636.84),
(254, 17, 'Fruits & Veggies', 'Organic Vegetables', '2017-12-10', 1257, 0.34, 0, 62.85),
(255, 22, 'Food Grains', 'Rice', '2016-11-28', 1899, 0.27, 0, 170.91),
(256, 6, 'Fruits & Veggies', 'Fresh Fruits', '2016-11-28', 1929, 0.3, 0, 617.28),
(257, 15, 'Beverages', 'Soft Drinks', '2016-11-28', 2417, 0.1, 0, 990.97),
(258, 14, 'Eggs, Meat & Fish', 'Mutton', '2016-11-28', 1443, 0.25, 0, 476.19),
(259, 15, 'Beverages', 'Soft Drinks', '2018-12-01', 660, 0.29, 0, 290.4),
(260, 23, 'Bakery', 'Breads & Buns', '2018-12-01', 2114, 0.32, 0, 359.38),
(261, 1, 'Oil & Masala', 'Masalas', '2018-12-01', 1278, 0.14, 0, 63.9),
(262, 5, 'Food Grains', 'Organic Staples', '2018-06-08', 867, 0.18, 0, 216.75),
(263, 5, 'Food Grains', 'Organic Staples', '2015-09-19', 943, 0.33, 0, 150.88),
(264, 15, 'Beverages', 'Soft Drinks', '2015-09-19', 1836, 0.17, 0, 275.4),
(265, 20, 'Eggs, Meat & Fish', 'Fish', '2017-06-06', 1200, 0.19, 0, 420),
(266, 17, 'Fruits & Veggies', 'Organic Vegetables', '2016-11-10', 1167, 0.18, 0, 256.74),
(267, 12, 'Eggs, Meat & Fish', 'Chicken', '2018-06-16', 696, 0.34, 0, 139.2),
(268, 1, 'Oil & Masala', 'Masalas', '2017-01-22', 2500, 0.33, 0, 425),
(269, 8, 'Bakery', 'Cakes', '2018-12-09', 1507, 0.16, 0, 180.84),
(270, 15, 'Beverages', 'Soft Drinks', '2018-12-09', 1612, 0.11, 0, 612.56),
(271, 18, 'Snacks', 'Noodles', '2018-12-28', 764, 0.11, 0, 160.44),
(272, 18, 'Snacks', 'Noodles', '2016-07-30', 884, 0.31, 0, 282.88),
(273, 19, 'Fruits & Veggies', 'Organic Fruits', '2016-07-30', 2443, 0.23, 0, 781.76),
(274, 8, 'Bakery', 'Cakes', '2016-07-30', 1147, 0.27, 0, 137.64),
(275, 17, 'Fruits & Veggies', 'Organic Vegetables', '2018-09-16', 1899, 0.21, 0, 493.74),
(276, 8, 'Bakery', 'Cakes', '2018-09-16', 744, 0.11, 0, 66.96),
(277, 20, 'Eggs, Meat & Fish', 'Fish', '2018-10-13', 812, 0.17, 0, 284.2),
(278, 1, 'Oil & Masala', 'Masalas', '2018-10-13', 862, 0.2, 0, 137.92),
(279, 9, 'Snacks', 'Chocolates', '2018-10-13', 1061, 0.13, 0, 286.47),
(280, 4, 'Fruits & Veggies', 'Fresh Vegetables', '2018-10-13', 2365, 0.31, 0, 520.3),
(281, 9, 'Snacks', 'Chocolates', '2016-09-26', 1421, 0.14, 0, 454.72),
(282, 17, 'Fruits & Veggies', 'Organic Vegetables', '2016-09-26', 1357, 0.24, 0, 203.55),
(283, 15, 'Beverages', 'Soft Drinks', '2016-11-02', 1007, 0.24, 0, 433.01),
(284, 7, 'Bakery', 'Biscuits', '2016-09-26', 1544, 0.26, 0, 138.96),
(285, 17, 'Fruits & Veggies', 'Organic Vegetables', '2016-09-26', 1537, 0.18, 0, 599.43),
(286, 23, 'Bakery', 'Breads & Buns', '2016-09-26', 1530, 0.18, 0, 168.3),
(287, 21, 'Oil & Masala', 'Spices', '2017-12-18', 2460, 0.15, 0, 738),
(288, 18, 'Snacks', 'Noodles', '2017-12-18', 976, 0.35, 0, 429.44),
(289, 19, 'Fruits & Veggies', 'Organic Fruits', '2017-12-18', 1106, 0.19, 0, 298.62),
(290, 7, 'Bakery', 'Biscuits', '2017-11-20', 1165, 0.17, 0, 244.65),
(291, 22, 'Food Grains', 'Rice', '2017-11-20', 1244, 0.14, 0, 497.6),
(292, 19, 'Fruits & Veggies', 'Organic Fruits', '2017-11-20', 1992, 0.34, 0, 418.32),
(293, 10, 'Eggs, Meat & Fish', 'Eggs', '2017-11-20', 1396, 0.16, 0, 237.32),
(294, 9, 'Snacks', 'Chocolates', '2015-12-26', 849, 0.19, 0, 263.19),
(295, 1, 'Oil & Masala', 'Masalas', '2015-12-26', 2488, 0.14, 0, 547.36),
(296, 22, 'Food Grains', 'Rice', '2015-12-26', 840, 0.25, 0, 184.8),
(297, 13, 'Oil & Masala', 'Edible Oil & Ghee', '2015-12-26', 1820, 0.21, 0, 527.8),
(298, 1, 'Oil & Masala', 'Masalas', '2015-12-26', 1969, 0.15, 0, 630.08),
(299, 5, 'Food Grains', 'Organic Staples', '2017-10-28', 2261, 0.23, 0, 994.84),
(300, 14, 'Eggs, Meat & Fish', 'Mutton', '2017-10-28', 1793, 0.21, 0, 304.81),
(301, 23, 'Bakery', 'Breads & Buns', '2017-10-28', 644, 0.33, 0, 96.6),
(302, 13, 'Oil & Masala', 'Edible Oil & Ghee', '2017-10-28', 1359, 0.17, 0, 421.29),
(303, 23, 'Bakery', 'Breads & Buns', '2017-10-28', 1554, 0.23, 0, 683.76),
(304, 11, 'Snacks', 'Cookies', '2018-11-19', 2090, 0.25, 0, 292.6),
(305, 13, 'Oil & Masala', 'Edible Oil & Ghee', '2016-05-04', 931, 0.14, 0, 297.92),
(306, 23, 'Bakery', 'Breads & Buns', '2015-12-30', 1157, 0.2, 0, 404.95),
(307, 6, 'Fruits & Veggies', 'Fresh Fruits', '2015-06-01', 2396, 0.35, 0, 383.36),
(308, 21, 'Oil & Masala', 'Spices', '2015-06-01', 1677, 0.18, 0, 586.95),
(309, 11, 'Snacks', 'Cookies', '2018-04-15', 590, 0.27, 0, 200.6),
(310, 18, 'Snacks', 'Noodles', '2017-09-12', 1401, 0.26, 0, 196.14),
(311, 13, 'Oil & Masala', 'Edible Oil & Ghee', '2017-09-12', 678, 0.29, 0, 189.84),
(312, 9, 'Snacks', 'Chocolates', '2017-09-12', 2417, 0.28, 0, 797.61),
(313, 15, 'Beverages', 'Soft Drinks', '2017-09-12', 2211, 0.18, 0, 641.19),
(314, 6, 'Fruits & Veggies', 'Fresh Fruits', '2015-09-27', 2392, 0.15, 0, 406.64),
(315, 14, 'Eggs, Meat & Fish', 'Mutton', '2015-08-09', 1835, 0.29, 0, 660.6),
(316, 18, 'Snacks', 'Noodles', '2015-08-09', 2281, 0.22, 0, 775.54),
(317, 4, 'Fruits & Veggies', 'Fresh Vegetables', '2015-12-28', 1583, 0.21, 0, 174.13),
(318, 8, 'Bakery', 'Cakes', '2015-11-04', 1123, 0.23, 0, 89.84),
(319, 11, 'Snacks', 'Cookies', '2015-11-04', 1079, 0.24, 0, 410.02),
(320, 5, 'Food Grains', 'Organic Staples', '2015-11-04', 1027, 0.16, 0, 328.64),
(321, 4, 'Fruits & Veggies', 'Fresh Vegetables', '2015-11-04', 1771, 0.28, 0, 602.14),
(322, 21, 'Oil & Masala', 'Spices', '2015-11-04', 1171, 0.16, 0, 363.01),
(323, 8, 'Bakery', 'Cakes', '2015-09-19', 672, 0.16, 0, 141.12),
(324, 2, 'Beverages', 'Health Drinks', '2017-04-23', 848, 0.21, 0, 228.96),
(325, 4, 'Fruits & Veggies', 'Fresh Vegetables', '2017-04-23', 2078, 0.21, 0, 914.32),
(326, 22, 'Food Grains', 'Rice', '2018-11-03', 1400, 0.17, 0, 406),
(327, 4, 'Fruits & Veggies', 'Fresh Vegetables', '2017-08-30', 945, 0.22, 0, 226.8),
(328, 2, 'Beverages', 'Health Drinks', '2017-08-30', 590, 0.22, 0, 82.6),
(329, 2, 'Beverages', 'Health Drinks', '2017-08-30', 1583, 0.3, 0, 316.6),
(330, 2, 'Beverages', 'Health Drinks', '2017-08-30', 1534, 0.15, 0, 245.44),
(331, 18, 'Snacks', 'Noodles', '2017-08-30', 2133, 0.12, 0, 490.59),
(332, 19, 'Fruits & Veggies', 'Organic Fruits', '2017-04-25', 2021, 0.19, 0, 747.77),
(333, 2, 'Beverages', 'Health Drinks', '2017-04-25', 1825, 0.17, 0, 164.25),
(334, 23, 'Bakery', 'Breads & Buns', '2017-04-25', 2029, 0.35, 0, 608.7),
(335, 21, 'Oil & Masala', 'Spices', '2016-09-01', 1228, 0.25, 0, 442.08),
(336, 22, 'Food Grains', 'Rice', '2016-09-01', 1501, 0.24, 0, 210.14),
(337, 17, 'Fruits & Veggies', 'Organic Vegetables', '2016-09-01', 1094, 0.26, 0, 415.72),
(338, 8, 'Bakery', 'Cakes', '2015-07-12', 1179, 0.2, 0, 106.11),
(339, 3, 'Food Grains', 'Atta & Flour', '2015-07-12', 1127, 0.29, 0, 416.99),
(340, 7, 'Bakery', 'Biscuits', '2016-06-22', 601, 0.26, 0, 234.39),
(341, 13, 'Oil & Masala', 'Edible Oil & Ghee', '2015-04-13', 1697, 0.21, 0, 560.01),
(342, 15, 'Beverages', 'Soft Drinks', '2015-04-13', 2095, 0.35, 0, 502.8),
(343, 12, 'Eggs, Meat & Fish', 'Chicken', '2015-04-13', 1132, 0.24, 0, 215.08),
(344, 17, 'Fruits & Veggies', 'Organic Vegetables', '2015-04-13', 1561, 0.35, 0, 640.01),
(345, 12, 'Eggs, Meat & Fish', 'Chicken', '2016-12-20', 1238, 0.1, 0, 297.12),
(346, 23, 'Bakery', 'Breads & Buns', '2018-06-15', 2068, 0.32, 0, 165.44),
(347, 17, 'Fruits & Veggies', 'Organic Vegetables', '2018-07-08', 1113, 0.21, 0, 356.16),
(348, 22, 'Food Grains', 'Rice', '2018-07-08', 1966, 0.1, 0, 629.12),
(349, 12, 'Eggs, Meat & Fish', 'Chicken', '2018-07-08', 2138, 0.13, 0, 684.16),
(350, 3, 'Food Grains', 'Atta & Flour', '2017-09-01', 978, 0.17, 0, 68.46),
(351, 4, 'Fruits & Veggies', 'Fresh Vegetables', '2017-09-01', 2014, 0.26, 0, 684.76),
(352, 23, 'Bakery', 'Breads & Buns', '2017-09-01', 645, 0.21, 0, 187.05),
(353, 22, 'Food Grains', 'Rice', '2017-09-01', 2194, 0.12, 0, 680.14),
(354, 2, 'Beverages', 'Health Drinks', '2017-09-01', 1244, 0.17, 0, 62.2),
(355, 7, 'Bakery', 'Biscuits', '2017-04-08', 743, 0.35, 0, 289.77),
(356, 4, 'Fruits & Veggies', 'Fresh Vegetables', '2017-04-08', 2474, 0.21, 0, 593.76),
(357, 11, 'Snacks', 'Cookies', '2017-04-08', 1494, 0.2, 0, 74.7),
(358, 21, 'Oil & Masala', 'Spices', '2017-04-08', 1174, 0.19, 0, 328.72),
(359, 17, 'Fruits & Veggies', 'Organic Vegetables', '2017-04-23', 1062, 0.35, 0, 435.42),
(360, 17, 'Fruits & Veggies', 'Organic Vegetables', '2018-03-08', 2297, 0.13, 0, 528.31),
(361, 18, 'Snacks', 'Noodles', '2018-03-08', 562, 0.13, 0, 56.2),
(362, 10, 'Eggs, Meat & Fish', 'Eggs', '2018-09-25', 2049, 0.13, 0, 655.68),
(363, 10, 'Eggs, Meat & Fish', 'Eggs', '2018-09-25', 570, 0.22, 0, 125.4),
(364, 14, 'Eggs, Meat & Fish', 'Mutton', '2018-09-25', 1236, 0.35, 0, 333.72),
(365, 2, 'Beverages', 'Health Drinks', '2018-09-25', 1069, 0.32, 0, 459.67),
(366, 8, 'Bakery', 'Cakes', '2015-09-24', 1946, 0.27, 0, 622.72),
(367, 18, 'Snacks', 'Noodles', '2017-10-21', 595, 0.11, 0, 196.35),
(368, 14, 'Eggs, Meat & Fish', 'Mutton', '2017-10-21', 2439, 0.21, 0, 658.53),
(369, 7, 'Bakery', 'Biscuits', '2017-10-21', 2415, 0.24, 0, 555.45),
(370, 21, 'Oil & Masala', 'Spices', '2017-10-21', 1725, 0.27, 0, 362.25),
(371, 4, 'Fruits & Veggies', 'Fresh Vegetables', '2018-05-29', 688, 0.21, 0, 116.96),
(372, 22, 'Food Grains', 'Rice', '2018-05-29', 1698, 0.16, 0, 339.6),
(373, 23, 'Bakery', 'Breads & Buns', '2015-07-23', 1665, 0.33, 0, 216.45),
(374, 2, 'Beverages', 'Health Drinks', '2015-07-23', 1309, 0.13, 0, 78.54),
(375, 21, 'Oil & Masala', 'Spices', '2015-07-23', 905, 0.32, 0, 72.4),
(376, 14, 'Eggs, Meat & Fish', 'Mutton', '2015-07-23', 2271, 0.35, 0, 295.23),
(377, 9, 'Snacks', 'Chocolates', '2017-09-28', 2091, 0.27, 0, 522.75),
(378, 3, 'Food Grains', 'Atta & Flour', '2018-08-27', 1917, 0.28, 0, 172.53),
(379, 22, 'Food Grains', 'Rice', '2016-04-28', 641, 0.17, 0, 179.48),
(380, 21, 'Oil & Masala', 'Spices', '2016-04-28', 1192, 0.26, 0, 417.2),
(381, 22, 'Food Grains', 'Rice', '2016-04-28', 1132, 0.21, 0, 464.12),
(382, 1, 'Oil & Masala', 'Masalas', '2017-10-28', 1727, 0.27, 0, 224.51),
(383, 14, 'Eggs, Meat & Fish', 'Mutton', '2017-10-28', 1051, 0.34, 0, 378.36),
(384, 2, 'Beverages', 'Health Drinks', '2016-06-26', 2109, 0.19, 0, 337.44),
(385, 14, 'Eggs, Meat & Fish', 'Mutton', '2016-11-27', 1311, 0.14, 0, 314.64),
(386, 19, 'Fruits & Veggies', 'Organic Fruits', '2016-11-27', 759, 0.1, 0, 265.65),
(387, 7, 'Bakery', 'Biscuits', '2016-12-03', 2201, 0.21, 0, 462.21),
(388, 11, 'Snacks', 'Cookies', '2016-12-03', 1964, 0.22, 0, 314.24),
(389, 9, 'Snacks', 'Chocolates', '2015-11-24', 1898, 0.19, 0, 702.26),
(390, 7, 'Bakery', 'Biscuits', '2018-12-11', 2282, 0.19, 0, 114.1),
(391, 23, 'Bakery', 'Breads & Buns', '2018-12-11', 2294, 0.18, 0, 596.44),
(392, 21, 'Oil & Masala', 'Spices', '2015-09-21', 2213, 0.34, 0, 995.85),
(393, 3, 'Food Grains', 'Atta & Flour', '2015-09-21', 1797, 0.3, 0, 269.55),
(394, 13, 'Oil & Masala', 'Edible Oil & Ghee', '2015-06-07', 1912, 0.29, 0, 382.4),
(395, 22, 'Food Grains', 'Rice', '2018-06-30', 1865, 0.11, 0, 354.35),
(396, 8, 'Bakery', 'Cakes', '2018-10-17', 1838, 0.24, 0, 753.58),
(397, 15, 'Beverages', 'Soft Drinks', '2018-10-17', 1626, 0.23, 0, 195.12),
(398, 18, 'Snacks', 'Noodles', '2016-10-31', 647, 0.33, 0, 71.17),
(399, 23, 'Bakery', 'Breads & Buns', '2017-09-08', 1042, 0.2, 0, 177.14),
(400, 2, 'Beverages', 'Health Drinks', '2017-09-08', 1519, 0.23, 0, 318.99);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_type` varchar(25) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_type`, `name`, `username`, `password`, `email`) VALUES
(1, 'Sales Manager', 'tarzan mark', 'tarzan', '$2b$10$QsqQ4VR1O0wghf2CSn/Ji.NVwrXXp79IItZl4hcC2wOkrXoQNld5S', 'salesmanager@atlas.com'),
(2, 'Cashier', 'tarzan mark', 'cashier', '$2b$10$BKhbuxS28I5AIVXvrlVAIuwWc0.tLgMuzIdsgJVA6SRgz2.TgXvAS', 'cashier@saleswave.com'),
(3, 'Sales Manager', 'tarzan mark', 'salesmanager1', '$2b$10$y4/VTfyZEbUVljpsuhxPkumISXhJuW9wCW.8/oTOkurhMv/FIqIKu', 'salesmanager1@atlas.com'),
(4, 'Sales Manager', 'shamim', 'sham', '$2b$10$co0MO/CjGwao7oxSiTt.JOjxOdH.VTFAvCmb7NVR5r7lIK3vCVRvW', 'sham@saleswave.com'),
(5, 'Sales Manager', 'ivan', 'ivo', '$2b$10$mi5jApnwoPhExxg91KvO3uLzhJT312bRQPqry2GFYfHlvx1AdKKd.', 'ivo@saleswave'),
(6, 'Cashier', 'mark', 'mark@sale', '$2b$10$IhL1Ymfvq6BRrnz6JVFLwuoqtqjd5VnTHo47WAV96cSyCRavem9pa', 'mark@saleswave'),
(7, 'Cashier', 'kagggwe', 'ivo', '$2b$10$dWypLWp8P/lVx2xMaGICz.OHcGANjuZilWsP2M/N9/YTIz/W.x4fm', 'cashier@was'),
(8, 'Cashier', 'cashier', 'cashier4', '$2b$10$pKV9iHt8qGUQ.guT.Y.vGur5VzkrKVnnBs4ZSPGcSbX/bW7zaAnwK', 'cashier@saleswave'),
(9, 'Sales Manager', 'Brenda', 'brenda', '$2b$10$Ve2aBJ0R2YspZ2YAc.smAOwPKfZcV/ZlINTbBPRJxEvYw.1NMF.86', 'brenda@saleswave.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `forecast`
--
ALTER TABLE `forecast`
  ADD PRIMARY KEY (`forecast_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `salesdata`
--
ALTER TABLE `salesdata`
  ADD PRIMARY KEY (`salesdata_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `forecast`
--
ALTER TABLE `forecast`
  MODIFY `forecast_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `salesdata`
--
ALTER TABLE `salesdata`
  MODIFY `salesdata_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=401;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `forecast`
--
ALTER TABLE `forecast`
  ADD CONSTRAINT `forecast_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
