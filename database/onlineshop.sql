-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2024 at 04:54 PM
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
-- Database: `ecommerce`
--
CREATE DATABASE IF NOT EXISTS `ecommerce` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `ecommerce`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)   SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Moho'),
(2, 'Erado'),
(3, 'Ashley'),
(4, 'Aaron'),
(5, 'Dunelm Group'),
(6, 'Harvey Norman');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(46, 2, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Ling room'),
(2, 'Dining room'),
(3, 'Bedroom'),
(4, 'Office'),
(5, 'Decorations');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'puneethreddy951@gmail.com'),
(5, 'puneethreddy@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Puneeth', 'puneethreddy951@gmail.com', 'Bangalore, Kumbalagodu, Karnataka', 'Bangalore', 'Karnataka', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 3, 77000, 1234);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 82, 1, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(82, 1, 3, 'Salon a', 45000, 'No', '1735391777_haha1.jpg', 'No'),
(83, 3, 3, 'Educated bed', 4999000, 'Dimensions: Width 160 x Length 218 x Height 100 (cm)\r\nMaterial: Melamine Coated Industrial Wood CARB-P2 (*)\r\n(*) California Air Resources Board standard exported to the United States, ensuring that the wood is non-toxic, safe for users\' health and environmentally friendly.\r\n', '1735397297_image001.jpg', 'No'),
(84, 3, 1, 'Full Combo Bedroom Ubeda 201 Brown', 3999, 'Main material: Melaleuca wood and MFC wood standard CARB P2 (*)\r\n(*) California Air Resources Board standard exported to the US, ensuring non-toxic wood, safe for health\r\nSPECIFICATIONS\r\nBedroom: (the number of products depends on the type of combo/ refer to the footnote at the top): \r\n(Unit: cm)\r\n• 1 Bed: Length 208 x Width 165 x Height 90 cm\r\n• 1 Bedside Cabinet: Length 50 x Width 400 x Height 40 (Ver 1)/ Length 50 x Width 40 x Height 45 (Ver 2) cm\r\n• 1 Mirrored Wingless Wardrobe: Length 60 X Width 60 X Height 200 cm\r\n• 1 2-wing wardrobe: Length 120 x Width 60 x Height 200 cm', '1735398776_image007.jpg', 'No'),
(85, 3, 1, 'MOHO DALUMD Wooden Wardrobe 2 Wings (1m2)', 2999000, 'Dimensions: Length 120 x Width 60 x Height 200 cm\r\nMaterial:\r\n• - Melamine-coated industrial wood CARB-P2 standard (*)\r\n(*) California Air Resources Board standard exported to the US, ensuring non-toxic wood, safe for health\r\n', '1735398869_image010.jpg', 'No'),
(86, 3, 1, 'Moho Dalumd 301 Sofa (Brown 180)', 3999, 'Dimensions: Width 900 x Length 1800 x Height 700\r\nMaterial: \r\n- Natural rubber wood\r\n- Synthetic fiber fabric is wrinkle-resistant, dirt-resistant and mildew-resistant\r\n- Laminate: Plywood standard CARB-P2 (*) \r\n*Flame retardant, stain-resistant fabric according to international standard OEKO TEX (Standard 100).\r\n Raw Material Details\r\n- Polyester Fabric\r\nThe chair is dark gray to enhance the aesthetics and interior space of your living room.\r\n- Natural rubber wood\r\nMOHO furniture uses rubber wood to help the Hobro wooden sofa have good bearing capacity and high durability.', '1735398964_image014.jpg', 'No'),
(87, 4, 1, 'MOHO VLINE 601 Brown Wooden Workbench', 3999, 'Dimensions: Length 110cm x Width 55cm x Height 74cm\r\nMaterial:\r\n- Countertop: CARB-P2 standard MDF (*), natural melaleuca veneer\r\n- Table legs: Natural melaleuca wood\r\n(*) California Air Resources Board standard exported to the US, ensuring non-toxic wood, safe for health', '1735399298_image003.jpg', 'No'),
(88, 4, 1, '3-tier bookshelf MOHO WORKS 703', 1999, 'Dimensions: Length 80cm x Width 32cm x Height 106cm \r\nMaterial:\r\nHigh-quality PB industrial wood standard CARB-P2 (*)\r\nRust-resistant, waterproof powder-coated iron frame.\r\n(*) California Air Resources Board standard exported to the US, ensuring non-toxic wood, safe for health\r\nNote: Only available in Ho Chi Minh City\r\nMOHO WORKS 703 3-tier bookshelf uses high-quality PB industrial wood that meets CARB-P2 standards, meets US export quality standards, is safe for health and the environment. Combined with that is a rust-resistant, waterproof powder-coated iron frame.', '1735399385_image006.jpg', 'No'),
(89, 4, 1, 'MOHO WORKS 702 Locker Bookshelf', 2999, 'Dimensions: Length 80cm x Width 32cm x Height 174cm \r\nMaterial:\r\nHigh-quality PB industrial wood standard CARB-P2 (*)\r\nRust-resistant, waterproof powder-coated iron frame.\r\n(*) California Air Resources Board standard exported to the US, ensuring non-toxic wood, safe for health\r\n*Outlet products are not covered by warranty and maintenance.\r\nMOHO WORKS 702 locker bookshelves use high-quality PB industrial wood that meets CARB-P2 standards, meets US export quality standards, is safe for health and the environment. Combined with that is a rust-resistant, waterproof powder-coated iron frame.', '1735399476_image016.jpg', 'No'),
(90, 1, 6, 'Living Room Sofa (SF309)', 6999, 'The SF309 Living Room Sofa combines modern elegance with exceptional comfort, making it the perfect centerpiece for your living space. Designed with a sleek silhouette and upholstered in premium-quality fabric, this sofa exudes sophistication while ensuring long-lasting durability.\r\nKey features include:\r\n-Spacious Design: Accommodates up to three people comfortably, ideal for family gatherings or relaxing moments.\r\n-Luxurious Comfort: High-density foam cushions provide optimal support and relaxation.\r\n-Stylish Look: Clean lines and a neutral color palette complement any interior décor.\r\n-Sturdy Build: A solid wood frame ensures stability and durability for years to come.\r\n-Easy Maintenance: Removable and washable cushion covers for hassle-free cleaning.', '1735399797_image002.png', 'No'),
(91, 1, 5, 'Iron Shoe Cabinet (TG07)', 1999, 'The Iron Shoe Cabinet (TG07) is a stylish and functional storage solution designed to keep your footwear organized and your space clutter-free. Crafted from durable iron, this cabinet features a modern, minimalist design that blends seamlessly into any home décor.\r\nKey Features:\r\n-Durable Material: Built with high-quality iron for long-lasting durability and strength.\r\n-Spacious Storage: Multiple shelves provide ample space to store shoes of various sizes, from sneakers to high heels.\r\n-Ventilated Design: The perforated structure ensures proper air circulation, keeping your shoes fresh.\r\n-Compact & Sleek: Its slim design makes it perfect for entryways, hallways, or bedrooms with limited space.\r\n-Easy Maintenance: The iron surface is easy to clean and maintain, ensuring it stays looking new.', '1735399891_image003.png', 'No'),
(92, 1, 4, 'Industrial Wooden Shoe Cabinet', 1999, 'The Industrial Wooden Shoe Cabinet is a stylish and practical storage solution that combines rustic charm with modern functionality. Crafted from solid wood and accented with sturdy metal elements, it showcases a timeless industrial design that complements various interior styles, from rustic to modern. This cabinet offers ample storage with multiple compartments and shelves, making it easy to organize footwear of different sizes and styles. Its compact design fits perfectly in entryways, hallways, or bedrooms, maximizing space while maintaining a sleek appearance. Built for durability, it features a smooth finish that is easy to clean and maintain, ensuring long-lasting use. The Industrial Wooden Shoe Cabinet is not just a piece of furniture but a statement of elegance and utility for your home.\r\n\r\n', '1735400018_image006.png', 'No'),
(93, 1, 1, 'Moho Dalumd 301 Sofa', 2999, 'The Moho Dalumd 301 Sofa is the perfect blend of modern elegance and exceptional comfort. Its sleek design, with clean lines and a minimalist aesthetic, makes it a standout centerpiece for any living room. Upholstered with premium, soft-touch fabric, this sofa provides a cozy seating experience, while its sturdy frame ensures durability and support. The Moho Dalumd 301 is ideal for those who value both style and functionality, offering ample seating space to relax or entertain guests in sophisticated comfort.', '1735400093_image010.png', 'No'),
(94, 2, 3, 'Natural Rubber Wood Dining Chair', 500, 'The Natural Rubber Wood Dining Chair combines timeless elegance with exceptional durability. Crafted from high-quality rubber wood, this chair features a sturdy frame with a smooth finish that highlights the natural grain of the wood. Its ergonomic design ensures comfort during meals, while the minimalist style blends effortlessly with various dining table designs. Perfect for both modern and traditional settings, this chair is a sustainable and stylish addition to any dining space.', '1735400218_image003.png', 'No'),
(95, 2, 6, 'Rubber Wood Dining Table', 1000, 'The Rubber Wood Dining Table is a perfect blend of natural elegance and durability, designed to enhance your dining experience. Made from high-quality rubber wood, this table boasts a sturdy construction with a smooth, polished surface that showcases the wood’s natural grain. Its timeless design complements a variety of interior styles, from modern to rustic. With ample space to accommodate family and guests, this dining table is ideal for everyday meals and special gatherings. Easy to clean and maintain, it offers both practicality and long-lasting beauty for your home.', '1735400311_image005.png', 'No'),
(96, 2, 4, 'Natural wood dining tables and chairs', 6999, 'Natural wood dining tables and chairs bring warmth, elegance, and timeless charm to any dining space. Crafted from high-quality, eco-friendly wood, these pieces highlight the beauty of natural grain patterns, making each set unique. Designed for comfort and durability, they provide a sturdy and inviting space for family meals, gatherings, or special occasions. Their versatile style complements both modern and traditional interiors, creating a cozy atmosphere that enhances your dining experience.', '1735400373_image009.png', 'No'),
(97, 2, 5, 'Steel frame dining table and chair', 7999, 'The Steel Frame Dining Table and Chair set combines durability with contemporary design, making it a perfect addition to any dining space. The table features a sturdy steel frame and a smooth, easy-to-clean surface, ensuring long-lasting use. The chairs are designed with ergonomic support and cushioned seats, offering both comfort and style. This set is ideal for families, modern apartments, or cafes, blending functionality with an elegant aesthetic. With its minimalist appeal and robust construction, it enhances any dining area with a touch of sophistication.', '1735400435_image011.png', 'No'),
(98, 2, 2, '6-seat dining table and chair set code T2196', 3999, 'The 6-Seat Dining Table and Chair Set (T2196) offers a perfect blend of style and comfort for any dining space. Featuring a spacious table with a sleek, modern design, this set is crafted from high-quality materials for durability. The six comfortable chairs are designed to provide support and comfort during long meals, making it ideal for family gatherings or entertaining guests. With its elegant finish and versatile look, the T2196 set effortlessly complements various interior styles, enhancing your dining experience.', '1735400491_image015.png', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', 'puneeth', '9448121558', '123456789', 'sdcjns,djc'),
(15, 'hemu', 'ajhgdg', 'puneethreddy951@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', '123456789', '9448121558', '123456789', 'sdcjns,djc'),
(14, 'hemanthu', 'reddy', 'hemanthreddy951@gmail.com', '123456788', '6526436723', 's,dc wfjvnvn', 'b efhfhvvbr'),
(15, 'hemu', 'ajhgdg', 'keeru@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(20, 'pramod', 'vh', 'pramod@gmail.com', '124335353', '9767645653', 'ksbdfcdf', 'sjrgrevgsib'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
