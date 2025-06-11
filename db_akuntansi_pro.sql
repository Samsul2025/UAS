-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 11, 2025 at 11:05 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_akuntansi_pro`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounting_periods`
--

CREATE TABLE `accounting_periods` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_periode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_awal` date NOT NULL,
  `tanggal_akhir` date NOT NULL,
  `status` enum('Dibuka','Ditutup') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Dibuka',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounting_periods`
--

INSERT INTO `accounting_periods` (`id`, `nama_periode`, `tanggal_awal`, `tanggal_akhir`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Januari 2025', '2025-06-01', '2025-06-11', 'Ditutup', '2025-06-11 03:29:58', '2025-06-11 03:40:29');

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Aset','Kewajiban','Modal','Pendapatan','Beban') COLLATE utf8mb4_unicode_ci NOT NULL,
  `normal_balance` enum('Debit','Kredit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `code`, `name`, `type`, `normal_balance`, `created_at`, `updated_at`) VALUES
(1, '1.1.01', 'Kas', 'Aset', 'Debit', '2025-06-11 08:50:24', '2025-06-11 08:50:24'),
(2, '1.1.02', 'Bank', 'Aset', 'Debit', '2025-06-11 08:50:24', '2025-06-11 08:50:24'),
(3, '2.1.01', 'Utang Usaha', 'Kewajiban', 'Kredit', '2025-06-11 08:50:24', '2025-06-11 08:50:24'),
(4, '4.1.01', 'Penjualan', 'Pendapatan', 'Kredit', '2025-06-11 08:50:24', '2025-06-11 08:50:24'),
(5, '5.1.01', 'Beban Listrik', 'Beban', 'Debit', '2025-06-11 08:50:24', '2025-06-11 08:50:24'),
(6, '1.1.03', 'Piutang Usaha', 'Aset', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(7, '1.1.04', 'Persediaan Barang', 'Aset', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(8, '1.1.05', 'Perlengkapan Kantor', 'Aset', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(9, '1.1.06', 'Peralatan Kantor', 'Aset', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(10, '1.1.07', 'Akumulasi Penyusutan Peralatan', 'Aset', 'Kredit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(11, '2.1.02', 'Utang Bank', 'Kewajiban', 'Kredit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(12, '2.1.03', 'Utang Pajak', 'Kewajiban', 'Kredit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(13, '2.1.04', 'Utang Gaji', 'Kewajiban', 'Kredit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(14, '2.1.05', 'Pendapatan Diterima Dimuka', 'Kewajiban', 'Kredit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(15, '2.1.06', 'Utang Sewa', 'Kewajiban', 'Kredit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(16, '3.1.01', 'Modal Pemilik', 'Modal', 'Kredit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(17, '3.1.02', 'Prive', 'Modal', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(18, '3.1.03', 'Laba Ditahan', 'Modal', 'Kredit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(19, '3.1.04', 'Penyesuaian Modal', 'Modal', 'Kredit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(20, '3.1.05', 'Saldo Awal Modal', 'Modal', 'Kredit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(21, '4.1.02', 'Pendapatan Jasa', 'Pendapatan', 'Kredit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(22, '4.1.03', 'Diskon Penjualan', 'Pendapatan', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(23, '4.1.04', 'Pendapatan Sewa', 'Pendapatan', 'Kredit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(24, '4.1.05', 'Pendapatan Lain-lain', 'Pendapatan', 'Kredit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(25, '4.1.06', 'Pendapatan Bunga', 'Pendapatan', 'Kredit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(26, '5.1.02', 'Beban Gaji', 'Beban', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(27, '5.1.03', 'Beban Sewa', 'Beban', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(28, '5.1.04', 'Beban Air', 'Beban', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(29, '5.1.05', 'Beban Internet', 'Beban', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(30, '5.1.06', 'Beban ATK', 'Beban', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(31, '5.1.07', 'Beban Penyusutan', 'Beban', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(32, '5.1.08', 'Beban Perjalanan Dinas', 'Beban', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(33, '5.1.09', 'Beban Iklan', 'Beban', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(34, '5.1.10', 'Beban Konsultasi', 'Beban', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(35, '5.1.11', 'Beban Operasional Lainnya', 'Beban', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(36, '1.1.08', 'Investasi Jangka Pendek', 'Aset', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(37, '1.1.09', 'Piutang Karyawan', 'Aset', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(38, '1.1.10', 'Sewa Dibayar Dimuka', 'Aset', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(39, '1.1.11', 'Asuransi Dibayar Dimuka', 'Aset', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(40, '1.1.12', 'Pajak Dibayar Dimuka', 'Aset', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(41, '2.1.07', 'Utang Lain-lain', 'Kewajiban', 'Kredit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(42, '4.1.07', 'Pendapatan Komisi', 'Pendapatan', 'Kredit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(43, '5.1.12', 'Beban Komisi', 'Beban', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(44, '5.1.13', 'Beban Transportasi', 'Beban', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(45, '5.1.14', 'Beban Administrasi Bank', 'Beban', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(46, '5.1.15', 'Beban Asuransi', 'Beban', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(47, '5.1.16', 'Beban Penyusutan Kendaraan', 'Beban', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(48, '1.1.13', 'Kendaraan', 'Aset', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(49, '1.1.14', 'Bangunan', 'Aset', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(50, '1.1.15', 'Tanah', 'Aset', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(51, '4.1.08', 'Pendapatan Proyek', 'Pendapatan', 'Kredit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(52, '5.1.17', 'Beban Proyek', 'Beban', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(53, '3.1.06', 'Cadangan Modal', 'Modal', 'Kredit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(54, '5.1.18', 'Beban Pemeliharaan', 'Beban', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56'),
(55, '5.1.19', 'Beban Telepon', 'Beban', 'Debit', '2025-06-11 08:52:56', '2025-06-11 08:52:56');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cash_banks`
--

CREATE TABLE `cash_banks` (
  `id` bigint UNSIGNED NOT NULL,
  `tipe_transaksi` enum('Masuk','Keluar') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sumber` enum('Kas','Bank') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah` decimal(20,2) NOT NULL,
  `account_id` bigint UNSIGNED NOT NULL,
  `journal_entry_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_banks`
--

INSERT INTO `cash_banks` (`id`, `tipe_transaksi`, `sumber`, `tanggal`, `deskripsi`, `jumlah`, `account_id`, `journal_entry_id`, `created_at`, `updated_at`) VALUES
(1, 'Masuk', 'Kas', '2025-06-11', 'Masuk Kas 1', '5000.00', 8, 10, '2025-06-11 03:20:00', '2025-06-11 03:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `journal_details`
--

CREATE TABLE `journal_details` (
  `id` bigint UNSIGNED NOT NULL,
  `journal_entry_id` bigint UNSIGNED NOT NULL,
  `account_id` bigint UNSIGNED NOT NULL,
  `debit` decimal(15,2) NOT NULL DEFAULT '0.00',
  `credit` decimal(15,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `journal_details`
--

INSERT INTO `journal_details` (`id`, `journal_entry_id`, `account_id`, `debit`, `credit`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '1500000.00', '0.00', '2025-06-11 08:51:03', '2025-06-11 08:51:03'),
(2, 1, 4, '0.00', '1500000.00', '2025-06-11 08:51:03', '2025-06-11 08:51:03'),
(3, 2, 5, '250000.00', '0.00', '2025-06-11 08:51:03', '2025-06-11 08:51:03'),
(4, 2, 1, '0.00', '250000.00', '2025-06-11 08:51:03', '2025-06-11 08:51:03'),
(5, 3, 1, '1000000.00', '0.00', '2025-06-11 08:51:03', '2025-06-11 08:51:03'),
(6, 3, 2, '0.00', '1000000.00', '2025-06-11 08:51:03', '2025-06-11 08:51:03'),
(7, 4, 3, '250000.00', '0.00', '2025-06-11 08:51:03', '2025-06-11 08:51:03'),
(8, 4, 1, '0.00', '250000.00', '2025-06-11 08:51:03', '2025-06-11 08:51:03'),
(9, 5, 5, '150000.00', '0.00', '2025-06-11 08:51:03', '2025-06-11 08:51:03'),
(10, 5, 3, '0.00', '150000.00', '2025-06-11 08:51:03', '2025-06-11 08:51:03'),
(11, 7, 8, '50000.00', '0.00', '2025-06-11 01:56:30', '2025-06-11 01:56:30'),
(12, 7, 1, '0.00', '50000.00', '2025-06-11 01:56:30', '2025-06-11 01:56:30'),
(13, 8, 1, '66.00', '66.00', '2025-06-11 02:55:24', '2025-06-11 02:55:24'),
(14, 8, 6, '66.00', '66.00', '2025-06-11 02:55:24', '2025-06-11 02:55:24'),
(15, 9, 1, '3.00', '3.00', '2025-06-11 03:00:23', '2025-06-11 03:00:23'),
(16, 9, 2, '3.00', '3.00', '2025-06-11 03:00:23', '2025-06-11 03:00:23'),
(17, 10, 1, '5000.00', '0.00', '2025-06-11 03:20:00', '2025-06-11 03:20:00'),
(18, 10, 8, '0.00', '5000.00', '2025-06-11 03:20:00', '2025-06-11 03:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `journal_entries`
--

CREATE TABLE `journal_entries` (
  `id` bigint UNSIGNED NOT NULL,
  `transaction_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `type` enum('Umum','Penyesuaian','Penutup','Kas/Bank') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `journal_entries`
--

INSERT INTO `journal_entries` (`id`, `transaction_code`, `date`, `description`, `created_by`, `type`, `created_at`, `updated_at`) VALUES
(1, 'JU-001', '2025-06-01', 'Penjualan tunai', 1, 'Umum', '2025-06-11 08:50:32', '2025-06-11 08:50:32'),
(2, 'JU-002', '2025-06-02', 'Pembayaran beban listrik', 1, 'Umum', '2025-06-11 08:50:32', '2025-06-11 08:50:32'),
(3, 'JU-003', '2025-06-03', 'Penerimaan piutang dari pelanggan', 1, 'Umum', '2025-06-11 08:50:32', '2025-06-11 08:50:32'),
(4, 'JU-004', '2025-06-04', 'Pembayaran utang usaha', 1, 'Umum', '2025-06-11 08:50:32', '2025-06-11 08:50:32'),
(5, 'JU-005', '2025-06-05', 'Penyesuaian biaya listrik bulan berjalan', 1, 'Penyesuaian', '2025-06-11 08:50:32', '2025-06-11 08:50:32'),
(7, 'JU-1749632190', '2025-06-11', 'Pembelian Perlengkapan Kantor', 1, 'Umum', '2025-06-11 01:56:30', '2025-06-11 01:56:30'),
(8, 'JU-1749635724', '2025-06-11', '666', 1, 'Penyesuaian', '2025-06-11 02:55:24', '2025-06-11 02:55:24'),
(9, 'JU-1749636023', '2025-06-11', 'dfdf', 1, 'Penutup', '2025-06-11 03:00:23', '2025-06-11 03:00:23'),
(10, 'KB-1749637200', '2025-06-11', 'Masuk Kas 1', 1, 'Kas/Bank', '2025-06-11 03:20:00', '2025-06-11 03:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_06_04_071028_add_two_factor_columns_to_users_table', 1),
(5, '2025_06_04_071057_create_personal_access_tokens_table', 1),
(6, '2025_06_11_081803_create_table_accounts', 2),
(7, '2025_06_11_081929_create_table_journal_entries', 2),
(8, '2025_06_11_082021_create_table_journal_details', 2),
(9, '2025_06_11_101329_create_cash_banks_table', 3),
(10, '2025_06_11_102149_create_accounting_periods_table', 4),
(11, '2025_06_11_105510_create_units_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('5Ex7DX8mlmW2KTJ1bASbX5oju2IUQxEgSk30ERER', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoia0ZzVmc4VXI4dDlBbGlWWDh3ZWFvckFTTThyaDN2b2R6SEtrREVXSCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hY2NvdW50cyI7fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEyJGY2UENNS0NzakNEZldKTEV1NmVNTXVzMnRvTTdLeUhFaVFUUXhMUTVncno4dkJuTGhRRGRhIjt9', 1749639888);

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint UNSIGNED NOT NULL,
  `kode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `kode`, `nama`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'U001', 'Keuangan', 'Departemen pengelola keuangan kampus', '2025-06-11 11:00:16', '2025-06-11 11:00:16'),
(2, 'U002', 'Akademik', 'Mengelola urusan akademik dan kurikulum', '2025-06-11 11:00:16', '2025-06-11 11:00:16'),
(3, 'U003', 'Sumber Daya Manusia', 'Mengatur personil dan tenaga kerja', '2025-06-11 11:00:16', '2025-06-11 11:00:16'),
(4, 'U004', 'Pemasaran', 'Bertugas melakukan promosi institusi', '2025-06-11 11:00:16', '2025-06-11 11:00:16'),
(5, 'U005', 'Teknologi Informasi', 'Divisi pengembangan dan support IT', '2025-06-11 11:00:16', '2025-06-11 11:00:16'),
(6, 'U006', 'Perpustakaan', 'Unit pengelola sumber daya literasi', '2025-06-11 11:00:16', '2025-06-11 11:00:16'),
(7, 'U007', 'Penelitian dan Pengabdian', 'Mendukung kegiatan penelitian dosen', '2025-06-11 11:00:16', '2025-06-11 11:00:16'),
(8, 'U008', 'Laboratorium', 'Mendukung praktik mahasiswa', '2025-06-11 11:00:16', '2025-06-11 11:00:16'),
(9, 'U009', 'Bimbingan Konseling', 'Mendampingi mahasiswa terkait akademik dan pribadi', '2025-06-11 11:00:16', '2025-06-11 11:00:16'),
(10, 'U010', 'Kemahasiswaan', 'Mendukung kegiatan dan organisasi mahasiswa', '2025-06-11 11:00:16', '2025-06-11 11:00:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Herianto', 'herianto.sy@gmail.com', NULL, '$2y$12$f6PCMKCsjCDfWJLEu6eMMus2toM7KyHEiQTQxLQ5grz8vBnLhQDda', NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-11 01:33:21', '2025-06-11 01:33:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounting_periods`
--
ALTER TABLE `accounting_periods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_code_unique` (`code`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cash_banks`
--
ALTER TABLE `cash_banks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_banks_account_id_foreign` (`account_id`),
  ADD KEY `cash_banks_journal_entry_id_foreign` (`journal_entry_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journal_details`
--
ALTER TABLE `journal_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `journal_details_journal_entry_id_foreign` (`journal_entry_id`),
  ADD KEY `journal_details_account_id_foreign` (`account_id`);

--
-- Indexes for table `journal_entries`
--
ALTER TABLE `journal_entries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `journal_entries_transaction_code_unique` (`transaction_code`),
  ADD KEY `journal_entries_created_by_foreign` (`created_by`);

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
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `units_kode_unique` (`kode`);

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
-- AUTO_INCREMENT for table `accounting_periods`
--
ALTER TABLE `accounting_periods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `cash_banks`
--
ALTER TABLE `cash_banks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journal_details`
--
ALTER TABLE `journal_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `journal_entries`
--
ALTER TABLE `journal_entries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cash_banks`
--
ALTER TABLE `cash_banks`
  ADD CONSTRAINT `cash_banks_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `cash_banks_journal_entry_id_foreign` FOREIGN KEY (`journal_entry_id`) REFERENCES `journal_entries` (`id`);

--
-- Constraints for table `journal_details`
--
ALTER TABLE `journal_details`
  ADD CONSTRAINT `journal_details_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `journal_details_journal_entry_id_foreign` FOREIGN KEY (`journal_entry_id`) REFERENCES `journal_entries` (`id`);

--
-- Constraints for table `journal_entries`
--
ALTER TABLE `journal_entries`
  ADD CONSTRAINT `journal_entries_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
