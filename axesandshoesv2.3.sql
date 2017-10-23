/*
 Navicat Premium Data Transfer

 Source Server         : localhost_MAMP
 Source Server Type    : MySQL
 Source Server Version : 50635
 Source Host           : localhost:3306
 Source Schema         : axesandshoes

 Target Server Type    : MySQL
 Target Server Version : 50635
 File Encoding         : 65001

 Date: 19/10/2017 15:02:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activations
-- ----------------------------
DROP TABLE IF EXISTS `activations`;
CREATE TABLE `activations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_foreign` (`user_id`),
  CONSTRAINT `activations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activations
-- ----------------------------
BEGIN;
INSERT INTO `activations` VALUES (2, 1, 'Tz8IkVnIAM4VBS0BZk1HflJbI6p5McBX', 1, '2017-10-14 11:15:39', '2017-10-14 11:15:39', '2017-10-14 11:15:39');
INSERT INTO `activations` VALUES (3, 2, 'paVGpS3mBExUZea7PqjM2Yuav0KNMpk8', 1, '2017-10-14 11:38:51', '2017-10-14 11:38:51', '2017-10-14 11:38:51');
INSERT INTO `activations` VALUES (4, 3, 'pbjfrwquHEtIcbloCdhQjxnJzvmcADTX', 1, '2017-10-14 11:44:40', '2017-10-14 11:44:40', '2017-10-14 11:44:40');
COMMIT;

-- ----------------------------
-- Table structure for color
-- ----------------------------
DROP TABLE IF EXISTS `color`;
CREATE TABLE `color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `colorName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of color
-- ----------------------------
BEGIN;
INSERT INTO `color` VALUES (1, 'Brown');
COMMIT;

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `materialName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of material
-- ----------------------------
BEGIN;
INSERT INTO `material` VALUES (1, 'Lether');
COMMIT;

-- ----------------------------
-- Table structure for persistences
-- ----------------------------
DROP TABLE IF EXISTS `persistences`;
CREATE TABLE `persistences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persistences_code_unique` (`code`),
  KEY `persistences_user_id_foreign` (`user_id`),
  CONSTRAINT `persistences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateToRent` date NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `color_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `waterproof` tinyint(1) NOT NULL,
  `image` text NOT NULL,
  `price` double(11,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES (1, '2017-10-16', 'Brodequin 1 deluxe', 'Brodequin quasi neuf trop bien', 1, 1, 44, 1, '{\"img\":[{\"url\":\"a.png\"}]}', 4.00);
INSERT INTO `product` VALUES (2, '2017-10-16', 'titre', 'Description', 1, 1, 45, 0, '', 7.00);
COMMIT;

-- ----------------------------
-- Table structure for reminders
-- ----------------------------
DROP TABLE IF EXISTS `reminders`;
CREATE TABLE `reminders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reminders_user_id_foreign` (`user_id`),
  CONSTRAINT `reminders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role_users
-- ----------------------------
DROP TABLE IF EXISTS `role_users`;
CREATE TABLE `role_users` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_role_id_foreign` (`role_id`),
  CONSTRAINT `role_users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `role_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_users
-- ----------------------------
BEGIN;
INSERT INTO `role_users` VALUES (1, 2, '2017-10-14 11:15:39', '2017-10-14 11:15:39');
INSERT INTO `role_users` VALUES (2, 2, '2017-10-14 11:38:51', '2017-10-14 11:38:51');
INSERT INTO `role_users` VALUES (3, 2, '2017-10-14 11:44:40', '2017-10-14 11:44:40');
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `permissions` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES (1, 'admin', 'Admin', '{\"user.create\":true,\"user.update\":true,\"user.delete\":true}', '2017-10-02 14:40:12', '2017-10-02 14:40:12');
INSERT INTO `roles` VALUES (2, 'user', 'User', '{\"user.update\":true}', '2017-10-02 14:40:12', '2017-10-02 14:40:12');
COMMIT;

-- ----------------------------
-- Table structure for throttle
-- ----------------------------
DROP TABLE IF EXISTS `throttle`;
CREATE TABLE `throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `throttle_user_id_foreign` (`user_id`),
  CONSTRAINT `throttle_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of throttle
-- ----------------------------
BEGIN;
INSERT INTO `throttle` VALUES (1, NULL, 'global', NULL, '2017-10-02 14:43:50', '2017-10-02 14:43:50');
INSERT INTO `throttle` VALUES (2, NULL, 'ip', '127.0.0.1', '2017-10-02 14:43:50', '2017-10-02 14:43:50');
INSERT INTO `throttle` VALUES (3, NULL, 'global', NULL, '2017-10-02 17:52:41', '2017-10-02 17:52:41');
INSERT INTO `throttle` VALUES (4, NULL, 'ip', '127.0.0.1', '2017-10-02 17:52:41', '2017-10-02 17:52:41');
INSERT INTO `throttle` VALUES (5, NULL, 'global', NULL, '2017-10-02 17:52:56', '2017-10-02 17:52:56');
INSERT INTO `throttle` VALUES (6, NULL, 'ip', '127.0.0.1', '2017-10-02 17:52:56', '2017-10-02 17:52:56');
INSERT INTO `throttle` VALUES (7, NULL, 'global', NULL, '2017-10-02 17:52:58', '2017-10-02 17:52:58');
INSERT INTO `throttle` VALUES (8, NULL, 'ip', '127.0.0.1', '2017-10-02 17:52:58', '2017-10-02 17:52:58');
INSERT INTO `throttle` VALUES (9, NULL, 'global', NULL, '2017-10-02 17:52:59', '2017-10-02 17:52:59');
INSERT INTO `throttle` VALUES (10, NULL, 'ip', '127.0.0.1', '2017-10-02 17:52:59', '2017-10-02 17:52:59');
INSERT INTO `throttle` VALUES (11, NULL, 'global', NULL, '2017-10-02 17:53:00', '2017-10-02 17:53:00');
INSERT INTO `throttle` VALUES (12, NULL, 'ip', '127.0.0.1', '2017-10-02 17:53:00', '2017-10-02 17:53:00');
INSERT INTO `throttle` VALUES (13, NULL, 'global', NULL, '2017-10-02 17:53:01', '2017-10-02 17:53:01');
INSERT INTO `throttle` VALUES (14, NULL, 'ip', '127.0.0.1', '2017-10-02 17:53:01', '2017-10-02 17:53:01');
INSERT INTO `throttle` VALUES (15, NULL, 'global', NULL, '2017-10-09 17:22:16', '2017-10-09 17:22:16');
INSERT INTO `throttle` VALUES (16, NULL, 'ip', '127.0.0.1', '2017-10-09 17:22:16', '2017-10-09 17:22:16');
INSERT INTO `throttle` VALUES (17, NULL, 'global', NULL, '2017-10-14 11:15:48', '2017-10-14 11:15:48');
INSERT INTO `throttle` VALUES (18, NULL, 'ip', '::1', '2017-10-14 11:15:48', '2017-10-14 11:15:48');
INSERT INTO `throttle` VALUES (19, 1, 'user', NULL, '2017-10-14 11:15:48', '2017-10-14 11:15:48');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_username_unique` (`username`),
  UNIQUE KEY `user_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'LouisCuny', 'louis-cuny@orange.fr', '$2y$10$3DeOcDP8KfY8eS.qqMVXyut8UGg4jZjGc3980aAWnJ7zsDe0X5MbS', 'Cuny', 'Louis', '{\"user.delete\":0}', '1997-01-08', 's', 'n', '2017-10-14 11:15:39', '2017-10-14 11:15:39', '2017-10-14 11:15:39');
INSERT INTO `user` VALUES (2, 'LouisCuzny', 'louis-z@orange.fr', '$2y$10$lx/PaTqrTkpm1TrPm6m2tOZgAEdkpNB.CcN110xhnoh2bqLiJlgHW', 'Cuny', 'Louis', '{\"user.delete\":0}', '1111-11-11', 'France', 'Nancy', '2017-10-14 11:38:51', '2017-10-14 11:38:51', '2017-10-14 11:38:51');
INSERT INTO `user` VALUES (3, 'dzz', 'd@f.fr', '$2y$10$pT2AsacnGlMr/CnK93I01O5Fjrl/1kZSlkXw0h3wkiMfp9xqyYFEu', 'fs', 'fs', '{\"user.delete\":0}', '0003-03-09', 'z', 'z', '2017-10-14 11:44:40', '2017-10-14 11:44:40', '2017-10-14 11:44:40');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
