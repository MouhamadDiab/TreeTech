-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2025 at 11:41 AM
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
-- Database: `treetech`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `Firstname` varchar(35) NOT NULL,
  `Lastname` varchar(35) NOT NULL,
  `Password` varchar(350) NOT NULL,
  `ConfirmPassword` varchar(350) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone_Nb` int(11) NOT NULL,
  `role` varchar(35) NOT NULL,
  `status` enum('Active','Blocked') DEFAULT 'Active',
  `color` varchar(30) DEFAULT 'black',
  `mohafaza_id` int(11) DEFAULT NULL,
  `kadaa_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `Firstname`, `Lastname`, `Password`, `ConfirmPassword`, `Email`, `Phone_Nb`, `role`, `status`, `color`, `mohafaza_id`, `kadaa_id`, `city_id`) VALUES
(9, 'Tree', 'Tech', '1935fe3b74f70b064403d9fd284a37bd5137b358f27528a8111d3fd13827e82f', '1935fe3b74f70b064403d9fd284a37bd5137b358f27528a8111d3fd13827e82f', 'TreeTech@gmail.com', 71184211, 'admin', 'Active', 'black', NULL, NULL, NULL),
(10, 'Mohammad', 'Diab', '1935fe3b74f70b064403d9fd284a37bd5137b358f27528a8111d3fd13827e82f', '1935fe3b74f70b064403d9fd284a37bd5137b358f27528a8111d3fd13827e82f', 'moudi@gmail.com', 71184211, 'admin', 'Active', 'white', 5, 17, 195),
(11, 'Jad', 'Mcheik', '1935fe3b74f70b064403d9fd284a37bd5137b358f27528a8111d3fd13827e82f', '1935fe3b74f70b064403d9fd284a37bd5137b358f27528a8111d3fd13827e82f', 'jad@gmail.com', 81953723, 'user', 'Active', 'yellow', 8, 25, 187),
(12, 'Bassel', 'Abou Hjeily', '1935fe3b74f70b064403d9fd284a37bd5137b358f27528a8111d3fd13827e82f', '1935fe3b74f70b064403d9fd284a37bd5137b358f27528a8111d3fd13827e82f', 'bassel@gmail.com', 71493637, 'user', 'Active', 'black', NULL, NULL, NULL),
(13, 'Mohammad', 'Saleh', '1935fe3b74f70b064403d9fd284a37bd5137b358f27528a8111d3fd13827e82f', '1935fe3b74f70b064403d9fd284a37bd5137b358f27528a8111d3fd13827e82f', 'saleh@gmail.com', 3079306, 'user', 'Active', 'green', NULL, NULL, NULL),
(15, 'Hussein', 'Dika', '1935fe3b74f70b064403d9fd284a37bd5137b358f27528a8111d3fd13827e82f', '1935fe3b74f70b064403d9fd284a37bd5137b358f27528a8111d3fd13827e82f', 'hussein@gmail.com', 71184211, 'user', 'Active', 'black', NULL, NULL, NULL),
(16, 'Mohammad', 'Diab', '1935fe3b74f70b064403d9fd284a37bd5137b358f27528a8111d3fd13827e82f', '1935fe3b74f70b064403d9fd284a37bd5137b358f27528a8111d3fd13827e82f', 'hamoudi@gmail.com', 71184211, 'user', 'Active', 'white', NULL, NULL, NULL),
(17, 'Hussein', 'Dika', '1935fe3b74f70b064403d9fd284a37bd5137b358f27528a8111d3fd13827e82f', '1935fe3b74f70b064403d9fd284a37bd5137b358f27528a8111d3fd13827e82f', 'hussein123@gmail.com', 71104464, 'user', 'Active', 'white', NULL, NULL, NULL),
(18, 'houssein', 'Fadel', '1935fe3b74f70b064403d9fd284a37bd5137b358f27528a8111d3fd13827e82f', '1935fe3b74f70b064403d9fd284a37bd5137b358f27528a8111d3fd13827e82f', 'h@gmail.com', 75514821, 'user', 'Active', 'white', 1, 1, 98),
(19, 'Ali', 'Fadel', '1935fe3b74f70b064403d9fd284a37bd5137b358f27528a8111d3fd13827e82f', '1935fe3b74f70b064403d9fd284a37bd5137b358f27528a8111d3fd13827e82f', 'a@gmail.com', 78960057, 'user', 'Active', 'black', 5, 17, 195),
(21, 'Ali', 'Diab', '1935fe3b74f70b064403d9fd284a37bd5137b358f27528a8111d3fd13827e82f', '1935fe3b74f70b064403d9fd284a37bd5137b358f27528a8111d3fd13827e82f', 'ali@gmail.com', 70613124, 'user', 'Active', 'black', 5, 17, 195),
(22, 'Hussein', 'Ahmad', '1935fe3b74f70b064403d9fd284a37bd5137b358f27528a8111d3fd13827e82f', '1935fe3b74f70b064403d9fd284a37bd5137b358f27528a8111d3fd13827e82f', 'ahmad@gmail.com', 71124563, 'user', 'Active', 'black', 5, 17, 161);

-- --------------------------------------------------------

--
-- Table structure for table `cart_owner`
--

CREATE TABLE `cart_owner` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_owner`
--

INSERT INTO `cart_owner` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(16, 15, '2025-07-20 12:42:07', '2025-07-20 12:42:07'),
(17, 18, '2025-07-20 13:01:05', '2025-07-20 13:01:05'),
(18, 21, '2025-07-21 09:08:10', '2025-07-21 09:08:10'),
(19, 22, '2025-07-26 16:49:49', '2025-07-26 16:49:49'),
(20, 11, '2025-07-27 12:32:11', '2025-07-27 12:32:11');

-- --------------------------------------------------------

--
-- Table structure for table `cart_products`
--

CREATE TABLE `cart_products` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `status` varchar(30) DEFAULT NULL,
  `date_order` datetime DEFAULT NULL,
  `date_history` datetime DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT 0,
  `latitude` decimal(7,5) DEFAULT NULL,
  `longitude` decimal(7,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_products`
--

INSERT INTO `cart_products` (`id`, `cart_id`, `product_id`, `quantity`, `status`, `date_order`, `date_history`, `price`, `discount`, `latitude`, `longitude`) VALUES
(202, 16, 123, 1, 'history', '2025-07-20 15:43:35', '2025-07-20 17:18:11', 25, 0, 33.87904, 35.86598),
(203, 16, 123, 1, 'history', '2025-07-20 15:52:59', '2025-07-20 17:18:10', 25, 0, 33.26999, 35.19882),
(204, 17, 114, 1, 'history', '2025-07-20 16:01:14', '2025-07-20 17:18:09', 100, 0, 33.87327, 35.51266),
(205, 17, 107, 10, 'history', '2025-07-20 17:17:05', '2025-07-20 17:18:05', 260, 0, 33.84169, 35.91013),
(206, 17, 114, 11, 'order', '2025-07-20 18:47:55', NULL, 100, 0, 33.99632, 36.22138),
(207, 17, 108, 1, 'order', '2025-07-21 12:09:08', NULL, 330, 0, 33.88043, 35.86639),
(208, 17, 124, 1, 'order', '2025-07-21 12:09:45', NULL, 330, 0, 34.00045, 36.22389),
(209, 18, 108, 2, 'history', '2025-07-21 12:10:20', '2025-07-21 17:10:33', 330, 0, 33.83866, 35.90774),
(210, 18, 108, 1, 'order', '2025-07-21 12:10:30', NULL, 330, 0, 34.04583, 36.18679),
(211, 18, 108, 1, 'order', '2025-07-21 12:10:43', NULL, 330, 0, 34.02762, 36.25269),
(212, 18, 108, 5, 'order', '2025-07-21 12:11:36', NULL, 330, 0, 33.82708, 35.50581),
(213, 18, 109, 3, 'order', '2025-07-21 12:13:39', NULL, 600, 0, 33.26682, 35.21623),
(214, 18, 120, 6, 'order', '2025-07-21 12:13:39', NULL, 800, 0, 33.26682, 35.21623),
(215, 17, 126, 4, 'history', '2025-07-21 17:09:18', '2025-07-21 17:10:19', 14, 0, 33.88923, 35.49649),
(216, 19, 108, 1, 'order', '2025-07-26 19:49:59', NULL, 330, 0, 33.79969, 35.84630),
(217, 19, 108, 1, 'order', '2025-07-27 15:34:06', NULL, 20, 0, 34.01852, 36.27465),
(219, 20, 125, 3, 'order', '2025-07-27 15:37:05', NULL, 20, 0, 33.92741, 36.19777),
(220, 20, 124, 4, 'order', '2025-07-27 15:42:56', NULL, 5, 0, 33.82593, 35.52339),
(221, 20, 125, 1, 'cart', NULL, NULL, 0, 0, 10.44563, 20.35346);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `Id` int(11) NOT NULL,
  `Name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`Id`, `Name`) VALUES
(1, 'accessories'),
(3, 'laptop'),
(2, 'phone'),
(19, 'ps');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `akdeye_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`, `akdeye_id`) VALUES
(26, 'Tripoli', 8),
(27, 'El Mina', 8),
(28, 'Kobbeh', 8),
(29, 'Abou Samra', 8),
(30, 'Batroun', 9),
(31, 'Chekka', 9),
(32, 'Heri', 9),
(33, 'Kfifane', 9),
(34, 'Bsharri', 10),
(35, 'Hadchit', 10),
(36, 'Bcharre', 10),
(37, 'Diman', 10),
(38, 'Ehden', 11),
(39, 'Zgharta', 11),
(40, 'Miziara', 11),
(41, 'Aytou', 11),
(42, 'Minieh', 12),
(43, 'Bqaa Sifrine', 12),
(44, 'Sir ed-Dinniyeh', 12),
(45, 'Beit El Faqs', 12),
(46, 'Koura', 13),
(47, 'Kousba', 13),
(48, 'Deddeh', 13),
(49, 'Amioun', 13),
(50, 'Sidon', 14),
(98, 'Beirut', 1),
(99, 'Baabda', 2),
(100, 'Hadath', 2),
(101, 'Hazmieh', 2),
(102, 'Araya', 2),
(103, 'Aley', 3),
(104, 'Souk el Gharb', 3),
(105, 'Bhamdoun', 3),
(106, 'Ain Dara', 3),
(107, 'Jdeideh', 4),
(108, 'Bourj Hammoud', 4),
(109, 'Zalka', 4),
(110, 'Dekwaneh', 4),
(111, 'Deir el Qamar', 5),
(112, 'Beiteddine', 5),
(113, 'Barouk', 5),
(114, 'Niha', 5),
(115, 'Jounieh', 6),
(116, 'Zouk Mosbeh', 6),
(117, 'Kfaryassine', 6),
(118, 'Ghosta', 6),
(119, 'Byblos', 7),
(120, 'Amchit', 7),
(121, 'Ehmej', 7),
(122, 'Aannaya', 7),
(123, 'Tripoli', 8),
(124, 'El Mina', 8),
(125, 'Kobbeh', 8),
(126, 'Abou Samra', 8),
(127, 'Batroun', 9),
(128, 'Chekka', 9),
(129, 'Heri', 9),
(130, 'Kfifane', 9),
(131, 'Bsharri', 10),
(132, 'Hadchit', 10),
(133, 'Bcharre', 10),
(134, 'Diman', 10),
(135, 'Ehden', 11),
(136, 'Zgharta', 11),
(137, 'Miziara', 11),
(138, 'Aytou', 11),
(139, 'Minieh', 12),
(140, 'Bqaa Sifrine', 12),
(141, 'Sir ed-Dinniyeh', 12),
(142, 'Beit El Faqs', 12),
(143, 'Koura', 13),
(144, 'Kousba', 13),
(145, 'Deddeh', 13),
(146, 'Amioun', 13),
(147, 'Sidon', 14),
(148, 'Maghdouche', 14),
(149, 'Aabra', 14),
(150, 'Ghaziyeh', 14),
(151, 'Jezzine', 15),
(152, 'Bqosta', 15),
(153, 'Kfarhouna', 15),
(154, 'Mashmoushe', 15),
(155, 'Tyre', 16),
(156, 'Qana', 16),
(157, 'Borj Rahhal', 16),
(158, 'Rashidieh', 16),
(159, 'Zahle', 17),
(160, 'Taanayel', 17),
(161, 'Ferzol', 17),
(162, 'Karoun', 19),
(163, 'Rashaya', 18),
(164, 'Kfar Danis', 18),
(165, 'Aaiha', 18),
(166, 'Kfarqouq', 18),
(167, 'Nabatieh', 20),
(168, 'Habbouch', 20),
(169, 'Kfar Remen', 20),
(170, 'Toul', 20),
(171, 'Marjeyoun', 21),
(172, 'Deir Mimas', 21),
(173, 'Qlayaa', 21),
(174, 'Markaba', 21),
(175, 'Hasbaya', 22),
(176, 'Kfarhamam', 22),
(177, 'Kawkaba', 22),
(178, 'Ain Qenya', 22),
(179, 'Bint Jbeil', 23),
(180, 'Ainata', 23),
(181, 'Maroun el Ras', 23),
(182, 'Rmeish', 23),
(183, 'Halba', 24),
(184, 'Bebnine', 24),
(185, 'Meshmesh', 24),
(186, 'Qobayat', 24),
(187, 'Baalbek', 25),
(188, 'Duris', 25),
(189, 'Brital', 25),
(190, 'Younine', 25),
(191, 'Hermel', 26),
(192, 'Qaa', 26),
(193, 'Fakiha', 26),
(194, 'Ras Baalbek', 26),
(195, 'Hazerta', 17);

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `name_picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`name_picture`) VALUES
('ppic_1739119065.jpg'),
('ppic_1739119083.webp'),
('ppic_1739119087.jpg'),
('ppic_1739119090.jpg'),
('ppic_1739119094.jpg'),
('ppic_1739119129.jpg'),
('ppic_1739119173.jpg'),
('ppic_1739119180.jpg'),
('ppic_1739119423.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `Item_ID` int(11) NOT NULL,
  `Name` varchar(32) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Price` int(11) NOT NULL,
  `discount_percentage` int(3) NOT NULL DEFAULT 0,
  `Price_after_discount` decimal(32,0) GENERATED ALWAYS AS (`Price` - `Price` * `discount_percentage` / 100) STORED,
  `discount_end_date` date NOT NULL DEFAULT current_timestamp(),
  `Add_Date` date NOT NULL,
  `Status` varchar(255) NOT NULL,
  `Picture` varchar(255) NOT NULL,
  `Cat_ID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `role` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`Item_ID`, `Name`, `Description`, `Price`, `discount_percentage`, `discount_end_date`, `Add_Date`, `Status`, `Picture`, `Cat_ID`, `quantity`, `role`) VALUES
(88, 'Dell Core i7', '8 Ram 256 GB ', 130, 0, '2025-02-03', '2025-01-30', 'used', '8331_dell1.jpg', 3, 15, 1),
(91, 'Dell', 'Dell core i7 9th 12 Cpu', 400, 0, '2025-02-01', '2025-01-30', 'used', '4103_dell2.jpg', 3, 15, 1),
(93, 'Mouse', 'wired 2.4G', 10, 10, '2025-02-13', '2025-01-30', 'new', 'mouse1.jpg', 1, 15, 0),
(94, 'iphone 16', 'iphone 16 512gb', 1500, 0, '2025-02-26', '2025-01-30', 'new', '9680_iphone 14 prow max.jpeg', 2, 15, 1),
(95, 'sumsung s25 Ultra', '2 sim 512gb', 1300, 0, '2025-02-07', '2025-01-30', 'new', 'DSC_0020.JPG', 2, 80, 0),
(96, 'Remote Control Car', 'big battey', 50, 0, '2025-02-02', '2025-01-30', 'new', 'accessories2.jpg', 1, 15, 1),
(99, 'Led Light', 'Selfi Ring Led Light', 10, 0, '2025-01-29', '2025-01-30', 'used', 'accessories1.jpg', 1, 59, 1),
(102, 'iphone 17', 'fdsafafsd', 2000, 0, '2025-02-02', '2025-02-01', 'new', '9680_iphone 14 prow max.jpeg', 2, 100, 0),
(103, 'iphone 18', 'ghjglk', 3000, 0, '2025-02-01', '2025-02-01', 'new', '9680_iphone 14 prow max.jpeg', 2, 80, 0),
(107, 'Lenovo ThinkPad T495s', '16 Ram 512GB ', 260, 0, '2025-02-07', '2025-02-07', 'used', 'lenovo-laptop-thinkpad-t480-feature-02_02.webp', 3, 146, 1),
(108, 'HP EliteBook 845 G7', '16 Ram 256 GB', 330, 0, '2025-02-07', '2025-02-07', 'used', 'HP_EliteBook_845_G7_176Y4EA_image_1.webp', 3, 144, 1),
(109, 'MacBook Pro Retina', 'Touch 16 Ram 512 GB', 600, 0, '2025-02-19', '2025-02-07', 'used', '81r1Ir8LtbL._AC_SL1500.webp', 3, 53, 1),
(110, 'MacBook Air 15\" M3', '8 Ram 256 GB', 999, 0, '2025-02-19', '2025-02-07', 'new', 'Apple-MacBook-Air-M3-15-inch-Starlight-1_3884161b-ffad-49f4-971b-f9d625346363.webp', 3, 144, 1),
(111, 'Dell Latitude 5300', '32 Ram 512 GB', 400, 0, '2025-02-07', '2025-02-07', 'used', 'Dell_Latitude_5300_6.webp', 3, 100, 1),
(112, 'MacBook Pro 2020 M1', '16 Ram 512 SSD', 850, 0, '2025-02-07', '2025-02-07', 'new', '71Y6pcuRhmL._AC_UF894_1000_QL80.webp', 3, 53, 1),
(113, 'Lenovo ThinkPad T14s', '16 Ram 256 GB', 350, 0, '2025-02-07', '2025-02-07', 'used', 'Untitleddesign_11_e1369391-5bdd-4ad8-b22f-c4f5105511a8_1024x1024_png.webp', 3, 98, 1),
(114, 'infinix smart 8', '6 Ram 128 Gb', 100, 0, '2025-02-20', '2025-02-08', 'new', 'infinix smart 8.jpg', 2, 146, 1),
(115, 'S22', '8 Ram 128 Gb', 400, 10, '2025-02-28', '2025-02-08', 'used', '71qZERyxy6L._AC_UF1000,1000_QL80_.jpg', 2, 144, 0),
(116, 'iphone 16', '1 TB', 1600, 10, '2025-02-19', '2025-02-08', 'new', 'images.jpg', 1, 15, 0),
(118, 'iphone 15', '256 GB', 999, 0, '2025-02-08', '2025-02-08', 'used', 'images (1).jpg', 2, 49, 1),
(119, 'huawei pura 70 ultra', '16 Ram 512 GB', 1440, 0, '2025-02-08', '2025-02-08', 'new', 'download (1).jpg', 2, 53, 1),
(120, 'sumsung s23 Ultra', '8 Ram 256 GB', 800, 0, '2025-02-08', '2025-02-08', 'used', 'images (2).jpg', 2, 53, 1),
(121, 'itel A50', '6 Ram 128 GB', 100, 0, '2025-02-08', '2025-02-08', 'new', 'itel A50.jpg', 2, 80, 1),
(122, 'infinix Hot 50i', '8 Ram 128 GB', 150, 0, '2025-02-08', '2025-02-08', 'new', 'infinix Hot 50i.jpg', 2, 80, 1),
(123, 'keyboard', 'keyboard , Mouse, Headphone', 25, 0, '2025-02-08', '2025-02-08', 'new', 'keyboard.jpg', 1, 98, 1),
(124, 'Mouse ', 'Mouse Hp Wireless 2.4G', 5, 0, '2025-02-08', '2025-02-08', 'new', 'Mouse HP.jpg', 1, 142, 1),
(125, 'Controller Gamepad', 'Digital Game Player ', 20, 0, '2025-02-21', '2025-02-08', 'new', 'digital game player.jpg', 1, 142, 1),
(126, 'Router', 'netis 300 Mbps', 14, 0, '2025-07-21', '2025-02-08', 'new', 'router netis.jpg', 1, 146, 1),
(127, 'Controller Gamepad', '2.4G wireless', 15, 0, '2025-02-08', '2025-02-08', 'new', '2.4G controller gamepad.jpg', 1, 80, 1),
(128, 'Power Bank ', '60000 mAh with Light', 40, 0, '2025-02-26', '2025-02-08', 'new', 'Light.jpg', 1, 49, 1),
(129, 'ChromeCast', 'Tv streaming device by google', 7, 0, '2025-02-08', '2025-02-08', 'used', 'chrome cast.jpg', 1, 50, 1),
(130, 'Camera', 'Wifi Smart Net Camera', 13, 0, '2025-02-20', '2025-02-08', 'new', 'camera.jpg', 1, 49, 1),
(131, 'Usb  Adapter', 'USB Adapter Wireless', 2, 0, '2025-02-20', '2025-02-08', 'new', 'usb adapter wireless.jpg', 1, 200, 1),
(132, 'HeadPhone', 'wired Gaming with RGB Led', 10, 0, '2025-02-08', '2025-02-08', 'new', 'HeadPhone Tranyoo.jpg', 1, 59, 1),
(137, 'ps4', '400', 400, 0, '2025-02-13', '2025-02-11', 'used', '2.webp', 19, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kadaa`
--

CREATE TABLE `kadaa` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mohafaza_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kadaa`
--

INSERT INTO `kadaa` (`id`, `name`, `mohafaza_id`) VALUES
(1, 'Beirut District', 1),
(2, 'Baabda', 2),
(3, 'Aley', 2),
(4, 'Metn', 2),
(5, 'Chouf', 2),
(6, 'Keserwan', 2),
(7, 'Jbeil', 2),
(8, 'Tripoli', 3),
(9, 'Batroun', 3),
(10, 'Bsharri', 3),
(11, 'Zgharta', 3),
(12, 'Minieh-Danniyeh', 3),
(13, 'Koura', 3),
(14, 'Sidon', 4),
(15, 'Jezzine', 4),
(16, 'Tyre', 4),
(17, 'Zahle', 5),
(18, 'Rashaya', 5),
(19, 'West Beqaa', 5),
(20, 'Nabatieh District', 6),
(21, 'Marjeyoun', 6),
(22, 'Hasbaya', 6),
(23, 'Bint Jbeil', 6),
(24, 'Akkar District', 7),
(25, 'Baalbek', 8),
(26, 'Hermel', 8);

-- --------------------------------------------------------

--
-- Table structure for table `mohafaza`
--

CREATE TABLE `mohafaza` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mohafaza`
--

INSERT INTO `mohafaza` (`id`, `name`) VALUES
(7, 'Akkar'),
(8, 'Baalbek-Hermel'),
(1, 'Beirut'),
(5, 'Beqaa'),
(2, 'Mount Lebanon'),
(6, 'Nabatieh'),
(3, 'North Lebanon'),
(4, 'South Lebanon');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Gmail` (`Email`),
  ADD KEY `mohafazat` (`mohafaza_id`),
  ADD KEY `akdeye` (`kadaa_id`),
  ADD KEY `cities` (`city_id`);

--
-- Indexes for table `cart_owner`
--
ALTER TABLE `cart_owner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_products`
--
ALTER TABLE `cart_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `akdeye_id` (`akdeye_id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`name_picture`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`Item_ID`),
  ADD KEY `Cat_ID` (`Cat_ID`);

--
-- Indexes for table `kadaa`
--
ALTER TABLE `kadaa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mohafaza_id` (`mohafaza_id`);

--
-- Indexes for table `mohafaza`
--
ALTER TABLE `mohafaza`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `cart_owner`
--
ALTER TABLE `cart_owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `cart_products`
--
ALTER TABLE `cart_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `Item_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `kadaa`
--
ALTER TABLE `kadaa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `mohafaza`
--
ALTER TABLE `mohafaza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `akdeye` FOREIGN KEY (`kadaa_id`) REFERENCES `kadaa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cities` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mohafazat` FOREIGN KEY (`mohafaza_id`) REFERENCES `mohafaza` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_owner`
--
ALTER TABLE `cart_owner`
  ADD CONSTRAINT `cart_owner_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `account` (`id`);

--
-- Constraints for table `cart_products`
--
ALTER TABLE `cart_products`
  ADD CONSTRAINT `cart` FOREIGN KEY (`cart_id`) REFERENCES `cart_owner` (`id`),
  ADD CONSTRAINT `cart_products_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `items` (`Item_ID`);

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`akdeye_id`) REFERENCES `kadaa` (`id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `itm` FOREIGN KEY (`Cat_ID`) REFERENCES `categories` (`Id`);

--
-- Constraints for table `kadaa`
--
ALTER TABLE `kadaa`
  ADD CONSTRAINT `kadaa_ibfk_1` FOREIGN KEY (`mohafaza_id`) REFERENCES `mohafaza` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
