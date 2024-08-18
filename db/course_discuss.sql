-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2022 at 03:51 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `course_discuss`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `id_topic` int(11) NOT NULL,
  `from_id_user` int(11) NOT NULL,
  `to_id_user` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `image` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `id_topic`, `from_id_user`, `to_id_user`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 'oke gan', '', '2022-11-15 19:05:51', '2022-11-15 19:05:51'),
(2, 1, 1, 2, 'dfgdfg dfg dfg', 'image_picker3016933645247886767.jpg', '2022-11-15 19:17:06', '2022-11-15 19:17:06'),
(4, 1, 1, 2, 'dfgdfg', 'd8615ca1-b3dd-4ef2-8503-b9b87dfab6066078781627671272875.jpg', '2022-11-15 19:24:47', '2022-11-15 19:24:47'),
(5, 1, 2, 2, 'dgdfgdfgd', '', '2022-11-15 19:26:41', '2022-11-15 19:26:41'),
(6, 1, 2, 1, 'fdfgdfgdf', '', '2022-11-15 19:27:29', '2022-11-15 19:27:29'),
(7, 1, 1, 2, 'ini saya narto', '', '2022-11-16 18:33:21', '2022-11-16 18:33:21'),
(8, 1, 2, 1, 'oh halo narto', '', '2022-11-16 18:33:59', '2022-11-16 18:33:59');

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `id` int(11) NOT NULL,
  `from_id_user` int(11) NOT NULL,
  `to_id_user` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`id`, `from_id_user`, `to_id_user`, `created_at`, `updated_at`) VALUES
(4, 1, 2, '2022-11-16 18:32:29', '2022-11-16 18:32:29');

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` longtext NOT NULL,
  `images` text NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`id`, `title`, `description`, `images`, `id_user`, `created_at`, `updated_at`) VALUES
(1, 'Dart problem, looping', 'saya adam salah sakjsaj sausha saha\nsakjsa suas kuhdfosba dkaushdiuad asduashudasd\nakdhasiud asdiuhusd asudhuasduasd', '[\"image_picker518432470799693136.jpg\",\"image_picker5093491096793022969.jpg\"]', 2, '2022-11-15 00:27:12', '2022-11-15 00:27:12'),
(2, 'Rumus Lingkaran', 'apakah ada cara tercepat untuk mencari luas nya', '[\"image_picker687244739885324731.jpg\"]', 2, '2022-11-15 00:44:54', '2022-11-15 04:32:51'),
(4, 'Kecerdasan buatan (AI) ', 'ada yang tau link dokumentasi yang worrth iit? ', '[\"3267f040-58f2-45d3-ad72-6e2210c72f855095476096639018848.jpg\",\"image_picker6920459568368587846.jpg\"]', 1, '2022-11-16 18:30:40', '2022-11-16 18:31:18');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `image`, `created_at`, `updated_at`) VALUES
(1, 'narto', '202cb962ac59075b964b07152d234b70', 'default_user_image.jpg', '2022-11-14 04:52:48', '2022-11-14 04:52:48'),
(2, 'saskeh', '202cb962ac59075b964b07152d234b70', 'image_picker2937176027637516016.jpg', '2022-11-14 12:49:55', '2022-11-14 13:48:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
