-- phpMyAdmin SQL Dump
-- version 4.7.6
-- https://www.phpmyadmin.net/
--
-- 主機: localhost
-- 產生時間： 2018 年 12 月 13 日 14:29
-- 伺服器版本: 5.7.20
-- PHP 版本： 7.1.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `laravel5`
--

-- --------------------------------------------------------

--
-- 資料表結構 `images`
--

CREATE TABLE `images` (
  `id` int(10) UNSIGNED NOT NULL,
  `user` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `images`
--

INSERT INTO `images` (`id`, `user`, `image`, `created_at`, `updated_at`) VALUES
(1, 'zxcv1884@gmail.com', '1544353363.png', '2018-12-08 23:57:31', '2018-12-09 03:02:43'),
(2, 'zxcv18841@gmail.com', '1544350872.png', '2018-12-09 02:21:12', '2018-12-09 02:21:12');

-- --------------------------------------------------------

--
-- 資料表結構 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(20, '2014_10_12_000000_create_users_table', 3),
(21, '2014_10_12_100000_create_password_resets_table', 3),
(22, '2018_10_14_030951_create_image_table', 3),
(23, '2018_12_08_093224_create_personalization_table', 3);

-- --------------------------------------------------------

--
-- 資料表結構 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `personalization`
--

CREATE TABLE `personalization` (
  `user` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `county` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `headline` char(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `international` char(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business` char(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `science` char(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entertainment` char(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sport` char(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `health` char(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `local` char(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `personalization`
--

INSERT INTO `personalization` (`user`, `county`, `district`, `location`, `headline`, `international`, `business`, `science`, `entertainment`, `sport`, `health`, `local`, `created_at`, `updated_at`) VALUES
('zxcv1884@gmail.com', '宜蘭縣', '礁溪鄉', '你好啊', '0', '0', '0', '0', '0', '1', '0', '1', '2018-12-08 23:58:00', '2018-12-09 02:15:54'),
('zxcv18841@gmail.com', '臺北市', '松山區', '4324', '0', '1', '0', '0', '0', '0', '0', '0', '2018-12-09 02:21:05', '2018-12-09 02:21:05'),
('zxcv18846@gmail.com', '新北市', '板橋區', '文化路二段410巷3號', '0', '1', '0', '0', '0', '0', '0', '0', '2018-12-13 05:30:23', '2018-12-13 05:30:23');

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `product_id`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'RBC', 'zxcv1884@gmail.com', '12342321', NULL, '$2y$10$GDZcvshAUiwDUvb8Ssznz.z/yaUCqIP/8oB2corE75xwqfhlSDa.S', 'bWOmhDEooK51sPsU2xw0upvIscpHreX8ojA1Kw7wYa24ZnQXflMCOwvIPu4y', '2018-12-08 23:57:20', '2018-12-08 23:57:20'),
(2, 'Jason', 'zxcv18841@gmail.com', '你好', NULL, '$2y$10$5EFqlRZkwQ3RaLI3rfF9rOu0cgCbeJCssBovnc.FEmp4IH/dvc0Vi', 'dgQTN9tg8icWGZnNSC8vGAUdKVGJz2FDJfS7fp2rDYQODvRLm95uHmRbJWX9', '2018-12-09 02:16:56', '2018-12-09 02:16:56'),
(3, 'sfaf@asjio.com', 'sfaf@asjio.com', '12312312', NULL, '$2y$10$ovdSv7kvxKcNl2SmTE5Dj.qVAsRiNb/TulvxfjWqBzpxx.WGbkiWy', 'dGuCEbtfIA5LuCRMAodea8qyP6fFANUmOgVWYT6v74qFliSF6KyejwFhkNdl', '2018-12-09 02:26:43', '2018-12-09 02:26:43'),
(4, 'Neko', 'zxcv18842@gmail.com', '123492', NULL, '$2y$10$IVjbwCF6ngPZUzEqLt6FN.qWxZl7t9XVrF3ApQYhEo1CB.D28UZfW', 'tzrbrIdr3m8q2zRwhyzjUlJ1JBeHJR8pZQxiXkRPfvg5Batq4PWM6wnQIaU7', '2018-12-09 02:30:15', '2018-12-09 02:30:15'),
(5, 'Jason', 'zxcv18846@gmail.com', '2348348', NULL, '$2y$10$AID4NALt4T6iQa4OXaGcKOXGEobKptwT9zQqzAXVU8tJImDQxrUc6', 'j3HvMNDLgZ2cJR6nQ4OtUZvf0h9ZgeaWObkhFWw8h8KDKX1KVH9EJglqXiCd', '2018-12-09 02:36:11', '2018-12-09 02:36:11');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_product_id_unique` (`product_id`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `images`
--
ALTER TABLE `images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表 AUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- 使用資料表 AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
