-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 21, 2017 at 11:52 AM
-- Server version: 10.1.25-MariaDB-1~xenial
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `axesandshoes`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(7, 6, 'N215j5IFP8vyDH6CLFQFNTox2sYV1txL', 1, '2017-10-28 22:44:16', '2017-10-28 22:44:16', '2017-10-28 22:44:16'),
(8, 7, 'yeFyvXmwm00MZwBn54C8ufRro9mnV5pX', 1, '2017-10-28 23:32:21', '2017-10-28 23:32:21', '2017-10-28 23:32:21');

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `colorName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`id`, `colorName`) VALUES
(1, 'Brown'),
(2, 'Black'),
(3, 'Yellow'),
(4, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE `material` (
  `id` int(11) NOT NULL,
  `materialName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`id`, `materialName`) VALUES
(2, 'Side Leather'),
(3, 'Calfskin'),
(4, 'Pigskin'),
(5, 'Nubuck'),
(6, 'Unknown');

-- --------------------------------------------------------

--
-- Table structure for table `persistences`
--

CREATE TABLE `persistences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `persistences`
--

INSERT INTO `persistences` (`id`, `user_id`, `code`, `created_at`, `updated_at`) VALUES
(24, 6, 'bGiM1oB19rRi7KuH3Y0DQU4hLw5wmxSo', '2017-10-29 01:15:57', '2017-10-29 01:15:57'),
(25, 6, 'myTEk7IpyCYksJ430bkwHQsa9DE7hUMl', '2017-10-29 11:35:19', '2017-10-29 11:35:19'),
(26, 6, 'W1MxpHLKUW8ax7PSqwdt7kAK3ictxjjw', '2017-10-29 12:31:41', '2017-10-29 12:31:41'),
(27, 6, 'YeNRKgZwk77fXLmM8yDjYEItj2ld8dvr', '2017-10-30 13:05:42', '2017-10-30 13:05:42'),
(29, 6, '1AAvzalzvyjJ4uszuG2B8PyCAIveZQqz', '2017-10-30 18:19:10', '2017-10-30 18:19:10'),
(30, 6, 'kHyDXEMwwIVO4FjnXZ3QCgcSigu5lBvF', '2017-11-02 10:08:08', '2017-11-02 10:08:08'),
(33, 6, '61i6PBWWxxkd8VCWNbP1ZxoGOACu44sy', '2017-11-16 13:06:46', '2017-11-16 13:06:46');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `dateToRent` date NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `color` varchar(255) NOT NULL,
  `material` varchar(255) NOT NULL,
  `size` int(11) NOT NULL,
  `waterproof` varchar(3) NOT NULL,
  `image` text NOT NULL,
  `price` double(11,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rented_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `dateToRent`, `title`, `description`, `color`, `material`, `size`, `waterproof`, `image`, `price`, `user_id`, `rented_by`) VALUES
(39, '2017-10-29', 'ghkbjnbhgg', 'gvjbn', 'Brown', 'Side Leather', 44, 'No', '{"img":[{"url":"img-20171029-png59f5186cb35099.76497443"}]}', 44.00, 6, 0),
(40, '2017-10-29', 'tfgvjjgft', 'hbkhjg', 'Brown', 'Side Leather', 44, 'No', '{"img":[{"url":"img-20171029-png59f5192f3a04a5.31153475"}]}', 44.00, 6, 0),
(41, '2017-12-01', 'jhhjb', 'hjbhjbnhgb', 'Brown', 'Side Leather', 44, 'Yes', '{"img":[{"url":"img-20171029-png59f51d997f7a69.49296729"}]}', 33.00, 7, 6);

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `permissions` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `slug`, `name`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', '{"user.create":true,"user.update":true,"user.delete":true}', '2017-10-02 12:40:12', '2017-10-02 12:40:12'),
(2, 'user', 'User', '{"user.update":true}', '2017-10-02 12:40:12', '2017-10-02 12:40:12');

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_users`
--

INSERT INTO `role_users` (`user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(6, 2, '2017-10-28 22:44:16', '2017-10-28 22:44:16'),
(7, 2, '2017-10-28 23:32:21', '2017-10-28 23:32:21');

-- --------------------------------------------------------

--
-- Table structure for table `throttle`
--

CREATE TABLE `throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `throttle`
--

INSERT INTO `throttle` (`id`, `user_id`, `type`, `ip`, `created_at`, `updated_at`) VALUES
(1, NULL, 'global', NULL, '2017-10-02 12:43:50', '2017-10-02 12:43:50'),
(2, NULL, 'ip', '127.0.0.1', '2017-10-02 12:43:50', '2017-10-02 12:43:50'),
(3, NULL, 'global', NULL, '2017-10-02 15:52:41', '2017-10-02 15:52:41'),
(4, NULL, 'ip', '127.0.0.1', '2017-10-02 15:52:41', '2017-10-02 15:52:41'),
(5, NULL, 'global', NULL, '2017-10-02 15:52:56', '2017-10-02 15:52:56'),
(6, NULL, 'ip', '127.0.0.1', '2017-10-02 15:52:56', '2017-10-02 15:52:56'),
(7, NULL, 'global', NULL, '2017-10-02 15:52:58', '2017-10-02 15:52:58'),
(8, NULL, 'ip', '127.0.0.1', '2017-10-02 15:52:58', '2017-10-02 15:52:58'),
(9, NULL, 'global', NULL, '2017-10-02 15:52:59', '2017-10-02 15:52:59'),
(10, NULL, 'ip', '127.0.0.1', '2017-10-02 15:52:59', '2017-10-02 15:52:59'),
(11, NULL, 'global', NULL, '2017-10-02 15:53:00', '2017-10-02 15:53:00'),
(12, NULL, 'ip', '127.0.0.1', '2017-10-02 15:53:00', '2017-10-02 15:53:00'),
(13, NULL, 'global', NULL, '2017-10-02 15:53:01', '2017-10-02 15:53:01'),
(14, NULL, 'ip', '127.0.0.1', '2017-10-02 15:53:01', '2017-10-02 15:53:01'),
(15, NULL, 'global', NULL, '2017-10-09 15:22:16', '2017-10-09 15:22:16'),
(16, NULL, 'ip', '127.0.0.1', '2017-10-09 15:22:16', '2017-10-09 15:22:16'),
(17, NULL, 'global', NULL, '2017-10-14 09:15:48', '2017-10-14 09:15:48'),
(18, NULL, 'ip', '::1', '2017-10-14 09:15:48', '2017-10-14 09:15:48'),
(20, NULL, 'global', NULL, '2017-10-23 10:32:09', '2017-10-23 10:32:09'),
(21, NULL, 'ip', '::1', '2017-10-23 10:32:09', '2017-10-23 10:32:09'),
(22, NULL, 'global', NULL, '2017-10-24 20:17:02', '2017-10-24 20:17:02'),
(23, NULL, 'ip', '::1', '2017-10-24 20:17:03', '2017-10-24 20:17:03'),
(25, NULL, 'global', NULL, '2017-10-28 23:23:46', '2017-10-28 23:23:46'),
(26, NULL, 'ip', '::1', '2017-10-28 23:23:46', '2017-10-28 23:23:46'),
(27, NULL, 'global', NULL, '2017-10-29 12:31:17', '2017-10-29 12:31:17'),
(28, NULL, 'ip', '::1', '2017-10-29 12:31:17', '2017-10-29 12:31:17'),
(29, NULL, 'global', NULL, '2017-10-29 12:31:27', '2017-10-29 12:31:27'),
(30, NULL, 'ip', '::1', '2017-10-29 12:31:27', '2017-10-29 12:31:27');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `permissions` text NOT NULL,
  `birthdate` date NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `last_name`, `first_name`, `permissions`, `birthdate`, `country`, `city`, `last_login`, `created_at`, `updated_at`) VALUES
(6, 'elshobokshy', 'islam20088@hotmail.com', '$2y$10$6.DmNSSrlrsweCMqBoPQqu.iWVMj/8zQXL08UusUkdFiRjMCI2Dxm', 'ELSHOBOKSHY', 'Islam', '{"user.delete":0}', '1995-04-21', 'France', 'Laxou', '2017-11-16 13:06:47', '2017-10-28 22:44:16', '2017-11-16 13:06:47'),
(7, 'test', 'test@test.com', '$2y$10$GGWoYSDSTGeS4nKkRMU.8.oR5gXKkoB.Kh.5Ppx4ThsBkfsnJn4Fq', 'test', 'test', '{"user.delete":0}', '1995-04-21', 'France', 'Nancy', '2017-10-29 01:14:51', '2017-10-28 23:32:20', '2017-10-29 01:14:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activations_user_id_foreign` (`user_id`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `persistences`
--
ALTER TABLE `persistences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `persistences_code_unique` (`code`),
  ADD KEY `persistences_user_id_foreign` (`user_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reminders_user_id_foreign` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_users_role_id_foreign` (`role_id`);

--
-- Indexes for table `throttle`
--
ALTER TABLE `throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `throttle_user_id_foreign` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_username_unique` (`username`),
  ADD UNIQUE KEY `user_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `material`
--
ALTER TABLE `material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `persistences`
--
ALTER TABLE `persistences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `throttle`
--
ALTER TABLE `throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `activations`
--
ALTER TABLE `activations`
  ADD CONSTRAINT `activations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `persistences`
--
ALTER TABLE `persistences`
  ADD CONSTRAINT `persistences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `reminders`
--
ALTER TABLE `reminders`
  ADD CONSTRAINT `reminders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `role_users`
--
ALTER TABLE `role_users`
  ADD CONSTRAINT `role_users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `role_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `throttle`
--
ALTER TABLE `throttle`
  ADD CONSTRAINT `throttle_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
