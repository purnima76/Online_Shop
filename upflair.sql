-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2022 at 12:45 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `upflair`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `brand_name` varchar(100) NOT NULL,
  `brand_image` varchar(200) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_image` varchar(200) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `created_date` varchar(300) NOT NULL,
  `updated_date` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(1000) NOT NULL,
  `description` text NOT NULL,
  `product_size` varchar(220) NOT NULL,
  `product_colore` varchar(200) NOT NULL,
  `product_category_id` int(11) UNSIGNED NOT NULL,
  `product_subcat_id` int(200) NOT NULL,
  `product_brand_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `length` varchar(550) NOT NULL,
  `breadth` varchar(550) NOT NULL,
  `height` varchar(550) NOT NULL,
  `weight` varchar(550) NOT NULL,
  `shipping` varchar(100) DEFAULT NULL,
  `delivery` varchar(100) DEFAULT NULL,
  `is_approved` tinyint(4) DEFAULT 0,
  `status` tinyint(4) DEFAULT 1,
  `created_date` varchar(300) NOT NULL DEFAULT current_timestamp(),
  `tracking_number` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_imgs`
--

CREATE TABLE `product_imgs` (
  `id` int(11) NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_img` varchar(600) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categorys`
--

CREATE TABLE `sub_categorys` (
  `id` int(100) NOT NULL,
  `category_id` int(100) NOT NULL,
  `sub_category_name` varchar(100) NOT NULL,
  `sub_category_image` varchar(100) NOT NULL,
  `status` int(100) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `pin_code` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `accessToken` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '2:user,1:seller,0:admin',
  `profile_image` varchar(255) DEFAULT NULL,
  `size` varchar(150) DEFAULT NULL,
  `color` varchar(150) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `verification_status` int(11) DEFAULT 0,
  `is_block` tinyint(1) NOT NULL DEFAULT 0,
  `permanent_block` tinyint(1) NOT NULL DEFAULT 0,
  `notification_setting_status` enum('0','1','2') NOT NULL DEFAULT '1',
  `is_register` enum('0','1') NOT NULL DEFAULT '1',
  `last_login` timestamp NOT NULL DEFAULT current_timestamp(),
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `resetPasswordExpires` timestamp NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `contact_person_name` varchar(200) NOT NULL,
  `contact_person_lname` varchar(150) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `email` varchar(500) NOT NULL,
  `zip_code` varchar(13) NOT NULL,
  `landmark` varchar(200) NOT NULL,
  `address_type` varchar(200) NOT NULL,
  `address_line_one` text DEFAULT NULL COMMENT 'house_no',
  `address_line_two` text DEFAULT NULL COMMENT 'Colony/Area',
  `contact_number` varchar(16) NOT NULL,
  `is_default` varchar(150) NOT NULL DEFAULT '0',
  `created_date` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_carts`
--

CREATE TABLE `user_carts` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `size` varchar(50) DEFAULT NULL,
  `is_wishlist` tinyint(4) DEFAULT 0,
  `created_date` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_wishlist_or_favourites`
--

CREATE TABLE `user_wishlist_or_favourites` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(150) NOT NULL COMMENT 'wishlist,favourite',
  `created_date` varchar(200) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_imgs`
--
ALTER TABLE `product_imgs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_sku_id` (`product_id`);

--
-- Indexes for table `sub_categorys`
--
ALTER TABLE `sub_categorys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_addresses_ibfk_1` (`user_id`);

--
-- Indexes for table `user_carts`
--
ALTER TABLE `user_carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_wishlist_or_favourites`
--
ALTER TABLE `user_wishlist_or_favourites`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_imgs`
--
ALTER TABLE `product_imgs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categorys`
--
ALTER TABLE `sub_categorys`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_carts`
--
ALTER TABLE `user_carts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_wishlist_or_favourites`
--
ALTER TABLE `user_wishlist_or_favourites`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
