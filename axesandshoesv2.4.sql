-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 29, 2017 at 12:37 AM
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

INSERT INTO `product`(`id`, `dateToRent`, `title`, `description`, `color`, `material`, `size`, `waterproof`, `image`, `price`) VALUES (1,CURRENT_DATE(),'Shoes for lumberjack','A simple pair of shoes I bought one day but ended up never using.','Black','Calfskin',43,'No','{"img":[{"url":"b.png"}]}', 74);
INSERT INTO `product`(`id`, `dateToRent`, `title`, `description`, `color`, `material`, `size`, `waterproof`, `image`, `price`) VALUES (2,CURRENT_DATE(),'Shoes for lumberjack','I stole them the other day because I was bored and felt like hey, why the heck not. But now I got a useless pair of shoes, so please help me get rid of them!','Other','Calfskin',33,'No','{"img":[{"url":"b.png"}]}', 66);
INSERT INTO `product`(`id`, `dateToRent`, `title`, `description`, `color`, `material`, `size`, `waterproof`, `image`, `price`) VALUES (3,CURRENT_DATE(),'Shoes for lumberjack','I found this old pair of shoes the other day when I was cleaning the house.','Black','Side Leather',44,'No','{"img":[{"url":"b.png"}]}', 96);
INSERT INTO `product`(`id`, `dateToRent`, `title`, `description`, `color`, `material`, `size`, `waterproof`, `image`, `price`) VALUES (4,CURRENT_DATE(),'Pair of shoes in very good condition','Shoes for lumberjack, and lumberjack only. Please do not rent if you are not.','Other','Pigskin',40,'No','{"img":[{"url":"a.png"}]}', 56);
INSERT INTO `product`(`id`, `dateToRent`, `title`, `description`, `color`, `material`, `size`, `waterproof`, `image`, `price`) VALUES (5,CURRENT_DATE(),'Pair of shoes in very good condition','A simple pair of shoes I bought one day but ended up never using.','Yellow','Unknown',35,'No','{"img":[{"url":"a.png"}]}', 33);
INSERT INTO `product`(`id`, `dateToRent`, `title`, `description`, `color`, `material`, `size`, `waterproof`, `image`, `price`) VALUES (6,CURRENT_DATE(),'Shoes for lumberjack','I found this old pair of shoes the other day when I was cleaning the house.','Brown','Calfskin',40,'Yes','{"img":[{"url":"a.png"}]}', 51);
INSERT INTO `product`(`id`, `dateToRent`, `title`, `description`, `color`, `material`, `size`, `waterproof`, `image`, `price`) VALUES (7,CURRENT_DATE(),'A simple pair of shoes','A simple pair of shoes I bought one day but ended up never using.','Other','Pigskin',37,'No','{"img":[{"url":"a.png"}]}', 44);
INSERT INTO `product`(`id`, `dateToRent`, `title`, `description`, `color`, `material`, `size`, `waterproof`, `image`, `price`) VALUES (8,CURRENT_DATE(),'Pair of shoes in very good condition','I found this old pair of shoes the other day when I was cleaning the house.','Black','Calfskin',37,'Yes','{"img":[{"url":"a.png"}]}', 69);
INSERT INTO `product`(`id`, `dateToRent`, `title`, `description`, `color`, `material`, `size`, `waterproof`, `image`, `price`) VALUES (9,CURRENT_DATE(),'A simple pair of shoes','Shoes for lumberjack, and lumberjack only. Please do not rent if you are not.','Yellow','Nubuck',36,'No','{"img":[{"url":"a.png"}]}', 92);
INSERT INTO `product`(`id`, `dateToRent`, `title`, `description`, `color`, `material`, `size`, `waterproof`, `image`, `price`) VALUES (10,CURRENT_DATE(),'A simple pair of shoes','I stole them the other day because I was bored and felt like hey, why the heck not. But now I got a useless pair of shoes, so please help me get rid of them!','Black','Calfskin',30,'Yes','{"img":[{"url":"b.png"}]}', 62);
INSERT INTO `product`(`id`, `dateToRent`, `title`, `description`, `color`, `material`, `size`, `waterproof`, `image`, `price`) VALUES (11,CURRENT_DATE(),'Pair of shoes in very good condition','I found this old pair of shoes the other day when I was cleaning the house.','Other','Pigskin',33,'No','{"img":[{"url":"b.png"}]}', 96);
INSERT INTO `product`(`id`, `dateToRent`, `title`, `description`, `color`, `material`, `size`, `waterproof`, `image`, `price`) VALUES (12,CURRENT_DATE(),'A simple pair of shoes','I stole them the other day because I was bored and felt like hey, why the heck not. But now I got a useless pair of shoes, so please help me get rid of them!','Yellow','Calfskin',36,'Yes','{"img":[{"url":"a.png"}]}', 84);
INSERT INTO `product`(`id`, `dateToRent`, `title`, `description`, `color`, `material`, `size`, `waterproof`, `image`, `price`) VALUES (13,CURRENT_DATE(),'A simple pair of shoes','Shoes for lumberjack, and lumberjack only. Please do not rent if you are not.','Yellow','Side Leather',34,'No','{"img":[{"url":"a.png"},{"url":"b.png"}]}', 35);
INSERT INTO `product`(`id`, `dateToRent`, `title`, `description`, `color`, `material`, `size`, `waterproof`, `image`, `price`) VALUES (14,CURRENT_DATE(),'Old boots I do not use anymore','A simple pair of shoes I bought one day but ended up never using.','Yellow','Side Leather',42,'Yes','{"img":[{"url":"a.png"},{"url":"b.png"}]}', 81);
INSERT INTO `product`(`id`, `dateToRent`, `title`, `description`, `color`, `material`, `size`, `waterproof`, `image`, `price`) VALUES (15,CURRENT_DATE(),'Pair of shoes in very good condition','A simple pair of shoes I bought one day but ended up never using.','Other','Unknown',41,'No','{"img":[{"url":"a.png"},{"url":"b.png"}]}', 50);
INSERT INTO `product`(`id`, `dateToRent`, `title`, `description`, `color`, `material`, `size`, `waterproof`, `image`, `price`) VALUES (16,CURRENT_DATE(),'Shoes for lumberjack','I stole them the other day because I was bored and felt like hey, why the heck not. But now I got a useless pair of shoes, so please help me get rid of them!','Yellow','Calfskin',42,'No','{"img":[{"url":"a.png"}]}', 61);
INSERT INTO `product`(`id`, `dateToRent`, `title`, `description`, `color`, `material`, `size`, `waterproof`, `image`, `price`) VALUES (17,CURRENT_DATE(),'Pair of shoes in very good condition','I found this old pair of shoes the other day when I was cleaning the house.','Black','Pigskin',43,'No','{"img":[{"url":"a.png"},{"url":"b.png"}]}', 82);
INSERT INTO `product`(`id`, `dateToRent`, `title`, `description`, `color`, `material`, `size`, `waterproof`, `image`, `price`) VALUES (18,CURRENT_DATE(),'Pair of shoes in very good condition','I stole them the other day because I was bored and felt like hey, why the heck not. But now I got a useless pair of shoes, so please help me get rid of them!','Brown','Nubuck',33,'No','{"img":[{"url":"a.png"}]}', 86);
INSERT INTO `product`(`id`, `dateToRent`, `title`, `description`, `color`, `material`, `size`, `waterproof`, `image`, `price`) VALUES (19,CURRENT_DATE(),'Shoes for lumberjack','A simple pair of shoes I bought one day but ended up never using.','Brown','Nubuck',41,'Yes','{"img":[{"url":"a.png"}]}', 61);
INSERT INTO `product`(`id`, `dateToRent`, `title`, `description`, `color`, `material`, `size`, `waterproof`, `image`, `price`) VALUES (20,CURRENT_DATE(),'A simple pair of shoes','I stole them the other day because I was bored and felt like hey, why the heck not. But now I got a useless pair of shoes, so please help me get rid of them!','Other','Side Leather',43,'No','{"img":[{"url":"a.png"}]}', 45);


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
(23, NULL, 'ip', '::1', '2017-10-24 20:17:03', '2017-10-24 20:17:03');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
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
