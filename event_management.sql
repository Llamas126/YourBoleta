-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2025 at 04:33 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `event_date` date NOT NULL,
  `event_time` time NOT NULL,
  `contact_info` varchar(100) DEFAULT NULL,
  `max_participants` int(11) DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `creator_id`, `title`, `description`, `location`, `event_date`, `event_time`, `contact_info`, `max_participants`, `creation_date`, `status`) VALUES
(7, 7, 'Concierto de Diomedez', 'Concierto con diomedez, maximo 2 personas', 'Plazoleta de comidas, CC portal del prado, Barranquilla', '2025-06-12', '21:40:00', '301285884', 2, '2025-04-07 01:51:36', 'ACTIVE'),
(8, 9, 'Concierto anonimo', 'vengan a mi casa, solo debe asistir 1 persona', 'mi casa', '2050-10-16', '15:50:00', '3055468910', 1, '2025-04-07 01:58:37', 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `invitations`
--

CREATE TABLE `invitations` (
  `invitation_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `invitation_code` varchar(50) NOT NULL,
  `status` enum('PENDING','ACCEPTED','DECLINED') DEFAULT 'PENDING',
  `sent_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `response_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invitations`
--

INSERT INTO `invitations` (`invitation_id`, `event_id`, `email`, `invitation_code`, `status`, `sent_date`, `response_date`) VALUES
(1, 7, 'probando@gmail.com', 'c0b5c4fc-5f33-46ec-ac50-88b9d2c93f1e', 'ACCEPTED', '2025-04-07 01:53:42', '2025-04-07 01:54:19'),
(4, 7, 'probando3@gmail.com', '2509e9d8-0346-4213-998b-46c0b50e406e', 'ACCEPTED', '2025-04-07 01:57:21', '2025-04-07 01:57:35'),
(5, 8, 'probando3@gmail.com', '4d99a40c-51ad-4a50-b3b1-966bf8e7798e', 'ACCEPTED', '2025-04-07 01:59:00', '2025-04-07 01:59:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `full_name`, `registration_date`) VALUES
(5, 'camilo', 'llamas', 'll@gmail.com', 'llamas', '2025-04-07 01:30:54'),
(6, 'prueba 2', 'prueba', 'prueba2@gmail.com', 'prueba dos', '2025-04-07 01:37:41'),
(7, 'Camilo126', 'llamas', 'llamascamilo126@gmail.com', 'Juan Camilo Llamas Cárdenas', '2025-04-07 01:50:08'),
(8, 'probando', 'llamas', 'probando@gmail.com', 'probando programa', '2025-04-07 01:53:00'),
(9, 'probando2', 'llamas', 'probando2@gmail.com', 'probando dos', '2025-04-07 01:54:53'),
(10, 'probando3', 'llamas', 'probando3@gmail.com', 'probando tres', '2025-04-07 01:56:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `events_ibfk_1` (`creator_id`);

--
-- Indexes for table `invitations`
--
ALTER TABLE `invitations`
  ADD PRIMARY KEY (`invitation_id`),
  ADD UNIQUE KEY `invitation_code` (`invitation_code`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `invitations`
--
ALTER TABLE `invitations`
  MODIFY `invitation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invitations`
--
ALTER TABLE `invitations`
  ADD CONSTRAINT `invitations_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
