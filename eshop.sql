-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 18, 2024 at 12:52 PM
-- Server version: 8.0.30
-- PHP Version: 8.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `createdAt`, `updatedAt`) VALUES
(1, 'Iphone', 'Aliquam pellentesque venenatis orci, sodales accumsan mauris varius at. Donec in pretium eros. Nullam placerat tellus vitae suscipit bibendum. Vestibulum congue, dolor sit amet luctus semper, lectus quam tempus ligula, eu laoreet elit sem non arcu. Nulla sed purus mollis, posuere orci in, maximus velit. Integer blandit dui et velit efficitur placerat. Donec quis arcu mi. Sed maximus diam non lacinia volutpat.', '2024-06-09 23:49:50', '2024-06-09 23:49:50'),
(2, 'PC', 'Quisque ut urna id turpis vulputate bibendum. Nulla a varius nibh, sit amet volutpat mauris. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed in congue magna. Sed vel diam et sem semper pharetra. Duis mattis lorem at libero interdum fermentum. Nunc ullamcorper pellentesque neque a elementum. Praesent sit amet nisl vitae neque finibus lacinia. In eu bibendum sapien. Cras viverra in est eget consectetur. Vestibulum eget blandit turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec auctor nibh ex, non rhoncus dui rutrum eu. Quisque nisi enim, aliquet et elit sit amet, aliquam cursus felis. Aliquam tempus sollicitudin dapibus. Suspendisse malesuada pellentesque nulla vel dignissim.', '2024-06-09 23:49:50', '2024-06-09 23:49:50'),
(3, 'laptop', 'dsfsdfsdfsfsdfsfsfsfs', '2024-06-09 23:49:50', '2024-06-16 03:12:45');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
('04404b56-2f38-4092-8883-101642a99a07', 'admin', '2024-06-13 15:34:56', '2024-06-13 15:34:56'),
('5f483a22-8c01-4172-87c6-94d75a8d33db', 'user', '2024-06-13 15:34:56', '2024-06-13 15:34:56');

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20240609232651-create-category.js'),
('20240610113150-create-coba.js'),
('20240613143744-create-role.js'),
('20240613143859-create-user.js');

-- --------------------------------------------------------

--
-- Table structure for table `tb_coba`
--

CREATE TABLE `tb_coba` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_coba`
--

INSERT INTO `tb_coba` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'jane', '2024-06-11 10:46:51', '2024-06-11 10:46:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role_id`, `createdAt`, `updatedAt`) VALUES
('761a617e-495d-46ef-a25b-2520af19ec10', 'Rizki', 'Rizki@gmail.com', '$2b$10$LPoAMPoxh4WYaBYvZo9H6OCkqMK1PaSKXZtcO7f77A914mu8PH92q', '5f483a22-8c01-4172-87c6-94d75a8d33db', '2024-06-16 07:17:11', '2024-06-16 07:17:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `tb_coba`
--
ALTER TABLE `tb_coba`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_coba`
--
ALTER TABLE `tb_coba`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
