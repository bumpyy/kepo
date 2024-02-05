/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `sites`;
CREATE TABLE `sites` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1021 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_site_id_foreign` (`site_id`),
  CONSTRAINT `tasks_site_id_foreign` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_02_04_073900_create_sites_table', 1),
(6, '2024_02_04_073904_create_tasks_table', 1);





INSERT INTO `sites` (`id`, `created_at`, `updated_at`, `name`, `area`) VALUES
(1001, '2024-02-04 09:22:54', '2024-02-04 17:15:35', 'site name 1', 'area 1');
INSERT INTO `sites` (`id`, `created_at`, `updated_at`, `name`, `area`) VALUES
(1002, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'site name 2', 'area 1');
INSERT INTO `sites` (`id`, `created_at`, `updated_at`, `name`, `area`) VALUES
(1003, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'site name 3', 'area 1');
INSERT INTO `sites` (`id`, `created_at`, `updated_at`, `name`, `area`) VALUES
(1004, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'site name 4', 'area 1'),
(1005, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'site name 5', 'area 1'),
(1006, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'site name 6', 'area 1'),
(1007, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'site name 7', 'area 1'),
(1008, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'site name 8', 'area 1'),
(1009, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'site name 9', 'area 2'),
(1010, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'site name 10', 'area 2'),
(1011, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'site name 11', 'area 2'),
(1012, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'site name 12', 'area 3'),
(1013, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'site name 13', 'area 3'),
(1014, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'site name 14', 'area 3'),
(1015, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'site name 15', 'area 3'),
(1016, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'site name 16', 'area 3'),
(1017, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'site name 17', 'area 3'),
(1018, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'site name 18', 'area 3'),
(1019, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'site name 19', 'area 4'),
(1020, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'site name 20', 'area 4');

INSERT INTO `tasks` (`id`, `created_at`, `updated_at`, `name`, `vendor`, `site_id`) VALUES
(1, '2024-02-04 09:22:54', '2024-02-04 17:12:14', 'proj 1', 'BA', 1001);
INSERT INTO `tasks` (`id`, `created_at`, `updated_at`, `name`, `vendor`, `site_id`) VALUES
(2, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'proj 2', 'BA', 1002);
INSERT INTO `tasks` (`id`, `created_at`, `updated_at`, `name`, `vendor`, `site_id`) VALUES
(3, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'proj 3', 'BA', 1003);
INSERT INTO `tasks` (`id`, `created_at`, `updated_at`, `name`, `vendor`, `site_id`) VALUES
(4, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'proj 4', 'BO', 1004),
(5, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'proj 5', 'BO', 1005),
(6, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'proj 6', 'BO', 1006),
(7, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'proj 7', 'BO', 1007),
(8, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'proj 8', 'NE', 1008),
(9, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'proj 9', 'NE', 1009),
(10, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'proj 10', 'NE', 1010),
(11, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'proj 11', 'NE', 1011),
(12, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'proj 12', 'AI', 1012),
(13, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'proj 13', 'AI', 1013),
(14, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'proj 14', 'AI', 1014),
(15, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'proj 15', 'AI', 1015),
(16, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'proj 16', 'AI', 1016),
(17, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'proj 17', 'AI', 1017),
(18, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'proj 18', 'O2', 1018),
(19, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'proj 19', 'O2', 1019),
(20, '2024-02-04 09:22:54', '2024-02-04 09:22:54', 'proj 20', 'O2', 1020);

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@email.com', NULL, '$2y$12$xUp5jxa3r7P2ObdcKQHQfujKUmIuTvqhHAl1J1ZEktIDqf5wt1qjG', 'admin', 'Gf43WJm5zyB4H3IQiJgcbEPXzK9IUSXJYHherkRrznGsoZCEErV8H1aDfPzw', '2024-02-04 09:22:54', '2024-02-04 09:22:54');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;