-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2019 at 01:51 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lucid`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_settings`
--

CREATE TABLE `contact_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extfeeds`
--

CREATE TABLE `extfeeds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `site` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `des` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tags` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extfeeds`
--

INSERT INTO `extfeeds` (`id`, `user_id`, `site`, `site_image`, `title`, `des`, `link`, `date`, `image`, `created_at`, `updated_at`, `tags`) VALUES
(1, 1, 'Elijah Okokon', 'https://lh3.googleusercontent.com/a-/AAuE7mAo4FOP7u5EsOd6jSUn8fBGAXzqbiOs9LhXkbVOug', 'my fist post', 'oaokaokaoa', '/post/my-fist-post-03e', 'Sep 11th, 2019 01:26 PM', '', NULL, NULL, NULL),
(2, 1, 'Elijah Okokon', 'https://lh3.googleusercontent.com/a-/AAuE7mAo4FOP7u5EsOd6jSUn8fBGAXzqbiOs9LhXkbVOug', 'test code', 'test\ntest\n\\~~~html\ntest\n\\~~~', '/post/test-code-bc6', 'Sep 11th, 2019 07:00 PM', '', NULL, NULL, NULL),
(3, 2, 'Louis Bassey Okokon', '/storage/2/images/thumbnail/IMG-20181122-WA0018_small_1568536984.jpg', 'aha', ' ', '/post/aha-720', 'Sep 15th, 2019 03:54 PM', '/storage/2/images/img-qygt0us7ox.jpeg', NULL, NULL, NULL),
(4, 2, 'Louis Bassey Okokon', '/storage/2/images/thumbnail/IMG-20181122-WA0018_small_1568536984.jpg', 'again', ' ', '/post/again-be4', 'Sep 15th, 2019 04:48 PM', '/storage/2/images/img-ztxcsj0285.jpeg', NULL, NULL, NULL),
(5, 2, 'Louis Bassey Okokon', '/storage/2/images/thumbnail/IMG-20181122-WA0018_small_1568536984.jpg', 'kkj', '![](/storage/2/images/thumbnail/img-1vlmfui4nn_large_.jpeg)![](/storage/2/images/thumbnail/img-mb07f2x453\'_large_\'1568563858994.jpeg)', '/post/kkj-4bd', 'Sep 15th, 2019 05:11 PM', '/storage/2/images/thumbnail/img-1vlmfui4nn_small_.jpeg', NULL, NULL, 'Technology'),
(6, 2, 'Louis Bassey Okokon', '/storage/2/images/thumbnail/IMG-20181122-WA0018_small_1568536984.jpg', 'upsard', 'am adding\n\n![](/storage/2/images/thumbnail/img-ydyipn0t61_large_.jpeg)\n\n![](/storage/2/images/thumbnail/img-lip9ljqexr_large_.jpeg)', '/post/upsard-ea7', 'Sep 16th, 2019 08:55 AM', '/storage/2/images/thumbnail/img-ydyipn0t61_small_.jpeg', NULL, NULL, 'Politics, Technology, Health');

-- --------------------------------------------------------

--
-- Table structure for table `ext_rsses`
--

CREATE TABLE `ext_rsses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastBuildDate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ext_rsses`
--

INSERT INTO `ext_rsses` (`id`, `user_id`, `title`, `url`, `description`, `image`, `link`, `lastBuildDate`, `created_at`, `updated_at`, `category`) VALUES
(1, 2, 'Stratechery by Ben Thompson', 'http://stratechery.com/feed/', 'On the business, strategy, and impact of technology.', 'https://stratechery.com/wp-content/uploads/2018/03/cropped-android-chrome-512x512-1-32x32.png', '', '\n	Thu, 19 Sep 2019 17:31:06 +0000	', NULL, NULL, NULL),
(2, 2, 'Sample Feed - Favorite RSS Related Software & Resources', 'https://www.feedforall.com//sample-feed.xml', 'Take a look at some of FeedForAll\'s favorite software and resources for learning more about RSS.', 'http://www.feedforall.com/feedforall-temp.gif', 'http://www.feedforall.com', 'Mon, 1 Nov 2004 13:17:17 -0500', NULL, NULL, 'main');

-- --------------------------------------------------------

--
-- Table structure for table `following`
--

CREATE TABLE `following` (
  `my_id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `following`
--

INSERT INTO `following` (`my_id`, `follower_id`, `status`) VALUES
(2, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `interests`
--

CREATE TABLE `interests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `interest` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover_img` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maillists`
--

CREATE TABLE `maillists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_07_08_124817_create_user_settings_table', 1),
(4, '2019_07_10_143908_create_ext_rss_table', 1),
(5, '2019_07_10_145904_create_extfeeds_table', 1),
(6, '2019_07_26_080545_add_short_bio_to_users_table', 1),
(7, '2019_08_16_204047_create_contact_settings', 1),
(8, '2019_08_18_092103_create_maillists_table', 1),
(9, '2019_08_21_100613_create_posts_table', 1),
(10, '2019_08_21_193424_add_image_to_posts', 1),
(11, '2019_08_22_115308_create_comments_table', 1),
(12, '2019_08_23_124434_create_thoughts_table', 1),
(13, '2019_08_23_124615_create_notifications_table', 1),
(14, '2019_08_23_130039_add_action_to_posts_table', 1),
(15, '2019_08_24_212810_create_following_table', 1),
(16, '2019_08_26_130908_add_tags_to_extfeeds', 1),
(17, '2019_08_31_102700_create_interests_table', 1),
(18, '2019_09_02_033813_add_post_id_to_posts_table', 1),
(19, '2019_09_12_163927_create_users_email_login_tokens_table', 2),
(20, '2019_09_20_092624_add_tabs_to_user_settings_table', 2),
(21, '2019_09_20_092826_add_view_to_user_settings_table', 2),
(22, '2019_09_20_092914_add_theme_to_user_settings_table', 2),
(23, '2019_09_20_094422_add_public_view_to_user_settings_table', 2),
(24, '2019_09_22_095822_add_category_to_ext_rsses_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `parent_comment_id` int(11) DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `post_id`, `parent_comment_id`, `comment`, `sender_id`, `user_id`, `status`, `action`, `type`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, 2, 1, 0, 'Followed', 'Following', '2019-09-16 21:20:01', '2019-09-16 21:20:01');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `content`, `tags`, `slug`, `created_at`, `updated_at`, `image`, `action`, `post_id`) VALUES
(1, 1, 'my fist post', 'oaokaokaoa', NULL, 'my-fist-post-03e', '2019-09-11 12:26:05', '2019-09-11 12:26:05', NULL, 'publish', NULL),
(2, 1, 'test code', '<h1>test</h1>\r\n\r\n<h1>test</h1>\r\n\r\n  \r\n\r\n~~~html\r\n\r\n<h1>test</h1>\r\n\r\n~~~', NULL, 'test-code-bc6', '2019-09-11 18:00:27', '2019-09-13 08:16:13', NULL, 'publish', NULL),
(3, 2, 'aha', '![](/storage/2/images/img-qygt0us7ox.jpeg)', NULL, 'aha-720', '2019-09-15 14:54:45', '2019-09-15 14:54:45', '/storage/2/images/thumbnail/img-qygt0us7ox_small_1568559283.jpeg', 'publish', NULL),
(4, 2, 'again', '![](/storage/2/images/img-ztxcsj0285.jpeg)', NULL, 'again-be4', '2019-09-15 15:48:44', '2019-09-15 15:48:44', '/storage/2/images/thumbnail/img-ztxcsj0285_small_1568562523.jpeg', 'publish', NULL),
(5, 2, 'kkj', '![](/storage/2/images/thumbnail/img-1vlmfui4nn_large_.jpeg)![](/storage/2/images/thumbnail/img-mb07f2x453\'_large_\'1568563858994.jpeg)', 'Technology', 'kkj-4bd', '2019-09-15 16:11:00', '2019-09-22 08:13:45', '/storage/2/images/thumbnail/img-1vlmfui4nn_small_.jpeg', 'publish', NULL),
(6, 2, 'upsard', 'am adding\n\n![](/storage/2/images/thumbnail/img-ydyipn0t61_large_.jpeg)\n\n![](/storage/2/images/thumbnail/img-lip9ljqexr_large_.jpeg)', 'Politics, Technology, Health', 'upsard-ea7', '2019-09-16 07:55:14', '2019-09-22 08:13:17', '/storage/2/images/thumbnail/img-ydyipn0t61_small_.jpeg', 'publish', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `thoughts`
--

CREATE TABLE `thoughts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `thoughts`
--

INSERT INTO `thoughts` (`id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 'hellp', '2019-09-11 12:25:43', '2019-09-11 12:25:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `short_bio` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `image`, `provider`, `provider_id`, `password`, `remember_token`, `created_at`, `updated_at`, `short_bio`) VALUES
(1, 'Elijah Okokon', 'okoelijah', 'okoelijah@gmail.com', 'https://lh3.googleusercontent.com/a-/AAuE7mAo4FOP7u5EsOd6jSUn8fBGAXzqbiOs9LhXkbVOug', 'google', '105584000674868760138', NULL, 'kY8mZCeBGb8bEkAfTkpAZYx2oWmrSeyRq8FrQfLkp1RHSWVmxVJ3r7hRXd7f', '2019-09-11 10:20:54', '2019-09-11 10:20:54', NULL),
(2, 'Louis Bassey Okokon', 'manchildservices', 'manchildservices@gmail.com', '/storage/2/images/thumbnail/IMG-20181122-WA0018_small_1568536984.jpg', 'google', '110785533062528610486', NULL, 'HTHJ265ZhYjHShql5RaC2P6ZVyyD4EyJYzjYBVzYDHnMkTQ4teitGsbyXm5U', '2019-09-15 05:19:43', '2019-09-15 05:19:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_email_login_tokens`
--

CREATE TABLE `users_email_login_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_settings`
--

CREATE TABLE `user_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `setting_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tabs` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` text COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `public_view` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_settings`
--

INSERT INTO `user_settings` (`id`, `user_id`, `user_path`, `setting_path`, `created_at`, `updated_at`, `tabs`, `view`, `theme`, `public_view`) VALUES
(1, 1, '1/', '', '2019-09-11 10:20:57', '2019-09-11 10:20:57', NULL, NULL, 'default', NULL),
(2, 2, '2/', '', '2019-09-15 05:19:46', '2019-09-15 05:19:46', 'a:3:{i:0;s:10:\"Technology\";i:1;s:6:\"Health\";i:2;s:8:\"Politics\";}', 'Timeline', 'default', 'Home');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_settings`
--
ALTER TABLE `contact_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extfeeds`
--
ALTER TABLE `extfeeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ext_rsses`
--
ALTER TABLE `ext_rsses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interests`
--
ALTER TABLE `interests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maillists`
--
ALTER TABLE `maillists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thoughts`
--
ALTER TABLE `thoughts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_email_login_tokens`
--
ALTER TABLE `users_email_login_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_settings`
--
ALTER TABLE `user_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_settings_user_id_unique` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_settings`
--
ALTER TABLE `contact_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extfeeds`
--
ALTER TABLE `extfeeds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ext_rsses`
--
ALTER TABLE `ext_rsses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `interests`
--
ALTER TABLE `interests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maillists`
--
ALTER TABLE `maillists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `thoughts`
--
ALTER TABLE `thoughts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_email_login_tokens`
--
ALTER TABLE `users_email_login_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_settings`
--
ALTER TABLE `user_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
