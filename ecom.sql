-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 03, 2021 at 03:32 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin@gmail.com', '$2y$10$.I3JNWPgXntNsia3lVRLVulYUsxp9DE1.p/iLkhmPrwaYzXmkjqXa', '2021-04-29 09:20:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_home` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `is_home`, `status`, `created_at`, `updated_at`) VALUES
(5, 'java', '1620732037.png', 1, 1, '2021-05-11 05:50:37', '2021-05-11 05:50:37'),
(6, 'Joomla', '1620732049.png', 1, 1, '2021-05-11 05:50:49', '2021-05-11 05:50:49'),
(7, 'WordPress', '1620732061.png', 1, 1, '2021-05-11 05:51:01', '2021-05-11 05:51:01'),
(8, 'Levis', '1621880155.png', 1, 1, '2021-05-24 12:45:55', '2021-05-24 12:45:55'),
(9, 'Puma', '1621935058.jpg', 1, 1, '2021-05-25 04:00:58', '2021-05-25 04:00:58');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` enum('Reg','Not-Reg') NOT NULL,
  `qty` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_attr_id` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_category_id` int(11) NOT NULL,
  `category_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_home` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_slug`, `parent_category_id`, `category_image`, `is_home`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Electronics', 'Electronics_Items', 0, '1621879065.jpg', 1, 1, '2021-05-05 01:43:19', '2021-05-24 12:28:15'),
(6, 'shirts', 'Shirts_Items', 0, '1621879176.jpg', 1, 1, '2021-05-09 08:43:29', '2021-05-24 12:29:54'),
(7, 'Books', 'Book_Items', 0, '1621879283.jpg', 1, 1, '2021-05-11 05:40:26', '2021-05-24 12:31:23'),
(8, 'Latest Books', 'New_Books', 7, NULL, 0, 1, '2021-05-13 06:44:22', '2021-05-24 12:31:43');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `color`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Pink', 1, '2021-05-01 07:35:38', '2021-05-17 00:43:41'),
(2, 'Yellow', 1, '2021-05-01 07:35:41', '2021-05-17 00:43:16'),
(3, 'Green', 1, '2021-05-24 12:54:02', '2021-05-24 12:54:02'),
(4, 'Black', 1, '2021-05-25 04:01:56', '2021-05-25 04:01:56');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` enum('Value','Per') COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_order_amt` int(11) NOT NULL,
  `is_one_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `title`, `code`, `value`, `status`, `created_at`, `updated_at`, `type`, `min_order_amt`, `is_one_time`) VALUES
(4, 'ds', 'Jan2021', '100', 1, '2021-04-30 02:21:46', '2021-05-06 05:13:18', 'Value', 0, 0),
(5, 'das', 'Jan20212', '1000', 1, '2021-05-05 01:36:13', '2021-05-05 01:36:17', 'Value', 5000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gstin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verify` int(11) NOT NULL,
  `rand_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_forgot_password` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `mobile`, `password`, `address`, `city`, `state`, `zip`, `company`, `gstin`, `is_verify`, `rand_id`, `is_forgot_password`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Rahul Gupta', 'guptarahul97480@gmail.com', '7003724118', 'eyJpdiI6Ii9OZGdLM0tDTFpqcUwyRnNaSjBwemc9PSIsInZhbHVlIjoiOTM0dmJqV1lkY2tqNUlvY3pZTjNMZz09IiwibWFjIjoiNmViYjdiODYxY2I3NzA0MDgxZDEzZGEwODFkOWZkYmNhYjZlZGI2NGIwZjRkMjQxMGI3NWM0MGI0YmQxZTg4MSJ9', NULL, NULL, NULL, NULL, NULL, NULL, 1, '', 0, 1, '2021-06-06 00:33:08', '2021-06-06 00:33:08'),
(8, 'Prem', 'guptarahulalwaysonl9@gmail.com', '7003724118', 'eyJpdiI6IjhyamlTL0JLaVV0MUd6QkdpKzMrbFE9PSIsInZhbHVlIjoibUllZWg0amtLdTdzNmF5ZnlLMGltdz09IiwibWFjIjoiY2JlMDcyOTZiZjY5MDk1ODljYmY4ODUzMWZmM2IyOWFkNDE2ZTZmMjliYzdkYWJlYWUyMWZhZWIxZWU0Mjc3YSJ9', NULL, NULL, NULL, NULL, NULL, NULL, 0, '971861132', 0, 1, '2021-06-06 00:48:27', '2021-06-06 00:48:27'),
(9, 'Varun Gujjar', 'rahul1.gupta@aot.edu.in', '9328423368', 'eyJpdiI6IjFNcUhoOTBSNzhEQi8vcXJaVEJwNGc9PSIsInZhbHVlIjoiS2JaajZ3anpUaXZoYlB5RWM2VWYxZz09IiwibWFjIjoiNWViZDE5NTIyNWM1NjQ2ZjhiZjA0ODBiMGI2NjI3ZWExY2U0MTcyYzI0MjcyMGJhNWZlNTk3ZDY5MDk0MjE2NSJ9', NULL, NULL, NULL, NULL, NULL, NULL, 0, '186966031', NULL, 1, '2021-06-17 22:17:56', '2021-06-17 22:17:56'),
(10, 'Rahul Gupta', 'guptarahul97480ghf@gmail.com', '7003724118', 'eyJpdiI6IkxCaUY4ZWtMaWxtMy9OcGxuejN4WUE9PSIsInZhbHVlIjoiWmEwOVMyelJCc2tod2xRdUlIWS93dz09IiwibWFjIjoiNGYxZDIxYTI4NzBiZjMwNjFlNGZmNjZjZTdhMGNhNzZiZGZhZDY4ZmQ4N2NkNjU2ZDVjM2ZjZjUwOTAxMjUwNSJ9', NULL, NULL, NULL, NULL, NULL, NULL, 0, '940195184', NULL, 0, '2021-06-17 23:57:33', '2021-07-03 06:27:53'),
(11, 'Prem', 'guptarahulalwaysonl9gg@gmail.com', '7003724118', 'eyJpdiI6IjFYalhXazRucHp3cDVGUVpBUzBpWHc9PSIsInZhbHVlIjoiTjhNQU1ZWlZiNENVNkcwZHBOOHI5dz09IiwibWFjIjoiMzY2NTI3NzUwNzJhOTFjNWZhYTkyOTg4NDMzOTYzMjE2YmIzYmY0YTQ4ZGRkYjM2NzkyMzVjOWQ3ZWZhODIzNiJ9', NULL, NULL, NULL, NULL, NULL, NULL, 0, '458820815', NULL, 0, '2021-06-27 01:00:23', '2021-07-03 06:27:50'),
(12, 'Rahul Gupta', 'guptarahul974180@gmail.com', '7003724118', 'eyJpdiI6Ik5ialRyZ2M0OFBSS0svcTZLTjhUNGc9PSIsInZhbHVlIjoid1Y4WjlZSmRtVHovbDk3QkJxUy9vUT09IiwibWFjIjoiNWVkNDBmOTAxZDBkZDM5NGFmOWI3ZDQwYmYxZWVjMTU1NTk2ODY4ZGU1OGFhMmI1OTNiZjQ3MzZmODdmYWYyMyJ9', NULL, NULL, NULL, NULL, NULL, NULL, 0, '525909139', NULL, 0, '2021-06-27 05:38:14', '2021-07-03 06:27:48'),
(13, 'Rahul', 'idmajak12@gmail.com', '7003724118', 'eyJpdiI6IlBDdW5KQTlBWHVWamNEQUwvOU4rZXc9PSIsInZhbHVlIjoiNXMrZlhNNkdlTnA3SkNBT1FDTUVadz09IiwibWFjIjoiZDAxN2M2MDlkNDI2N2Q2MzFiYjQyOTBiYzY4OGExYWNkOWRjNjE1NmI3YWNhNWRhZDlmMTM2YjQzNzdhNmU1OCJ9', NULL, 'Howrah', 'West Bengal', '711204', NULL, NULL, 1, '274225251', 0, 1, '2021-07-03 07:12:02', '2021-07-03 07:12:02');

-- --------------------------------------------------------

--
-- Table structure for table `home_banners`
--

CREATE TABLE `home_banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_txt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_banners`
--

INSERT INTO `home_banners` (`id`, `image`, `btn_txt`, `btn_link`, `status`, `created_at`, `updated_at`) VALUES
(2, '1625318823.jpg', 'Home Banner', '123.123', 1, '2021-05-12 00:56:12', '2021-07-03 07:57:03'),
(3, '1625317960.jpg', 'Home Banner 2', 'Void', 1, '2021-05-12 01:26:11', '2021-07-03 07:42:40'),
(4, '1621879480.jpg', 'Home Banner  3', 'Void', 1, '2021-05-12 01:27:39', '2021-05-24 12:34:40');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_01_15_211334_create_admins_table', 1),
(5, '2021_01_20_095632_create_coupons_table', 2),
(6, '2021_01_26_021550_create_sizes_table', 3),
(7, '2021_04_30_080152_create_colors_table', 4),
(14, '2021_01_15_215552_create_categories_table', 5),
(15, '2021_01_26_023140_create_colors_table', 5),
(16, '2021_01_28_104722_create_products_table', 5),
(17, '2021_05_01_124512_products_attr', 6),
(20, '2021_05_03_092059_product_images', 7),
(22, '2021_02_03_114909_create_brands_table', 8),
(29, '2021_02_05_082218_create_taxes_table', 9),
(30, '2021_05_08_094440_create_customers_table', 10),
(31, '2021_05_12_060613_create_home_banners_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mobile` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `pincode` varchar(200) NOT NULL,
  `coupon_code` varchar(200) DEFAULT NULL,
  `coupon_value` int(11) DEFAULT NULL,
  `order_status` int(11) NOT NULL,
  `payment_type` enum('COD','Gateway') NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `payment_id` varchar(50) DEFAULT NULL,
  `txn_id` varchar(200) DEFAULT NULL,
  `total_amt` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customers_id`, `name`, `email`, `mobile`, `address`, `city`, `state`, `pincode`, `coupon_code`, `coupon_value`, `order_status`, `payment_type`, `payment_status`, `payment_id`, `txn_id`, `total_amt`, `added_on`) VALUES
(1, 7, 'Prem Shankar Gupta', 'guptarahul97480@gmail.com', '7003724118', 'sadadas', 'asd', 'WEST BENGAL', '711204', NULL, 0, 1, 'Gateway', 'Pending', NULL, 'f6767f40bdac428e8124ef02902aeb17', 13167, '2021-06-27 11:29:25'),
(2, 7, 'Prem Shankar Gupta', 'guptarahul97480@gmail.com', '7003724118', 'sadadas', 'asd', 'WEST BENGAL', '711204', NULL, 0, 1, 'Gateway', 'Pending', NULL, NULL, 0, '2021-06-27 11:30:01'),
(3, 7, 'Rahul', 'guptarahul97480@gmail.com', '07278476387', '33/D Rabindra Sarani Liluah Howrah, Silver Jublie Hospital', 'Howrah', 'West Bengal', '711204', NULL, 0, 1, 'Gateway', 'Pending', NULL, NULL, 399, '2021-06-27 11:33:25'),
(4, 7, 'Prem', 'guptarahulalwaysonl9@gmail.com', '07003724118', '33/D Rabindra Sarani Liluah Howrah', 'Kolkata', 'WestBengal', '711204', NULL, 0, 1, 'Gateway', 'Pending', NULL, '6eac5b02c66149388c3a83f99e336b5b', 399, '2021-06-27 11:35:23'),
(5, 7, 'Rahul', 'guptarahul97480@gmail.com', '07003724118', '33d, Rabindra Sarani', 'Howrah', 'WestBengal', '711204', NULL, 0, 1, 'Gateway', 'Success', 'MOJO1627Z05A89284121', '2a23bf3a97e54eedb054e7c784b2db2d', 299, '2021-06-27 11:41:24'),
(6, 7, 'Varun Gujjar', 'guptarahul97480@gmail.com', '9328423368', 'Krishna Society Behind SBI Bank\r\nKrishna Society Behind SBI Bank', 'Una', 'Gujarat', '9328423368', NULL, 0, 1, 'Gateway', 'Pending', NULL, '4c0e2f79d21c4b14adb85ed28e62f954', 1299, '2021-07-03 12:00:03'),
(10, 13, 'Rahul', 'idmajak12@gmail.com', '7003724118', '33/D Rabindra Sarani Liluah Howrah\r\nSilver Jublie Hospital', 'Howrah', 'West Bengal', '711204', NULL, 0, 1, 'COD', 'Pending', NULL, NULL, 399, '2021-07-03 12:51:03');

-- --------------------------------------------------------

--
-- Table structure for table `orders_details`
--

CREATE TABLE `orders_details` (
  `id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `products_attr_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders_details`
--

INSERT INTO `orders_details` (`id`, `orders_id`, `product_id`, `products_attr_id`, `price`, `qty`) VALUES
(1, 1, 1, 1, 399, 33),
(2, 3, 1, 1, 399, 1),
(3, 4, 1, 1, 399, 1),
(4, 5, 3, 3, 299, 1),
(5, 6, 4, 4, 1299, 1),
(6, 10, 1, 1, 399, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders_status`
--

CREATE TABLE `orders_status` (
  `id` int(11) NOT NULL,
  `order_status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders_status`
--

INSERT INTO `orders_status` (`id`, `order_status`) VALUES
(1, 'Place'),
(2, 'On the way'),
(3, 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_desc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `technical_specification` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `uses` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `warranty` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `lead_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_id` int(11) NOT NULL,
  `tax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_promo` int(11) NOT NULL,
  `is_featured` int(11) NOT NULL,
  `is_discounted` int(11) NOT NULL,
  `is_tranding` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `image`, `slug`, `brand`, `model`, `short_desc`, `desc`, `keywords`, `technical_specification`, `uses`, `warranty`, `lead_time`, `tax_id`, `tax`, `tax_type`, `is_promo`, `is_featured`, `is_discounted`, `is_tranding`, `status`, `created_at`, `updated_at`) VALUES
(1, 6, 'Shirts', '1625312804.png', 'Shirts_Items', '8', 'NEW', '<p>This is the Short Description</p>', '<p>This is teh main Description Area</p>', 'Shirts new Pink Green Blue', '<p>This is the Technical&nbsp;Specifivation of the Product</p>', 'Wear Smartly !!', '0', '3', 1, NULL, NULL, 1, 1, 1, 1, 1, '2021-05-24 12:49:17', '2021-07-03 06:16:44'),
(3, 6, 'Shirts', '1622283025.png', 'Shirts_New1', '8', 'abcModel', '<p>Shor Desc</p>', '<p>Desc</p>', 'shirts Green', '<p>Technical Specification</p>', 'Wear', '0', '3', 1, NULL, NULL, 1, 1, 1, 1, 1, '2021-05-24 12:53:03', '2021-05-29 04:40:25'),
(4, 7, 'Puma Shoes', '1621935364.jpg', 'Shoes_Puma', '9', 'AbcD', '<p>Short Description</p>', '<p>Description</p>', 'Puma Shoes', '<p>Technical Specification</p>', 'Shoes', '1', '1', 1, NULL, NULL, 1, 1, 1, 1, 1, '2021-05-25 04:06:04', '2021-05-25 04:06:04');

-- --------------------------------------------------------

--
-- Table structure for table `products_attr`
--

CREATE TABLE `products_attr` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `products_id` int(11) NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attr_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mrp` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_attr`
--

INSERT INTO `products_attr` (`id`, `products_id`, `sku`, `attr_image`, `mrp`, `price`, `qty`, `size_id`, `color_id`) VALUES
(1, 1, '1', '404926436.jpg', 599, 399, 5, 1, 1),
(2, 1, '2', '298974476.jpg', 599, 299, 1, 2, 2),
(3, 3, '55', '253257083.jpg', 399, 299, 1, 1, 1),
(4, 4, '5', '897792631.jpg', 1499, 1299, 20, 3, 4),
(5, 4, '6', '365920152.jpg', 1499, 1299, 1, 4, 4),
(6, 4, '11', '134570556.jpg', 1499, 1299, 1, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `products_id` int(11) NOT NULL,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `products_id`, `images`) VALUES
(1, 1, '543286884.jpg'),
(2, 3, '709025703.jpg'),
(3, 4, '748482878.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `size`, `status`, `created_at`, `updated_at`) VALUES
(1, '32', 1, '2021-04-30 02:25:06', '2021-05-20 00:46:32'),
(2, '34', 1, '2021-05-20 00:45:46', '2021-05-20 00:46:33'),
(3, '9 UK', 1, '2021-05-25 04:01:25', '2021-05-25 04:01:25'),
(4, '10 UK', 1, '2021-05-25 04:01:36', '2021-05-25 04:01:36'),
(5, '8 UK', 1, '2021-05-25 04:01:41', '2021-05-25 04:01:41'),
(6, '7 UK', 1, '2021-05-25 04:01:46', '2021-05-25 04:01:46');

-- --------------------------------------------------------

--
-- Table structure for table `taxs`
--

CREATE TABLE `taxs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tax_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxs`
--

INSERT INTO `taxs` (`id`, `tax_desc`, `tax_value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'This tax goes to the Goverment', '18% GST', 1, '2021-05-24 12:46:30', '2021-05-24 12:46:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_banners`
--
ALTER TABLE `home_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_details`
--
ALTER TABLE `orders_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_attr`
--
ALTER TABLE `products_attr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxs`
--
ALTER TABLE `taxs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `home_banners`
--
ALTER TABLE `home_banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders_details`
--
ALTER TABLE `orders_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products_attr`
--
ALTER TABLE `products_attr`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `taxs`
--
ALTER TABLE `taxs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
