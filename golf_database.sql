-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.19 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table golf-backend.academies
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table golf-backend.academies: ~21 rows (approximately)
/*!40000 ALTER TABLE `academies` DISABLE KEYS */;
INSERT IGNORE INTO `academies` (`id`, `deleted_at`, `created_at`, `updated_at`, `name`, `address`, `phone`, `dec`) VALUES
	(1, NULL, '2018-03-20 09:13:34', '2018-03-22 17:10:10', 'Massachusetts Institute of Technology', '77 Massachusetts Ave, Cambridge, MA 02139, USA', '849203746', ''),
	(2, NULL, '2018-03-20 09:13:51', '2018-03-22 17:10:15', 'Stanford University', '450 Serra Mall, Stanford, CA 94305, USA', '849203746', 'asdfaf'),
	(3, NULL, '2018-03-20 09:14:04', '2018-03-20 09:21:07', 'Harvard University', 'Cambridge, MA 02138, USA', '', ''),
	(4, NULL, '2018-03-20 09:14:13', '2018-03-20 09:21:34', 'University of Cambridge', 'The Old Schools, Trinity Ln, Cambridge CB2 1TN, UK', '', ''),
	(5, NULL, '2018-03-20 09:14:25', '2018-03-20 09:21:56', 'California Institute of Technology (Caltech)', '1200 E California Blvd, Pasadena, CA 91125, USA', '', ''),
	(6, NULL, '2018-03-20 09:14:34', '2018-03-20 09:14:34', 'University of Oxford', '', '', ''),
	(7, NULL, '2018-03-20 09:14:42', '2018-03-20 09:14:42', 'UCL (University College London)', '', '', ''),
	(8, NULL, '2018-03-20 09:14:50', '2018-03-20 09:14:50', 'ETH Zurich – Swiss Federal Institute of Technology', '', '', ''),
	(9, NULL, '2018-03-20 09:15:01', '2018-03-20 09:15:01', 'Imperial College London', '', '', ''),
	(10, NULL, '2018-03-20 09:15:14', '2018-03-20 09:22:57', 'University of Chicago', 'DePaul Art Museum, 935 W Fullerton Ave, Chicago, IL 60614, USA', '', ''),
	(11, NULL, '2018-03-20 09:15:23', '2018-03-20 09:15:23', 'Princeton University', '', '', ''),
	(12, NULL, '2018-03-20 09:15:30', '2018-03-20 09:15:30', 'National University of Singapore (NUS)', '', '', ''),
	(13, NULL, '2018-03-20 09:15:40', '2018-03-20 09:15:40', 'Nanyang Technological University, Singapore (NTU)', '', '', ''),
	(14, NULL, '2018-03-20 09:16:17', '2018-03-20 09:16:17', 'Ecole Polytechnique Fédérale de Lausanne (EPFL)', '', '', ''),
	(15, NULL, '2018-03-20 09:16:29', '2018-03-20 09:16:29', 'Yale University', '', '', ''),
	(16, NULL, '2018-03-20 09:16:41', '2018-03-20 09:16:41', 'Cornell University', '', '', ''),
	(17, NULL, '2018-03-20 09:16:52', '2018-03-20 09:16:52', 'Johns Hopkins University', '', '', ''),
	(18, NULL, '2018-03-20 09:17:03', '2018-03-20 09:17:03', 'University of Pennsylvania', '', '', ''),
	(19, NULL, '2018-03-20 09:17:13', '2018-03-20 09:17:13', 'University of Edinburgh', '', '', ''),
	(20, NULL, '2018-03-20 09:17:23', '2018-03-20 09:17:23', 'Columbia University', '', '', ''),
	(21, NULL, '2018-03-20 09:17:33', '2018-03-20 09:17:33', 'King’s College London', '', '', '');
/*!40000 ALTER TABLE `academies` ENABLE KEYS */;

-- Dumping structure for table golf-backend.backups
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

-- Dumping data for table golf-backend.backups: ~0 rows (approximately)
/*!40000 ALTER TABLE `backups` DISABLE KEYS */;
/*!40000 ALTER TABLE `backups` ENABLE KEYS */;

-- Dumping structure for table golf-backend.chapters
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table golf-backend.chapters: ~12 rows (approximately)
/*!40000 ALTER TABLE `chapters` DISABLE KEYS */;
INSERT IGNORE INTO `chapters` (`id`, `deleted_at`, `created_at`, `updated_at`, `name`, `module_id`) VALUES
	(1, NULL, '2018-03-22 17:18:33', '2018-03-22 17:18:33', 'Algebra', 12),
	(2, NULL, '2018-03-22 17:18:45', '2018-03-22 17:18:45', 'Combinatorics', 12),
	(3, NULL, '2018-03-22 17:18:55', '2018-03-22 17:18:55', 'Mathematical physics', 12),
	(4, NULL, '2018-03-22 17:19:09', '2018-03-22 17:19:09', 'Mathematicians', 1),
	(5, NULL, '2018-03-22 17:19:18', '2018-03-22 17:19:18', 'Game theory', 1),
	(6, NULL, '2018-03-22 17:19:33', '2018-03-22 17:19:33', 'Calculus and analysis', 12),
	(7, NULL, '2018-03-22 17:19:41', '2018-03-22 17:19:41', 'HTML', 5),
	(8, NULL, '2018-03-22 17:19:48', '2018-03-22 17:19:48', 'CSS', 6),
	(9, NULL, '2018-03-22 17:19:56', '2018-03-22 17:19:56', 'JavaScript', 8),
	(10, NULL, '2018-03-22 17:20:07', '2018-03-22 17:20:07', 'MongoDB', 8),
	(11, NULL, '2018-03-22 17:20:16', '2018-03-22 17:20:16', 'Algorithms', 8),
	(12, NULL, '2018-03-22 17:20:27', '2018-03-22 17:20:27', 'NodeJS', 8);
/*!40000 ALTER TABLE `chapters` ENABLE KEYS */;

-- Dumping structure for table golf-backend.courses
CREATE TABLE IF NOT EXISTS `courses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `academy_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `courses_academy_id_foreign` (`academy_id`),
  CONSTRAINT `courses_academy_id_foreign` FOREIGN KEY (`academy_id`) REFERENCES `academies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table golf-backend.courses: ~14 rows (approximately)
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT IGNORE INTO `courses` (`id`, `deleted_at`, `created_at`, `updated_at`, `name`, `academy_id`) VALUES
	(1, NULL, '2018-03-20 09:23:38', '2018-03-22 17:14:07', '2001-2002 Programs and Modules', 4),
	(2, NULL, '2018-03-20 09:23:49', '2018-03-22 17:14:14', '2002-2003 Programs and Modules', 1),
	(3, NULL, '2018-03-20 09:23:57', '2018-03-22 17:14:19', '2001-2002 Programs and Modules', 1),
	(4, NULL, '2018-03-20 09:24:39', '2018-03-22 17:14:27', '2011-2012 Programs and Modules', 1),
	(5, NULL, '2018-03-20 09:24:47', '2018-03-22 17:14:35', '2012-2013 Programs and Modules', 17),
	(6, NULL, '2018-03-20 09:24:55', '2018-03-22 17:14:44', '2004-2005 Programs and Modules', 1),
	(7, NULL, '2018-03-20 09:25:05', '2018-03-22 17:14:52', '2007-2008 Programs and Modules', 1),
	(8, NULL, '2018-03-20 09:25:29', '2018-03-22 17:15:01', '2013-2014 Programs and Modules', 1),
	(9, NULL, '2018-03-20 09:25:40', '2018-03-22 17:15:13', '2015-2016 Programs and Modules', 1),
	(10, NULL, '2018-03-20 09:25:49', '2018-03-22 17:15:23', '2018-2029 Programs and Modules', 1),
	(11, NULL, '2018-03-20 09:25:56', '2018-03-20 09:25:56', 'Visual Arts', 1),
	(12, NULL, '2018-03-20 09:26:03', '2018-03-20 09:26:03', 'Multimedia Journalism', 1),
	(13, NULL, '2018-03-20 09:26:14', '2018-03-20 09:26:14', 'Electrical & Computer Engineering 2+2 Program', 1),
	(14, NULL, '2018-03-20 09:31:27', '2018-03-20 09:31:27', 'History', 17);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;

-- Dumping structure for table golf-backend.departments
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table golf-backend.departments: ~3 rows (approximately)
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT IGNORE INTO `departments` (`id`, `name`, `tags`, `color`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'Administration', '[]', '#000', NULL, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(2, 'Teacher', '[]', '#FF0000', '2018-03-22 07:09:39', '2018-03-22 07:04:49', '2018-03-22 07:09:39'),
	(3, 'Student', '[]', '#0000FF', '2018-03-22 07:09:41', '2018-03-22 07:08:39', '2018-03-22 07:09:41');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;

-- Dumping structure for table golf-backend.employees
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table golf-backend.employees: ~1 rows (approximately)
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT IGNORE INTO `employees` (`id`, `name`, `designation`, `gender`, `mobile`, `mobile2`, `email`, `dept`, `city`, `address`, `about`, `date_birth`, `date_hire`, `date_left`, `salary_cur`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'Super Admin', 'Male', '8888888888', '', 'admin@golf.com', 1, 'Pune', 'Karve nagar, Pune 411030', 'About user / biography', '2018-03-20', '2018-03-20', '2018-03-20', 0.000, NULL, '2018-03-20 09:02:42', '2018-03-20 09:02:42');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;

-- Dumping structure for table golf-backend.la_configs
CREATE TABLE IF NOT EXISTS `la_configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `section` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table golf-backend.la_configs: ~13 rows (approximately)
/*!40000 ALTER TABLE `la_configs` DISABLE KEYS */;
INSERT IGNORE INTO `la_configs` (`id`, `key`, `section`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'sitename', '', 'Golf Management', '2018-03-20 09:02:31', '2018-03-20 09:10:21'),
	(2, 'sitename_part1', '', 'Golf', '2018-03-20 09:02:31', '2018-03-20 09:10:21'),
	(3, 'sitename_part2', '', 'Management', '2018-03-20 09:02:31', '2018-03-20 09:10:21'),
	(4, 'sitename_short', '', 'GM', '2018-03-20 09:02:31', '2018-03-20 09:10:21'),
	(5, 'site_description', '', 'Golf Management is an admin panel for golf.', '2018-03-20 09:02:31', '2018-03-20 09:10:21'),
	(6, 'sidebar_search', '', '0', '2018-03-20 09:02:31', '2018-03-20 09:10:21'),
	(7, 'show_messages', '', '0', '2018-03-20 09:02:31', '2018-03-20 09:10:21'),
	(8, 'show_notifications', '', '0', '2018-03-20 09:02:31', '2018-03-20 09:10:21'),
	(9, 'show_tasks', '', '0', '2018-03-20 09:02:31', '2018-03-20 09:10:21'),
	(10, 'show_rightsidebar', '', '0', '2018-03-20 09:02:31', '2018-03-20 09:10:21'),
	(11, 'skin', '', 'skin-white', '2018-03-20 09:02:31', '2018-03-20 09:10:21'),
	(12, 'layout', '', 'fixed', '2018-03-20 09:02:31', '2018-03-20 09:10:21'),
	(13, 'default_email', '', 'test@example.com', '2018-03-20 09:02:31', '2018-03-20 09:10:21');
/*!40000 ALTER TABLE `la_configs` ENABLE KEYS */;

-- Dumping structure for table golf-backend.la_menus
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table golf-backend.la_menus: ~14 rows (approximately)
/*!40000 ALTER TABLE `la_menus` DISABLE KEYS */;
INSERT IGNORE INTO `la_menus` (`id`, `name`, `url`, `icon`, `type`, `parent`, `hierarchy`, `created_at`, `updated_at`) VALUES
	(2, 'Users', 'users', 'fa-group', 'module', 0, 6, '2018-03-20 09:02:30', '2018-03-22 17:26:05'),
	(6, 'Roles', 'roles', 'fa-user-plus', 'module', 0, 3, '2018-03-20 09:02:30', '2018-03-22 17:26:05'),
	(9, 'Academies', 'academies', 'fa fa-cube', 'module', 17, 1, '2018-03-20 09:04:41', '2018-03-22 07:16:39'),
	(10, 'Courses', 'courses', 'fa fa-cube', 'module', 17, 2, '2018-03-20 09:06:55', '2018-03-22 07:16:55'),
	(11, 'Chapters', 'chapters', 'fa fa-cube', 'module', 17, 4, '2018-03-20 09:07:25', '2018-03-22 07:28:14'),
	(12, 'Plans', 'plans', 'fa fa-cube', 'module', 0, 1, '2018-03-20 09:08:52', '2018-03-22 17:26:05'),
	(13, 'Skills', 'skills', 'fa fa-cube', 'module', 17, 5, '2018-03-20 09:09:39', '2018-03-22 07:28:14'),
	(14, 'Messages', 'messages', 'fa fa-cube', 'module', 0, 2, '2018-03-20 14:35:56', '2018-03-22 17:26:05'),
	(15, 'Departments', 'departments', 'fa-tags', 'module', 0, 4, '2018-03-22 07:04:14', '2018-03-22 17:26:05'),
	(16, 'Employees', 'employees', 'fa-group', 'module', 0, 5, '2018-03-22 07:04:17', '2018-03-22 17:26:05'),
	(17, 'Learning System', '#', 'fa-group', 'custom', 0, 7, '2018-03-22 07:11:37', '2018-03-22 17:26:05'),
	(18, 'UniModules', 'unimodules', 'fa fa-cube', 'module', 17, 3, '2018-03-22 07:24:15', '2018-03-22 07:28:14'),
	(19, 'Members', 'members', 'fa fa-cube', 'module', 17, 7, '2018-03-22 08:21:07', '2018-03-22 17:26:05'),
	(20, 'Videos', 'videos', 'fa fa-cube', 'module', 17, 6, '2018-03-22 17:25:41', '2018-03-22 17:26:05');
/*!40000 ALTER TABLE `la_menus` ENABLE KEYS */;

-- Dumping structure for table golf-backend.members
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

-- Dumping data for table golf-backend.members: ~0 rows (approximately)
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
/*!40000 ALTER TABLE `members` ENABLE KEYS */;

-- Dumping structure for table golf-backend.messages
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table golf-backend.messages: ~1 rows (approximately)
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT IGNORE INTO `messages` (`id`, `deleted_at`, `created_at`, `updated_at`, `title`, `content`, `from`) VALUES
	(1, NULL, '2018-03-20 14:37:31', '2018-03-20 14:37:31', 'To admin', 'abcde', 2);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;

-- Dumping structure for table golf-backend.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table golf-backend.migrations: ~18 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT IGNORE INTO `migrations` (`migration`, `batch`) VALUES
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

-- Dumping structure for table golf-backend.modules
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table golf-backend.modules: ~17 rows (approximately)
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT IGNORE INTO `modules` (`id`, `name`, `label`, `name_db`, `view_col`, `model`, `controller`, `fa_icon`, `is_gen`, `created_at`, `updated_at`) VALUES
	(1, 'Users', 'Users', 'users', 'name', 'User', 'UsersController', 'fa-group', 1, '2018-03-20 09:02:29', '2018-03-20 09:02:31'),
	(2, 'Uploads', 'Uploads', 'uploads', 'name', 'Upload', 'UploadsController', 'fa-files-o', 1, '2018-03-20 09:02:29', '2018-03-20 09:02:31'),
	(3, 'Departments', 'Departments', 'departments', 'name', 'Department', 'DepartmentsController', 'fa-tags', 1, '2018-03-20 09:02:29', '2018-03-20 09:02:31'),
	(4, 'Employees', 'Employees', 'employees', 'name', 'Employee', 'EmployeesController', 'fa-group', 1, '2018-03-20 09:02:30', '2018-03-20 09:02:31'),
	(5, 'Roles', 'Roles', 'roles', 'name', 'Role', 'RolesController', 'fa-user-plus', 1, '2018-03-20 09:02:30', '2018-03-20 09:02:31'),
	(6, 'Organizations', 'Organizations', 'organizations', 'name', 'Organization', 'OrganizationsController', 'fa-university', 1, '2018-03-20 09:02:30', '2018-03-20 09:02:31'),
	(7, 'Backups', 'Backups', 'backups', 'name', 'Backup', 'BackupsController', 'fa-hdd-o', 1, '2018-03-20 09:02:30', '2018-03-20 09:02:31'),
	(8, 'Permissions', 'Permissions', 'permissions', 'name', 'Permission', 'PermissionsController', 'fa-magic', 1, '2018-03-20 09:02:30', '2018-03-20 09:02:31'),
	(9, 'Academies', 'Academies', 'academies', 'name', 'Academy', 'AcademiesController', 'fa-cube', 1, '2018-03-20 09:04:05', '2018-03-20 09:04:41'),
	(10, 'Courses', 'Courses', 'courses', 'name', 'Course', 'CoursesController', 'fa-cube', 1, '2018-03-20 09:06:35', '2018-03-20 09:06:55'),
	(11, 'Chapters', 'Chapters', 'chapters', 'name', 'Chapter', 'ChaptersController', 'fa-cube', 1, '2018-03-20 09:07:10', '2018-03-20 09:07:25'),
	(12, 'Plans', 'Plans', 'plans', 'name', 'Plan', 'PlansController', 'fa-cube', 1, '2018-03-20 09:08:33', '2018-03-20 09:08:52'),
	(13, 'Skills', 'Skills', 'skills', 'name`', 'Skill', 'SkillsController', 'fa-cube', 1, '2018-03-20 09:09:23', '2018-03-20 09:09:39'),
	(14, 'Messages', 'Messages', 'messages', 'title', 'Message', 'MessagesController', 'fa-cube', 1, '2018-03-20 14:34:29', '2018-03-20 14:35:56'),
	(16, 'UniModules', 'UniModules', 'unimodules', 'name', 'UniModule', 'UniModulesController', 'fa-cube', 1, '2018-03-22 07:23:06', '2018-03-22 07:24:15'),
	(17, 'Members', 'Members', 'members', 'UserName', 'Member', 'MembersController', 'fa-cube', 1, '2018-03-22 08:20:21', '2018-03-22 08:21:07'),
	(18, 'Videos', 'Videos', 'videos', 'name', 'Video', 'VideosController', 'fa-cube', 1, '2018-03-22 17:24:46', '2018-03-22 17:25:41');
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;

-- Dumping structure for table golf-backend.module_fields
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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table golf-backend.module_fields: ~71 rows (approximately)
/*!40000 ALTER TABLE `module_fields` DISABLE KEYS */;
INSERT IGNORE INTO `module_fields` (`id`, `colname`, `label`, `module`, `field_type`, `unique`, `defaultvalue`, `minlength`, `maxlength`, `required`, `popup_vals`, `sort`, `created_at`, `updated_at`) VALUES
	(1, 'name', 'Name', 1, 16, 0, '', 5, 250, 1, '', 0, '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(2, 'context_id', 'Context', 1, 13, 0, '0', 0, 0, 0, '', 0, '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(3, 'email', 'Email', 1, 8, 1, '', 0, 250, 0, '', 0, '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(4, 'password', 'Password', 1, 17, 0, '', 6, 250, 1, '', 0, '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(5, 'type', 'User Type', 1, 7, 0, 'Employee', 0, 0, 0, '["Employee","Client"]', 0, '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(6, 'name', 'Name', 2, 16, 0, '', 5, 250, 1, '', 0, '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(7, 'path', 'Path', 2, 19, 0, '', 0, 250, 0, '', 0, '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(8, 'extension', 'Extension', 2, 19, 0, '', 0, 20, 0, '', 0, '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(9, 'caption', 'Caption', 2, 19, 0, '', 0, 250, 0, '', 0, '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(10, 'user_id', 'Owner', 2, 7, 0, '1', 0, 0, 0, '@users', 0, '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(11, 'hash', 'Hash', 2, 19, 0, '', 0, 250, 0, '', 0, '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(12, 'public', 'Is Public', 2, 2, 0, '0', 0, 0, 0, '', 0, '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(13, 'name', 'Name', 3, 16, 1, '', 1, 250, 1, '', 0, '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(14, 'tags', 'Tags', 3, 20, 0, '[]', 0, 0, 0, '', 0, '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(15, 'color', 'Color', 3, 19, 0, '', 0, 50, 1, '', 0, '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(16, 'name', 'Name', 4, 16, 0, '', 5, 250, 1, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(17, 'designation', 'Designation', 4, 19, 0, '', 0, 50, 1, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(18, 'gender', 'Gender', 4, 18, 0, 'Male', 0, 0, 1, '["Male","Female"]', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(19, 'mobile', 'Mobile', 4, 14, 0, '', 10, 20, 1, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(20, 'mobile2', 'Alternative Mobile', 4, 14, 0, '', 10, 20, 0, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(21, 'email', 'Email', 4, 8, 1, '', 5, 250, 1, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(22, 'dept', 'Department', 4, 7, 0, '0', 0, 0, 1, '@departments', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(23, 'city', 'City', 4, 19, 0, '', 0, 50, 0, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(24, 'address', 'Address', 4, 1, 0, '', 0, 1000, 0, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(25, 'about', 'About', 4, 19, 0, '', 0, 0, 0, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(26, 'date_birth', 'Date of Birth', 4, 4, 0, '1990-01-01', 0, 0, 0, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(27, 'date_hire', 'Hiring Date', 4, 4, 0, 'date(\'Y-m-d\')', 0, 0, 0, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(28, 'date_left', 'Resignation Date', 4, 4, 0, '1990-01-01', 0, 0, 0, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(29, 'salary_cur', 'Current Salary', 4, 6, 0, '0.0', 0, 2, 0, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(30, 'name', 'Name', 5, 16, 1, '', 1, 250, 1, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(31, 'display_name', 'Display Name', 5, 19, 0, '', 0, 250, 1, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(32, 'description', 'Description', 5, 21, 0, '', 0, 1000, 0, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(33, 'parent', 'Parent Role', 5, 7, 0, '1', 0, 0, 0, '@roles', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(34, 'dept', 'Department', 5, 7, 0, '1', 0, 0, 0, '@departments', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(35, 'name', 'Name', 6, 16, 1, '', 5, 250, 1, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(36, 'email', 'Email', 6, 8, 1, '', 0, 250, 0, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(37, 'phone', 'Phone', 6, 14, 0, '', 0, 20, 0, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(38, 'website', 'Website', 6, 23, 0, 'http://', 0, 250, 0, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(39, 'assigned_to', 'Assigned to', 6, 7, 0, '0', 0, 0, 0, '@employees', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(40, 'connect_since', 'Connected Since', 6, 4, 0, 'date(\'Y-m-d\')', 0, 0, 0, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(41, 'address', 'Address', 6, 1, 0, '', 0, 1000, 1, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(42, 'city', 'City', 6, 19, 0, '', 0, 250, 1, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(43, 'description', 'Description', 6, 21, 0, '', 0, 1000, 0, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(44, 'profile_image', 'Profile Image', 6, 12, 0, '', 0, 250, 0, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(45, 'profile', 'Company Profile', 6, 9, 0, '', 0, 250, 0, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(46, 'name', 'Name', 7, 16, 1, '', 0, 250, 1, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(47, 'file_name', 'File Name', 7, 19, 1, '', 0, 250, 1, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(48, 'backup_size', 'File Size', 7, 19, 0, '0', 0, 10, 1, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(49, 'name', 'Name', 8, 16, 1, '', 1, 250, 1, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(50, 'display_name', 'Display Name', 8, 19, 0, '', 0, 250, 1, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(51, 'description', 'Description', 8, 21, 0, '', 0, 1000, 0, '', 0, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(52, 'name', 'Academy Name', 9, 19, 0, '', 0, 256, 1, '', 0, '2018-03-20 09:04:35', '2018-03-20 09:04:35'),
	(53, 'name', 'Course Name', 10, 19, 0, '', 0, 256, 1, '', 1, '2018-03-20 09:06:51', '2018-03-20 14:32:00'),
	(54, 'name', 'Chapter Name', 11, 19, 0, '', 0, 256, 1, '', 0, '2018-03-20 09:07:22', '2018-03-20 09:07:22'),
	(55, 'name', 'Plan Name', 12, 19, 0, '', 0, 256, 1, '', 0, '2018-03-20 09:08:49', '2018-03-20 09:08:49'),
	(56, 'name`', 'Skill Name', 13, 19, 0, '', 0, 256, 1, '', 0, '2018-03-20 09:09:36', '2018-03-20 09:09:36'),
	(57, 'address', 'Address', 9, 1, 0, '', 0, 256, 0, '', 0, '2018-03-20 09:12:59', '2018-03-20 09:12:59'),
	(59, 'academy_id', 'Academy', 10, 7, 0, '', 0, 0, 1, '@academies', 2, '2018-03-20 09:29:55', '2018-03-20 14:32:10'),
	(60, 'title', 'Title', 14, 19, 0, '', 0, 256, 1, '', 0, '2018-03-20 14:34:52', '2018-03-20 14:34:52'),
	(61, 'content', 'Content', 14, 11, 0, '', 0, 0, 0, '', 0, '2018-03-20 14:35:16', '2018-03-20 14:39:16'),
	(62, 'from', 'User', 14, 7, 0, '', 0, 0, 1, '@users', 0, '2018-03-20 14:35:44', '2018-03-20 14:35:44'),
	(64, 'name', 'Module Name', 16, 19, 0, '', 0, 256, 1, '', 0, '2018-03-22 07:23:34', '2018-03-22 07:23:34'),
	(65, 'UserName', 'user_id', 17, 7, 0, '', 0, 0, 1, '@users', 0, '2018-03-22 08:21:01', '2018-03-22 08:21:01'),
	(66, 'phone', 'Phone Number', 9, 14, 0, '', 0, 20, 0, '', 0, '2018-03-22 17:07:53', '2018-03-22 17:07:53'),
	(67, 'dec', 'Description', 9, 19, 0, '', 0, 256, 0, '', 0, '2018-03-22 17:08:05', '2018-03-22 17:08:05'),
	(68, 'course_id', 'Course Name', 16, 7, 0, '', 0, 0, 0, '@courses', 0, '2018-03-22 17:08:58', '2018-03-22 17:08:58'),
	(69, 'module_id', 'Module Name', 11, 7, 0, '', 0, 0, 0, '@unimodules', 0, '2018-03-22 17:09:50', '2018-03-22 17:09:50'),
	(70, 'chapter_id', 'Chapter Name', 13, 7, 0, '', 0, 0, 1, '@chapters', 0, '2018-03-22 17:21:26', '2018-03-22 17:21:59'),
	(71, 'name', 'Video Name', 18, 19, 0, '', 0, 256, 1, '', 0, '2018-03-22 17:25:02', '2018-03-22 17:25:02'),
	(72, 'url', 'Video URL', 18, 19, 0, '', 0, 256, 0, '', 0, '2018-03-22 17:25:15', '2018-03-22 17:25:15'),
	(73, 'skill_id', 'Skill Name', 18, 7, 0, '', 0, 0, 1, '@skills', 0, '2018-03-22 17:25:38', '2018-03-22 17:25:38');
/*!40000 ALTER TABLE `module_fields` ENABLE KEYS */;

-- Dumping structure for table golf-backend.module_field_types
CREATE TABLE IF NOT EXISTS `module_field_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table golf-backend.module_field_types: ~24 rows (approximately)
/*!40000 ALTER TABLE `module_field_types` DISABLE KEYS */;
INSERT IGNORE INTO `module_field_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Address', '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(2, 'Checkbox', '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(3, 'Currency', '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(4, 'Date', '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(5, 'Datetime', '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(6, 'Decimal', '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(7, 'Dropdown', '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(8, 'Email', '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(9, 'File', '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(10, 'Float', '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(11, 'HTML', '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(12, 'Image', '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(13, 'Integer', '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(14, 'Mobile', '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(15, 'Multiselect', '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(16, 'Name', '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(17, 'Password', '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(18, 'Radio', '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(19, 'String', '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(20, 'Taginput', '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(21, 'Textarea', '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(22, 'TextField', '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(23, 'URL', '2018-03-20 09:02:29', '2018-03-20 09:02:29'),
	(24, 'Files', '2018-03-20 09:02:29', '2018-03-20 09:02:29');
/*!40000 ALTER TABLE `module_field_types` ENABLE KEYS */;

-- Dumping structure for table golf-backend.organizations
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

-- Dumping data for table golf-backend.organizations: ~0 rows (approximately)
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;

-- Dumping structure for table golf-backend.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table golf-backend.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table golf-backend.permissions
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table golf-backend.permissions: ~1 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT IGNORE INTO `permissions` (`id`, `name`, `display_name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'ADMIN_PANEL', 'Admin Panel', 'Admin Panel Permission', NULL, '2018-03-20 09:02:31', '2018-03-20 09:02:31');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table golf-backend.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table golf-backend.permission_role: ~1 rows (approximately)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT IGNORE INTO `permission_role` (`permission_id`, `role_id`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Dumping structure for table golf-backend.plans
CREATE TABLE IF NOT EXISTS `plans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table golf-backend.plans: ~0 rows (approximately)
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;

-- Dumping structure for table golf-backend.roles
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table golf-backend.roles: ~1 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT IGNORE INTO `roles` (`id`, `name`, `display_name`, `description`, `parent`, `dept`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'SUPER_ADMIN', 'Super Admin', 'Full Access Role', 1, 1, NULL, '2018-03-20 09:02:30', '2018-03-20 09:02:30');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table golf-backend.role_module
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table golf-backend.role_module: ~17 rows (approximately)
/*!40000 ALTER TABLE `role_module` DISABLE KEYS */;
INSERT IGNORE INTO `role_module` (`id`, `role_id`, `module_id`, `acc_view`, `acc_create`, `acc_edit`, `acc_delete`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 1, 1, 1, 1, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(2, 1, 2, 1, 1, 1, 1, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(3, 1, 3, 1, 1, 1, 1, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(4, 1, 4, 1, 1, 1, 1, '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(5, 1, 5, 1, 1, 1, 1, '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(6, 1, 6, 1, 1, 1, 1, '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(7, 1, 7, 1, 1, 1, 1, '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(8, 1, 8, 1, 1, 1, 1, '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(9, 1, 9, 1, 1, 1, 1, '2018-03-20 09:04:41', '2018-03-20 09:04:41'),
	(10, 1, 10, 1, 1, 1, 1, '2018-03-20 09:06:55', '2018-03-20 09:06:55'),
	(11, 1, 11, 1, 1, 1, 1, '2018-03-20 09:07:25', '2018-03-20 09:07:25'),
	(12, 1, 12, 1, 1, 1, 1, '2018-03-20 09:08:52', '2018-03-20 09:08:52'),
	(13, 1, 13, 1, 1, 1, 1, '2018-03-20 09:09:39', '2018-03-20 09:09:39'),
	(14, 1, 14, 1, 1, 1, 1, '2018-03-20 14:35:56', '2018-03-20 14:35:56'),
	(15, 1, 16, 1, 1, 1, 1, '2018-03-22 07:24:15', '2018-03-22 07:24:15'),
	(16, 1, 17, 1, 1, 1, 1, '2018-03-22 08:21:08', '2018-03-22 08:21:08'),
	(17, 1, 18, 1, 1, 1, 1, '2018-03-22 17:25:41', '2018-03-22 17:25:41');
/*!40000 ALTER TABLE `role_module` ENABLE KEYS */;

-- Dumping structure for table golf-backend.role_module_fields
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table golf-backend.role_module_fields: ~71 rows (approximately)
/*!40000 ALTER TABLE `role_module_fields` DISABLE KEYS */;
INSERT IGNORE INTO `role_module_fields` (`id`, `role_id`, `field_id`, `access`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(2, 1, 2, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(3, 1, 3, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(4, 1, 4, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(5, 1, 5, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(6, 1, 6, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(7, 1, 7, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(8, 1, 8, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(9, 1, 9, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(10, 1, 10, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(11, 1, 11, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(12, 1, 12, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(13, 1, 13, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(14, 1, 14, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(15, 1, 15, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(16, 1, 16, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(17, 1, 17, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(18, 1, 18, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(19, 1, 19, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(20, 1, 20, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(21, 1, 21, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(22, 1, 22, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(23, 1, 23, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(24, 1, 24, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(25, 1, 25, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(26, 1, 26, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(27, 1, 27, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(28, 1, 28, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(29, 1, 29, 'write', '2018-03-20 09:02:30', '2018-03-20 09:02:30'),
	(30, 1, 30, 'write', '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(31, 1, 31, 'write', '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(32, 1, 32, 'write', '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(33, 1, 33, 'write', '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(34, 1, 34, 'write', '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(35, 1, 35, 'write', '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(36, 1, 36, 'write', '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(37, 1, 37, 'write', '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(38, 1, 38, 'write', '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(39, 1, 39, 'write', '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(40, 1, 40, 'write', '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(41, 1, 41, 'write', '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(42, 1, 42, 'write', '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(43, 1, 43, 'write', '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(44, 1, 44, 'write', '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(45, 1, 45, 'write', '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(46, 1, 46, 'write', '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(47, 1, 47, 'write', '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(48, 1, 48, 'write', '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(49, 1, 49, 'write', '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(50, 1, 50, 'write', '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(51, 1, 51, 'write', '2018-03-20 09:02:31', '2018-03-20 09:02:31'),
	(52, 1, 52, 'write', '2018-03-20 09:04:35', '2018-03-20 09:04:35'),
	(53, 1, 53, 'write', '2018-03-20 09:06:52', '2018-03-20 09:06:52'),
	(54, 1, 54, 'write', '2018-03-20 09:07:22', '2018-03-20 09:07:22'),
	(55, 1, 55, 'write', '2018-03-20 09:08:49', '2018-03-20 09:08:49'),
	(56, 1, 56, 'write', '2018-03-20 09:09:36', '2018-03-20 09:09:36'),
	(57, 1, 57, 'write', '2018-03-20 09:12:59', '2018-03-20 09:12:59'),
	(59, 1, 59, 'write', '2018-03-20 09:29:55', '2018-03-20 09:29:55'),
	(60, 1, 60, 'write', '2018-03-20 14:34:52', '2018-03-20 14:34:52'),
	(61, 1, 61, 'write', '2018-03-20 14:35:16', '2018-03-20 14:35:16'),
	(62, 1, 62, 'write', '2018-03-20 14:35:44', '2018-03-20 14:35:44'),
	(63, 1, 64, 'write', '2018-03-22 07:23:34', '2018-03-22 07:23:34'),
	(64, 1, 65, 'write', '2018-03-22 08:21:01', '2018-03-22 08:21:01'),
	(65, 1, 66, 'write', '2018-03-22 17:07:53', '2018-03-22 17:07:53'),
	(66, 1, 67, 'write', '2018-03-22 17:08:05', '2018-03-22 17:08:05'),
	(67, 1, 68, 'write', '2018-03-22 17:08:58', '2018-03-22 17:08:58'),
	(68, 1, 69, 'write', '2018-03-22 17:09:50', '2018-03-22 17:09:50'),
	(69, 1, 70, 'write', '2018-03-22 17:21:26', '2018-03-22 17:21:26'),
	(70, 1, 71, 'write', '2018-03-22 17:25:03', '2018-03-22 17:25:03'),
	(71, 1, 72, 'write', '2018-03-22 17:25:15', '2018-03-22 17:25:15'),
	(72, 1, 73, 'write', '2018-03-22 17:25:38', '2018-03-22 17:25:38');
/*!40000 ALTER TABLE `role_module_fields` ENABLE KEYS */;

-- Dumping structure for table golf-backend.role_user
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table golf-backend.role_user: ~1 rows (approximately)
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT IGNORE INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, NULL, NULL);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;

-- Dumping structure for table golf-backend.skills
CREATE TABLE IF NOT EXISTS `skills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name``` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `chapter_id` int(10) unsigned NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `skills_chapter_id_foreign` (`chapter_id`),
  CONSTRAINT `skills_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table golf-backend.skills: ~13 rows (approximately)
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT IGNORE INTO `skills` (`id`, `deleted_at`, `created_at`, `updated_at`, `name```, `chapter_id`, `user_id`) VALUES
	(1, NULL, '2018-03-22 17:22:26', '2018-03-22 17:22:26', 'CSS1', 8, 1),
	(2, NULL, '2018-03-22 17:22:36', '2018-03-22 17:22:36', 'CSS2', 8, 1),
	(3, NULL, '2018-03-22 17:22:44', '2018-03-22 17:22:44', 'Game1', 5, 1),
	(4, NULL, '2018-03-22 17:22:52', '2018-03-22 17:22:52', 'Game2', 5, 1),
	(5, NULL, '2018-03-22 17:22:59', '2018-03-22 17:22:59', 'Game3', 5, 1),
	(6, NULL, '2018-03-22 17:23:05', '2018-03-22 17:23:05', 'Game4', 5, 1),
	(7, NULL, '2018-03-22 17:23:12', '2018-03-22 17:23:12', 'Game5', 5, 1),
	(8, NULL, '2018-03-22 17:23:19', '2018-03-22 17:23:19', 'Al1', 1, 1),
	(9, NULL, '2018-03-22 17:23:23', '2018-03-22 17:23:23', 'Al2', 1, 1),
	(10, NULL, '2018-03-22 17:23:28', '2018-03-22 17:23:28', 'Al3', 1, 1),
	(11, NULL, '2018-03-22 17:23:33', '2018-03-22 17:23:33', 'Al4', 1, 1),
	(12, NULL, '2018-03-22 17:23:38', '2018-03-22 17:23:38', 'Al5', 1, 1),
	(13, NULL, '2018-03-22 17:23:44', '2018-03-22 17:23:44', 'Al6', 1, 1);
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;

-- Dumping structure for table golf-backend.unimodules
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table golf-backend.unimodules: ~12 rows (approximately)
/*!40000 ALTER TABLE `unimodules` DISABLE KEYS */;
INSERT IGNORE INTO `unimodules` (`id`, `deleted_at`, `created_at`, `updated_at`, `name`, `course_id`) VALUES
	(1, NULL, '2018-03-22 17:15:56', '2018-03-22 17:15:56', 'Business Administration', 4),
	(2, NULL, '2018-03-22 17:16:04', '2018-03-22 17:16:04', 'History', 1),
	(3, NULL, '2018-03-22 17:16:17', '2018-03-22 17:16:17', 'Visual Arts', 10),
	(4, NULL, '2018-03-22 17:16:24', '2018-03-22 17:16:24', 'History', 4),
	(5, NULL, '2018-03-22 17:16:32', '2018-03-22 17:16:32', 'Internet', 7),
	(6, NULL, '2018-03-22 17:16:40', '2018-03-22 17:16:40', 'Computer Graphics', 7),
	(7, NULL, '2018-03-22 17:16:47', '2018-03-22 17:16:47', 'Artificial Intelligence', 5),
	(8, NULL, '2018-03-22 17:16:59', '2018-03-22 17:16:59', 'Computer Science', 3),
	(9, NULL, '2018-03-22 17:17:14', '2018-03-22 17:17:14', 'Philosophy', 10),
	(10, NULL, '2018-03-22 17:17:22', '2018-03-22 17:17:22', 'Google', 9),
	(11, NULL, '2018-03-22 17:17:30', '2018-03-22 17:17:30', 'Camp', 5),
	(12, NULL, '2018-03-22 17:17:39', '2018-03-22 17:17:39', 'Mathematics', 5);
/*!40000 ALTER TABLE `unimodules` ENABLE KEYS */;

-- Dumping structure for table golf-backend.uploads
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
  PRIMARY KEY (`id`),
  KEY `uploads_user_id_foreign` (`user_id`),
  CONSTRAINT `uploads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table golf-backend.uploads: ~0 rows (approximately)
/*!40000 ALTER TABLE `uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `uploads` ENABLE KEYS */;

-- Dumping structure for table golf-backend.users
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table golf-backend.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT IGNORE INTO `users` (`id`, `name`, `context_id`, `email`, `password`, `type`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 1, 'admin@golf.com', '$2y$10$QfL7TJyUxMpmGoeg5Y.ULeMAUcI.aMFghVpXkU.dPPBw2fIw1JyXO', 'Employee', NULL, NULL, '2018-03-20 09:02:42', '2018-03-20 09:02:42'),
	(2, 'Super Champion', 1, 'superchampion0521@gmail.com', '$2y$10$unALZXRjCBaD7UnGyQaX3e.3oqKyLEteEUA5TUNPkvDF3aNSa5Mde', 'Client', NULL, NULL, '2018-03-20 14:37:15', '2018-03-20 14:37:15');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table golf-backend.videos
CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `favourite` int(11) NOT NULL,
  `unviewed` int(11) NOT NULL,
  `skill_id` int(10) unsigned NOT NULL DEFAULT '1',
  `tag` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `videos_skill_id_foreign` (`skill_id`),
  CONSTRAINT `videos_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table golf-backend.videos: ~6 rows (approximately)
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT IGNORE INTO `videos` (`id`, `deleted_at`, `created_at`, `updated_at`, `name`, `url`, `user_id`, `favourite`, `unviewed`, `skill_id`, `tag`) VALUES
	(1, NULL, '2018-03-22 17:26:21', '2018-03-22 17:26:21', 'Learn CSS1', 'aaa', 1, 0, 1, 1, 'ball striking'),
	(2, NULL, '2018-03-22 17:26:30', '2018-03-22 17:26:30', 'Learn CSS 2', 'asdf', 1, 0, 1, 1, 'off the tee'),
	(3, NULL, '2018-03-22 17:26:36', '2018-03-22 17:26:36', 'Learn CSS 3', 'asdfadsf', 1, 0, 1, 1, 'ball striking'),
	(4, NULL, '2018-03-22 17:26:40', '2018-03-22 17:26:40', 'Learn CSS 4', 'adfadf', 1, 0, 1, 1, 'off the tee'),
	(5, NULL, '2018-03-22 17:26:47', '2018-03-22 17:26:47', 'Learn CSS 5', 'adsfasdfasdf', 1, 0, 1, 1, 'ball striking'),
	(6, NULL, '2018-03-22 17:26:53', '2018-03-22 17:26:53', 'Learn CSS 6', '1324134134', 1, 0, 1, 1, 'off the tee');
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
