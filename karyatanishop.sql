-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Des 2024 pada 08.01
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `karyatanishop`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `address`
--

CREATE TABLE `address` (
  `address_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `alamat` text NOT NULL,
  `kota` varchar(255) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `kecamatan` varchar(255) NOT NULL,
  `kelurahan` varchar(255) NOT NULL,
  `kode_pos` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `address`
--

INSERT INTO `address` (`address_id`, `user_id`, `alamat`, `kota`, `provinsi`, `kecamatan`, `kelurahan`, `kode_pos`, `created_at`, `updated_at`, `deleted_at`) VALUES
('992e6b4b-cc78-4eda-aac1-8cba3bb5de62', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'Jl. Cinambo', 'Bandung', 'Jawa Barat', 'Cinambo', 'Pakemitan', '40618', '2024-12-02 02:13:39', '2024-12-04 14:47:12', NULL),
('d1e4a628-1014-4ad1-be43-3fe3d59e479b', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'Jl. Merpati No. 20', 'Bandung', 'Jawa Barat', 'Cicendo', 'Pasir Kaliki', '40173', '2024-11-23 16:26:02', '2024-11-23 16:26:02', NULL),
('dc648b08-3a35-4fe5-9497-ad298469c6ca', 'ef4862e0-513a-4812-82ed-4904caa44b4f', 'Jalan Cibiru No. 123', 'Bandung', 'Jawa Barat', 'Cibiru', 'Pasirbiru', '40294', '2024-11-24 13:49:40', '2024-11-24 13:49:40', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('karyatanishop_cachespatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:54:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:12:\"roles.manage\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:1:{i:0;i:3;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:10:\"roles.view\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:1:{i:0;i:3;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:9:\"role-list\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:1:{i:0;i:3;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:11:\"role-create\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:1:{i:0;i:3;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:9:\"role-edit\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:1:{i:0;i:3;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:11:\"role-delete\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:1:{i:0;i:3;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:9:\"user-list\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:1:{i:0;i:3;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:11:\"user-create\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:1:{i:0;i:3;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:9:\"user-edit\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:1:{i:0;i:3;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:11:\"user-delete\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:1:{i:0;i:3;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:12:\"users.manage\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:1:{i:0;i:3;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:20:\"role-add-permissions\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:1:{i:0;i:3;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:12:\"log-activity\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:1:{i:0;i:3;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:13:\"kategori-list\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:13:\"kategori-show\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:15:\"kategori-create\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:1:{i:0;i:3;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:13:\"kategori-edit\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:1:{i:0;i:3;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:15:\"kategori-delete\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:1:{i:0;i:3;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:10:\"promo-list\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:10:\"promo-show\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:12:\"promo-create\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:1:{i:0;i:3;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:10:\"promo-edit\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:1:{i:0;i:3;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:12:\"promo-delete\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:1:{i:0;i:3;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:11:\"produk-list\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:11:\"produk-show\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:13:\"produk-create\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:1:{i:0;i:3;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:11:\"produk-edit\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:1:{i:0;i:3;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:13:\"produk-delete\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:1:{i:0;i:3;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:9:\"cart-list\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:8:\"cart-add\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:9:\"cart-edit\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:11:\"cart-delete\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:10:\"order-list\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:10:\"order-show\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:12:\"order-create\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:10:\"order-edit\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:12:\"order-delete\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:37;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:14:\"transaksi-list\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:38;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:14:\"transaksi-show\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:39;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:14:\"transaksi-edit\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:40;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:13:\"review-create\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:41;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:11:\"review-list\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:42;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:11:\"review-show\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:43;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:11:\"review-edit\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:44;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:13:\"review-delete\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:45;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:18:\"notifications-list\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:46;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:23:\"notifications-markasred\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:47;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:20:\"notifications-create\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:1:{i:0;i:3;}}i:48;a:4:{s:1:\"a\";i:49;s:1:\"b\";s:13:\"report-filter\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:1:{i:0;i:3;}}i:49;a:4:{s:1:\"a\";i:50;s:1:\"b\";s:11:\"report-list\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:1:{i:0;i:3;}}i:50;a:4:{s:1:\"a\";i:51;s:1:\"b\";s:12:\"profile-edit\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:51;a:4:{s:1:\"a\";i:52;s:1:\"b\";s:12:\"profile-show\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:52;a:4:{s:1:\"a\";i:53;s:1:\"b\";s:12:\"address-show\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:53;a:4:{s:1:\"a\";i:54;s:1:\"b\";s:12:\"address-edit\";s:1:\"c\";s:3:\"api\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}}s:5:\"roles\";a:3:{i:0;a:3:{s:1:\"a\";i:3;s:1:\"b\";s:5:\"admin\";s:1:\"c\";s:3:\"api\";}i:1;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:5:\"kasir\";s:1:\"c\";s:3:\"api\";}i:2;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:8:\"customer\";s:1:\"c\";s:3:\"api\";}}}', 1734144845);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `province_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cities`
--

INSERT INTO `cities` (`id`, `province_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 11, 'Banda Aceh', NULL, NULL),
(2, 11, 'Langsa', NULL, NULL),
(3, 11, 'Lhokseumawe', NULL, NULL),
(4, 12, 'Medan', NULL, NULL),
(5, 12, 'Binjai', NULL, NULL),
(6, 13, 'Padang', NULL, NULL),
(7, 13, 'Bukittinggi', NULL, NULL),
(8, 14, 'Pekanbaru', NULL, NULL),
(9, 14, 'Dumai', NULL, NULL),
(10, 15, 'Jambi', NULL, NULL),
(11, 15, 'Sungai Penuh', NULL, NULL),
(12, 16, 'Palembang', NULL, NULL),
(13, 16, 'Prabumulih', NULL, NULL),
(14, 17, 'Bengkulu', NULL, NULL),
(15, 18, 'Bandar Lampung', NULL, NULL),
(16, 18, 'Metro', NULL, NULL),
(17, 19, 'Pangkal Pinang', NULL, NULL),
(18, 19, 'Bangka', NULL, NULL),
(19, 21, 'Tanjung Pinang', NULL, NULL),
(20, 21, 'Batam', NULL, NULL),
(21, 31, 'Jakarta Pusat', NULL, NULL),
(22, 31, 'Jakarta Selatan', NULL, NULL),
(23, 31, 'Jakarta Barat', NULL, NULL),
(24, 32, 'Bandung', NULL, NULL),
(25, 32, 'Bogor', NULL, NULL),
(26, 32, 'Bekasi', NULL, NULL),
(27, 33, 'Semarang', NULL, NULL),
(28, 33, 'Surakarta (Solo)', NULL, NULL),
(29, 33, 'Salatiga', NULL, NULL),
(30, 34, 'Yogyakarta', NULL, NULL),
(31, 34, 'Sleman', NULL, NULL),
(32, 35, 'Surabaya', NULL, NULL),
(33, 35, 'Malang', NULL, NULL),
(34, 35, 'Batu', NULL, NULL),
(35, 36, 'Serang', NULL, NULL),
(36, 36, 'Tangerang', NULL, NULL),
(37, 36, 'Cilegon', NULL, NULL),
(38, 51, 'Denpasar', NULL, NULL),
(39, 51, 'Badung', NULL, NULL),
(40, 51, 'Gianyar', NULL, NULL),
(41, 52, 'Mataram', NULL, NULL),
(42, 52, 'Lombok Barat', NULL, NULL),
(43, 53, 'Kupang', NULL, NULL),
(44, 53, 'Ruteng', NULL, NULL),
(45, 61, 'Pontianak', NULL, NULL),
(46, 61, 'Singkawang', NULL, NULL),
(47, 62, 'Palangka Raya', NULL, NULL),
(48, 62, 'Sampit', NULL, NULL),
(49, 63, 'Banjarmasin', NULL, NULL),
(50, 63, 'Banjarbaru', NULL, NULL),
(51, 64, 'Samarinda', NULL, NULL),
(52, 64, 'Balikpapan', NULL, NULL),
(53, 65, 'Tanjung Selor', NULL, NULL),
(54, 71, 'Manado', NULL, NULL),
(55, 71, 'Tomohon', NULL, NULL),
(56, 72, 'Palu', NULL, NULL),
(57, 72, 'Donggala', NULL, NULL),
(58, 73, 'Makassar', NULL, NULL),
(59, 73, 'Palopo', NULL, NULL),
(60, 74, 'Kendari', NULL, NULL),
(61, 74, 'Baubau', NULL, NULL),
(62, 75, 'Gorontalo', NULL, NULL),
(63, 75, 'Boalemo', NULL, NULL),
(64, 76, 'Mamuju', NULL, NULL),
(65, 81, 'Ambon', NULL, NULL),
(66, 81, 'Tual', NULL, NULL),
(67, 82, 'Ternate', NULL, NULL),
(68, 82, 'Tidore Kepulauan', NULL, NULL),
(69, 91, 'Jayapura', NULL, NULL),
(70, 91, 'Merauke', NULL, NULL),
(71, 92, 'Manokwari', NULL, NULL),
(72, 92, 'Sorong', NULL, NULL),
(73, 93, 'Merauke', NULL, NULL),
(74, 94, 'Paniai', NULL, NULL),
(75, 95, 'Wamena', NULL, NULL),
(76, 96, 'Kaimana', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_order`
--

CREATE TABLE `detail_order` (
  `detail_order_id` char(36) NOT NULL,
  `order_id` char(36) NOT NULL,
  `produk_id` char(36) NOT NULL,
  `kuantitas` int(11) NOT NULL,
  `harga_satuan` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `districts`
--

CREATE TABLE `districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `districts`
--

INSERT INTO `districts` (`id`, `city_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Baiturrahman', NULL, NULL),
(2, 1, 'Meuraxa', NULL, NULL),
(3, 1, 'Kuta Alam', NULL, NULL),
(4, 2, 'Langsa Barat', NULL, NULL),
(5, 2, 'Langsa Kota', NULL, NULL),
(6, 2, 'Langsa Timur', NULL, NULL),
(7, 3, 'Blang Mangat', NULL, NULL),
(8, 3, 'Muara Satu', NULL, NULL),
(9, 3, 'Seunuddon', NULL, NULL),
(10, 3, 'Simpang Kiri', NULL, NULL),
(11, 4, 'Medan Kota', NULL, NULL),
(12, 4, 'Medan Timur', NULL, NULL),
(13, 4, 'Medan Johor', NULL, NULL),
(14, 4, 'Medan Sunggal', NULL, NULL),
(15, 4, 'Medan Helvetia', NULL, NULL),
(16, 5, 'Binjai Barat', NULL, NULL),
(17, 5, 'Binjai Kota', NULL, NULL),
(18, 5, 'Binjai Timur', NULL, NULL),
(19, 6, 'Kuranji', NULL, NULL),
(20, 6, 'Lubuk Begalung', NULL, NULL),
(21, 6, 'Padang Utara', NULL, NULL),
(22, 6, 'Padang Barat', NULL, NULL),
(23, 7, 'Aur Birugo Tigo Baleh', NULL, NULL),
(24, 7, 'Mandiangin Koto Selayan', NULL, NULL),
(25, 7, 'Guguk Panjang', NULL, NULL),
(26, 8, 'Marpoyan Damai', NULL, NULL),
(27, 8, 'Rumbai', NULL, NULL),
(28, 8, 'Senapelan', NULL, NULL),
(29, 8, 'Sail', NULL, NULL),
(30, 8, 'Bukit Raya', NULL, NULL),
(31, 9, 'Dumai Barat', NULL, NULL),
(32, 9, 'Dumai Timur', NULL, NULL),
(33, 9, 'Dumai Selatan', NULL, NULL),
(34, 10, 'Pelayangan', NULL, NULL),
(35, 10, 'Danau Sipin', NULL, NULL),
(36, 10, 'Jambi Selatan', NULL, NULL),
(37, 10, 'Jambi Timur', NULL, NULL),
(38, 11, 'Sungai Penuh', NULL, NULL),
(39, 11, 'Kota Sungaipenuh', NULL, NULL),
(40, 11, 'Pesisir', NULL, NULL),
(41, 12, 'Kertapati', NULL, NULL),
(42, 12, 'Ilir Barat', NULL, NULL),
(43, 12, 'Ilir Timur', NULL, NULL),
(44, 12, 'Sukarami', NULL, NULL),
(45, 12, 'Kemuning', NULL, NULL),
(46, 13, 'Prabumulih Timur', NULL, NULL),
(47, 13, 'Prabumulih Barat', NULL, NULL),
(48, 14, 'Muara Bangkahulu', NULL, NULL),
(49, 14, 'Sumber Jaya', NULL, NULL),
(50, 14, 'Gading Cempaka', NULL, NULL),
(51, 15, 'Tanjung Karang Barat', NULL, NULL),
(52, 15, 'Tanjung Karang Timur', NULL, NULL),
(53, 15, 'Kedaton', NULL, NULL),
(54, 15, 'Way Halim', NULL, NULL),
(55, 16, 'Metro Pusat', NULL, NULL),
(56, 16, 'Metro Barat', NULL, NULL),
(57, 16, 'Metro Timur', NULL, NULL),
(58, 17, 'Rangkui', NULL, NULL),
(59, 17, 'Bukit Intan', NULL, NULL),
(60, 17, 'Taman Sari', NULL, NULL),
(61, 18, 'Sungailiat', NULL, NULL),
(62, 18, 'Merawang', NULL, NULL),
(63, 18, 'Pemali', NULL, NULL),
(64, 19, 'Tanjung Pinang Barat', NULL, NULL),
(65, 19, 'Tanjung Pinang Timur', NULL, NULL),
(66, 20, 'Batam Kota', NULL, NULL),
(67, 20, 'Sekupang', NULL, NULL),
(68, 20, 'Batu Aji', NULL, NULL),
(69, 21, 'Gambir', NULL, NULL),
(70, 21, 'Menteng', NULL, NULL),
(71, 21, 'Tanah Abang', NULL, NULL),
(72, 21, 'Senen', NULL, NULL),
(73, 21, 'Cempaka Putih', NULL, NULL),
(74, 22, 'Cilandak', NULL, NULL),
(75, 22, 'Kebayoran Baru', NULL, NULL),
(76, 22, 'Mampang Prapatan', NULL, NULL),
(77, 22, 'Pancoran', NULL, NULL),
(78, 22, 'Jagakarsa', NULL, NULL),
(79, 23, 'Kebon Jeruk', NULL, NULL),
(80, 23, 'Grogol Petamburan', NULL, NULL),
(81, 23, 'Palmerah', NULL, NULL),
(82, 23, 'Taman Sari', NULL, NULL),
(83, 24, 'Cicendo', NULL, NULL),
(84, 24, 'Coblong', NULL, NULL),
(85, 24, 'Lengkong', NULL, NULL),
(86, 24, 'Regol', NULL, NULL),
(87, 24, 'Bojongsoang', NULL, NULL),
(88, 25, 'Bogor Utara', NULL, NULL),
(89, 25, 'Bogor Timur', NULL, NULL),
(90, 25, 'Bogor Selatan', NULL, NULL),
(91, 25, 'Tanah Sareal', NULL, NULL),
(92, 26, 'Bekasi Selatan', NULL, NULL),
(93, 26, 'Bekasi Timur', NULL, NULL),
(94, 26, 'Bekasi Utara', NULL, NULL),
(95, 26, 'Medan Satria', NULL, NULL),
(96, 27, 'Semarang Barat', NULL, NULL),
(97, 27, 'Semarang Selatan', NULL, NULL),
(98, 27, 'Semarang Timur', NULL, NULL),
(99, 27, 'Semarang Utara', NULL, NULL),
(100, 28, 'Laweyan', NULL, NULL),
(101, 28, 'Banjarsari', NULL, NULL),
(102, 28, 'Serengan', NULL, NULL),
(103, 28, 'Pasar Kliwon', NULL, NULL),
(104, 29, 'Sidorejo', NULL, NULL),
(105, 29, 'Argomulyo', NULL, NULL),
(106, 29, 'Tingkir', NULL, NULL),
(107, 30, 'Mantrijeron', NULL, NULL),
(108, 30, 'Ngampilan', NULL, NULL),
(109, 30, 'Danurejan', NULL, NULL),
(110, 30, 'Kraton', NULL, NULL),
(111, 30, 'Gondomanan', NULL, NULL),
(112, 31, 'Ngaglik', NULL, NULL),
(113, 31, 'Turi', NULL, NULL),
(114, 31, 'Minggir', NULL, NULL),
(115, 31, 'Seyegan', NULL, NULL),
(116, 31, 'Prambanan', NULL, NULL),
(117, 32, 'Gubeng', NULL, NULL),
(118, 32, 'Wonokromo', NULL, NULL),
(119, 32, 'Tegalsari', NULL, NULL),
(120, 32, 'Rungkut', NULL, NULL),
(121, 32, 'Mulyorejo', NULL, NULL),
(122, 33, 'Klojen', NULL, NULL),
(123, 33, 'Lowokwaru', NULL, NULL),
(124, 33, 'Sukun', NULL, NULL),
(125, 33, 'Blimbing', NULL, NULL),
(126, 34, 'Batu', NULL, NULL),
(127, 34, 'Junrejo', NULL, NULL),
(128, 34, 'Batu Selatan', NULL, NULL),
(129, 35, 'Serang Kota', NULL, NULL),
(130, 35, 'Cipocok Jaya', NULL, NULL),
(131, 35, 'Kasemen', NULL, NULL),
(132, 35, 'Curug', NULL, NULL),
(133, 36, 'Cikupa', NULL, NULL),
(134, 36, 'Balaraja', NULL, NULL),
(135, 36, 'Curug', NULL, NULL),
(136, 36, 'Panongan', NULL, NULL),
(137, 36, 'Tigaraksa', NULL, NULL),
(138, 37, 'Cilegon Barat', NULL, NULL),
(139, 37, 'Cilegon Timur', NULL, NULL),
(140, 37, 'Ciwandan', NULL, NULL),
(141, 38, 'Denpasar Barat', NULL, NULL),
(142, 38, 'Denpasar Selatan', NULL, NULL),
(143, 38, 'Denpasar Utara', NULL, NULL),
(144, 38, 'Denpasar Timur', NULL, NULL),
(145, 39, 'Kuta', NULL, NULL),
(146, 39, 'Seminyak', NULL, NULL),
(147, 39, 'Mengwi', NULL, NULL),
(148, 39, 'Petang', NULL, NULL),
(149, 40, 'Ubud', NULL, NULL),
(150, 40, 'Sukawati', NULL, NULL),
(151, 40, 'Gianyar', NULL, NULL),
(152, 40, 'Blahbatuh', NULL, NULL),
(153, 41, 'Ampenan', NULL, NULL),
(154, 41, 'Cakranegara', NULL, NULL),
(155, 41, 'Sekarbela', NULL, NULL),
(156, 41, 'Sandubaya', NULL, NULL),
(157, 42, 'Gerung', NULL, NULL),
(158, 42, 'Sekotong', NULL, NULL),
(159, 42, 'Narmada', NULL, NULL),
(160, 42, 'Lingsar', NULL, NULL),
(161, 43, 'Kota Kupang', NULL, NULL),
(162, 43, 'Kelapa Lima', NULL, NULL),
(163, 43, 'Alak', NULL, NULL),
(164, 43, 'Kota Raja', NULL, NULL),
(165, 44, 'Ruteng', NULL, NULL),
(166, 44, 'Cibal', NULL, NULL),
(167, 44, 'Cibal Barat', NULL, NULL),
(168, 45, 'Pontianak Selatan', NULL, NULL),
(169, 45, 'Pontianak Barat', NULL, NULL),
(170, 45, 'Pontianak Timur', NULL, NULL),
(171, 45, 'Pontianak Utara', NULL, NULL),
(172, 46, 'Singkawang Barat', NULL, NULL),
(173, 46, 'Singkawang Tengah', NULL, NULL),
(174, 46, 'Singkawang Selatan', NULL, NULL),
(175, 47, 'Pahandut', NULL, NULL),
(176, 47, 'Bukit Batu', NULL, NULL),
(177, 47, 'Sebangau', NULL, NULL),
(178, 48, 'Mentawa Baru', NULL, NULL),
(179, 48, 'Seranau', NULL, NULL),
(180, 48, 'Sampit Kota', NULL, NULL),
(181, 49, 'Banjarmasin Tengah', NULL, NULL),
(182, 49, 'Banjarmasin Timur', NULL, NULL),
(183, 49, 'Banjarmasin Selatan', NULL, NULL),
(184, 49, 'Banjarmasin Utara', NULL, NULL),
(185, 50, 'Banjarbaru Selatan', NULL, NULL),
(186, 50, 'Banjarbaru Utara', NULL, NULL),
(187, 50, 'Cempaka', NULL, NULL),
(188, 51, 'Samarinda Utara', NULL, NULL),
(189, 51, 'Samarinda Ilir', NULL, NULL),
(190, 51, 'Samarinda Seberang', NULL, NULL),
(191, 51, 'Samarinda Kota', NULL, NULL),
(192, 52, 'Balikpapan Barat', NULL, NULL),
(193, 52, 'Balikpapan Timur', NULL, NULL),
(194, 52, 'Balikpapan Selatan', NULL, NULL),
(195, 52, 'Balikpapan Utara', NULL, NULL),
(196, 53, 'Tanjung Selor Kota', NULL, NULL),
(197, 53, 'Tanjung Palas', NULL, NULL),
(198, 54, 'Sario', NULL, NULL),
(199, 54, 'Wanea', NULL, NULL),
(200, 54, 'Paal Dua', NULL, NULL),
(201, 54, 'Malalayang', NULL, NULL),
(202, 55, 'Tomohon Selatan', NULL, NULL),
(203, 55, 'Tomohon Tengah', NULL, NULL),
(204, 55, 'Tomohon Utara', NULL, NULL),
(205, 56, 'Palu Selatan', NULL, NULL),
(206, 56, 'Palu Barat', NULL, NULL),
(207, 56, 'Palu Utara', NULL, NULL),
(208, 56, 'Palu Timur', NULL, NULL),
(209, 57, 'Donggala Barat', NULL, NULL),
(210, 57, 'Donggala Utara', NULL, NULL),
(211, 57, 'Donggala Tengah', NULL, NULL),
(212, 58, 'Tamalanrea', NULL, NULL),
(213, 58, 'Biringkanaya', NULL, NULL),
(214, 58, 'Manggala', NULL, NULL),
(215, 58, 'Ujung Pandang', NULL, NULL),
(216, 59, 'Palopo Kota', NULL, NULL),
(217, 59, 'Telluwanua', NULL, NULL),
(218, 59, 'Baturi', NULL, NULL),
(219, 60, 'Kendari Barat', NULL, NULL),
(220, 60, 'Kendari Selatan', NULL, NULL),
(221, 60, 'Kendari Utara', NULL, NULL),
(222, 60, 'Kendari Timur', NULL, NULL),
(223, 61, 'Baubau Kota', NULL, NULL),
(224, 61, 'Betoambari', NULL, NULL),
(225, 61, 'Kokalukuna', NULL, NULL),
(226, 62, 'Gorontalo Kota', NULL, NULL),
(227, 62, 'Dumbo Raya', NULL, NULL),
(228, 62, 'Gorontalo Utara', NULL, NULL),
(229, 63, 'Boalemo Kota', NULL, NULL),
(230, 63, 'Kwandang', NULL, NULL),
(231, 64, 'Mamuju Kota', NULL, NULL),
(232, 64, 'Mamuju Utara', NULL, NULL),
(233, 64, 'Mamuju Selatan', NULL, NULL),
(234, 65, 'Ambon Kota', NULL, NULL),
(235, 65, 'Sirimau', NULL, NULL),
(236, 65, 'Baguala', NULL, NULL),
(237, 66, 'Tual Kota', NULL, NULL),
(238, 66, 'Dullah Selatan', NULL, NULL),
(239, 67, 'Ternate Selatan', NULL, NULL),
(240, 67, 'Ternate Utara', NULL, NULL),
(241, 67, 'Ternate Tengah', NULL, NULL),
(242, 68, 'Tidore', NULL, NULL),
(243, 68, 'Tidore Selatan', NULL, NULL),
(244, 68, 'Tidore Utara', NULL, NULL),
(245, 69, 'Jayapura Kota', NULL, NULL),
(246, 69, 'Abepura', NULL, NULL),
(247, 69, 'Heram', NULL, NULL),
(248, 70, 'Merauke Kota', NULL, NULL),
(249, 70, 'Tanah Miring', NULL, NULL),
(250, 70, 'Kurik', NULL, NULL),
(251, 71, 'Manokwari Kota', NULL, NULL),
(252, 71, 'Prafi', NULL, NULL),
(253, 71, 'Darmaga', NULL, NULL),
(254, 72, 'Sorong Kota', NULL, NULL),
(255, 72, 'Sorong Selatan', NULL, NULL),
(256, 72, 'Sorong Utara', NULL, NULL),
(257, 70, 'Merauke Kota', NULL, NULL),
(258, 70, 'Tanah Miring', NULL, NULL),
(259, 70, 'Kurik', NULL, NULL),
(260, 74, 'Paniai Kota', NULL, NULL),
(261, 74, 'Mamberamo Tengah', NULL, NULL),
(262, 75, 'Wamena Kota', NULL, NULL),
(263, 75, 'Asmat', NULL, NULL),
(264, 75, 'Lanny Jaya', NULL, NULL),
(265, 76, 'Kaimana Kota', NULL, NULL),
(266, 76, 'Yoboi', NULL, NULL),
(267, 76, 'Fakfak', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `item_keranjang`
--

CREATE TABLE `item_keranjang` (
  `item_keranjang_id` char(36) NOT NULL,
  `keranjang_id` char(36) NOT NULL,
  `produk_id` char(36) NOT NULL,
  `kuantitas` int(11) NOT NULL DEFAULT 1,
  `harga_satuan` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `item_keranjang`
--

INSERT INTO `item_keranjang` (`item_keranjang_id`, `keranjang_id`, `produk_id`, `kuantitas`, `harga_satuan`, `subtotal`, `created_at`, `updated_at`, `order_id`) VALUES
('1de9f747-6dc1-4164-8da9-62d58caa04f8', 'ee3802f0-2046-4dfc-95a5-af8a184267dd', '29398d11-f66e-4378-9a31-d91c46966533', 4, 7950.00, 31800.00, '2024-12-04 14:32:07', '2024-12-12 07:19:47', '41fcc9ea-d9a8-4a2c-b22a-e607827f6138'),
('241a220a-54ce-4f33-9a83-4f1d9901c9a0', 'ee3802f0-2046-4dfc-95a5-af8a184267dd', '326d3a50-6212-40d2-9453-d775a0ae700d', 1, 9.00, 9.00, '2024-12-05 15:34:36', '2024-12-12 07:19:15', '41fcc9ea-d9a8-4a2c-b22a-e607827f6138'),
('63259571-42e2-434f-ad00-79b15c40bb53', 'ee3802f0-2046-4dfc-95a5-af8a184267dd', '7a6a6dcb-353c-4584-b094-0279683845e2', 1, 1000.00, 1000.00, '2024-12-12 07:21:40', '2024-12-12 07:22:26', '2e869a2d-57ac-4261-acf4-498f6ab68e12'),
('6fe06e23-0730-420f-9bfc-22afc27e9582', '2f825192-6379-42a9-9091-d72c3906130f', '66c620bb-0ae1-4b30-805f-185e4462555a', 3, 500000.00, 1500000.00, '2024-11-23 04:29:30', '2024-12-03 09:16:57', '949efe37-6c57-4556-9172-09d89764697c'),
('78d22275-1078-4e56-a496-5a777a9386bf', 'cd5a23b4-ac48-4bf5-8805-14f7add450b0', 'b224556e-6a44-4dfa-8cad-63ff1616a95f', 2, 1.00, 2.00, '2024-11-24 08:22:31', '2024-11-24 08:22:31', NULL),
('f45a44f2-1a69-417f-a37a-e993f1be31f3', 'ee3802f0-2046-4dfc-95a5-af8a184267dd', '3d45030b-f21a-4e73-ac7d-a79da613a356', 1, 9.00, 9.00, '2024-11-28 07:23:30', '2024-12-12 07:19:57', '5b6580a0-cb0c-4a15-9854-521040b3a717');

-- --------------------------------------------------------

--
-- Struktur dari tabel `item_keranjang_offline`
--

CREATE TABLE `item_keranjang_offline` (
  `item_keranjang_offline_id` char(36) NOT NULL,
  `keranjang_offline_id` char(36) NOT NULL,
  `produk_id` char(36) NOT NULL,
  `kuantitas` int(11) NOT NULL DEFAULT 1,
  `harga_satuan` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `item_keranjang_offline`
--

INSERT INTO `item_keranjang_offline` (`item_keranjang_offline_id`, `keranjang_offline_id`, `produk_id`, `kuantitas`, `harga_satuan`, `subtotal`, `created_at`, `updated_at`) VALUES
('0d298f67-e43f-4705-9a1e-f5824e1faa5f', '99658ffe-a5ef-42b8-af93-d16cbf7f1fd2', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-12-03 08:30:51', '2024-12-03 08:30:51'),
('4a3628cf-4d37-46b3-ba2a-9ca41bf9b36f', '99658ffe-a5ef-42b8-af93-d16cbf7f1fd2', '326d3a50-6212-40d2-9453-d775a0ae700d', 1, 9.00, 9.00, '2024-12-03 09:24:14', '2024-12-03 09:24:14'),
('7ca43db7-ab51-468a-bdf6-648a4e0461cf', '13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-12-03 14:53:46', '2024-12-03 14:53:46'),
('7d109068-6ec0-403b-9a12-5a28058ca7ac', '13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-12-04 13:56:55', '2024-12-04 13:56:55'),
('a09e63bc-a73b-4be1-9b7f-9885bb357e3e', '13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-12-04 13:00:24', '2024-12-04 13:00:24'),
('ad3e7a96-bce0-4a55-a84b-6519b93c1679', '13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', 'b224556e-6a44-4dfa-8cad-63ff1616a95f', 1, 0.00, 0.00, '2024-12-03 15:26:00', '2024-12-03 15:26:00'),
('b05eddae-f586-4598-bd8b-54950485294c', '99658ffe-a5ef-42b8-af93-d16cbf7f1fd2', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-12-03 09:28:47', '2024-12-03 09:28:47'),
('b0bf2866-a4cb-4e70-b9f8-8afc73d2d225', '13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-12-03 14:42:44', '2024-12-03 14:42:44'),
('c06b4710-6eb8-4817-ac49-38c42903edd6', '13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-12-03 14:53:48', '2024-12-03 14:53:48'),
('c9d2cc77-f5d9-4d0c-a478-6ef5018fd212', '13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', 'b224556e-6a44-4dfa-8cad-63ff1616a95f', 1, 0.00, 0.00, '2024-12-03 15:05:48', '2024-12-03 15:05:48'),
('ce2c2c8c-c45a-45e6-9787-8a9b71916d99', '99658ffe-a5ef-42b8-af93-d16cbf7f1fd2', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-12-03 09:21:18', '2024-12-03 09:21:18'),
('d6e25df6-5947-4f9a-bc12-c737f5b5738b', '13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', '326d3a50-6212-40d2-9453-d775a0ae700d', 1, 9.00, 9.00, '2024-12-03 09:51:15', '2024-12-03 09:51:15'),
('e27fbfe4-2d28-4678-beee-bc3a6e622e0d', '13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', 'c370eb78-577a-4b78-adfc-4ce01be4718b', 1, 7950.00, 7950.00, '2024-12-03 14:43:04', '2024-12-03 14:43:04'),
('ed32eb67-8a78-40c5-ad3c-ece12074a106', '13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-12-04 13:24:37', '2024-12-04 13:24:37'),
('fb379c79-331f-447f-9099-bfd6091d422b', '99658ffe-a5ef-42b8-af93-d16cbf7f1fd2', '29398d11-f66e-4378-9a31-d91c46966533', 1, 50000.00, 50000.00, '2024-12-03 09:18:03', '2024-12-03 09:18:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `item_nota_belanja`
--

CREATE TABLE `item_nota_belanja` (
  `item_nota_belanja_id` char(36) NOT NULL,
  `nota_belanja_id` char(36) NOT NULL,
  `produk_id` char(36) NOT NULL,
  `kuantitas` int(11) NOT NULL,
  `harga_satuan` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `item_nota_belanja`
--

INSERT INTO `item_nota_belanja` (`item_nota_belanja_id`, `nota_belanja_id`, `produk_id`, `kuantitas`, `harga_satuan`, `subtotal`, `created_at`, `updated_at`) VALUES
('018f6d2b-f92b-4f00-bf74-9c39d6cc55a8', 'a6dcea51-15f3-4eb5-b38e-47cd67e8f30f', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-12-01 08:41:11', '2024-12-01 08:41:11'),
('058d18cc-8641-4479-b1b6-a5a081864e8f', '682d86aa-e37c-4ac3-8a6a-6e701a7c1132', '29398d11-f66e-4378-9a31-d91c46966533', 1, 79500.00, 79500.00, '2024-11-28 14:11:33', '2024-11-28 14:11:33'),
('0a82bbcb-c6ef-4537-9325-b6119481bcb7', 'a5c068f1-bcd7-47aa-8f80-8d912eb1a1e8', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-11-28 14:29:38', '2024-11-28 14:29:38'),
('15728cc1-b2e4-4015-8fc1-c9a1bf398ba5', '044f74a6-0f3b-424a-87c0-194fd0d28c6f', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-12-01 08:41:34', '2024-12-01 08:41:34'),
('32e73826-b662-41fa-a83a-5cae9b9191d1', '563fe83f-8a72-41b5-b9e9-e72c799cdf30', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-11-28 13:50:06', '2024-11-28 13:50:06'),
('6a8628b3-bf57-4d4c-bab0-95a2402a29e5', 'f7f7e4f9-ddee-4ba9-b41b-b850cce3c453', '29398d11-f66e-4378-9a31-d91c46966533', 1, 79500.00, 79500.00, '2024-11-28 14:52:22', '2024-11-28 14:52:22'),
('6f337bf4-b9ac-400c-ace2-01a634ec58ab', '563fe83f-8a72-41b5-b9e9-e72c799cdf30', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-11-28 13:50:06', '2024-11-28 13:50:06'),
('711f4bdd-81b1-4f9e-bc36-18b84dc2c083', '407f752d-eb2f-4041-a989-2fcfeeeec2dc', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-11-28 14:09:50', '2024-11-28 14:09:50'),
('727326be-7252-4c55-87c7-f668bdfd39db', '646b76f4-e386-4625-96ab-b2aa3cc64264', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-11-28 14:19:23', '2024-11-28 14:19:23'),
('72cd5573-b134-4ded-ae5e-df204b46fcb9', '9ba279d8-119c-49e6-b550-acd366e22f6c', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-11-28 14:55:35', '2024-11-28 14:55:35'),
('9014409c-13ca-4471-a66b-e99cde257f43', '563fe83f-8a72-41b5-b9e9-e72c799cdf30', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-11-28 13:50:06', '2024-11-28 13:50:06'),
('99f7e134-50db-45fd-a7c0-b730f8c77747', '563fe83f-8a72-41b5-b9e9-e72c799cdf30', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-11-28 13:50:06', '2024-11-28 13:50:06'),
('a02c1e46-34e6-4441-b137-41241847bfa3', 'db3f2a4a-0334-4378-93e2-df16dbe65fc2', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-11-28 14:26:06', '2024-11-28 14:26:06'),
('a0721a79-6a70-4134-826e-8259734058a0', '36d61b87-0537-4519-abca-0e7318407709', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-11-28 14:45:17', '2024-11-28 14:45:17'),
('b7884fe6-e81d-4e2a-afea-95f09796a8f6', '8df68814-1769-4bfd-97de-b2bc6b413ab0', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-11-28 13:42:25', '2024-11-28 13:42:25'),
('b8c8d7f2-0cdb-451f-819f-fc4274ad8cbc', 'f7f7e4f9-ddee-4ba9-b41b-b850cce3c453', '29398d11-f66e-4378-9a31-d91c46966533', 1, 79500.00, 79500.00, '2024-11-28 14:52:22', '2024-11-28 14:52:22'),
('c45f4abd-015e-4d69-bb0d-64bb02a6a142', '8df68814-1769-4bfd-97de-b2bc6b413ab0', '3d45030b-f21a-4e73-ac7d-a79da613a356', 1, 9.00, 9.00, '2024-11-28 13:42:25', '2024-11-28 13:42:25'),
('ccc2514d-efb1-4f37-a9aa-8d87d997dcd5', '5a7c4273-8539-46ca-9d40-bcd0f1fb4766', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-11-28 14:49:29', '2024-11-28 14:49:29'),
('cf43a411-73a3-47e6-b1c5-17ee8ce19984', 'f30a41de-f5a6-4ee9-9bd6-aa4f550ca441', '2263d2bb-1834-4649-bf76-699eae6033f2', 3, 10000.00, 30000.00, '2024-12-02 13:47:49', '2024-12-02 13:47:49'),
('e10c3fc9-24ac-4569-a606-80f54d88b124', '563fe83f-8a72-41b5-b9e9-e72c799cdf30', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-11-28 13:50:06', '2024-11-28 13:50:06'),
('f5a16769-815e-47fe-8fcc-cf72ecf47ceb', '563fe83f-8a72-41b5-b9e9-e72c799cdf30', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-11-28 13:50:06', '2024-11-28 13:50:06'),
('f9de0eca-badd-41a1-a735-6137617b79e5', '21497816-1228-4bbf-9b51-602129dac7c8', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, '2024-11-28 14:23:44', '2024-11-28 14:23:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` char(36) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `deskripsi_kategori` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `nama_kategori`, `deskripsi_kategori`, `created_at`, `updated_at`, `deleted_at`) VALUES
('2f0f099f-4887-4535-9f7d-d1eace94005e', 'benih buah', 'kualitas premium, dan unggul', '2024-12-02 14:00:35', '2024-12-02 14:02:12', '2024-12-02 14:02:12'),
('4609bf91-b627-4202-84aa-d4e6b4c915d9', 'alat tani', 'alat tani premium', '2024-11-28 15:36:43', '2024-11-28 15:36:43', NULL),
('4af93906-4968-4423-9305-b1cef3ef2f8c', 'Skop besi', 'Skop premium berkualitas tinggi', '2024-11-27 04:35:00', '2024-11-27 05:07:57', '2024-11-27 05:07:57'),
('677d95b0-378a-4aad-8467-438b017d98bd', 'cangkul', 'cangkul berkualitas', '2024-11-28 15:37:46', '2024-11-28 15:37:46', NULL),
('b5b8abb7-8ab7-4407-96d6-2ca680d8b3ae', 'Pupuk', 'Pupuk premium', '2024-11-22 15:12:28', '2024-11-22 15:12:28', NULL),
('b5f5f622-9237-48ab-a5a0-7a0cec7ae4bb', 'Pestisida', 'Pestisida premium berkualitas', '2024-11-24 14:00:35', '2024-11-24 14:04:15', '2024-11-24 14:04:15'),
('c8278a9d-b7d1-4956-9a5d-1ca7542ba1a3', 'Elektronik', 'Kategori untuk produk elektronik', '2024-12-02 02:34:31', '2024-12-02 02:34:31', NULL),
('ecdfb8c1-f465-4694-b71f-1829e745965c', 'benih jagung', 'benih berkualitas', '2024-11-28 15:37:12', '2024-11-28 15:37:12', NULL),
('f685ec76-16d2-4d0a-80ab-4ecfd89a2b13', 'benih jagung', 'benih berkualitas', '2024-11-28 15:37:11', '2024-11-28 15:37:11', NULL),
('ff22d7ea-8407-432d-ab83-06560c61ffa5', 'Bibit', 'bibit berkualitas', '2024-11-28 15:36:12', '2024-11-28 15:36:12', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `keranjang_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `kode_voucher` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `keranjang`
--

INSERT INTO `keranjang` (`keranjang_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`, `kode_voucher`) VALUES
('2f825192-6379-42a9-9091-d72c3906130f', 'b21e39c3-e00d-414f-8d55-01b87602c587', '2024-11-22 15:56:29', '2024-11-22 15:56:29', NULL, NULL),
('cd5a23b4-ac48-4bf5-8805-14f7add450b0', 'ef4862e0-513a-4812-82ed-4904caa44b4f', '2024-11-24 08:22:31', '2024-11-24 08:22:31', NULL, NULL),
('ee3802f0-2046-4dfc-95a5-af8a184267dd', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-11-25 07:09:07', '2024-11-25 07:09:07', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang_offline`
--

CREATE TABLE `keranjang_offline` (
  `keranjang_offline_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `keranjang_offline`
--

INSERT INTO `keranjang_offline` (`keranjang_offline_id`, `user_id`, `created_at`, `updated_at`) VALUES
('13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-11-28 08:12:09', '2024-11-28 08:12:09'),
('99658ffe-a5ef-42b8-af93-d16cbf7f1fd2', 'b21e39c3-e00d-414f-8d55-01b87602c587', '2024-12-03 08:30:51', '2024-12-03 08:30:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_aktivitas`
--

CREATE TABLE `log_aktivitas` (
  `log_aktivitas_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `aktivitas` varchar(255) NOT NULL,
  `tgl_aktivitas` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `log_aktivitas`
--

INSERT INTO `log_aktivitas` (`log_aktivitas_id`, `user_id`, `aktivitas`, `tgl_aktivitas`, `deleted_at`) VALUES
('015ae284-e435-482d-b7ab-601a333287a1', 'ef4862e0-513a-4812-82ed-4904caa44b4f', 'auth.login', '2024-11-24 08:20:32', NULL),
('047ac5e7-8f1c-4d4a-806e-d741c3aeccc6', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-24 11:40:14', NULL),
('077eebd9-fe14-489f-bf85-94946f77353f', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-28 09:48:45', NULL),
('07a687c1-25c0-4d9c-b5fb-6a5d762ad021', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-28 06:54:29', NULL),
('0852bb07-98a8-43c9-992b-9e1b356ea70c', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-28 03:39:59', NULL),
('0929f750-c3d8-432f-9f36-c3e2cec18220', 'b169e082-02c1-4c3e-81fa-44b2dae53f17', 'auth.login', '2024-11-25 07:47:27', NULL),
('0963c137-7940-4115-be69-feedb9e2dc08', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.logout', '2024-11-29 15:45:51', NULL),
('09cfa7fa-f5d6-4308-814d-a8bb4b340d9d', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-26 15:31:11', NULL),
('0a162725-de93-45c4-8353-09d04f482036', 'ef4862e0-513a-4812-82ed-4904caa44b4f', 'auth.login', '2024-11-22 08:00:36', NULL),
('0a25a3d7-decb-454e-9224-6f4ec726bf8f', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-12 07:21:49', NULL),
('0b04c97b-7450-479e-9ff5-b8c31474ff6d', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.logout', '2024-11-29 07:15:58', NULL),
('0cdac33d-c417-4401-8262-7a1d5677603b', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.logout', '2024-11-24 09:54:39', NULL),
('0f5f5375-a689-4c74-a4a2-85ba7bb63c00', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-11-25 07:33:43', NULL),
('10bead5a-200e-4785-b09f-018ac84f2dc2', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-26 12:30:24', NULL),
('125c73a8-ed1d-4cf8-89dd-c6633ef8babb', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-01 14:13:50', NULL),
('13508731-cf58-4691-a544-5163030bfb4f', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-02 02:11:48', NULL),
('14b0b11a-d10f-4a1d-93b5-9dc2a5d28f9a', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-04 14:28:23', NULL),
('1546e392-fec1-43a0-96e8-1cb2ae711d89', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.logout', '2024-12-05 16:20:44', NULL),
('15fe651d-c4e7-4cb6-be74-7ed9b12461fc', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.logout', '2024-11-26 06:26:14', NULL),
('170f2e2e-958a-4587-ae1b-f66bffdb3c6b', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.logout', '2024-12-04 15:46:25', NULL),
('19b94840-d852-4518-acb0-8810f3c53c45', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-22 05:34:47', NULL),
('1bbd5d06-9c70-4b48-ad89-e36553c9e87a', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-04 12:41:42', NULL),
('1cec3a58-8e63-42c1-86f6-49cb673cf401', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-21 09:56:16', NULL),
('1d50f116-e8b6-4531-8a70-e97988f468b6', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-23 07:08:49', NULL),
('1ee782fc-b76f-490b-bc43-54aa05bc6296', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-25 07:02:34', NULL),
('1f19006e-a923-43b1-81d6-b0ee3dee067d', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.logout', '2024-11-22 05:35:06', NULL),
('204f28d6-50fb-4bee-8d35-e347ac3af7c8', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-05 16:23:50', NULL),
('21b02fee-4a72-4de1-960d-3f047857e6b8', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-06 04:30:48', NULL),
('2207b3f6-72d1-4a69-b23c-a6d09c7ad009', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-12-03 08:00:13', NULL),
('22a18083-9575-4c31-9de0-fc94c988018c', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-26 14:33:46', NULL),
('22c774ff-c2bc-4424-9944-8984a6415bdd', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-05 15:35:08', NULL),
('24112b9a-72b8-4174-9263-016b631de2ea', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.logout', '2024-11-25 13:34:18', NULL),
('24a56bcf-f03d-449b-87e8-3d5c3c0d3710', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-03 14:55:34', NULL),
('24f0dfdb-6699-4764-a794-a0238aa65b4f', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.logout', '2024-12-03 09:32:03', NULL),
('2514bb0e-4abc-4487-bb60-bd1e876d4e8e', 'b169e082-02c1-4c3e-81fa-44b2dae53f17', 'auth.login', '2024-11-25 02:49:04', NULL),
('2528e5f9-e65d-40a8-aec0-2c8ada55f49e', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-02 03:42:38', NULL),
('2649161f-800c-44ba-9eff-bb6f96b141dc', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-26 15:35:32', NULL),
('28ca7d22-42d1-4d51-945f-b4f61d0ad6dd', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-25 13:11:55', NULL),
('295025b2-0fef-4695-9dc7-7c35d08d07d1', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-24 13:56:13', NULL),
('2b70b870-4ce7-41b9-8562-31de6fdce5d3', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.logout', '2024-12-05 16:17:38', NULL),
('2b9beb87-07dd-4f7f-95fc-3c45aa96a07a', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-04 12:45:16', NULL),
('2bf873db-5ecf-465a-a112-861f8e9c77ba', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-29 14:00:51', NULL),
('2f647e4c-1428-409b-9c28-8ab0bb173f6f', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-25 07:39:08', NULL),
('3092b8d5-1ccc-415e-b626-4017f82b193e', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-26 14:02:57', NULL),
('30d61f15-9e6e-448c-99f9-33f93fdf0b54', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-25 06:29:57', NULL),
('34342a2f-abb5-4d91-ae34-11fed7cbfbe5', 'ef4862e0-513a-4812-82ed-4904caa44b4f', 'auth.logout', '2024-11-24 13:55:45', NULL),
('3646d8fe-2b4c-4683-81db-eb7a648ed057', 'b169e082-02c1-4c3e-81fa-44b2dae53f17', 'auth.login', '2024-11-25 02:36:43', NULL),
('36fd5ee4-4fa1-4bef-b61a-2985a6367a71', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-25 07:08:02', NULL),
('382f70a2-70c2-46f5-9b99-580eb80b9846', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-05 05:58:45', NULL),
('38a18f05-b486-4cae-8387-ad83d7c5c598', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.logout', '2024-11-29 07:31:35', NULL),
('3b8e3f54-18c8-4cbd-9030-9e166275250c', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-03 15:07:31', NULL),
('3b967188-26d1-401a-bb12-fed6f7be6149', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-25 07:43:46', NULL),
('3e544841-6798-4595-a325-6b7a5aa709f5', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-13 03:15:24', NULL),
('3f515c22-421c-45da-af5c-500c828afe00', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.logout', '2024-11-22 05:12:14', NULL),
('3fa59293-fa33-46f4-b6ca-b48c09bb9f28', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-25 05:17:17', NULL),
('3ff4204a-ef57-4654-9165-b9fcb9ead470', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-26 14:22:01', NULL),
('405387b5-46fb-4996-8b69-1fe94e7fe8d9', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-01 08:07:44', NULL),
('43851086-ba68-42bf-9572-4d7d5ec485e4', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-24 09:52:23', NULL),
('43a2ceef-aa21-4c90-90f1-c0894dd9fdd9', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-03 10:41:23', NULL),
('440c7542-25e5-4448-a6cb-2f0fd4aa1491', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.logout', '2024-11-22 12:29:43', NULL),
('442394c6-ce4f-4561-9397-cd37ee47de3b', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.logout', '2024-12-03 16:08:00', NULL),
('456ef3cb-673f-4325-aeb6-670c962e431d', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-02 06:56:48', NULL),
('469861e0-9c63-4c52-b87d-9b8eec8cc671', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.logout', '2024-12-05 05:43:24', NULL),
('47a7b57d-8277-4c37-b6c2-8e8d7ce28217', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-05 02:37:21', NULL),
('49d2906b-8ebb-4edf-9ab3-7c3c87ddf69d', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.logout', '2024-11-26 05:49:34', NULL),
('4a3da150-b55f-4377-994e-5e0933076abd', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-04 14:13:47', NULL),
('4a70c2b2-b47c-4bad-847b-55bd3a68a51a', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.logout', '2024-12-04 13:54:30', NULL),
('4bd32c91-a71b-4793-ac02-cdef6f170ad6', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-28 03:50:37', NULL),
('4ffb45bd-0c87-4d56-ab80-9a2d13829be8', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.logout', '2024-12-01 11:44:10', NULL),
('51fbda29-1cf4-48c5-95d8-3189dc54b667', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-05 13:00:46', NULL),
('5331c6f2-1259-4eda-9339-7de55c0d0f2a', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-25 07:51:05', NULL),
('53637235-b14a-498e-a308-b3577987ec95', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'cart.add', '2024-11-25 07:36:57', NULL),
('53764373-237e-492a-ad64-36739857672e', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-04 14:32:25', NULL),
('560d2f8c-845f-4dbd-9463-f172e29d122a', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-04 13:54:34', NULL),
('56626a1b-2c11-4ce4-9423-145b74071cbf', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-11-28 04:05:35', NULL),
('5916a1d1-3f9d-44f3-b509-de4b6851ea18', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.logout', '2024-11-26 06:26:13', NULL),
('5986ebbc-0008-4b48-9d37-33af5147506f', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-06 03:42:17', NULL),
('5d2f751f-faf4-481a-9df5-6769eab9bc82', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-28 08:43:47', NULL),
('5d36f0b6-156a-4596-8dee-276ed9747968', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.register', '2024-11-22 06:40:08', NULL),
('5d4b774f-7cd9-46cf-900f-1269c179b55a', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-04 15:46:29', NULL),
('5eb2fc8b-3c3a-4e76-a274-672b651b626d', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-04 14:29:32', NULL),
('5f47a89e-d16d-4f43-b8c0-0ea9bde09b1b', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-02 03:47:05', NULL),
('61a9e8ff-6730-4af7-b43c-62424aa743c4', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.logout', '2024-12-06 03:16:13', NULL),
('61fef747-809c-440f-aa68-e01269686fad', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-22 06:22:30', NULL),
('65d9e41e-3253-4404-9557-53b2feaf2f45', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-21 14:18:51', NULL),
('66fa29e1-0988-42dc-b007-13cd7129f36b', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-27 13:12:19', NULL),
('6814600a-f33a-475d-9f8c-e8cc1c65d440', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-28 03:14:04', NULL),
('6883f7ca-7ac7-4a35-9b4b-8f84204ff14b', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-23 12:38:09', NULL),
('690d2b11-266f-4bb2-a1ff-72bbee0874cf', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.logout', '2024-12-04 12:45:12', NULL),
('6a29bc44-40e0-4723-ad9f-c163f7500a1d', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-04 14:30:10', NULL),
('6a5c1ae2-61f3-4d37-b7d4-821144e6c780', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.logout', '2024-12-06 03:32:02', NULL),
('6b8ee9be-5987-4384-9c86-035f37f6efae', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-26 05:43:37', NULL),
('6c042e5c-41cb-4a50-a03e-b415277492bd', 'ef4862e0-513a-4812-82ed-4904caa44b4f', 'auth.otp.verify', '2024-11-22 08:00:19', NULL),
('6d3aa7c1-afae-4e9e-ba4f-a73bd9adb086', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-28 12:57:10', NULL),
('6d8c0b8b-3341-4059-a72f-51a00849edb6', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-04 14:17:57', NULL),
('6e560dba-c885-4722-be17-0610a0ec66a0', '2a20d718-c1f9-4223-82bf-9f27cccd566a', 'auth.logout', '2024-12-13 01:44:23', NULL),
('70b33cf2-f874-4fb6-b6df-b1e6324289a5', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-12 07:21:40', NULL),
('71850adf-3009-4c5b-b982-f4d4fb79d43a', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-25 08:05:08', NULL),
('71bb9991-a285-4824-b07c-64e31179a565', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-29 07:22:31', NULL),
('71c41bb1-b6c0-4ad1-869d-d8b0c4a52685', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-23 03:31:07', NULL),
('71d2946a-3e3f-406d-ac68-26717db6c5da', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.register', '2024-11-22 06:46:25', NULL),
('732398a1-9eec-497e-8c68-10ea9fed4c32', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-04 14:27:35', NULL),
('739ef979-6b9c-403f-af59-88af5ff423bf', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-28 13:40:36', NULL),
('74100612-4564-463b-9089-57ff38c7c982', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'cart.add', '2024-11-25 07:34:09', NULL),
('76da5984-ddff-4295-a2d4-73d153cfe903', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-26 05:44:20', NULL),
('787825a3-6b18-4af2-8fd7-ceb0af8db75d', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-22 15:51:56', NULL),
('79336d2e-15db-461a-9062-88310f0e4ebc', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.register', '2024-11-24 12:48:00', NULL),
('799f9a90-c9a6-4524-af8d-73a65d967e7f', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-05 15:34:36', NULL),
('7ad6a057-0f68-46ca-8222-571a0db97b89', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-06 03:14:24', NULL),
('7bb8ac62-7249-4daf-9421-2297bcc8bbf9', 'b169e082-02c1-4c3e-81fa-44b2dae53f17', 'auth.login', '2024-11-24 09:55:08', NULL),
('7cbec455-6c4b-40ef-b77b-d6b077e73659', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-24 13:27:07', NULL),
('7cdc67bc-c403-4091-9e4c-f7d4e6c9a497', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.logout', '2024-12-13 01:40:37', NULL),
('7e9bab6f-617d-40d7-b15e-610aa5c41a6b', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-25 05:01:33', NULL),
('7f83ff9f-4064-412f-8891-c755497b0e34', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-26 04:55:39', NULL),
('7fd3aa10-6058-419c-91b2-effcb31db05a', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-21 13:54:00', NULL),
('811d0c3e-6ab9-4c1b-8c84-2c21ffc3ce8d', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-27 14:21:02', NULL),
('81738a74-9f53-40b3-9f05-d2f7b0ad7662', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-11-25 07:32:27', NULL),
('828e50a9-f929-4b6f-a750-6c5bf28032ef', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-11-28 07:23:30', NULL),
('82a41a38-e9fc-4cb9-bd4a-07143a4585e6', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-22 13:26:41', NULL),
('833a27eb-814b-48ab-8d9c-7be8828c9c90', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-24 15:01:33', NULL),
('83ca0936-3aad-443c-a97a-1aa97e48f1ac', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-11-28 04:06:16', NULL),
('83e2e68f-c1c0-48d5-af3a-1e88e96b508d', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-23 05:45:52', NULL),
('83fd95ca-7f25-40eb-b188-1cf39806fa37', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-25 05:50:31', NULL),
('8467b4a4-532c-4c49-bbc4-c027de5c80f6', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-22 05:11:58', NULL),
('86b56977-6a0b-4854-b173-7a8eba8f295b', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-25 04:48:37', NULL),
('88471108-aaa8-4be2-9027-c192e7ce5efc', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-23 13:40:31', NULL),
('89916225-d2e3-4116-801f-b7760b5b80a5', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-26 05:49:38', NULL),
('89a21c99-92d3-4c3d-b28e-9a58cb660c88', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-02 13:33:06', NULL),
('8a1c1c23-1b47-4d25-a239-ae982509bbed', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-03 09:32:28', NULL),
('8ae726fd-a902-4398-9acd-64b89f916669', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-04 14:11:19', NULL),
('8b9475da-cf18-4b74-8e85-ca40d560b23d', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.logout', '2024-11-29 04:06:10', NULL),
('8bf8224c-7cf6-4fef-a9c0-8172e81e82fd', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-22 06:48:57', NULL),
('8c7aef2a-40d4-4039-8c92-83d4e06b09ec', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-03 13:29:20', NULL),
('8c86efd3-ce60-426f-9281-ab12a37317d9', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-03 09:54:16', NULL),
('8cba460d-8df4-433b-8a19-7e0eddc84bf4', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-22 13:51:21', NULL),
('8dbc7b81-407f-4b9f-ab18-9515e3de4605', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-11-28 04:04:58', NULL),
('8e55903b-7d18-4e57-851a-e441385b4488', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-04 14:32:07', NULL),
('8e610ca1-0ff2-476b-86d9-98ee6205d15f', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-13 03:15:26', NULL),
('8e91d7a9-30c8-4e0d-a9ea-efab42f24549', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-29 11:25:36', NULL),
('906222be-0f84-4d81-a84f-e80bd12fe7a4', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-27 13:39:15', NULL),
('90eb9709-e76c-466f-b3a4-a3c13f975eaa', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-04 14:31:11', NULL),
('9301c31e-8b2d-46dd-8f9b-e2e29b52bcbf', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-04 12:41:44', NULL),
('932738ee-3761-4f45-90e8-96146be04cc2', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-04 14:22:45', NULL),
('93c542ab-e338-4c41-a30a-7f524e533cb1', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-25 13:20:28', NULL),
('949dbf5a-46f3-4a2e-ae67-4bd259a12c9e', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-26 05:50:10', NULL),
('9555d146-92bf-40e8-9429-145fd5dab84d', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.logout', '2024-12-06 04:10:34', NULL),
('979d9548-2236-4a9d-a48a-ccf8385e871b', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.register', '2024-11-24 12:54:23', NULL),
('98195f4a-b2c4-4405-9fc2-35092e928e7e', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-24 07:53:11', NULL),
('995ca5af-22c9-4147-ab5c-ffb43457f9ad', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-05 15:27:49', NULL),
('9b9b3aa3-69ed-4276-96c7-056f2a459d63', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-04 14:09:19', NULL),
('a0534964-6018-4a76-b56f-034bc003b815', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-12 11:50:00', NULL),
('a14ae564-ef91-42f7-a3e2-ab226d6e12b2', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-13 02:59:54', NULL),
('a4b2a2a5-0f1e-4091-b4ed-bf9386949cac', '9d20f6a5-949a-447d-8f96-669cb3fd84c8', 'auth.login', '2024-12-13 01:44:35', NULL),
('a5adcb7b-ba26-4b1a-8cc4-01e3d5385691', 'ef4862e0-513a-4812-82ed-4904caa44b4f', 'auth.login', '2024-11-24 14:35:25', NULL),
('a68804d0-2c6b-429c-b24b-538e82e15fdf', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-12-01 11:52:41', NULL),
('aa2179ec-f426-408a-a84b-94bdf2795099', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-02 02:16:14', NULL),
('aa2c0e89-ec37-405f-b263-db09f00a18b1', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.logout', '2024-12-03 15:07:27', NULL),
('ab9f29ff-f6f2-4414-9f64-81edce9493a7', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-04 14:18:49', NULL),
('ac46d411-f2c3-43f5-9964-1e4172b86209', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-01 14:01:07', NULL),
('acf912de-0cc6-4b13-80f2-a24dd1bb4531', 'ef4862e0-513a-4812-82ed-4904caa44b4f', 'auth.login', '2024-11-25 06:17:36', NULL),
('ad5b207f-a042-4454-9293-733b8a8a255d', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-22 12:29:13', NULL),
('aeaf996e-7345-4e03-8695-217716eb1835', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-25 08:22:56', NULL),
('b3504838-bc6f-4a06-8df8-055d02598979', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-25 06:28:47', NULL),
('b5ae0d17-c5d5-447f-8d84-2a974e5d4db8', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-06 03:05:44', NULL),
('b642348b-cbec-4b0a-bbc3-a1ed74870e58', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-11-25 07:33:03', NULL),
('b68b5955-fb77-4c3a-a6b7-a00099aa1501', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-01 13:37:37', NULL),
('b82339b0-7ac6-46cf-899a-07bbd1ce129c', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-29 13:47:46', NULL),
('b93f265e-af63-487a-b188-6672f808cf42', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-01 10:56:25', NULL),
('ba5bcad1-3b9f-4716-807b-8349c779ead1', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.logout', '2024-12-01 11:53:21', NULL),
('bd72ad23-25b4-4069-be19-1b2c05e974f3', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-11-28 03:56:28', NULL),
('c037222b-8657-48ba-b11b-c4d3f08c7206', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-11-25 07:40:03', NULL),
('c0461e3b-4d7e-4e3a-9689-d48597a08397', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.otp.verify', '2024-12-02 13:05:05', NULL),
('c21260ca-2698-4afe-b202-6bb557198d19', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-25 13:22:33', NULL),
('c2689a0e-27f4-4a33-9bb5-e59d3ed0ec4f', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-01 14:17:00', NULL),
('c5d28d84-f0a9-4259-bca0-2f9f9bde4f72', 'ef4862e0-513a-4812-82ed-4904caa44b4f', 'auth.login', '2024-11-24 13:42:42', NULL),
('c7935790-8349-42f3-bbc3-5a625a2c9ee5', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.logout', '2024-12-05 16:17:13', NULL),
('c7c5e39b-d4d6-400b-853a-b281d05d8627', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-12 11:41:58', NULL),
('c9dc5657-299c-4279-9222-b9e748f440b8', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'cart.add', '2024-11-25 07:35:59', NULL),
('cabbf21b-590c-4692-9f40-ebf2492165b2', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-06 04:16:27', NULL),
('cbb1da70-b99e-44c8-8137-6a63e5dc8e3e', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-25 04:56:16', NULL),
('ccb9eb0a-c123-476f-8b7e-d15c967b914b', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.register', '2024-11-22 06:45:36', NULL),
('ccbe0fe8-44f3-48fd-8f26-1f80ac5a21d0', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.logout', '2024-11-22 13:51:24', NULL),
('ccd71a96-4554-4ae9-b794-e5f725d09d30', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-25 07:13:47', NULL),
('cd0e8d2f-00c1-4542-985f-85a8d9d73875', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-28 13:40:40', NULL),
('ce80ee4c-869e-4fe4-8b05-d3401226ba0f', '2a20d718-c1f9-4223-82bf-9f27cccd566a', 'auth.login', '2024-12-13 01:40:52', NULL),
('cf718e40-86db-4ffb-afc1-836b06a9393d', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-11-28 07:22:54', NULL),
('d024f00a-efaf-4699-b4b4-98fc58b5b8c7', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-04 14:08:59', NULL),
('d06b3232-a648-495c-aee1-267f7edf1440', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-11-25 07:35:49', NULL),
('d3544045-6911-4053-81ed-3428e1eb2575', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-29 03:02:07', NULL),
('d39a4526-54c5-45f8-ac37-7fb6d13a704e', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-13 01:29:21', NULL),
('d83c3e80-f419-489d-8827-0810921156ec', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-21 09:48:23', NULL),
('d9f5907f-f9ad-4355-a03f-abfd2658108f', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-12 11:50:02', NULL),
('daf4b679-8a03-4dff-9024-1fe78296fc65', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-04 14:30:34', NULL),
('db41122b-10ee-4976-8127-fc5b691adfd2', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-13 02:48:44', NULL),
('dcba1714-59d9-4f82-a28a-e296ddbc0be7', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.otp.verify', '2024-11-24 12:53:34', NULL),
('dcd89a15-e056-4061-b37a-aa2f7ee12ce6', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-26 10:34:11', NULL),
('dd1b8ed4-52c9-424c-9f3d-6229a4b204bb', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-01 13:35:55', NULL),
('dd719cb1-fa5f-4c6f-8998-0e3bd9f230f1', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.logout', '2024-11-25 13:14:57', NULL),
('dd8a1a6f-e8af-43a4-87cb-55ddc57ec9d8', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-25 13:34:24', NULL),
('dedd033c-709d-4be8-8251-76baab6ac4ea', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-29 04:02:52', NULL),
('dee10f5f-9306-495f-bf3f-d2442bcbbd48', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.register', '2024-12-02 13:07:52', NULL),
('defa8773-0501-4f63-8d9f-923a3c1188a2', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-30 13:20:45', NULL),
('e46e4fb1-e04b-4b2f-8bc9-439c4ec2ec71', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.register', '2024-12-02 13:04:01', NULL),
('e5251490-07bd-49bb-8a7e-533cb0bb065c', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-04 14:07:04', NULL),
('e543600e-8a44-4542-861e-9f20af1ff4c8', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.register', '2024-11-22 06:45:04', NULL),
('e5863107-6cc8-491e-8ede-f7388e56e946', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-06 04:11:09', NULL),
('e63a2246-7e65-400f-aa68-5f86889fccba', 'f75e5dc2-0d2d-4686-bd07-831f85053408', 'auth.otp.verify', '2024-12-02 02:08:42', NULL),
('e6cc8324-db50-4f74-ab43-40ac506a879b', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-05 15:28:43', NULL),
('e822338a-0e57-4cb6-983c-27a539851619', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-13 02:19:45', NULL),
('e8365734-e07a-4714-9341-2bad350fc37d', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-02 13:39:22', NULL),
('e83c84f8-ba0b-456b-b688-aebea7dbc416', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-27 03:04:16', NULL),
('e8c2254d-6980-4a96-be71-76d2bc524544', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-27 03:03:24', NULL),
('eac6ad7c-25c5-4739-98cb-814753a711e3', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'cart.add', '2024-12-04 14:07:15', NULL),
('ec2084d1-5a6d-46a3-937f-39e440591751', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-25 06:27:49', NULL),
('ed57f885-7a92-49c2-99d4-7237dd6b0d5a', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.logout', '2024-11-25 13:34:19', NULL),
('eda0b210-9ed3-46e7-ac04-5cbae65c9dfd', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.register', '2024-12-02 12:59:20', NULL),
('ede7cc48-0fca-4ba0-bb5d-9a48d350254a', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-26 14:25:08', NULL),
('ee025667-dd94-486e-bb20-270f1c7bcd41', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-02 13:17:01', NULL),
('ee74bd0c-d130-4608-8c36-e876eb262476', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-29 04:06:22', NULL),
('ef28ed70-23b0-48f9-83a1-1482d9889131', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-23 02:38:05', NULL),
('f0319da4-4926-4d06-a196-d5d499b35bdc', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-23 15:00:05', NULL),
('f145ed3a-ec7e-4cc2-8ea7-58fe9353154f', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.logout', '2024-12-06 04:16:22', NULL),
('f1b9dae6-1960-4818-b756-660459c8e372', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-05 16:22:03', NULL),
('f2fe81e0-ccb6-4e8c-bb5d-55951217b97b', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-12 07:14:20', NULL),
('f4313a25-c78a-4eed-b960-e805a4e19eae', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-23 16:23:06', NULL),
('f53900ff-98e6-4dca-a969-62b429af810a', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-25 13:37:21', NULL),
('f62ef831-94a8-4cf8-9d10-1db18a8bc990', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-26 14:49:31', NULL),
('f6b76acc-9242-417e-9f42-36b11fc2e6b7', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-03 16:08:03', NULL),
('f6e903e6-3f8d-4128-9fbe-1acbd803182f', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-27 07:16:34', NULL),
('f740ef1c-5ecc-472c-a50c-385cea522369', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-13 02:11:09', NULL),
('f7d3b6f9-ebe4-4ad2-a475-5277a55d04b4', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.logout', '2024-11-26 05:49:49', NULL),
('f893cd31-4e18-4ebf-a785-ef5b69bdf054', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-01 14:04:55', NULL),
('f95843d9-576d-4356-a971-456cad5e318e', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-11-25 12:05:09', NULL),
('fa6b2788-9190-4e1f-a252-392005b74a3b', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'auth.login', '2024-12-02 13:52:06', NULL),
('fba07549-9b43-494f-b1fd-74ba6158865c', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-21 10:21:45', NULL),
('fc7875b3-4cdc-4eb3-b87f-a6a30f92837b', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'auth.login', '2024-11-25 04:53:07', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '0001_01_01_000002_create_jobs_table', 1),
(3, '2024_11_19_124503_create_users_table', 1),
(4, '2024_11_19_124534_create_otps_table', 1),
(5, '2024_11_19_124550_create_log_aktivitas_table', 1),
(6, '2024_11_19_124615_create_kategori_table', 2),
(7, '2024_11_19_124628_create_keranjang_table', 3),
(8, '2024_11_19_124639_create_item_keranjang_table', 4),
(9, '2024_11_19_124652_create_order_table', 5),
(10, '2024_11_19_124703_create_detail_order_table', 6),
(11, '2024_11_19_124717_create_promo_table', 7),
(13, '2024_11_20_110518_create_personal_access_tokens_table', 9),
(14, '2024_11_20_105043_create_permission_tables', 10),
(15, '2024_11_20_222800_remove_role_from_users_table', 11),
(16, '2024_11_20_223640_add_role_to_users_table', 12),
(17, '2024_11_22_140442_add_default_to_model_type_in_model_has_roles_table', 13),
(18, '2024_11_19_124748_create_transaksi_table', 14),
(19, '2024_11_23_101418_add_order_id_to_item_keranjang_table', 15),
(20, '2024_11_23_123655_create_order_details_table', 16),
(21, '2024_11_23_212018_create_reviews_table', 17),
(22, '2024_11_23_220814_create_notifications_table', 18),
(23, '2024_11_23_224456_create_sales_reports_table', 19),
(24, '2024_11_23_230434_create_address_table', 20),
(25, '2024_11_28_103159_create_produk_item_table', 21),
(26, '2024_11_28_140304_create_keranjang_offline_table', 22),
(27, '2024_11_28_140344_create_item_keranjang_offline_table', 23),
(28, '2024_11_28_140407_create_nota_belanja_table', 24),
(29, '2024_11_28_140455_create_item_nota_belanja_table', 25),
(30, '2024_11_28_141414_create_pembayaran_table', 26),
(31, '2024_11_29_184247_create_sales_report_offline_table', 27),
(32, '2024_12_13_113211_create_provinces_table', 28),
(33, '2024_12_13_113224_create_cities_table', 29),
(34, '2024_12_13_113231_create_districts_table', 30);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL DEFAULT 'AppModelsUser',
  `model_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'AppModelsUser', '2ee7ef07-430c-4049-9b07-eb29550f1cb1'),
(1, 'AppModelsUser', '2f4713b5-8b3a-476c-b413-db2d30207301'),
(1, 'AppModelsUser', '87d7d3fd-0c78-46a6-973e-52dd94764506'),
(1, 'App\\Models\\User', 'b0ecb16c-7c44-4ed4-a84e-f05f5a69db1e'),
(1, 'AppModelsUser', 'd5c51197-9b11-4262-8e1b-adf89827907b'),
(1, 'AppModelsUser', 'd9b68e60-ad24-4599-9ca4-8840f921bb6e'),
(1, 'AppModelsUser', 'e3d54a09-89a7-429b-bf2a-2182d8016e35'),
(2, 'AppModelsUser', '19bb186a-deb8-4809-b4cd-c5a38d21d420'),
(2, 'AppModelsUser', '2239d061-9369-4404-8ebb-a8292f2733be'),
(2, 'AppModelsUser', '2a20d718-c1f9-4223-82bf-9f27cccd566a'),
(2, 'AppModelsUser', '2ee7ef07-430c-4049-9b07-eb29550f1cb1'),
(2, 'AppModelsUser', '2f4713b5-8b3a-476c-b413-db2d30207301'),
(2, 'AppModelsUser', '39fb6adc-2377-4523-98a7-318bf3f24f09'),
(2, 'AppModelsUser', '73b9cb4b-3598-4490-9252-529e6735497a'),
(2, 'AppModelsUser', '81b862ae-85b8-445e-b8e6-d0832d7a2f42'),
(2, 'AppModelsUser', 'af6181db-7ba1-437a-9a34-959d853700a0'),
(2, 'AppModelsUser', 'ccc09a87-abf9-4bf1-a097-9576336c0835'),
(2, 'AppModelsUser', 'e9efcad8-587b-4003-bbe9-01fc2f6b08cc'),
(2, 'AppModelsUser', 'ef4862e0-513a-4812-82ed-4904caa44b4f'),
(2, 'AppModelsUser', 'f75e5dc2-0d2d-4686-bd07-831f85053408'),
(3, 'AppModelsUser', '2ee7ef07-430c-4049-9b07-eb29550f1cb1'),
(3, 'AppModelsUser', '2f4713b5-8b3a-476c-b413-db2d30207301'),
(3, 'AppModelsUser', '9d20f6a5-949a-447d-8f96-669cb3fd84c8'),
(3, 'AppModelsUser', 'b169e082-02c1-4c3e-81fa-44b2dae53f17'),
(3, 'App\\Models\\User', 'b21e39c3-e00d-414f-8d55-01b87602c587');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nota_belanja`
--

CREATE TABLE `nota_belanja` (
  `nota_belanja_id` char(36) NOT NULL,
  `keranjang_offline_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `total_harga` decimal(10,2) NOT NULL,
  `status` enum('pending','lunas','dibatalkan') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `nota_belanja`
--

INSERT INTO `nota_belanja` (`nota_belanja_id`, `keranjang_offline_id`, `user_id`, `total_harga`, `status`, `created_at`, `updated_at`) VALUES
('044f74a6-0f3b-424a-87c0-194fd0d28c6f', '13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 10000.00, 'pending', '2024-12-01 08:41:34', '2024-12-01 08:41:34'),
('21497816-1228-4bbf-9b51-602129dac7c8', '13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 10000.00, 'pending', '2024-11-28 14:23:44', '2024-11-28 14:23:44'),
('36d61b87-0537-4519-abca-0e7318407709', '13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 10000.00, 'pending', '2024-11-28 14:45:17', '2024-11-28 14:45:17'),
('407f752d-eb2f-4041-a989-2fcfeeeec2dc', '13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 10000.00, 'pending', '2024-11-28 14:09:50', '2024-11-28 14:09:50'),
('563fe83f-8a72-41b5-b9e9-e72c799cdf30', '13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 60000.00, 'pending', '2024-11-28 13:50:06', '2024-11-28 13:50:06'),
('5a7c4273-8539-46ca-9d40-bcd0f1fb4766', '13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 10000.00, 'pending', '2024-11-28 14:49:29', '2024-11-28 14:49:29'),
('646b76f4-e386-4625-96ab-b2aa3cc64264', '13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 10000.00, 'pending', '2024-11-28 14:19:23', '2024-11-28 14:19:23'),
('682d86aa-e37c-4ac3-8a6a-6e701a7c1132', '13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 79500.00, 'pending', '2024-11-28 14:11:32', '2024-11-28 14:11:32'),
('8df68814-1769-4bfd-97de-b2bc6b413ab0', '13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 10009.00, 'pending', '2024-11-28 13:42:25', '2024-11-28 13:42:25'),
('9ba279d8-119c-49e6-b550-acd366e22f6c', '13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 10000.00, 'pending', '2024-11-28 14:55:35', '2024-11-28 14:55:35'),
('a5c068f1-bcd7-47aa-8f80-8d912eb1a1e8', '13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 10000.00, 'pending', '2024-11-28 14:29:38', '2024-11-28 14:29:38'),
('a6dcea51-15f3-4eb5-b38e-47cd67e8f30f', '13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 10000.00, 'pending', '2024-12-01 08:41:11', '2024-12-01 08:41:11'),
('db3f2a4a-0334-4378-93e2-df16dbe65fc2', '13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 10000.00, 'pending', '2024-11-28 14:26:06', '2024-11-28 14:26:06'),
('f30a41de-f5a6-4ee9-9bd6-aa4f550ca441', '13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 30000.00, 'pending', '2024-12-02 13:47:49', '2024-12-02 13:47:49'),
('f7f7e4f9-ddee-4ba9-b41b-b850cce3c453', '13a2231c-5190-4f4d-bff2-9ee9cdcd6a32', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 159000.00, 'pending', '2024-11-28 14:52:22', '2024-11-28 14:52:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `message` varchar(255) NOT NULL,
  `status` enum('unread','read') NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `notifications`
--

INSERT INTO `notifications` (`notification_id`, `user_id`, `message`, `status`, `created_at`, `updated_at`) VALUES
('0685c229-0e47-47a2-b0e1-b87a6328d0ee', 'ef4862e0-513a-4812-82ed-4904caa44b4f', 'Datanglah ke offline store Karya Tani sekarang!', 'unread', '2024-11-23 15:31:34', '2024-11-23 15:31:34'),
('08857641-7bf2-4d9a-817f-83ed3e76f8eb', 'b169e082-02c1-4c3e-81fa-44b2dae53f17', 'Promo baru: Diskon Super, jenis: diskon, nilai: 25', 'unread', '2024-11-24 16:48:24', '2024-11-24 16:48:24'),
('0da98d9b-4543-462d-bbd8-575d7ca9a71b', 'ef4862e0-513a-4812-82ed-4904caa44b4f', 'Promo baru: diskonn, jenis: diskon, nilai: 10', 'unread', '2024-11-27 08:05:47', '2024-11-27 08:05:47'),
('105447da-35d5-4516-8940-d6a4181872af', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'Promo baru: promo ambyar, jenis: voucher, nilai: 1000', 'unread', '2024-11-28 15:49:16', '2024-11-28 15:49:16'),
('16ae30ab-48c1-45f8-8952-9b5203be8eb2', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'Datanglah ke offline store Karya Tani sekarang!', 'unread', '2024-11-23 15:31:34', '2024-11-23 15:31:34'),
('19338354-d4cb-416a-a8b5-738167154393', 'd9b68e60-ad24-4599-9ca4-8840f921bb6e', 'Promo baru: 12.12, jenis: diskon, nilai: 12', 'unread', '2024-11-27 07:47:14', '2024-11-27 07:47:14'),
('21f69cd1-04c0-4fa2-bb43-ea1bfe5faa5a', 'ef4862e0-513a-4812-82ed-4904caa44b4f', 'Segera hadir coming soon', 'unread', '2024-11-27 07:24:21', '2024-11-27 07:24:21'),
('2774d470-6445-4d90-9b77-8101ec361f50', 'ef4862e0-513a-4812-82ed-4904caa44b4f', 'Karya tani shop', 'unread', '2024-11-27 07:34:18', '2024-11-27 07:34:18'),
('2b2f3665-1bc9-4db6-93a3-a9dbae5da7d8', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'Segera hadir coming soon', 'unread', '2024-11-27 07:24:21', '2024-11-27 07:24:21'),
('2f63a127-968a-4530-8a22-d9920f1da240', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'Promo baru: diskonn, jenis: diskon, nilai: 10', 'unread', '2024-11-27 08:05:47', '2024-11-27 08:05:47'),
('31803e84-f11b-45f0-8542-a7c9ccec98cd', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'Promo baru: Diskon Super, jenis: diskon, nilai: 25', 'read', '2024-11-24 16:48:24', '2024-11-24 16:52:33'),
('34eba2b8-44a2-4910-a4ce-341d663faf43', 'b169e082-02c1-4c3e-81fa-44b2dae53f17', 'Promo baru: diskonn, jenis: diskon, nilai: 10', 'unread', '2024-11-27 08:05:47', '2024-11-27 08:05:47'),
('3677343a-7e88-495a-9ed9-bd8800a0d0d6', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'Promo baru: promo 1212, jenis: diskon, nilai: 12', 'unread', '2024-11-28 15:52:18', '2024-11-28 15:52:18'),
('3d5f15ae-7e6a-4acb-927f-bc255a3f71a7', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'Promo baru: Promo Awal Desember, jenis: diskon, nilai: 10', 'read', '2024-12-02 14:15:06', '2024-12-12 11:45:43'),
('42274fb9-f118-4a78-bf12-8a4f4fd139dd', 'd9b68e60-ad24-4599-9ca4-8840f921bb6e', 'Karya Tani Shop akan segera launching', 'unread', '2024-12-02 14:09:34', '2024-12-02 14:09:34'),
('4384492d-31a7-4c0a-ac93-cec1921e603b', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'Segera hadir coming soon', 'unread', '2024-11-27 07:24:21', '2024-11-27 07:24:21'),
('4839859d-0476-45d4-9a8a-3fef9aa44879', 'ef4862e0-513a-4812-82ed-4904caa44b4f', 'Promo baru: promo ambyar, jenis: voucher, nilai: 1000', 'unread', '2024-11-28 15:49:16', '2024-11-28 15:49:16'),
('49697b90-94ef-4f3a-9eb7-a7e277003a11', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'Promo baru: Diskon November, jenis: voucher, nilai: 25', 'unread', '2024-11-24 16:44:52', '2024-11-24 16:44:52'),
('49fd34bd-8e82-4d46-9831-c25fa3f7c635', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'Karya tani shop', 'read', '2024-11-27 07:34:18', '2024-11-29 05:44:18'),
('5932a0a4-26f3-4de8-a367-64893e0b42f3', 'd9b68e60-ad24-4599-9ca4-8840f921bb6e', 'Karya Tani Membuka Cabang Baru di Bandung', 'unread', '2024-11-24 16:55:13', '2024-11-24 16:55:13'),
('5ca77cd2-3130-4c30-84ac-73b2852c0413', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'Promo baru: Promo Awal Desember, jenis: diskon, nilai: 10', 'unread', '2024-12-02 14:15:06', '2024-12-02 14:15:06'),
('6051a8a0-b748-47bc-a37c-2fb5d1f375eb', 'd9b68e60-ad24-4599-9ca4-8840f921bb6e', 'Promo baru: promo ambyar, jenis: voucher, nilai: 1000', 'unread', '2024-11-28 15:49:16', '2024-11-28 15:49:16'),
('67bd6d94-8242-4402-b290-479fbb8ed542', 'd9b68e60-ad24-4599-9ca4-8840f921bb6e', 'Promo baru: Diskon Super, jenis: diskon, nilai: 25', 'unread', '2024-11-24 16:48:24', '2024-11-24 16:48:24'),
('69b85095-dc38-470a-97f8-184a3415f4f1', 'b169e082-02c1-4c3e-81fa-44b2dae53f17', 'Promo baru: 12.12, jenis: diskon, nilai: 12', 'unread', '2024-11-27 07:47:13', '2024-11-27 07:47:13'),
('6adf01b1-40a5-44bd-98de-fcd3742cf64a', 'b169e082-02c1-4c3e-81fa-44b2dae53f17', 'Promo baru: promo ambyar, jenis: voucher, nilai: 1000', 'unread', '2024-11-28 15:49:16', '2024-11-28 15:49:16'),
('77171bee-3f18-4455-947f-a2bba172ed18', 'd9b68e60-ad24-4599-9ca4-8840f921bb6e', 'Karya tani shop', 'unread', '2024-11-27 07:34:18', '2024-11-27 07:34:18'),
('7f4438ce-3341-479b-b23d-786886026e6f', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'Promo baru: 12.12, jenis: diskon, nilai: 12', 'unread', '2024-11-27 07:47:14', '2024-11-27 07:47:14'),
('80a246db-7b3b-4c54-bb62-0aadaf47f8ec', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'Promo baru: 12.12, jenis: diskon, nilai: 12', 'unread', '2024-11-27 07:47:13', '2024-11-27 07:47:13'),
('80b3d1d8-97dd-4111-9be2-c5b71d4e4a8e', 'b169e082-02c1-4c3e-81fa-44b2dae53f17', 'Karya Tani Shop akan segera launching', 'unread', '2024-12-02 14:09:34', '2024-12-02 14:09:34'),
('84cafb4e-c499-4ede-91d0-1c76c7552c36', 'd9b68e60-ad24-4599-9ca4-8840f921bb6e', 'Promo baru: diskonn, jenis: diskon, nilai: 10', 'unread', '2024-11-27 08:05:47', '2024-11-27 08:05:47'),
('851742c8-4648-4e18-9180-4619a1f6fa90', 'b169e082-02c1-4c3e-81fa-44b2dae53f17', 'Promo baru: promo 1212, jenis: diskon, nilai: 12', 'unread', '2024-11-28 15:52:18', '2024-11-28 15:52:18'),
('87774135-e3f0-4621-add9-4ae7487c048d', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'Karya tani shop', 'unread', '2024-11-27 07:34:18', '2024-11-27 07:34:18'),
('8bbdb7c4-025b-467b-be2c-2ba4e1779557', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'Karya Tani Membuka Cabang Baru di Bandung', 'unread', '2024-11-24 16:55:13', '2024-11-24 16:55:13'),
('90e72978-fabd-4507-aa41-f7d67f1808b6', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'Karya Tani Shop akan segera launching', 'unread', '2024-12-02 14:09:34', '2024-12-02 14:09:34'),
('9277f607-10c3-400e-a896-8ec858765a21', 'b169e082-02c1-4c3e-81fa-44b2dae53f17', 'Karya Tani Membuka Cabang Baru di Bandung', 'unread', '2024-11-24 16:55:13', '2024-11-24 16:55:13'),
('9f168653-83c0-44bd-8aaf-aa767cce2c52', 'd9b68e60-ad24-4599-9ca4-8840f921bb6e', 'Promo baru: Promo Awal Desember, jenis: diskon, nilai: 10', 'unread', '2024-12-02 14:15:06', '2024-12-02 14:15:06'),
('a8540362-65db-41da-a10b-4f51763f6c1b', 'd9b68e60-ad24-4599-9ca4-8840f921bb6e', 'Promo baru: promo 1212, jenis: diskon, nilai: 12', 'unread', '2024-11-28 15:52:19', '2024-11-28 15:52:19'),
('ac114efa-9084-493d-b1d3-7c265edc31d5', 'ef4862e0-513a-4812-82ed-4904caa44b4f', 'Promo baru: promo 1212, jenis: diskon, nilai: 12', 'unread', '2024-11-28 15:52:19', '2024-11-28 15:52:19'),
('b4e25a04-86bf-4532-bed4-0e32da696758', 'ccc09a87-abf9-4bf1-a097-9576336c0835', 'Promo baru: Promo Awal Desember, jenis: diskon, nilai: 10', 'unread', '2024-12-02 14:15:06', '2024-12-02 14:15:06'),
('b79e1dd1-ff6c-4a15-adb4-6b460bfca9bc', 'b169e082-02c1-4c3e-81fa-44b2dae53f17', 'Karya tani shop', 'unread', '2024-11-27 07:34:18', '2024-11-27 07:34:18'),
('ba671f80-d21d-4564-8e94-3b281d50effd', 'f75e5dc2-0d2d-4686-bd07-831f85053408', 'Karya Tani Shop akan segera launching', 'unread', '2024-12-02 14:09:35', '2024-12-02 14:09:35'),
('bb292b88-db09-47b0-89d2-91ffa33712f5', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'Promo baru: promo 1212, jenis: diskon, nilai: 12', 'unread', '2024-11-28 15:52:19', '2024-11-28 15:52:19'),
('be563130-bd80-4bc3-beee-6a1cac0a171a', 'b169e082-02c1-4c3e-81fa-44b2dae53f17', 'Segera hadir coming soon', 'unread', '2024-11-27 07:24:21', '2024-11-27 07:24:21'),
('bf572925-2620-47b6-bed9-8eb4c2a52f68', 'ccc09a87-abf9-4bf1-a097-9576336c0835', 'Karya Tani Shop akan segera launching', 'unread', '2024-12-02 14:09:34', '2024-12-02 14:09:34'),
('c9872a75-6e9b-469a-8e0b-a36c2be99dc4', 'b169e082-02c1-4c3e-81fa-44b2dae53f17', 'Promo baru: Promo Awal Desember, jenis: diskon, nilai: 10', 'unread', '2024-12-02 14:15:06', '2024-12-02 14:15:06'),
('ccf31f92-ab20-4f27-a1da-19c51085f136', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'Karya Tani Shop akan segera launching', 'read', '2024-12-02 14:09:33', '2024-12-02 14:10:20'),
('cd598732-592a-42ae-a31f-0b5f3999646b', 'ef4862e0-513a-4812-82ed-4904caa44b4f', 'Promo baru: Promo Awal Desember, jenis: diskon, nilai: 10', 'unread', '2024-12-02 14:15:06', '2024-12-02 14:15:06'),
('d0297fc1-28ef-4fb3-9ce5-50cba00ce208', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'Promo baru: promo ambyar, jenis: voucher, nilai: 1000', 'read', '2024-11-28 15:49:16', '2024-11-30 14:39:12'),
('d23209c7-ca78-429c-a93e-a9484370c5c7', 'ef4862e0-513a-4812-82ed-4904caa44b4f', 'Promo baru: Diskon November, jenis: voucher, nilai: 25', 'unread', '2024-11-24 16:44:52', '2024-11-24 16:44:52'),
('da4856ca-89a8-42d9-bd5f-f2ca461bcee9', 'd9b68e60-ad24-4599-9ca4-8840f921bb6e', 'Segera hadir coming soon', 'unread', '2024-11-27 07:24:21', '2024-11-27 07:24:21'),
('dcbe63e5-dde5-4f3a-a85f-0b2678f899d5', 'f75e5dc2-0d2d-4686-bd07-831f85053408', 'Promo baru: Promo Awal Desember, jenis: diskon, nilai: 10', 'unread', '2024-12-02 14:15:06', '2024-12-02 14:15:06'),
('e02ac47d-c228-44a5-8a5f-ad40f987d2af', 'ef4862e0-513a-4812-82ed-4904caa44b4f', 'Promo baru: 12.12, jenis: diskon, nilai: 12', 'unread', '2024-11-27 07:47:14', '2024-11-27 07:47:14'),
('e21d6db6-f347-4e5c-ac69-4f21be05a55d', 'd9b68e60-ad24-4599-9ca4-8840f921bb6e', 'Promo baru: Diskon November, jenis: voucher, nilai: 25', 'unread', '2024-11-24 16:44:52', '2024-11-24 16:44:52'),
('e4cbb614-f2d2-4524-83d9-f4d4d5022542', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'Promo baru: diskonn, jenis: diskon, nilai: 10', 'unread', '2024-11-27 08:05:47', '2024-11-27 08:05:47'),
('f4e17af4-a49d-4799-9cac-9f6f9d27e826', 'b169e082-02c1-4c3e-81fa-44b2dae53f17', 'Promo baru: Diskon November, jenis: voucher, nilai: 25', 'unread', '2024-11-24 16:44:52', '2024-11-24 16:44:52'),
('f59c301a-29b8-4058-abb8-9ed69058c2ae', 'ef4862e0-513a-4812-82ed-4904caa44b4f', 'Karya Tani Membuka Cabang Baru di Bandung', 'unread', '2024-11-24 16:55:13', '2024-11-24 16:55:13'),
('f894b125-f72f-412a-973a-f448f7728f25', 'ef4862e0-513a-4812-82ed-4904caa44b4f', 'Karya Tani Shop akan segera launching', 'unread', '2024-12-02 14:09:35', '2024-12-02 14:09:35'),
('fc00e786-6e40-4dbf-8480-72554922c45e', 'ef4862e0-513a-4812-82ed-4904caa44b4f', 'Promo baru: Diskon Super, jenis: diskon, nilai: 25', 'unread', '2024-11-24 16:48:24', '2024-11-24 16:48:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order`
--

CREATE TABLE `order` (
  `order_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `tgl_order` date NOT NULL,
  `status_order` enum('pending','proses','selesai','batal') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `order`
--

INSERT INTO `order` (`order_id`, `user_id`, `tgl_order`, `status_order`, `created_at`, `updated_at`, `deleted_at`) VALUES
('027069f7-32d6-4859-b9a2-eb3d42106722', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-12-02', 'pending', '2024-12-02 02:17:14', '2024-12-02 02:17:14', NULL),
('02fcfc57-40bd-421b-9d6a-2f4090773b29', 'b21e39c3-e00d-414f-8d55-01b87602c587', '2024-11-23', 'selesai', '2024-11-23 12:40:15', '2024-11-24 15:02:48', NULL),
('153ca5ca-0f18-4b88-9bf5-2455fe173768', 'b21e39c3-e00d-414f-8d55-01b87602c587', '2024-12-03', 'selesai', '2024-12-03 09:00:12', '2024-12-03 09:00:12', NULL),
('15a45446-b96a-4d57-a94c-2fdd7130e094', 'b21e39c3-e00d-414f-8d55-01b87602c587', '2024-12-03', 'pending', '2024-12-03 09:07:15', '2024-12-03 09:07:15', NULL),
('18c5b673-acd3-47da-86fe-4d9f20078a79', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-11-25', 'selesai', '2024-11-25 07:14:30', '2024-11-26 15:39:02', NULL),
('1aaa618b-d92c-4fe4-b46a-809da3fde07d', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-12-03', 'pending', '2024-12-03 09:51:54', '2024-12-03 09:51:54', NULL),
('1b2bcdce-854a-4ca8-a841-113425a518a3', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-12-03', 'pending', '2024-12-03 10:23:18', '2024-12-03 10:23:18', NULL),
('1e150327-cc5d-400a-857d-aaea766bcfb2', 'b21e39c3-e00d-414f-8d55-01b87602c587', '2024-11-23', 'pending', '2024-11-23 06:42:02', '2024-11-23 06:42:02', NULL),
('20f26c60-500e-4514-9124-00c9779b0693', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-12-03', 'pending', '2024-12-03 10:09:52', '2024-12-03 10:09:52', NULL),
('2e869a2d-57ac-4261-acf4-498f6ab68e12', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-12-12', 'pending', '2024-12-12 07:22:26', '2024-12-12 07:22:26', NULL),
('41fcc9ea-d9a8-4a2c-b22a-e607827f6138', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-12-12', 'pending', '2024-12-12 07:19:15', '2024-12-12 07:19:15', NULL),
('4329ee6c-2edb-4da5-b022-8de842f7c183', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-12-03', 'pending', '2024-12-03 10:09:52', '2024-12-03 10:09:52', NULL),
('4ef502b9-d8c7-4d04-87cd-a5f5e319db81', 'b21e39c3-e00d-414f-8d55-01b87602c587', '2024-11-25', 'pending', '2024-11-25 06:59:33', '2024-11-27 03:52:32', '2024-11-27 03:52:32'),
('55f3d985-6a0b-4be6-a428-206a7f24b34d', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-12-03', 'pending', '2024-12-03 09:57:26', '2024-12-03 09:57:26', NULL),
('583b0cc9-81d0-420a-a422-95f8fb57ef12', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-12-12', 'pending', '2024-12-12 07:20:10', '2024-12-12 07:20:10', NULL),
('5b6580a0-cb0c-4a15-9854-521040b3a717', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-12-03', 'pending', '2024-12-03 09:54:46', '2024-12-03 09:54:46', NULL),
('6e9a679d-57d3-4d12-bdf0-92448266dd93', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-12-03', 'pending', '2024-12-03 10:41:39', '2024-12-03 10:41:39', NULL),
('70cff7bd-1501-4ee2-8f06-340b3157bb3d', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-12-02', 'pending', '2024-12-02 13:50:03', '2024-12-02 13:53:11', '2024-12-02 13:53:11'),
('74d8cc7b-8931-451c-9d9c-ccc31858b2d9', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-12-03', 'pending', '2024-12-03 09:33:07', '2024-12-03 09:33:07', NULL),
('7eea7a64-b45b-4391-996b-8c86b86e9e84', 'b21e39c3-e00d-414f-8d55-01b87602c587', '2024-11-23', 'pending', '2024-11-23 07:10:40', '2024-11-24 15:04:03', '2024-11-24 15:04:03'),
('87fbfc22-f4a2-4b33-91fd-0f0f68bd6d9c', 'ef4862e0-513a-4812-82ed-4904caa44b4f', '2024-11-24', 'pending', '2024-11-24 14:57:39', '2024-11-24 14:57:39', NULL),
('889937f0-c94d-4c87-a945-c197f1354aa2', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-12-03', 'pending', '2024-12-03 09:57:56', '2024-12-03 09:57:56', NULL),
('949efe37-6c57-4556-9172-09d89764697c', 'b21e39c3-e00d-414f-8d55-01b87602c587', '2024-12-03', 'pending', '2024-12-03 09:16:57', '2024-12-03 09:16:57', NULL),
('9d840b2a-93c0-474e-b4ce-4d0532295fac', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-12-03', 'pending', '2024-12-03 10:28:18', '2024-12-03 10:28:18', NULL),
('ab0e07aa-08c6-49d8-b441-8ad26a09201b', 'b21e39c3-e00d-414f-8d55-01b87602c587', '2024-12-03', 'pending', '2024-12-03 09:08:30', '2024-12-03 09:08:30', NULL),
('af5645a7-0bd8-4ff4-8e74-02557f06ae63', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-11-25', 'pending', '2024-11-25 07:28:08', '2024-11-25 07:28:08', NULL),
('afbffad4-5f51-4489-922e-9bb821b81a6c', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-12-03', 'pending', '2024-12-03 10:04:01', '2024-12-03 10:04:01', NULL),
('b030cbd4-de44-4391-853f-09f272d0e761', 'b21e39c3-e00d-414f-8d55-01b87602c587', '2024-11-23', 'pending', '2024-11-23 05:50:55', '2024-11-23 05:50:55', NULL),
('c3a830fd-fea3-486a-8e5d-f6d4d24b2cf5', 'ef4862e0-513a-4812-82ed-4904caa44b4f', '2024-11-24', 'selesai', '2024-11-24 08:35:45', '2024-11-24 11:49:31', NULL),
('c3bf2604-88a0-4554-8ca5-f06ca3dc9bb7', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-11-28', 'pending', '2024-11-28 03:58:48', '2024-11-28 03:58:48', NULL),
('d0924f4c-c100-46e1-b196-a2b3c6b7d870', 'b21e39c3-e00d-414f-8d55-01b87602c587', '2024-12-03', 'pending', '2024-12-03 09:06:39', '2024-12-03 09:06:39', NULL),
('d1707f53-374e-4acb-be29-af8157dabaa3', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-12-03', 'pending', '2024-12-03 10:36:47', '2024-12-03 10:36:47', NULL),
('dbfb53be-9e56-4176-9401-9a1f8e6a9b08', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-12-03', 'pending', '2024-12-03 10:18:32', '2024-12-03 10:18:32', NULL),
('e04029fb-f67c-42ab-a41e-56eb2a0ed47d', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-12-03', 'pending', '2024-12-03 10:33:42', '2024-12-03 10:33:42', NULL),
('e7f62878-d321-43cc-8c6c-86f76780be1b', 'b21e39c3-e00d-414f-8d55-01b87602c587', '2024-11-23', 'pending', '2024-11-23 07:14:50', '2024-11-23 07:14:50', NULL),
('f1ab2300-4b5f-40ef-b82c-a35e6f01c513', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-11-28', 'pending', '2024-11-28 04:07:12', '2024-11-28 04:07:12', NULL),
('fcf57f40-7bdd-4e4b-9d2b-c1bd7120d6c8', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', '2024-11-28', 'pending', '2024-11-28 07:24:35', '2024-11-28 07:24:35', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_details`
--

CREATE TABLE `order_details` (
  `detail_id` char(36) NOT NULL,
  `order_id` char(36) NOT NULL,
  `produk_id` char(36) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `order_details`
--

INSERT INTO `order_details` (`detail_id`, `order_id`, `produk_id`, `quantity`, `created_at`, `updated_at`) VALUES
('0105a7d8-043f-4639-bf18-64f906eb8d29', 'd0924f4c-c100-46e1-b196-a2b3c6b7d870', '66c620bb-0ae1-4b30-805f-185e4462555a', 3, '2024-12-03 09:06:39', '2024-12-03 09:06:39'),
('06eee830-ac3b-4e27-b2b5-9fc11911e94d', '15a45446-b96a-4d57-a94c-2fdd7130e094', '66c620bb-0ae1-4b30-805f-185e4462555a', 3, '2024-12-03 09:07:15', '2024-12-03 09:07:15'),
('1b449a2c-ff0d-4b41-84fd-c3773bcf2b91', '6e9a679d-57d3-4d12-bdf0-92448266dd93', '29398d11-f66e-4378-9a31-d91c46966533', 2, '2024-12-03 10:41:39', '2024-12-03 10:41:39'),
('34f37779-ba7e-4c1f-bd24-e753b5b7f6ae', '1aaa618b-d92c-4fe4-b46a-809da3fde07d', '3d45030b-f21a-4e73-ac7d-a79da613a356', 3, '2024-12-03 09:51:54', '2024-12-03 09:51:54'),
('3a188e4e-f828-4f46-bdcd-d5ba04768822', 'fcf57f40-7bdd-4e4b-9d2b-c1bd7120d6c8', '3d45030b-f21a-4e73-ac7d-a79da613a356', 3, '2024-11-28 07:24:35', '2024-11-28 07:24:35'),
('3ce54bda-7802-43c3-abcc-604aed67621b', 'c3a830fd-fea3-486a-8e5d-f6d4d24b2cf5', 'b224556e-6a44-4dfa-8cad-63ff1616a95f', 2, '2024-11-24 08:35:46', '2024-11-24 08:35:46'),
('3d255166-ea59-4634-9402-ce54de4bee22', '2e869a2d-57ac-4261-acf4-498f6ab68e12', '7a6a6dcb-353c-4584-b094-0279683845e2', 1, '2024-12-12 07:22:26', '2024-12-12 07:22:26'),
('4668a373-cb70-44f2-945f-be64e9da5a4e', '1b2bcdce-854a-4ca8-a841-113425a518a3', '66c620bb-0ae1-4b30-805f-185e4462555a', 1, '2024-12-03 10:23:19', '2024-12-03 10:23:19'),
('4f837b75-f805-48da-992d-1745c9a48358', 'f1ab2300-4b5f-40ef-b82c-a35e6f01c513', '66c620bb-0ae1-4b30-805f-185e4462555a', 1, '2024-11-28 04:07:12', '2024-11-28 04:07:12'),
('5666b0dd-4518-49a2-b494-56d254a678b3', '027069f7-32d6-4859-b9a2-eb3d42106722', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, '2024-12-02 02:17:14', '2024-12-02 02:17:14'),
('7a1dca21-8b98-46c0-88f0-aea0ea28678b', '949efe37-6c57-4556-9172-09d89764697c', '66c620bb-0ae1-4b30-805f-185e4462555a', 3, '2024-12-03 09:16:57', '2024-12-03 09:16:57'),
('7a77c95b-2c17-4fba-8938-6dc86dc1c4d3', 'd1707f53-374e-4acb-be29-af8157dabaa3', '66c620bb-0ae1-4b30-805f-185e4462555a', 1, '2024-12-03 10:36:47', '2024-12-03 10:36:47'),
('81fcb3d5-068d-465d-a176-24d145f8a0aa', '7eea7a64-b45b-4391-996b-8c86b86e9e84', 'b224556e-6a44-4dfa-8cad-63ff1616a95f', 1, '2024-11-23 07:10:40', '2024-11-23 07:10:40'),
('828eafc2-9a35-47ec-aa39-2310d366757e', '9d840b2a-93c0-474e-b4ce-4d0532295fac', '66c620bb-0ae1-4b30-805f-185e4462555a', 1, '2024-12-03 10:28:18', '2024-12-03 10:28:18'),
('858fe039-53d8-4748-b283-e8f3276ee68d', 'ab0e07aa-08c6-49d8-b441-8ad26a09201b', '66c620bb-0ae1-4b30-805f-185e4462555a', 3, '2024-12-03 09:08:30', '2024-12-03 09:08:30'),
('8ad16836-9660-4565-98c5-54a751a73b8f', '74d8cc7b-8931-451c-9d9c-ccc31858b2d9', '3d45030b-f21a-4e73-ac7d-a79da613a356', 3, '2024-12-03 09:33:07', '2024-12-03 09:33:07'),
('99cbd591-30e3-4119-bc2e-d70faba0d86e', '41fcc9ea-d9a8-4a2c-b22a-e607827f6138', '326d3a50-6212-40d2-9453-d775a0ae700d', 1, '2024-12-12 07:19:15', '2024-12-12 07:19:15'),
('9a235c81-b11b-410a-8e7c-88986f47472d', '87fbfc22-f4a2-4b33-91fd-0f0f68bd6d9c', 'b224556e-6a44-4dfa-8cad-63ff1616a95f', 2, '2024-11-24 14:57:39', '2024-11-24 14:57:39'),
('cf513a0b-300c-4db0-8f7a-46304facb242', '153ca5ca-0f18-4b88-9bf5-2455fe173768', '66c620bb-0ae1-4b30-805f-185e4462555a', 3, '2024-12-03 09:00:13', '2024-12-03 09:00:13'),
('d0ea2301-2451-40f6-8367-ea95789f5a60', 'fcf57f40-7bdd-4e4b-9d2b-c1bd7120d6c8', '29398d11-f66e-4378-9a31-d91c46966533', 2, '2024-11-28 07:24:35', '2024-11-28 07:24:35'),
('d6fbea46-c891-4ae3-8ad9-131963dd6fac', '41fcc9ea-d9a8-4a2c-b22a-e607827f6138', '29398d11-f66e-4378-9a31-d91c46966533', 6, '2024-12-12 07:19:15', '2024-12-12 07:19:15'),
('e2ed6454-3f3d-426f-a661-e0ba00932086', 'e04029fb-f67c-42ab-a41e-56eb2a0ed47d', '66c620bb-0ae1-4b30-805f-185e4462555a', 1, '2024-12-03 10:33:42', '2024-12-03 10:33:42'),
('f0912353-8840-4b2b-8d2c-09d15af33721', '5b6580a0-cb0c-4a15-9854-521040b3a717', '3d45030b-f21a-4e73-ac7d-a79da613a356', 3, '2024-12-03 09:54:46', '2024-12-03 09:54:46'),
('f637be18-63db-4622-93ff-de33b600d558', 'c3bf2604-88a0-4554-8ca5-f06ca3dc9bb7', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, '2024-11-28 03:58:48', '2024-11-28 03:58:48');

--
-- Trigger `order_details`
--
DELIMITER $$
CREATE TRIGGER `reduce_stock_after_order` AFTER INSERT ON `order_details` FOR EACH ROW BEGIN
    DECLARE current_stock INT;

    -- Ambil stok saat ini dari tabel produk
    SELECT stok INTO current_stock
    FROM produk
    WHERE produk_id = NEW.produk_id;

    -- Validasi: stok tidak boleh kurang dari jumlah yang dipesan
    IF current_stock < NEW.quantity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stok tidak mencukupi untuk produk ini.';
    END IF;

    -- Kurangi stok produk sesuai jumlah yang dipesan
    UPDATE produk
    SET stok = stok - NEW.quantity
    WHERE produk_id = NEW.produk_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `otps`
--

CREATE TABLE `otps` (
  `otp_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `otp_code` varchar(255) NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `otp_expiration` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `otps`
--

INSERT INTO `otps` (`otp_id`, `user_id`, `otp_code`, `purpose`, `otp_expiration`, `created_at`, `updated_at`, `deleted_at`) VALUES
('10acbed0-aa3c-4fa9-b924-c886f0db41e0', 'ef4862e0-513a-4812-82ed-4904caa44b4f', '818983', 'email_verification', '2024-11-22 08:09:48', '2024-11-22 07:59:48', '2024-11-22 08:00:19', '2024-11-22 08:00:19'),
('20c8182e-3035-41d6-ba5a-f4dbde4e647d', 'b21e39c3-e00d-414f-8d55-01b87602c587', '871677', 'password_reset', '2024-12-01 11:55:49', '2024-12-01 11:45:49', '2024-12-01 11:45:49', NULL),
('277be1ce-529a-47ac-b0b9-212da2dfd0fa', 'b21e39c3-e00d-414f-8d55-01b87602c587', '149712', 'password_reset', '2024-11-20 03:39:26', '2024-11-20 03:29:26', '2024-11-20 03:30:57', '2024-11-20 03:30:57'),
('364cd5b0-23f8-4293-889a-b4d007cd958c', 'b21e39c3-e00d-414f-8d55-01b87602c587', '400475', 'email_verification', '2024-11-20 03:13:49', '2024-11-20 03:03:49', '2024-11-20 03:05:29', '2024-11-20 03:05:29'),
('7b723a9a-f495-4a52-9b6d-97d66385defd', 'b21e39c3-e00d-414f-8d55-01b87602c587', '891254', 'password_reset', '2024-12-01 12:01:06', '2024-12-01 11:51:06', '2024-12-01 11:52:11', '2024-12-01 11:52:11'),
('802edda5-2140-4f12-a643-9aa5d02db854', 'f75e5dc2-0d2d-4686-bd07-831f85053408', '531261', 'email_verification', '2024-12-02 02:17:10', '2024-12-02 02:07:10', '2024-12-02 02:08:37', '2024-12-02 02:08:37'),
('a9d4477b-9e78-4552-8efb-c85bdfa743a4', 'b21e39c3-e00d-414f-8d55-01b87602c587', '372557', 'password_reset', '2024-11-29 07:31:59', '2024-11-29 07:21:59', '2024-11-29 07:21:59', NULL),
('e9bf842f-ce26-4861-a0d5-5ceb07d9d717', 'b21e39c3-e00d-414f-8d55-01b87602c587', '801556', 'password_reset', '2024-11-22 07:20:57', '2024-11-22 07:10:57', '2024-11-22 07:10:57', NULL),
('efac144a-78c0-4386-96d1-070f89d9d087', 'f75e5dc2-0d2d-4686-bd07-831f85053408', '281721', 'password_reset', '2024-12-02 02:19:18', '2024-12-02 02:09:18', '2024-12-02 02:10:02', '2024-12-02 02:10:02'),
('f275f672-545d-46c7-b54a-4a779664d36b', 'b21e39c3-e00d-414f-8d55-01b87602c587', '583192', 'password_reset', '2024-11-29 07:27:38', '2024-11-29 07:17:38', '2024-11-29 07:17:38', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `pembayaran_id` char(36) NOT NULL,
  `nota_belanja_id` char(36) NOT NULL,
  `jumlah_bayar` decimal(10,2) NOT NULL,
  `kembalian` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'roles.manage', 'api', '2024-11-21 04:11:02', '2024-11-21 04:11:02'),
(2, 'roles.view', 'api', '2024-11-21 04:16:29', '2024-11-21 04:16:29'),
(3, 'role-list', 'api', '2024-11-21 05:19:47', '2024-11-21 05:19:47'),
(4, 'role-create', 'api', '2024-11-21 05:19:47', '2024-11-21 05:19:47'),
(5, 'role-edit', 'api', '2024-11-21 05:19:47', '2024-11-21 05:19:47'),
(6, 'role-delete', 'api', '2024-11-21 05:19:47', '2024-11-21 05:19:47'),
(7, 'user-list', 'api', '2024-11-21 05:19:47', '2024-11-21 05:19:47'),
(8, 'user-create', 'api', '2024-11-21 05:19:47', '2024-11-21 05:19:47'),
(9, 'user-edit', 'api', '2024-11-21 05:19:47', '2024-11-21 05:19:47'),
(10, 'user-delete', 'api', '2024-11-21 05:19:47', '2024-11-21 05:19:47'),
(11, 'users.manage', 'api', '2024-11-21 10:13:26', '2024-11-21 10:13:26'),
(12, 'role-add-permissions', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(13, 'log-activity', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(14, 'kategori-list', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(15, 'kategori-show', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(16, 'kategori-create', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(17, 'kategori-edit', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(18, 'kategori-delete', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(19, 'promo-list', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(20, 'promo-show', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(21, 'promo-create', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(22, 'promo-edit', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(23, 'promo-delete', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(24, 'produk-list', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(25, 'produk-show', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(26, 'produk-create', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(27, 'produk-edit', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(28, 'produk-delete', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(29, 'cart-list', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(30, 'cart-add', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(31, 'cart-edit', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(32, 'cart-delete', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(33, 'order-list', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(34, 'order-show', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(35, 'order-create', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(36, 'order-edit', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(37, 'order-delete', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(38, 'transaksi-list', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(39, 'transaksi-show', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(40, 'transaksi-edit', 'api', '2024-11-23 13:14:29', '2024-11-23 13:14:29'),
(41, 'review-create', 'api', '2024-11-25 04:40:42', '2024-11-25 04:40:42'),
(42, 'review-list', 'api', '2024-11-25 04:40:42', '2024-11-25 04:40:42'),
(43, 'review-show', 'api', '2024-11-25 04:40:42', '2024-11-25 04:40:42'),
(44, 'review-edit', 'api', '2024-11-25 04:40:42', '2024-11-25 04:40:42'),
(45, 'review-delete', 'api', '2024-11-25 04:40:42', '2024-11-25 04:40:42'),
(46, 'notifications-list', 'api', '2024-11-25 04:40:42', '2024-11-25 04:40:42'),
(47, 'notifications-markasred', 'api', '2024-11-25 04:40:42', '2024-11-25 04:40:42'),
(48, 'notifications-create', 'api', '2024-11-25 04:40:42', '2024-11-25 04:40:42'),
(49, 'report-filter', 'api', '2024-11-25 04:40:42', '2024-11-25 04:40:42'),
(50, 'report-list', 'api', '2024-11-25 04:40:42', '2024-11-25 04:40:42'),
(51, 'profile-edit', 'api', '2024-11-25 04:40:42', '2024-11-25 04:40:42'),
(52, 'profile-show', 'api', '2024-11-25 04:40:43', '2024-11-25 04:40:43'),
(53, 'address-show', 'api', '2024-11-25 04:40:43', '2024-11-25 04:40:43'),
(54, 'address-edit', 'api', '2024-11-25 04:40:43', '2024-11-25 04:40:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `produk_id` char(36) NOT NULL,
  `kategori_id` char(36) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `merk` varchar(255) DEFAULT NULL,
  `deskripsi_produk` text DEFAULT NULL,
  `berat` decimal(8,2) NOT NULL,
  `harga_satuan` decimal(10,2) NOT NULL,
  `stok` int(11) NOT NULL DEFAULT 0,
  `status_produk` enum('aktif','nonaktif') NOT NULL DEFAULT 'aktif',
  `gambar` varchar(255) DEFAULT NULL,
  `promo_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `after_diskon` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`produk_id`, `kategori_id`, `nama_produk`, `merk`, `deskripsi_produk`, `berat`, `harga_satuan`, `stok`, `status_produk`, `gambar`, `promo_id`, `created_at`, `updated_at`, `deleted_at`, `after_diskon`) VALUES
('2263d2bb-1834-4649-bf76-699eae6033f2', 'b5b8abb7-8ab7-4407-96d6-2ca680d8b3ae', 'Pupuk Urea', 'Pak Tani', 'Pupuk premium berkualitas', 5.00, 50000.00, 100, 'aktif', 'storage/produk/WlAXHQFfnYsCyC3py4GKyD1GTTvo24yRjzCBRdoa.jpg', NULL, '2024-11-27 09:26:27', '2024-12-13 05:46:04', NULL, 10000.00),
('29398d11-f66e-4378-9a31-d91c46966533', 'b5b8abb7-8ab7-4407-96d6-2ca680d8b3ae', 'Pupuk Organik Cair', 'GDM', 'Pupuk Organik Cair berkualitas premium', 1.00, 10000.00, 300, 'aktif', 'storage/produk/k5FBSuKClVtFp5BzZNnNJSFIvTsUe3jP8ItoW2OP.jpg', '2328a556-6e99-47f6-8370-7ac9f8b663cf', '2024-11-27 09:05:21', '2024-12-13 05:47:05', NULL, 50000.00),
('326d3a50-6212-40d2-9453-d775a0ae700d', 'b5b8abb7-8ab7-4407-96d6-2ca680d8b3ae', 'Pupuk NPK 12.12.17.2', 'Pak Tani', 'Pupuk premium berkualitas', 5.00, 50000.00, 100, 'aktif', 'storage/produk/szQKUOZbo45RtWQybQNOFNEWf89VpbvqKi1VM3cZ.jpg', '7756db6b-94f0-424c-9743-a4d60301d699', '2024-11-27 09:39:22', '2024-12-13 05:47:25', NULL, 9.00),
('3d45030b-f21a-4e73-ac7d-a79da613a356', 'b5b8abb7-8ab7-4407-96d6-2ca680d8b3ae', 'Herbisida Sutrazin', 'Herbisida', 'Pestisida berkualitas', 5.00, 12.00, 100, 'aktif', 'storage/produk/QyO9Glids1QNJo6I1vSLEXnE9wmFsBpRTLeiO3cT.jpg', '7756db6b-94f0-424c-9743-a4d60301d699', '2024-11-27 09:39:17', '2024-12-13 05:47:42', NULL, 9.00),
('66c620bb-0ae1-4b30-805f-185e4462555a', 'b5b8abb7-8ab7-4407-96d6-2ca680d8b3ae', 'Benih Prima', 'Pak Tani', 'Benih padi berkualitas', 1.50, 500000.00, 30, 'aktif', 'storage/produk/TfjWUlnLsfRq2hKuWugrsfJjJRRHYtqJa8i4w9yn.jpg', NULL, '2024-11-23 04:27:52', '2024-12-13 05:47:55', NULL, 0.00),
('6758a6b2-f4e9-4d0f-9900-4b9a98710aad', 'b5b8abb7-8ab7-4407-96d6-2ca680d8b3ae', 'Pupuk NPK 15.15.15', 'Pak Tani', 'Pupuk berkualitas premium', 1.50, 100000.00, 50, 'aktif', 'storage/produk/EkRwuHBvKqJLUUf1CYM4f3r3rx8T8jzDWqTx7i5e.jpg', '2328a556-6e99-47f6-8370-7ac9f8b663cf', '2024-11-27 09:03:55', '2024-12-13 05:49:01', NULL, 0.00),
('7a6a6dcb-353c-4584-b094-0279683845e2', '4609bf91-b627-4202-84aa-d4e6b4c915d9', 'Kompos BPI', 'Kompos BPI', 'Pupuk Kompos berkualitas', 1.00, 1000.00, 11, 'aktif', 'storage/produk/produk7.jpg', NULL, '2024-11-29 15:16:29', '2024-11-29 15:16:29', NULL, 1000.00),
('b224556e-6a44-4dfa-8cad-63ff1616a95f', 'b5b8abb7-8ab7-4407-96d6-2ca680d8b3ae', 'Pupuk Kandang BPI', 'BPI', 'Pupuk kandang premium', 1.50, 1.00, 43, 'aktif', 'storage/produk/produk8.jpg', NULL, '2024-11-23 05:40:20', '2024-11-23 05:40:20', NULL, 0.00),
('c370eb78-577a-4b78-adfc-4ce01be4718b', 'b5b8abb7-8ab7-4407-96d6-2ca680d8b3ae', 'Pupuk Organik Granul', 'Bintang Kuda Laut', 'Pupuk organik kualitas premium', 1.00, 10000.00, 11, 'aktif', 'storage/produk/produk9.jpg', '2328a556-6e99-47f6-8370-7ac9f8b663cf', '2024-12-02 03:12:24', '2024-12-02 03:12:24', NULL, 7950.00),
('d4f5be36-3849-4b33-b6f5-fdc23eae1b55', 'b5b8abb7-8ab7-4407-96d6-2ca680d8b3ae', 'Vermisompost', 'Geek Farmer', 'Pupuk kompos berkualitas', 10.00, 100000.00, 10, 'aktif', 'storage/produk/produk10.jpg', '1e49a7a4-fb29-4260-845b-94ceac590c56', '2024-11-27 08:59:26', '2024-11-27 08:59:26', NULL, 0.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk_item`
--

CREATE TABLE `produk_item` (
  `produk_item_id` char(36) NOT NULL,
  `order_id` char(36) NOT NULL,
  `produk_id` char(36) NOT NULL,
  `kuantitas` int(11) NOT NULL DEFAULT 1,
  `harga_satuan` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `produk_item`
--

INSERT INTO `produk_item` (`produk_item_id`, `order_id`, `produk_id`, `kuantitas`, `harga_satuan`, `subtotal`, `deleted_at`, `created_at`, `updated_at`) VALUES
('0b292111-c092-4897-b378-ba631734701e', '41fcc9ea-d9a8-4a2c-b22a-e607827f6138', '29398d11-f66e-4378-9a31-d91c46966533', 6, 7950.00, 47700.00, NULL, '2024-12-12 07:19:15', '2024-12-12 07:19:15'),
('16a7c904-6538-453a-875c-ae7591444952', '2e869a2d-57ac-4261-acf4-498f6ab68e12', '7a6a6dcb-353c-4584-b094-0279683845e2', 1, 1000.00, 1000.00, NULL, '2024-12-12 07:22:26', '2024-12-12 07:22:26'),
('24b9a20b-5942-42aa-97fc-2467ffd57161', '1b2bcdce-854a-4ca8-a841-113425a518a3', '66c620bb-0ae1-4b30-805f-185e4462555a', 1, 500000.00, 500000.00, NULL, '2024-12-03 10:23:19', '2024-12-03 10:23:19'),
('29729b72-fe86-4c9a-9358-485850185396', '74d8cc7b-8931-451c-9d9c-ccc31858b2d9', '3d45030b-f21a-4e73-ac7d-a79da613a356', 3, 9.00, 27.00, NULL, '2024-12-03 09:33:07', '2024-12-03 09:33:07'),
('3a91c265-a5c4-43c9-87b9-06b6367ca6da', 'e04029fb-f67c-42ab-a41e-56eb2a0ed47d', '66c620bb-0ae1-4b30-805f-185e4462555a', 1, 500000.00, 500000.00, NULL, '2024-12-03 10:33:43', '2024-12-03 10:33:43'),
('3b8de54c-864d-41e2-bb9a-2ddeb78c3856', '153ca5ca-0f18-4b88-9bf5-2455fe173768', '66c620bb-0ae1-4b30-805f-185e4462555a', 3, 500000.00, 1500000.00, NULL, '2024-12-03 09:00:13', '2024-12-03 09:00:13'),
('403bff67-b9d4-4a89-8b85-ebaa3403437b', '15a45446-b96a-4d57-a94c-2fdd7130e094', '66c620bb-0ae1-4b30-805f-185e4462555a', 3, 500000.00, 1500000.00, NULL, '2024-12-03 09:07:15', '2024-12-03 09:07:15'),
('4e21ce53-ce8b-4a7f-9f40-573e614325d8', '6e9a679d-57d3-4d12-bdf0-92448266dd93', '29398d11-f66e-4378-9a31-d91c46966533', 2, 79500.00, 159000.00, NULL, '2024-12-03 10:41:39', '2024-12-03 10:41:39'),
('6fbd66e7-fd33-4386-9f82-e1fa8e60f245', 'f1ab2300-4b5f-40ef-b82c-a35e6f01c513', '66c620bb-0ae1-4b30-805f-185e4462555a', 1, 500000.00, 500000.00, NULL, '2024-11-28 04:07:12', '2024-11-28 04:07:12'),
('75659919-3a12-4c2c-a219-32c212ba2241', 'fcf57f40-7bdd-4e4b-9d2b-c1bd7120d6c8', '29398d11-f66e-4378-9a31-d91c46966533', 2, 79500.00, 159000.00, NULL, '2024-11-28 07:24:35', '2024-11-28 07:24:35'),
('7a1eda3c-23b9-497f-9668-e2b9ffa5dc32', '5b6580a0-cb0c-4a15-9854-521040b3a717', '3d45030b-f21a-4e73-ac7d-a79da613a356', 3, 9.00, 27.00, NULL, '2024-12-03 09:54:46', '2024-12-03 09:54:46'),
('7cf25051-1cfd-495b-811d-71ed3a23b494', 'd0924f4c-c100-46e1-b196-a2b3c6b7d870', '66c620bb-0ae1-4b30-805f-185e4462555a', 3, 500000.00, 1500000.00, NULL, '2024-12-03 09:06:39', '2024-12-03 09:06:39'),
('80ed6e8c-67c4-462a-a127-d033809f765d', '949efe37-6c57-4556-9172-09d89764697c', '66c620bb-0ae1-4b30-805f-185e4462555a', 3, 500000.00, 1500000.00, NULL, '2024-12-03 09:16:57', '2024-12-03 09:16:57'),
('a3d8a903-71a9-4a43-bf2a-aee7d3f575aa', 'ab0e07aa-08c6-49d8-b441-8ad26a09201b', '66c620bb-0ae1-4b30-805f-185e4462555a', 3, 500000.00, 1500000.00, NULL, '2024-12-03 09:08:30', '2024-12-03 09:08:30'),
('afc45c8f-3db8-48f5-b412-713d83159673', 'fcf57f40-7bdd-4e4b-9d2b-c1bd7120d6c8', '3d45030b-f21a-4e73-ac7d-a79da613a356', 3, 9.00, 27.00, NULL, '2024-11-28 07:24:35', '2024-11-28 07:24:35'),
('b1f9540a-e2da-41c8-9d6e-188cadd5eb9b', '9d840b2a-93c0-474e-b4ce-4d0532295fac', '66c620bb-0ae1-4b30-805f-185e4462555a', 1, 500000.00, 500000.00, NULL, '2024-12-03 10:28:18', '2024-12-03 10:28:18'),
('b8c92ab9-b808-489b-b6a7-1e3de00d1533', '41fcc9ea-d9a8-4a2c-b22a-e607827f6138', '326d3a50-6212-40d2-9453-d775a0ae700d', 1, 9.00, 9.00, NULL, '2024-12-12 07:19:15', '2024-12-12 07:19:15'),
('c20d35f8-dc06-4284-99ad-dc8dc71f74b8', 'd1707f53-374e-4acb-be29-af8157dabaa3', '66c620bb-0ae1-4b30-805f-185e4462555a', 1, 500000.00, 500000.00, NULL, '2024-12-03 10:36:47', '2024-12-03 10:36:47'),
('cd979e57-9270-4c02-aa56-37c8e8b4b5b7', '1aaa618b-d92c-4fe4-b46a-809da3fde07d', '3d45030b-f21a-4e73-ac7d-a79da613a356', 3, 9.00, 27.00, NULL, '2024-12-03 09:51:54', '2024-12-03 09:51:54'),
('e294451f-1f17-48b4-9bcc-169fc4919962', '027069f7-32d6-4859-b9a2-eb3d42106722', '2263d2bb-1834-4649-bf76-699eae6033f2', 1, 10000.00, 10000.00, NULL, '2024-12-02 02:17:14', '2024-12-02 02:17:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `promo`
--

CREATE TABLE `promo` (
  `promo_id` char(36) NOT NULL,
  `nama_promo` varchar(255) NOT NULL,
  `jenis_promo` enum('diskon','voucher') NOT NULL,
  `nilai_promo` decimal(10,2) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_berakhir` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `kode_voucher` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `promo`
--

INSERT INTO `promo` (`promo_id`, `nama_promo`, `jenis_promo`, `nilai_promo`, `tgl_mulai`, `tgl_berakhir`, `created_at`, `updated_at`, `deleted_at`, `kode_voucher`) VALUES
('1cb5a46b-273e-4c6b-95a6-a9a1d98c4bfa', 'Summer Sale', 'voucher', 1000.00, '2024-11-25', '2024-12-25', '2024-11-24 16:16:48', '2024-11-24 16:31:47', '2024-11-24 16:31:47', 'summer16'),
('1e49a7a4-fb29-4260-845b-94ceac590c56', '12.12', 'diskon', 20.00, '2024-11-26', '2024-11-29', '2024-11-27 07:47:13', '2024-11-27 08:23:40', '2024-11-27 08:23:40', NULL),
('2328a556-6e99-47f6-8370-7ac9f8b663cf', 'Diskon Akhir Tahun', 'diskon', 20.50, '2024-11-01', '2024-12-31', '2024-11-22 15:21:58', '2024-11-22 15:21:58', NULL, NULL),
('5d4ce431-627c-4d44-af03-91f58bd1b33d', 'diskonn', 'diskon', 10.00, '2024-11-27', '2024-11-27', '2024-11-27 08:05:47', '2024-11-27 08:05:47', NULL, NULL),
('7756db6b-94f0-424c-9743-a4d60301d699', 'Diskon Super', 'diskon', 25.00, '2024-11-01', '2024-12-31', '2024-11-24 16:48:24', '2024-11-24 16:48:24', NULL, NULL),
('97390d83-6eed-4a23-ad2e-38c90dbfe60c', 'Promo Awal Desember', 'diskon', 20.00, '2024-12-01', '2024-12-05', '2024-12-02 14:15:06', '2024-12-02 14:16:04', '2024-12-02 14:16:04', NULL),
('aab5d8ae-2506-4fd2-a5b6-0685b5531a43', 'promo ambyar', 'voucher', 1000.00, '2024-11-27', '2024-11-29', '2024-11-28 15:49:16', '2024-11-28 15:49:31', '2024-11-28 15:49:31', 'ambyar'),
('f3096e10-865c-4d25-b498-a75b6ca99b56', 'promo 1212', 'diskon', 12.00, '2024-11-27', '2024-11-29', '2024-11-28 15:52:18', '2024-11-28 15:52:33', '2024-11-28 15:52:33', NULL),
('f9d8a9ea-3bda-49a3-8c37-e81714ec9123', 'Diskon November', 'voucher', 25.00, '2024-11-24', '2024-12-31', '2024-11-24 16:44:52', '2024-11-24 16:44:52', NULL, 'november');

-- --------------------------------------------------------

--
-- Struktur dari tabel `provinces`
--

CREATE TABLE `provinces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `provinces`
--

INSERT INTO `provinces` (`id`, `name`, `created_at`, `updated_at`) VALUES
(11, 'Aceh (NAD)', NULL, NULL),
(12, 'Sumatera Utara', NULL, NULL),
(13, 'Sumatera Barat', NULL, NULL),
(14, 'Riau', NULL, NULL),
(15, 'Jambi', NULL, NULL),
(16, 'Sumatera Selatan', NULL, NULL),
(17, 'Bengkulu', NULL, NULL),
(18, 'Lampung', NULL, NULL),
(19, 'Kepulauan Bangka Belitung', NULL, NULL),
(21, 'Kepulauan Riau', NULL, NULL),
(31, 'DKI Jakarta', NULL, NULL),
(32, 'Jawa Barat', NULL, NULL),
(33, 'Jawa Tengah', NULL, NULL),
(34, 'DI Yogyakarta', NULL, NULL),
(35, 'Jawa Timur', NULL, NULL),
(36, 'Banten', NULL, NULL),
(51, 'Bali', NULL, NULL),
(52, 'Nusa Tenggara Barat', NULL, NULL),
(53, 'Nusa Tenggara Timur', NULL, NULL),
(61, 'Kalimantan Barat', NULL, NULL),
(62, 'Kalimantan Tengah', NULL, NULL),
(63, 'Kalimantan Selatan', NULL, NULL),
(64, 'Kalimantan Timur', NULL, NULL),
(65, 'Kalimantan Utara', NULL, NULL),
(71, 'Sulawesi Utara', NULL, NULL),
(72, 'Sulawesi Tengah', NULL, NULL),
(73, 'Sulawesi Selatan', NULL, NULL),
(74, 'Sulawesi Tenggara', NULL, NULL),
(75, 'Gorontalo', NULL, NULL),
(76, 'Sulawesi Barat', NULL, NULL),
(81, 'Maluku', NULL, NULL),
(82, 'Maluku Utara', NULL, NULL),
(91, 'Papua', NULL, NULL),
(92, 'Papua Barat', NULL, NULL),
(93, 'Papua Selatan', NULL, NULL),
(94, 'Papua Tengah', NULL, NULL),
(95, 'Papua Pegunungan', NULL, NULL),
(96, 'Papua Barat Daya', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `reviews`
--

CREATE TABLE `reviews` (
  `id_review` char(36) NOT NULL,
  `produk_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `content` text NOT NULL,
  `rating` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `reviews`
--

INSERT INTO `reviews` (`id_review`, `produk_id`, `user_id`, `content`, `rating`, `created_at`, `updated_at`) VALUES
('4fff4b38-36ce-4ba9-b739-a89ab7c47e67', '66c620bb-0ae1-4b30-805f-185e4462555a', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'good', 4, '2024-12-06 04:49:50', '2024-12-06 04:49:50'),
('52021fc6-5672-4657-9b56-704145f5b9c4', '66c620bb-0ae1-4b30-805f-185e4462555a', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'Bagus, berkualitas', 5, '2024-12-03 16:10:33', '2024-12-03 16:10:33'),
('5fe2ecc3-7fa9-404e-9024-7f191de0df10', '66c620bb-0ae1-4b30-805f-185e4462555a', 'b21e39c3-e00d-414f-8d55-01b87602c587', 'Produk berkualitas, mantap', 5, '2024-11-23 15:03:44', '2024-11-23 15:03:44'),
('946b6271-7678-4f56-897d-8494f14ab102', '66c620bb-0ae1-4b30-805f-185e4462555a', '2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'Kualitas premium', 5, '2024-12-02 14:18:39', '2024-12-02 14:18:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'kasir', 'api', '2024-11-20 15:17:36', '2024-11-21 10:18:13'),
(2, 'customer', 'api', '2024-11-20 15:17:36', '2024-11-20 15:17:36'),
(3, 'admin', 'api', '2024-11-20 15:17:36', '2024-11-21 10:18:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 1),
(14, 2),
(14, 3),
(15, 1),
(15, 2),
(15, 3),
(16, 3),
(17, 3),
(18, 3),
(19, 1),
(19, 2),
(19, 3),
(20, 1),
(20, 2),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 1),
(24, 2),
(24, 3),
(25, 1),
(25, 2),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 1),
(29, 2),
(29, 3),
(30, 1),
(30, 2),
(30, 3),
(31, 1),
(31, 2),
(31, 3),
(32, 1),
(32, 2),
(32, 3),
(33, 1),
(33, 2),
(33, 3),
(34, 1),
(34, 2),
(34, 3),
(35, 1),
(35, 2),
(35, 3),
(36, 1),
(36, 2),
(36, 3),
(37, 2),
(37, 3),
(38, 2),
(38, 3),
(39, 2),
(39, 3),
(40, 2),
(40, 3),
(41, 1),
(41, 2),
(41, 3),
(42, 1),
(42, 2),
(42, 3),
(43, 1),
(43, 2),
(43, 3),
(44, 1),
(44, 2),
(44, 3),
(45, 1),
(45, 2),
(45, 3),
(46, 1),
(46, 2),
(46, 3),
(47, 1),
(47, 2),
(47, 3),
(48, 3),
(49, 3),
(50, 3),
(51, 2),
(51, 3),
(52, 1),
(52, 2),
(52, 3),
(53, 1),
(53, 2),
(53, 3),
(54, 1),
(54, 2),
(54, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales_reports`
--

CREATE TABLE `sales_reports` (
  `report_id` char(36) NOT NULL,
  `total_sales` decimal(15,2) NOT NULL,
  `total_orders` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_payment` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sales_reports`
--

INSERT INTO `sales_reports` (`report_id`, `total_sales`, `total_orders`, `start_date`, `end_date`, `created_at`, `updated_at`, `total_payment`) VALUES
('011f7c61-93b6-4a5a-ab1e-c2fbdab39811', 3.00, 11, NULL, NULL, '2024-11-30 15:18:10', '2024-11-30 15:18:10', 79478.00),
('0b48dd49-fd5b-4c8e-9446-39f0c96c0b3e', 2.00, 6, NULL, NULL, '2024-11-24 15:41:50', '2024-11-24 15:41:50', 0.00),
('0cdbd311-fc2a-4611-b549-208cc03b5b02', 3.00, 11, NULL, NULL, '2024-11-29 14:10:31', '2024-11-29 14:10:31', 79478.00),
('0d66150a-e3ce-42f4-8e6a-51053c704fe4', 3.00, 11, NULL, NULL, '2024-11-29 14:25:13', '2024-11-29 14:25:13', 79478.00),
('15186476-f7af-4def-9447-b7a42b0ed970', 3.00, 8, '2024-11-01', '2024-11-30', '2024-11-27 05:15:06', '2024-11-27 05:15:06', 79478.00),
('1658f50a-aa82-4a19-9c9b-e56bccfeca1e', 3.00, 8, '2024-11-01', '2024-11-30', '2024-11-27 05:16:49', '2024-11-27 05:16:49', 79478.00),
('169c10bd-155c-4dab-86ca-f2d726410e54', 3.00, 11, NULL, NULL, '2024-11-29 14:16:23', '2024-11-29 14:16:23', 79478.00),
('17f08fac-2502-4163-8411-0645654b6ed8', 4.00, 34, NULL, NULL, '2024-12-13 05:36:18', '2024-12-13 05:36:18', 1579478.00),
('19cc339e-11b8-479a-9b9f-aebc04bef48f', 0.00, 6, NULL, NULL, '2024-11-24 15:28:59', '2024-11-24 15:28:59', 0.00),
('1f705b7f-364d-4c8d-a633-b1789307c9b7', 4.00, 31, NULL, NULL, '2024-12-12 07:16:03', '2024-12-12 07:16:03', 1579478.00),
('202eaf6b-e907-424a-b910-4bcd66b81eb9', 2.00, 6, NULL, NULL, '2024-11-24 15:42:32', '2024-11-24 15:42:32', 0.00),
('23b926b4-7f54-4cb3-86b0-72623f73d9d3', 3.00, 11, NULL, NULL, '2024-11-30 13:21:44', '2024-11-30 13:21:44', 79478.00),
('2432216e-32b0-443d-a4fc-4e8c6fdabfa9', 2.00, 6, NULL, NULL, '2024-11-24 15:51:46', '2024-11-24 15:51:46', 0.00),
('24b02c3b-7d4a-440a-9cc8-2e4147fca37b', 3.00, 11, NULL, NULL, '2024-11-29 14:15:59', '2024-11-29 14:15:59', 79478.00),
('282b2ed5-9128-4b77-a44f-80b01d2b9f0e', 3.00, 11, NULL, NULL, '2024-11-29 14:23:22', '2024-11-29 14:23:22', 79478.00),
('2a6bfb0c-4077-479d-b4dc-4df5ee34ef6d', 3.00, 11, NULL, NULL, '2024-11-30 15:28:13', '2024-11-30 15:28:13', 79478.00),
('2a8524cb-f9e0-46ed-84c6-193865a8a6f0', 3.00, 11, NULL, NULL, '2024-11-29 14:15:24', '2024-11-29 14:15:24', 79478.00),
('2d2359e6-61a2-4a8a-8787-36b49d83ff78', 2.00, 6, NULL, NULL, '2024-11-25 05:01:50', '2024-11-25 05:01:50', 0.00),
('2d9613a5-e5d2-492f-ab30-36d2201dfca2', 4.00, 34, NULL, NULL, '2024-12-13 05:21:16', '2024-12-13 05:21:16', 1579478.00),
('2da56acb-5d57-404b-8663-ab73546ef34f', 3.00, 11, NULL, NULL, '2024-11-30 15:30:40', '2024-11-30 15:30:40', 79478.00),
('2dd3d598-b27c-42c7-974c-d23066b1517a', 3.00, 11, NULL, NULL, '2024-12-01 08:12:51', '2024-12-01 08:12:51', 79478.00),
('2fdb2a98-3611-4038-9256-116f411addfa', 3.00, 11, NULL, NULL, '2024-11-29 15:37:53', '2024-11-29 15:37:53', 79478.00),
('2fdd69a3-0e6d-4848-8236-d127a31817c0', 3.00, 31, NULL, NULL, '2024-12-03 16:06:03', '2024-12-03 16:06:03', 79478.00),
('3300096b-db75-4454-b67d-cf63daa73cf8', 3.00, 31, NULL, NULL, '2024-12-03 15:07:25', '2024-12-03 15:07:25', 79478.00),
('33186a18-f283-4c31-84b6-d138fdbc507e', 2.00, 6, NULL, NULL, '2024-11-24 15:50:34', '2024-11-24 15:50:34', 0.00),
('351163df-0408-415f-9496-cd25543bc48d', 4.00, 34, NULL, NULL, '2024-12-13 02:11:22', '2024-12-13 02:11:22', 1579478.00),
('367f8db1-b1bf-422d-84c4-0bb23b99ae65', 3.00, 9, NULL, NULL, '2024-11-26 16:02:24', '2024-11-26 16:02:24', 79478.00),
('38aabc4b-a117-41f5-ac04-53a04a2cef53', 4.00, 34, NULL, NULL, '2024-12-13 01:29:55', '2024-12-13 01:29:55', 1579478.00),
('39fe8e62-637c-456e-a268-70f53e7673f4', 4.00, 31, NULL, NULL, '2024-12-05 05:32:14', '2024-12-05 05:32:14', 1579478.00),
('3b3b340b-cc35-443c-aa76-230b4c3df99b', 3.00, 11, NULL, NULL, '2024-12-01 11:52:49', '2024-12-01 11:52:49', 79478.00),
('3b4f10eb-8c49-4fad-82a1-180b2df2f75f', 3.00, 11, NULL, NULL, '2024-11-30 14:41:09', '2024-11-30 14:41:09', 79478.00),
('3b857133-f9e5-4154-89b7-49361311eb4c', 3.00, 11, NULL, NULL, '2024-11-29 15:43:36', '2024-11-29 15:43:36', 79478.00),
('3ce9b36b-15eb-4434-83f9-d4cd79fcbec8', 3.00, 11, NULL, NULL, '2024-12-01 08:56:45', '2024-12-01 08:56:45', 79478.00),
('46607387-4db3-4041-8527-fd8dd726d0b3', 4.00, 31, NULL, NULL, '2024-12-12 07:16:31', '2024-12-12 07:16:31', 1579478.00),
('4675e90b-b21f-4bcd-bd74-bf3d5d9c1aea', 1.00, 4, '2024-11-22', '2024-11-24', '2024-11-24 15:36:55', '2024-11-24 15:36:55', 1.00),
('4b0709af-99e8-4b0a-85c9-8db335568982', 3.00, 8, NULL, NULL, '2024-11-27 05:12:11', '2024-11-27 05:12:11', 79478.00),
('4b2b060e-232e-40fd-aa6a-504c729b648a', 3.00, 9, NULL, NULL, '2024-11-26 16:02:26', '2024-11-26 16:02:26', 79478.00),
('56a40a03-4fe4-4926-9c5e-21bc07d783d5', 3.00, 11, NULL, NULL, '2024-11-29 14:12:31', '2024-11-29 14:12:31', 79478.00),
('5a5cd3d9-ed9f-4f13-bdb6-7b54638fca5c', 3.00, 11, NULL, NULL, '2024-11-30 15:36:00', '2024-11-30 15:36:00', 79478.00),
('5d2f137c-81b3-4692-8a00-cddc0576d220', 3.00, 8, '2024-11-01', '2024-11-30', '2024-11-27 05:16:53', '2024-11-27 05:16:53', 79478.00),
('5f2c02d1-98e6-4b4f-94cc-db787e503d23', 3.00, 11, NULL, NULL, '2024-11-29 15:41:27', '2024-11-29 15:41:27', 79478.00),
('61a183a6-4797-4327-abbd-4fc580afdd57', 3.00, 11, NULL, NULL, '2024-11-30 13:47:19', '2024-11-30 13:47:19', 79478.00),
('631c3987-b7c3-499f-a191-abe2fb206063', 3.00, 8, '2024-11-21', '2024-11-29', '2024-11-28 03:19:59', '2024-11-28 03:19:59', 79478.00),
('6334d40f-ea3e-4add-899c-cc900b494b12', 3.00, 11, NULL, NULL, '2024-11-29 14:01:09', '2024-11-29 14:01:09', 79478.00),
('6384a28b-719d-4be3-87aa-795024016d71', 3.00, 11, NULL, NULL, '2024-12-01 11:27:06', '2024-12-01 11:27:06', 79478.00),
('6414e6df-c009-49fc-8d6f-41a9e619030f', 2.00, 6, '2024-11-22', '2024-11-25', '2024-11-24 15:37:02', '2024-11-24 15:37:02', 1.00),
('648f63a6-195d-46a9-b345-0921ff6a583a', 3.00, 9, NULL, NULL, '2024-11-26 16:07:37', '2024-11-26 16:07:37', 79478.00),
('6f600656-db58-470a-a31a-699a010aa204', 3.00, 11, NULL, NULL, '2024-11-30 15:38:13', '2024-11-30 15:38:13', 79478.00),
('712ba24a-d11d-4438-bfbb-3382adc9659e', 3.00, 11, NULL, NULL, '2024-12-01 09:44:52', '2024-12-01 09:44:52', 79478.00),
('73055830-80bc-4443-b825-4a23dbcb09d9', 3.00, 8, NULL, NULL, '2024-11-27 05:12:30', '2024-11-27 05:12:30', 79478.00),
('76a97da9-fc47-4c9d-b04d-3f784cd2852a', 3.00, 11, NULL, NULL, '2024-11-29 12:12:22', '2024-11-29 12:12:22', 79478.00),
('787402d7-2d3f-46b7-8204-e963bccedffe', 1.00, 4, '2024-11-21', '2024-11-24', '2024-11-27 05:20:32', '2024-11-27 05:20:32', 1.00),
('7dddc21e-dd13-4f59-ac81-6dfc78359f2b', 3.00, 8, NULL, NULL, '2024-11-27 05:12:52', '2024-11-27 05:12:52', 79478.00),
('80b33a78-8ccd-482f-953b-caabbf3e7529', 3.00, 11, NULL, NULL, '2024-11-30 15:21:33', '2024-11-30 15:21:33', 79478.00),
('85dd87a3-1928-48fc-b6b7-8062a83b7e93', 4.00, 34, NULL, NULL, '2024-12-12 12:23:59', '2024-12-12 12:23:59', 1579478.00),
('86018c7b-31c6-4950-89b6-40daa041f32b', 3.00, 11, NULL, NULL, '2024-11-30 14:38:09', '2024-11-30 14:38:09', 79478.00),
('8709feac-185e-4138-99ff-02676f072fa6', 4.00, 34, NULL, NULL, '2024-12-13 01:44:48', '2024-12-13 01:44:48', 1579478.00),
('8874f458-827f-4786-a3ac-fd5f4c794c10', 3.00, 8, NULL, NULL, '2024-11-27 05:09:21', '2024-11-27 05:09:21', 79478.00),
('8927b7e7-ec51-4f2a-9dd4-b3feb6db7588', 2.00, 6, NULL, NULL, '2024-11-24 15:43:00', '2024-11-24 15:43:00', 0.00),
('8b57e0bf-26cf-429b-8ecc-90766dcb6b3a', 2.00, 9, NULL, NULL, '2024-11-26 13:18:24', '2024-11-26 13:18:24', 39753.00),
('8b7ee0a0-9cbd-4989-bb3c-1146222f12b2', 3.00, 11, NULL, NULL, '2024-11-28 16:30:13', '2024-11-28 16:30:13', 79478.00),
('8c6bcf34-e036-47c3-8d4d-a5128515ad20', 3.00, 8, NULL, NULL, '2024-11-27 04:43:24', '2024-11-27 04:43:24', 79478.00),
('92b4d619-7925-4b81-8aa4-7170a3726c30', 3.00, 11, NULL, NULL, '2024-11-30 14:34:05', '2024-11-30 14:34:05', 79478.00),
('940a89b7-ade1-46f0-9795-9abbe309951b', 4.00, 31, NULL, NULL, '2024-12-12 07:16:24', '2024-12-12 07:16:24', 1579478.00),
('99673c9c-681f-4a7b-aba4-74ac5888cd55', 1.00, 5, '2024-11-25', '2024-12-02', '2024-12-02 13:58:37', '2024-12-02 13:58:37', 39725.00),
('9e17f12f-634c-4e9d-8e9b-c2acd64e96c5', 3.00, 8, NULL, NULL, '2024-11-27 05:36:57', '2024-11-27 05:36:57', 79478.00),
('9eaaf153-d9bc-4915-a059-fe4c6377ab6e', 3.00, 8, '2024-11-01', '2024-11-30', '2024-11-27 05:16:55', '2024-11-27 05:16:55', 79478.00),
('9f71bd98-77a0-4616-8285-958b3dc76a09', 2.00, 9, NULL, NULL, '2024-11-25 08:23:20', '2024-11-25 08:23:20', 39753.00),
('a3a15c7d-23bc-4735-8e14-5396bff7a586', 1.00, 4, '2024-11-23', '2024-11-24', '2024-11-24 15:36:29', '2024-11-24 15:36:29', 1.00),
('a420a030-0fed-4822-a62b-85c4dfa88bd7', 3.00, 8, NULL, NULL, '2024-11-27 05:14:58', '2024-11-27 05:14:58', 79478.00),
('a5f5eddf-056f-4bf2-a50e-595945795e3f', 3.00, 11, NULL, NULL, '2024-11-29 14:16:16', '2024-11-29 14:16:16', 79478.00),
('a68eae54-0fbe-4deb-882e-c2b86eb2a7e3', 2.00, 9, NULL, NULL, '2024-11-26 15:21:08', '2024-11-26 15:21:08', 39753.00),
('a6c4bcee-8c84-46b8-97fd-0d5eae5f1ad4', 2.00, 6, '2024-11-22', '2024-11-25', '2024-11-24 15:40:57', '2024-11-24 15:40:57', 1.00),
('a82d72aa-7be9-4d64-9ac9-dc27c33067c0', 2.00, 9, NULL, NULL, '2024-11-26 15:29:13', '2024-11-26 15:29:13', 39753.00),
('a84d6acc-83f4-4d9e-ba18-0bacedae6858', 3.00, 11, NULL, NULL, '2024-11-30 15:21:32', '2024-11-30 15:21:32', 79478.00),
('a9ec86a4-609e-4ba6-b970-23768d5d7177', 3.00, 11, NULL, NULL, '2024-12-01 10:58:03', '2024-12-01 10:58:03', 79478.00),
('aaa96bba-6c22-4207-b1d7-06518e88ded6', 3.00, 11, NULL, NULL, '2024-12-01 10:57:33', '2024-12-01 10:57:33', 79478.00),
('aaf6ef92-3d46-4cb8-8c54-5304e79d9fb3', 3.00, 11, NULL, NULL, '2024-11-30 14:16:51', '2024-11-30 14:16:51', 79478.00),
('ab314828-3da9-4f51-894a-666fa3224201', 2.00, 6, '2024-11-22', '2024-11-25', '2024-11-24 15:41:54', '2024-11-24 15:41:54', 1.00),
('abfe96f5-25e4-4a43-a8be-b43b1810fb24', 3.00, 11, NULL, NULL, '2024-11-29 14:04:42', '2024-11-29 14:04:42', 79478.00),
('acda97c8-642f-4276-b540-a76c03a7ee02', 3.00, 12, NULL, NULL, '2024-12-02 13:56:36', '2024-12-02 13:56:36', 79478.00),
('ad4f1181-72f1-41f9-bd99-e02ae99affdf', 4.00, 34, NULL, NULL, '2024-12-13 03:21:52', '2024-12-13 03:21:52', 1579478.00),
('ae14149f-439d-4175-9300-fec96bbe392b', 4.00, 34, NULL, NULL, '2024-12-12 11:45:00', '2024-12-12 11:45:00', 1579478.00),
('b3d9421d-b96d-4176-9512-37e13a87b068', 3.00, 11, NULL, NULL, '2024-11-29 12:11:28', '2024-11-29 12:11:28', 79478.00),
('b68f9c11-d3f2-4325-9c63-82123f5da4c9', 3.00, 11, NULL, NULL, '2024-11-30 15:06:40', '2024-11-30 15:06:40', 79478.00),
('b83af0ab-8dad-4792-a1d8-0b06610c9a92', 4.00, 31, NULL, NULL, '2024-12-12 07:17:07', '2024-12-12 07:17:07', 1579478.00),
('b864b850-8649-4d13-bf27-10eec0a7c1f9', 3.00, 11, NULL, NULL, '2024-11-29 14:18:31', '2024-11-29 14:18:31', 79478.00),
('be18958f-8a07-4733-ae04-842d4889ebfe', 4.00, 34, NULL, NULL, '2024-12-12 12:25:06', '2024-12-12 12:25:06', 1579478.00),
('c079a024-fcbb-406e-9dcc-2f99f58108b4', 3.00, 11, NULL, NULL, '2024-11-30 14:40:42', '2024-11-30 14:40:42', 79478.00),
('c2028e9e-cbd5-4e70-8402-77bd5225c79c', 0.00, 5, NULL, NULL, '2024-11-23 15:59:14', '2024-11-23 15:59:14', 0.00),
('c294cc22-91fa-4d2b-a8f0-434c03ad1931', 3.00, 11, NULL, NULL, '2024-11-29 14:14:59', '2024-11-29 14:14:59', 79478.00),
('ca6395a7-951a-46b4-b6d4-eb7f0cb440e3', 4.00, 34, NULL, NULL, '2024-12-13 03:00:05', '2024-12-13 03:00:05', 1579478.00),
('cd79f6ee-d280-4709-86c9-e0275457ab2e', 3.00, 11, NULL, NULL, '2024-11-29 12:03:52', '2024-11-29 12:03:52', 79478.00),
('d6a1fc06-deb7-471b-bd40-25ec3dc7d214', 4.00, 31, NULL, NULL, '2024-12-04 12:42:45', '2024-12-04 12:42:45', 1579478.00),
('d747b06f-6515-49f0-a377-7e58fb138f48', 2.00, 6, '2024-11-21', '2024-11-25', '2024-11-27 05:37:09', '2024-11-27 05:37:09', 39753.00),
('d7aedff7-c2e8-4a3f-a0f9-43c1efce9c85', 0.00, 4, '2024-11-23', '2024-11-24', '2024-11-24 15:35:35', '2024-11-24 15:35:35', 1.00),
('d8b36d0e-6774-4c41-84e3-a7cd5a9fc65a', 2.00, 6, NULL, NULL, '2024-11-24 15:32:14', '2024-11-24 15:32:14', 0.00),
('d8d68632-eb40-48e4-b50f-b1ee129653e9', 3.00, 11, NULL, NULL, '2024-11-29 12:10:39', '2024-11-29 12:10:39', 79478.00),
('d97be86a-79ea-4626-ac4a-6e15be11adc7', 3.00, 8, '2024-11-01', '2024-11-30', '2024-11-27 05:16:58', '2024-11-27 05:16:58', 79478.00),
('d992da3b-1219-455c-a98d-745967d55f4d', 3.00, 8, '2024-11-01', '2024-11-30', '2024-11-27 05:15:19', '2024-11-27 05:15:19', 79478.00),
('d9f15ee0-5b23-4bc5-a104-8c2a5f74b373', 3.00, 11, NULL, NULL, '2024-12-01 10:58:28', '2024-12-01 10:58:28', 79478.00),
('db94eb92-e07b-4394-8f7f-a0730ac31b77', 3.00, 31, NULL, NULL, '2024-12-03 16:08:25', '2024-12-03 16:08:25', 79478.00),
('dbef70c6-9789-4fd9-8805-8b655905cc03', 4.00, 34, NULL, NULL, '2024-12-13 05:45:15', '2024-12-13 05:45:15', 1579478.00),
('ddaad4d9-d765-49f3-a4ed-c23f9e4f6dc8', 3.00, 11, NULL, NULL, '2024-12-01 09:44:49', '2024-12-01 09:44:49', 79478.00),
('de219445-92a6-4dfa-88c5-77005317d74e', 3.00, 11, NULL, NULL, '2024-11-29 14:09:06', '2024-11-29 14:09:06', 79478.00),
('e0bcca1b-935f-478a-a5cb-235932ec8c27', 3.00, 11, NULL, NULL, '2024-11-30 14:39:17', '2024-11-30 14:39:17', 79478.00),
('e13cce02-0403-41e3-9c60-0be7f12727e7', 2.00, 6, '2024-11-22', '2024-11-25', '2024-11-24 15:41:20', '2024-11-24 15:41:20', 1.00),
('e2564c0e-e2ae-4d69-bb3b-ec797eec7074', 3.00, 11, NULL, NULL, '2024-11-30 14:39:44', '2024-11-30 14:39:44', 79478.00),
('e307b2a6-1904-467f-b855-b02e8f37770d', 3.00, 8, NULL, NULL, '2024-11-27 04:43:50', '2024-11-27 04:43:50', 79478.00),
('e3210170-dbd3-4642-927a-31376691ab73', 2.00, 6, NULL, NULL, '2024-11-24 15:53:13', '2024-11-24 15:53:13', 0.00),
('e3212689-fe2a-4a23-b7d2-ab48a14301c1', 2.00, 6, '2024-11-22', '2024-11-25', '2024-11-24 15:42:24', '2024-11-24 15:42:24', 1.00),
('e36a35ee-980f-4244-aa46-d7dbfee1ad56', 4.00, 31, NULL, NULL, '2024-12-12 07:17:08', '2024-12-12 07:17:08', 1579478.00),
('e8535bbb-a114-4934-9fbc-d9bf8050cf95', 3.00, 12, NULL, NULL, '2024-12-03 08:01:11', '2024-12-03 08:01:11', 79478.00),
('ec356874-175b-4afc-97e1-93a8eb251f27', 3.00, 17, NULL, NULL, '2024-12-03 09:32:01', '2024-12-03 09:32:01', 79478.00),
('ec9697a8-6461-4260-881d-e4a0031f1c05', 3.00, 11, NULL, NULL, '2024-11-30 14:44:28', '2024-11-30 14:44:28', 79478.00),
('eeec7e8a-4dc9-4a51-bfeb-dd8a979208ec', 2.00, 6, '2024-11-22', '2024-11-25', '2024-11-25 05:02:10', '2024-11-25 05:02:10', 0.00),
('ef3f5973-f38e-4519-840d-a86928617dac', 3.00, 11, NULL, NULL, '2024-12-01 11:26:40', '2024-12-01 11:26:40', 79478.00),
('efae26a5-0019-43fc-be95-a7ecd42f8a25', 4.00, 34, NULL, NULL, '2024-12-13 02:25:04', '2024-12-13 02:25:04', 1579478.00),
('f896db43-1435-43d4-abc7-10dbcf57830a', 4.00, 31, NULL, NULL, '2024-12-12 07:17:13', '2024-12-12 07:17:13', 1579478.00),
('fc2ba66c-8e7f-4ef1-9393-e9f0e25cb946', 3.00, 9, NULL, NULL, '2024-11-26 16:02:02', '2024-11-26 16:02:02', 79478.00),
('fc616f48-a48b-4df3-8835-deca008b1c01', 3.00, 8, NULL, NULL, '2024-11-27 10:03:20', '2024-11-27 10:03:20', 79478.00),
('fdd29a68-2232-4c48-a854-a0bd13c45550', 3.00, 11, NULL, NULL, '2024-11-29 12:15:15', '2024-11-29 12:15:15', 79478.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales_report_offline`
--

CREATE TABLE `sales_report_offline` (
  `id` char(36) NOT NULL,
  `total_sales` int(11) NOT NULL,
  `total_payment` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sales_report_offline`
--

INSERT INTO `sales_report_offline` (`id`, `total_sales`, `total_payment`, `created_at`, `updated_at`) VALUES
('0311b097-20d6-43fc-9995-9ac4e3d88832', 19, 388509, '2024-11-29 14:04:41', '2024-11-29 14:04:41'),
('0a92be37-6e80-4586-bd1c-440122cd69ec', 19, 388509, '2024-12-01 08:12:46', '2024-12-01 08:12:46'),
('0ff33bfb-a962-486a-ab86-a86424f84404', 21, 408509, '2024-12-01 11:52:48', '2024-12-01 11:52:48'),
('1012d421-f812-480e-b7dd-82e3dbd87e5b', 19, 388509, '2024-11-30 15:21:29', '2024-11-30 15:21:29'),
('158b6d2b-c512-4850-8402-0a25e202e720', 19, 388509, '2024-11-30 14:16:49', '2024-11-30 14:16:49'),
('1601f7f3-cccd-42f1-a370-7803a41c303e', 22, 438509, '2024-12-02 13:56:20', '2024-12-02 13:56:20'),
('1aed15fa-c955-44fc-a3de-4ad31a7ece5d', 19, 388509, '2024-11-30 14:39:15', '2024-11-30 14:39:15'),
('1cd0ece3-35d2-420e-be67-733524c5c047', 19, 388509, '2024-11-30 14:41:07', '2024-11-30 14:41:07'),
('238c5d30-611f-4502-b554-a11020ce5cd9', 19, 388509, '2024-11-29 12:12:19', '2024-11-29 12:12:19'),
('29d58325-e801-440d-9319-128b46c363bd', 22, 438509, '2024-12-12 07:17:09', '2024-12-12 07:17:09'),
('37ec76a7-48ca-481a-b73f-3f0d5c0cbbcb', 19, 388509, '2024-11-29 12:10:37', '2024-11-29 12:10:37'),
('389b363c-6d89-46dc-b75e-1e132768f922', 22, 438509, '2024-12-12 11:44:58', '2024-12-12 11:44:58'),
('3ace83f6-8409-46ec-b55b-cc1f00057b68', 19, 388509, '2024-11-30 14:40:42', '2024-11-30 14:40:42'),
('3ade2862-0694-47ad-befb-2cdd414e5126', 22, 438509, '2024-12-13 01:41:18', '2024-12-13 01:41:18'),
('3b8d2724-7951-4068-bb60-fcc132a008f1', 21, 408509, '2024-12-01 11:27:04', '2024-12-01 11:27:04'),
('3c0cee52-6556-48e2-bab6-62cf6c03827b', 22, 438509, '2024-12-12 12:25:03', '2024-12-12 12:25:03'),
('3cfcdbee-1d38-4468-a2da-0611b49d8a58', 19, 388509, '2024-11-30 15:18:08', '2024-11-30 15:18:08'),
('44bd0fb3-f96d-4104-ac4b-6ff3bcd24dc2', 19, 388509, '2024-11-30 13:47:17', '2024-11-30 13:47:17'),
('4b190177-7ce7-4f4b-b958-8cee3f9d0d88', 21, 408509, '2024-12-01 11:26:38', '2024-12-01 11:26:38'),
('4f71551b-d796-4aa4-8e92-f657185de5f2', 22, 438509, '2024-12-13 02:11:20', '2024-12-13 02:11:20'),
('51c373f2-c6cd-49c2-91b9-fff905191214', 21, 408509, '2024-12-01 09:47:40', '2024-12-01 09:47:40'),
('52fee74e-f7c0-468b-8883-fae122635b99', 21, 408509, '2024-12-01 09:45:40', '2024-12-01 09:45:40'),
('56e198a3-6438-46a3-97b8-c66e34870887', 19, 388509, '2024-11-30 15:30:38', '2024-11-30 15:30:38'),
('57cf9cf4-6237-4676-a286-7827e40314ff', 19, 388509, '2024-11-29 14:14:57', '2024-11-29 14:14:57'),
('5a218a11-76ff-40eb-8267-3718a8c3c01b', 22, 438509, '2024-12-13 05:21:14', '2024-12-13 05:21:14'),
('5aeb8c0e-5f40-4e12-8966-a66218f65669', 22, 438509, '2024-12-13 05:45:14', '2024-12-13 05:45:14'),
('5b5b8ebf-696d-43d5-8e57-9ec35b1a45b4', 19, 388509, '2024-11-29 14:25:10', '2024-11-29 14:25:10'),
('5ca171bb-6341-4245-8b6b-4683fdd67c97', 19, 388509, '2024-11-30 14:39:43', '2024-11-30 14:39:43'),
('5f8afea3-fe2d-42c1-8731-8737f368103d', 22, 438509, '2024-12-05 05:32:23', '2024-12-05 05:32:23'),
('6397c209-4b7f-45ab-a1d9-bfb3d2a72588', 22, 438509, '2024-12-12 07:16:00', '2024-12-12 07:16:00'),
('67ea0efe-1247-48b7-9c1b-cd0848204da0', 22, 438509, '2024-12-03 09:32:00', '2024-12-03 09:32:00'),
('6b7ab76f-ab9f-49ba-a9e8-81b0606a3846', 19, 388509, '2024-11-29 11:58:17', '2024-11-29 11:58:17'),
('705c126d-72d7-423b-a6c0-d73a9d378583', 22, 438509, '2024-12-12 07:16:30', '2024-12-12 07:16:30'),
('773cccfa-3d93-4bcf-b24b-21db48be03f4', 19, 388509, '2024-11-29 14:01:04', '2024-11-29 14:01:04'),
('77a1e1a3-da89-4cf5-99e4-f2fab534b4bf', 19, 388509, '2024-11-29 14:16:06', '2024-11-29 14:16:06'),
('82fbe937-e8b2-4d01-9e4a-79386ee36e32', 19, 388509, '2024-11-29 14:15:23', '2024-11-29 14:15:23'),
('86f3b5c5-5fd6-4edc-b12d-2fa9c9c9e6ac', 22, 438509, '2024-12-03 16:06:01', '2024-12-03 16:06:01'),
('88d0563a-e47d-46b4-9007-db2f471f37d2', 22, 438509, '2024-12-13 02:25:03', '2024-12-13 02:25:03'),
('89396c39-d884-498d-a827-541e79d9c6c4', 22, 438509, '2024-12-13 01:44:46', '2024-12-13 01:44:46'),
('89a25498-5a67-40a7-9772-c41675ef8e59', 19, 388509, '2024-11-29 11:49:19', '2024-11-29 11:49:19'),
('8aeb8cd5-43b0-42ba-8ad0-87c61514fc21', 21, 408509, '2024-12-01 10:57:32', '2024-12-01 10:57:32'),
('8caad7cb-30f4-4100-bbbf-97622f3a074b', 21, 408509, '2024-12-01 10:58:28', '2024-12-01 10:58:28'),
('9496df41-6019-435c-a496-bf4772a51b47', 22, 438509, '2024-12-12 07:17:06', '2024-12-12 07:17:06'),
('9a8967ff-6464-48db-ba2d-95e52acfbb73', 21, 408509, '2024-12-01 13:53:00', '2024-12-01 13:53:00'),
('9c926ff8-7e8a-4497-8bc4-5c6333a35243', 19, 388509, '2024-11-29 14:09:03', '2024-11-29 14:09:03'),
('9d5df461-d230-4bb3-b132-dd3ce5ec26e5', 19, 388509, '2024-11-29 14:15:54', '2024-11-29 14:15:54'),
('a59c0c82-a989-4996-b76b-0bed374f51f6', 19, 388509, '2024-11-29 14:20:32', '2024-11-29 14:20:32'),
('a60a9931-2814-446e-8a81-9d30e5d51b6d', 22, 438509, '2024-12-13 01:41:25', '2024-12-13 01:41:25'),
('a6c21d7f-70e1-49f0-b375-d0823810cae0', 19, 388509, '2024-11-30 15:38:12', '2024-11-30 15:38:12'),
('a6cf9391-cfd2-4f1d-a6f4-4bfe828f38c8', 19, 388509, '2024-11-30 14:34:03', '2024-11-30 14:34:03'),
('aa57f5ab-766f-42b2-babc-67641841cfe1', 19, 388509, '2024-11-30 15:21:28', '2024-11-30 15:21:28'),
('afb09ef3-a738-4f55-950c-c4983845f730', 22, 438509, '2024-12-12 12:23:55', '2024-12-12 12:23:55'),
('b3930eec-7e75-40da-8829-08d652395f43', 19, 388509, '2024-11-29 12:11:24', '2024-11-29 12:11:24'),
('b48b3e53-a7d7-4c2f-ab66-e5565767b8f0', 22, 438509, '2024-12-03 08:01:06', '2024-12-03 08:01:06'),
('ba23e659-e959-46bc-a616-1575ed91adec', 22, 438509, '2024-12-13 03:00:04', '2024-12-13 03:00:04'),
('ba9d4954-6af4-4cf3-99da-a23337c1ec0e', 22, 438509, '2024-12-03 16:08:23', '2024-12-03 16:08:23'),
('c375cb3f-f8ef-44c4-a2bb-21076d2e245c', 19, 388509, '2024-11-30 15:28:12', '2024-11-30 15:28:12'),
('c810579d-ae51-4454-87fb-b8ca7e2256aa', 19, 388509, '2024-11-29 15:41:25', '2024-11-29 15:41:25'),
('cb186ec2-6958-4d56-8f53-635881e7b936', 19, 388509, '2024-11-30 15:35:59', '2024-11-30 15:35:59'),
('cbd5a1ca-d1b7-40ad-a082-6fe29e80c8a5', 19, 388509, '2024-11-29 14:16:20', '2024-11-29 14:16:20'),
('d590bf0b-d30e-4343-8d15-b910d1655ed7', 21, 408509, '2024-12-01 08:56:43', '2024-12-01 08:56:43'),
('d9435949-092b-4a3f-8d7e-31dd131fe487', 19, 388509, '2024-11-29 14:12:28', '2024-11-29 14:12:28'),
('dac3fae8-e794-4076-97a2-85259a5a4440', 19, 388509, '2024-11-29 11:59:07', '2024-11-29 11:59:07'),
('dacc2b18-105c-4159-a000-f72088db5bf4', 22, 438509, '2024-12-13 01:29:51', '2024-12-13 01:29:51'),
('dd6c9697-f324-4dd7-b061-3d29550ff205', 19, 388509, '2024-11-30 14:44:23', '2024-11-30 14:44:23'),
('e081f36d-8be0-4921-b166-a6ce32f317de', 19, 388509, '2024-11-29 15:37:51', '2024-11-29 15:37:51'),
('e7a44192-86eb-4bbc-b65a-c442474e683c', 19, 388509, '2024-11-29 12:15:13', '2024-11-29 12:15:13'),
('e84be03c-2b32-4af5-99de-26e5fda4ec7c', 19, 388509, '2024-11-29 15:45:22', '2024-11-29 15:45:22'),
('e99e7f52-5633-4da7-9bba-a144228afc7f', 19, 388509, '2024-11-30 15:06:37', '2024-11-30 15:06:37'),
('ea8dbec3-e058-4022-8936-f90f0ec7aa69', 19, 388509, '2024-11-29 15:43:35', '2024-11-29 15:43:35'),
('ec45305c-d579-4eee-8dd4-3e254c9f8b8d', 19, 388509, '2024-11-30 14:44:18', '2024-11-30 14:44:18'),
('ee526538-985b-488a-a2cc-dc225b007692', 19, 388509, '2024-11-29 14:10:29', '2024-11-29 14:10:29'),
('f2b8840b-d071-4c93-8c12-7b4d9a93ff6e', 21, 408509, '2024-12-01 10:58:02', '2024-12-01 10:58:02'),
('f5b57705-d319-4597-9cdd-c3271a67c412', 21, 408509, '2024-12-01 14:17:48', '2024-12-01 14:17:48'),
('f8acf9a7-2a9c-4047-bd6f-f48f5bce8621', 22, 438509, '2024-12-13 03:21:50', '2024-12-13 03:21:50'),
('fba4cb65-f846-4471-830a-471fe44202aa', 19, 388509, '2024-11-30 13:21:41', '2024-11-30 13:21:41'),
('fca73cd9-f130-4ec3-ade4-2c17285fb1a9', 19, 388509, '2024-11-30 14:38:06', '2024-11-30 14:38:06'),
('fe831c59-7fed-4a06-84e5-ec0854ba8a72', 19, 388509, '2024-11-29 14:23:20', '2024-11-29 14:23:20'),
('fec404c9-7137-4224-bc46-dfed61725c06', 22, 438509, '2024-12-13 05:36:17', '2024-12-13 05:36:17'),
('ff1be8e1-6017-4601-82c6-b6fcb80fc69f', 22, 438509, '2024-12-03 15:07:24', '2024-12-03 15:07:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `transaksi_id` char(36) NOT NULL,
  `order_id` char(36) NOT NULL,
  `total_pembayaran` decimal(10,2) NOT NULL,
  `midtrans_id` varchar(255) DEFAULT NULL,
  `status_pembayaran` enum('pending','selesai','batal') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`transaksi_id`, `order_id`, `total_pembayaran`, `midtrans_id`, `status_pembayaran`, `created_at`, `updated_at`, `deleted_at`) VALUES
('0232244a-c3c4-43a9-936c-9712d4f1632d', '20f26c60-500e-4514-9124-00c9779b0693', 39750.00, NULL, 'pending', '2024-12-03 10:09:52', '2024-12-03 10:09:52', NULL),
('04cae74b-0f87-420f-a89c-6d9e8930e3ab', '1b2bcdce-854a-4ca8-a841-113425a518a3', 500000.00, NULL, 'pending', '2024-12-03 10:23:19', '2024-12-03 10:23:19', NULL),
('0aaa0106-1e0b-4402-bdf9-29885b138b67', '949efe37-6c57-4556-9172-09d89764697c', 1500000.00, NULL, 'pending', '2024-12-03 09:16:58', '2024-12-03 09:16:58', NULL),
('0fdb5433-a36c-4014-be20-7d578080ea19', 'f1ab2300-4b5f-40ef-b82c-a35e6f01c513', 500000.00, NULL, 'selesai', '2024-11-28 04:07:12', '2024-12-02 13:55:07', NULL),
('13757525-000c-4181-addf-b1b786ed588a', '4ef502b9-d8c7-4d04-87cd-a5f5e319db81', 39725.00, NULL, 'selesai', '2024-11-25 06:59:34', '2024-11-27 04:08:17', NULL),
('183f2108-d3ee-4bbb-9d00-003b3dabfcca', 'c3a830fd-fea3-486a-8e5d-f6d4d24b2cf5', 39752.00, NULL, 'selesai', '2024-11-24 08:35:46', '2024-11-24 15:09:25', NULL),
('244a145d-fdee-486b-9e81-028e210946af', '6e9a679d-57d3-4d12-bdf0-92448266dd93', 159000.00, NULL, 'pending', '2024-12-03 10:41:39', '2024-12-03 10:41:39', NULL),
('25d6a42c-5f92-4267-8e0d-b1b5c70ad6e0', 'd1707f53-374e-4acb-be29-af8157dabaa3', 500000.00, NULL, 'pending', '2024-12-03 10:36:47', '2024-12-03 10:36:47', NULL),
('379f3783-c48e-4b7a-b021-fa02733769ad', 'e7f62878-d321-43cc-8c6c-86f76780be1b', 100000.00, NULL, 'pending', '2024-11-23 07:14:51', '2024-11-23 07:14:51', NULL),
('38a85ac0-19e6-4457-8f6c-144d54129290', '889937f0-c94d-4c87-a945-c197f1354aa2', 39750.00, NULL, 'pending', '2024-12-03 09:57:56', '2024-12-03 09:57:56', NULL),
('39bb4186-dc7f-46b5-a1d8-0d41a170bc7c', '1aaa618b-d92c-4fe4-b46a-809da3fde07d', 27.00, NULL, 'pending', '2024-12-03 09:51:54', '2024-12-03 09:51:54', NULL),
('3b06e1f5-4b7e-4b1a-b377-d8a67def10d7', '9d840b2a-93c0-474e-b4ce-4d0532295fac', 500000.00, NULL, 'pending', '2024-12-03 10:28:18', '2024-12-03 10:28:18', NULL),
('3bd64683-2d3c-4e80-9026-d3eae8b45782', '02fcfc57-40bd-421b-9d6a-2f4090773b29', 1.00, NULL, 'selesai', '2024-11-23 12:40:16', '2024-11-27 04:08:49', NULL),
('463dad87-5a2b-4caa-ba35-0abaf979f0d3', '153ca5ca-0f18-4b88-9bf5-2455fe173768', 1500000.00, NULL, 'pending', '2024-12-03 09:00:13', '2024-12-03 09:00:13', NULL),
('4706c5ee-e5fe-4cea-a472-dc661d1d28bd', '15a45446-b96a-4d57-a94c-2fdd7130e094', 1500000.00, NULL, 'pending', '2024-12-03 09:07:15', '2024-12-03 09:07:15', NULL),
('5d56e084-3149-4afc-9eab-16f81c8c59cc', '87fbfc22-f4a2-4b33-91fd-0f0f68bd6d9c', 2.00, NULL, 'batal', '2024-11-24 14:57:39', '2024-11-27 04:09:23', NULL),
('62107f8e-7ec6-4e36-93b8-010cab6e6fe2', '18c5b673-acd3-47da-86fe-4d9f20078a79', 39725.00, NULL, 'pending', '2024-11-25 07:14:30', '2024-11-25 07:14:30', NULL),
('69a60fa6-fd3f-4eeb-a612-661d6b590b45', '4329ee6c-2edb-4da5-b022-8de842f7c183', 39750.00, NULL, 'pending', '2024-12-03 10:09:52', '2024-12-03 10:09:52', NULL),
('6cf432e3-feaa-4933-ab7e-3a811ea8cba7', 'dbfb53be-9e56-4176-9401-9a1f8e6a9b08', 39750.00, NULL, 'pending', '2024-12-03 10:18:32', '2024-12-03 10:18:32', NULL),
('7ddbe2cb-c56c-450a-aa83-767f86f0a858', 'c3bf2604-88a0-4554-8ca5-f06ca3dc9bb7', 10000.00, NULL, 'pending', '2024-11-28 03:58:49', '2024-11-28 03:58:49', NULL),
('833b36b8-37fe-4f64-b721-9b25588b5557', '1e150327-cc5d-400a-857d-aaea766bcfb2', 50000.00, NULL, 'pending', '2024-11-23 06:42:03', '2024-11-23 06:42:03', NULL),
('90ab2438-6290-4d5a-9730-3285ce32a611', 'd0924f4c-c100-46e1-b196-a2b3c6b7d870', 1500000.00, NULL, 'pending', '2024-12-03 09:06:39', '2024-12-03 09:06:39', NULL),
('9e8b03f6-bc9a-48a4-b411-a66242f9a9a7', '7eea7a64-b45b-4391-996b-8c86b86e9e84', 1.00, NULL, 'pending', '2024-11-23 07:10:40', '2024-11-23 07:10:40', NULL),
('a67a3980-1dc8-4c0e-813f-4fc06ce172a9', 'b030cbd4-de44-4391-853f-09f272d0e761', 1.00, NULL, 'pending', '2024-11-23 05:50:56', '2024-11-23 05:50:56', NULL),
('bcd0c825-7a11-457b-a589-8ee09eccef5e', '74d8cc7b-8931-451c-9d9c-ccc31858b2d9', 27.00, NULL, 'pending', '2024-12-03 09:33:07', '2024-12-03 09:33:07', NULL),
('bf72c01c-74f9-4e72-a541-5cfee202300f', '70cff7bd-1501-4ee2-8f06-340b3157bb3d', 39750.00, NULL, 'pending', '2024-12-02 13:50:04', '2024-12-02 13:50:04', NULL),
('c534827d-933c-4d42-85fd-9054aa84da76', '2e869a2d-57ac-4261-acf4-498f6ab68e12', 1000.00, NULL, 'pending', '2024-12-12 07:22:26', '2024-12-12 07:22:26', NULL),
('dd8cc893-5f37-488b-b77c-813d61fe5efa', 'ab0e07aa-08c6-49d8-b441-8ad26a09201b', 1500000.00, NULL, 'pending', '2024-12-03 09:08:30', '2024-12-03 09:08:30', NULL),
('e0c823d0-4595-485f-b10d-0d0be397b7cf', '027069f7-32d6-4859-b9a2-eb3d42106722', 10000.00, NULL, 'pending', '2024-12-02 02:17:14', '2024-12-02 02:17:14', NULL),
('e5006dd2-fb44-4b35-84e4-af7c06a33f3a', 'afbffad4-5f51-4489-922e-9bb821b81a6c', 39750.00, NULL, 'pending', '2024-12-03 10:04:01', '2024-12-03 10:04:01', NULL),
('e93fea67-5c2a-443e-b899-f2dc760f563c', 'e04029fb-f67c-42ab-a41e-56eb2a0ed47d', 500000.00, NULL, 'pending', '2024-12-03 10:33:43', '2024-12-03 10:33:43', NULL),
('f2354ab1-be60-44bc-9e8b-5882c593dd79', '5b6580a0-cb0c-4a15-9854-521040b3a717', 27.00, NULL, 'pending', '2024-12-03 09:54:46', '2024-12-03 09:54:46', NULL),
('f89c4366-0af4-4435-a23c-da9e7a28845e', 'fcf57f40-7bdd-4e4b-9d2b-c1bd7120d6c8', 159027.00, NULL, 'pending', '2024-11-28 07:24:35', '2024-11-28 07:24:35', NULL),
('ff3b96d9-2d2a-4f06-9917-edd450c09772', 'af5645a7-0bd8-4ff4-8e74-02557f06ae63', 39725.00, NULL, 'pending', '2024-11-25 07:28:08', '2024-11-25 07:28:08', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` char(36) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `no_tlp` varchar(255) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `foto` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `role` enum('admin','customer','kasir') NOT NULL DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`user_id`, `nama`, `email`, `password`, `no_tlp`, `is_verified`, `status`, `foto`, `created_at`, `updated_at`, `deleted_at`, `role`) VALUES
('2a20d718-c1f9-4223-82bf-9f27cccd566a', 'customer', 'customer@gmail.com', '$2y$12$rwttUYvqDO/DxKOMQsVzxuZzqubR2SIzoynhejw4KdSXmXZRyt69u', NULL, 1, 1, NULL, '2024-12-13 01:33:14', '2024-12-13 01:33:14', NULL, 'customer'),
('2ee7ef07-430c-4049-9b07-eb29550f1cb1', 'Riana N', 'email@gmail.com', '$2y$12$JEAs9/iHM/kyrqlMr0UBd.b3gGYfUnL1Gust4bco6V9fqu59p8yBy', '087926358272', 1, 1, 'storage/foto_profil/6rWyQi14blI10nLlr9OaoIEe5mDIS8hV8pMT07GW.jpg', '2024-11-25 07:04:43', '2024-12-13 05:44:16', NULL, 'customer'),
('2f4713b5-8b3a-476c-b413-db2d30207301', 'gilang', 'gilang@gmail.com', '$2y$12$H2I11Je43dnpxOZAf8ZBL.zIHXyG7ycfGJXrgh1QxDbVF1U/aE9zK', NULL, 1, 1, NULL, '2024-11-27 06:30:03', '2024-11-27 06:36:47', '2024-11-27 06:36:47', 'customer'),
('81b862ae-85b8-445e-b8e6-d0832d7a2f42', 'coba', 'inicobaaa@yahoo.com', '$2y$12$Kw0hZBBD10LerazH5t5P6eaqdJAqvlGT5GkXU9gBRbb8nZcMwfJNq', NULL, 0, 1, NULL, '2024-11-22 07:07:41', '2024-11-22 07:07:41', NULL, 'customer'),
('87d7d3fd-0c78-46a6-973e-52dd94764506', 'tv', 'ymail@gmail.com', '$2y$12$OmSnkUp1M099a8G/BPheeOs95ve.oAkwXJbTOz89hPQXo6aSbgW/W', NULL, 1, 1, NULL, '2024-11-27 06:31:55', '2024-11-27 06:36:55', '2024-11-27 06:36:55', 'customer'),
('8b3bb028-e8ee-4494-a47d-5b3c785cb05d', 'coba', 'coba@yahoo.com', '$2y$12$LF6Udhgg4.600kOKATOnFuOksV19V5eXtXmi4Vvj3qywMTjX4XYci', NULL, 0, 1, NULL, '2024-11-22 07:00:05', '2024-11-22 07:00:05', NULL, 'customer'),
('95f5cbc7-9e7c-4286-8a08-603b39f58133', 'coba', 'cobaa@yahoo.com', '$2y$12$OZTprxf3muPKk5yQtZRDmulbsLEoGdCcB9L2t/r0SomibzXKbCb5y', NULL, 0, 1, NULL, '2024-11-22 07:01:11', '2024-11-22 07:01:11', NULL, 'customer'),
('9d20f6a5-949a-447d-8f96-669cb3fd84c8', 'admin', 'admin@gmail.com', '$2y$12$vmMHoqMlCecBNxQqtP3xAuqvS/.wx1IT6lQnYDby2JVfaavEucGZG', NULL, 1, 1, NULL, '2024-12-13 01:31:28', '2024-12-13 01:31:28', NULL, 'customer'),
('a7028c9e-523f-43ae-aa83-ba061bf6847b', 'Riana Nur Anisa', 'riana@yahoo.com', '$2y$12$BVx6h9zgvEGBck2veSs9Le3IO0jJ6DNC4U09YAi4UbYV8rdfkfLPG', NULL, 0, 1, NULL, '2024-11-19 07:21:02', '2024-11-20 15:39:17', '2024-11-20 15:39:17', 'customer'),
('b169e082-02c1-4c3e-81fa-44b2dae53f17', 'Tegar', 'tegar@gmail.com', '$2y$12$fwLqWOeB.B4bN8jz6VTv2OP7Q/j4/Y4AOatRFODnkMouG99wYh1Oi', NULL, 1, 1, NULL, '2024-11-24 07:56:50', '2024-11-24 07:56:50', NULL, 'customer'),
('b21e39c3-e00d-414f-8d55-01b87602c587', 'Riana', 'kimriana@yahoo.com', '$2y$12$S2yHLSc7V31LIMoxD4GCxOlSO.4ds2N7sguo5dT0ejFT37e5BmRmW', '081234567890', 1, 1, NULL, '2024-11-20 03:03:49', '2024-12-01 11:52:32', NULL, 'kasir'),
('ccc09a87-abf9-4bf1-a097-9576336c0835', 'Riana N', 'lilcoderi16@gmail.com', '$2y$12$YwlN6yahVZQ03LhIxSzHa.qb/NZHyZLNN3grq82Y1FgPo.xQRvyPa', NULL, 1, 1, NULL, '2024-12-02 13:24:50', '2024-12-02 13:24:50', NULL, 'customer'),
('d5c51197-9b11-4262-8e1b-adf89827907b', 'coba', 'cobaaa@yahoo.com', '$2y$12$weq/0C0kEEwv5Rsbp.OGpecSOyaFMbIviDsJHykm9qM1YYtprUDza', NULL, 0, 1, NULL, '2024-11-22 07:06:51', '2024-11-24 13:36:45', '2024-11-24 13:36:45', 'customer'),
('d9b68e60-ad24-4599-9ca4-8840f921bb6e', 'Riana', 'riananur28@gmail.com', '$2y$12$304Gpfqq32sKaPz4yF9.C.mP.D2YKYFFgCesCD7TtAhBam7AQvVYS', NULL, 1, 1, NULL, '2024-11-24 13:31:41', '2024-11-24 13:34:53', NULL, 'kasir'),
('e3d54a09-89a7-429b-bf2a-2182d8016e35', 'kasir', 'kasir@gmail.com', '$2y$12$/xKBgAwdEfCV9rj9.86/Beu0QxfUISg24IuDOYk5f.P7QXbk6Ac8O', NULL, 1, 1, NULL, '2024-12-13 01:32:26', '2024-12-13 01:32:26', NULL, 'customer'),
('ef4862e0-513a-4812-82ed-4904caa44b4f', 'riana', 'nass9678@gmail.com', '$2y$12$199ZfrTCLkZC0RZxRx2Afee/.DtjBSMHO4f2AhcOeRFXwSapiscMO', NULL, 1, 1, NULL, '2024-11-22 07:59:47', '2024-11-24 13:47:14', NULL, 'customer'),
('f75e5dc2-0d2d-4686-bd07-831f85053408', 'User', 'rianakim49@gmail.com', '$2y$12$srT.i2Ubj4EfThKYJjTI5.GjEH5u1Fm143zoy6Fg9ArYr2PJvmP3G', NULL, 1, 1, NULL, '2024-12-02 02:07:09', '2024-12-02 02:10:30', NULL, 'customer');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `address_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_province_id_foreign` (`province_id`);

--
-- Indeks untuk tabel `detail_order`
--
ALTER TABLE `detail_order`
  ADD PRIMARY KEY (`detail_order_id`),
  ADD KEY `detail_order_order_id_foreign` (`order_id`),
  ADD KEY `detail_order_produk_id_foreign` (`produk_id`);

--
-- Indeks untuk tabel `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `districts_city_id_foreign` (`city_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `item_keranjang`
--
ALTER TABLE `item_keranjang`
  ADD PRIMARY KEY (`item_keranjang_id`),
  ADD KEY `item_keranjang_keranjang_id_foreign` (`keranjang_id`),
  ADD KEY `item_keranjang_produk_id_foreign` (`produk_id`),
  ADD KEY `item_keranjang_order_id_foreign` (`order_id`);

--
-- Indeks untuk tabel `item_keranjang_offline`
--
ALTER TABLE `item_keranjang_offline`
  ADD PRIMARY KEY (`item_keranjang_offline_id`),
  ADD KEY `item_keranjang_offline_keranjang_offline_id_foreign` (`keranjang_offline_id`),
  ADD KEY `item_keranjang_offline_produk_id_foreign` (`produk_id`);

--
-- Indeks untuk tabel `item_nota_belanja`
--
ALTER TABLE `item_nota_belanja`
  ADD PRIMARY KEY (`item_nota_belanja_id`),
  ADD KEY `item_nota_belanja_nota_belanja_id_foreign` (`nota_belanja_id`),
  ADD KEY `item_nota_belanja_produk_id_foreign` (`produk_id`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`keranjang_id`),
  ADD KEY `keranjang_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `keranjang_offline`
--
ALTER TABLE `keranjang_offline`
  ADD PRIMARY KEY (`keranjang_offline_id`),
  ADD KEY `keranjang_offline_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  ADD PRIMARY KEY (`log_aktivitas_id`),
  ADD KEY `log_aktivitas_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `nota_belanja`
--
ALTER TABLE `nota_belanja`
  ADD PRIMARY KEY (`nota_belanja_id`),
  ADD KEY `nota_belanja_keranjang_offline_id_foreign` (`keranjang_offline_id`),
  ADD KEY `nota_belanja_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `order_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_produk_id_foreign` (`produk_id`);

--
-- Indeks untuk tabel `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`otp_id`),
  ADD KEY `otps_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`pembayaran_id`),
  ADD KEY `pembayaran_nota_belanja_id_foreign` (`nota_belanja_id`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`produk_id`),
  ADD KEY `fk_kategori_id` (`kategori_id`),
  ADD KEY `fk_promo_id` (`promo_id`);

--
-- Indeks untuk tabel `produk_item`
--
ALTER TABLE `produk_item`
  ADD PRIMARY KEY (`produk_item_id`),
  ADD KEY `produk_item_order_id_foreign` (`order_id`),
  ADD KEY `produk_item_produk_id_foreign` (`produk_id`);

--
-- Indeks untuk tabel `promo`
--
ALTER TABLE `promo`
  ADD PRIMARY KEY (`promo_id`),
  ADD UNIQUE KEY `kode_voucher` (`kode_voucher`);

--
-- Indeks untuk tabel `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id_review`),
  ADD KEY `reviews_produk_id_foreign` (`produk_id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `sales_reports`
--
ALTER TABLE `sales_reports`
  ADD PRIMARY KEY (`report_id`);

--
-- Indeks untuk tabel `sales_report_offline`
--
ALTER TABLE `sales_report_offline`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`transaksi_id`),
  ADD KEY `transaksi_order_id_foreign` (`order_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT untuk tabel `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_order`
--
ALTER TABLE `detail_order`
  ADD CONSTRAINT `detail_order_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_order_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`produk_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `districts_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `item_keranjang`
--
ALTER TABLE `item_keranjang`
  ADD CONSTRAINT `item_keranjang_keranjang_id_foreign` FOREIGN KEY (`keranjang_id`) REFERENCES `keranjang` (`keranjang_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_keranjang_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_keranjang_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`produk_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `item_keranjang_offline`
--
ALTER TABLE `item_keranjang_offline`
  ADD CONSTRAINT `item_keranjang_offline_keranjang_offline_id_foreign` FOREIGN KEY (`keranjang_offline_id`) REFERENCES `keranjang_offline` (`keranjang_offline_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_keranjang_offline_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`produk_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `item_nota_belanja`
--
ALTER TABLE `item_nota_belanja`
  ADD CONSTRAINT `item_nota_belanja_nota_belanja_id_foreign` FOREIGN KEY (`nota_belanja_id`) REFERENCES `nota_belanja` (`nota_belanja_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_nota_belanja_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`produk_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `keranjang_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `keranjang_offline`
--
ALTER TABLE `keranjang_offline`
  ADD CONSTRAINT `keranjang_offline_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  ADD CONSTRAINT `log_aktivitas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `nota_belanja`
--
ALTER TABLE `nota_belanja`
  ADD CONSTRAINT `nota_belanja_keranjang_offline_id_foreign` FOREIGN KEY (`keranjang_offline_id`) REFERENCES `keranjang_offline` (`keranjang_offline_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `nota_belanja_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`produk_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `otps`
--
ALTER TABLE `otps`
  ADD CONSTRAINT `otps_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_nota_belanja_id_foreign` FOREIGN KEY (`nota_belanja_id`) REFERENCES `nota_belanja` (`nota_belanja_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `fk_kategori_id` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`kategori_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_promo_id` FOREIGN KEY (`promo_id`) REFERENCES `promo` (`promo_id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `produk_item`
--
ALTER TABLE `produk_item`
  ADD CONSTRAINT `produk_item_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produk_item_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`produk_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`produk_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
