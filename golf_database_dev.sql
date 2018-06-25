-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.28-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table forge.academies
DROP TABLE IF EXISTS `academies`;
CREATE TABLE IF NOT EXISTS `academies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `dec` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.academies: ~21 rows (approximately)
DELETE FROM `academies`;
/*!40000 ALTER TABLE `academies` DISABLE KEYS */;
INSERT INTO `academies` (`id`, `deleted_at`, `created_at`, `updated_at`, `name`, `address`, `phone`, `dec`) VALUES
	(1, NULL, '2018-03-20 14:13:34', '2018-03-22 22:10:10', 'Massachusetts Institute of Technology', '77 Massachusetts Ave, Cambridge, MA 02139, USA', '849203746', ''),
	(2, NULL, '2018-03-20 14:13:51', '2018-03-22 22:10:15', 'Stanford University', '450 Serra Mall, Stanford, CA 94305, USA', '849203746', 'asdfaf'),
	(3, NULL, '2018-03-20 14:14:04', '2018-03-20 14:21:07', 'Harvard University', 'Cambridge, MA 02138, USA', '', ''),
	(4, NULL, '2018-03-20 14:14:13', '2018-03-20 14:21:34', 'University of Cambridge', 'The Old Schools, Trinity Ln, Cambridge CB2 1TN, UK', '', ''),
	(5, NULL, '2018-03-20 14:14:25', '2018-03-20 14:21:56', 'California Institute of Technology (Caltech)', '1200 E California Blvd, Pasadena, CA 91125, USA', '', ''),
	(6, NULL, '2018-03-20 14:14:34', '2018-03-20 14:14:34', 'University of Oxford', '', '', ''),
	(7, NULL, '2018-03-20 14:14:42', '2018-03-20 14:14:42', 'UCL (University College London)', '', '', ''),
	(8, NULL, '2018-03-20 14:14:50', '2018-03-20 14:14:50', 'ETH Zurich – Swiss Federal Institute of Technology', '', '', ''),
	(9, NULL, '2018-03-20 14:15:01', '2018-03-20 14:15:01', 'Imperial College London', '', '', ''),
	(10, NULL, '2018-03-20 14:15:14', '2018-03-20 14:22:57', 'University of Chicago', 'DePaul Art Museum, 935 W Fullerton Ave, Chicago, IL 60614, USA', '', ''),
	(11, NULL, '2018-03-20 14:15:23', '2018-03-20 14:15:23', 'Princeton University', '', '', ''),
	(12, NULL, '2018-03-20 14:15:30', '2018-03-20 14:15:30', 'National University of Singapore (NUS)', '', '', ''),
	(13, NULL, '2018-03-20 14:15:40', '2018-03-20 14:15:40', 'Nanyang Technological University, Singapore (NTU)', '', '', ''),
	(14, NULL, '2018-03-20 14:16:17', '2018-03-20 14:16:17', 'Ecole Polytechnique Fédérale de Lausanne (EPFL)', '', '', ''),
	(15, NULL, '2018-03-20 14:16:29', '2018-03-20 14:16:29', 'Yale University', '', '', ''),
	(16, NULL, '2018-03-20 14:16:41', '2018-03-20 14:16:41', 'Cornell University', '', '', ''),
	(17, NULL, '2018-03-20 14:16:52', '2018-03-20 14:16:52', 'Johns Hopkins University', '', '', ''),
	(18, NULL, '2018-03-20 14:17:03', '2018-03-20 14:17:03', 'University of Pennsylvania', '', '', ''),
	(19, NULL, '2018-03-20 14:17:13', '2018-03-20 14:17:13', 'University of Edinburgh', '', '', ''),
	(20, NULL, '2018-03-20 14:17:23', '2018-03-20 14:17:23', 'Columbia University', '', '', ''),
	(21, NULL, '2018-03-20 14:17:33', '2018-03-20 14:17:33', 'King’s College London', '', '', '');
/*!40000 ALTER TABLE `academies` ENABLE KEYS */;

-- Dumping structure for table forge.actual_stats
DROP TABLE IF EXISTS `actual_stats`;
CREATE TABLE IF NOT EXISTS `actual_stats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `stat_id` int(11) DEFAULT '1',
  `scoring` float DEFAULT '1',
  `fairway` float DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `green` float DEFAULT '1',
  `putting` float DEFAULT '1',
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table forge.actual_stats: ~0 rows (approximately)
DELETE FROM `actual_stats`;
/*!40000 ALTER TABLE `actual_stats` DISABLE KEYS */;
INSERT INTO `actual_stats` (`id`, `created_at`, `stat_id`, `scoring`, `fairway`, `deleted_at`, `green`, `putting`, `updated_at`) VALUES
	(1, '2018-03-20 07:02:31', 1, 84, 16, NULL, 32, 2.8, '2018-03-20 07:10:21');
/*!40000 ALTER TABLE `actual_stats` ENABLE KEYS */;

-- Dumping structure for table forge.backups
DROP TABLE IF EXISTS `backups`;
CREATE TABLE IF NOT EXISTS `backups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `file_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backup_size` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `backups_name_unique` (`name`),
  UNIQUE KEY `backups_file_name_unique` (`file_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.backups: ~0 rows (approximately)
DELETE FROM `backups`;
/*!40000 ALTER TABLE `backups` DISABLE KEYS */;
/*!40000 ALTER TABLE `backups` ENABLE KEYS */;

-- Dumping structure for table forge.ball_striking_stats
DROP TABLE IF EXISTS `ball_striking_stats`;
CREATE TABLE IF NOT EXISTS `ball_striking_stats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `stat_id` int(11) DEFAULT '1',
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twenty_ft` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `btw_twenty_forty` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `miss_green` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table forge.ball_striking_stats: ~3 rows (approximately)
DELETE FROM `ball_striking_stats`;
/*!40000 ALTER TABLE `ball_striking_stats` DISABLE KEYS */;
INSERT INTO `ball_striking_stats` (`id`, `created_at`, `stat_id`, `updated_at`, `deleted_at`, `name`, `twenty_ft`, `btw_twenty_forty`, `miss_green`) VALUES
	(1, NULL, 1, NULL, NULL, 'driving', '48', '24', '16'),
	(2, NULL, 1, NULL, NULL, 'greens', '48', '24', '16'),
	(3, NULL, 1, NULL, NULL, 'putting', '48', '24', '16');
/*!40000 ALTER TABLE `ball_striking_stats` ENABLE KEYS */;

-- Dumping structure for table forge.chapters
DROP TABLE IF EXISTS `chapters`;
CREATE TABLE IF NOT EXISTS `chapters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `chapters_module_id_foreign` (`module_id`),
  CONSTRAINT `chapters_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `unimodules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.chapters: ~12 rows (approximately)
DELETE FROM `chapters`;
/*!40000 ALTER TABLE `chapters` DISABLE KEYS */;
INSERT INTO `chapters` (`id`, `deleted_at`, `created_at`, `updated_at`, `name`, `module_id`) VALUES
	(1, NULL, '2018-03-22 22:18:33', '2018-03-22 22:18:33', 'Algebra', 12),
	(2, NULL, '2018-03-22 22:18:45', '2018-03-22 22:18:45', 'Combinatorics', 12),
	(3, NULL, '2018-03-22 22:18:55', '2018-03-22 22:18:55', 'Mathematical physics', 12),
	(4, NULL, '2018-03-22 22:19:09', '2018-03-22 22:19:09', 'Mathematicians', 1),
	(5, NULL, '2018-03-22 22:19:18', '2018-03-22 22:19:18', 'Game theory', 1),
	(6, NULL, '2018-03-22 22:19:33', '2018-03-22 22:19:33', 'Calculus and analysis', 12),
	(7, NULL, '2018-03-22 22:19:41', '2018-03-22 22:19:41', 'HTML', 5),
	(8, NULL, '2018-03-22 22:19:48', '2018-03-22 22:19:48', 'CSS', 6),
	(9, NULL, '2018-03-22 22:19:56', '2018-03-22 22:19:56', 'JavaScript', 8),
	(10, NULL, '2018-03-22 22:20:07', '2018-03-22 22:20:07', 'MongoDB', 8),
	(11, NULL, '2018-03-22 22:20:16', '2018-03-22 22:20:16', 'Algorithms', 8),
	(12, NULL, '2018-03-22 22:20:27', '2018-03-22 22:20:27', 'NodeJS', 8);
/*!40000 ALTER TABLE `chapters` ENABLE KEYS */;

-- Dumping structure for table forge.conversations
DROP TABLE IF EXISTS `conversations`;
CREATE TABLE IF NOT EXISTS `conversations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_from` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table forge.conversations: ~19 rows (approximately)
DELETE FROM `conversations`;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
INSERT INTO `conversations` (`id`, `message_to`, `message_from`, `message`, `image`, `created_at`, `updated_at`) VALUES
	(259, '1', '4', 'hi', NULL, '2018-04-22 21:37:44', '2018-04-22 21:37:44'),
	(260, '1', '4', 'there?', NULL, '2018-04-22 21:37:57', '2018-04-22 21:37:57'),
	(261, '1', '4', 'there?', NULL, '2018-04-22 21:38:06', '2018-04-22 21:38:06'),
	(262, '1', '4', 'woooo', NULL, '2018-04-22 21:38:21', '2018-04-22 21:38:21'),
	(263, '4', '1', 'yes brother', NULL, '2018-04-22 21:47:31', '2018-04-22 21:47:31'),
	(264, '4', '1', 'sasa', NULL, '2018-04-22 21:48:17', '2018-04-22 21:48:17'),
	(265, '4', '1', 'sasa', NULL, '2018-04-22 21:48:20', '2018-04-22 21:48:20'),
	(266, '4', '1', 'sasa', NULL, '2018-04-22 21:49:15', '2018-04-22 21:49:15'),
	(267, '4', '1', 'saasa', NULL, '2018-04-22 21:49:18', '2018-04-22 21:49:18'),
	(268, '4', '1', 'sasa', NULL, '2018-04-22 21:49:20', '2018-04-22 21:49:20'),
	(269, '1', '4', 'sasasa', NULL, '2018-04-22 21:50:05', '2018-04-22 21:50:05'),
	(270, '1', '4', 'sasas', NULL, '2018-04-22 21:50:17', '2018-04-22 21:50:17'),
	(271, '1', '4', 'sasa', NULL, '2018-04-22 21:51:36', '2018-04-22 21:51:36'),
	(272, '1', '4', 'sasasa', NULL, '2018-04-22 21:51:47', '2018-04-22 21:51:47'),
	(273, '1', '4', 'dum dum', NULL, '2018-04-22 21:52:04', '2018-04-22 21:52:04'),
	(274, '4', '1', 'ssasa', NULL, '2018-04-22 21:53:46', '2018-04-22 21:53:46'),
	(275, '4', '1', 'sasas', NULL, '2018-04-22 21:55:43', '2018-04-22 21:55:43'),
	(276, '1', '4', 'sasasasa', NULL, '2018-04-22 21:55:49', '2018-04-22 21:55:49'),
	(277, '4', '1', 'sasaseaasaas', NULL, '2018-04-22 21:55:58', '2018-04-22 21:55:58');
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;

-- Dumping structure for table forge.courses
DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `academy_id` int(10) unsigned NOT NULL DEFAULT '1',
  `description` varchar(10000) COLLATE utf8_unicode_ci NOT NULL,
  `featureimage` int(11) NOT NULL,
  `content` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `modules_ids` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `course_chapters` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `course_skills` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `course_video` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  PRIMARY KEY (`id`),
  KEY `courses_academy_id_foreign` (`academy_id`),
  CONSTRAINT `courses_academy_id_foreign` FOREIGN KEY (`academy_id`) REFERENCES `academies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.courses: ~14 rows (approximately)
DELETE FROM `courses`;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` (`id`, `deleted_at`, `created_at`, `updated_at`, `name`, `academy_id`, `description`, `featureimage`, `content`, `modules_ids`, `course_chapters`, `course_skills`, `course_video`) VALUES
	(1, NULL, '2018-03-20 14:23:38', '2018-04-22 00:49:15', '2001-2002 Programs and Modules', 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi porta eget tortor quis pretium. Integer vehicula lorem quis tellus vehicula, ut pulvinar eros consequat. Nunc sem est, mattis rutrum efficitur at, tempus in turpis. Vestibulum eu sem faucibus.', 1, '', '["2","4","5"]', '["2","4","5"]', '["2","3","4"]', '["2","4"]'),
	(2, NULL, '2018-03-20 14:23:49', '2018-04-21 08:10:30', '2002-2003 Programs and Modules', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi porta eget tortor quis pretium. Integer vehicula lorem quis tellus vehicula, ut pulvinar eros consequat. Nunc sem est, mattis rutrum efficitur at, tempus in turpis. Vestibulum eu sem faucibus.<br>', 1, '', '["2","4"]', '[]', '', '[]'),
	(3, NULL, '2018-03-20 14:23:57', '2018-04-21 08:10:59', '2001-2002 Programs and Modules', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi porta eget tortor quis pretium. Integer vehicula lorem quis tellus vehicula, ut pulvinar eros consequat. Nunc sem est, mattis rutrum efficitur at, tempus in turpis. Vestibulum eu sem faucibus.', 2, '', '["2","4"]', '[]', '', '[]'),
	(4, NULL, '2018-03-20 14:24:39', '2018-04-21 08:11:04', '2011-2012 Programs and Modules', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi porta eget tortor quis pretium. Integer vehicula lorem quis tellus vehicula, ut pulvinar eros consequat. Nunc sem est, mattis rutrum efficitur at, tempus in turpis. Vestibulum eu sem faucibus.', 2, '', '["2","4"]', '[]', '', '[]'),
	(5, NULL, '2018-03-20 14:24:47', '2018-04-21 08:11:11', '2012-2013 Programs and Modules', 17, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi porta eget tortor quis pretium. Integer vehicula lorem quis tellus vehicula, ut pulvinar eros consequat. Nunc sem est, mattis rutrum efficitur at, tempus in turpis. Vestibulum eu sem faucibus.', 1, '', '["2","4"]', '[]', '', '[]'),
	(6, NULL, '2018-03-20 14:24:55', '2018-04-21 08:11:17', '2004-2005 Programs and Modules', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi porta eget tortor quis pretium. Integer vehicula lorem quis tellus vehicula, ut pulvinar eros consequat. Nunc sem est, mattis rutrum efficitur at, tempus in turpis. Vestibulum eu sem faucibus.', 1, '', '["2","4"]', '[]', '', '[]'),
	(7, NULL, '2018-03-20 14:25:05', '2018-04-21 07:18:59', '2007-2008 Programs and Modules', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi porta eget tortor quis pretium. Integer vehicula lorem quis tellus vehicula, ut pulvinar eros consequat. Nunc sem est, mattis rutrum efficitur at, tempus in turpis. Vestibulum eu sem faucibus.', 0, '', '[]', '[]', '', '[]'),
	(8, NULL, '2018-03-20 14:25:29', '2018-03-22 22:15:01', '2013-2014 Programs and Modules', 1, '', 0, '', '[]', '[]', '', '[]'),
	(9, NULL, '2018-03-20 14:25:40', '2018-04-21 07:19:02', '2015-2016 Programs and Modules', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi porta eget tortor quis pretium. Integer vehicula lorem quis tellus vehicula, ut pulvinar eros consequat. Nunc sem est, mattis rutrum efficitur at, tempus in turpis. Vestibulum eu sem faucibus.', 0, '', '["2","4"]', '[]', '', '[]'),
	(10, NULL, '2018-03-20 14:25:49', '2018-04-21 07:19:04', '2018-2029 Programs and Modules', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi porta eget tortor quis pretium. Integer vehicula lorem quis tellus vehicula, ut pulvinar eros consequat. Nunc sem est, mattis rutrum efficitur at, tempus in turpis. Vestibulum eu sem faucibus.', 0, '', '[]', '[]', '', '[]'),
	(11, NULL, '2018-03-20 14:25:56', '2018-03-20 14:25:56', 'Visual Arts', 1, '', 0, '', '[]', '[]', '', '[]'),
	(12, NULL, '2018-03-20 14:26:03', '2018-03-20 14:26:03', 'Multimedia Journalism', 1, '', 0, '', '[]', '[]', '', '[]'),
	(13, NULL, '2018-03-20 14:26:14', '2018-03-20 14:26:14', 'Electrical & Computer Engineering 2+2 Program', 1, '', 0, '', '["2","4"]', '[]', '', '[]'),
	(14, NULL, '2018-03-20 14:31:27', '2018-03-20 14:31:27', 'History', 17, '', 0, '', '[]', '[]', '', '[]');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;

-- Dumping structure for table forge.course_skills
DROP TABLE IF EXISTS `course_skills`;
CREATE TABLE IF NOT EXISTS `course_skills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `skill_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.course_skills: ~0 rows (approximately)
DELETE FROM `course_skills`;
/*!40000 ALTER TABLE `course_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_skills` ENABLE KEYS */;

-- Dumping structure for table forge.departments
DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tags` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `color` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `departments_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.departments: ~3 rows (approximately)
DELETE FROM `departments`;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` (`id`, `name`, `tags`, `color`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'Administration', '[]', '#000', NULL, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(2, 'Teacher', '[]', '#FF0000', '2018-03-22 12:09:39', '2018-03-22 12:04:49', '2018-03-22 12:09:39'),
	(3, 'Student', '[]', '#0000FF', '2018-03-22 12:09:41', '2018-03-22 12:08:39', '2018-03-22 12:09:41');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;

-- Dumping structure for table forge.driving_stats
DROP TABLE IF EXISTS `driving_stats`;
CREATE TABLE IF NOT EXISTS `driving_stats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `stat_id` int(11) DEFAULT '1',
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `left` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `right` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fairway` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table forge.driving_stats: ~3 rows (approximately)
DELETE FROM `driving_stats`;
/*!40000 ALTER TABLE `driving_stats` DISABLE KEYS */;
INSERT INTO `driving_stats` (`id`, `created_at`, `stat_id`, `updated_at`, `deleted_at`, `name`, `left`, `right`, `fairway`) VALUES
	(1, NULL, 1, NULL, NULL, 'driving', '48', '24', '16'),
	(2, NULL, 1, NULL, NULL, 'greens', '48', '24', '16'),
	(3, NULL, 1, NULL, NULL, 'putting', '48', '24', '16');
/*!40000 ALTER TABLE `driving_stats` ENABLE KEYS */;

-- Dumping structure for table forge.employees
DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `designation` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gender` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Male',
  `mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mobile2` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dept` int(10) unsigned NOT NULL DEFAULT '1',
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_birth` date NOT NULL DEFAULT '1990-01-01',
  `date_hire` date NOT NULL,
  `date_left` date NOT NULL DEFAULT '1990-01-01',
  `salary_cur` decimal(15,3) NOT NULL DEFAULT '0.000',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_email_unique` (`email`),
  KEY `employees_dept_foreign` (`dept`),
  CONSTRAINT `employees_dept_foreign` FOREIGN KEY (`dept`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.employees: ~0 rows (approximately)
DELETE FROM `employees`;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`id`, `name`, `designation`, `gender`, `mobile`, `mobile2`, `email`, `dept`, `city`, `address`, `about`, `date_birth`, `date_hire`, `date_left`, `salary_cur`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'Super Admin', 'Male', '8888888888', '', 'admin@golf.com', 1, 'Pune', 'Karve nagar, Pune 411030', 'About user / biography', '2018-03-20', '2018-03-20', '2018-03-20', 0.000, NULL, '2018-03-20 14:02:42', '2018-03-20 14:02:42');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;

-- Dumping structure for table forge.goal_stats
DROP TABLE IF EXISTS `goal_stats`;
CREATE TABLE IF NOT EXISTS `goal_stats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `stat_id` int(11) DEFAULT '1',
  `scoring` float DEFAULT '1',
  `fairway` float DEFAULT '1',
  `green` float DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `putting` float DEFAULT '1',
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table forge.goal_stats: ~0 rows (approximately)
DELETE FROM `goal_stats`;
/*!40000 ALTER TABLE `goal_stats` DISABLE KEYS */;
INSERT INTO `goal_stats` (`id`, `created_at`, `stat_id`, `scoring`, `fairway`, `green`, `deleted_at`, `putting`, `updated_at`) VALUES
	(1, '2018-03-20 07:02:31', 1, 84, 16, 32, NULL, 2.8, '2018-03-20 07:10:21');
/*!40000 ALTER TABLE `goal_stats` ENABLE KEYS */;

-- Dumping structure for table forge.la_configs
DROP TABLE IF EXISTS `la_configs`;
CREATE TABLE IF NOT EXISTS `la_configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `section` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.la_configs: ~13 rows (approximately)
DELETE FROM `la_configs`;
/*!40000 ALTER TABLE `la_configs` DISABLE KEYS */;
INSERT INTO `la_configs` (`id`, `key`, `section`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'sitename', '', 'Golf Management', '2018-03-20 14:02:31', '2018-03-20 14:10:21'),
	(2, 'sitename_part1', '', 'Golf', '2018-03-20 14:02:31', '2018-03-20 14:10:21'),
	(3, 'sitename_part2', '', 'Management', '2018-03-20 14:02:31', '2018-03-20 14:10:21'),
	(4, 'sitename_short', '', 'GM', '2018-03-20 14:02:31', '2018-03-20 14:10:21'),
	(5, 'site_description', '', 'Golf Management is an admin panel for golf.', '2018-03-20 14:02:31', '2018-03-20 14:10:21'),
	(6, 'sidebar_search', '', '0', '2018-03-20 14:02:31', '2018-03-20 14:10:21'),
	(7, 'show_messages', '', '0', '2018-03-20 14:02:31', '2018-03-20 14:10:21'),
	(8, 'show_notifications', '', '0', '2018-03-20 14:02:31', '2018-03-20 14:10:21'),
	(9, 'show_tasks', '', '0', '2018-03-20 14:02:31', '2018-03-20 14:10:21'),
	(10, 'show_rightsidebar', '', '0', '2018-03-20 14:02:31', '2018-03-20 14:10:21'),
	(11, 'skin', '', 'skin-white', '2018-03-20 14:02:31', '2018-03-20 14:10:21'),
	(12, 'layout', '', 'fixed', '2018-03-20 14:02:31', '2018-03-20 14:10:21'),
	(13, 'default_email', '', 'test@example.com', '2018-03-20 14:02:31', '2018-03-20 14:10:21');
/*!40000 ALTER TABLE `la_configs` ENABLE KEYS */;

-- Dumping structure for table forge.la_menus
DROP TABLE IF EXISTS `la_menus`;
CREATE TABLE IF NOT EXISTS `la_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fa-cube',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'module',
  `parent` int(10) unsigned NOT NULL DEFAULT '0',
  `hierarchy` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.la_menus: ~14 rows (approximately)
DELETE FROM `la_menus`;
/*!40000 ALTER TABLE `la_menus` DISABLE KEYS */;
INSERT INTO `la_menus` (`id`, `name`, `url`, `icon`, `type`, `parent`, `hierarchy`, `created_at`, `updated_at`) VALUES
	(2, 'Users', 'users', 'fa-group', 'module', 0, 7, '2018-03-20 14:02:30', '2018-04-23 09:25:40'),
	(6, 'Roles', 'roles', 'fa-user-plus', 'module', 0, 4, '2018-03-20 14:02:30', '2018-04-23 09:25:40'),
	(9, 'Academies', 'academies', 'fa fa-cube', 'module', 17, 1, '2018-03-20 14:04:41', '2018-03-22 12:16:39'),
	(10, 'Courses', 'courses', 'fa fa-cube', 'module', 17, 2, '2018-03-20 14:06:55', '2018-03-22 12:16:55'),
	(11, 'Chapters', 'chapters', 'fa fa-cube', 'module', 17, 4, '2018-03-20 14:07:25', '2018-03-22 12:28:14'),
	(12, 'Plans', 'plans', 'fa fa-cube', 'module', 0, 1, '2018-03-20 14:08:52', '2018-04-23 09:25:54'),
	(14, 'Messages', 'messages', 'fa fa-cube', 'module', 0, 2, '2018-03-20 19:35:56', '2018-04-23 09:25:54'),
	(15, 'Departments', 'departments', 'fa-tags', 'module', 0, 5, '2018-03-22 12:04:14', '2018-04-23 09:25:40'),
	(16, 'Employees', 'employees', 'fa-group', 'module', 0, 6, '2018-03-22 12:04:17', '2018-04-23 09:25:40'),
	(17, 'Learning System', '#', 'fa-group', 'custom', 0, 8, '2018-03-22 12:11:37', '2018-04-23 09:25:41'),
	(18, 'UniModules', 'unimodules', 'fa fa-cube', 'module', 17, 3, '2018-03-22 12:24:15', '2018-03-22 12:28:14'),
	(19, 'Members', 'members', 'fa fa-cube', 'module', 17, 7, '2018-03-22 13:21:07', '2018-04-23 09:20:05'),
	(20, 'Videos', 'videos', 'fa fa-cube', 'module', 17, 6, '2018-03-22 22:25:41', '2018-04-23 09:20:05'),
	(22, 'Course_Skills', 'course_skills', 'fa fa-align-justify', 'module', 17, 5, '2018-04-23 09:25:08', '2018-04-23 09:25:41');
/*!40000 ALTER TABLE `la_menus` ENABLE KEYS */;

-- Dumping structure for table forge.members
DROP TABLE IF EXISTS `members`;
CREATE TABLE IF NOT EXISTS `members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `UserName` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `members_username_foreign` (`UserName`),
  CONSTRAINT `members_username_foreign` FOREIGN KEY (`UserName`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.members: ~0 rows (approximately)
DELETE FROM `members`;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
/*!40000 ALTER TABLE `members` ENABLE KEYS */;

-- Dumping structure for table forge.messages
DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` varchar(10000) COLLATE utf8_unicode_ci NOT NULL,
  `from` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `messages_from_foreign` (`from`),
  CONSTRAINT `messages_from_foreign` FOREIGN KEY (`from`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.messages: ~0 rows (approximately)
DELETE FROM `messages`;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` (`id`, `deleted_at`, `created_at`, `updated_at`, `title`, `content`, `from`) VALUES
	(1, NULL, '2018-03-20 19:37:31', '2018-03-20 19:37:31', 'To admin', 'abcde', 2);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;

-- Dumping structure for table forge.messages_new
DROP TABLE IF EXISTS `messages_new`;
CREATE TABLE IF NOT EXISTS `messages_new` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(5) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `sent_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sender` int(5) unsigned NOT NULL,
  `receiver` int(5) unsigned NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table forge.messages_new: ~49 rows (approximately)
DELETE FROM `messages_new`;
/*!40000 ALTER TABLE `messages_new` DISABLE KEYS */;
INSERT INTO `messages_new` (`id`, `type`, `message`, `sent_at`, `sender`, `receiver`, `status`) VALUES
	(1, 0, 'Test', '2018-04-26 04:38:41', 1, 1, 1),
	(2, 0, 'TAFD', '2018-04-26 04:40:32', 1, 2, 1),
	(3, 0, 'asdfasdf', '2018-04-26 05:35:40', 1, 2, 1),
	(4, 0, 'asdf', '2018-04-26 05:51:28', 1, 2, 1),
	(5, 0, 'aaa', '2018-04-26 05:52:04', 1, 2, 1),
	(6, 0, 'asdf', '2018-04-26 05:52:08', 1, 2, 1),
	(7, 0, 'sadfasdf', '2018-04-26 05:52:11', 1, 2, 1),
	(8, 0, 'aaa', '2018-04-26 05:52:13', 1, 2, 1),
	(9, 0, 'asdf', '2018-04-26 05:52:16', 1, 2, 1),
	(10, 0, 'asdfasdf', '2018-04-26 05:55:03', 1, 2, 1),
	(11, 0, 'asdf', '2018-04-26 05:55:08', 1, 2, 1),
	(12, 0, 'kj', '2018-04-26 05:55:41', 1, 2, 1),
	(13, 0, 'asdf', '2018-04-26 05:56:37', 1, 2, 1),
	(14, 0, 'asdfasdf', '2018-04-26 05:56:40', 1, 2, 1),
	(15, 0, 'asdfasdf', '2018-04-26 05:56:42', 1, 2, 1),
	(16, 0, 'asdf', '2018-04-26 06:00:14', 1, 2, 1),
	(17, 0, 'asdf', '2018-04-26 06:00:16', 1, 2, 1),
	(18, 0, 'asdfas', '2018-04-26 06:00:19', 2, 1, 1),
	(19, 0, 'Thank you', '2018-04-26 06:03:50', 2, 1, 1),
	(20, 0, 'How are you', '2018-04-26 06:03:56', 1, 2, 1),
	(21, 0, 'Thanks ', '2018-04-26 06:04:02', 1, 2, 1),
	(22, 0, 'asdfasd I am going to eat out sometimes just pushed code ', '2018-04-26 06:09:29', 2, 1, 1),
	(23, 0, 'Test', '2018-04-26 06:29:47', 1, 2, 1),
	(24, 0, 'How old are you?', '2018-04-26 06:29:55', 1, 2, 1),
	(25, 0, 'I am 32 years old', '2018-04-26 06:30:01', 1, 2, 1),
	(26, 0, 'Hello', '2018-04-26 06:41:29', 1, 3, 1),
	(27, 0, 'How are you?', '2018-04-26 06:41:50', 1, 3, 1),
	(28, 0, 'Are you there?', '2018-04-26 06:41:57', 1, 3, 1),
	(29, 0, 'asdf', '2018-04-26 07:23:00', 1, 2, 1),
	(30, 0, 'asdfasd', '2018-04-26 07:23:03', 1, 2, 1),
	(31, 0, 'asdf', '2018-04-26 07:23:05', 1, 2, 1),
	(32, 0, 'asdf', '2018-04-26 07:23:07', 1, 2, 1),
	(33, 0, 'asdf', '2018-04-26 07:24:30', 1, 2, 1),
	(34, 0, 'asdf', '2018-04-26 07:24:31', 1, 2, 1),
	(35, 0, 'aaaaaaaaaaaaaaaa', '2018-04-26 07:24:35', 1, 2, 1),
	(36, 0, 'asssssssssssssssssssssssssssssssssssss', '2018-04-26 07:24:40', 1, 2, 1),
	(37, 0, 'asdfffffff', '2018-04-26 07:24:50', 1, 2, 1),
	(38, 0, 'asdf', '2018-04-26 07:24:51', 1, 2, 1),
	(39, 0, 'sadffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff', '2018-04-26 07:25:00', 1, 2, 1),
	(40, 0, 'asdf', '2018-04-26 07:25:03', 1, 2, 1),
	(41, 0, ' asdf asdf ', '2018-04-26 07:25:05', 1, 2, 1),
	(42, 1, 'data:image/jpeg;base64,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', '2018-04-26 13:29:59', 1, 2, 1),
	(43, 0, 'aaa', '2018-04-26 13:46:24', 1, 2, 1),
	(44, 0, 'asdf', '2018-04-26 13:46:32', 1, 2, 1),
	(45, 0, 'Type Message', '2018-04-26 13:46:39', 1, 2, 1),
	(46, 0, 'asdf', '2018-04-26 13:46:42', 1, 2, 1),
	(47, 0, 'asdfasdf', '2018-04-28 18:50:12', 1, 2, 1),
	(48, 0, 'Admin', '2018-04-28 18:50:17', 1, 2, 1),
	(49, 0, 'Test', '2018-04-28 18:50:19', 1, 2, 1),
	(50, 0, 'asdf', '2018-04-28 22:28:43', 1, 2, 1),
	(51, 0, 'Test', '2018-04-28 22:28:58', 1, 2, 1);
/*!40000 ALTER TABLE `messages_new` ENABLE KEYS */;

-- Dumping structure for table forge.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.migrations: ~18 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`migration`, `batch`) VALUES
	('2014_05_26_050000_create_modules_table', 1),
	('2014_05_26_055000_create_module_field_types_table', 1),
	('2014_05_26_060000_create_module_fields_table', 1),
	('2014_10_12_000000_create_users_table', 1),
	('2014_10_12_100000_create_password_resets_table', 1),
	('2014_12_01_000000_create_uploads_table', 1),
	('2016_05_26_064006_create_departments_table', 1),
	('2016_05_26_064007_create_employees_table', 1),
	('2016_05_26_064446_create_roles_table', 1),
	('2016_07_05_115343_create_role_user_table', 1),
	('2016_07_06_140637_create_organizations_table', 1),
	('2016_07_07_134058_create_backups_table', 1),
	('2016_07_07_134058_create_menus_table', 1),
	('2016_09_10_163337_create_permissions_table', 1),
	('2016_09_10_163520_create_permission_role_table', 1),
	('2016_09_22_105958_role_module_fields_table', 1),
	('2016_09_22_110008_role_module_table', 1),
	('2016_10_06_115413_create_la_configs_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table forge.modules
DROP TABLE IF EXISTS `modules`;
CREATE TABLE IF NOT EXISTS `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name_db` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `view_col` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fa_icon` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fa-cube',
  `is_gen` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.modules: ~18 rows (approximately)
DELETE FROM `modules`;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` (`id`, `name`, `label`, `name_db`, `view_col`, `model`, `controller`, `fa_icon`, `is_gen`, `created_at`, `updated_at`) VALUES
	(1, 'Users', 'Users', 'users', 'name', 'User', 'UsersController', 'fa-group', 1, '2018-03-20 14:02:29', '2018-03-20 14:02:31'),
	(2, 'Uploads', 'Uploads', 'uploads', 'name', 'Upload', 'UploadsController', 'fa-files-o', 1, '2018-03-20 14:02:29', '2018-03-20 14:02:31'),
	(3, 'Departments', 'Departments', 'departments', 'name', 'Department', 'DepartmentsController', 'fa-tags', 1, '2018-03-20 14:02:29', '2018-03-20 14:02:31'),
	(4, 'Employees', 'Employees', 'employees', 'name', 'Employee', 'EmployeesController', 'fa-group', 1, '2018-03-20 14:02:30', '2018-03-20 14:02:31'),
	(5, 'Roles', 'Roles', 'roles', 'name', 'Role', 'RolesController', 'fa-user-plus', 1, '2018-03-20 14:02:30', '2018-03-20 14:02:31'),
	(6, 'Organizations', 'Organizations', 'organizations', 'name', 'Organization', 'OrganizationsController', 'fa-university', 1, '2018-03-20 14:02:30', '2018-03-20 14:02:31'),
	(7, 'Backups', 'Backups', 'backups', 'name', 'Backup', 'BackupsController', 'fa-hdd-o', 1, '2018-03-20 14:02:30', '2018-03-20 14:02:31'),
	(8, 'Permissions', 'Permissions', 'permissions', 'name', 'Permission', 'PermissionsController', 'fa-magic', 1, '2018-03-20 14:02:30', '2018-03-20 14:02:31'),
	(9, 'Academies', 'Academies', 'academies', 'name', 'Academy', 'AcademiesController', 'fa-cube', 1, '2018-03-20 14:04:05', '2018-03-20 14:04:41'),
	(10, 'Courses', 'Courses', 'courses', 'name', 'Course', 'CoursesController', 'fa-cube', 1, '2018-03-20 14:06:35', '2018-03-20 14:06:55'),
	(11, 'Chapters', 'Chapters', 'chapters', 'name', 'Chapter', 'ChaptersController', 'fa-cube', 1, '2018-03-20 14:07:10', '2018-03-20 14:07:25'),
	(12, 'Plans', 'Plans', 'plans', 'name', 'Plan', 'PlansController', 'fa-cube', 1, '2018-03-20 14:08:33', '2018-03-20 14:08:52'),
	(13, 'Skills', 'Skills', 'skills', 'name', 'Skill', 'SkillsController', 'fa-cube', 1, '2018-03-20 14:09:23', '2018-03-20 14:09:39'),
	(14, 'Messages', 'Messages', 'messages', 'title', 'Message', 'MessagesController', 'fa-cube', 1, '2018-03-20 19:34:29', '2018-03-20 19:35:56'),
	(16, 'UniModules', 'UniModules', 'unimodules', 'name', 'UniModule', 'UniModulesController', 'fa-cube', 1, '2018-03-22 12:23:06', '2018-03-22 12:24:15'),
	(17, 'Members', 'Members', 'members', 'UserName', 'Member', 'MembersController', 'fa-cube', 1, '2018-03-22 13:20:21', '2018-03-22 13:21:07'),
	(18, 'Videos', 'Videos', 'videos', 'name', 'Video', 'VideosController', 'fa-cube', 1, '2018-03-22 22:24:46', '2018-03-22 22:25:41'),
	(19, 'Course_Skills', 'Course_Skills', 'course_skills', 'skill_name', 'Course_Skill', 'Course_SkillsController', 'fa-align-justify', 1, '2018-04-23 09:22:06', '2018-04-23 09:25:08');
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;

-- Dumping structure for table forge.module_fields
DROP TABLE IF EXISTS `module_fields`;
CREATE TABLE IF NOT EXISTS `module_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `colname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `module` int(10) unsigned NOT NULL,
  `field_type` int(10) unsigned NOT NULL,
  `unique` tinyint(1) NOT NULL DEFAULT '0',
  `defaultvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `popup_vals` text COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_fields_module_foreign` (`module`),
  KEY `module_fields_field_type_foreign` (`field_type`),
  CONSTRAINT `module_fields_field_type_foreign` FOREIGN KEY (`field_type`) REFERENCES `module_field_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `module_fields_module_foreign` FOREIGN KEY (`module`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.module_fields: ~78 rows (approximately)
DELETE FROM `module_fields`;
/*!40000 ALTER TABLE `module_fields` DISABLE KEYS */;
INSERT INTO `module_fields` (`id`, `colname`, `label`, `module`, `field_type`, `unique`, `defaultvalue`, `minlength`, `maxlength`, `required`, `popup_vals`, `sort`, `created_at`, `updated_at`) VALUES
	(1, 'name', 'Name', 1, 16, 0, '', 5, 250, 1, '', 0, '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(2, 'context_id', 'Context', 1, 13, 0, '0', 0, 0, 0, '', 0, '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(3, 'email', 'Email', 1, 8, 1, '', 0, 250, 0, '', 0, '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(4, 'password', 'Password', 1, 17, 0, '', 6, 250, 1, '', 0, '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(5, 'type', 'User Type', 1, 7, 0, 'Employee', 0, 0, 0, '["Employee","Client"]', 0, '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(6, 'name', 'Name', 2, 16, 0, '', 5, 250, 1, '', 0, '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(7, 'path', 'Path', 2, 19, 0, '', 0, 250, 0, '', 0, '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(8, 'extension', 'Extension', 2, 19, 0, '', 0, 20, 0, '', 0, '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(9, 'caption', 'Caption', 2, 19, 0, '', 0, 250, 0, '', 0, '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(10, 'user_id', 'Owner', 2, 7, 0, '1', 0, 0, 0, '@users', 0, '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(11, 'hash', 'Hash', 2, 19, 0, '', 0, 250, 0, '', 0, '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(12, 'public', 'Is Public', 2, 2, 0, '0', 0, 0, 0, '', 0, '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(13, 'name', 'Name', 3, 16, 1, '', 1, 250, 1, '', 0, '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(14, 'tags', 'Tags', 3, 20, 0, '[]', 0, 0, 0, '', 0, '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(15, 'color', 'Color', 3, 19, 0, '', 0, 50, 1, '', 0, '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(16, 'name', 'Name', 4, 16, 0, '', 5, 250, 1, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(17, 'designation', 'Designation', 4, 19, 0, '', 0, 50, 1, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(18, 'gender', 'Gender', 4, 18, 0, 'Male', 0, 0, 1, '["Male","Female"]', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(19, 'mobile', 'Mobile', 4, 14, 0, '', 10, 20, 1, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(20, 'mobile2', 'Alternative Mobile', 4, 14, 0, '', 10, 20, 0, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(21, 'email', 'Email', 4, 8, 1, '', 5, 250, 1, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(22, 'dept', 'Department', 4, 7, 0, '0', 0, 0, 1, '@departments', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(23, 'city', 'City', 4, 19, 0, '', 0, 50, 0, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(24, 'address', 'Address', 4, 1, 0, '', 0, 1000, 0, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(25, 'about', 'About', 4, 19, 0, '', 0, 0, 0, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(26, 'date_birth', 'Date of Birth', 4, 4, 0, '1990-01-01', 0, 0, 0, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(27, 'date_hire', 'Hiring Date', 4, 4, 0, 'date(\'Y-m-d\')', 0, 0, 0, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(28, 'date_left', 'Resignation Date', 4, 4, 0, '1990-01-01', 0, 0, 0, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(29, 'salary_cur', 'Current Salary', 4, 6, 0, '0.0', 0, 2, 0, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(30, 'name', 'Name', 5, 16, 1, '', 1, 250, 1, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(31, 'display_name', 'Display Name', 5, 19, 0, '', 0, 250, 1, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(32, 'description', 'Description', 5, 21, 0, '', 0, 1000, 0, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(33, 'parent', 'Parent Role', 5, 7, 0, '1', 0, 0, 0, '@roles', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(34, 'dept', 'Department', 5, 7, 0, '1', 0, 0, 0, '@departments', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(35, 'name', 'Name', 6, 16, 1, '', 5, 250, 1, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(36, 'email', 'Email', 6, 8, 1, '', 0, 250, 0, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(37, 'phone', 'Phone', 6, 14, 0, '', 0, 20, 0, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(38, 'website', 'Website', 6, 23, 0, 'http://', 0, 250, 0, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(39, 'assigned_to', 'Assigned to', 6, 7, 0, '0', 0, 0, 0, '@employees', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(40, 'connect_since', 'Connected Since', 6, 4, 0, 'date(\'Y-m-d\')', 0, 0, 0, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(41, 'address', 'Address', 6, 1, 0, '', 0, 1000, 1, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(42, 'city', 'City', 6, 19, 0, '', 0, 250, 1, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(43, 'description', 'Description', 6, 21, 0, '', 0, 1000, 0, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(44, 'profile_image', 'Profile Image', 6, 12, 0, '', 0, 250, 0, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(45, 'profile', 'Company Profile', 6, 9, 0, '', 0, 250, 0, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(46, 'name', 'Name', 7, 16, 1, '', 0, 250, 1, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(47, 'file_name', 'File Name', 7, 19, 1, '', 0, 250, 1, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(48, 'backup_size', 'File Size', 7, 19, 0, '0', 0, 10, 1, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(49, 'name', 'Name', 8, 16, 1, '', 1, 250, 1, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(50, 'display_name', 'Display Name', 8, 19, 0, '', 0, 250, 1, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(51, 'description', 'Description', 8, 21, 0, '', 0, 1000, 0, '', 0, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(52, 'name', 'Academy Name', 9, 19, 0, '', 0, 256, 1, '', 0, '2018-03-20 14:04:35', '2018-03-20 14:04:35'),
	(53, 'name', 'Course Name', 10, 19, 0, '', 0, 256, 1, '', 1, '2018-03-20 14:06:51', '2018-04-21 07:14:55'),
	(54, 'name', 'Chapter Name', 11, 19, 0, '', 0, 256, 1, '', 0, '2018-03-20 14:07:22', '2018-03-20 14:07:22'),
	(55, 'name', 'Plan Name', 12, 19, 0, '', 0, 256, 1, '', 0, '2018-03-20 14:08:49', '2018-03-20 14:08:49'),
	(57, 'address', 'Address', 9, 1, 0, '', 0, 256, 0, '', 0, '2018-03-20 14:12:59', '2018-03-20 14:12:59'),
	(59, 'academy_id', 'Academy', 10, 7, 0, '', 0, 0, 1, '@academies', 2, '2018-03-20 14:29:55', '2018-03-20 19:32:10'),
	(60, 'title', 'Title', 14, 19, 0, '', 0, 256, 1, '', 0, '2018-03-20 19:34:52', '2018-03-20 19:34:52'),
	(61, 'content', 'Content', 14, 11, 0, '', 0, 0, 0, '', 0, '2018-03-20 19:35:16', '2018-03-20 19:39:16'),
	(62, 'from', 'User', 14, 7, 0, '', 0, 0, 1, '@users', 0, '2018-03-20 19:35:44', '2018-03-20 19:35:44'),
	(64, 'name', 'Module Name', 16, 19, 0, '', 0, 256, 1, '', 0, '2018-03-22 12:23:34', '2018-03-22 12:23:34'),
	(65, 'UserName', 'user_id', 17, 7, 0, '', 0, 0, 1, '@users', 0, '2018-03-22 13:21:01', '2018-03-22 13:21:01'),
	(66, 'phone', 'Phone Number', 9, 14, 0, '', 0, 20, 0, '', 0, '2018-03-22 22:07:53', '2018-03-22 22:07:53'),
	(67, 'dec', 'Description', 9, 19, 0, '', 0, 256, 0, '', 0, '2018-03-22 22:08:05', '2018-03-22 22:08:05'),
	(68, 'course_id', 'Course Name', 16, 7, 0, '', 0, 0, 0, '@courses', 0, '2018-03-22 22:08:58', '2018-03-22 22:08:58'),
	(69, 'module_id', 'Module Name', 11, 15, 0, '', 0, 256, 0, '@unimodules', 0, '2018-03-22 22:09:50', '2018-04-21 22:39:19'),
	(71, 'name', 'Video Name', 18, 19, 0, '', 0, 256, 1, '', 0, '2018-03-22 22:25:02', '2018-03-22 22:25:02'),
	(72, 'url', 'Video URL', 18, 19, 0, '', 0, 256, 0, '', 0, '2018-03-22 22:25:15', '2018-03-22 22:25:15'),
	(73, 'skill_id', 'Skill Name', 18, 7, 0, '', 0, 0, 1, '@skills', 0, '2018-03-22 22:25:38', '2018-03-22 22:25:38'),
	(74, 'description', 'Description', 10, 11, 0, '', 0, 0, 0, '', 3, '2018-04-21 07:12:57', '2018-04-21 07:14:09'),
	(75, 'featureimage', 'Feature Image', 10, 12, 0, '', 0, 0, 0, '', 8, '2018-04-21 07:48:36', '2018-04-21 08:02:15'),
	(77, 'modules_ids', 'Course Module', 10, 15, 0, '', 0, 0, 0, '@unimodules', 4, '2018-04-21 22:28:13', '2018-04-21 22:28:13'),
	(78, 'course_chapters', 'Course Chapters', 10, 15, 0, '', 0, 0, 0, '@chapters', 5, '2018-04-21 22:29:38', '2018-04-21 22:29:38'),
	(79, 'course_skills', 'Course Skills', 10, 15, 0, '', 0, 256, 0, '@skills', 6, '2018-04-21 22:30:58', '2018-04-21 22:33:09'),
	(80, 'course_video', 'Course Videos', 10, 15, 0, '', 0, 0, 0, '@videos', 7, '2018-04-22 00:48:22', '2018-04-22 00:48:22'),
	(83, 'notify_from', 'notify', 1, 19, 0, '', 0, 256, 0, '', 0, '2018-04-22 21:12:24', '2018-04-22 21:12:24'),
	(84, 'image', 'Image', 1, 19, 0, '', 0, 256, 0, '', 0, '2018-04-22 21:14:18', '2018-04-22 21:16:45'),
	(87, 'skill_name', 'Skill Name', 19, 19, 0, '', 0, 256, 0, '', 0, '2018-04-23 09:22:30', '2018-04-23 09:22:30');
/*!40000 ALTER TABLE `module_fields` ENABLE KEYS */;

-- Dumping structure for table forge.module_field_types
DROP TABLE IF EXISTS `module_field_types`;
CREATE TABLE IF NOT EXISTS `module_field_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.module_field_types: ~24 rows (approximately)
DELETE FROM `module_field_types`;
/*!40000 ALTER TABLE `module_field_types` DISABLE KEYS */;
INSERT INTO `module_field_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Address', '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(2, 'Checkbox', '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(3, 'Currency', '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(4, 'Date', '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(5, 'Datetime', '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(6, 'Decimal', '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(7, 'Dropdown', '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(8, 'Email', '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(9, 'File', '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(10, 'Float', '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(11, 'HTML', '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(12, 'Image', '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(13, 'Integer', '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(14, 'Mobile', '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(15, 'Multiselect', '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(16, 'Name', '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(17, 'Password', '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(18, 'Radio', '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(19, 'String', '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(20, 'Taginput', '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(21, 'Textarea', '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(22, 'TextField', '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(23, 'URL', '2018-03-20 14:02:29', '2018-03-20 14:02:29'),
	(24, 'Files', '2018-03-20 14:02:29', '2018-03-20 14:02:29');
/*!40000 ALTER TABLE `module_field_types` ENABLE KEYS */;

-- Dumping structure for table forge.organizations
DROP TABLE IF EXISTS `organizations`;
CREATE TABLE IF NOT EXISTS `organizations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'http://',
  `assigned_to` int(10) unsigned NOT NULL DEFAULT '1',
  `connect_since` date NOT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `profile_image` int(11) NOT NULL,
  `profile` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organizations_name_unique` (`name`),
  UNIQUE KEY `organizations_email_unique` (`email`),
  KEY `organizations_assigned_to_foreign` (`assigned_to`),
  CONSTRAINT `organizations_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.organizations: ~0 rows (approximately)
DELETE FROM `organizations`;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;

-- Dumping structure for table forge.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table forge.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.permissions: ~0 rows (approximately)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'ADMIN_PANEL', 'Admin Panel', 'Admin Panel Permission', NULL, '2018-03-20 14:02:31', '2018-03-20 14:02:31');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table forge.permission_role
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.permission_role: ~0 rows (approximately)
DELETE FROM `permission_role`;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Dumping structure for table forge.plans
DROP TABLE IF EXISTS `plans`;
CREATE TABLE IF NOT EXISTS `plans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.plans: ~0 rows (approximately)
DELETE FROM `plans`;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;

-- Dumping structure for table forge.playitems
DROP TABLE IF EXISTS `playitems`;
CREATE TABLE IF NOT EXISTS `playitems` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `playlist_id` int(10) DEFAULT NULL,
  `video_uid` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table forge.playitems: ~21 rows (approximately)
DELETE FROM `playitems`;
/*!40000 ALTER TABLE `playitems` DISABLE KEYS */;
INSERT INTO `playitems` (`id`, `playlist_id`, `video_uid`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 1, '2018-06-09 01:02:13', '2018-05-09 01:02:15', NULL),
	(2, 1, 2, '2018-05-09 01:02:22', '2018-05-09 01:02:23', NULL),
	(3, 1, 1, '2018-05-08 15:12:47', '2018-05-08 15:12:47', NULL),
	(4, 1, 1, '2018-05-08 18:34:15', '2018-05-08 18:34:15', NULL),
	(5, 2, 1, '2018-05-09 07:22:08', '2018-05-09 07:22:08', NULL),
	(6, 2, 1, '2018-05-09 07:57:59', '2018-05-09 07:57:59', NULL),
	(7, 2, 1, '2018-05-09 07:58:02', '2018-05-09 07:58:02', NULL),
	(8, 2, 1, '2018-05-09 07:58:05', '2018-05-09 07:58:05', NULL),
	(9, 2, 1, '2018-05-09 08:04:01', '2018-05-09 08:04:01', NULL),
	(10, 2, 1, '2018-05-09 08:16:00', '2018-05-09 08:16:00', NULL),
	(11, 2, 1, '2018-05-09 08:16:07', '2018-05-09 08:16:07', NULL),
	(12, 2, 1, '2018-05-09 08:16:09', '2018-05-09 08:16:09', NULL),
	(13, 2, 1, '2018-05-09 08:16:11', '2018-05-09 08:16:11', NULL),
	(14, 1, 1, '2018-05-09 08:33:12', '2018-05-09 08:33:12', NULL),
	(15, 2, 1, '2018-05-09 08:33:58', '2018-05-09 08:33:58', NULL),
	(16, 2, 1, '2018-05-09 08:34:05', '2018-05-09 08:34:05', NULL),
	(17, 2, 1, '2018-05-09 08:34:06', '2018-05-09 08:34:06', NULL),
	(18, 2, 1, '2018-05-09 08:53:00', '2018-05-09 08:53:00', NULL),
	(19, 2, 1, '2018-05-09 13:25:38', '2018-05-09 13:25:38', NULL),
	(20, 3, 1, '2018-05-09 13:25:52', '2018-05-09 13:25:52', NULL),
	(21, 1, 1, '2018-05-13 19:52:31', '2018-05-13 19:52:31', NULL);
/*!40000 ALTER TABLE `playitems` ENABLE KEYS */;

-- Dumping structure for table forge.playlists
DROP TABLE IF EXISTS `playlists`;
CREATE TABLE IF NOT EXISTS `playlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table forge.playlists: ~6 rows (approximately)
DELETE FROM `playlists`;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
INSERT INTO `playlists` (`id`, `user_id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 'asdfasd', '2018-05-08 13:36:16', '2018-05-08 13:36:16', NULL),
	(2, 1, 'adfasdf', '2018-05-08 13:36:44', '2018-05-08 13:36:44', NULL),
	(3, 1, 'asdfasdf', '2018-05-08 13:41:07', '2018-05-08 13:41:07', NULL),
	(4, 1, 'asdfas', '2018-05-08 13:41:23', '2018-05-08 13:41:23', NULL),
	(5, 1, 'sdf', '2018-05-08 13:44:44', '2018-05-08 13:44:44', NULL),
	(6, 1, 'teste', '2018-05-08 14:32:38', '2018-05-08 14:32:38', NULL);
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;

-- Dumping structure for table forge.putting_stats
DROP TABLE IF EXISTS `putting_stats`;
CREATE TABLE IF NOT EXISTS `putting_stats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `stat_id` int(11) DEFAULT '1',
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `one_putt` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `two_putt` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `three_plus_putt` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table forge.putting_stats: ~3 rows (approximately)
DELETE FROM `putting_stats`;
/*!40000 ALTER TABLE `putting_stats` DISABLE KEYS */;
INSERT INTO `putting_stats` (`id`, `created_at`, `stat_id`, `updated_at`, `deleted_at`, `name`, `one_putt`, `two_putt`, `three_plus_putt`) VALUES
	(1, NULL, 1, NULL, NULL, 'driving', '48', '24', '16'),
	(2, NULL, 1, NULL, NULL, 'greens', '48', '24', '16'),
	(3, NULL, 1, NULL, NULL, 'putting', '48', '24', '16');
/*!40000 ALTER TABLE `putting_stats` ENABLE KEYS */;

-- Dumping structure for table forge.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(10) unsigned NOT NULL DEFAULT '1',
  `dept` int(10) unsigned NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`),
  KEY `roles_parent_foreign` (`parent`),
  KEY `roles_dept_foreign` (`dept`),
  CONSTRAINT `roles_dept_foreign` FOREIGN KEY (`dept`) REFERENCES `departments` (`id`),
  CONSTRAINT `roles_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.roles: ~0 rows (approximately)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `parent`, `dept`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'SUPER_ADMIN', 'Super Admin', 'Full Access Role', 1, 1, NULL, '2018-03-20 14:02:30', '2018-03-20 14:02:30');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table forge.role_module
DROP TABLE IF EXISTS `role_module`;
CREATE TABLE IF NOT EXISTS `role_module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `module_id` int(10) unsigned NOT NULL,
  `acc_view` tinyint(1) NOT NULL,
  `acc_create` tinyint(1) NOT NULL,
  `acc_edit` tinyint(1) NOT NULL,
  `acc_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_module_role_id_foreign` (`role_id`),
  KEY `role_module_module_id_foreign` (`module_id`),
  CONSTRAINT `role_module_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_module_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.role_module: ~18 rows (approximately)
DELETE FROM `role_module`;
/*!40000 ALTER TABLE `role_module` DISABLE KEYS */;
INSERT INTO `role_module` (`id`, `role_id`, `module_id`, `acc_view`, `acc_create`, `acc_edit`, `acc_delete`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 1, 1, 1, 1, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(2, 1, 2, 1, 1, 1, 1, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(3, 1, 3, 1, 1, 1, 1, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(4, 1, 4, 1, 1, 1, 1, '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(5, 1, 5, 1, 1, 1, 1, '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(6, 1, 6, 1, 1, 1, 1, '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(7, 1, 7, 1, 1, 1, 1, '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(8, 1, 8, 1, 1, 1, 1, '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(9, 1, 9, 1, 1, 1, 1, '2018-03-20 14:04:41', '2018-03-20 14:04:41'),
	(10, 1, 10, 1, 1, 1, 1, '2018-03-20 14:06:55', '2018-03-20 14:06:55'),
	(11, 1, 11, 1, 1, 1, 1, '2018-03-20 14:07:25', '2018-03-20 14:07:25'),
	(12, 1, 12, 1, 1, 1, 1, '2018-03-20 14:08:52', '2018-03-20 14:08:52'),
	(13, 1, 13, 1, 1, 1, 1, '2018-03-20 14:09:39', '2018-03-20 14:09:39'),
	(14, 1, 14, 1, 1, 1, 1, '2018-03-20 19:35:56', '2018-03-20 19:35:56'),
	(15, 1, 16, 1, 1, 1, 1, '2018-03-22 12:24:15', '2018-03-22 12:24:15'),
	(16, 1, 17, 1, 1, 1, 1, '2018-03-22 13:21:08', '2018-03-22 13:21:08'),
	(17, 1, 18, 1, 1, 1, 1, '2018-03-22 22:25:41', '2018-03-22 22:25:41'),
	(18, 1, 19, 1, 1, 1, 1, '2018-04-23 09:25:08', '2018-04-23 09:25:08');
/*!40000 ALTER TABLE `role_module` ENABLE KEYS */;

-- Dumping structure for table forge.role_module_fields
DROP TABLE IF EXISTS `role_module_fields`;
CREATE TABLE IF NOT EXISTS `role_module_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `field_id` int(10) unsigned NOT NULL,
  `access` enum('invisible','readonly','write') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_module_fields_role_id_foreign` (`role_id`),
  KEY `role_module_fields_field_id_foreign` (`field_id`),
  CONSTRAINT `role_module_fields_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `module_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_module_fields_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.role_module_fields: ~78 rows (approximately)
DELETE FROM `role_module_fields`;
/*!40000 ALTER TABLE `role_module_fields` DISABLE KEYS */;
INSERT INTO `role_module_fields` (`id`, `role_id`, `field_id`, `access`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(2, 1, 2, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(3, 1, 3, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(4, 1, 4, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(5, 1, 5, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(6, 1, 6, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(7, 1, 7, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(8, 1, 8, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(9, 1, 9, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(10, 1, 10, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(11, 1, 11, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(12, 1, 12, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(13, 1, 13, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(14, 1, 14, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(15, 1, 15, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(16, 1, 16, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(17, 1, 17, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(18, 1, 18, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(19, 1, 19, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(20, 1, 20, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(21, 1, 21, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(22, 1, 22, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(23, 1, 23, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(24, 1, 24, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(25, 1, 25, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(26, 1, 26, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(27, 1, 27, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(28, 1, 28, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(29, 1, 29, 'write', '2018-03-20 14:02:30', '2018-03-20 14:02:30'),
	(30, 1, 30, 'write', '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(31, 1, 31, 'write', '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(32, 1, 32, 'write', '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(33, 1, 33, 'write', '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(34, 1, 34, 'write', '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(35, 1, 35, 'write', '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(36, 1, 36, 'write', '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(37, 1, 37, 'write', '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(38, 1, 38, 'write', '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(39, 1, 39, 'write', '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(40, 1, 40, 'write', '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(41, 1, 41, 'write', '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(42, 1, 42, 'write', '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(43, 1, 43, 'write', '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(44, 1, 44, 'write', '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(45, 1, 45, 'write', '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(46, 1, 46, 'write', '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(47, 1, 47, 'write', '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(48, 1, 48, 'write', '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(49, 1, 49, 'write', '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(50, 1, 50, 'write', '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(51, 1, 51, 'write', '2018-03-20 14:02:31', '2018-03-20 14:02:31'),
	(52, 1, 52, 'write', '2018-03-20 14:04:35', '2018-03-20 14:04:35'),
	(53, 1, 53, 'write', '2018-03-20 14:06:52', '2018-03-20 14:06:52'),
	(54, 1, 54, 'write', '2018-03-20 14:07:22', '2018-03-20 14:07:22'),
	(55, 1, 55, 'write', '2018-03-20 14:08:49', '2018-03-20 14:08:49'),
	(57, 1, 57, 'write', '2018-03-20 14:12:59', '2018-03-20 14:12:59'),
	(59, 1, 59, 'write', '2018-03-20 14:29:55', '2018-03-20 14:29:55'),
	(60, 1, 60, 'write', '2018-03-20 19:34:52', '2018-03-20 19:34:52'),
	(61, 1, 61, 'write', '2018-03-20 19:35:16', '2018-03-20 19:35:16'),
	(62, 1, 62, 'write', '2018-03-20 19:35:44', '2018-03-20 19:35:44'),
	(63, 1, 64, 'write', '2018-03-22 12:23:34', '2018-03-22 12:23:34'),
	(64, 1, 65, 'write', '2018-03-22 13:21:01', '2018-03-22 13:21:01'),
	(65, 1, 66, 'write', '2018-03-22 22:07:53', '2018-03-22 22:07:53'),
	(66, 1, 67, 'write', '2018-03-22 22:08:05', '2018-03-22 22:08:05'),
	(67, 1, 68, 'write', '2018-03-22 22:08:58', '2018-03-22 22:08:58'),
	(68, 1, 69, 'write', '2018-03-22 22:09:50', '2018-03-22 22:09:50'),
	(70, 1, 71, 'write', '2018-03-22 22:25:03', '2018-03-22 22:25:03'),
	(71, 1, 72, 'write', '2018-03-22 22:25:15', '2018-03-22 22:25:15'),
	(72, 1, 73, 'write', '2018-03-22 22:25:38', '2018-03-22 22:25:38'),
	(73, 1, 74, 'write', '2018-04-21 07:12:58', '2018-04-21 07:12:58'),
	(74, 1, 75, 'write', '2018-04-21 07:48:38', '2018-04-21 07:48:38'),
	(76, 1, 77, 'write', '2018-04-21 22:28:15', '2018-04-21 22:28:15'),
	(77, 1, 78, 'write', '2018-04-21 22:29:39', '2018-04-21 22:29:39'),
	(78, 1, 79, 'write', '2018-04-21 22:30:59', '2018-04-21 22:30:59'),
	(79, 1, 80, 'write', '2018-04-22 00:48:24', '2018-04-22 00:48:24'),
	(80, 1, 83, 'write', '2018-04-22 21:12:25', '2018-04-22 21:12:25'),
	(81, 1, 84, 'write', '2018-04-22 21:14:19', '2018-04-22 21:14:19'),
	(84, 1, 87, 'write', '2018-04-23 09:22:31', '2018-04-23 09:22:31');
/*!40000 ALTER TABLE `role_module_fields` ENABLE KEYS */;

-- Dumping structure for table forge.role_user
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  KEY `role_user_user_id_foreign` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.role_user: ~3 rows (approximately)
DELETE FROM `role_user`;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, NULL, NULL),
	(2, 1, 3, NULL, NULL),
	(3, 1, 4, NULL, NULL);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;

-- Dumping structure for table forge.skills
DROP TABLE IF EXISTS `skills`;
CREATE TABLE IF NOT EXISTS `skills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `chapter_id` int(10) unsigned NOT NULL DEFAULT '1',
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `skills_chapter_id_foreign` (`chapter_id`),
  CONSTRAINT `skills_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.skills: ~13 rows (approximately)
DELETE FROM `skills`;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` (`id`, `deleted_at`, `created_at`, `updated_at`, `chapter_id`, `name`) VALUES
	(1, NULL, '2018-03-22 22:22:26', '2018-03-22 22:22:26', 8, ''),
	(2, NULL, '2018-03-22 22:22:36', '2018-03-22 22:22:36', 8, ''),
	(3, NULL, '2018-03-22 22:22:44', '2018-03-22 22:22:44', 5, ''),
	(4, NULL, '2018-03-22 22:22:52', '2018-03-22 22:22:52', 5, ''),
	(5, NULL, '2018-03-22 22:22:59', '2018-03-22 22:22:59', 5, ''),
	(6, NULL, '2018-03-22 22:23:05', '2018-03-22 22:23:05', 5, ''),
	(7, NULL, '2018-03-22 22:23:12', '2018-03-22 22:23:12', 5, ''),
	(8, NULL, '2018-03-22 22:23:19', '2018-03-22 22:23:19', 1, ''),
	(9, NULL, '2018-03-22 22:23:23', '2018-03-22 22:23:23', 1, ''),
	(10, NULL, '2018-03-22 22:23:28', '2018-03-22 22:23:28', 1, ''),
	(11, NULL, '2018-03-22 22:23:33', '2018-03-22 22:23:33', 1, ''),
	(12, NULL, '2018-03-22 22:23:38', '2018-03-22 22:23:38', 1, ''),
	(13, NULL, '2018-03-22 22:23:44', '2018-03-22 22:23:44', 1, '');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;

-- Dumping structure for table forge.stats
DROP TABLE IF EXISTS `stats`;
CREATE TABLE IF NOT EXISTS `stats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT '1',
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table forge.stats: ~0 rows (approximately)
DELETE FROM `stats`;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
INSERT INTO `stats` (`id`, `created_at`, `user_id`, `updated_at`, `deleted_at`) VALUES
	(1, '2018-03-20 07:02:31', 1, '2018-03-20 07:10:21', NULL);
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;

-- Dumping structure for table forge.unimodules
DROP TABLE IF EXISTS `unimodules`;
CREATE TABLE IF NOT EXISTS `unimodules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `unimodules_course_id_foreign` (`course_id`),
  CONSTRAINT `unimodules_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.unimodules: ~12 rows (approximately)
DELETE FROM `unimodules`;
/*!40000 ALTER TABLE `unimodules` DISABLE KEYS */;
INSERT INTO `unimodules` (`id`, `deleted_at`, `created_at`, `updated_at`, `name`, `course_id`) VALUES
	(1, NULL, '2018-03-22 22:15:56', '2018-03-22 22:15:56', 'Business Administration', 4),
	(2, NULL, '2018-03-22 22:16:04', '2018-03-22 22:16:04', 'History', 1),
	(3, NULL, '2018-03-22 22:16:17', '2018-03-22 22:16:17', 'Visual Arts', 10),
	(4, NULL, '2018-03-22 22:16:24', '2018-03-22 22:16:24', 'History', 4),
	(5, NULL, '2018-03-22 22:16:32', '2018-03-22 22:16:32', 'Internet', 7),
	(6, NULL, '2018-03-22 22:16:40', '2018-03-22 22:16:40', 'Computer Graphics', 7),
	(7, NULL, '2018-03-22 22:16:47', '2018-03-22 22:16:47', 'Artificial Intelligence', 5),
	(8, NULL, '2018-03-22 22:16:59', '2018-03-22 22:16:59', 'Computer Science', 3),
	(9, NULL, '2018-03-22 22:17:14', '2018-03-22 22:17:14', 'Philosophy', 10),
	(10, NULL, '2018-03-22 22:17:22', '2018-03-22 22:17:22', 'Google', 9),
	(11, NULL, '2018-03-22 22:17:30', '2018-03-22 22:17:30', 'Camp', 5),
	(12, NULL, '2018-03-22 22:17:39', '2018-03-22 22:17:39', 'Mathematics', 5);
/*!40000 ALTER TABLE `unimodules` ENABLE KEYS */;

-- Dumping structure for table forge.uploads
DROP TABLE IF EXISTS `uploads`;
CREATE TABLE IF NOT EXISTS `uploads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `caption` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `hash` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uploads_user_id_foreign` (`user_id`),
  CONSTRAINT `uploads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.uploads: ~2 rows (approximately)
DELETE FROM `uploads`;
/*!40000 ALTER TABLE `uploads` DISABLE KEYS */;
INSERT INTO `uploads` (`id`, `name`, `path`, `extension`, `caption`, `user_id`, `hash`, `public`, `deleted_at`, `created_at`, `updated_at`, `status`) VALUES
	(1, 'JF_JTB2013_0929_Retouched[1].jpg', 'D:\\xampp\\htdocs\\golfdev\\admin-panel\\storage\\uploads\\2018-04-21-025737-JF_JTB2013_0929_Retouched[1].jpg', 'jpg', '', 1, 'r7pl7iaxcqu9qijg0c0k', 0, NULL, '2018-04-21 07:57:37', '2018-04-21 07:57:38', ''),
	(2, '1[1].jpg', 'D:\\xampp\\htdocs\\golfdev\\admin-panel\\storage\\uploads\\2018-04-21-031052-1[1].jpg', 'jpg', '', 1, '0xfv5r20iltnyk2naifp', 0, NULL, '2018-04-21 08:10:52', '2018-04-21 08:10:52', '');
/*!40000 ALTER TABLE `uploads` ENABLE KEYS */;

-- Dumping structure for table forge.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `context_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Employee',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `notify_from` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.users: ~4 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `context_id`, `email`, `password`, `type`, `remember_token`, `deleted_at`, `created_at`, `updated_at`, `notify_from`, `image`) VALUES
	(1, 'Admin', 1, 'sajadmemon@yahoo.com', '$2b$10$Eh7HUwussmi2ldQxAzp/SORPv6.ABl.067GIM70v6zL.y92oKHO1O', 'Employee', 't1med3hLpqWwljGLMvQ6cclfo7ifxkWgRF3N7B1JThL5GhGx0nhbWU9vV7hv', NULL, '2018-03-20 14:02:42', '2018-05-02 09:49:47', '', 'images/chat_images/1524152396client01.png'),
	(2, 'Super Champion', 1, 'superchampion0521@gmail.com', '$2b$10$Eh7HUwussmi2ldQxAzp/SORPv6.ABl.067GIM70v6zL.y92oKHO1O', 'Client', 'q9XUfWzdTp6Xm3LjxCxGqBBHBz3d6v2KRlXzxt1HPXaReOgIPZk8tKL3Yd7V', NULL, '2018-03-20 19:37:15', '2018-04-22 20:49:56', '', 'images/chat_images/1524152396client01.png'),
	(3, 'adcdeveloper', 1, 'abcdeveloper@demo.com', '$2y$10$W1ogjYTSPSGRc2nQ3B4Zc.Bnnj/9Fd.2jxeEYQ/1YefW49BEDqCv.', 'Employee', 'zoClVTjZ9QUJIiRXm4Pb1M2xqr4n2ggHAjf0OJ977IE7Qwo7D5hUJIqU7tld', NULL, '2018-04-22 20:39:38', '2018-04-22 20:49:23', '', 'images/chat_images/1524152396client01.png'),
	(4, 'adcdeveloper2', 1, 'abcdevelope2r@demo.com', '$2y$10$W1ogjYTSPSGRc2nQ3B4Zc.Bnnj/9Fd.2jxeEYQ/1YefW49BEDqCv.', 'Employee', 'etwrkN4oTgEsIOJ4gTCR6PJyBil8pfaypjIsvAqeRiZqNiVKoMplQC9SpAMG', NULL, '2018-04-22 20:39:38', '2018-04-22 21:53:46', '1,', 'images/chat_images/1524152396client01.png');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table forge.user_forums
DROP TABLE IF EXISTS `user_forums`;
CREATE TABLE IF NOT EXISTS `user_forums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(1000) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table forge.user_forums: ~6 rows (approximately)
DELETE FROM `user_forums`;
/*!40000 ALTER TABLE `user_forums` DISABLE KEYS */;
INSERT INTO `user_forums` (`id`, `user_id`, `title`, `content`, `type`, `parent_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 'asdf', 'asdfasdf asdf', NULL, NULL, '2018-05-08 11:20:34', '2018-05-08 11:20:34'),
	(2, 1, 'asdfas', 'asdfsdf', 'academy', NULL, '2018-05-08 11:21:47', '2018-05-08 11:21:47'),
	(3, 1, 'asdf', 'aaa aaa', 'academy', NULL, '2018-05-08 11:23:32', '2018-05-08 11:23:32'),
	(4, 1, 'asdf', 'aaa aaa', 'academy', NULL, '2018-05-08 11:23:45', '2018-05-08 11:23:45'),
	(5, 1, 'asdfas', 'asd asdf', 'academy', NULL, '2018-05-08 11:24:24', '2018-05-08 11:24:24'),
	(6, 1, 'asdfas', 'asd asdf', 'academy', NULL, '2018-05-08 11:24:49', '2018-05-08 11:24:49'),
	(7, 1, 'West', 'sfsdfsdf', 'academy', NULL, '2018-05-09 13:20:59', '2018-05-09 13:20:59');
/*!40000 ALTER TABLE `user_forums` ENABLE KEYS */;

-- Dumping structure for table forge.user_messages
DROP TABLE IF EXISTS `user_messages`;
CREATE TABLE IF NOT EXISTS `user_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(11) DEFAULT NULL,
  `receiver` int(11) DEFAULT NULL,
  `message` text,
  `video_uid` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table forge.user_messages: ~6 rows (approximately)
DELETE FROM `user_messages`;
/*!40000 ALTER TABLE `user_messages` DISABLE KEYS */;
INSERT INTO `user_messages` (`id`, `sender`, `receiver`, `message`, `video_uid`, `created_at`, `updated_at`) VALUES
	(2, 1, 3, 'asdfa', '1', '2018-05-08 11:13:56', '2018-05-08 11:13:56'),
	(3, 1, 3, 'asdfa', '1', '2018-05-08 11:15:03', '2018-05-08 11:15:03'),
	(4, 1, 3, 'asdfa', '1', '2018-05-08 11:16:59', '2018-05-08 11:16:59'),
	(5, 1, 2, 'asdf', '1', '2018-05-08 11:24:43', '2018-05-08 11:24:43'),
	(6, 1, 2, 'aaa', '1', '2018-05-09 07:52:49', '2018-05-09 07:52:49'),
	(7, 1, 2, 'aaa', '1', '2018-05-09 08:02:21', '2018-05-09 08:02:21'),
	(8, 1, 2, 'test', '1', '2018-05-09 13:22:09', '2018-05-09 13:22:09');
/*!40000 ALTER TABLE `user_messages` ENABLE KEYS */;

-- Dumping structure for table forge.videos
DROP TABLE IF EXISTS `videos`;
CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `skill_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `videos_skill_id_foreign` (`skill_id`),
  CONSTRAINT `videos_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table forge.videos: ~6 rows (approximately)
DELETE FROM `videos`;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` (`id`, `deleted_at`, `created_at`, `updated_at`, `name`, `url`, `skill_id`) VALUES
	(1, NULL, '2018-03-22 22:26:21', '2018-03-22 22:26:21', 'Learn CSS1', 'aaa', 1),
	(2, NULL, '2018-03-22 22:26:30', '2018-03-22 22:26:30', 'Learn CSS 2', 'asdf', 1),
	(3, NULL, '2018-03-22 22:26:36', '2018-03-22 22:26:36', 'Learn CSS 3', 'asdfadsf', 1),
	(4, NULL, '2018-03-22 22:26:40', '2018-03-22 22:26:40', 'Learn CSS 4', 'adfadf', 1),
	(5, NULL, '2018-03-22 22:26:47', '2018-03-22 22:26:47', 'Learn CSS 5', 'adsfasdfasdf', 1),
	(6, NULL, '2018-03-22 22:26:53', '2018-03-22 22:26:53', 'Learn CSS 6', '1324134134', 1);
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
