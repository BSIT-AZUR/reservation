-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2023 at 05:46 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reservation_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accommodations`
--

CREATE TABLE `accommodations` (
  `id` int(30) NOT NULL,
  `accommodation` text NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accommodations`
--

INSERT INTO `accommodations` (`id`, `accommodation`, `description`, `price`, `date_created`, `date_updated`) VALUES
(6, '9:30 AM - 10:30 AM', '', 0, '2023-06-12 10:29:46', NULL),
(20, '8:00 AM - 9:00 AM', '', 0, '2023-06-14 11:14:27', NULL),
(21, '11:00 AM - 12:00 PM', '', 0, '2023-06-14 11:27:48', NULL),
(22, '1:00 PM - 2:00 PM', '', 0, '2023-06-14 11:28:18', NULL),
(23, '2:30 PM - 3:30 PM', '', 0, '2023-06-14 11:28:29', NULL),
(24, '4:00 PM - 5:00 PM', '', 0, '2023-06-14 11:28:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `room_id` int(30) NOT NULL,
  `date_in` date NOT NULL,
  `date_out` date NOT NULL,
  `accommodation_ids` text NOT NULL,
  `room_rate_sub` float NOT NULL,
  `accommodation_sub` float NOT NULL,
  `total_amount` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending, 1=Approved,2=Cancelled',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inquiry`
--

CREATE TABLE `inquiry` (
  `id` int(30) NOT NULL,
  `name` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `subject` varchar(250) NOT NULL,
  `message` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inquiry`
--

INSERT INTO `inquiry` (`id`, `name`, `email`, `subject`, `message`, `status`, `date_created`) VALUES
(3, 'earn', 'earn@gmail.com', 'Cupping Massage', 'Your work is great\r\n', 1, '2023-06-12 10:40:55');

-- --------------------------------------------------------

--
-- Table structure for table `room_list`
--

CREATE TABLE `room_list` (
  `id` int(30) NOT NULL,
  `room` text NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1 = Available, 2 = Unavailable',
  `upload_path` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_list`
--

INSERT INTO `room_list` (`id`, `room`, `description`, `price`, `status`, `upload_path`, `date_created`, `date_updated`) VALUES
(1, 'Swedish Massage', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;Swedish Massage involves long, kneading strokes combined with rhythmic tapping strokes and movement of the joints. This type of massage targets the uppermost layer of muscles and aims to relieve muscle tension.&lt;/p&gt;', 500, 1, 'uploads/room_1', '2021-07-24 10:22:15', '2023-06-12 02:17:59'),
(2, 'Scalp Massage', '&lt;span style=&quot;color: rgb(35, 31, 32); font-family: &amp;quot;Proxima Nova&amp;quot;, &amp;quot;Proxima Nova Fallback&amp;quot;, sans-serif; font-size: 18px;&quot;&gt;A typical scalp massage uses the fingertips only. There&rsquo;s also the option of using a scalp massaging device that works to mimic the pressure of your fingertips.&lt;/span&gt;', 500, 1, 'uploads/room_2', '2021-07-24 14:38:31', '2023-06-12 02:19:22'),
(3, 'Hot Stone Massage', '&lt;p&gt;&lt;span style=&quot;color: rgb(35, 31, 32); font-family: &amp;quot;Proxima Nova&amp;quot;, &amp;quot;Proxima Nova Fallback&amp;quot;, sans-serif; font-size: 18px;&quot;&gt;A hot stone massage is a type of massage therapy. It&rsquo;s used to help you relax and ease tense muscles and damaged soft tissues throughout your body&lt;/span&gt;&lt;/p&gt;', 450, 1, 'uploads/therapy_3', '2023-06-12 02:21:51', '2023-06-14 11:27:14'),
(4, 'Foot Massage', '&lt;p&gt;&lt;span style=&quot;color: rgb(85, 85, 85); font-family: Arimo, sans-serif; font-size: 15.2px;&quot;&gt;A technique used during a foot massage is acupressure. Acupressure is performed using the fingers and thumbs and involves applying pressure to specific areas of the foot&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 400, 1, 'uploads/room_4', '2023-06-12 02:22:49', '2023-06-12 02:22:49'),
(5, 'Deep Tissue Massage', '&lt;p&gt;Deep Tissue Massage targets chronic tension in muscles that lie far below the body\'s surface. Deep muscle techniques involve slow strokes, direct pressure or friction movements that go across the muscle grain.&lt;/p&gt;', 600, 1, 'uploads/room_5', '2023-06-12 02:24:38', '2023-06-12 02:24:38'),
(6, 'Cupping Massage', '&lt;p&gt;Cupping is a form of massage therapy which decompress soft tissues using vacuum suction, unlike other forms of massage that compress soft tissues.&amp;nbsp;&lt;/p&gt;', 550, 1, 'uploads/room_6', '2023-06-12 02:27:25', '2023-06-12 02:27:25');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'SPA Massage Reservation System'),
(6, 'short_name', 'ESPARIN'),
(11, 'logo', 'uploads/1686705420_logo.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1686496320_footer-bg.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `email` text NOT NULL,
  `contact` varchar(50) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `contact`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', '', '', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1686536700_logo.png', NULL, 1, '2021-01-20 14:02:37', '2023-06-12 10:25:29'),
(7, 'earn', 'azur', '123@gmail.com', '09127920338', 'earn', '202cb962ac59075b964b07152d234b70', NULL, NULL, 0, '2023-06-11 22:41:24', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accommodations`
--
ALTER TABLE `accommodations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inquiry`
--
ALTER TABLE `inquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_list`
--
ALTER TABLE `room_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accommodations`
--
ALTER TABLE `accommodations`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `inquiry`
--
ALTER TABLE `inquiry`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `room_list`
--
ALTER TABLE `room_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
