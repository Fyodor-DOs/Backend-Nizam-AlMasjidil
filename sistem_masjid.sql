-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 25, 2025 at 03:05 PM
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
(2, 1, 300000.00, 'tunai', '2025-04-26', 2, '2025-04-26 10:54:46', '2025-04-26 10:54:46'),
(3, 1, 1000000.00, 'tunai', '2025-04-28', 3, '2025-04-28 01:05:52', '2025-04-28 01:05:52'),
(4, 1, 100000.00, 'transfer', '2025-05-05', 4, '2025-05-04 22:41:32', '2025-05-04 22:41:32'),
(5, 1, 50000.00, 'tunai', '2025-05-20', 6, '2025-05-19 18:36:52', '2025-05-19 18:36:52'),
(6, 1, 500000.00, 'transfer', '2025-05-25', 7, '2025-05-24 22:45:50', '2025-05-24 22:45:50'),
(7, 1, 250000.00, 'e-wallet', '2025-05-25', 8, '2025-05-24 23:09:38', '2025-05-24 23:09:38'),
(8, 1, 450000.00, 'tunai', '2025-05-25', 9, '2025-05-25 00:56:45', '2025-05-25 00:56:45'),
(9, 1, 10000.00, 'transfer', '2025-05-25', 10, '2025-05-25 07:58:11', '2025-05-25 07:58:11');

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
  `gambar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kegiatan`
--

INSERT INTO `kegiatan` (`id`, `nama_kegiatan`, `deskripsi`, `tanggal`, `waktu`, `lokasi`, `gambar`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 'Pengajian', 'pengajian ibu-ibu sore', '2025-05-06', '15:15:00', 'Ruangan A', 'kegiatan/fS4B845wraYZ0hQxVBH0VlHKUjLAkQ80Vto22pQ1.png', 1, '2025-05-04 23:44:09', '2025-05-04 23:44:09'),
(3, 'Kurban', 'kurban', '2025-05-09', '15:58:00', 'lapangan', 'kegiatan/sncGqJrX8enhy1gl8g8W9DiPgVMTpTTjMz2hAEwC.webp', 1, '2025-05-05 01:57:43', '2025-05-05 01:57:43'),
(4, 'Tidur siang', 'program tidur siang manja', '2025-05-19', '12:29:00', 'Pulau Kapuk', 'kegiatan/49RtpIlHvFXVrYKg2dEGAxlYFRlWQWqw8JhayBAD.jpg', 1, '2025-05-18 22:29:43', '2025-05-18 22:29:43'),
(5, 'Solat jumat', 'berjamaah', '2025-05-30', '11:15:00', 'Ruangan B', 'kegiatan/L8oxQcnVXmRbtWflzW48VFTUlKQ8npukjCmv2Sm4.webp', 1, '2025-05-24 22:50:11', '2025-05-24 22:50:11');

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
(2, 1, 300000.00, 'Donasi dari John', '2025-04-26', 1, '2025-04-26 10:54:46', '2025-04-26 10:54:46'),
(3, 1, 1000000.00, 'Donasi dari John', '2025-04-28', 1, '2025-04-28 01:05:52', '2025-04-28 01:05:52'),
(4, 1, 100000.00, 'Donasi dari John', '2025-05-05', 1, '2025-05-04 22:41:32', '2025-05-04 22:41:32'),
(5, 2, 10000.00, 'beli pensil', '2025-05-02', 1, '2025-05-04 22:42:55', '2025-05-04 22:42:55'),
(6, 1, 50000.00, 'Donasi dari John', '2025-05-20', 1, '2025-05-19 18:36:52', '2025-05-19 18:36:52'),
(7, 1, 500000.00, 'Donasi dari John', '2025-05-25', 1, '2025-05-24 22:45:50', '2025-05-24 22:45:50'),
(8, 1, 250000.00, 'Donasi dari John', '2025-05-25', 1, '2025-05-24 23:09:38', '2025-05-24 23:09:38'),
(9, 1, 450000.00, 'Donasi dari John', '2025-05-25', 1, '2025-05-25 00:56:45', '2025-05-25 00:56:45'),
(10, 1, 10000.00, 'Donasi dari John', '2025-05-25', 1, '2025-05-25 07:58:11', '2025-05-25 07:58:11');

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
(9, '2025_03_17_143227_create_laporan_keuangans_table', 1),
(10, '2025_05_04_134527_add_gambar_to_kegiatan_table', 2),
(13, '2025_05_25_132837_create_tausiyah_table', 3);

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
(48, 'App\\Models\\User', 1, 'authToken', '6ec45b186d65000b255f85a626e450506c3140c4fdd55239564d8f10daefa73d', '[\"*\"]', '2025-04-26 11:08:40', NULL, '2025-04-26 10:53:33', '2025-04-26 11:08:40'),
(49, 'App\\Models\\User', 1, 'authToken', 'f3743b7fcf9cb6ba0b2b3e21da00926788d496a428f407e9301e5e7b76ab43af', '[\"*\"]', '2025-04-26 18:02:48', NULL, '2025-04-26 18:02:40', '2025-04-26 18:02:48'),
(50, 'App\\Models\\User', 3, 'authToken', '1c150308c583dd59ca777c077e659cb357918e6c5a811017e1525295e4fd3d40', '[\"*\"]', NULL, NULL, '2025-04-26 18:16:18', '2025-04-26 18:16:18'),
(51, 'App\\Models\\User', 1, 'authToken', '7f85e3e5068f2a449fdebba9fd88cb83c1b74976732eef28bf1d77de9cb087dd', '[\"*\"]', NULL, NULL, '2025-04-26 18:16:33', '2025-04-26 18:16:33'),
(52, 'App\\Models\\User', 1, 'authToken', '9d41afd99cb548536e30d4239d920d2d25bd51306230cf25e85ecd3bf9713e3a', '[\"*\"]', '2025-04-26 18:23:53', NULL, '2025-04-26 18:23:45', '2025-04-26 18:23:53'),
(53, 'App\\Models\\User', 3, 'authToken', '83f0dc469ae34e3871cf6b9eb0d3d6b33fa80deeab31e68c55171f9be9fe6134', '[\"*\"]', NULL, NULL, '2025-04-26 18:24:19', '2025-04-26 18:24:19'),
(54, 'App\\Models\\User', 2, 'authToken', 'ecd7c48a0a8557bd4addaf08b0eae3186790f6d306a5a7f4a5c2b17a55ead503', '[\"*\"]', NULL, NULL, '2025-04-26 18:26:04', '2025-04-26 18:26:04'),
(55, 'App\\Models\\User', 3, 'authToken', '8395b210b01197e79a0da94768fb1ac03885e82b9053088fcad76b136c70297a', '[\"*\"]', NULL, NULL, '2025-04-26 18:26:29', '2025-04-26 18:26:29'),
(56, 'App\\Models\\User', 4, 'authToken', '888281b24531afa64b1c9543763136ad8fe0b89dbf84200fe7e6f380be961279', '[\"*\"]', NULL, NULL, '2025-04-26 18:27:27', '2025-04-26 18:27:27'),
(57, 'App\\Models\\User', 4, 'authToken', 'beb04f03288f19fdc76a1472100bada1322a77664b45ab12729e56f0fdbc73b1', '[\"*\"]', NULL, NULL, '2025-04-26 18:27:35', '2025-04-26 18:27:35'),
(58, 'App\\Models\\User', 1, 'authToken', '7ae83c953da7732909b2b517345383f367e7f123ccc93c1f611d822667c2720e', '[\"*\"]', NULL, NULL, '2025-04-26 18:28:28', '2025-04-26 18:28:28'),
(59, 'App\\Models\\User', 1, 'authToken', 'b9aa98bb5a00e15f3fa40a51963d59a5894d7318460c6f9579736490331e4f5e', '[\"*\"]', '2025-04-26 18:40:18', NULL, '2025-04-26 18:40:09', '2025-04-26 18:40:18'),
(60, 'App\\Models\\User', 3, 'authToken', 'd8c5119a5cafe47c8fd627e4fb7b23f6f1f84cabb48d422cc903048fba38f068', '[\"*\"]', NULL, NULL, '2025-04-26 18:43:10', '2025-04-26 18:43:10'),
(61, 'App\\Models\\User', 2, 'authToken', '92b80e3423c389f781a154e676fa425804865feaca027a519b6bdab7df96fab5', '[\"*\"]', '2025-04-26 18:43:27', NULL, '2025-04-26 18:43:22', '2025-04-26 18:43:27'),
(62, 'App\\Models\\User', 3, 'authToken', '42bc86ccd81c50c0ea7208f269df2cac5b75633af955deab3d768f80e1aaa393', '[\"*\"]', NULL, NULL, '2025-04-26 23:23:50', '2025-04-26 23:23:50'),
(63, 'App\\Models\\User', 3, 'authToken', '8242760f08162af001150830587912427ed3d6248ca0e1030f3e371fc2d7ce10', '[\"*\"]', NULL, NULL, '2025-04-26 23:23:50', '2025-04-26 23:23:50'),
(64, 'App\\Models\\User', 3, 'authToken', '4ca138037cb35efb24fab43599a6958a7c574591a69e81261fb6a028beed9524', '[\"*\"]', NULL, NULL, '2025-04-26 23:23:51', '2025-04-26 23:23:51'),
(65, 'App\\Models\\User', 3, 'authToken', 'c51e1f049aab45edab1af5687227567dabcf34573d3e0a8d53e1c1cd768e4fd0', '[\"*\"]', NULL, NULL, '2025-04-26 23:24:14', '2025-04-26 23:24:14'),
(66, 'App\\Models\\User', 2, 'authToken', '7b2807e5af27b02ba48f15133c3b99c5897b196cbb6dd0d629dfbe9fbef1ddce', '[\"*\"]', '2025-04-26 23:24:53', NULL, '2025-04-26 23:24:29', '2025-04-26 23:24:53'),
(67, 'App\\Models\\User', 3, 'authToken', '6f00f9c51007b9bc035aaa70bbf7c90af3f3baf92cfd168a84acd56907373fb7', '[\"*\"]', NULL, NULL, '2025-04-26 23:25:29', '2025-04-26 23:25:29'),
(68, 'App\\Models\\User', 1, 'authToken', '54d06ef09a9ccedfde31b986cdb7e97ab936faa55059d3041143a4b0ab452456', '[\"*\"]', NULL, NULL, '2025-04-26 23:28:58', '2025-04-26 23:28:58'),
(69, 'App\\Models\\User', 1, 'authToken', '049dc5270727aa592de9a080ab7853a78ff1d3c802032ac05b02f396e70b006a', '[\"*\"]', '2025-04-26 23:29:04', NULL, '2025-04-26 23:29:00', '2025-04-26 23:29:04'),
(70, 'App\\Models\\User', 1, 'authToken', '04a6250f0dac959036964bd813c7ba44d3645f9bb5999aee4143ccf3001eba22', '[\"*\"]', '2025-04-26 23:39:46', NULL, '2025-04-26 23:34:09', '2025-04-26 23:39:46'),
(71, 'App\\Models\\User', 1, 'authToken', 'd9221d85a210af4c93ab17abad489650d05b8aed546ff2f3fc4460d1f56d01d4', '[\"*\"]', '2025-04-26 23:55:24', NULL, '2025-04-26 23:41:44', '2025-04-26 23:55:24'),
(72, 'App\\Models\\User', 5, 'authToken', 'd2e5dea270f7333c64d4cd71bc6a27039267096eb9311c8564b9c3d763503b64', '[\"*\"]', '2025-04-26 23:56:17', NULL, '2025-04-26 23:55:58', '2025-04-26 23:56:17'),
(73, 'App\\Models\\User', 1, 'authToken', 'b13175fe20efbeb7e07adbfb68557c7209f4bb2feea4b3fa6a1486bb0dce5cec', '[\"*\"]', NULL, NULL, '2025-04-27 01:12:54', '2025-04-27 01:12:54'),
(74, 'App\\Models\\User', 1, 'authToken', '4e348d93b51e2608f68331a3b5633839e1cacb5a96326175baadb724acf68c62', '[\"*\"]', '2025-04-27 01:15:27', NULL, '2025-04-27 01:12:56', '2025-04-27 01:15:27'),
(75, 'App\\Models\\User', 3, 'authToken', 'e8517352d8830d797ca88d01d424df5682b0c9883417ba1e776a65076e244940', '[\"*\"]', '2025-04-27 01:15:54', NULL, '2025-04-27 01:15:43', '2025-04-27 01:15:54'),
(76, 'App\\Models\\User', 1, 'authToken', 'ed01b69861b6083f379d135d998bf470e5bf4c1f07df4860493d16c392fc499d', '[\"*\"]', '2025-04-27 01:16:24', NULL, '2025-04-27 01:16:21', '2025-04-27 01:16:24'),
(77, 'App\\Models\\User', 1, 'authToken', '6dbb24ccc983a0266321b37ab43377feaf02720c6991ac2ce96ea38e9931096d', '[\"*\"]', NULL, NULL, '2025-04-28 00:56:22', '2025-04-28 00:56:22'),
(78, 'App\\Models\\User', 1, 'authToken', '6a19edd6efce4407f8518644d056dece2d39e68d14323773a298e991b00ca5e0', '[\"*\"]', '2025-04-28 01:00:21', NULL, '2025-04-28 01:00:07', '2025-04-28 01:00:21'),
(79, 'App\\Models\\User', 1, 'authToken', 'dd71b019d7d9747f2f5afe68abd266c860631a825bd382ae001cc929e1370bac', '[\"*\"]', '2025-04-28 01:06:08', NULL, '2025-04-28 01:05:31', '2025-04-28 01:06:08'),
(80, 'App\\Models\\User', 1, 'authToken', 'd969150423eb14585316db7a80c7abf918de5b8a981700e6d90ad48af91fa21f', '[\"*\"]', NULL, NULL, '2025-05-04 07:17:34', '2025-05-04 07:17:34'),
(81, 'App\\Models\\User', 1, 'authToken', '5e3affeebc8b11df2cee92c91c9b5309c48342e7d35a12a72418804109f9c6d3', '[\"*\"]', NULL, NULL, '2025-05-04 07:17:36', '2025-05-04 07:17:36'),
(82, 'App\\Models\\User', 1, 'authToken', '96b7400d06dec5364c4dad0951fba778ceb88e11dec5fc7e2645182f59774553', '[\"*\"]', NULL, NULL, '2025-05-04 07:17:36', '2025-05-04 07:17:36'),
(83, 'App\\Models\\User', 1, 'authToken', 'e9e4ceed6720c74a5d548bee0f7961f1f1d2786087036d67c3670994ad303227', '[\"*\"]', '2025-05-04 08:35:06', NULL, '2025-05-04 07:17:37', '2025-05-04 08:35:06'),
(84, 'App\\Models\\User', 1, 'authToken', 'c5633e543a6df150d7f26c81413d3ec43b2fd95d6a059403838fb62d175cb2ed', '[\"*\"]', '2025-05-04 09:30:57', NULL, '2025-05-04 08:40:28', '2025-05-04 09:30:57'),
(85, 'App\\Models\\User', 1, 'authToken', '58ad0541b47f161e2580e942d256a202951dd126ad0a377f83783dfd7ba89be5', '[\"*\"]', '2025-05-04 10:01:39', NULL, '2025-05-04 09:50:22', '2025-05-04 10:01:39'),
(86, 'App\\Models\\User', 1, 'authToken', '1ccd7e081d667962ee2567509fb230acbcd325720f8bb5339a17afa64095810d', '[\"*\"]', '2025-05-04 10:07:37', NULL, '2025-05-04 10:07:28', '2025-05-04 10:07:37'),
(87, 'App\\Models\\User', 1, 'authToken', '8bbef6311a8efff9f623e98368786ea7e29dbb88347d2cfeb33c8ed955d2328a', '[\"*\"]', '2025-05-04 10:18:05', NULL, '2025-05-04 10:10:20', '2025-05-04 10:18:05'),
(88, 'App\\Models\\User', 3, 'authToken', '85f910c8fc4f43c1b1741239409eb625b53cbeb09ff1e4ac058a8fa8cddc4fc6', '[\"*\"]', '2025-05-04 10:19:00', NULL, '2025-05-04 10:18:49', '2025-05-04 10:19:00'),
(89, 'App\\Models\\User', 1, 'authToken', 'dc5e99657bb331dfaedf5a5360dd4c23fe2c1a0dd7fb1e2514ef9e5017c397aa', '[\"*\"]', '2025-05-04 22:29:54', NULL, '2025-05-04 22:23:14', '2025-05-04 22:29:54'),
(90, 'App\\Models\\User', 1, 'authToken', 'd9d2dfca199cb7efbf152a754741ac13c8d934c6d11a88484a8c6329bd80f198', '[\"*\"]', '2025-05-04 22:44:35', NULL, '2025-05-04 22:40:49', '2025-05-04 22:44:35'),
(91, 'App\\Models\\User', 1, 'authToken', '952228853430a11e29db534e78e8dc9d8051e9e2c17af04bbb02a2f6159e98f4', '[\"*\"]', '2025-05-04 23:32:17', NULL, '2025-05-04 23:22:10', '2025-05-04 23:32:17'),
(92, 'App\\Models\\User', 1, 'authToken', '3032b6317f54e7f25c597f0cff9211a1df2f655a437eedaeb8576e98b39fa80b', '[\"*\"]', '2025-05-04 23:56:16', NULL, '2025-05-04 23:36:54', '2025-05-04 23:56:16'),
(93, 'App\\Models\\User', 1, 'authToken', '59f9167049498fd0132d29ffd5642b569650ce6da2a1fb0cea62b9bb226a909c', '[\"*\"]', '2025-05-05 01:57:44', NULL, '2025-05-05 01:55:50', '2025-05-05 01:57:44'),
(94, 'App\\Models\\User', 1, 'authToken', '3c8423fc70cd5162bf80a175b764dce494ab4f0ebcd53371a709b87119515778', '[\"*\"]', NULL, NULL, '2025-05-13 05:51:56', '2025-05-13 05:51:56'),
(95, 'App\\Models\\User', 1, 'authToken', '784dd3cf897b124e1b123c13d60efee8011322ef03d65ff9f7a12c765500b04a', '[\"*\"]', '2025-05-13 05:52:29', NULL, '2025-05-13 05:51:57', '2025-05-13 05:52:29'),
(96, 'App\\Models\\User', 1, 'authToken', 'a63ae655a2bf7530ebe6392122f075d365f082bfa3925e5c0d6f45d2ae863199', '[\"*\"]', NULL, NULL, '2025-05-13 19:54:09', '2025-05-13 19:54:09'),
(97, 'App\\Models\\User', 1, 'authToken', '6a8dfe9a391531b1c977ca78e12a4942098c0eb3d0748eef625e6f90229db2fa', '[\"*\"]', '2025-05-13 19:54:34', NULL, '2025-05-13 19:54:11', '2025-05-13 19:54:34'),
(98, 'App\\Models\\User', 1, 'authToken', '14c152e83a106e82c57fbb91b3848d5f16036975e9c680ae642ecd39bd5542d0', '[\"*\"]', NULL, NULL, '2025-05-18 07:24:54', '2025-05-18 07:24:54'),
(99, 'App\\Models\\User', 1, 'authToken', 'ecf998d393a5d3741f29b0e383fb8516f2dff3e05d45fce59414002ce5682a48', '[\"*\"]', NULL, NULL, '2025-05-18 07:27:18', '2025-05-18 07:27:18'),
(100, 'App\\Models\\User', 1, 'authToken', '6241231adc7a0bcf7e5873607a7309ae4409c03b1b6969cc9a076dc4422c3a9b', '[\"*\"]', '2025-05-18 07:27:53', NULL, '2025-05-18 07:27:20', '2025-05-18 07:27:53'),
(101, 'App\\Models\\User', 1, 'authToken', '3a2f2e78a252a3b376016e9d78b759826baebb2b1be338d8fef7cbade2ce779b', '[\"*\"]', NULL, NULL, '2025-05-18 07:33:47', '2025-05-18 07:33:47'),
(102, 'App\\Models\\User', 1, 'authToken', '97723d584bbc8f6d2755c72c31668ec21d64d19703d00fbc69f1db89047493f5', '[\"*\"]', NULL, NULL, '2025-05-18 07:33:50', '2025-05-18 07:33:50'),
(103, 'App\\Models\\User', 1, 'authToken', '7eea220f32aecedb97812811ccf4e7e732625390880ddf9a14002ab98d07380b', '[\"*\"]', NULL, NULL, '2025-05-18 07:35:24', '2025-05-18 07:35:24'),
(104, 'App\\Models\\User', 1, 'authToken', '15377a5ecad61928e4d9043b5b94e915df6f0dd6faff3de8f78e700afbd8dc17', '[\"*\"]', '2025-05-18 09:31:48', NULL, '2025-05-18 09:28:22', '2025-05-18 09:31:48'),
(105, 'App\\Models\\User', 1, 'authToken', '247b1a8cd827d76d0d1a324c45f17821e6de0bfad0f720454bcfbc602084f7dc', '[\"*\"]', '2025-05-18 09:54:36', NULL, '2025-05-18 09:46:16', '2025-05-18 09:54:36'),
(106, 'App\\Models\\User', 1, 'authToken', '067906215f18eb11906977886c46d47f3ddb064cafd1a8360f1eb37308a93ab4', '[\"*\"]', NULL, NULL, '2025-05-18 09:55:47', '2025-05-18 09:55:47'),
(107, 'App\\Models\\User', 1, 'authToken', '5e83a6cec8ba545c78d3a2ef848ae3e96ee75c4266cd050d9b2fcf5ef7685701', '[\"*\"]', NULL, NULL, '2025-05-18 10:02:03', '2025-05-18 10:02:03'),
(108, 'App\\Models\\User', 3, 'authToken', '458afbcba4798fa603744d9a23703c0a458d56d8ba0d2f985352bc183c605a5b', '[\"*\"]', '2025-05-18 10:02:45', NULL, '2025-05-18 10:02:38', '2025-05-18 10:02:45'),
(109, 'App\\Models\\User', 1, 'authToken', '9cb1102b7c5427b8c87db33a66426a144dfb409cbcdfaeafb2fa1f6af47f2c75', '[\"*\"]', NULL, NULL, '2025-05-18 10:04:39', '2025-05-18 10:04:39'),
(110, 'App\\Models\\User', 1, 'authToken', '4d4f131e16e9ea9c5775d78695d500fd525e538b9dccf41d72d0db5dfcab9654', '[\"*\"]', NULL, NULL, '2025-05-18 20:55:34', '2025-05-18 20:55:34'),
(111, 'App\\Models\\User', 1, 'authToken', 'f6be904682a9e4eac51dedc6f459b749d105c5813eb5bf687b8bd451e10fbbe6', '[\"*\"]', '2025-05-18 20:55:58', NULL, '2025-05-18 20:55:39', '2025-05-18 20:55:58'),
(112, 'App\\Models\\User', 1, 'authToken', 'cbe400fd3bfe4c0c5da86febd1b8e6fdbac405ae6d7231ddfb34748b668e0f09', '[\"*\"]', '2025-05-18 21:27:57', NULL, '2025-05-18 21:27:24', '2025-05-18 21:27:57'),
(113, 'App\\Models\\User', 1, 'authToken', 'dc1c2576b36a85e7a4efeb04f396f7c7aaae1427d8542d6a0e7d6a9c7e36365b', '[\"*\"]', '2025-05-18 22:24:21', NULL, '2025-05-18 21:32:11', '2025-05-18 22:24:21'),
(114, 'App\\Models\\User', 1, 'authToken', '08c76fb7b64ec0aa751454b3ff4013ede26bca4d1c1977ce9fd78206a15d8923', '[\"*\"]', '2025-05-18 22:31:29', NULL, '2025-05-18 22:27:35', '2025-05-18 22:31:29'),
(115, 'App\\Models\\User', 1, 'authToken', '2fa3ead87984a480d69e3533c314724c759b25bb837780c32a84035724f8b6f8', '[\"*\"]', '2025-05-19 00:24:19', NULL, '2025-05-19 00:23:33', '2025-05-19 00:24:19'),
(116, 'App\\Models\\User', 1, 'authToken', '09c051dea8b08bfdc79a3173d38737cd8ad955df85732c5897cd0dd975ea74ef', '[\"*\"]', '2025-05-19 01:01:41', NULL, '2025-05-19 01:01:36', '2025-05-19 01:01:41'),
(117, 'App\\Models\\User', 1, 'authToken', 'f2c9f436d69a6095e3844adadcb95c3811e766eb7c714d34e247ce8fc46dc631', '[\"*\"]', NULL, NULL, '2025-05-19 06:43:29', '2025-05-19 06:43:29'),
(118, 'App\\Models\\User', 1, 'authToken', 'e4a455ce3e5c510ccafe2db88880ed587dbb5afb477659b9ce41a923e4108b95', '[\"*\"]', '2025-05-19 06:43:47', NULL, '2025-05-19 06:43:33', '2025-05-19 06:43:47'),
(119, 'App\\Models\\User', 1, 'authToken', '1f280372c02137022ccb95765b1042c4e2f54153389b1175bf100883ffbde760', '[\"*\"]', '2025-05-19 18:37:18', NULL, '2025-05-19 18:36:06', '2025-05-19 18:37:18'),
(120, 'App\\Models\\User', 1, 'authToken', 'd3d39bf15d56450341cf0a55a9f1f9834e830c5774f0ae3412615bcf14c7e8ae', '[\"*\"]', NULL, NULL, '2025-05-19 21:06:00', '2025-05-19 21:06:00'),
(121, 'App\\Models\\User', 1, 'authToken', '7bd63dc3f9049bc81dd0e00518b86a3251f6fa3060d29a59e218249b3239d075', '[\"*\"]', '2025-05-19 21:08:01', NULL, '2025-05-19 21:06:03', '2025-05-19 21:08:01'),
(122, 'App\\Models\\User', 1, 'authToken', '5cef1de476dcf8b4ff06bec4eb20c3bc1e7a208a899f77a461626cde54ac102a', '[\"*\"]', '2025-05-19 21:12:27', NULL, '2025-05-19 21:09:04', '2025-05-19 21:12:27'),
(123, 'App\\Models\\User', 1, 'authToken', '5f793cccee80c61efcfe0f4260447a66f632cd8af6fe4dd3483ad5ee95310fbc', '[\"*\"]', NULL, NULL, '2025-05-24 21:48:48', '2025-05-24 21:48:48'),
(124, 'App\\Models\\User', 1, 'authToken', '44be6b2f6c2f979e66c040c9fc7abaf272d744657807291163a623c4525f85a6', '[\"*\"]', '2025-05-24 21:51:38', NULL, '2025-05-24 21:48:51', '2025-05-24 21:51:38'),
(125, 'App\\Models\\User', 2, 'authToken', 'cebecbf59733c5e3129831c0582a76ea56d15d10bce1ebc9b8c847eeebcbd935', '[\"*\"]', '2025-05-24 21:52:08', NULL, '2025-05-24 21:52:05', '2025-05-24 21:52:08'),
(126, 'App\\Models\\User', 2, 'authToken', '247a24da27dd973f4496f2a7c57d367e1676c36284050a8abf328ed5eca3d7a8', '[\"*\"]', '2025-05-24 21:58:51', NULL, '2025-05-24 21:52:07', '2025-05-24 21:58:51'),
(127, 'App\\Models\\User', 1, 'authToken', '24c4ed58443afe3804222578899607e5d4a388447e67b06dc1ce871962447524', '[\"*\"]', '2025-05-24 22:31:11', NULL, '2025-05-24 22:31:09', '2025-05-24 22:31:11'),
(128, 'App\\Models\\User', 1, 'authToken', '419fd20e3179f3b64d4dd6a3a5e7236b026484109a5c1d2f8e511749bcd6be88', '[\"*\"]', '2025-05-24 23:26:06', NULL, '2025-05-24 22:31:10', '2025-05-24 23:26:06'),
(129, 'App\\Models\\User', 1, 'authToken', 'db17fb47c2d017a6fc42eafc19e6dbf842aab56bc83d0a93427f2ce6f2d7d85e', '[\"*\"]', '2025-05-24 23:28:53', NULL, '2025-05-24 23:28:51', '2025-05-24 23:28:53'),
(130, 'App\\Models\\User', 1, 'authToken', '384b195fd69064cd4043e86d1f2ee426e04d388e966da7ecfe32a81f0b4e1007', '[\"*\"]', '2025-05-25 01:25:25', NULL, '2025-05-24 23:28:52', '2025-05-25 01:25:25'),
(131, 'App\\Models\\User', 3, 'authToken', '2cf675ccfbc7e4171f92e8ea9d9039be4549c4699703afd80b0d2a8505da8d8a', '[\"*\"]', '2025-05-25 01:46:50', NULL, '2025-05-25 01:26:04', '2025-05-25 01:46:50'),
(132, 'App\\Models\\User', 5, 'authToken', '8b1c0fee11b95a0ad93f21235bf8a0183ef43cc31de0a8830842d3e2653750e6', '[\"*\"]', '2025-05-25 01:49:00', NULL, '2025-05-25 01:47:05', '2025-05-25 01:49:00'),
(133, 'App\\Models\\User', 1, 'authToken', 'e0acbd1ec1e9805220d15a8b8532649cee8b3e2ad1fe5ba2dde4c24a91e1ee0e', '[\"*\"]', '2025-05-25 01:53:35', NULL, '2025-05-25 01:52:25', '2025-05-25 01:53:35'),
(134, 'App\\Models\\User', 3, 'authToken', 'a138f1596fd81969277c2da7813d9758c32c9c0ee00bb80f08f1439a17fa3b65', '[\"*\"]', '2025-05-25 01:53:49', NULL, '2025-05-25 01:53:45', '2025-05-25 01:53:49'),
(135, 'App\\Models\\User', 1, 'authToken', 'd0a70932685aa97082b4e85b25b13f33fe917fd364114e203628fac8e39679ae', '[\"*\"]', '2025-05-25 01:56:11', NULL, '2025-05-25 01:55:11', '2025-05-25 01:56:11'),
(136, 'App\\Models\\User', 3, 'authToken', 'ba55968c4f74340f16b9ff78bd6f43b78265bb94ea8562699175499318b69146', '[\"*\"]', '2025-05-25 01:57:16', NULL, '2025-05-25 01:57:12', '2025-05-25 01:57:16'),
(137, 'App\\Models\\User', 1, 'authToken', '034c2e2da432582147544b1694fcd6377849381d25090640c7e47b01be4c3260', '[\"*\"]', '2025-05-25 02:00:39', NULL, '2025-05-25 01:57:51', '2025-05-25 02:00:39'),
(138, 'App\\Models\\User', 3, 'authToken', '33fb336aa62b286ed8fa371b87ace393f6aa91b12ad05d17da54b9580b8efb92', '[\"*\"]', '2025-05-25 02:26:05', NULL, '2025-05-25 02:02:43', '2025-05-25 02:26:05'),
(139, 'App\\Models\\User', 1, 'authToken', 'e2c95b7735b2430bc2e9091d9b882943a8f801d83ad2e4a9854d9cf5bc035cef', '[\"*\"]', '2025-05-25 07:10:35', NULL, '2025-05-25 06:49:08', '2025-05-25 07:10:35'),
(140, 'App\\Models\\User', 1, 'authToken', '83e6da7455b6c67b181069c34fa219a34c92da44812e03f8f1a3c6f291d66992', '[\"*\"]', '2025-05-25 07:27:53', NULL, '2025-05-25 07:10:52', '2025-05-25 07:27:53'),
(141, 'App\\Models\\User', 3, 'authToken', 'fc46ae340c8822b35fd73997e28e2b7555dfaf0d9f64b70ca9974649f3b5d7ff', '[\"*\"]', '2025-05-25 07:32:16', NULL, '2025-05-25 07:29:11', '2025-05-25 07:32:16'),
(142, 'App\\Models\\User', 1, 'authToken', 'a7dc6b8d6c822b511fcbe40b4fc5d964654c070cbecd41bbe723b7f56ea32e14', '[\"*\"]', '2025-05-25 07:37:59', NULL, '2025-05-25 07:32:23', '2025-05-25 07:37:59'),
(143, 'App\\Models\\User', 1, 'authToken', '3401b3429eee8ed814368c1055b0df74a01a8749db3624c1b6794addabb9ca2f', '[\"*\"]', '2025-05-25 07:40:37', NULL, '2025-05-25 07:38:08', '2025-05-25 07:40:37'),
(144, 'App\\Models\\User', 1, 'authToken', '5d317e035b62141a99d71981721c12e0300372e6ed4a4f9d1d9124bd1a95e1a5', '[\"*\"]', '2025-05-25 07:51:56', NULL, '2025-05-25 07:40:41', '2025-05-25 07:51:56'),
(145, 'App\\Models\\User', 1, 'authToken', '07a1814f6982e53fe20a4818c8dba409b6e9c7699305339d769452e062d953db', '[\"*\"]', '2025-05-25 08:00:47', NULL, '2025-05-25 07:57:26', '2025-05-25 08:00:47'),
(146, 'App\\Models\\User', 1, 'authToken', '12ef92e8a71132d6f56b71b02c4061c9c6832775cb938be8d0018b43c99aab25', '[\"*\"]', '2025-05-25 08:03:06', NULL, '2025-05-25 08:03:02', '2025-05-25 08:03:06');

-- --------------------------------------------------------

--
-- Table structure for table `tausiyah`
--

CREATE TABLE `tausiyah` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `waktu` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tausiyah`
--

INSERT INTO `tausiyah` (`id`, `user_id`, `judul`, `isi`, `waktu`, `created_at`, `updated_at`) VALUES
(3, 1, 'Sirkel Pertemanan Seorang Muslim', 'Apa itu Sirkel?\nSirkel berasal dari kata dalam Bahasa Inggris circle yang secara bahasa artinya lingkaran. Lingkaran yang dimaksud dalam konteks ini adalah lingkaran/kelompok pertemanan atau pergaulan.\n\nPada umumnya sirkel pertemanan ini mula-mulanya luas, terlebih pada saat kita masih duduk di bangku sekolah. Kemudian secara tidak langsung perlahan akan menciut seiring dengan bertambahnya usia kita. Orang-orang yang masuk ke dalam sirkel pertemanan kita biasanya adalah orang-orang yang secara obrolan “nyambung” dengan kita (Ratna Lathifah, 2020).\n\nPengaruhnya Terhadap Kehidupan Kita\nSetelah kita ketahui makna sirkel, berikutnya kita cari tahu apa pengaruhnya sirkel pertemanan terhadap kehidupan kita?\n\nDiriwayatkan dari Abu Musa radhiyallahu ‘anhu, Nabi shallallahu ‘alaihi wa sallam bersabda,\n\nمَثَلُ الْجَلِيسِ الصَّالِحِ وَالْجَلِيسِ السَّوْءِ كَمَثَلِ صَاحِبِ الْمِسْكِ وَكِيرِ الْحَدَّادِ ، لاَ يَعْدَمُكَ مِنْ صَاحِبِ الْمِسْكِ إِمَّا تَشْتَرِيهِ أَوْ تَجِدُ رِيحَهُ ، وَكِيرُ الْحَدَّادِ يُحْرِقُ بَدَنَكَ أَوْ ثَوْبَكَ أَوْ تَجِدُ مِنْهُ رِيحًا خَبِيثَةً\n\n“Seseorang yang duduk (berteman) dengan orang shalih dan orang yang jelek bagaikan berteman dengan pemilik minyak wangi dan pandai besi. Pemilik minyak wangi tidak akan merugikanmu; engkau bisa membeli (minyak wangi) darinya atau minimal engkau mendapat baunya. Adapun berteman dengan pandai besi, jika engkau tidak mendapati badan atau pakaianmu hangus terbakar, minimal engkau mendapat baunya yang tidak enak.” (HR. Bukhari)\n\nHadits di atas menyebutkan bahwa teman yang baik (shalih) maupun teman teman yang jelek keduanya sama-sama memiliki pengaruh terhadap kehidupan kita.\n\nSetiap orang sedikit banyak dipengaruhi oleh sirkel pertemanannya karena seringnya berkumpul atau aktivitas bersama. Sirkel pertemanan—baik pada lingkungan kerja, pendidikan, komunitas, dan sebagainya—dapat berdampak pada individu baik dari cara pandang, selera, perubahan tingkah laku, dan gaya hidup (Pratiwi, 2020).\n\nHal tersebut selaras dengan hadits yang diriwayatkan oleh Abu Dawud,\n\nDari Abu Hurairah radhiyallahu ‘anhu, Rasulullah shallallahu ‘alaihi  wa sallam bersabda,\n\nالْمَرْءُ عَلَى دِينِ خَلِيلِهِ فَلْيَنْظُرْ أَحَدُكُمْ مَنْ يُخَالِلُ\n\n“Seseorang akan mencocoki kebiasaan teman karibnya. Oleh karenanya, perhatikanlah siapa yang akan menjadi teman karib kalian.” (HR. Abu Daud, Tirmidzi, dan Ahmad. Al-Hafizh Abu Thahir mengatakan bahwa sanad hadits ini shahih)\n\nMemilih Sirkel yang Lebih Baik\nPada dasarnya menjalin sebuah pertemanan merupakan sesuatu yang baik. Meninggalkan atau memutuskan tali pertemanan secara tiba-tiba merupakan hal yang tidak mudah, bahkan dapat mendatangkan mudharat, dan berujung pada permusuhan.\n\nAlih-alih memutuskan atau keluar dari sirkel pertemanan yang selama ini sudah terjalin, kita memiliki sebuah pilihan, yakni memasukkan orang-orang yang lebih baik ke dalam sirkel pertemanan kita.\n\nAda beberapa cara untuk memasukkan orang-orang yang baik/shaleh ke dalam sirkel pertemanan kita, salah satunya adalah dengan datang ke majelis ilmu.\n\nMajelis Ilmu\nMajelis ilmu merupakan tempat berkumpulnya orang-orang yang insya Allah memiliki tujuan yang sama, yakni: mencari ilmu, dan berusaha untuk memperbaiki diri.\n\nعَنْ أَنَسِ بْنِ مَالِكٍ رَضِي اللَّهُ عَنْهُ أَنَّ رَسُولَ اللَّهِ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ قَالَ إِذَا مَرَرْتُمْ بِرِيَاضِ الْجَنَّةِ فَارْتَعُوا قَالُوا وَمَا رِيَاضُ الْجَنَّةِ قَالَ حِلَقُ الذِّكْرِ\n\nDari Anas bin Malik Radhiyallahu ‘anhu, bahwa Rasulullah Shallallahu ‘alaihi wa sallam bersabda, ”Jika kamu melewati taman-taman surga, maka singgahlah dengan senang.” Para sahabat bertanya, ”Apakah taman-taman surga itu?” Beliau menjawab, ”Halaqah-halaqah (kelompok-kelompok) dzikir.” (HR. Tirmidzi)\n\nDengan datang dan bergabung ke dalam majelis ilmu minimalnya kita dapat bertemu dan berteman dengan orang baik, yang dapat mengingatkan kita tatkala kita berbuat salah—bukan yang membenarkan setiap kesalahan kita—agar kelak kita bisa menjadi seseorang yang lebih baik lagi. Terlebih di zaman di mana orang-orang sudah mulai banyak yang tidak peduli dengan batas halal dan haram dalam muamalah sehari-hari.\n\nSelain itu, kita juga dapat mengajak teman-teman yang lain untuk bergabung ke dalam majelis ilmu yang kita ikuti agar semakin banyak orang-orang baik yang berada di sirkel pertemanan kita. Teringat sebuah pepatah dalam bahasa arab,\n\nالصَّاحِبُ سَاحِبٌ\n\n“Yang namanya sahabat bisa menarik (memengaruhi).”\n\nOleh Miftah Afina, S.Kom.\n\nDaftar Pustaka\nBahraen, R. (2021). Apapun Keadaannya, Jangan Pernah Tinggalkan Majelis Ilmu. https://muslim.or.id/45155-apapun-keadaanya-jangan-pernah-tinggalkan-majelis-ilmu.html, diakses pada 24 Maret 2022\n\nLathifah, R. (2020). Titik-Titik Transformasi Dalam Hidup: A Self-Discovery Journey. Malang: Litera Media Tama\n\nPratiwi, B. F. N., & Dwijayanti, R. (2020). Pengaruh Gaya Hidup dan Kelompok Acuan Terhadap Keputusan Pembelian: Studi pada Konsumen Kedai Kopi Ruang Temu Kabupaten Tulungagung. Jurnal Pendidikan Tata Niaga (JPTN), 8(2), 1502. ISSN 2337-6078\n\nTuasikal, M. A. (2016). Manfaat Teman yang Baik. https://rumaysho.com/13311-manfaat-teman-yang-baik.html, diakses pada 24 Maret 2022', '2025-05-25 07:12:00', '2025-05-25 07:12:51', '2025-05-25 07:12:51');

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
(3, 'Ahmad', 'ahmad@gmail.com', '$2y$12$KPdAmvHs1IBiAIb5GpWEIe68WBgLN1w0jJtLzi/OqWo.ohuDNliG6', 'jamaah', '2025-04-26 01:39:44', '2025-04-26 01:39:44'),
(5, 'Budi', 'budi@gmail.com', '$2y$12$GvWdKQNOb2aFrPgvYQbBSOnJXXag8boZcYxETG.Ntup.C15SIAEo2', 'takmir', '2025-04-26 23:55:24', '2025-04-26 23:55:24');

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
-- Indexes for table `tausiyah`
--
ALTER TABLE `tausiyah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tausiyah_user_id_foreign` (`user_id`);

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `keuangan`
--
ALTER TABLE `keuangan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `laporan_keuangan`
--
ALTER TABLE `laporan_keuangan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `tausiyah`
--
ALTER TABLE `tausiyah`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tipe_keuangan`
--
ALTER TABLE `tipe_keuangan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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

--
-- Constraints for table `tausiyah`
--
ALTER TABLE `tausiyah`
  ADD CONSTRAINT `tausiyah_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
