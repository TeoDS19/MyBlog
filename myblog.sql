-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 20, 2024 at 07:50 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myblog`
--
CREATE DATABASE IF NOT EXISTS `myblog` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `myblog`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nume` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `nume`) VALUES
(1, 'General'),
(2, 'PHP'),
(3, 'HTML'),
(4, 'JavaScript'),
(5, 'Functions'),
(6, 'Variables'),
(7, 'Forms');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nume` varchar(100) NOT NULL,
  `prenume` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mesaj` text NOT NULL,
  `data_adaugare` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `nume`, `prenume`, `email`, `mesaj`, `data_adaugare`) VALUES
(1, 'Dumiterscu', 'Teodor', 'demo@demo1.com', 'Mesaj de test', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `titlu` varchar(100) NOT NULL,
  `continut` mediumtext NOT NULL,
  `poza` varchar(80) DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `categorie_id` int(10) UNSIGNED NOT NULL,
  `dataadaugare` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `categorie_id` (`categorie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `titlu`, `continut`, `poza`, `user_id`, `categorie_id`, `dataadaugare`) VALUES
(1, 'Learn JavaScript', '<h2><strong>About this course</strong></h2><p>This course is designed to teach you the fundamentals of the JavaScript programming language and to give you lots of practice along the way! We\'ll look at how to structure and group information in your app with data types, how to use programming logic so your app does what you want it to and how to write readable code so you can more easily modify, maintain, and share your apps.</p>', '1688158402801_2.jpeg', 8, 4, '2023-06-30 14:53:22'),
(2, 'Learn Node.js', '<p><strong style=\"color: rgb(0, 0, 0);\">This advanced Node.js course</strong><span style=\"color: rgb(0, 0, 0);\"> focuses on topics like Redis for caching, worker threads and clustering, and integrating image uploads using Node and S3! Students will also learn about event loop steps and how to use AWS S3 to implement scalable uploads.</span></p>', '1688243686410_6.png', 8, 4, '2023-07-01 14:34:46'),
(3, 'Node.js Developer Roadmap 2023', '<p>In this article, we will explore nodejs developer roadmap for 2023. A step-by-step guide to how to become nodejs developer or&nbsp;increase&nbsp;your knowledge.</p><p><strong>One of the most read articles of mine was the Nodejs developer roadmap in 2022.</strong> This article is a new version of the roadmap in 2023 with an extension to the old version :)</p><p><br></p>', '1688243996260_5.jpeg', 8, 4, '2023-07-01 14:39:56'),
(4, 'Vue JS Get Array Length ', '<p>Today, I will learn you how to get <strong style=\"color: rgb(230, 0, 0);\">array length or object length in vue</strong> js. we will show example of vue js get array length or object length. i will <strong>give example for vue js get object length. if you worked with javascript jquery</strong> then you know you can get array length by variable.length so same way you can get array length or object length in vue js application.</p><p><br></p><p>I give you bellow very simple example so you can understand how to getting array length or object length in vue js code.</p>', '1688248133787_3.jpg', 8, 5, '2023-07-01 15:48:53'),
(5, 'Bootstrap Grid system', '<h1>Grid system</h1><p>Use our powerful mobile-first flexbox grid to build layouts of all shapes and sizes thanks to a twelve column system, five default responsive tiers, Sass variables and mixins, and dozens of predefined classes.</p><h2>How it works</h2><p>Bootstrap’s grid system uses a series of containers, rows, and columns to layout and align content. It’s built with&nbsp;<a href=\"https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Using_CSS_flexible_boxes\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"background-color: transparent; color: rgb(0, 123, 255);\">flexbox</a>&nbsp;and is fully responsive. Below is an example and an in-depth look at how the grid comes together.</p>', '1688248465732_2.jpg', 8, 3, '2023-07-01 15:54:25'),
(6, 'How to Integrate Paytm Payment Gateway', '<p><strong>This tutorial is focused on how to integrate the Paytm payment gateway in PHP. you\'ll learn Paytm payment gateway integration in PHP. We will use Paytm payment gateway integration using PHP. if you have a question about how to integrate the Paytm payment gateway using PHP then I will give a simple example with a solution.</strong></p><p>Now, let\'s see the article on how to integrate the Paytm payment gateway using PHP. it\'s a simple example of Paytm payment gateway integration using PHP. you can understand the concept of Paytm payment gateway integration in PHP. if you have a question about how to integrate the Paytm payment gateway in PHP then I will give a simple example with a solution.</p>', '1688253936522_2.jpg', 8, 2, '2023-07-01 17:25:36'),
(7, 'Proiect Final', '<p>Continut demo proiect final</p>', '1718902910480_demp.jpg', 14, 3, '2024-06-20 17:01:50'),
(8, 'Proiect Final', '<p>sdasdasdasd</p>', '1718903037374_demp.jpg', 14, 3, '2024-06-20 17:03:57'),
(9, 'Proiect Final', '<p>sadadasdasdsad</p>', '1718903163409_demp.jpg', 14, 3, '2024-06-20 17:06:03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(200) NOT NULL,
  `nume` varchar(100) NOT NULL,
  `prenume` varchar(100) NOT NULL,
  `parola` varchar(300) NOT NULL,
  `dataadaugare` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `nume`, `prenume`, `parola`, `dataadaugare`) VALUES
(8, 'demo@yahoo.com', 'Demo', 'Ion', '$2a$10$ZBAkb.Z2jBTFopxRYFkbp.LeXALQmguACW28lp8CqhbjhcOhC1kj6', '2023-06-19 15:29:07'),
(13, 'demo@demo.com', 'adiaconitei', 'adrian', '$2a$10$Va.KUDITAnEo0i.k.hrfXO9PpvLb8WQLBQPUkzzpzv.c/912.yA6y', '2024-06-18 05:21:08'),
(14, 'demo8@exemplu.com', 'Popescu', 'Dan', '$2a$10$6q5PPC0PlnxVzKHqWYMbtOHl0BhbmQPdJHQ1ZPUNN1muEwUa3P5ou', '2024-06-20 16:38:13');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
