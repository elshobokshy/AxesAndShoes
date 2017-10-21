-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 21, 2017 at 03:09 PM
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
(2, 1, 'Tz8IkVnIAM4VBS0BZk1HflJbI6p5McBX', 1, '2017-10-14 09:15:39', '2017-10-14 09:15:39', '2017-10-14 09:15:39'),
(3, 2, 'paVGpS3mBExUZea7PqjM2Yuav0KNMpk8', 1, '2017-10-14 09:38:51', '2017-10-14 09:38:51', '2017-10-14 09:38:51'),
(4, 3, 'pbjfrwquHEtIcbloCdhQjxnJzvmcADTX', 1, '2017-10-14 09:44:40', '2017-10-14 09:44:40', '2017-10-14 09:44:40'),
(5, 4, 'DZpxeobucwPGvAiN27lq5yXNOCgQw8mJ', 1, '2017-10-20 09:23:39', '2017-10-20 09:23:39', '2017-10-20 09:23:39');

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
(1, 'Brown');

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
(1, 'Lether');

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
(1, 4, 'ETnHlmaQSTulS8Z6Okkhg9fxNqaesGRf', '2017-10-20 09:23:49', '2017-10-20 09:23:49'),
(2, 4, 'e6V1mcAweK9Vs38OdItRrp6pcFZ2td1t', '2017-10-20 13:50:31', '2017-10-20 13:50:31'),
(3, 4, 'ak5hJ6xbdSrNH2gqTh1osc1ZJCeMlg5F', '2017-10-20 19:44:35', '2017-10-20 19:44:35'),
(5, 4, 'LqOYiUqKgPT4woTQqT4h6UbEUCzcDLLg', '2017-10-21 09:12:29', '2017-10-21 09:12:29');

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
  `price` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `dateToRent`, `title`, `description`, `color`, `material`, `size`, `waterproof`, `image`, `price`) VALUES
(1, '2017-10-16', 'Shoes delux', 'Brodequin quasi neuf', 'Brown', 'Leather', 44, 'Yes', '{"img":[{"url":"1getinspired1.jpg"}]}', 4.00);

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
(1, 2, '2017-10-14 09:15:39', '2017-10-14 09:15:39'),
(2, 2, '2017-10-14 09:38:51', '2017-10-14 09:38:51'),
(3, 2, '2017-10-14 09:44:40', '2017-10-14 09:44:40'),
(4, 2, '2017-10-20 09:23:39', '2017-10-20 09:23:39');

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
(19, 1, 'user', NULL, '2017-10-14 09:15:48', '2017-10-14 09:15:48');

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
(1, 'LouisCuny', 'louis-cuny@orange.fr', '$2y$10$3DeOcDP8KfY8eS.qqMVXyut8UGg4jZjGc3980aAWnJ7zsDe0X5MbS', 'Cuny', 'Louis', '{"user.delete":0}', '1997-01-08', 's', 'n', '2017-10-14 09:15:39', '2017-10-14 09:15:39', '2017-10-14 09:15:39'),
(2, 'LouisCuzny', 'louis-z@orange.fr', '$2y$10$lx/PaTqrTkpm1TrPm6m2tOZgAEdkpNB.CcN110xhnoh2bqLiJlgHW', 'Cuny', 'Louis', '{"user.delete":0}', '1111-11-11', 'France', 'Nancy', '2017-10-14 09:38:51', '2017-10-14 09:38:51', '2017-10-14 09:38:51'),
(3, 'dzz', 'd@f.fr', '$2y$10$pT2AsacnGlMr/CnK93I01O5Fjrl/1kZSlkXw0h3wkiMfp9xqyYFEu', 'fs', 'fs', '{"user.delete":0}', '0003-03-09', 'z', 'z', '2017-10-14 09:44:40', '2017-10-14 09:44:40', '2017-10-14 09:44:40'),
(4, 'elshobokshy', 'islam20088@hotmail.com', '$2y$10$gjKTj6nNtW..B6qzNPTlte8q7Ros4nboYzM/CRmq/YTKbrgqo.tMm', 'ELSHOBOKSHY', 'Islam', '{"user.delete":0}', '1995-04-21', 'France', 'Nancy', '2017-10-21 09:12:29', '2017-10-20 09:23:39', '2017-10-21 09:12:29');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `material`
--
ALTER TABLE `material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `persistences`
--
ALTER TABLE `persistences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
