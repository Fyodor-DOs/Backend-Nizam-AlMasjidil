-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 26, 2025 at 06:10 PM
-- Server version: 8.0.40
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistem_masjid`
--

-- --------------------------------------------------------

--
-- Table structure for table `donasi`
--

CREATE TABLE `donasi` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `jumlah` decimal(15,2) NOT NULL,
  `metode_pembayaran` enum('transfer','tunai','e-wallet') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `keuangan_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donasi`
--

INSERT INTO `donasi` (`id`, `user_id`, `jumlah`, `metode_pembayaran`, `tanggal`, `keuangan_id`, `created_at`, `updated_at`) VALUES
(1, 1, 200000.00, 'transfer', '2025-04-26', 1, '2025-04-26 10:54:40', '2025-04-26 10:54:40'),
(2, 1, 300000.00, 'tunai', '2025-04-26', 2, '2025-04-26 10:54:46', '2025-04-26 10:54:46');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_kegiatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `lokasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan`
--

CREATE TABLE `keuangan` (
  `id` bigint UNSIGNED NOT NULL,
  `tipe_keuangan_id` bigint UNSIGNED NOT NULL,
  `jumlah` decimal(15,2) NOT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tanggal` date NOT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `keuangan`
--

INSERT INTO `keuangan` (`id`, `tipe_keuangan_id`, `jumlah`, `keterangan`, `tanggal`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 200000.00, 'Donasi dari John', '2025-04-26', 1, '2025-04-26 10:54:40', '2025-04-26 10:54:40'),
(2, 1, 300000.00, 'Donasi dari John', '2025-04-26', 1, '2025-04-26 10:54:46', '2025-04-26 10:54:46');

-- --------------------------------------------------------

--
-- Table structure for table `laporan_keuangan`
--

CREATE TABLE `laporan_keuangan` (
  `id` bigint UNSIGNED NOT NULL,
  `total_pemasukan` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_pengeluaran` decimal(15,2) NOT NULL DEFAULT '0.00',
  `saldo_akhir` decimal(15,2) NOT NULL DEFAULT '0.00',
  `periode_bulan` int NOT NULL,
  `periode_tahun` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_03_17_143219_create_kegiatans_table', 1),
(6, '2025_03_17_143220_create_tipe_keuangans_table', 1),
(7, '2025_03_17_143221_create_keuangans_table', 1),
(8, '2025_03_17_143222_create_donasis_table', 1),
(9, '2025_03_17_143227_create_laporan_keuangans_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(24, 'App\\Models\\User', 2, 'authToken', 'a6cc861edccab2fb0267a43b5ae1307fed048413e8f14f6fe3f6f34a6229e926', '[\"*\"]', NULL, NULL, '2025-04-26 01:37:04', '2025-04-26 01:37:04'),
(25, 'App\\Models\\User', 3, 'authToken', 'cb871e54ed415b52d1c0267cf56e03626ea9d56219d66c892ae3bb1e6abab106', '[\"*\"]', NULL, NULL, '2025-04-26 01:37:39', '2025-04-26 01:37:39'),
(26, 'App\\Models\\User', 4, 'authToken', 'fb3a498667c055e8cc4c6f9945b58b87feeef0adf1883bbfd27d82754632282a', '[\"*\"]', NULL, NULL, '2025-04-26 01:37:57', '2025-04-26 01:37:57'),
(27, 'App\\Models\\User', 5, 'authToken', '24c6abd48964ca62d077636b23e0149bcdf287245a3e860de4667619446401d4', '[\"*\"]', NULL, NULL, '2025-04-26 01:38:39', '2025-04-26 01:38:39'),
(28, 'App\\Models\\User', 6, 'authToken', '06985ac954d4d5869c39f4d97b4e3730650107b11b7698895f9e1b0ed94c4f3d', '[\"*\"]', NULL, NULL, '2025-04-26 01:38:48', '2025-04-26 01:38:48'),
(29, 'App\\Models\\User', 7, 'authToken', 'adbd54c1058a24063ce60131d3e9305b1d1fe1d53e8ab08f3e67cfc37e5b86e7', '[\"*\"]', NULL, NULL, '2025-04-26 01:39:05', '2025-04-26 01:39:05'),
(30, 'App\\Models\\User', 1, 'authToken', '905d1ced9d4f9b90403ea2b26b8cb84ed9148bdaad8194929d93d9aa71e589c0', '[\"*\"]', NULL, NULL, '2025-04-26 01:39:28', '2025-04-26 01:39:28'),
(31, 'App\\Models\\User', 2, 'authToken', 'ff57d6cc9efc240f0b834ac3c5716f29ef6501c8554a679e0b636b9ae05ca078', '[\"*\"]', NULL, NULL, '2025-04-26 01:39:38', '2025-04-26 01:39:38'),
(32, 'App\\Models\\User', 3, 'authToken', '1acc16e55ec9209b0433b407cd93c317bef559696e6ee45b771c9ce5dec06689', '[\"*\"]', NULL, NULL, '2025-04-26 01:39:44', '2025-04-26 01:39:44'),
(33, 'App\\Models\\User', 1, 'authToken', '1aa1457ef7556421f8f5d31776f849e4de84dd6b17bcdfa5df8a5b20125fff7f', '[\"*\"]', NULL, NULL, '2025-04-26 08:47:56', '2025-04-26 08:47:56'),
(34, 'App\\Models\\User', 1, 'authToken', '4bb6c3bff29f75bcdcb2e2b813ed1e36f60f4ad5ec2c9251af8ed10d3689f69f', '[\"*\"]', '2025-04-26 08:48:00', NULL, '2025-04-26 08:47:58', '2025-04-26 08:48:00'),
(35, 'App\\Models\\User', 1, 'authToken', 'f99a43d1d5b46bf126bb5c814fa101b0ab02cd00109f2090c6b093f069500357', '[\"*\"]', '2025-04-26 08:49:07', NULL, '2025-04-26 08:49:05', '2025-04-26 08:49:07'),
(36, 'App\\Models\\User', 1, 'authToken', 'bec878510eb3f33708b13e3b0e79ec1ae2fb08662a0434aa4b2b5cf59ea78553', '[\"*\"]', '2025-04-26 08:59:14', NULL, '2025-04-26 08:52:09', '2025-04-26 08:59:14'),
(37, 'App\\Models\\User', 1, 'authToken', '6801444a76656f703c64cb23c05f92d7c1d0ff970dc817d6a6b32be00a86376e', '[\"*\"]', '2025-04-26 09:00:05', NULL, '2025-04-26 08:59:56', '2025-04-26 09:00:05'),
(38, 'App\\Models\\User', 1, 'authToken', '3ade0e31b43f6546af0396b130105df44f75f12d47098b53f8059bd7a6528f0a', '[\"*\"]', '2025-04-26 09:22:10', NULL, '2025-04-26 09:20:56', '2025-04-26 09:22:10'),
(39, 'App\\Models\\User', 1, 'authToken', '3013e114ad6dd4b5acf53b29ac745dcfeb68295a8588bba62d1c37250235a67a', '[\"*\"]', '2025-04-26 09:22:21', NULL, '2025-04-26 09:22:15', '2025-04-26 09:22:21'),
(40, 'App\\Models\\User', 1, 'authToken', '87a5969406213b804560b7661c6c5416b57851ba723b83fdba2dda6cb12fc006', '[\"*\"]', '2025-04-26 09:25:34', NULL, '2025-04-26 09:25:27', '2025-04-26 09:25:34'),
(41, 'App\\Models\\User', 1, 'authToken', '0a2f875209b81a9a51cd4b071551748c17e1f378174711dedd555101d12bef3e', '[\"*\"]', '2025-04-26 09:32:38', NULL, '2025-04-26 09:30:29', '2025-04-26 09:32:38'),
(42, 'App\\Models\\User', 1, 'authToken', 'ff5b8c892ddb03ce86eff7ce9a5633fdfcc63771a1d4dc9d2e619656cdc9de5d', '[\"*\"]', '2025-04-26 09:37:52', NULL, '2025-04-26 09:32:42', '2025-04-26 09:37:52'),
(43, 'App\\Models\\User', 1, 'authToken', 'c0e1e5f8dc7038296a6701f99e836c70a637b584367c6017f3fac92c1172b02a', '[\"*\"]', '2025-04-26 09:57:35', NULL, '2025-04-26 09:38:05', '2025-04-26 09:57:35'),
(44, 'App\\Models\\User', 1, 'authToken', '0aa0b1be73f79887cbf5fa8f37d46a331923905b2125a4907007c71656684163', '[\"*\"]', '2025-04-26 10:21:00', NULL, '2025-04-26 09:42:54', '2025-04-26 10:21:00'),
(45, 'App\\Models\\User', 1, 'authToken', '8526308551b80ea56953a69cd3ad2f8de7b9fa3a4964f79f9b51e632d4df0683', '[\"*\"]', '2025-04-26 10:01:44', NULL, '2025-04-26 09:57:42', '2025-04-26 10:01:44'),
(46, 'App\\Models\\User', 1, 'authToken', 'a6790f2bba4d4afe46e810d8775a72dc290ed3eb7340a49950663c1e3a4d4dcc', '[\"*\"]', '2025-04-26 10:11:47', NULL, '2025-04-26 10:01:48', '2025-04-26 10:11:47'),
(47, 'App\\Models\\User', 1, 'authToken', '40237dc03ab366e3e366388ac787fa75e9edd092d6e9967dd21741e53ef49db5', '[\"*\"]', '2025-04-26 10:53:28', NULL, '2025-04-26 10:19:01', '2025-04-26 10:53:28'),
(48, 'App\\Models\\User', 1, 'authToken', '6ec45b186d65000b255f85a626e450506c3140c4fdd55239564d8f10daefa73d', '[\"*\"]', '2025-04-26 11:08:40', NULL, '2025-04-26 10:53:33', '2025-04-26 11:08:40');

-- --------------------------------------------------------

--
-- Table structure for table `tipe_keuangan`
--

CREATE TABLE `tipe_keuangan` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_tipe` enum('pemasukan','pengeluaran') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tipe_keuangan`
--

INSERT INTO `tipe_keuangan` (`id`, `nama_tipe`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'pemasukan', 'Dana masuk', '2025-04-26 17:20:52', '2025-04-26 17:20:52'),
(2, 'pengeluaran', 'Dana keluar', '2025-04-26 17:20:52', '2025-04-26 17:20:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','takmir','jamaah') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'John', 'john@gmail.com', '$2y$12$gyZXb7fpxJq66XhcqAKcHe3lDoMD5HDcI5rxI.nGzHfDeNRraUgDS', 'admin', '2025-04-26 01:39:28', '2025-04-26 01:39:28'),
(2, 'Jane', 'jane@gmail.com', '$2y$12$u9bwzdW1JC3fNop6OZN3Ce8E6.nbQqXCCEHZtXd3V2OfEhvhiB3ke', 'takmir', '2025-04-26 01:39:38', '2025-04-26 01:39:38'),
(3, 'Ahmad', 'ahmad@gmail.com', '$2y$12$KPdAmvHs1IBiAIb5GpWEIe68WBgLN1w0jJtLzi/OqWo.ohuDNliG6', 'jamaah', '2025-04-26 01:39:44', '2025-04-26 01:39:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `donasi`
--
ALTER TABLE `donasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `donasi_user_id_foreign` (`user_id`),
  ADD KEY `donasi_keuangan_id_foreign` (`keuangan_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kegiatan_created_by_foreign` (`created_by`);

--
-- Indexes for table `keuangan`
--
ALTER TABLE `keuangan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keuangan_tipe_keuangan_id_foreign` (`tipe_keuangan_id`),
  ADD KEY `keuangan_created_by_foreign` (`created_by`);

--
-- Indexes for table `laporan_keuangan`
--
ALTER TABLE `laporan_keuangan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `tipe_keuangan`
--
ALTER TABLE `tipe_keuangan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `donasi`
--
ALTER TABLE `donasi`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `keuangan`
--
ALTER TABLE `keuangan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `laporan_keuangan`
--
ALTER TABLE `laporan_keuangan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `tipe_keuangan`
--
ALTER TABLE `tipe_keuangan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `donasi`
--
ALTER TABLE `donasi`
  ADD CONSTRAINT `donasi_keuangan_id_foreign` FOREIGN KEY (`keuangan_id`) REFERENCES `keuangan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `donasi_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD CONSTRAINT `kegiatan_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `keuangan`
--
ALTER TABLE `keuangan`
  ADD CONSTRAINT `keuangan_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `keuangan_tipe_keuangan_id_foreign` FOREIGN KEY (`tipe_keuangan_id`) REFERENCES `tipe_keuangan` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
