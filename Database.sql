-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2022 at 05:33 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ltm`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `name`, `phone`, `mail`, `username`, `password`, `role`) VALUES
('2', 'NVC', '0907123678', 'vanC@gmail.com', 'user01', '123', 0),
('3', 'BVH', '129838912', 'Huy@gmail.com', 'user02', '123', 0),
('4', 'NQT', '0987625123', 'NQT@gmail.com', 'admin', '123', 1),
('5', 'NTB', '08274653621', 'NTB2@gmail.com', 'admin2', '123', 1),
('6', 'Hu&#7923;nh Lê &#272;&#7855;c Tài', '+10379105130', 'dactai2k2@gmail.com', 'abc', '123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
('H1', 'Nike'),
('H2', 'Adidas'),
('H3', 'Puma'),
('H4', 'Bitis');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_product` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `id_category` varchar(10) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_product`, `name`, `id_category`, `size`, `price`, `image`) VALUES
('1', 'Nike Air Max', 'H1', 42, 500000, 'https://cdn.vuahanghieu.com/unsafe/500x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2022/04/giay-the-thao-nike-air-max-genome-white-cw1648-100-mau-trang-626279b6da32c-22042022164734.jpg'),
('10', 'Hunter X', 'H4', 44, 453000, 'https://product.hstatic.net/1000230642/product/dsmh10500xam__2__4d84d50f5d9741f6b6d74dcd716f4176_grande.jpg'),
('12', 'Hunter Street X', 'H4', 42, 890000, 'https://product.hstatic.net/1000230642/product/dsc_0322_f651c011422f49fe8604577217411fcf_grande.jpg'),
('2', 'Nike Precison 5', 'H1', 43, 560000, 'https://cdn.vuahanghieu.com/unsafe/500x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2022/11/giay-bong-ro-giay-nike-precision-5-black-white-cw3403-003-mau-den-trang-size-42-637afbe868fef-21112022111744.jpg'),
('3', 'Nike Air Force 1', 'H1', 42, 800000, 'https://cdn.vuahanghieu.com/unsafe/500x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2022/10/giay-the-thao-nike-air-force-1-07-pecan-dh7561-100-mau-trang-nau-size-42-6348cbeab4a18-14102022093938.jpg'),
('8', 'Skye Clean Metallic', 'H3', 42, 670000, 'https://sneakerdaily.vn/wp-content/uploads/2022/11/giay-adidas-forum-exhibit-low-sky-tint-gw6348-6.jpg'),
('9', 'RS-X The Batman', 'H3', 44, 760000, 'https://sneakerdaily.vn/wp-content/uploads/2022/10/giay-puma-rs-x-the-batman-383290-01.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `fk_tk` (`id_category`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_tk` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
