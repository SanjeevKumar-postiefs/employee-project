-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2025 at 09:44 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `management`
--

-- --------------------------------------------------------

--
-- Table structure for table `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add employee profile', 1, 'add_employeeprofile'),
(2, 'Can change employee profile', 1, 'change_employeeprofile'),
(3, 'Can delete employee profile', 1, 'delete_employeeprofile'),
(4, 'Can view employee profile', 1, 'view_employeeprofile'),
(5, 'Can add ticket', 2, 'add_ticket'),
(6, 'Can change ticket', 2, 'change_ticket'),
(7, 'Can delete ticket', 2, 'delete_ticket'),
(8, 'Can view ticket', 2, 'view_ticket'),
(9, 'Can add log entry', 3, 'add_logentry'),
(10, 'Can change log entry', 3, 'change_logentry'),
(11, 'Can delete log entry', 3, 'delete_logentry'),
(12, 'Can view log entry', 3, 'view_logentry'),
(13, 'Can add permission', 4, 'add_permission'),
(14, 'Can change permission', 4, 'change_permission'),
(15, 'Can delete permission', 4, 'delete_permission'),
(16, 'Can view permission', 4, 'view_permission'),
(17, 'Can add group', 5, 'add_group'),
(18, 'Can change group', 5, 'change_group'),
(19, 'Can delete group', 5, 'delete_group'),
(20, 'Can view group', 5, 'view_group'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add content type', 7, 'add_contenttype'),
(26, 'Can change content type', 7, 'change_contenttype'),
(27, 'Can delete content type', 7, 'delete_contenttype'),
(28, 'Can view content type', 7, 'view_contenttype'),
(29, 'Can add session', 8, 'add_session'),
(30, 'Can change session', 8, 'change_session'),
(31, 'Can delete session', 8, 'delete_session'),
(32, 'Can view session', 8, 'view_session'),
(33, 'Can add ticket history', 9, 'add_tickethistory'),
(34, 'Can change ticket history', 9, 'change_tickethistory'),
(35, 'Can delete ticket history', 9, 'delete_tickethistory'),
(36, 'Can view ticket history', 9, 'view_tickethistory'),
(37, 'Can add session', 10, 'add_session'),
(38, 'Can change session', 10, 'change_session'),
(39, 'Can delete session', 10, 'delete_session'),
(40, 'Can view session', 10, 'view_session'),
(41, 'Can add user activity', 11, 'add_useractivity'),
(42, 'Can change user activity', 11, 'change_useractivity'),
(43, 'Can delete user activity', 11, 'delete_useractivity'),
(44, 'Can view user activity', 11, 'view_useractivity'),
(45, 'Can add daily activity', 12, 'add_dailyactivity'),
(46, 'Can change daily activity', 12, 'change_dailyactivity'),
(47, 'Can delete daily activity', 12, 'delete_dailyactivity'),
(48, 'Can view daily activity', 12, 'view_dailyactivity'),
(49, 'Can add session activity', 13, 'add_sessionactivity'),
(50, 'Can change session activity', 13, 'change_sessionactivity'),
(51, 'Can delete session activity', 13, 'delete_sessionactivity'),
(52, 'Can view session activity', 13, 'view_sessionactivity'),
(53, 'Can add notification', 14, 'add_notification'),
(54, 'Can change notification', 14, 'change_notification'),
(55, 'Can delete notification', 14, 'delete_notification'),
(56, 'Can view notification', 14, 'view_notification'),
(57, 'Can add call note', 15, 'add_callnote'),
(58, 'Can change call note', 15, 'change_callnote'),
(59, 'Can delete call note', 15, 'delete_callnote'),
(60, 'Can view call note', 15, 'view_callnote'),
(61, 'Can add call', 16, 'add_call'),
(62, 'Can change call', 16, 'change_call'),
(63, 'Can delete call', 16, 'delete_call'),
(64, 'Can view call', 16, 'view_call'),
(65, 'Can add call status', 17, 'add_callstatus'),
(66, 'Can change call status', 17, 'change_callstatus'),
(67, 'Can delete call status', 17, 'delete_callstatus'),
(68, 'Can view call status', 17, 'view_callstatus'),
(69, 'Can add note', 18, 'add_note'),
(70, 'Can change note', 18, 'change_note'),
(71, 'Can delete note', 18, 'delete_note'),
(72, 'Can view note', 18, 'view_note'),
(73, 'Can add client call note', 19, 'add_clientcallnote'),
(74, 'Can change client call note', 19, 'change_clientcallnote'),
(75, 'Can delete client call note', 19, 'delete_clientcallnote'),
(76, 'Can view client call note', 19, 'view_clientcallnote'),
(77, 'Can add new call query', 20, 'add_newcallquery'),
(78, 'Can change new call query', 20, 'change_newcallquery'),
(79, 'Can delete new call query', 20, 'delete_newcallquery'),
(80, 'Can view new call query', 20, 'view_newcallquery'),
(81, 'Can add ticket notification', 21, 'add_ticketnotification'),
(82, 'Can change ticket notification', 21, 'change_ticketnotification'),
(83, 'Can delete ticket notification', 21, 'delete_ticketnotification'),
(84, 'Can view ticket notification', 21, 'view_ticketnotification'),
(85, 'Can add daily stats', 22, 'add_dailystats'),
(86, 'Can change daily stats', 22, 'change_dailystats'),
(87, 'Can delete daily stats', 22, 'delete_dailystats'),
(88, 'Can view daily stats', 22, 'view_dailystats'),
(89, 'Can add ticket alert', 23, 'add_ticketalert'),
(90, 'Can change ticket alert', 23, 'change_ticketalert'),
(91, 'Can delete ticket alert', 23, 'delete_ticketalert'),
(92, 'Can view ticket alert', 23, 'view_ticketalert'),
(93, 'Can add unified notification', 24, 'add_unifiednotification'),
(94, 'Can change unified notification', 24, 'change_unifiednotification'),
(95, 'Can delete unified notification', 24, 'delete_unifiednotification'),
(96, 'Can view unified notification', 24, 'view_unifiednotification'),
(97, 'Can add work report', 25, 'add_workreport'),
(98, 'Can change work report', 25, 'change_workreport'),
(99, 'Can delete work report', 25, 'delete_workreport'),
(100, 'Can view work report', 25, 'view_workreport'),
(101, 'Can add ticket note', 26, 'add_ticketnote'),
(102, 'Can change ticket note', 26, 'change_ticketnote'),
(103, 'Can delete ticket note', 26, 'delete_ticketnote'),
(104, 'Can view ticket note', 26, 'view_ticketnote'),
(105, 'Can add improved text', 27, 'add_improvedtext'),
(106, 'Can change improved text', 27, 'change_improvedtext'),
(107, 'Can delete improved text', 27, 'delete_improvedtext'),
(108, 'Can view improved text', 27, 'view_improvedtext'),
(109, 'Can add Token', 28, 'add_token'),
(110, 'Can change Token', 28, 'change_token'),
(111, 'Can delete Token', 28, 'delete_token'),
(112, 'Can view Token', 28, 'view_token'),
(113, 'Can add Token', 29, 'add_tokenproxy'),
(114, 'Can change Token', 29, 'change_tokenproxy'),
(115, 'Can delete Token', 29, 'delete_tokenproxy'),
(116, 'Can view Token', 29, 'view_tokenproxy'),
(117, 'Can add user activity', 30, 'add_useractivity'),
(118, 'Can change user activity', 30, 'change_useractivity'),
(119, 'Can delete user activity', 30, 'delete_useractivity'),
(120, 'Can view user activity', 30, 'view_useractivity'),
(121, 'Can add activity report', 31, 'add_activityreport'),
(122, 'Can change activity report', 31, 'change_activityreport'),
(123, 'Can delete activity report', 31, 'delete_activityreport'),
(124, 'Can view activity report', 31, 'view_activityreport'),
(125, 'Can add activity log', 32, 'add_activitylog'),
(126, 'Can change activity log', 32, 'change_activitylog'),
(127, 'Can delete activity log', 32, 'delete_activitylog'),
(128, 'Can view activity log', 32, 'view_activitylog'),
(129, 'Can add on duty request', 33, 'add_ondutyrequest'),
(130, 'Can change on duty request', 33, 'change_ondutyrequest'),
(131, 'Can delete on duty request', 33, 'delete_ondutyrequest'),
(132, 'Can view on duty request', 33, 'view_ondutyrequest');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(12, 'pbkdf2_sha256$600000$B2QQOVRcndLTvC5i2GDwYj$Ql7Shjmra+2rsNTQPLwnzla28oUxJ109NV7hBVt/EZE=', '2025-03-17 11:18:50.810385', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2024-10-25 09:04:39.482323'),
(13, 'pbkdf2_sha256$600000$f8DmTqWfeOGbTm72fd5pAb$muim+iKMHt4IGxwssxjMUdkVcytUSFNDyQSmqulHenE=', '2025-04-01 07:41:37.724128', 0, 'sanjeev', 'sanjeev', 'kumar', 'sanjeev@gmail.com', 0, 1, '2024-10-25 09:35:53.197315'),
(14, 'pbkdf2_sha256$600000$9lThxBjICjJ4OyVvBVHWts$fAXrWQhLT+V4gf0B+N6/h9PNa9PktSdamBNzaDaazag=', '2025-03-31 06:39:01.334798', 0, 'Ajil', 'Ajil', 'TU', 'ajil@gmail.com', 0, 1, '2024-10-25 09:38:10.503884'),
(15, 'pbkdf2_sha256$600000$pZ3F32yjPfSpXFAsaVaIfX$TX1DaGyKSpLt7CXQ4Zb14FvpPxAPFF78o4Dh+WYQRks=', '2025-03-19 04:12:54.071203', 0, 'Jayamohan', 'Jayamohan', 'x', 'jayamohan@gmail.com', 0, 1, '2024-10-25 10:57:17.559935'),
(16, 'pbkdf2_sha256$600000$RmmQaw7LOqBnvTF00zMvoR$9Zh0gyPknaXFnzcWaYT8a7zZMbx6Kn0xNa3D7XZWvPk=', '2025-03-18 03:47:31.458894', 0, 'Georgy', 'Georgy', 'Cheriyan', 'Georgy@gmail.com', 0, 1, '2024-10-28 06:58:42.078089'),
(17, 'pbkdf2_sha256$600000$pCIXsYCDKtCUWJ9oFE5UVx$QQRyWznGi7iG9nKIWUt8kdoCB2afDa4zgSJOmzyFlN4=', '2025-04-01 06:40:28.274921', 0, 'jobin', 'jobin', 'ps', 'jobin@gmail.com', 0, 1, '2024-10-29 05:46:56.459314'),
(18, 'pbkdf2_sha256$600000$VOGstnPjqJROKoQlMpLUAr$Z/skEG1BQUYK4yxAPvPJwSFvjfXtxsR8hl0V0kvBpfs=', '2025-03-17 09:36:38.349254', 0, 'didith', 'didith', 'antony', 'didith@gmail.com', 0, 1, '2024-10-29 05:48:06.536978'),
(23, 'pbkdf2_sha256$600000$t7ObAVGZGE0Z4dvZjdmCgf$e5WqOrVXtk78D2N65gpUGcjo2IUgWK2KKaXrrReYB3I=', NULL, 0, 'manuel', 'manuel', 'sijo', 'manuel@gmail.com', 0, 1, '2024-10-29 06:05:37.039900'),
(24, 'pbkdf2_sha256$600000$Cvopj4RkVu86Wz8aaSoDfN$uakwiwQm9i3p8KhCM5Q6dD+6GwXVTXbJF8q7B4GB27k=', NULL, 0, 'Manoj', 'Manoj', 'Kiran A', 'manoj@gmail.com', 0, 1, '2025-02-05 05:31:08.107617'),
(26, 'pbkdf2_sha256$600000$2W9KqUe5woWPtCaHxBTIRs$LFGT/OhprmH5RtsZ9/TvDzl3PBUM9pLZniL8R97cw8E=', '2025-03-18 03:49:33.746686', 0, 'sanjeev.kumar@postiefs.com', 'Sanjeev', 'S Kumar', 'sanjeev.kumar@postiefs.com', 0, 1, '2025-03-14 08:00:01.049939'),
(27, 'pbkdf2_sha256$600000$NSe9EIAwuHU7CuIl66xnx1$y3kOA91F8dEbqTDwqwc5vXfMpTRE6hBW9MCHHIsxg10=', '2025-03-18 04:03:11.832510', 0, 'ajay@gmail.com', 'Ajay', 'Mathews', 'ajay@gmail.com', 0, 1, '2025-03-17 11:10:17.059689'),
(28, 'pbkdf2_sha256$600000$cUe9g1TFm05semYG2Kt8GS$wsYHjSA3ZxEN/i4E6Mdac8gzjXbKy8P3y0n8ZSUE98I=', '2025-03-18 07:22:09.544454', 0, 'arun@gmail.com', 'Arunlal', 'A', 'arun@gmail.com', 0, 1, '2025-03-18 03:52:19.271969');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(11, '2024-10-29 05:52:11.489505', '19', 'manuel', 3, '', 6, 12),
(12, '2024-10-29 05:55:05.801795', '20', 'manuel', 3, '', 6, 12),
(13, '2024-10-29 06:04:45.583087', '22', 'aa', 3, '', 6, 12),
(14, '2024-10-29 06:04:45.583087', '21', 'manuel', 3, '', 6, 12),
(15, '2025-01-08 12:20:07.557544', '66', 'priority field', 2, '[{\"changed\": {\"fields\": [\"User\", \"Note\"]}}]', 2, 12),
(16, '2025-01-08 12:23:01.252745', '1', 'Note by Ajil on 2025-01-08 12:23:01.252745+00:00', 1, '[{\"added\": {}}]', 18, 12),
(17, '2025-01-09 05:23:24.152824', '11', 'Note by Ajil on 2025-01-09 05:16:52.571361+00:00', 2, '[{\"changed\": {\"fields\": [\"Note text\"]}}]', 18, 12),
(18, '2025-01-09 06:54:27.226208', '59', 'ticket id error checking', 2, '[{\"changed\": {\"fields\": [\"User\", \"Call in progress\"]}}]', 2, 12),
(19, '2025-01-09 06:55:59.776546', '59', 'ticket id error checking', 2, '[{\"changed\": {\"fields\": [\"Call in progress\"]}}]', 2, 12),
(20, '2025-02-05 06:08:16.573876', '53', 'testing ticket 1', 3, '', 2, 12),
(21, '2025-03-07 12:01:59.776918', '85', 'New design for create ticket', 3, '', 2, 12),
(22, '2025-03-14 07:58:30.187556', '344', 'sanjeev.kumar@postiefs.com - 2025-03-14 07:21:26.096126+00:00', 3, '', 30, 12),
(23, '2025-03-14 07:58:30.190913', '343', 'sanjeev.kumar@postiefs.com - 2025-03-14 07:20:24.032534+00:00', 3, '', 30, 12),
(24, '2025-03-14 07:58:30.193671', '342', 'sanjeev.kumar@postiefs.com - 2025-03-14 06:42:46.112016+00:00', 3, '', 30, 12),
(25, '2025-03-14 07:58:30.195666', '341', 'sanjeev.kumar@postiefs.com - 2025-03-14 06:40:44.055642+00:00', 3, '', 30, 12),
(26, '2025-03-14 07:58:30.199663', '340', 'sanjeev.kumar@postiefs.com - 2025-03-14 06:13:41.997808+00:00', 3, '', 30, 12),
(27, '2025-03-14 07:58:30.201783', '339', 'sanjeev.kumar@postiefs.com - 2025-03-14 06:12:39.903839+00:00', 3, '', 30, 12),
(28, '2025-03-14 07:58:30.201783', '338', 'sanjeev.kumar@postiefs.com - 2025-03-14 03:52:47.242407+00:00', 3, '', 30, 12),
(29, '2025-03-14 07:58:30.201783', '337', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(30, '2025-03-14 07:58:30.201783', '336', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(31, '2025-03-14 07:58:30.201783', '335', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(32, '2025-03-14 07:58:30.201783', '334', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(33, '2025-03-14 07:58:30.201783', '333', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(34, '2025-03-14 07:58:30.217408', '332', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(35, '2025-03-14 07:58:30.221225', '331', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(36, '2025-03-14 07:58:30.221971', '330', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(37, '2025-03-14 07:58:30.221971', '329', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(38, '2025-03-14 07:58:30.221971', '328', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(39, '2025-03-14 07:58:30.237250', '327', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(40, '2025-03-14 07:58:30.239248', '326', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(41, '2025-03-14 07:58:30.241247', '325', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(42, '2025-03-14 07:58:30.243245', '324', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(43, '2025-03-14 07:58:30.246244', '323', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(44, '2025-03-14 07:58:30.247243', '322', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(45, '2025-03-14 07:58:30.250242', '321', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(46, '2025-03-14 07:58:30.252275', '320', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(47, '2025-03-14 07:58:30.254280', '319', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(48, '2025-03-14 07:58:30.256272', '318', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(49, '2025-03-14 07:58:30.258275', '317', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(50, '2025-03-14 07:58:30.260270', '316', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(51, '2025-03-14 07:58:30.262272', '315', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(52, '2025-03-14 07:58:30.264268', '314', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(53, '2025-03-14 07:58:30.266268', '313', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(54, '2025-03-14 07:58:30.268450', '312', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(55, '2025-03-14 07:58:30.268450', '311', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(56, '2025-03-14 07:58:30.268450', '310', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(57, '2025-03-14 07:58:30.268450', '309', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(58, '2025-03-14 07:58:30.268450', '308', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(59, '2025-03-14 07:58:30.268450', '307', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(60, '2025-03-14 07:58:30.268450', '306', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(61, '2025-03-14 07:58:30.284077', '305', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(62, '2025-03-14 07:58:30.287037', '304', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(63, '2025-03-14 07:58:30.287818', '303', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(64, '2025-03-14 07:58:30.287818', '302', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(65, '2025-03-14 07:58:30.287818', '301', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(66, '2025-03-14 07:58:30.287818', '300', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(67, '2025-03-14 07:58:30.287818', '299', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(68, '2025-03-14 07:58:30.287818', '298', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(69, '2025-03-14 07:58:30.287818', '297', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(70, '2025-03-14 07:58:30.303911', '296', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(71, '2025-03-14 07:58:30.306908', '295', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(72, '2025-03-14 07:58:30.308907', '294', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(73, '2025-03-14 07:58:30.310906', '293', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(74, '2025-03-14 07:58:30.312905', '292', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(75, '2025-03-14 07:58:30.314904', '291', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(76, '2025-03-14 07:58:30.316902', '290', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(77, '2025-03-14 07:58:30.319470', '289', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(78, '2025-03-14 07:58:30.321477', '288', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(79, '2025-03-14 07:58:30.323477', '287', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(80, '2025-03-14 07:58:30.324473', '286', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(81, '2025-03-14 07:58:30.326472', '285', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(82, '2025-03-14 07:58:30.328471', '284', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(83, '2025-03-14 07:58:30.329470', '283', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(84, '2025-03-14 07:58:30.331473', '282', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(85, '2025-03-14 07:58:30.333470', '281', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(86, '2025-03-14 07:58:30.335107', '280', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(87, '2025-03-14 07:58:30.335107', '279', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(88, '2025-03-14 07:58:30.335107', '278', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(89, '2025-03-14 07:58:30.335107', '277', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(90, '2025-03-14 07:58:30.335107', '276', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(91, '2025-03-14 07:58:30.335107', '275', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(92, '2025-03-14 07:58:30.335107', '274', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(93, '2025-03-14 07:58:30.335107', '273', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(94, '2025-03-14 07:58:30.335107', '272', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(95, '2025-03-14 07:58:30.351872', '271', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(96, '2025-03-14 07:58:30.353870', '270', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(97, '2025-03-14 07:58:30.354737', '269', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(98, '2025-03-14 07:58:30.354737', '268', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(99, '2025-03-14 07:58:30.354737', '267', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(100, '2025-03-14 07:58:30.354737', '266', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(101, '2025-03-14 07:58:30.354737', '265', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(102, '2025-03-14 07:58:30.354737', '264', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(103, '2025-03-14 07:58:30.354737', '263', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(104, '2025-03-14 07:58:30.354737', '262', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(105, '2025-03-14 07:58:30.370390', '261', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(106, '2025-03-14 07:58:30.372389', '260', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(107, '2025-03-14 07:58:30.373393', '259', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(108, '2025-03-14 07:58:30.375388', '258', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(109, '2025-03-14 07:58:30.377390', '257', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(110, '2025-03-14 07:58:30.379389', '256', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(111, '2025-03-14 07:58:30.381388', '255', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(112, '2025-03-14 07:58:30.383383', '254', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(113, '2025-03-14 07:58:30.385609', '253', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(114, '2025-03-14 07:58:30.387611', '252', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(115, '2025-03-14 07:58:30.389610', '251', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(116, '2025-03-14 07:58:30.391606', '250', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(117, '2025-03-14 07:58:30.393621', '249', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(118, '2025-03-14 07:58:30.395603', '248', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(119, '2025-03-14 07:58:30.396603', '247', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(120, '2025-03-14 07:58:30.398602', '246', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(121, '2025-03-14 07:58:30.400621', '245', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(122, '2025-03-14 07:58:47.020758', '244', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(123, '2025-03-14 07:58:47.023756', '243', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(124, '2025-03-14 07:58:47.025755', '242', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(125, '2025-03-14 07:58:47.028754', '241', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(126, '2025-03-14 07:58:47.030756', '240', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(127, '2025-03-14 07:58:47.032754', '239', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(128, '2025-03-14 07:58:47.034745', '238', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(129, '2025-03-14 07:58:47.037744', '237', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(130, '2025-03-14 07:58:47.039743', '236', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(131, '2025-03-14 07:58:47.041742', '235', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(132, '2025-03-14 07:58:47.043760', '234', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(133, '2025-03-14 07:58:47.044743', '233', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(134, '2025-03-14 07:58:47.046742', '232', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(135, '2025-03-14 07:58:47.048741', '231', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(136, '2025-03-14 07:58:47.051001', '230', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(137, '2025-03-14 07:58:47.051001', '229', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(138, '2025-03-14 07:58:47.051001', '228', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(139, '2025-03-14 07:58:47.051001', '227', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(140, '2025-03-14 07:58:47.051001', '226', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(141, '2025-03-14 07:58:47.051001', '225', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(142, '2025-03-14 07:58:47.051001', '224', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(143, '2025-03-14 07:58:47.051001', '223', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(144, '2025-03-14 07:58:47.066628', '222', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(145, '2025-03-14 07:58:47.069874', '221', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(146, '2025-03-14 07:58:47.069874', '220', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(147, '2025-03-14 07:58:47.069874', '219', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(148, '2025-03-14 07:58:47.069874', '218', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(149, '2025-03-14 07:58:47.069874', '217', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(150, '2025-03-14 07:58:47.069874', '216', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(151, '2025-03-14 07:58:47.069874', '215', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(152, '2025-03-14 07:58:47.069874', '214', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(153, '2025-03-14 07:58:47.084417', '213', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(154, '2025-03-14 07:58:47.086108', '212', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(155, '2025-03-14 07:58:47.087859', '211', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(156, '2025-03-14 07:58:47.089802', '210', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(157, '2025-03-14 07:58:47.091727', '209', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(158, '2025-03-14 07:58:47.093632', '208', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(159, '2025-03-14 07:58:47.095256', '207', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(160, '2025-03-14 07:58:47.096820', '206', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(161, '2025-03-14 07:58:47.098553', '205', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(162, '2025-03-14 07:58:47.100568', '204', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(163, '2025-03-14 07:58:47.102460', '203', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(164, '2025-03-14 07:58:47.104146', '202', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(165, '2025-03-14 07:58:47.105850', '201', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(166, '2025-03-14 07:58:47.107445', '200', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(167, '2025-03-14 07:58:47.109059', '199', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(168, '2025-03-14 07:58:47.110063', '198', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(169, '2025-03-14 07:58:47.112318', '197', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(170, '2025-03-14 07:58:47.113964', '196', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(171, '2025-03-14 07:58:47.115987', '195', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(172, '2025-03-14 07:58:47.117640', '194', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(173, '2025-03-14 07:58:47.117640', '193', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(174, '2025-03-14 07:58:47.117640', '192', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(175, '2025-03-14 07:58:47.117640', '191', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(176, '2025-03-14 07:58:47.117640', '190', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(177, '2025-03-14 07:58:47.117640', '189', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(178, '2025-03-14 07:58:47.117640', '188', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(179, '2025-03-14 07:58:47.117640', '187', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(180, '2025-03-14 07:58:47.117640', '186', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(181, '2025-03-14 07:58:47.133263', '185', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(182, '2025-03-14 07:58:47.135374', '184', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(183, '2025-03-14 07:58:47.136425', '183', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(184, '2025-03-14 07:58:47.136425', '182', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(185, '2025-03-14 07:58:47.136425', '181', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(186, '2025-03-14 07:58:47.136425', '180', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(187, '2025-03-14 07:58:47.136425', '179', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(188, '2025-03-14 07:58:47.136425', '178', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(189, '2025-03-14 07:58:47.147005', '177', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(190, '2025-03-14 07:58:47.147005', '176', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(191, '2025-03-14 07:58:47.147005', '175', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(192, '2025-03-14 07:58:47.152063', '174', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(193, '2025-03-14 07:58:47.154029', '173', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(194, '2025-03-14 07:58:47.155639', '172', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(195, '2025-03-14 07:58:47.157350', '171', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(196, '2025-03-14 07:58:47.159015', '170', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(197, '2025-03-14 07:58:47.160626', '169', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(198, '2025-03-14 07:58:47.163759', '168', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(199, '2025-03-14 07:58:47.165383', '167', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(200, '2025-03-14 07:58:47.166390', '166', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(201, '2025-03-14 07:58:47.169052', '165', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(202, '2025-03-14 07:58:47.170604', '164', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(203, '2025-03-14 07:58:47.172320', '163', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(204, '2025-03-14 07:58:47.174028', '162', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(205, '2025-03-14 07:58:47.175660', '161', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(206, '2025-03-14 07:58:47.177200', '160', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(207, '2025-03-14 07:58:47.178842', '159', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(208, '2025-03-14 07:58:47.180471', '158', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(209, '2025-03-14 07:58:47.181476', '157', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(210, '2025-03-14 07:58:47.183510', '156', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(211, '2025-03-14 07:58:47.185287', '155', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(212, '2025-03-14 07:58:47.185287', '154', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(213, '2025-03-14 07:58:47.185287', '153', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(214, '2025-03-14 07:58:47.185287', '152', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(215, '2025-03-14 07:58:47.185287', '151', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(216, '2025-03-14 07:58:47.185287', '150', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(217, '2025-03-14 07:58:47.185287', '149', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(218, '2025-03-14 07:58:47.185287', '148', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(219, '2025-03-14 07:58:47.185287', '147', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(220, '2025-03-14 07:58:47.203207', '146', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(221, '2025-03-14 07:58:47.203207', '145', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(222, '2025-03-14 07:58:56.257735', '144', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(223, '2025-03-14 07:58:56.268289', '143', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(224, '2025-03-14 07:58:56.271291', '142', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(225, '2025-03-14 07:58:56.272287', '141', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(226, '2025-03-14 07:58:56.275289', '140', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(227, '2025-03-14 07:58:56.277288', '139', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(228, '2025-03-14 07:58:56.279287', '138', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(229, '2025-03-14 07:58:56.281285', '137', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(230, '2025-03-14 07:58:56.283284', '136', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(231, '2025-03-14 07:58:56.285366', '135', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(232, '2025-03-14 07:58:56.286345', '134', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(233, '2025-03-14 07:58:56.288364', '133', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(234, '2025-03-14 07:58:56.290347', '132', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(235, '2025-03-14 07:58:56.291342', '131', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(236, '2025-03-14 07:58:56.293345', '130', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(237, '2025-03-14 07:58:56.294340', '129', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(238, '2025-03-14 07:58:56.296339', '128', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(239, '2025-03-14 07:58:56.298342', '127', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(240, '2025-03-14 07:58:56.299340', '126', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(241, '2025-03-14 07:58:56.300527', '125', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(242, '2025-03-14 07:58:56.300527', '124', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(243, '2025-03-14 07:58:56.300527', '123', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(244, '2025-03-14 07:58:56.300527', '122', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(245, '2025-03-14 07:58:56.300527', '121', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(246, '2025-03-14 07:58:56.300527', '120', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(247, '2025-03-14 07:58:56.300527', '119', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(248, '2025-03-14 07:58:56.320108', '118', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(249, '2025-03-14 07:58:56.320108', '117', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(250, '2025-03-14 07:58:56.320108', '116', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(251, '2025-03-14 07:58:56.320108', '115', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(252, '2025-03-14 07:58:56.320108', '114', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(253, '2025-03-14 07:58:56.336987', '113', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(254, '2025-03-14 07:58:56.338987', '112', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(255, '2025-03-14 07:58:56.340987', '111', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(256, '2025-03-14 07:58:56.343003', '110', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(257, '2025-03-14 07:58:56.345002', '109', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(258, '2025-03-14 07:58:56.347001', '108', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(259, '2025-03-14 07:58:56.348997', '107', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(260, '2025-03-14 07:58:56.351003', '106', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(261, '2025-03-14 07:58:56.353003', '105', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(262, '2025-03-14 07:58:56.355002', '104', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(263, '2025-03-14 07:58:56.357001', '103', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(264, '2025-03-14 07:58:56.358999', '102', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(265, '2025-03-14 07:58:56.360998', '101', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(266, '2025-03-14 07:58:56.362996', '100', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(267, '2025-03-14 07:58:56.365000', '99', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(268, '2025-03-14 07:58:56.367196', '98', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(269, '2025-03-14 07:58:56.367196', '97', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(270, '2025-03-14 07:58:56.367196', '96', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(271, '2025-03-14 07:58:56.367196', '95', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(272, '2025-03-14 07:58:56.367196', '94', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(273, '2025-03-14 07:58:56.367196', '93', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(274, '2025-03-14 07:58:56.367196', '92', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(275, '2025-03-14 07:58:56.367196', '91', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(276, '2025-03-14 07:58:56.384952', '90', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(277, '2025-03-14 07:58:56.386558', '89', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(278, '2025-03-14 07:58:56.386558', '88', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(279, '2025-03-14 07:58:56.386558', '87', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(280, '2025-03-14 07:58:56.386558', '86', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(281, '2025-03-14 07:58:56.386558', '85', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(282, '2025-03-14 07:58:56.386558', '84', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(283, '2025-03-14 07:58:56.386558', '83', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(284, '2025-03-14 07:58:56.401832', '82', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(285, '2025-03-14 07:58:56.403851', '81', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(286, '2025-03-14 07:58:56.404832', '80', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(287, '2025-03-14 07:58:56.406833', '79', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(288, '2025-03-14 07:58:56.407828', '78', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(289, '2025-03-14 07:58:56.409831', '77', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(290, '2025-03-14 07:58:56.410831', '76', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(291, '2025-03-14 07:58:56.412826', '75', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(292, '2025-03-14 07:58:56.414824', '74', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(293, '2025-03-14 07:58:56.415824', '73', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(294, '2025-03-14 07:58:56.419671', '72', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(295, '2025-03-14 07:58:56.420666', '71', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(296, '2025-03-14 07:58:56.422669', '70', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(297, '2025-03-14 07:58:56.423665', '69', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(298, '2025-03-14 07:58:56.425684', '68', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(299, '2025-03-14 07:58:56.427662', '67', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(300, '2025-03-14 07:58:56.428662', '66', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(301, '2025-03-14 07:58:56.430681', '65', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(302, '2025-03-14 07:58:56.431664', '64', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(303, '2025-03-14 07:58:56.433859', '63', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(304, '2025-03-14 07:58:56.433859', '62', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(305, '2025-03-14 07:58:56.433859', '61', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(306, '2025-03-14 07:58:56.433859', '60', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(307, '2025-03-14 07:58:56.433859', '59', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(308, '2025-03-14 07:58:56.433859', '58', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(309, '2025-03-14 07:58:56.433859', '57', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(310, '2025-03-14 07:58:56.433859', '56', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(311, '2025-03-14 07:58:56.433859', '55', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(312, '2025-03-14 07:58:56.449502', '54', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(313, '2025-03-14 07:58:56.451631', '53', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(314, '2025-03-14 07:58:56.453149', '52', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(315, '2025-03-14 07:58:56.453149', '51', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(316, '2025-03-14 07:58:56.458154', '50', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(317, '2025-03-14 07:58:56.458154', '49', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(318, '2025-03-14 07:58:56.458154', '48', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(319, '2025-03-14 07:58:56.458154', '47', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(320, '2025-03-14 07:58:56.458154', '46', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(321, '2025-03-14 07:58:56.458154', '45', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(322, '2025-03-14 07:59:05.767144', '44', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(323, '2025-03-14 07:59:05.770582', '43', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(324, '2025-03-14 07:59:05.773468', '42', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(325, '2025-03-14 07:59:05.776368', '41', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(326, '2025-03-14 07:59:05.779687', '40', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(327, '2025-03-14 07:59:05.782525', '39', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(328, '2025-03-14 07:59:05.785934', '38', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(329, '2025-03-14 07:59:05.785934', '37', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(330, '2025-03-14 07:59:05.785934', '36', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(331, '2025-03-14 07:59:05.785934', '35', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(332, '2025-03-14 07:59:05.785934', '34', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(333, '2025-03-14 07:59:05.801454', '33', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(334, '2025-03-14 07:59:05.803041', '32', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(335, '2025-03-14 07:59:05.803041', '31', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(336, '2025-03-14 07:59:05.803041', '30', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(337, '2025-03-14 07:59:05.810621', '29', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(338, '2025-03-14 07:59:05.810621', '28', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(339, '2025-03-14 07:59:05.810621', '27', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(340, '2025-03-14 07:59:05.810621', '26', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(341, '2025-03-14 07:59:05.817828', '25', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(342, '2025-03-14 07:59:05.820238', '24', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(343, '2025-03-14 07:59:05.821807', '23', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(344, '2025-03-14 07:59:05.823488', '22', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(345, '2025-03-14 07:59:05.825553', '21', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(346, '2025-03-14 07:59:05.827665', '20', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(347, '2025-03-14 07:59:05.829728', '19', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(348, '2025-03-14 07:59:05.831728', '18', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(349, '2025-03-14 07:59:05.833846', '17', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(350, '2025-03-14 07:59:05.835411', '16', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(351, '2025-03-14 07:59:05.837014', '15', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(352, '2025-03-14 07:59:05.838613', '14', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(353, '2025-03-14 07:59:05.840194', '13', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(354, '2025-03-14 07:59:05.841860', '12', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(355, '2025-03-14 07:59:05.843452', '11', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(356, '2025-03-14 07:59:05.845026', '10', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(357, '2025-03-14 07:59:05.847169', '9', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(358, '2025-03-14 07:59:05.849213', '8', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(359, '2025-03-14 07:59:05.850125', '7', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(360, '2025-03-14 07:59:05.850125', '6', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(361, '2025-03-14 07:59:05.850125', '5', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(362, '2025-03-14 07:59:05.850125', '4', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(363, '2025-03-14 07:59:05.850125', '3', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(364, '2025-03-14 07:59:05.850125', '2', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(365, '2025-03-14 07:59:05.850125', '1', 'sanjeev.kumar@postiefs.com - None', 3, '', 30, 12),
(366, '2025-03-14 07:59:17.395943', '25', 'sanjeev.kumar', 3, '', 6, 12);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(3, 'admin', 'logentry'),
(5, 'auth', 'group'),
(4, 'auth', 'permission'),
(6, 'auth', 'user'),
(28, 'authtoken', 'token'),
(29, 'authtoken', 'tokenproxy'),
(7, 'contenttypes', 'contenttype'),
(32, 'employee', 'activitylog'),
(16, 'employee', 'call'),
(15, 'employee', 'callnote'),
(17, 'employee', 'callstatus'),
(19, 'employee', 'clientcallnote'),
(12, 'employee', 'dailyactivity'),
(22, 'employee', 'dailystats'),
(1, 'employee', 'employeeprofile'),
(20, 'employee', 'newcallquery'),
(18, 'employee', 'note'),
(14, 'employee', 'notification'),
(33, 'employee', 'ondutyrequest'),
(10, 'employee', 'session'),
(13, 'employee', 'sessionactivity'),
(2, 'employee', 'ticket'),
(23, 'employee', 'ticketalert'),
(9, 'employee', 'tickethistory'),
(26, 'employee', 'ticketnote'),
(21, 'employee', 'ticketnotification'),
(24, 'employee', 'unifiednotification'),
(11, 'employee', 'useractivity'),
(25, 'employee', 'workreport'),
(8, 'sessions', 'session'),
(27, 'text_improver', 'improvedtext'),
(31, 'tracking', 'activityreport'),
(30, 'tracking', 'useractivity');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-10-01 11:04:14.909236'),
(2, 'auth', '0001_initial', '2024-10-01 11:04:15.780359'),
(3, 'admin', '0001_initial', '2024-10-01 11:04:16.043379'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-10-01 11:04:16.065528'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-10-01 11:04:16.081155'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-10-01 11:04:16.197037'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-10-01 11:04:16.328550'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-10-01 11:04:16.350685'),
(9, 'auth', '0004_alter_user_username_opts', '2024-10-01 11:04:16.381944'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-10-01 11:04:16.533653'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-10-01 11:04:16.533653'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-10-01 11:04:16.563956'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-10-01 11:04:16.614556'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-10-01 11:04:16.675164'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-10-01 11:04:16.715609'),
(16, 'auth', '0011_update_proxy_permissions', '2024-10-01 11:04:16.774259'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-10-01 11:04:16.976797'),
(18, 'employee', '0001_initial', '2024-10-01 11:04:17.128396'),
(19, 'employee', '0002_alter_employeeprofile_skill', '2024-10-01 11:04:17.144023'),
(20, 'employee', '0003_alter_employeeprofile_level', '2024-10-01 11:04:17.309828'),
(21, 'employee', '0004_alter_employeeprofile_level', '2024-10-01 11:04:17.350185'),
(22, 'employee', '0005_alter_employeeprofile_skill', '2024-10-01 11:04:17.398641'),
(23, 'employee', '0006_alter_employeeprofile_level', '2024-10-01 11:04:17.429179'),
(24, 'employee', '0007_ticket', '2024-10-01 11:04:17.681960'),
(25, 'employee', '0008_alter_ticket_group', '2024-10-01 11:04:17.704179'),
(26, 'sessions', '0001_initial', '2024-10-01 11:04:17.825125'),
(27, 'employee', '0009_employeeprofile_status', '2024-10-03 05:12:28.241259'),
(28, 'employee', '0010_employeeprofile_login_time_and_more', '2024-10-03 05:26:31.263988'),
(29, 'employee', '0011_employeeprofile_total_time', '2024-10-03 05:28:39.739243'),
(30, 'employee', '0012_employeeprofile_is_active', '2024-10-03 06:11:09.937970'),
(31, 'employee', '0013_employeeprofile_is_on_break', '2024-10-03 07:13:46.124618'),
(32, 'employee', '0014_employeeprofile_promoted_to_admin', '2024-10-21 09:47:05.683950'),
(33, 'employee', '0015_ticket_assigned_to', '2024-10-30 04:03:21.204753'),
(34, 'employee', '0016_alter_ticket_status', '2024-10-30 04:34:38.209292'),
(35, 'employee', '0017_tickethistory', '2024-10-31 09:51:24.287564'),
(36, 'employee', '0018_rename_timestamp_tickethistory_created_at_and_more', '2024-11-01 05:32:05.426330'),
(37, 'employee', '0019_alter_tickethistory_created_by', '2024-11-01 05:59:41.594865'),
(38, 'employee', '0002_alter_tickethistory_created_by', '2024-11-01 07:52:20.853289'),
(39, 'employee', '0003_alter_ticket_created_by', '2024-11-01 08:05:16.056759'),
(40, 'employee', '0002_ticket_note', '2024-11-01 09:48:22.374646'),
(41, 'employee', '0003_ticket_assigned_by', '2024-11-04 06:06:34.720927'),
(42, 'employee', '0004_ticket_user_alter_ticket_created_by', '2024-11-05 06:07:22.043465'),
(43, 'employee', '0002_ticket_ticket_id', '2024-11-08 04:38:56.808197'),
(44, 'employee', '0003_ticket_assigned_at', '2024-11-08 12:22:08.446455'),
(45, 'employee', '0004_alter_ticket_ticket_id', '2024-11-11 04:42:37.636620'),
(46, 'employee', '0002_employeeprofile_break_duration_and_more', '2024-11-13 04:32:54.340174'),
(47, 'employee', '0003_remove_employeeprofile_break_duration_and_more', '2024-11-13 05:40:20.274294'),
(48, 'employee', '0004_useractivity_delete_session', '2024-11-13 05:47:06.569707'),
(49, 'employee', '0005_session_delete_useractivity', '2024-11-13 06:52:40.515616'),
(50, 'employee', '0006_delete_session', '2024-11-13 07:19:50.084145'),
(51, 'employee', '0007_employeeprofile_break_duration_and_more', '2024-11-13 09:11:48.387368'),
(52, 'employee', '0008_remove_employeeprofile_break_duration_and_more', '2024-11-14 05:14:17.613509'),
(53, 'employee', '0009_session', '2024-11-14 08:50:42.944517'),
(54, 'employee', '0010_dailyactivity_active_sessions_delete_session', '2024-11-14 09:08:30.854080'),
(55, 'employee', '0011_remove_dailyactivity_active_sessions_and_more', '2024-11-14 09:14:48.057193'),
(56, 'employee', '0012_remove_dailyactivity_session_times_and_more', '2024-11-14 09:24:08.039642'),
(57, 'employee', '0013_sessionactivity', '2024-11-15 04:19:43.798585'),
(58, 'employee', '0014_remove_dailyactivity_accumulated_work_time', '2024-11-15 04:46:07.084194'),
(59, 'employee', '0015_sessionactivity_break_start_time', '2024-11-15 07:12:42.064165'),
(60, 'employee', '0016_ticket_time_spent_ticket_work_start_time', '2024-11-18 06:26:46.080870'),
(61, 'employee', '0017_ticket_is_active', '2024-11-19 08:11:37.258705'),
(62, 'employee', '0018_ticket_break_duration_ticket_break_start_time', '2024-11-27 03:43:10.198618'),
(63, 'employee', '0019_remove_ticket_break_start_time', '2024-11-27 03:43:10.220776'),
(64, 'employee', '0020_remove_ticket_break_duration', '2024-11-27 03:43:10.283296'),
(65, 'employee', '0021_ticket_priority', '2024-12-04 05:19:57.926229'),
(66, 'employee', '0022_notification', '2024-12-04 10:02:56.275531'),
(67, 'employee', '0023_ticket_call_duration_ticket_call_end_time_and_more', '2024-12-09 06:07:37.008210'),
(68, 'employee', '0024_ticket_call_in_progress', '2024-12-10 08:47:05.771520'),
(69, 'employee', '0025_ticket_call_timer_started_by_call', '2024-12-11 11:43:17.656946'),
(70, 'employee', '0026_callnote', '2024-12-12 10:51:32.440095'),
(71, 'employee', '0027_call', '2024-12-12 11:32:33.726363'),
(72, 'employee', '0028_callstatus', '2024-12-19 07:07:42.220729'),
(73, 'employee', '0029_delete_callstatus', '2024-12-20 06:50:07.045059'),
(74, 'employee', '0030_ticket_individual_time_spent', '2024-12-27 06:11:15.117607'),
(75, 'employee', '0031_ticket_break_duration_ticket_last_break_time', '2024-12-30 10:32:02.312662'),
(76, 'employee', '0032_note', '2025-01-06 09:23:03.396503'),
(77, 'employee', '0033_rename_text_note_note_text', '2025-01-06 10:10:04.414134'),
(78, 'employee', '0034_ticket_client_call_note', '2025-01-09 05:39:41.621722'),
(79, 'employee', '0035_clientcallnote_remove_call_call_duration_and_more', '2025-01-15 11:24:18.230911'),
(80, 'employee', '0036_ticket_paused_ticket_id', '2025-01-16 06:50:31.369539'),
(81, 'employee', '0037_remove_ticket_paused_ticket_id', '2025-01-16 06:52:40.228423'),
(82, 'employee', '0038_employeeprofile_is_on_call', '2025-01-16 09:19:23.785886'),
(83, 'employee', '0039_ticket_paused_by_other_call_ticket_paused_time', '2025-01-16 10:03:54.111244'),
(84, 'employee', '0040_newcallquery', '2025-01-21 12:46:16.852870'),
(85, 'employee', '0041_newcallquery_client_name', '2025-01-22 04:10:44.681011'),
(86, 'employee', '0042_employeeprofile_call_start_time_and_more', '2025-01-22 05:25:19.129327'),
(87, 'employee', '0043_clientcallnote_call_duration_seconds', '2025-01-22 10:02:20.749638'),
(88, 'employee', '0044_ticketnotification', '2025-01-23 06:28:31.571838'),
(89, 'employee', '0045_ticket_status_changed', '2025-01-27 06:46:18.049483'),
(90, 'employee', '0046_ticket_acknowledged_at_ticket_is_acknowledged_and_more', '2025-01-28 10:28:42.771261'),
(91, 'employee', '0047_delete_notification', '2025-01-28 11:33:58.135186'),
(92, 'employee', '0048_dailystats', '2025-01-29 06:02:37.244720'),
(93, 'employee', '0049_alter_ticket_created_at', '2025-01-29 07:42:46.197757'),
(94, 'employee', '0050_alter_ticket_created_at', '2025-01-29 09:04:09.049000'),
(95, 'employee', '0051_delete_dailystats', '2025-01-30 07:03:56.673438'),
(96, 'employee', '0052_ticket_environment', '2025-01-31 05:34:58.279923'),
(97, 'employee', '0053_ticketalert', '2025-01-31 06:17:09.958098'),
(98, 'employee', '0054_alter_ticketalert_unique_together', '2025-01-31 07:36:28.852426'),
(99, 'employee', '0055_unifiednotification_remove_ticketnotification_ticket_and_more', '2025-02-03 06:31:44.905676'),
(100, 'employee', '0056_alter_unifiednotification_notification_type', '2025-02-04 04:43:42.898527'),
(101, 'employee', '0057_alter_ticket_status', '2025-02-05 11:19:10.131200'),
(102, 'employee', '0058_workreport', '2025-02-10 07:16:06.615649'),
(103, 'employee', '0059_employeeprofile_profile_picture', '2025-02-11 10:18:53.660738'),
(104, 'employee', '0060_ticketnote', '2025-02-19 09:42:24.930837'),
(105, 'text_improver', '0001_initial', '2025-02-27 05:15:06.990073'),
(106, 'authtoken', '0001_initial', '2025-03-04 06:00:57.135662'),
(107, 'authtoken', '0002_auto_20160226_1747', '2025-03-04 06:00:57.220331'),
(108, 'authtoken', '0003_tokenproxy', '2025-03-04 06:00:57.235975'),
(109, 'authtoken', '0004_alter_tokenproxy_options', '2025-03-04 06:00:57.242483'),
(110, 'tracking', '0001_initial', '2025-03-04 06:00:57.634019'),
(111, 'tracking', '0002_alter_useractivity_options_and_more', '2025-03-04 11:15:54.482745'),
(112, 'tracking', '0003_remove_useractivity_employee_profile_and_more', '2025-03-04 11:42:54.647690'),
(113, 'tracking', '0004_useractivity_date_useractivity_email_and_more', '2025-03-05 08:25:40.510386'),
(114, 'tracking', '0005_useractivity_created_at', '2025-03-06 06:16:55.451702'),
(115, 'tracking', '0006_useractivity_process_start_time', '2025-03-06 07:18:36.104739'),
(116, 'tracking', '0007_remove_useractivity_active_window_title_and_more', '2025-03-12 05:31:08.281921'),
(117, 'tracking', '0008_alter_activityreport_unique_together_and_more', '2025-03-13 12:52:22.256031'),
(118, 'tracking', '0009_alter_useractivity_options_and_more', '2025-03-13 13:09:15.919258'),
(119, 'tracking', '0010_activityreport_alter_useractivity_options_and_more', '2025-03-13 13:14:56.666554'),
(120, 'employee', '0061_activitylog_dailyactivity_total_idle_time', '2025-03-14 05:33:46.879355'),
(121, 'tracking', '0011_useractivity_idle_start_time', '2025-03-14 07:11:26.238412'),
(122, 'employee', '0062_delete_activitylog', '2025-03-14 11:16:13.838825'),
(123, 'employee', '0063_employeeprofile_is_idle_and_more', '2025-03-17 05:50:17.259098'),
(124, 'employee', '0064_employeeprofile_reporting_manager_ondutyrequest', '2025-03-17 09:30:16.057117'),
(125, 'employee', '0065_ondutyrequest_end_time_ondutyrequest_start_time', '2025-03-18 06:33:18.322452'),
(126, 'tracking', '0012_useractivity_hostname', '2025-03-18 11:37:42.749935');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0ekgik4knjthy1dfl8xw22j9ri4mi9li', 'e30:1t381I:3_4GN_Ua7-sokfQfmFtwtCBArfp8q_DGWQ6bOHA_T5A', '2024-11-05 06:05:28.763483'),
('0jwof7uh53g0qlklaq0b1op4qmqb9xtx', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1t8Xsf:B0D1GPjHR7fPRRuTDUxFHCCk4mv8P3XapcexGnXwONA', '2024-11-06 04:52:57.233901'),
('0ovr1jvd3je0f2kclpix31kp3nly52e9', 'e30:1t2nSV:IXukymgVm5cbExNRdHeGpwPJMvT_EK9Rp7n4Ouwk6uo', '2024-11-04 08:08:11.462121'),
('1c9r7qtbcl7aivbofn1z4qe5sjtxauws', '.eJxVjMsOgjAURP-lW6W5LZc-WLp35765fQlKIIFiYoz_LiQudDeZOXNezNFaOrcuaXZ9ZC0TyI6_padwT-O-xBuN14mHaSxz7_mO8O-68PMU03D6sn-CjpZue4MVgnQyscmorfDJExitc5NEnShLFVKNxgrMCgl9RCP3pLwMUZGnTTrQUhyF0j_68tyUEiRWQlSgL9C00rRoOYBFhQeAFoC9P8SGRX4:1t8v4b:PY9saIXnMdBH7wLI-_lZDD2OUtrJ7BSIcPajAcmBq0g', '2024-11-07 05:43:49.123882'),
('1wt78bjbflud38nn2d3m6uc7uaon5gb9', 'e30:1t8bpy:9gl6mfrmMmNLXRHSHhJ0l7yhzwE81FBzoHca6M64sgQ', '2024-11-06 09:06:26.552841'),
('3t2ponlsy8dq6v5chtl3mgt4asxta8qg', '.eJxVjr0OgjAURt-lq9LcltJeGN3d3JvbP6kSSKCYGOO7C4mDruc7OflezNJaersucbY5sI4Jw46_0JG_x3Ffwo3G68T9NJY5O74r_Lsu_DyFOJy-7l-gp6XfuxJ9C06hqU1Eh5i0jlpvzGskV4ckUoMok0qGhCdZC2yD08HUpDztrwZaiiVf8iOX55aUIFUlRAXmAk0n2w4Ub7RALQ8AHQB7fwCgBkUJ:1t8v4q:5-_fNA3x_z1zfpw8soTvjdA-rPlPVaYLvhN1h84mF4g', '2024-11-07 05:44:04.594858'),
('4a94twzcmaeu6mg5bl8kjps25jay1g58', '.eJxVjLsOAiEQAP-F2hB5CHuW9n4D2WVBTg0kx11l_HcluULbmcm8RMBtLWHraQkzi7NQXhx-IWF8pDoM37HemoytrstMciRyt11eG6fnZW__BgV7GV8NcTqSBW98AgLIziXnviw6QDKcVT4B6GyzRxVRGwUTk2Nv0Eb04v0B_fU4JQ:1t90VE:NJJZaASZK22IOG4fUbk5sHRboWOm6w1t8fauFzu-Sf4', '2024-11-07 11:26:40.751789'),
('4khc6zoau483kwyxl07j3a8clwoh0w7v', '.eJxVjDsOwjAQBe_iGlnG8ZeSPmewdr1rHECOFCcV4u4QKQW0b2beSyTY1pq2zkuaSFzE2YrT74iQH9x2Qndot1nmua3LhHJX5EG7HGfi5_Vw_w4q9PqtcwDjvFKBggJk4zUUZYaCvgRj_KCKZe21KxHJRR0HS55YW86IGosT7w8BbThE:1t9J2p:YQAwr5_nzKSrTq6wnb7ADoPeoKv0RQ52hwyrnLDYf3A', '2024-11-08 07:14:35.876213'),
('4lo9dkcywimpaz8xgdi33pblmfnlvvg6', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1t9Lj5:vKBM1yfWEsVedT2auaFdbZmninuAjC2xBmldJ8w7OHA', '2024-11-08 10:06:23.110443'),
('4olcc1qn7qf8m3fvspzgk01kixg30qyl', '.eJxVjLsOAiEQAP-F2hB5CHuW9n4D2WVBTg0kx11l_HcluULbmcm8RMBtLWHraQkzi7NQXhx-IWF8pDoM37HemoytrstMciRyt11eG6fnZW__BgV7GV8NcTqSBW98AgLIziXnviw6QDKcVT4B6GyzRxVRGwUTk2Nv0Eb04v0B_fU4JQ:1t90JJ:N1YsXDeLd9BaYBvf0CbwTGHSWu65SVKUCLRP3RseW5w', '2024-11-07 11:14:21.105503'),
('4z1dburpgebkra0a5kjefsjxj11j4brh', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1tYdOC:5S9C-4xgyvkPfKu3Et5u4fgrSPoR-vKDJOPWN4MIFhA', '2025-01-31 03:51:20.222133'),
('5ysw50hlvacwcdw1matwxeowq71x3t7e', '.eJxVjLsOAiEQAP-F2hB5CHuW9n4D2WVBTg0kx11l_HcluULbmcm8RMBtLWHraQkzi7NQXhx-IWF8pDoM37HemoytrstMciRyt11eG6fnZW__BgV7GV8NcTqSBW98AgLIziXnviw6QDKcVT4B6GyzRxVRGwUTk2Nv0Eb04v0B_fU4JQ:1t8Zvf:fQYBsMvIrXdIae6pxu63Va_U0W3i2fgnEWwjaU596Io', '2024-11-06 07:04:11.040743'),
('77sdmlta0hhqlrskf1d7ob0re0uu2etq', '.eJxVjLsOAiEQAP-F2hB5CHuW9n4D2WVBTg0kx11l_HcluULbmcm8RMBtLWHraQkzi7NQXhx-IWF8pDoM37HemoytrstMciRyt11eG6fnZW__BgV7GV8NcTqSBW98AgLIziXnviw6QDKcVT4B6GyzRxVRGwUTk2Nv0Eb04v0B_fU4JQ:1t8a8n:ItcDJQ57eoONLsu6fa54VZKQbAiue-N5RZwAiPtLDNM', '2024-11-06 07:17:45.683995'),
('8hxw5ws85mhk60l73nl4h7at7m710be0', 'e30:1tBoE7:bjdTHcddvTsB31u3iYaMGW5XUM8HjffPZwMyOxyqKGY', '2024-11-29 04:46:35.400699'),
('8ppdw3ajwo6o2658omysynmo0ql1d1ag', '.eJxVjLsOAiEQAP-F2hB5CHuW9n4D2WVBTg0kx11l_HcluULbmcm8RMBtLWHraQkzi7NQXhx-IWF8pDoM37HemoytrstMciRyt11eG6fnZW__BgV7GV8NcTqSBW98AgLIziXnviw6QDKcVT4B6GyzRxVRGwUTk2Nv0Eb04v0B_fU4JQ:1t9Mev:-OlVfNWIqyhBrN_OGYH0k2s0sfhaAZShGRoKO13uxzU', '2024-11-08 11:06:09.323302'),
('8t5yp96jlbdvh2sket7cv62q8t1hnt3f', 'e30:1tBYN8:CQIQqESxn8VemGZf_gg6jVlsm3gEQCx7Z8S3nE91AhQ', '2024-11-28 11:50:50.356394'),
('8tx5c24g2rm672dp7898wi6w1ukk5qzj', '.eJxVjMsOwiAQRf-FtSEdBii6dN9vIAPD2KqBpI-V8d-1SRe6veec-1KRtnWM21LmOLG6KDDq9Dsmyo9Sd8J3qremc6vrPCW9K_qgix4al-f1cP8ORlrGb42ci0HqOaNP7Lx0Z9slEQ7SQ--tD0FAikfTgUdxhixYci4bBAYJ6v0BE2Y30w:1t8xqJ:rcOz84AbgMGp6qmYRju6tjGoJbTOdWY3dLuBlV8pzFY', '2024-11-07 08:36:15.953325'),
('9jkevktica79xe40ynkbfetfdncpwzp7', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1t9Mel:hJuI5xnl7xqUlcMwTsp7AgvfTiiUpvmKY5VYZvDlRnY', '2024-11-08 11:05:59.689282'),
('9jm0oy8szl9w8h7bmv8rg3uu1h7pzv43', '.eJxVjLsOAiEQAP-F2hB5CHuW9n4D2WVBTg0kx11l_HcluULbmcm8RMBtLWHraQkzi7NQXhx-IWF8pDoM37HemoytrstMciRyt11eG6fnZW__BgV7GV8NcTqSBW98AgLIziXnviw6QDKcVT4B6GyzRxVRGwUTk2Nv0Eb04v0B_fU4JQ:1t9NEJ:IstcmgztdN5Yi-OXTWof5zbEEOnQRs_Xa1b0kHdPx_A', '2024-11-08 11:42:43.037180'),
('9pqtylc9wmmfphis0nawzuxgngq4x6gb', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1t90Gy:qepGX_gqoXLAEjT9aOZgqFovbr_fD6ahr53fvuwyLoQ', '2024-11-07 11:11:56.395780'),
('abbmixseln47o8qc91e9oagcliuydt1z', 'e30:1t2pwa:FarzfkC6p4YqXbiUQr1aMMdFdoNQUT7O8azCsTfnTDk', '2024-11-04 10:47:24.590209'),
('aluzpcl3gbsd1sz21jpka6eqyzl4p1pk', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1t9HRG:dDv66p79TvdQojY2uvVnXXe9cDiSEYREtEyZvnqDLuE', '2024-11-08 05:31:42.124881'),
('b0sq8lwvk4d20uwi3ygo2bwv59fh2vf2', '.eJxVjLsOAiEQAP-F2hB5CHuW9n4D2WVBTg0kx11l_HcluULbmcm8RMBtLWHraQkzi7NQXhx-IWF8pDoM37HemoytrstMciRyt11eG6fnZW__BgV7GV8NcTqSBW98AgLIziXnviw6QDKcVT4B6GyzRxVRGwUTk2Nv0Eb04v0B_fU4JQ:1t8aQF:5mBqZ4970WIk7HZFN7b5CZpJ7XAVIzhceQVVabEu7ow', '2024-11-06 07:35:47.233063'),
('d7fgof5ud8d224o6uh4xo625jzqgxe4b', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1tDcBn:DCz0ApttJD_WYXCalvrmCiMWhs6CaE3G9YucVvrRrvo', '2024-12-04 04:19:39.202226'),
('d96tci9zfon7a24gv9yvc7707ad6weql', '.eJxVjDsOwjAQBe_iGlnG8ZeSPmewdr1rHECOFCcV4u4QKQW0b2beSyTY1pq2zkuaSFzE2YrT74iQH9x2Qndot1nmua3LhHJX5EG7HGfi5_Vw_w4q9PqtcwDjvFKBggJk4zUUZYaCvgRj_KCKZe21KxHJRR0HS55YW86IGosT7w8BbThE:1t8ZUj:xob4psOQhb8LRWO7hYfWHVL6HGWKu8pAUKTMUQsjxPQ', '2024-11-06 06:36:21.213684'),
('doelhpvepobruxjah9u7s2fbt5l2bi4h', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1tzDP4:4Jzyp8-ia0q-44Pxb6fVg3yHsMYoX5utiR4h_FaBg3I', '2025-04-14 11:34:06.856287'),
('emhlyq9her12hfk7bc08qiwwx9bpa4at', '.eJxVjssOgjAQRf-lW6WZPmyHLt27c0-mL0EJJFBMjPHfhYSFbs89Oblv1tBS2maZ09R0kTkmLDv-Qk_hkYZtiXcabiMP41CmzvNN4fs688sYU3_e3b9AS3O7dSWGGrxGq2xCj5iNScasLBgkr2IW-YQos86WRCCpBNbRm2gV6UDbq57m0lAo3bMrrzUpQepKiArsFYwD6UBxNHWt9QHAAbDPF5_yRQw:1t8val:Jl5nc8oJcg8lQpuuOXCwxpQ4Y5HTRmlDIRYycYnfr_w', '2024-11-07 06:17:03.891487'),
('f70uclmajpsabpi3jkw6d79zhlyxgw4m', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1t8a8G:nFu3BP1aOtucBx6trK1D-fQnkKlmD23fcobNmN1Jcic', '2024-11-06 07:17:12.595735'),
('fpzmc5yg2eybh99jk5m3bzarj91q8nnn', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1t8Xcb:vlAmznwC0uwtMP-HeDZED7ywAyC2zMSAj-Y7lckLAx0', '2024-11-06 04:36:21.436231'),
('gnkw18zj2ie0p7srt6z9a224rh5cywlz', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1tKx5S:sv04X15z4MpLAYUu7yxc7LkHZMVvjnwpGOPOTmNeoMY', '2024-12-24 10:03:26.509895'),
('gq3uy0qmi4eic4f5app6ih1aogo66qvj', 'e30:1tBYRd:zH_6W27jbxKXUHus-KXnmzI7zIuVwytDIXBWE7I--S8', '2024-11-28 11:55:29.791448'),
('hebuh7ckxmmy7f7bqswmbzpmg6lh1qhf', '.eJxVjLsOAiEQAP-F2hB5CHuW9n4D2WVBTg0kx11l_HcluULbmcm8RMBtLWHraQkzi7NQXhx-IWF8pDoM37HemoytrstMciRyt11eG6fnZW__BgV7GV8NcTqSBW98AgLIziXnviw6QDKcVT4B6GyzRxVRGwUTk2Nv0Eb04v0B_fU4JQ:1t9N1f:UlPYL0hD_VGZzmf1oGp6baGs8lI8dmdpmE2-csjbHBI', '2024-11-08 11:29:39.385779'),
('hk63ws1od83t5wa7q4uv13qgrfl5gd5w', 'e30:1t8a7v:eeM3c9_kqLf5Iw8FBQSVrjdl4vo-M0vU-KEu6VEuonM', '2024-11-06 07:16:51.952743'),
('hkgv0loildv9xow9plg95uyge4l4c8l2', 'e30:1tBoFk:3Rz_nyT7t7T-fISnuqro5ySjZrkeph_7HW8tiuwM0rA', '2024-11-29 04:48:16.994234'),
('hm5unnij6ppih3keugobfoxpnxw1gafk', '.eJxVjMsOwiAQAP-FsyEgTz167zc0u8siVQNJaU_GfzckPeh1ZjJvMcO-lXnvvM5LElehjTj9QgR6ch0mPaDem6RWt3VBORJ52C6nlvh1O9q_QYFexhctXFRO0WdDyiBl50BzyIFjOFv02iVl3cDOUvCeow5Ga4wEPigvPl8M0zeq:1t8zzd:leUb0r2ijpXbMYU1KQugijAzMgucrG1M4JRyl0enW3M', '2024-11-07 10:54:01.137841'),
('ig5de6ncmz8w96t3553qxb6gjmlt8pal', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1t8bvT:LsnpVEBYZYvd4MfQQQJcuP_2fuu_FedxfCFYBIsksKk', '2024-11-06 09:12:07.388217'),
('iu1akaqqds5bhb5jlffe1to654t1t0ex', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1t8cVq:zYF1sOhA6iqqHWydzfYxijSRfA7R16UO3iSX0qtogNM', '2024-11-06 09:49:42.768591'),
('j3v3wruhopzylrmlchl4liqid3wl0hbg', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1t9GNq:sn8w32gto8Klrza1zqBAr6sm4RTrwK_kBmLCfeMlfD4', '2024-11-08 04:24:06.687600'),
('j7l2dj9yuymb3lzylksikqcq8l6nignb', 'e30:1tBYOv:UN3DHYx9DvsvKeixpKPf5lYqV2Xca3vjnWJ97rubZAE', '2024-11-28 11:52:41.985993'),
('jab9f0bukabz7qtk9880bcudanmc8b2r', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1t8cwK:djVxD8b-PXyqnXJ71zkplXKjNx9wxHLmVwYd5NOOnog', '2024-11-06 10:17:04.688641'),
('jh101u5l50a5qpseb2gtk7amrvnc8r59', '.eJxVjLsOAiEQAP-F2hB5CHuW9n4D2WVBTg0kx11l_HcluULbmcm8RMBtLWHraQkzi7NQXhx-IWF8pDoM37HemoytrstMciRyt11eG6fnZW__BgV7GV8NcTqSBW98AgLIziXnviw6QDKcVT4B6GyzRxVRGwUTk2Nv0Eb04v0B_fU4JQ:1t8uaA:23KWiRekbeQIB-6G_-Iw9UlKMHF_gHkvC8t2lDCKh4w', '2024-11-07 05:07:22.964654'),
('jxm9gw8wmlw9hvr4gv8vm5mxmyfk0p8n', '.eJxVjLsOAiEQAP-F2hB5CHuW9n4D2WVBTg0kx11l_HcluULbmcm8RMBtLWHraQkzi7NQXhx-IWF8pDoM37HemoytrstMciRyt11eG6fnZW__BgV7GV8NcTqSBW98AgLIziXnviw6QDKcVT4B6GyzRxVRGwUTk2Nv0Eb04v0B_fU4JQ:1t8cW0:iJKEPemnIQXGf9teVFI8mp1CXVFU-kP_8DNva2-cH-w', '2024-11-06 09:49:52.113472'),
('l3p97cg39qycsuu4bd1qs77uvw6acsvo', 'e30:1t4EEt:nddDYHalbSJhztSVzuUSHs2kJP7OaCuNGjk4SUFElEc', '2024-11-08 06:56:03.126802'),
('lzqxtn318utwk5c2nkx4r53e0k55ibbw', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1t8arB:6ByUg32IL-L7BE9s2u_uh841b-8hEcXroyIPH_X2Lwc', '2024-11-06 08:03:37.829537'),
('mdpcwsf5pmt385a83gmbmdtcojz77xau', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1t8utZ:EjucvmkBS4-WZ9A_JmgZqW2OMJ6p-4ww4epLYVCyNyg', '2024-11-07 05:27:25.031832'),
('mma7484wdglwu8qkl9n39mchkul105cn', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1tGFuP:4x3AKL3Nmc1D36qxzpjnuL6FG5CbfwtkvBVaQihLqmw', '2024-12-11 11:08:37.289421'),
('mnwdeqfpugoe5oig7mgnpti71vzkv9s8', '.eJxVjMsOwiAQAP-FsyEgTz167zc0u8siVQNJaU_GfzckPeh1ZjJvMcO-lXnvvM5LElehjTj9QgR6ch0mPaDem6RWt3VBORJ52C6nlvh1O9q_QYFexhctXFRO0WdDyiBl50BzyIFjOFv02iVl3cDOUvCeow5Ga4wEPigvPl8M0zeq:1tzWFd:lt7melCg8y7qD4uHBSnPGQKYMEhT7cB-KmX1gKiz_D8', '2025-04-15 07:41:37.765608'),
('mpcnjks6klse01bu4ricx8ga8q6ck6cc', '.eJxVjLsOAiEQAP-F2hB5CHuW9n4D2WVBTg0kx11l_HcluULbmcm8RMBtLWHraQkzi7NQXhx-IWF8pDoM37HemoytrstMciRyt11eG6fnZW__BgV7GV8NcTqSBW98AgLIziXnviw6QDKcVT4B6GyzRxVRGwUTk2Nv0Eb04v0B_fU4JQ:1t8utS:LTIbZD3L0OC-Ambp2uS01vrT8XzlJ7icf3g7l2usOjg', '2024-11-07 05:27:18.964135'),
('mx2d6uq8d02125lez04tqwccxpbm2suy', '.eJxVjLsOAiEQAP-F2hB5CHuW9n4D2WVBTg0kx11l_HcluULbmcm8RMBtLWHraQkzi7NQXhx-IWF8pDoM37HemoytrstMciRyt11eG6fnZW__BgV7GV8NcTqSBW98AgLIziXnviw6QDKcVT4B6GyzRxVRGwUTk2Nv0Eb04v0B_fU4JQ:1t8bdw:Iu3mssgsADOd40DKeJR-MBcvtpZ6j3YbaZRVX7afhEw', '2024-11-06 08:54:00.655511'),
('nm6o8w8t5bqi6sk8ztaoniyyvc3reern', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1t9N1O:y60lBPGAdqXzuqWtqYVx1tn0MaxmXkWNZj6ab5_Bvtk', '2024-11-08 11:29:22.621270'),
('nsqhgyjpo1xp5bbt2eqs53gwzr55u2im', 'e30:1t2mRj:IlfHbnnB0QiLACUhmWaOL1tnreL4pdLGqcMEc0v_0bY', '2024-11-04 07:03:19.757767'),
('nznl9xsvl4fx4plkhto6i6q4e2ixw1u3', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1t8YKg:BXgiElji4NB3F6xl3QstH6TdgYANNgtRGzYiINKYlUc', '2024-11-06 05:21:54.387266'),
('o3r7kema7hkuxtqwttjwpmfwlp2d4tds', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1t9NBt:Ws-H7ikvIL_7E3FPfPCVRkyTB63YMb7hjUwzs4Wmd2w', '2024-11-08 11:40:13.607125'),
('p86zxp2if7cqm1eixtoplwi4auvt4xjc', 'e30:1t2puy:w363FdJ44WG_ue7HvcbsN0Y7UCCQryCGWx8oafn48Kg', '2024-11-04 10:45:44.887258'),
('pgkgsw4unjsb0s5p3xys6hrggbsef3mq', '.eJxVjLsOAiEQAP-F2hB5CHuW9n4D2WVBTg0kx11l_HcluULbmcm8RMBtLWHraQkzi7NQXhx-IWF8pDoM37HemoytrstMciRyt11eG6fnZW__BgV7GV8NcTqSBW98AgLIziXnviw6QDKcVT4B6GyzRxVRGwUTk2Nv0Eb04v0B_fU4JQ:1t8bPo:-ucBioUkDCKSlbGAoC8RAaIbWYuycpv4Q3lrs4HWg5w', '2024-11-06 08:39:24.069532'),
('pzf7ipyt4mue84yugwl8mo6af5g3o3tc', '.eJxVjLsOAiEQAP-F2hB5CHuW9n4D2WVBTg0kx11l_HcluULbmcm8RMBtLWHraQkzi7NQXhx-IWF8pDoM37HemoytrstMciRyt11eG6fnZW__BgV7GV8NcTqSBW98AgLIziXnviw6QDKcVT4B6GyzRxVRGwUTk2Nv0Eb04v0B_fU4JQ:1t8xqc:qXiF5H2yl69tJ2ESXAeOWPKBFDM7q_byuTtVSi8S2jk', '2024-11-07 08:36:34.063056'),
('qmpxi6irekjlg09oj85832nqkffrgg6l', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1t8wTa:Q3vucSQUxMv2OH2OYADFSmVcuN0SU68pLhLRcJtpDU4', '2024-11-07 07:08:42.157123'),
('qr5q6mvsrv316qydfjvrdd5n1hsls9wf', '.eJxVjLsOAiEQAP-F2hB5CHuW9n4D2WVBTg0kx11l_HcluULbmcm8RMBtLWHraQkzi7NQXhx-IWF8pDoM37HemoytrstMciRyt11eG6fnZW__BgV7GV8NcTqSBW98AgLIziXnviw6QDKcVT4B6GyzRxVRGwUTk2Nv0Eb04v0B_fU4JQ:1t9HRP:LV3mfYSNwvZz4mVgRoZakGQuUbT6n5_yjSryp8ZZ71k', '2024-11-08 05:31:51.959534'),
('r3bex4729gbhj05x3d4qwbuirvm8i8y2', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1t9G2I:yFchvXbYHx8Grl3-NElhkBaDm8fyEOu4F0CU-Hk-xQE', '2024-11-08 04:01:50.316001'),
('sef7xl589sqz2v743nt8focmw5je4ba1', '.eJxVjMsOwiAQAP-FsyEgTz167zc0u8siVQNJaU_GfzckPeh1ZjJvMcO-lXnvvM5LElehjTj9QgR6ch0mPaDem6RWt3VBORJ52C6nlvh1O9q_QYFexhctXFRO0WdDyiBl50BzyIFjOFv02iVl3cDOUvCeow5Ga4wEPigvPl8M0zeq:1t90UV:18EF5Fs4LvrL8_w4H5u3PzGGWLCTOeMaYFyMQNXzty0', '2024-11-07 11:25:55.472611'),
('simj1l39vegh8cbn25yb0sa8ss734cww', '.eJxVjMsOwiAQAP-FsyEgTz167zc0u8siVQNJaU_GfzckPeh1ZjJvMcO-lXnvvM5LElehjTj9QgR6ch0mPaDem6RWt3VBORJ52C6nlvh1O9q_QYFexhctXFRO0WdDyiBl50BzyIFjOFv02iVl3cDOUvCeow5Ga4wEPigvPl8M0zeq:1t9G44:EHmpgF5QEAOnVgI7_5DuotIFz84A92oHGsm3Yxj2ay4', '2024-11-08 04:03:40.375502'),
('sp0o3j0b4btb7k2r1aejkcmzag8x757n', 'e30:1t8bPd:ZRA2NzykcRBSLvks_YBRl4cNQvQObe_T3j9xRH0FtG8', '2024-11-06 08:39:13.261498'),
('tbxjvxr4pesu4qtk6v8gs4ccoy3qcrwy', 'e30:1t2nbJ:wo6yYZJiS1icSZwaJZzmTl1iYT3f8c7mypuG-1jYdiE', '2024-11-04 08:17:17.946809'),
('tqegwppnvu6018u9v9qqvlpbb6erkryu', '.eJxVjDsOwyAQBe9CHaHlZyBlep8B7QIOTiKQjF1FuXuE5CJp38y8Nwt47CUcPW9hTezKhGOX35EwPnMdJD2w3huPre7bSnwo_KSdzy3l1-10_w4K9jJq65SlJAURCECfNWUPTloBZBJEIzBZjaBNlNZOSnknF2mWSOhhAsc-X_uSN2U:1t9LfZ:VT3fAWkm3vv4SrwAkbNK9vkS3DJIfbMM8_bllPPslAk', '2024-11-08 10:02:45.454338'),
('tqv4dn6z09ilkqoza4kgm1u39b6qv1li', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1t8zzM:PXNS1S50yMYKs-MjXmpk7OnCaMLEltHFKBdP3c86v38', '2024-11-07 10:53:44.028703'),
('uk39ayqyx6u1qpd1p4lgsq82ojoehyeo', '.eJxVjLsOAiEQAP-F2hB5CHuW9n4D2WVBTg0kx11l_HcluULbmcm8RMBtLWHraQkzi7NQXhx-IWF8pDoM37HemoytrstMciRyt11eG6fnZW__BgV7GV8NcTqSBW98AgLIziXnviw6QDKcVT4B6GyzRxVRGwUTk2Nv0Eb04v0B_fU4JQ:1t8cC7:-sNA5824k3TQ-KZbaZoqIlUG3P0E3dwPT6FFCBjCg-8', '2024-11-06 09:29:19.861330'),
('usdj3ox7y3oyem2pdcixclgp09puqsra', '.eJxVjDsOwyAQBe9CHaHlZyBlep8B7QIOTiKQjF1FuXuE5CJp38y8Nwt47CUcPW9hTezKhGOX35EwPnMdJD2w3huPre7bSnwo_KSdzy3l1-10_w4K9jJq65SlJAURCECfNWUPTloBZBJEIzBZjaBNlNZOSnknF2mWSOhhAsc-X_uSN2U:1t9J2c:b-EjwZBRxBl_GVRtI57hhtZPExM9iYGYUQtGHJggbD4', '2024-11-08 07:14:22.398520'),
('vjndoc13vb4ntam2lnzd2vi3dqg7thu8', 'e30:1tBYMY:l6mwSU-8PIF3r7Cuuqu2xwk7UuLFE0YUlU7yq-WTs_M', '2024-11-28 11:50:14.056367'),
('vpjmhyijj5e8rvu52zguj2sspa9s20gj', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1t8bPk:PMUdUzP4NoXkMvFYVWoMTjb6UPrWw3cvDu6SKGgH8do', '2024-11-06 08:39:20.484997'),
('w9mkuftk9etc1niuw7i7ogadg6bdmahg', 'e30:1t2nYI:O9YT5WCXh10gT2Mde5nStD2G9LzQHULaBfRtY3y9UaU', '2024-11-04 08:14:10.255715'),
('wwxtrgw45prv48ylcm9lulw6tr9o0tlf', '.eJxVjDsOwjAQBe_iGlnG8ZeSPmewdr1rHECOFCcV4u4QKQW0b2beSyTY1pq2zkuaSFzE2YrT74iQH9x2Qndot1nmua3LhHJX5EG7HGfi5_Vw_w4q9PqtcwDjvFKBggJk4zUUZYaCvgRj_KCKZe21KxHJRR0HS55YW86IGosT7w8BbThE:1t9Hwl:AsaHR7s0xNxXQMp1bVxfCM-ly6L9R29SwwDBlnan2cQ', '2024-11-08 06:04:15.953592'),
('x3x1f2je1r90omldpa32xr3hzf7fzpn6', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1t8Zvk:bD0BxvPardROXOimEd4Fjq2dMCKYTP3QGYzJ-MvjeDE', '2024-11-06 07:04:16.723925'),
('xxrfvx3z1wn6378j19n7hm9ehunwn92a', 'e30:1t2puW:joT8UyslB0c-szbcaZV4QkKkavtKv1_e3ND1HtQua-k', '2024-11-04 10:45:16.670213'),
('y1hdprb8dgwtyan85enav7h1p1x29wdr', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1t8bdp:gdQVdkxmdGnWzQKlmd2o8QCOpqghnQ1DA_Q_grY_JZg', '2024-11-06 08:53:53.032300'),
('zblbjgutvc3xcewv3wyvxzjo4mny8r30', '.eJxVjMsOwiAQRf-FtSEdBii6dN9vIAPD2KqBpI-V8d-1SRe6veec-1KRtnWM21LmOLG6KDDq9Dsmyo9Sd8J3qremc6vrPCW9K_qgix4al-f1cP8ORlrGb42ci0HqOaNP7Lx0Z9slEQ7SQ--tD0FAikfTgUdxhixYci4bBAYJ6v0BE2Y30w:1t9Ggv:VXkn1__l005XFGUOvcFNvXsN33XkcHnpw2Ydmn2nTzk', '2024-11-08 04:43:49.891849'),
('zfvdt92fap8iro5f6qmelhux7aizw98d', '.eJxVjLsOAiEQAP-F2hB5CHuW9n4D2WVBTg0kx11l_HcluULbmcm8RMBtLWHraQkzi7NQXhx-IWF8pDoM37HemoytrstMciRyt11eG6fnZW__BgV7GV8NcTqSBW98AgLIziXnviw6QDKcVT4B6GyzRxVRGwUTk2Nv0Eb04v0B_fU4JQ:1t9Hwu:eg3FMNOnF2NzGH4iEX8nLfa32PJeN1rD3ktW25ur4uY', '2024-11-08 06:04:24.482128'),
('zisqqmgqmodq7nyt6rcgm5nyyr06jj46', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1t8ZUp:zmYSO4nYnkXk-e_r2Nvzeh-E04H_5guyzSxqCUkbI2s', '2024-11-06 06:36:27.201997'),
('zwmebvbq4rcotojmzj2dxj7x148mpjhf', 'e30:1t4G5s:5c_cz2lp1wKGsilFpcOm1lDGydDc73HeStmWOGf8sYo', '2024-11-08 08:54:52.955239');

-- --------------------------------------------------------

--
-- Table structure for table `employee_call`
--

CREATE TABLE `employee_call` (
  `id` bigint(20) NOT NULL,
  `call_start_time` datetime(6) NOT NULL,
  `call_end_time` datetime(6) DEFAULT NULL,
  `call_note` longtext DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `ticket_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_call`
--

INSERT INTO `employee_call` (`id`, `call_start_time`, `call_end_time`, `call_note`, `agent_id`, `ticket_id`) VALUES
(1, '2024-12-12 11:36:43.121607', '2024-12-12 11:36:46.004609', NULL, 14, 65),
(2, '2024-12-12 11:44:09.875970', '2024-12-12 11:44:12.640612', 'bug fix', 14, 65),
(3, '2024-12-12 11:45:04.014145', '2024-12-12 11:45:08.073252', NULL, 14, 65),
(4, '2024-12-12 11:52:44.998819', '2024-12-12 11:52:49.445666', NULL, 14, 65),
(5, '2024-12-12 11:53:06.591212', '2024-12-12 11:53:10.073101', NULL, 14, 65),
(6, '2024-12-12 11:57:28.104298', '2024-12-12 11:57:30.902298', NULL, 14, 65),
(7, '2024-12-12 11:57:34.477281', '2024-12-12 11:57:37.555817', NULL, 14, 65),
(8, '2024-12-12 12:04:41.066129', '2024-12-12 12:04:43.750234', NULL, 14, 63),
(9, '2024-12-12 12:04:48.248651', '2024-12-12 12:04:50.399960', 'script', 14, 63),
(10, '2024-12-12 12:15:30.151728', '2024-12-12 12:15:34.355211', NULL, 14, 65),
(11, '2024-12-12 12:15:38.161256', '2024-12-12 12:15:40.384637', NULL, 14, 65),
(12, '2024-12-12 12:15:48.616850', '2024-12-12 12:15:51.318874', NULL, 14, 65),
(13, '2024-12-12 12:17:07.646330', '2024-12-12 12:17:09.434146', 'error', 14, 63),
(14, '2024-12-12 12:28:13.616946', '2024-12-12 12:28:16.261776', NULL, 14, 65),
(15, '2024-12-12 12:29:06.894424', '2024-12-12 12:29:09.017617', NULL, 14, 65),
(16, '2024-12-12 12:32:51.514140', NULL, NULL, 14, 65),
(17, '2024-12-13 04:19:28.730876', '2024-12-13 04:19:33.312979', NULL, 14, 65),
(18, '2024-12-13 04:19:38.541120', '2024-12-13 04:19:42.299914', NULL, 14, 65),
(19, '2024-12-13 04:22:03.122506', '2024-12-13 04:22:06.316162', 'note1', 14, 65),
(20, '2024-12-13 04:49:01.232576', '2024-12-13 04:49:22.902642', 'end call corrected', 14, 65),
(21, '2024-12-13 04:51:41.420906', '2024-12-13 04:51:56.246503', 'status pending', 14, 63),
(22, '2024-12-13 04:52:00.844817', '2024-12-13 04:52:25.961586', 'status open', 14, 63),
(23, '2024-12-13 05:04:13.076148', '2024-12-13 05:15:52.793607', 'open', 14, 63),
(24, '2024-12-13 05:16:06.282921', '2024-12-13 05:16:16.947603', 'pending', 14, 65),
(25, '2024-12-13 05:16:51.480990', '2024-12-13 05:17:20.896403', 'open', 14, 65),
(26, '2024-12-13 05:22:33.401344', '2024-12-13 05:28:06.198726', 'pending', 14, 65),
(27, '2024-12-13 05:28:18.387605', '2024-12-13 05:28:33.067291', 'open', 14, 65),
(28, '2024-12-13 05:37:26.823138', '2024-12-13 05:37:45.099069', 'customer waiting', 14, 65),
(29, '2024-12-13 05:37:48.709939', '2024-12-13 05:38:11.336130', 'status', 14, 65),
(30, '2024-12-13 05:42:04.464320', '2024-12-13 05:42:13.477269', '', 14, 65),
(31, '2024-12-13 06:09:02.308837', '2024-12-13 06:13:03.177079', 'error', 14, 65),
(32, '2024-12-13 06:13:37.196586', '2024-12-13 06:14:00.594491', 'initial response', 14, 63),
(33, '2024-12-13 06:24:28.804724', '2024-12-13 06:24:38.190108', '', 14, 63),
(34, '2024-12-13 06:34:38.780708', '2024-12-13 06:34:48.967796', 'pending', 14, 65),
(35, '2024-12-13 06:34:52.323102', '2024-12-13 06:35:17.202712', 'customer', 14, 63),
(36, '2024-12-13 06:38:25.341193', '2024-12-13 06:38:52.355075', 'initial', 14, 65),
(37, '2024-12-13 06:47:14.570291', '2024-12-13 06:47:37.439721', 'customer', 14, 65),
(38, '2024-12-13 06:48:45.230191', '2024-12-13 06:49:09.692722', 'status change', 17, 66),
(39, '2024-12-13 06:50:48.012549', '2024-12-13 06:51:03.968099', 'customer', 17, 66),
(40, '2024-12-13 06:54:22.635510', '2024-12-13 06:54:45.701302', 'initial response', 17, 66),
(41, '2024-12-13 06:56:31.239610', '2024-12-13 06:56:45.678007', 'p', 17, 66),
(42, '2024-12-13 06:58:17.915931', '2024-12-13 06:58:56.187294', 'x', 17, 66),
(43, '2024-12-13 07:30:45.814601', '2024-12-13 07:30:59.162293', 'pending', 14, 65),
(44, '2024-12-13 07:32:29.656688', '2024-12-13 07:32:44.047171', 'x', 14, 63),
(45, '2024-12-13 07:40:53.677672', '2024-12-13 07:41:07.944732', 'open', 14, 65),
(46, '2024-12-13 07:45:13.315132', '2024-12-13 07:45:25.944801', 'x', 14, 63),
(47, '2024-12-13 07:46:09.440466', '2024-12-13 07:57:41.174571', 'x', 14, 63),
(48, '2024-12-13 07:57:45.749684', '2024-12-13 08:02:57.550989', 'z', 14, 63),
(49, '2024-12-13 08:03:13.259343', '2024-12-13 08:03:31.611138', 'w', 14, 63),
(50, '2024-12-13 08:03:37.344588', '2024-12-13 08:03:59.993241', 's', 14, 63),
(51, '2024-12-13 08:04:24.899614', '2024-12-13 08:06:07.446904', 'p', 14, 63),
(52, '2024-12-13 08:06:10.763576', '2024-12-13 08:06:39.684031', 'p', 14, 65),
(53, '2024-12-13 08:06:42.966420', '2024-12-13 08:07:01.308042', 'i', 14, 65),
(54, '2024-12-13 08:53:55.116478', '2024-12-13 08:54:16.401359', 'call check', 14, 65),
(55, '2024-12-13 09:02:07.278450', '2024-12-13 09:02:26.681912', 'p', 14, 65),
(56, '2024-12-13 09:02:30.031450', '2024-12-13 09:02:42.577321', 'w', 14, 65),
(57, '2024-12-13 09:21:20.025477', '2024-12-13 09:23:11.145343', 'c', 14, 65),
(58, '2024-12-13 09:23:24.829363', '2024-12-13 09:23:56.218480', 'q', 14, 63),
(59, '2024-12-13 09:31:55.914073', '2024-12-13 09:33:09.244522', 'p', 14, 65),
(60, '2024-12-13 09:33:24.058364', '2024-12-13 09:34:06.258616', 'w', 14, 63),
(61, '2024-12-13 09:37:19.899608', '2024-12-13 09:39:04.863094', 'in', 14, 65),
(62, '2024-12-13 09:39:20.112478', '2024-12-13 09:46:09.294148', 'p', 14, 65),
(63, '2024-12-13 09:48:54.957784', '2024-12-13 09:56:32.480323', 's', 14, 65),
(64, '2024-12-13 09:55:18.926714', '2024-12-13 09:56:42.279244', 'p', 14, 63),
(65, '2024-12-13 09:57:23.448467', '2024-12-13 10:00:00.126834', 'x', 14, 65),
(66, '2024-12-13 10:05:04.655900', '2024-12-13 10:05:16.689143', 'o', 14, 65),
(67, '2024-12-13 10:09:11.514276', '2024-12-13 10:09:28.127031', 'p', 14, 63),
(68, '2024-12-13 10:13:08.088611', '2024-12-13 10:13:22.759064', 'ndjwjd', 14, 63),
(69, '2024-12-13 10:16:05.325549', '2024-12-13 10:16:45.374338', 'i', 17, 66),
(70, '2024-12-13 12:06:40.140165', '2024-12-13 12:07:02.422318', 'p', 14, 65),
(71, '2024-12-13 12:07:04.543030', '2024-12-13 12:07:25.238401', 'w', 14, 63),
(72, '2024-12-13 12:08:39.080310', '2024-12-13 12:08:57.983620', 'pending', 14, 65),
(73, '2024-12-13 12:09:20.631715', '2024-12-13 12:09:44.348631', 'waiting', 14, 63),
(74, '2024-12-13 12:10:19.450755', '2024-12-13 12:11:50.092472', '', 14, 63),
(75, '2024-12-13 12:12:51.722805', '2024-12-13 12:13:04.239234', 's', 14, 65),
(76, '2024-12-13 12:39:02.628941', '2024-12-13 12:39:26.413223', 'done', 14, 65),
(77, '2024-12-13 12:40:34.592063', '2024-12-13 12:40:56.291240', 'done', 14, 63),
(78, '2024-12-17 03:53:18.466142', '2024-12-17 03:53:39.897663', 'still pending', 14, 65),
(79, '2024-12-17 05:55:26.117569', '2024-12-17 05:55:44.366813', 'call note 1', 14, 63),
(80, '2024-12-18 09:50:00.082260', '2024-12-18 09:50:15.570692', 'noted', 14, 65),
(81, '2024-12-18 09:52:29.097957', '2024-12-18 09:52:58.764436', '', 17, 66),
(82, '2024-12-19 05:32:27.969334', '2024-12-19 05:33:09.164365', 'described', 17, 66),
(83, '2024-12-19 05:48:42.969811', '2024-12-19 06:03:02.211897', NULL, 14, 65),
(84, '2024-12-19 06:18:04.917509', '2024-12-19 06:18:06.854530', NULL, 14, 63),
(85, '2024-12-19 06:19:27.623337', '2024-12-19 06:19:35.998498', 'bad request', 14, 65),
(86, '2024-12-19 06:21:25.490491', '2024-12-19 06:21:43.731940', 'described', 14, 65),
(87, '2024-12-19 06:28:04.818623', '2024-12-19 06:28:13.959683', 'check', 14, 65),
(88, '2024-12-19 06:31:28.429502', '2024-12-19 06:33:13.083491', 'print', 14, 65),
(89, '2024-12-19 06:34:13.433396', '2024-12-19 06:34:46.694844', 'true', 14, 63),
(90, '2024-12-19 06:45:04.642822', '2024-12-19 06:57:39.830880', 'ss', 14, 65),
(91, '2024-12-19 06:57:54.603090', '2025-01-09 06:51:46.411797', '', 14, 63),
(92, '2024-12-19 07:12:58.610153', '2024-12-19 07:13:11.616598', '123', 14, 65),
(93, '2024-12-19 07:13:28.690398', '2024-12-19 07:13:52.273016', '234', 14, 65),
(94, '2024-12-19 09:19:18.035363', '2024-12-19 09:19:28.952884', '1', 14, 65),
(95, '2024-12-20 04:33:48.611159', '2024-12-20 04:34:03.063087', 'okay', 14, 65),
(96, '2024-12-20 05:01:42.253268', '2024-12-20 05:05:41.255397', NULL, 14, 65),
(97, '2024-12-20 05:05:51.053134', '2024-12-20 05:16:58.453889', '00', 14, 65),
(98, '2024-12-20 05:49:12.231515', '2024-12-20 05:49:53.112237', 'dd', 17, 66),
(99, '2024-12-20 05:50:18.996117', '2024-12-20 05:50:40.580615', 'r', 17, 66),
(100, '2024-12-20 05:51:25.576223', '2024-12-20 05:51:38.926732', 'w', 17, 66),
(101, '2024-12-20 05:53:52.782934', '2024-12-20 05:58:03.761023', 'ZZ', 17, 61),
(102, '2024-12-20 06:00:43.883782', '2024-12-20 06:03:09.423116', 'r', 17, 66),
(103, '2024-12-20 06:57:39.852026', '2024-12-20 06:57:44.713095', 'd', 14, 65),
(104, '2024-12-27 11:52:58.872243', '2024-12-27 11:53:14.923258', 'yufrsjh', 14, 66),
(105, '2024-12-30 06:03:12.194551', NULL, NULL, 17, 65),
(106, '2024-12-30 06:06:08.791099', '2024-12-30 06:06:25.976437', 'pending', 17, 65),
(107, '2024-12-30 06:29:21.799742', '2024-12-30 06:29:54.657576', 'test', 17, 65),
(108, '2024-12-30 06:32:08.153167', '2024-12-30 06:32:39.659006', 'testing', 14, 66),
(109, '2024-12-30 06:34:35.366064', '2024-12-30 06:34:58.273459', 'x', 14, 66),
(110, '2024-12-30 06:55:59.454376', '2025-01-09 06:50:50.144392', '', 14, 66),
(111, '2025-01-09 07:50:05.882488', '2025-01-09 07:54:28.633884', 'sa', 14, 66),
(112, '2025-01-09 07:54:34.009284', '2025-01-09 07:54:43.565792', 'x', 14, 66),
(113, '2025-01-09 08:01:48.007985', '2025-01-09 08:01:58.076514', 'c', 14, 59),
(114, '2025-01-09 10:39:56.239524', '2025-01-09 10:40:52.761333', 'fghdgh', 14, 63),
(115, '2025-01-09 10:49:01.865526', '2025-01-09 10:49:12.582750', 's', 17, 65),
(116, '2025-01-13 06:16:24.267627', '2025-01-13 06:16:33.716299', NULL, 14, 66),
(117, '2025-01-13 06:17:12.389997', '2025-01-13 06:17:23.358300', NULL, 14, 63),
(118, '2025-01-13 06:31:11.566925', '2025-01-13 06:31:23.299261', NULL, 14, 66),
(119, '2025-01-13 06:31:56.637520', '2025-01-13 06:32:06.336099', NULL, 14, 66),
(120, '2025-01-13 06:33:21.225662', '2025-01-13 06:33:27.511208', NULL, 14, 66),
(121, '2025-01-13 06:43:06.983770', '2025-01-15 06:57:01.277790', 'ydgyw', 14, 66),
(122, '2025-01-15 07:04:49.996499', '2025-01-15 07:04:56.546429', 'dsvqgdv', 14, 66),
(123, '2025-01-15 08:45:20.641649', '2025-01-15 08:45:31.339819', 'start call', 14, 66),
(124, '2025-01-15 08:49:51.676371', '2025-01-15 08:50:21.747396', 'call', 14, 66),
(125, '2025-01-15 08:57:49.949888', '2025-01-15 08:58:03.831895', 'middle call', 14, 66),
(126, '2025-01-15 08:58:41.658364', '2025-01-15 08:59:03.749787', 'initiated by start', 14, 66),
(127, '2025-01-15 09:04:31.964031', '2025-01-15 09:04:42.276349', 'by start', 14, 66),
(128, '2025-01-15 09:04:56.354555', '2025-01-15 09:05:10.051927', 'by start call', 14, 66),
(129, '2025-01-15 09:13:04.466407', '2025-01-15 09:16:30.371615', 'by call', 14, 66),
(130, '2025-01-15 09:16:46.858817', '2025-01-15 09:16:56.116402', 'by calls', 14, 66),
(131, '2025-01-15 09:17:06.328821', '2025-01-15 09:17:14.195095', 'by start', 14, 66),
(132, '2025-01-15 09:17:50.539577', '2025-01-15 09:18:08.251519', 'initiated by call', 14, 63),
(133, '2025-01-15 09:18:30.239269', '2025-01-15 09:18:41.668884', 'by start button', 14, 63),
(134, '2025-01-15 09:57:49.883396', '2025-01-15 09:58:30.007742', 'on call status', 17, 65),
(135, '2025-01-15 10:10:21.069927', '2025-01-15 10:10:43.700911', 'on call status', 17, 65),
(136, '2025-01-16 06:51:01.613715', '2025-01-16 06:51:23.296459', 'dhwyvd', 14, 63),
(137, '2025-01-16 08:04:50.645635', '2025-01-16 08:05:02.212397', 'testing', 17, 65),
(139, '2025-01-16 10:04:29.158686', '2025-01-16 10:04:47.957764', 'call check', 14, 63),
(140, '2025-01-16 10:05:23.595046', '2025-01-16 10:05:32.006358', 'call check', 14, 66),
(141, '2025-01-16 10:06:16.003696', '2025-01-16 10:06:29.370181', 'timer check', 14, 66),
(142, '2025-01-16 10:14:57.068058', '2025-01-16 10:15:30.678034', 'checking...', 17, 61),
(143, '2025-01-16 10:17:47.778909', '2025-01-16 10:18:05.197550', 'dvwgs', 14, 63),
(144, '2025-01-16 10:18:44.623367', '2025-01-16 10:18:52.057559', 'wf', 17, 65),
(145, '2025-01-16 11:32:33.367352', '2025-01-16 11:32:41.651073', 'test', 14, 66),
(146, '2025-01-22 12:06:53.049810', '2025-01-22 12:07:01.701196', 'svv', 14, 66),
(147, '2025-01-23 06:00:22.847670', '2025-01-23 06:00:31.547845', 'dw', 14, 66),
(148, '2025-01-27 08:44:18.892727', '2025-01-27 08:44:50.039322', 'checking purpose', 14, 66),
(149, '2025-01-28 04:52:58.954160', '2025-01-28 04:53:09.689204', 'dss', 14, 71),
(150, '2025-01-29 05:32:37.392408', '2025-01-29 05:32:55.736889', 'for testing', 14, 71),
(151, '2025-01-29 05:34:12.825748', '2025-01-29 05:35:20.721081', '1m call', 14, 66),
(152, '2025-01-29 06:03:37.041298', '2025-01-29 06:04:53.423069', 'test', 14, 71),
(153, '2025-01-29 06:26:15.591119', '2025-01-29 06:27:53.338576', 'yftft', 14, 71),
(154, '2025-01-29 06:40:49.679499', '2025-01-29 06:42:01.821810', 'dqwd', 14, 71),
(155, '2025-01-30 06:56:29.395760', '2025-01-30 06:57:46.735755', 'bhdh', 14, 71),
(156, '2025-01-30 06:58:19.303703', '2025-01-30 06:58:26.134927', 'dd', 14, 71),
(157, '2025-01-30 06:59:04.399812', '2025-01-30 06:59:13.370807', 'ac', 14, 76),
(158, '2025-01-30 07:15:42.147826', '2025-01-30 07:16:42.167118', 'fdr', 14, 76),
(159, '2025-01-30 07:32:23.630566', '2025-01-30 07:34:19.547341', 'dtsx', 14, 76),
(160, '2025-01-30 07:53:30.518763', '2025-01-30 07:55:32.847680', 'dw', 14, 76),
(161, '2025-01-30 08:58:14.566208', '2025-01-30 08:59:17.080314', 'dftwd', 14, 76),
(162, '2025-02-04 06:04:13.442753', '2025-02-04 06:04:23.500123', 'd', 14, 80),
(163, '2025-02-07 07:06:24.133926', '2025-02-07 07:06:38.716656', 'ds', 14, 81),
(164, '2025-02-10 03:55:15.310898', '2025-02-10 04:24:35.779929', 'dg', 14, 81),
(165, '2025-02-10 03:55:45.159792', '2025-02-10 04:24:41.047103', '2d', 14, 80),
(166, '2025-02-10 04:31:39.033134', '2025-02-10 04:31:45.582924', 'dqa', 14, 81),
(167, '2025-02-10 04:34:17.639234', '2025-02-10 04:34:29.718753', 'e', 14, 81),
(168, '2025-02-10 12:21:52.725452', '2025-02-10 12:21:58.573785', 'X', 14, 81),
(169, '2025-02-17 10:22:43.913603', '2025-02-17 10:22:53.934239', 'ftd', 14, 82),
(170, '2025-02-17 12:05:15.617169', '2025-02-17 12:05:26.877858', 'dwgd', 14, 82),
(171, '2025-02-17 12:05:50.808038', '2025-02-17 12:06:02.541292', 'dwd', 14, 82),
(172, '2025-02-17 12:06:14.949764', '2025-02-17 12:06:19.306114', 'dd', 14, 82),
(173, '2025-02-17 12:15:11.771547', '2025-02-17 12:15:19.379919', 'dvtwfd', 14, 82),
(174, '2025-02-18 06:45:16.766408', '2025-02-18 06:45:26.372389', 'dd', 14, 82),
(175, '2025-02-19 10:13:36.093021', '2025-02-19 10:13:55.065206', 'test note for note page', 17, 84),
(176, '2025-02-21 04:11:19.639594', '2025-02-21 04:11:45.075329', 'shdgtsd', 14, 84),
(179, '2025-03-07 11:55:03.611150', '2025-03-07 11:55:35.139957', 'hwbdhwvyfh', 18, 83),
(181, '2025-03-07 11:58:35.776756', '2025-03-07 11:58:41.862656', 'ytftrx', 18, 83),
(186, '2025-03-10 09:51:46.430047', '2025-03-10 09:52:06.116947', 'wddw', 14, 82),
(187, '2025-03-11 06:49:21.856826', '2025-03-11 06:49:31.821886', 't', 14, 82),
(188, '2025-03-11 12:40:39.135074', '2025-03-11 12:41:07.052309', 'not a call', 14, 82),
(189, '2025-03-11 12:41:38.873635', '2025-03-11 12:41:44.652041', 'uyft', 14, 82),
(190, '2025-03-20 05:06:32.388933', '2025-03-20 09:05:32.593114', 'ydftd', 14, 82),
(191, '2025-03-21 11:49:37.379014', '2025-03-22 12:41:07.060128', 'bdu3b', 14, 81),
(192, '2025-03-24 05:04:50.347529', '2025-03-24 06:54:11.071158', 'dtcqd', 14, 81),
(193, '2025-03-24 07:02:16.798394', '2025-03-24 07:03:15.547592', 'stqftds', 14, 76),
(194, '2025-03-24 09:56:56.461826', '2025-03-24 10:33:14.423717', 'yd', 14, 81),
(195, '2025-03-24 10:33:48.863924', '2025-03-24 10:33:58.065605', 'etfwqt', 14, 81),
(196, '2025-03-24 10:34:11.615776', '2025-03-24 10:34:25.632459', 'yqdgyqd', 14, 80),
(197, '2025-03-24 10:34:59.329984', '2025-03-24 10:35:07.426469', 'dtf', 14, 80),
(198, '2025-03-24 10:36:11.973505', '2025-03-24 10:36:21.825846', 'tdrt', 14, 81),
(199, '2025-03-24 11:19:31.718829', '2025-03-24 11:19:38.872797', 'wtdttd', 14, 80),
(200, '2025-03-25 05:33:58.075093', '2025-03-25 05:34:07.675193', 'etfte', 14, 81),
(201, '2025-03-25 06:32:24.861167', '2025-03-25 06:34:09.689530', '1udgyd', 14, 81),
(202, '2025-03-25 06:34:51.720718', '2025-03-25 06:35:05.341410', 'dgqd', 14, 81),
(203, '2025-03-25 06:39:47.523491', '2025-03-25 06:40:06.789200', 'ydftwqvdgt', 14, 81),
(204, '2025-03-25 06:45:04.357477', '2025-03-25 06:45:13.444615', 'edygq', 14, 81),
(205, '2025-03-25 06:48:18.049764', '2025-03-25 06:48:24.899758', 'wdyg', 14, 81),
(206, '2025-03-25 06:54:22.100610', '2025-03-25 06:54:28.850539', 'dff2', 14, 81),
(207, '2025-03-25 06:55:23.581338', '2025-03-25 06:55:31.746032', 'd26q', 14, 79),
(208, '2025-03-25 06:57:56.655302', '2025-03-25 06:58:03.740570', 'ytd', 14, 81),
(209, '2025-03-25 07:02:57.624474', '2025-03-25 07:03:03.956262', '7yft6d', 14, 81),
(210, '2025-03-25 09:08:17.543068', '2025-03-25 09:08:25.765294', '56er6d', 14, 81),
(211, '2025-03-25 09:32:37.335642', '2025-03-25 09:32:46.911268', 'fdytwvd', 14, 81),
(212, '2025-03-25 09:37:45.813621', '2025-03-25 09:38:07.524445', 'whf', 14, 81),
(213, '2025-03-25 09:38:37.643403', '2025-03-25 09:38:46.252841', 'dgdt', 14, 80),
(214, '2025-03-25 09:38:54.503638', '2025-03-25 09:39:05.547166', 'idjqw', 14, 81),
(215, '2025-03-25 10:58:30.055077', '2025-03-25 10:59:16.891280', 'dyg', 14, 81),
(216, '2025-03-25 10:59:20.949327', '2025-03-25 10:59:26.591236', 'dgcq', 14, 81),
(217, '2025-03-25 11:09:32.582691', '2025-03-25 11:09:40.385372', 'svtyfs', 14, 81),
(218, '2025-03-25 12:26:05.538183', '2025-03-25 12:26:12.076393', 'dygw', 14, 84),
(219, '2025-03-25 12:47:46.713999', '2025-03-25 12:47:53.809445', 'fyywdyfgw', 14, 84),
(220, '2025-03-26 03:47:37.403597', '2025-03-26 03:47:46.656327', 'VSTCSTGV', 14, 84),
(221, '2025-03-26 04:13:06.863763', '2025-03-26 04:13:14.899147', 'udgydg', 14, 84),
(222, '2025-03-26 10:35:34.128707', '2025-03-26 10:35:50.350193', 'dygd', 14, 84),
(223, '2025-03-26 11:20:57.605466', '2025-03-26 11:21:03.845346', 'dftdf', 14, 90),
(224, '2025-03-26 12:09:11.542002', '2025-03-26 12:09:18.061678', 'udgy', 17, 91),
(225, '2025-03-27 03:47:44.654633', '2025-03-27 03:47:58.354961', 'dhvd', 17, 91),
(226, '2025-03-31 06:47:49.958031', '2025-03-31 06:47:57.352134', 'dygw', 14, 93),
(227, '2025-03-31 07:24:00.897604', '2025-03-31 07:24:06.850861', 'fgwvf', 14, 93),
(228, '2025-03-31 12:46:36.155538', '2025-03-31 12:47:02.981078', 'dgwvd', 17, 91);

-- --------------------------------------------------------

--
-- Table structure for table `employee_callnote`
--

CREATE TABLE `employee_callnote` (
  `id` bigint(20) NOT NULL,
  `client_email` varchar(254) NOT NULL,
  `note` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `agent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_clientcallnote`
--

CREATE TABLE `employee_clientcallnote` (
  `id` bigint(20) NOT NULL,
  `note_text` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `ticket_id` bigint(20) NOT NULL,
  `call_duration_seconds` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_clientcallnote`
--

INSERT INTO `employee_clientcallnote` (`id`, `note_text`, `created_at`, `created_by_id`, `ticket_id`, `call_duration_seconds`) VALUES
(1, 'client call note for ticket id 100200', '2025-01-15 11:25:59.992805', 14, 66, NULL),
(2, 'note 2', '2025-01-15 11:26:29.123392', 14, 66, NULL),
(3, 'testing purpose', '2025-01-16 09:20:33.974011', 14, 66, NULL),
(4, 'on call status', '2025-01-16 09:21:49.254945', 14, 66, NULL),
(5, 'testing note for duration', '2025-01-22 10:03:21.613378', 14, 66, NULL),
(6, 'test note duration', '2025-01-22 10:08:46.669295', 14, 63, NULL),
(7, 'no notes', '2025-01-22 10:28:52.547152', 14, 66, 13.751505),
(8, 'notes for 11114', '2025-01-22 10:31:42.224698', 14, 63, 16.185206),
(9, 'urgent ticket resolve needed', '2025-01-22 12:46:41.355211', 14, 66, 25.232285),
(10, 'color check', '2025-01-23 06:01:05.286265', 14, 66, 19.694305),
(11, 'today call duration check', '2025-01-30 07:48:35.095259', 14, 76, 124.088352),
(12, 'this is a client call note for testing the note field', '2025-02-19 11:07:03.496472', 14, 84, 28.570654),
(13, 'this is test note from any other agent', '2025-02-19 11:11:11.626801', 18, 84, 18.149386),
(14, 'this is note for taking the ticket from you', '2025-03-21 06:54:35.487752', 14, 75, 47.795982),
(15, 'testing purpose for tailwind', '2025-03-24 09:14:43.589457', 14, 81, 19.807089),
(16, 'this is a high priority ticket', '2025-03-24 09:36:09.868661', 14, 80, 32.990283),
(17, 'this is a low priority ticket', '2025-03-24 09:38:16.730134', 14, 76, 32.580804),
(18, 'transferring from jobin ', '2025-03-24 09:45:30.579296', 14, 79, 37.564872),
(19, 'testing purpose for new query', '2025-03-25 05:48:51.300423', 14, 81, 27.882115),
(20, 'testing purpose for query', '2025-03-25 06:15:11.425991', 14, 81, 24.365673),
(21, 'testing for notification', '2025-03-25 09:34:02.079498', 14, 80, 26.977429);

-- --------------------------------------------------------

--
-- Table structure for table `employee_dailyactivity`
--

CREATE TABLE `employee_dailyactivity` (
  `id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `login_time` datetime(6) DEFAULT NULL,
  `logout_time` datetime(6) DEFAULT NULL,
  `break_duration` bigint(20) NOT NULL,
  `total_work_time` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_idle_time` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_dailyactivity`
--

INSERT INTO `employee_dailyactivity` (`id`, `date`, `login_time`, `logout_time`, `break_duration`, `total_work_time`, `user_id`, `total_idle_time`) VALUES
(22, '2024-11-15', '2024-11-15 12:00:15.681512', '2024-11-15 12:01:36.251115', 0, 0, 14, 0),
(23, '2024-11-15', '2024-11-15 11:35:17.413025', '2024-11-15 11:59:45.239269', 0, 2912798802, 13, 0),
(24, '2024-11-15', '2024-11-15 11:10:30.648416', '2024-11-15 11:16:21.498169', 0, 0, 17, 0),
(25, '2024-11-15', '2024-11-15 09:27:21.224168', '2024-11-15 09:57:01.503153', 0, 0, 15, 0),
(26, '2024-11-15', '2024-11-15 12:01:56.584781', '2024-11-15 12:07:54.379894', 0, 0, 18, 0),
(27, '2024-11-18', '2024-11-18 12:00:13.431078', '2024-11-18 12:20:41.768418', 0, 0, 13, 0),
(28, '2024-11-18', '2024-11-18 11:58:27.308584', '2024-11-18 12:21:00.732723', 0, 0, 14, 0),
(29, '2024-11-18', '2024-11-18 10:50:04.744594', '2024-11-18 12:00:05.742107', 0, 0, 15, 0),
(30, '2024-11-18', '2024-11-18 10:34:56.267280', '2024-11-18 10:49:16.665536', 0, 0, 17, 0),
(31, '2024-11-18', '2024-11-18 10:49:25.361358', '2024-11-18 10:49:56.101977', 0, 0, 18, 0),
(32, '2024-11-19', '2024-11-19 08:58:59.061452', '2024-11-19 11:32:28.917490', 0, 0, 17, 0),
(33, '2024-11-19', '2024-11-19 04:20:52.666926', '2024-11-19 05:09:12.578984', 0, 0, 13, 0),
(34, '2024-11-19', '2024-11-19 11:27:23.020808', '2024-11-19 11:57:57.665629', 0, 0, 14, 0),
(35, '2024-11-20', '2024-11-20 04:19:39.186599', NULL, 0, 0, 14, 0),
(36, '2024-11-20', '2024-11-20 05:03:40.539411', '2024-11-20 05:03:54.697104', 0, 0, 17, 0),
(37, '2024-11-27', '2024-11-27 11:44:12.120498', '2024-11-27 11:46:28.107136', 0, 0, 14, 0),
(38, '2024-11-27', '2024-11-27 11:19:26.815963', NULL, 0, 0, 17, 0),
(39, '2024-11-27', '2024-11-27 05:04:14.635107', '2024-11-27 05:14:11.987468', 0, 0, 18, 0),
(40, '2024-11-28', '2024-11-28 08:15:43.586702', '2024-11-28 10:25:30.926469', 0, 0, 14, 0),
(41, '2024-11-28', '2024-11-28 10:25:38.700123', '2024-11-28 12:36:23.913623', 0, 0, 17, 0),
(42, '2024-11-29', '2024-11-29 11:09:29.994659', NULL, 0, 0, 14, 0),
(43, '2024-11-29', '2024-11-29 06:10:26.186842', '2024-11-29 06:11:05.463151', 0, 0, 13, 0),
(44, '2024-11-29', '2024-11-29 06:24:45.498672', '2024-11-29 06:26:07.886812', 0, 0, 12, 0),
(45, '2024-11-29', '2024-11-29 11:20:35.245218', NULL, 0, 0, 17, 0),
(46, '2024-12-03', '2024-12-03 05:38:56.674969', '2024-12-03 06:41:16.247966', 0, 0, 17, 0),
(47, '2024-12-03', '2024-12-03 12:37:52.878749', NULL, 0, 0, 14, 0),
(48, '2024-12-03', '2024-12-03 10:08:56.613999', '2024-12-03 12:15:33.288279', 0, 0, 18, 0),
(49, '2024-12-04', '2024-12-04 11:22:55.092028', '2024-12-04 12:31:58.186046', 0, 0, 14, 0),
(50, '2024-12-04', '2024-12-04 11:23:09.586447', '2024-12-04 12:31:49.956544', 0, 0, 17, 0),
(51, '2024-12-04', '2024-12-04 10:36:53.383957', '2024-12-04 10:37:06.609260', 0, 0, 18, 0),
(52, '2024-12-05', '2024-12-05 10:53:51.940613', NULL, 0, 0, 14, 0),
(53, '2024-12-05', '2024-12-05 08:59:45.451247', '2024-12-05 10:51:29.894307', 0, 0, 17, 0),
(54, '2024-12-06', '2024-12-06 10:20:54.026887', '2024-12-06 11:55:05.284660', 0, 0, 14, 0),
(55, '2024-12-06', '2024-12-06 12:04:46.130285', '2024-12-06 12:40:45.021171', 0, 0, 17, 0),
(56, '2024-12-06', '2024-12-06 10:28:43.225434', '2024-12-06 10:56:00.255512', 0, 0, 13, 0),
(57, '2024-12-09', '2024-12-09 12:54:04.281344', '2024-12-09 12:56:44.045345', 0, 0, 14, 0),
(58, '2024-12-09', '2024-12-09 12:37:34.647854', '2024-12-09 12:51:13.011195', 0, 0, 17, 0),
(59, '2024-12-09', '2024-12-09 12:33:19.550835', '2024-12-09 12:34:21.721077', 0, 0, 18, 0),
(60, '2024-12-10', '2024-12-10 13:19:00.833772', '2024-12-10 13:22:08.221961', 0, 0, 17, 0),
(61, '2024-12-10', '2024-12-10 13:14:15.441608', '2024-12-10 13:14:52.858509', 0, 0, 14, 0),
(62, '2024-12-10', '2024-12-10 09:04:06.695341', '2024-12-10 10:03:20.381994', 0, 0, 18, 0),
(63, '2024-12-11', '2024-12-11 11:43:37.229139', NULL, 0, 0, 14, 0),
(64, '2024-12-12', '2024-12-12 12:35:50.137412', NULL, 0, 0, 14, 0),
(65, '2024-12-12', '2024-12-12 11:02:50.352746', '2024-12-12 11:03:08.316733', 0, 0, 17, 0),
(66, '2024-12-12', '2024-12-12 11:03:14.762231', '2024-12-12 11:32:46.584850', 0, 0, 18, 0),
(67, '2024-12-13', '2024-12-13 12:06:36.157483', '2024-12-13 12:49:02.076362', 0, 0, 14, 0),
(68, '2024-12-13', '2024-12-13 10:15:54.621773', '2024-12-13 10:17:53.605410', 0, 0, 17, 0),
(69, '2024-12-17', '2024-12-17 05:46:22.118999', '2024-12-17 08:58:48.635705', 0, 0, 14, 0),
(70, '2024-12-17', '2024-12-17 08:58:55.811067', '2024-12-17 12:48:06.295963', 0, 0, 17, 0),
(71, '2024-12-18', '2024-12-18 12:22:49.088282', NULL, 0, 0, 14, 0),
(72, '2024-12-18', '2024-12-18 12:23:01.203301', NULL, 0, 0, 17, 0),
(73, '2024-12-19', '2024-12-19 09:19:15.702590', '2024-12-19 12:46:14.451048', 0, 0, 14, 0),
(74, '2024-12-19', '2024-12-19 06:58:22.461744', NULL, 0, 0, 17, 0),
(75, '2024-12-20', '2024-12-20 11:21:56.784100', '2024-12-20 12:59:05.940411', 0, 0, 14, 0),
(76, '2024-12-20', '2024-12-20 11:29:05.516554', '2024-12-20 12:59:11.669723', 0, 0, 17, 0),
(77, '2024-12-23', '2024-12-23 10:15:17.517122', '2024-12-23 12:54:14.358585', 0, 0, 14, 0),
(78, '2024-12-23', '2024-12-23 10:15:49.517025', '2024-12-23 12:54:04.261306', 0, 0, 17, 0),
(79, '2024-12-24', '2024-12-24 05:08:10.549143', '2024-12-24 07:51:37.481683', 0, 0, 14, 0),
(80, '2024-12-24', '2024-12-24 07:51:47.504232', '2024-12-24 12:38:25.508008', 0, 0, 17, 0),
(81, '2024-12-27', '2024-12-27 11:48:20.103334', '2024-12-27 11:54:10.304613', 0, 0, 14, 0),
(82, '2024-12-27', '2024-12-27 11:54:16.683855', '2024-12-27 12:32:44.097676', 0, 0, 17, 0),
(83, '2024-12-30', '2024-12-30 10:32:29.516254', '2024-12-30 12:36:14.416217', 0, 0, 14, 0),
(84, '2024-12-30', '2024-12-30 06:56:55.387797', '2024-12-30 09:13:23.159053', 0, 0, 17, 0),
(85, '2024-12-31', '2024-12-31 10:05:50.679775', '2024-12-31 12:30:57.037078', 0, 0, 14, 0),
(86, '2024-12-31', '2024-12-31 09:50:17.208371', '2024-12-31 09:50:24.659537', 0, 0, 17, 0),
(87, '2025-01-03', '2025-01-03 10:16:00.813494', '2025-01-03 12:48:45.270678', 0, 0, 14, 0),
(88, '2025-01-04', '2025-01-04 13:35:20.213167', '2025-01-04 13:40:32.016322', 0, 0, 14, 0),
(89, '2025-01-04', '2025-01-04 13:39:26.385164', NULL, 0, 0, 17, 0),
(90, '2025-01-06', '2025-01-06 10:10:26.400480', '2025-01-06 12:31:59.835968', 0, 0, 14, 0),
(91, '2025-01-07', '2025-01-07 03:52:32.518679', '2025-01-07 12:41:45.994045', 0, 0, 14, 0),
(92, '2025-01-08', '2025-01-08 13:03:01.820030', NULL, 0, 0, 14, 0),
(93, '2025-01-08', '2025-01-08 06:33:12.607876', '2025-01-08 06:48:13.231112', 0, 0, 17, 0),
(94, '2025-01-08', '2025-01-08 12:21:00.644087', '2025-01-08 12:23:05.832901', 0, 0, 12, 0),
(95, '2025-01-09', '2025-01-09 10:20:11.454459', NULL, 0, 0, 14, 0),
(96, '2025-01-09', '2025-01-09 10:19:10.011064', '2025-01-09 10:20:06.579101', 0, 0, 12, 0),
(97, '2025-01-09', '2025-01-09 10:44:39.861979', NULL, 0, 0, 17, 0),
(98, '2025-01-10', '2025-01-10 10:26:41.134998', NULL, 0, 0, 14, 0),
(99, '2025-01-13', '2025-01-13 12:45:58.561996', '2025-01-13 12:47:03.245545', 0, 0, 14, 0),
(100, '2025-01-14', '2025-01-14 09:57:48.719480', '2025-01-14 12:44:56.330943', 0, 0, 14, 0),
(101, '2025-01-15', '2025-01-15 11:25:04.528406', '2025-01-15 12:35:46.060590', 0, 0, 14, 0),
(102, '2025-01-15', '2025-01-15 10:10:09.583315', '2025-01-15 11:24:57.421318', 0, 0, 17, 0),
(103, '2025-01-16', '2025-01-16 12:47:27.486030', '2025-01-16 12:49:06.049076', 0, 0, 14, 0),
(104, '2025-01-16', '2025-01-16 10:18:34.315273', '2025-01-16 12:49:13.166545', 0, 0, 17, 0),
(105, '2025-01-16', '2025-01-16 10:30:03.444672', '2025-01-16 10:30:56.226686', 0, 0, 13, 0),
(106, '2025-01-17', '2025-01-17 03:51:20.152100', NULL, 0, 0, 14, 0),
(107, '2025-01-21', '2025-01-21 12:46:33.434608', '2025-01-21 12:50:11.206584', 0, 0, 14, 0),
(108, '2025-01-22', '2025-01-22 10:34:53.508044', '2025-01-22 12:50:45.794709', 0, 0, 14, 0),
(109, '2025-01-22', '2025-01-22 10:48:20.607906', '2025-01-22 12:50:51.427730', 0, 0, 17, 0),
(110, '2025-01-23', '2025-01-23 12:27:56.050441', NULL, 0, 0, 14, 0),
(111, '2025-01-23', '2025-01-23 12:35:53.515229', NULL, 0, 0, 17, 0),
(112, '2025-01-24', '2025-01-24 07:23:25.642396', '2025-01-24 12:37:32.541679', 0, 0, 14, 0),
(113, '2025-01-24', '2025-01-24 06:53:02.166725', '2025-01-24 12:38:17.368292', 0, 0, 17, 0),
(114, '2025-01-24', '2025-01-24 07:10:29.391495', '2025-01-24 07:23:19.861779', 0, 0, 12, 0),
(115, '2025-01-27', '2025-01-27 12:07:11.369959', '2025-01-27 13:00:44.307821', 0, 0, 14, 0),
(116, '2025-01-27', '2025-01-27 10:52:10.928102', '2025-01-27 10:57:58.059791', 0, 0, 17, 0),
(117, '2025-01-28', '2025-01-28 11:55:24.839442', '2025-01-28 11:55:30.351402', 0, 0, 14, 0),
(118, '2025-01-28', '2025-01-28 06:51:38.911255', '2025-01-28 07:12:35.238198', 0, 0, 17, 0),
(119, '2025-01-28', '2025-01-28 09:08:54.525282', '2025-01-28 09:10:30.332405', 0, 0, 13, 0),
(120, '2025-01-28', '2025-01-28 11:44:33.211023', '2025-01-28 11:49:31.227974', 0, 0, 15, 0),
(121, '2025-01-29', '2025-01-29 09:42:40.807253', '2025-01-29 12:40:55.150264', 0, 0, 14, 0),
(122, '2025-01-29', '2025-01-29 09:38:09.984373', '2025-01-29 12:40:35.337743', 0, 0, 17, 0),
(123, '2025-01-30', '2025-01-30 10:36:10.845011', '2025-01-30 12:25:23.185037', 0, 0, 14, 0),
(124, '2025-01-30', '2025-01-30 10:36:32.534305', '2025-01-30 12:24:43.234034', 0, 0, 17, 0),
(125, '2025-01-31', '2025-01-31 08:20:07.050374', '2025-01-31 12:53:13.217024', 0, 0, 14, 0),
(126, '2025-01-31', '2025-01-31 08:20:26.460237', '2025-01-31 09:13:13.941534', 0, 0, 17, 0),
(127, '2025-02-03', '2025-02-03 12:33:26.060537', '2025-02-03 12:46:29.221323', 0, 0, 14, 0),
(128, '2025-02-03', '2025-02-03 12:37:17.221995', '2025-02-03 12:46:32.288606', 0, 0, 17, 0),
(129, '2025-02-04', '2025-02-04 08:46:10.619955', NULL, 0, 0, 14, 0),
(130, '2025-02-04', '2025-02-04 08:24:25.513917', '2025-02-04 08:40:14.295774', 0, 0, 17, 0),
(131, '2025-02-04', '2025-02-04 09:20:15.097669', '2025-02-04 12:36:22.785105', 0, 0, 18, 0),
(132, '2025-02-05', '2025-02-05 07:29:39.136314', NULL, 0, 0, 17, 0),
(133, '2025-02-05', '2025-02-05 12:24:25.108530', NULL, 0, 0, 14, 0),
(134, '2025-02-05', '2025-02-05 09:08:37.390143', '2025-02-05 09:25:40.734046', 0, 0, 18, 0),
(135, '2025-02-05', '2025-02-05 05:02:51.672500', '2025-02-05 05:02:54.912153', 0, 0, 15, 0),
(136, '2025-02-05', '2025-02-05 05:48:50.687062', '2025-02-05 06:22:15.573390', 0, 0, 13, 0),
(137, '2025-02-05', '2025-02-05 12:32:37.103105', '2025-02-05 12:32:38.819963', 0, 0, 12, 0),
(138, '2025-02-05', '2025-02-05 06:22:38.830182', '2025-02-05 06:28:12.813121', 0, 0, 16, 0),
(139, '2025-02-06', '2025-02-06 08:52:06.907876', NULL, 0, 0, 14, 0),
(140, '2025-02-06', '2025-02-06 12:44:24.063867', '2025-02-06 12:44:26.041630', 0, 0, 12, 0),
(141, '2025-02-06', '2025-02-06 08:53:14.384210', NULL, 0, 0, 17, 0),
(142, '2025-02-06', '2025-02-06 08:52:18.186515', '2025-02-06 08:52:43.723816', 0, 0, 15, 0),
(143, '2025-02-07', '2025-02-07 09:58:34.933443', NULL, 0, 0, 14, 0),
(144, '2025-02-07', '2025-02-07 08:47:28.766386', NULL, 0, 0, 17, 0),
(145, '2025-02-07', '2025-02-07 09:59:13.608126', '2025-02-07 09:59:14.891705', 0, 0, 12, 0),
(146, '2025-02-07', '2025-02-07 08:54:52.195458', '2025-02-07 09:00:53.459986', 0, 0, 16, 0),
(147, '2025-02-10', '2025-02-10 06:07:45.483617', NULL, 0, 0, 14, 0),
(148, '2025-02-10', '2025-02-10 06:07:31.536901', '2025-02-10 06:07:40.533566', 0, 0, 12, 0),
(149, '2025-02-10', '2025-02-10 05:38:35.882574', '2025-02-10 05:42:05.058675', 0, 0, 15, 0),
(150, '2025-02-10', '2025-02-10 05:49:13.219068', NULL, 0, 0, 17, 0),
(151, '2025-02-11', '2025-02-11 11:28:43.621874', '2025-02-11 11:28:46.006119', 0, 0, 12, 0),
(152, '2025-02-11', '2025-02-11 07:14:19.832887', NULL, 0, 0, 14, 0),
(153, '2025-02-11', '2025-02-11 11:28:54.586758', '2025-02-11 11:42:06.818178', 0, 0, 15, 0),
(154, '2025-02-11', '2025-02-11 11:42:15.765884', NULL, 0, 0, 17, 0),
(155, '2025-02-12', '2025-02-12 11:58:21.423206', '2025-02-12 11:58:24.071241', 0, 0, 12, 0),
(156, '2025-02-12', '2025-02-12 11:59:26.044671', '2025-02-12 12:57:28.804744', 0, 0, 18, 0),
(157, '2025-02-12', '2025-02-12 09:02:31.650796', NULL, 0, 0, 17, 0),
(158, '2025-02-13', '2025-02-13 04:01:51.001075', NULL, 0, 0, 17, 0),
(159, '2025-02-13', '2025-02-13 09:11:45.090522', '2025-02-13 09:11:48.130964', 0, 0, 12, 0),
(160, '2025-02-13', '2025-02-13 10:36:20.226257', NULL, 0, 0, 18, 0),
(161, '2025-02-13', '2025-02-13 09:47:43.642473', '2025-02-13 09:47:48.712950', 0, 0, 15, 0),
(162, '2025-02-14', '2025-02-14 05:42:06.826905', NULL, 0, 0, 14, 0),
(163, '2025-02-14', '2025-02-14 05:21:08.828231', NULL, 0, 0, 17, 0),
(164, '2025-02-14', '2025-02-14 06:43:59.204306', '2025-02-14 06:44:04.204311', 0, 0, 12, 0),
(165, '2025-02-14', '2025-02-14 06:44:12.017579', '2025-02-14 07:41:26.763910', 0, 0, 18, 0),
(166, '2025-02-17', '2025-02-17 05:22:06.361344', NULL, 0, 0, 15, 0),
(167, '2025-02-17', '2025-02-17 05:20:35.749348', '2025-02-17 05:20:57.166531', 0, 0, 18, 0),
(168, '2025-02-18', '2025-02-18 08:57:11.792171', '2025-02-18 12:46:55.536531', 0, 0, 18, 0),
(169, '2025-02-19', '2025-02-19 11:10:22.395592', '2025-02-19 11:10:26.209109', 0, 0, 12, 0),
(170, '2025-02-19', '2025-02-19 11:13:09.681712', NULL, 0, 0, 17, 0),
(171, '2025-02-19', '2025-02-19 09:49:09.913759', NULL, 0, 0, 14, 0),
(172, '2025-02-19', '2025-02-19 11:10:33.130703', '2025-02-19 11:13:00.791272', 0, 0, 18, 0),
(173, '2025-02-20', '2025-02-20 03:51:04.124101', '2025-02-20 03:51:06.745709', 0, 0, 12, 0),
(174, '2025-02-20', '2025-02-20 03:51:20.311870', NULL, 0, 0, 14, 0),
(175, '2025-02-25', '2025-02-25 10:34:40.055210', '2025-02-25 10:34:44.405961', 0, 0, 12, 0),
(176, '2025-02-25', '2025-02-25 10:14:03.902408', '2025-02-25 10:33:57.964161', 0, 0, 18, 0),
(177, '2025-02-25', '2025-02-25 10:34:56.157448', NULL, 0, 0, 17, 0),
(178, '2025-02-25', '2025-02-25 10:34:07.691041', NULL, 0, 0, 14, 0),
(179, '2025-03-04', '2025-03-04 09:59:55.996391', NULL, 0, 0, 12, 0),
(180, '2025-03-04', '2025-03-04 07:55:12.608676', NULL, 0, 0, 14, 0),
(181, '2025-03-04', '2025-03-04 08:57:40.291808', NULL, 0, 0, 13, 0),
(182, '2025-03-05', '2025-03-05 12:28:15.035358', NULL, 0, 0, 13, 0),
(183, '2025-03-05', '2025-03-05 03:58:07.203062', NULL, 0, 0, 12, 0),
(184, '2025-03-06', '2025-03-06 11:02:42.389665', '2025-03-06 12:51:51.999934', 0, 0, 13, 0),
(185, '2025-03-06', '2025-03-06 04:15:05.633190', NULL, 0, 0, 14, 0),
(186, '2025-03-06', '2025-03-06 09:50:37.059955', '2025-03-06 10:13:57.097228', 0, 0, 12, 0),
(187, '2025-03-07', '2025-03-07 07:41:46.032366', '2025-03-07 08:28:45.415938', 0, 0, 13, 0),
(188, '2025-03-07', '2025-03-07 05:01:47.224739', NULL, 0, 0, 14, 0),
(189, '2025-03-07', '2025-03-07 12:00:49.740457', '2025-03-07 12:02:06.230611', 0, 0, 12, 0),
(190, '2025-03-07', '2025-03-07 12:03:14.552198', '2025-03-07 12:45:20.147945', 0, 0, 18, 0),
(191, '2025-03-10', '2025-03-10 06:51:42.200309', '2025-03-10 08:30:22.352738', 0, 0, 13, 0),
(192, '2025-03-10', '2025-03-10 08:58:00.760156', '2025-03-10 13:19:03.296421', 0, 0, 18, 0),
(193, '2025-03-10', '2025-03-10 08:29:51.265978', NULL, 0, 0, 14, 0),
(194, '2025-03-11', '2025-03-11 06:13:05.262414', '2025-03-11 12:46:14.054275', 0, 0, 13, 0),
(195, '2025-03-11', '2025-03-11 03:55:04.987009', '2025-03-11 06:12:51.460200', 0, 0, 18, 0),
(196, '2025-03-11', '2025-03-11 10:24:52.073685', '2025-03-11 10:24:56.441309', 0, 0, 12, 0),
(197, '2025-03-11', '2025-03-11 10:25:06.602126', '2025-03-11 12:44:00.127654', 0, 0, 14, 0),
(198, '2025-03-12', '2025-03-12 11:38:02.727165', '2025-03-12 11:44:26.578775', 0, 0, 14, 0),
(199, '2025-03-12', '2025-03-12 11:45:26.699004', '2025-03-12 13:10:35.351704', 0, 0, 13, 0),
(200, '2025-03-12', '2025-03-12 09:47:06.281081', '2025-03-12 13:10:22.552639', 0, 0, 12, 0),
(201, '2025-03-13', '2025-03-13 04:44:24.314280', '2025-03-13 13:21:19.995896', 0, 0, 13, 0),
(202, '2025-03-13', '2025-03-13 04:31:01.456108', '2025-03-13 04:44:10.415574', 0, 0, 14, 0),
(203, '2025-03-13', '2025-03-13 04:45:07.126297', '2025-03-13 13:22:04.088614', 0, 0, 12, 0),
(204, '2025-03-14', '2025-03-14 08:02:10.960151', '2025-03-14 12:44:06.567339', 0, 0, 13, 0),
(205, '2025-03-14', '2025-03-14 04:41:25.996467', '2025-03-14 05:41:05.208993', 0, 0, 14, 0),
(206, '2025-03-14', '2025-03-14 11:02:33.636816', '2025-03-14 12:38:31.183860', 0, 0, 12, 0),
(207, '2025-03-14', '2025-03-14 08:01:29.214272', '2025-03-14 09:10:24.996177', 0, 0, 26, 0),
(208, '2025-03-17', '2025-03-17 11:59:04.330232', '2025-03-17 12:36:19.738803', 0, 0, 14, 0),
(209, '2025-03-17', '2025-03-17 06:26:09.903426', '2025-03-17 11:35:14.440607', 0, 0, 13, 0),
(210, '2025-03-17', '2025-03-17 06:25:51.546053', '2025-03-17 09:36:24.939853', 0, 0, 26, 0),
(211, '2025-03-17', '2025-03-17 09:36:38.349254', '2025-03-17 09:54:27.881238', 0, 0, 18, 0),
(212, '2025-03-17', '2025-03-17 11:18:50.815754', '2025-03-17 11:22:59.884785', 0, 0, 12, 0),
(213, '2025-03-17', '2025-03-17 12:53:24.482152', '2025-03-17 13:01:50.781121', 0, 0, 27, 0),
(214, '2025-03-17', '2025-03-17 12:54:06.561260', '2025-03-17 13:01:57.135147', 0, 0, 16, 0),
(215, '2025-03-18', '2025-03-18 04:03:11.837470', '2025-03-18 05:16:14.324244', 0, 0, 27, 0),
(216, '2025-03-18', '2025-03-18 03:47:31.458894', '2025-03-18 05:40:19.049453', 0, 0, 16, 0),
(217, '2025-03-18', '2025-03-18 03:49:33.762308', '2025-03-18 03:50:33.560628', 0, 0, 26, 0),
(218, '2025-03-18', '2025-03-18 07:11:47.169614', '2025-03-18 07:22:00.531134', 0, 0, 14, 0),
(219, '2025-03-18', '2025-03-18 07:22:09.548725', '2025-03-18 08:38:13.323704', 0, 0, 28, 0),
(220, '2025-03-18', '2025-03-18 05:26:37.197775', '2025-03-18 12:32:30.248109', 0, 0, 15, 0),
(221, '2025-03-18', '2025-03-18 08:38:25.855694', '2025-03-18 12:32:04.580804', 0, 0, 13, 0),
(222, '2025-03-19', '2025-03-19 08:32:24.403873', NULL, 0, 0, 13, 0),
(223, '2025-03-19', '2025-03-19 04:12:54.076248', '2025-03-19 08:30:31.676043', 0, 0, 15, 0),
(224, '2025-03-19', '2025-03-19 09:27:59.926621', NULL, 0, 0, 14, 0),
(225, '2025-03-20', '2025-03-20 09:03:02.759573', NULL, 0, 0, 14, 0),
(226, '2025-03-20', '2025-03-20 09:09:07.112470', NULL, 0, 0, 13, 0),
(227, '2025-03-21', '2025-03-21 06:34:59.597889', NULL, 0, 0, 14, 0),
(228, '2025-03-22', '2025-03-22 12:39:23.775656', '2025-03-22 12:57:18.382124', 0, 0, 14, 0),
(229, '2025-03-22', '2025-03-22 12:29:09.074105', '2025-03-22 12:33:09.887291', 0, 0, 17, 0),
(230, '2025-03-24', '2025-03-24 11:10:33.197383', '2025-03-24 13:34:44.520941', 0, 0, 14, 0),
(231, '2025-03-24', '2025-03-24 11:10:47.189870', '2025-03-24 13:34:29.226230', 0, 0, 17, 0),
(232, '2025-03-25', '2025-03-25 03:28:27.467300', NULL, 0, 0, 14, 0),
(233, '2025-03-25', '2025-03-25 11:14:07.243821', NULL, 0, 0, 17, 0),
(234, '2025-03-26', '2025-03-26 05:22:29.562180', '2025-03-26 06:39:05.254312', 0, 0, 13, 0),
(235, '2025-03-26', '2025-03-26 11:35:33.479404', NULL, 0, 0, 14, 0),
(236, '2025-03-26', '2025-03-26 11:35:10.734222', NULL, 0, 0, 17, 0),
(237, '2025-03-27', '2025-03-27 03:19:29.922613', NULL, 0, 0, 14, 0),
(238, '2025-03-27', '2025-03-27 03:24:43.139068', '2025-03-27 04:04:38.304668', 0, 0, 17, 0),
(239, '2025-03-27', '2025-03-27 04:04:49.836279', NULL, 0, 0, 13, 0),
(240, '2025-03-31', '2025-03-31 06:39:01.337219', NULL, 0, 0, 14, 0),
(241, '2025-03-31', '2025-03-31 07:09:08.015556', '2025-03-31 12:56:31.318460', 0, 0, 17, 0),
(242, '2025-03-31', '2025-03-31 12:56:41.467640', NULL, 0, 0, 13, 0),
(243, '2025-04-01', '2025-04-01 06:40:28.278330', '2025-04-01 07:41:08.962445', 0, 0, 17, 0),
(244, '2025-04-01', '2025-04-01 07:41:37.739380', NULL, 0, 0, 13, 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee_employeeprofile`
--

CREATE TABLE `employee_employeeprofile` (
  `id` bigint(20) NOT NULL,
  `level` varchar(10) NOT NULL,
  `skill` varchar(20) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `total_time` bigint(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_on_break` tinyint(1) NOT NULL,
  `promoted_to_admin` tinyint(1) NOT NULL,
  `is_on_call` tinyint(1) NOT NULL,
  `call_start_time` datetime(6) DEFAULT NULL,
  `profile_picture` varchar(100) DEFAULT NULL,
  `is_idle` tinyint(1) NOT NULL,
  `last_activity` datetime(6) NOT NULL,
  `reporting_manager_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_employeeprofile`
--

INSERT INTO `employee_employeeprofile` (`id`, `level`, `skill`, `is_admin`, `user_id`, `status`, `total_time`, `is_active`, `is_on_break`, `promoted_to_admin`, `is_on_call`, `call_start_time`, `profile_picture`, `is_idle`, `last_activity`, `reporting_manager_id`) VALUES
(9, '', '', 0, 12, 'offline', 0, 0, 0, 0, 0, NULL, '', 0, '2025-03-17 11:22:59.874550', NULL),
(10, '', '', 1, 13, 'offline', 0, 1, 0, 0, 1, '2025-03-24 05:59:53.780135', '', 0, '2025-04-01 07:41:37.757602', NULL),
(11, '1', 'Windows', 0, 14, 'offline', 0, 1, 0, 0, 0, NULL, 'profile_pictures/mohanlal.jpg', 0, '2025-04-01 06:51:35.319728', NULL),
(12, '1', 'Windows', 0, 15, 'offline', 0, 0, 0, 0, 0, NULL, '', 0, '2025-03-19 08:30:31.676043', NULL),
(13, '1', 'Linux', 1, 16, 'offline', 0, 0, 0, 0, 0, NULL, '', 0, '2025-03-18 05:40:19.040446', NULL),
(14, '1', 'Windows', 0, 17, 'offline', 0, 0, 0, 0, 0, NULL, 'profile_pictures/mammootty.avif', 0, '2025-04-01 07:41:08.946586', NULL),
(15, '1', 'Linux', 0, 18, 'offline', 0, 0, 0, 0, 0, NULL, 'profile_pictures/fahad.webp', 0, '2025-03-17 09:54:27.881238', NULL),
(16, '1', 'Linux', 1, 23, 'offline', 0, 0, 0, 0, 0, NULL, NULL, 0, '2025-03-17 05:50:17.218809', NULL),
(17, '1', 'AWS', 0, 24, 'offline', 0, 0, 0, 0, 0, NULL, NULL, 0, '2025-03-17 05:50:17.218809', NULL),
(18, '1', 'AWS', 0, 26, 'active', 0, 0, 0, 0, 0, NULL, '', 0, '2025-04-01 04:40:28.350732', NULL),
(19, '1', 'Linux', 0, 27, 'offline', 0, 0, 0, 0, 0, NULL, '', 0, '2025-03-18 05:16:14.308610', 13),
(20, '1', 'Windows', 0, 28, 'offline', 0, 0, 0, 0, 0, NULL, '', 0, '2025-03-18 08:38:13.323704', 12);

-- --------------------------------------------------------

--
-- Table structure for table `employee_newcallquery`
--

CREATE TABLE `employee_newcallquery` (
  `id` bigint(20) NOT NULL,
  `primary_email` varchar(254) NOT NULL,
  `client_email` varchar(254) NOT NULL,
  `cc_email` varchar(254) DEFAULT NULL,
  `note` longtext NOT NULL,
  `call_start_time` datetime(6) NOT NULL,
  `call_end_time` datetime(6) DEFAULT NULL,
  `ticket_created` tinyint(1) NOT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `call_duration_seconds` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_newcallquery`
--

INSERT INTO `employee_newcallquery` (`id`, `primary_email`, `client_email`, `cc_email`, `note`, `call_start_time`, `call_end_time`, `ticket_created`, `agent_id`, `client_name`, `call_duration_seconds`) VALUES
(12, 'levelone@example.com', 'clienttestmail@gmail.com', 'cctestmail@gmail.com', 'test note for client call', '2025-01-22 06:10:57.945569', NULL, 1, 14, 'client test name', 51.588125),
(13, 'levelone@example.com', '', '', 'test note 1', '2025-01-22 07:00:00.546811', NULL, 0, 14, 'Client name 1', 38.754968),
(14, 'levelone@example.com', 'Clientmail12@gmail.com', 'ccmail12@gmail.com', 'Test note 12', '2025-01-22 12:10:53.436259', NULL, 1, 17, 'ClientName 12', 84.278105),
(15, 'levelone@example.com', '', '', 'it is only for testing', '2025-01-29 05:33:36.326242', NULL, 0, 14, 'clienttestname2', 25.798031),
(16, 'levelone@example.com', 'clienttestmail3@gmail.com', 'ccmail3@gmail.com', 'client test note 4', '2025-01-29 06:06:33.138724', NULL, 1, 14, 'clienttestname3', 87.939301),
(17, 'levelone@example.com', 'clienttestmail5@gmail.com', 'cctestmail5@gmail.com', 'testnote 5', '2025-01-30 09:00:35.294306', NULL, 1, 14, 'clienttestname5', 70.372199),
(18, 'levelone@example.com', 'clientmail123@gmail.com', 'ccmail123@gmail.com', 'this is a testing note for client 123', '2025-03-24 09:29:16.349981', NULL, 1, 14, 'client123', 54.91517),
(19, 'levelone@example.com', '', '', 'note for client 1234', '2025-03-24 09:30:27.015705', NULL, 0, 14, 'client1234', 20.426448),
(20, 'levelone@example.com', '', '', 'note for client 101', '2025-03-25 05:49:22.566010', NULL, 0, 14, 'client101', 22.549675);

-- --------------------------------------------------------

--
-- Table structure for table `employee_ondutyrequest`
--

CREATE TABLE `employee_ondutyrequest` (
  `id` bigint(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` longtext NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `comment` longtext DEFAULT NULL,
  `approved_by_id` bigint(20) DEFAULT NULL,
  `employee_id` bigint(20) NOT NULL,
  `end_time` time(6) DEFAULT NULL,
  `start_time` time(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_ondutyrequest`
--

INSERT INTO `employee_ondutyrequest` (`id`, `start_date`, `end_date`, `reason`, `status`, `created_at`, `updated_at`, `comment`, `approved_by_id`, `employee_id`, `end_time`, `start_time`) VALUES
(1, '2025-03-18', '2025-03-18', 'this is a request for testing', 'approved', '2025-03-17 11:26:30.973095', '2025-03-17 11:38:04.655211', NULL, 13, 19, '18:00:00.000000', '09:00:00.000000'),
(2, '2025-03-19', '2025-03-20', 'I have a training at coimbatore for 2 days', 'rejected', '2025-03-17 12:38:00.904193', '2025-03-17 12:38:10.558307', NULL, 13, 19, '18:00:00.000000', '09:00:00.000000'),
(3, '2025-03-20', '2025-03-20', 'for testing purposes', 'approved', '2025-03-18 03:53:16.731764', '2025-03-18 05:26:44.431442', NULL, 12, 20, '18:00:00.000000', '09:00:00.000000'),
(4, '2025-03-21', '2025-03-21', 'Going to Banglore for server upgradation', 'pending', '2025-03-18 03:54:45.755142', '2025-03-18 03:54:45.755142', NULL, NULL, 12, '18:00:00.000000', '09:00:00.000000'),
(5, '2025-03-21', '2025-03-22', 'this is test', 'approved', '2025-03-18 04:09:14.408963', '2025-03-18 04:09:35.823279', NULL, 13, 19, '18:00:00.000000', '09:00:00.000000'),
(6, '2025-03-18', '2025-03-19', 'no reason', 'rejected', '2025-03-18 05:41:39.955370', '2025-03-18 05:41:54.846200', NULL, 12, 20, '18:00:00.000000', '09:00:00.000000'),
(7, '2025-03-19', '2025-03-19', 'test reason', 'approved', '2025-03-18 05:49:25.573575', '2025-03-18 05:49:33.633848', NULL, 12, 20, '18:00:00.000000', '09:00:00.000000'),
(8, '2025-03-24', '2025-03-25', 'Going for an upgradation', 'approved', '2025-03-18 06:37:19.344269', '2025-03-18 06:37:49.659208', NULL, 12, 20, '20:00:00.000000', '10:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `employee_sessionactivity`
--

CREATE TABLE `employee_sessionactivity` (
  `id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `login_time` datetime(6) DEFAULT NULL,
  `logout_time` datetime(6) DEFAULT NULL,
  `break_duration` bigint(20) NOT NULL,
  `work_time` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `break_start_time` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_sessionactivity`
--

INSERT INTO `employee_sessionactivity` (`id`, `date`, `login_time`, `logout_time`, `break_duration`, `work_time`, `user_id`, `break_start_time`) VALUES
(1, '2024-11-15', '2024-11-15 04:25:10.512731', '2024-11-15 04:30:34.200937', 0, 323688206, 13, NULL),
(2, '2024-11-15', '2024-11-15 04:30:45.479587', '2024-11-15 04:38:57.968780', 0, 492489193, 13, NULL),
(3, '2024-11-15', '2024-11-15 04:39:03.504731', '2024-11-15 04:46:22.448564', 0, 438943833, 14, NULL),
(4, '2024-11-15', '2024-11-15 04:52:01.472718', '2024-11-15 04:53:15.707243', 0, 74234525, 14, NULL),
(5, '2024-11-15', '2024-11-15 04:53:24.639095', '2024-11-15 04:56:07.977146', 0, 163338051, 13, NULL),
(6, '2024-11-15', '2024-11-15 05:13:31.334256', '2024-11-15 05:36:38.805681', 0, 1387471425, 17, NULL),
(7, '2024-11-15', '2024-11-15 05:14:00.582632', '2024-11-15 05:14:51.821543', 0, 51238911, 15, NULL),
(8, '2024-11-15', '2024-11-15 05:15:01.163896', '2024-11-15 05:36:32.035479', 0, 1290871583, 13, NULL),
(9, '2024-11-15', '2024-11-15 05:37:34.618916', '2024-11-15 05:45:08.735707', 0, 454116791, 13, NULL),
(10, '2024-11-15', '2024-11-15 05:45:16.026850', '2024-11-15 05:45:45.969136', 0, 29942286, 13, NULL),
(11, '2024-11-15', '2024-11-15 05:51:50.736240', '2024-11-15 05:58:30.028508', 0, 399292268, 14, NULL),
(12, '2024-11-15', '2024-11-15 05:58:37.170665', '2024-11-15 06:00:09.505822', 0, 92335157, 13, NULL),
(13, '2024-11-15', '2024-11-15 06:03:33.122531', '2024-11-15 06:04:39.140066', 0, 66017535, 13, NULL),
(14, '2024-11-15', '2024-11-15 06:17:03.502864', '2024-11-15 06:25:59.149377', 0, 535646513, 13, NULL),
(15, '2024-11-15', '2024-11-15 06:26:04.883447', '2024-11-15 06:27:35.069128', 0, 90185681, 14, NULL),
(16, '2024-11-15', '2024-11-15 06:28:52.366921', '2024-11-15 06:30:40.918179', 0, 108551258, 13, NULL),
(17, '2024-11-15', '2024-11-15 06:30:46.603684', '2024-11-15 06:31:47.909127', 0, 61305443, 14, NULL),
(18, '2024-11-15', '2024-11-15 06:33:55.278645', '2024-11-15 06:35:15.352646', 0, 80074001, 13, NULL),
(19, '2024-11-15', '2024-11-15 06:57:23.999364', '2024-11-15 06:57:54.835591', 0, 30836227, 14, NULL),
(20, '2024-11-15', '2024-11-15 06:58:07.415090', '2024-11-15 06:59:41.959460', 300000000, -205455630, 14, NULL),
(21, '2024-11-15', '2024-11-15 06:59:58.976363', '2024-11-15 07:13:38.701476', 0, 819725113, 18, NULL),
(22, '2024-11-15', '2024-11-15 07:13:45.659235', '2024-11-15 07:15:59.652821', 300000000, -166006414, 18, NULL),
(23, '2024-11-15', '2024-11-15 07:16:06.194485', '2024-11-15 07:20:12.470390', 0, 246275905, 13, NULL),
(24, '2024-11-15', '2024-11-15 07:20:32.998791', '2024-11-15 07:22:39.493762', 60296497, 66198474, 15, NULL),
(25, '2024-11-15', '2024-11-15 07:22:49.157263', '2024-11-15 07:33:02.121254', 312850688, 300113303, 18, NULL),
(26, '2024-11-15', '2024-11-15 07:33:10.815355', '2024-11-15 07:45:35.144272', 0, 744328917, 15, NULL),
(27, '2024-11-15', '2024-11-15 07:46:07.617917', '2024-11-15 07:47:21.992597', 11942329, 62432351, 18, NULL),
(28, '2024-11-15', '2024-11-15 07:47:29.545378', '2024-11-15 07:48:46.192769', 0, 76647391, 17, NULL),
(29, '2024-11-15', '2024-11-15 08:24:51.080637', '2024-11-15 08:27:57.818220', 0, 186737583, 18, NULL),
(30, '2024-11-15', '2024-11-15 08:28:06.803628', '2024-11-15 08:34:24.360269', 0, 377556641, 17, NULL),
(31, '2024-11-15', '2024-11-15 08:34:33.541679', '2024-11-15 08:41:36.927133', 0, 423385454, 15, NULL),
(32, '2024-11-15', '2024-11-15 08:59:15.974428', '2024-11-15 08:59:46.809335', 0, 30834907, 13, NULL),
(33, '2024-11-15', '2024-11-15 08:59:51.973485', '2024-11-15 09:26:56.116813', 0, 1624143328, 14, NULL),
(34, '2024-11-15', '2024-11-15 09:00:08.730210', '2024-11-15 09:27:08.714495', 0, 1619984285, 17, NULL),
(35, '2024-11-15', '2024-11-15 09:27:21.227167', '2024-11-15 09:57:01.513145', 0, 1780285978, 15, NULL),
(36, '2024-11-15', '2024-11-15 09:57:07.354652', '2024-11-15 11:10:15.509734', 27647191, 4360507891, 14, NULL),
(37, '2024-11-15', '2024-11-15 11:10:30.651414', '2024-11-15 11:16:21.504249', 34988580, 315864255, 17, NULL),
(38, '2024-11-15', '2024-11-15 11:35:17.425158', '2024-11-15 11:59:45.255367', 157444973, 1310385236, 13, NULL),
(39, '2024-11-15', '2024-11-15 12:00:15.686434', '2024-11-15 12:01:36.251115', 18464193, 62100488, 14, NULL),
(40, '2024-11-15', '2024-11-15 12:01:56.587745', '2024-11-15 12:07:54.387265', 0, 357799520, 18, NULL),
(41, '2024-11-18', '2024-11-18 03:41:40.954086', '2024-11-18 05:17:10.155139', 21012067, 5708188986, 13, NULL),
(42, '2024-11-18', '2024-11-18 05:17:22.554929', '2024-11-18 05:21:28.472821', 18981634, 226936258, 13, NULL),
(43, '2024-11-18', '2024-11-18 05:21:33.914636', '2024-11-18 06:27:01.604557', 0, 3927689921, 14, NULL),
(44, '2024-11-18', '2024-11-18 05:45:08.123362', '2024-11-18 05:45:14.091878', 0, 5968516, 15, NULL),
(45, '2024-11-18', '2024-11-18 05:45:22.879964', '2024-11-18 06:27:07.821147', 0, 2504941183, 17, NULL),
(46, '2024-11-18', '2024-11-18 06:27:14.329967', '2024-11-18 06:48:15.593221', 0, 1261263254, 14, NULL),
(47, '2024-11-18', '2024-11-18 06:48:32.868241', '2024-11-18 06:52:30.315398', 0, 237447157, 14, NULL),
(48, '2024-11-18', '2024-11-18 06:52:38.380254', '2024-11-18 07:17:25.317128', 0, 1486936874, 14, NULL),
(49, '2024-11-18', '2024-11-18 07:17:30.980805', '2024-11-18 08:50:16.479441', 0, 5565498636, 14, NULL),
(50, '2024-11-18', '2024-11-18 08:50:22.191026', '2024-11-18 09:11:08.001577', 0, 1245810551, 14, NULL),
(51, '2024-11-18', '2024-11-18 09:11:15.785072', '2024-11-18 09:14:05.731226', 0, 169946154, 14, NULL),
(52, '2024-11-18', '2024-11-18 09:14:14.235968', '2024-11-18 09:20:25.848854', 0, 371612886, 14, NULL),
(53, '2024-11-18', '2024-11-18 09:20:36.826140', '2024-11-18 09:58:57.836521', 0, 2301010381, 14, NULL),
(54, '2024-11-18', '2024-11-18 09:59:03.268904', '2024-11-18 11:58:22.186031', 173342012, 6985575115, 14, NULL),
(55, '2024-11-18', '2024-11-18 10:34:56.272825', '2024-11-18 10:49:16.673539', 0, 860400714, 17, NULL),
(56, '2024-11-18', '2024-11-18 10:49:25.375077', '2024-11-18 10:49:56.106975', 0, 30731898, 18, NULL),
(57, '2024-11-18', '2024-11-18 10:50:04.747461', '2024-11-18 12:00:05.747490', 0, 4201000029, 15, NULL),
(58, '2024-11-18', '2024-11-18 11:58:27.310751', '2024-11-18 12:21:00.739756', 0, 1353429005, 14, NULL),
(59, '2024-11-18', '2024-11-18 12:00:13.434065', '2024-11-18 12:20:41.775419', 0, 1228341354, 13, NULL),
(60, '2024-11-19', '2024-11-19 04:18:16.992918', '2024-11-19 05:09:07.236195', 0, 3050243277, 17, NULL),
(61, '2024-11-19', '2024-11-19 04:20:52.675790', '2024-11-19 05:09:12.578984', 0, 2899903194, 13, NULL),
(62, '2024-11-19', '2024-11-19 05:09:21.210191', '2024-11-19 05:15:47.220487', 0, 386010296, 17, NULL),
(63, '2024-11-19', '2024-11-19 05:15:54.761084', '2024-11-19 05:24:48.402711', 0, 533641627, 17, NULL),
(64, '2024-11-19', '2024-11-19 05:24:59.052143', '2024-11-19 05:42:15.765367', 0, 1036713224, 14, NULL),
(65, '2024-11-19', '2024-11-19 05:30:49.650122', '2024-11-19 05:42:21.075035', 0, 691424913, 17, NULL),
(66, '2024-11-19', '2024-11-19 05:42:28.802146', '2024-11-19 05:49:10.804107', 0, 402001961, 14, NULL),
(67, '2024-11-19', '2024-11-19 05:49:18.374515', '2024-11-19 05:55:52.740169', 0, 394365654, 14, NULL),
(68, '2024-11-19', '2024-11-19 05:56:03.437066', '2024-11-19 06:01:40.253781', 13405815, 323410900, 14, NULL),
(69, '2024-11-19', '2024-11-19 05:57:13.840255', '2024-11-19 06:13:19.344965', 0, 965504710, 17, NULL),
(70, '2024-11-19', '2024-11-19 06:33:49.636284', '2024-11-19 06:42:24.340549', 0, 514704265, 14, NULL),
(71, '2024-11-19', '2024-11-19 06:34:08.324123', '2024-11-19 06:42:30.394161', 0, 502070038, 17, NULL),
(72, '2024-11-19', '2024-11-19 06:42:36.733336', '2024-11-19 06:44:26.284759', 0, 109551423, 14, NULL),
(73, '2024-11-19', '2024-11-19 06:42:48.750370', '2024-11-19 06:44:31.836069', 0, 103085699, 17, NULL),
(74, '2024-11-19', '2024-11-19 06:53:13.959068', '2024-11-19 08:19:16.087946', 0, 5162128878, 14, NULL),
(75, '2024-11-19', '2024-11-19 08:19:21.989862', '2024-11-19 10:44:31.474509', 0, 8709484647, 14, NULL),
(76, '2024-11-19', '2024-11-19 08:58:59.066145', '2024-11-19 11:32:28.933394', 0, 9209867249, 17, NULL),
(77, '2024-11-19', '2024-11-19 10:44:41.421589', '2024-11-19 11:27:13.266306', 0, 2551844717, 14, NULL),
(78, '2024-11-19', '2024-11-19 11:27:23.024735', '2024-11-19 11:57:57.681429', 0, 1834656694, 14, NULL),
(79, '2024-11-20', '2024-11-20 03:48:55.622247', '2024-11-20 04:19:32.512329', 10129963, 1826760119, 14, NULL),
(80, '2024-11-20', '2024-11-20 04:19:39.186599', NULL, 16193262, 0, 14, NULL),
(81, '2024-11-20', '2024-11-20 04:31:06.223896', '2024-11-20 05:03:06.026684', 19464184, 1900338604, 17, NULL),
(82, '2024-11-20', '2024-11-20 05:03:40.547429', '2024-11-20 05:03:54.705735', 3002261, 11156045, 17, NULL),
(83, '2024-11-27', '2024-11-27 03:43:34.620431', '2024-11-27 03:43:51.392306', 0, 16771875, 14, NULL),
(84, '2024-11-27', '2024-11-27 03:43:57.894605', '2024-11-27 03:44:06.264315', 0, 8369710, 17, NULL),
(85, '2024-11-27', '2024-11-27 03:44:24.174664', '2024-11-27 04:34:58.300761', 0, 3034126097, 18, NULL),
(86, '2024-11-27', '2024-11-27 04:42:31.434824', '2024-11-27 04:51:27.076372', 0, 535641548, 14, NULL),
(87, '2024-11-27', '2024-11-27 04:51:32.091735', '2024-11-27 05:03:36.737800', 3985552, 720660513, 14, NULL),
(88, '2024-11-27', '2024-11-27 05:03:43.589701', '2024-11-27 05:04:08.601528', 0, 25011827, 17, NULL),
(89, '2024-11-27', '2024-11-27 05:04:14.635107', '2024-11-27 05:14:12.003101', 2792709, 594575285, 18, NULL),
(90, '2024-11-27', '2024-11-27 05:14:20.713533', '2024-11-27 05:19:02.136050', 0, 281422517, 14, NULL),
(91, '2024-11-27', '2024-11-27 06:36:53.961625', '2024-11-27 07:12:07.188020', 0, 2113226395, 14, NULL),
(92, '2024-11-27', '2024-11-27 07:12:12.448063', '2024-11-27 07:17:24.284084', 0, 311836021, 14, NULL),
(93, '2024-11-27', '2024-11-27 07:12:40.611543', '2024-11-27 09:48:56.488237', 0, 9375876694, 17, NULL),
(94, '2024-11-27', '2024-11-27 07:17:29.104726', '2024-11-27 09:48:22.236055', 0, 9053131329, 14, NULL),
(95, '2024-11-27', '2024-11-27 09:48:30.542863', NULL, 0, 0, 14, NULL),
(96, '2024-11-27', '2024-11-27 09:49:05.418219', '2024-11-27 11:19:16.263063', 0, 5410844844, 17, NULL),
(97, '2024-11-27', '2024-11-27 10:33:41.520423', '2024-11-27 11:08:31.691151', 0, 2090170728, 14, NULL),
(98, '2024-11-27', '2024-11-27 11:08:37.274159', NULL, 0, 0, 14, NULL),
(99, '2024-11-27', '2024-11-27 11:08:38.389488', '2024-11-27 11:27:48.240953', 0, 1149851465, 14, NULL),
(100, '2024-11-27', '2024-11-27 11:19:26.819487', NULL, 0, 0, 17, NULL),
(101, '2024-11-27', '2024-11-27 11:27:57.868462', '2024-11-27 11:44:05.578433', 0, 967709971, 14, NULL),
(102, '2024-11-27', '2024-11-27 11:44:12.123486', '2024-11-27 11:46:28.124373', 0, 136000887, 14, NULL),
(103, '2024-11-28', '2024-11-28 04:15:09.992914', '2024-11-28 04:37:31.374654', 6122494, 1335259246, 14, NULL),
(104, '2024-11-28', '2024-11-28 04:37:42.004449', '2024-11-28 05:58:52.708549', 14188850, 4856515250, 17, NULL),
(105, '2024-11-28', '2024-11-28 05:59:00.111827', '2024-11-28 06:11:47.829090', 2808194, 764909069, 14, NULL),
(106, '2024-11-28', '2024-11-28 06:11:55.872890', '2024-11-28 06:25:13.673897', 0, 797801007, 17, NULL),
(107, '2024-11-28', '2024-11-28 06:25:18.662616', '2024-11-28 08:15:37.169687', 20482258, 6598024813, 14, NULL),
(108, '2024-11-28', '2024-11-28 08:15:43.590291', '2024-11-28 10:25:30.933463', 0, 7787343172, 14, NULL),
(109, '2024-11-28', '2024-11-28 10:25:38.702121', '2024-11-28 12:36:23.924616', 10166125, 7835056370, 17, NULL),
(110, '2024-11-29', '2024-11-29 04:02:24.842014', '2024-11-29 05:43:56.151443', 0, 6091309429, 14, NULL),
(111, '2024-11-29', '2024-11-29 05:44:02.162617', '2024-11-29 05:53:19.705933', 0, 557543316, 14, NULL),
(112, '2024-11-29', '2024-11-29 05:53:25.653903', '2024-11-29 06:08:04.496784', 0, 878842881, 14, NULL),
(113, '2024-11-29', '2024-11-29 06:08:08.852711', '2024-11-29 06:10:14.491381', 0, 125638670, 14, NULL),
(114, '2024-11-29', '2024-11-29 06:10:26.202839', '2024-11-29 06:11:05.463151', 0, 39260312, 13, NULL),
(115, '2024-11-29', '2024-11-29 06:11:10.759544', '2024-11-29 06:11:49.038433', 0, 38278889, 12, NULL),
(116, '2024-11-29', '2024-11-29 06:11:54.355494', '2024-11-29 06:24:37.887245', 0, 763531751, 14, NULL),
(117, '2024-11-29', '2024-11-29 06:24:45.586604', '2024-11-29 06:26:07.894808', 0, 82308204, 12, NULL),
(118, '2024-11-29', '2024-11-29 06:26:13.412143', '2024-11-29 06:34:45.764587', 0, 512352444, 14, NULL),
(119, '2024-11-29', '2024-11-29 06:34:50.736232', '2024-11-29 07:01:14.577915', 0, 1583841683, 14, NULL),
(120, '2024-11-29', '2024-11-29 06:43:46.157649', '2024-11-29 07:01:28.299957', 0, 1062142308, 17, NULL),
(121, '2024-11-29', '2024-11-29 07:01:19.416266', '2024-11-29 07:08:25.307801', 0, 425891535, 14, NULL),
(122, '2024-11-29', '2024-11-29 07:01:34.492273', '2024-11-29 07:08:31.729592', 0, 417237319, 17, NULL),
(123, '2024-11-29', '2024-11-29 07:08:43.731795', '2024-11-29 07:20:00.469867', 0, 676738072, 17, NULL),
(124, '2024-11-29', '2024-11-29 07:08:49.479453', '2024-11-29 08:51:12.164710', 0, 6142685257, 14, NULL),
(125, '2024-11-29', '2024-11-29 08:51:18.696960', '2024-11-29 10:15:26.093820', 0, 5047396860, 14, NULL),
(126, '2024-11-29', '2024-11-29 08:57:04.322823', '2024-11-29 10:15:42.219546', 0, 4717896723, 17, NULL),
(127, '2024-11-29', '2024-11-29 11:04:32.656122', '2024-11-29 11:09:23.535314', 4513216, 286365976, 14, NULL),
(128, '2024-11-29', '2024-11-29 11:09:29.994659', NULL, 5032142, 0, 14, NULL),
(129, '2024-11-29', '2024-11-29 11:20:35.263566', NULL, 2506304, 0, 17, NULL),
(130, '2024-12-03', '2024-12-03 03:46:07.968239', '2024-12-03 03:46:10.847738', 0, 2879499, 17, NULL),
(131, '2024-12-03', '2024-12-03 03:46:17.584647', '2024-12-03 04:24:13.628602', 0, 2276043955, 14, NULL),
(132, '2024-12-03', '2024-12-03 03:52:26.052081', '2024-12-03 04:24:21.529759', 0, 1915477678, 17, NULL),
(133, '2024-12-03', '2024-12-03 04:24:38.909848', '2024-12-03 04:42:53.443514', 0, 1094533666, 17, NULL),
(134, '2024-12-03', '2024-12-03 04:24:47.483116', '2024-12-03 04:42:46.852604', 0, 1079369488, 14, NULL),
(135, '2024-12-03', '2024-12-03 04:43:00.477376', '2024-12-03 05:19:29.928539', 0, 2189451163, 17, NULL),
(136, '2024-12-03', '2024-12-03 04:43:07.310408', '2024-12-03 05:19:22.853219', 0, 2175542811, 14, NULL),
(137, '2024-12-03', '2024-12-03 05:19:36.043830', '2024-12-03 05:30:53.641347', 0, 677597517, 14, NULL),
(138, '2024-12-03', '2024-12-03 05:19:49.593372', '2024-12-03 05:30:58.515494', 0, 668922122, 17, NULL),
(139, '2024-12-03', '2024-12-03 05:31:12.247271', '2024-12-03 05:36:51.982498', 0, 339735227, 17, NULL),
(140, '2024-12-03', '2024-12-03 05:31:18.411421', '2024-12-03 05:36:56.311575', 0, 337900154, 14, NULL),
(141, '2024-12-03', '2024-12-03 05:38:43.379051', '2024-12-03 06:41:09.817902', 0, 3746438851, 14, NULL),
(142, '2024-12-03', '2024-12-03 05:38:56.682985', '2024-12-03 06:41:16.256323', 0, 3739573338, 17, NULL),
(143, '2024-12-03', '2024-12-03 06:41:21.302446', '2024-12-03 07:25:40.727724', 9071912, 2650353366, 14, NULL),
(144, '2024-12-03', '2024-12-03 06:52:37.506186', '2024-12-03 07:25:47.800777', 0, 1990294591, 18, NULL),
(145, '2024-12-03', '2024-12-03 07:25:54.262619', '2024-12-03 07:29:47.749216', 0, 233486597, 14, NULL),
(146, '2024-12-03', '2024-12-03 07:29:53.316358', '2024-12-03 07:47:09.360608', 4496005, 1031548245, 14, NULL),
(147, '2024-12-03', '2024-12-03 07:30:24.760031', '2024-12-03 07:47:06.058628', 0, 1001298597, 18, NULL),
(148, '2024-12-03', '2024-12-03 10:08:56.626025', '2024-12-03 12:15:33.297274', 0, 7596671249, 18, NULL),
(149, '2024-12-03', '2024-12-03 10:09:44.702872', '2024-12-03 12:15:22.453438', 0, 7537750566, 14, NULL),
(150, '2024-12-03', '2024-12-03 12:15:39.225887', '2024-12-03 12:24:07.611518', 0, 508385631, 14, NULL),
(151, '2024-12-03', '2024-12-03 12:24:15.498696', '2024-12-03 12:27:11.334897', 0, 175836201, 14, NULL),
(152, '2024-12-03', '2024-12-03 12:27:18.202393', '2024-12-03 12:29:24.358125', 0, 126155732, 14, NULL),
(153, '2024-12-03', '2024-12-03 12:29:29.961808', '2024-12-03 12:30:02.574045', 0, 32612237, 14, NULL),
(154, '2024-12-03', '2024-12-03 12:30:08.917573', '2024-12-03 12:31:43.219123', 0, 94301550, 14, NULL),
(155, '2024-12-03', '2024-12-03 12:37:52.882746', NULL, 0, 0, 14, NULL),
(156, '2024-12-04', '2024-12-04 04:30:43.469436', '2024-12-04 05:20:13.318362', 0, 2969848926, 14, NULL),
(157, '2024-12-04', '2024-12-04 05:20:19.230653', '2024-12-04 06:20:42.498961', 0, 3623268308, 14, NULL),
(158, '2024-12-04', '2024-12-04 06:20:57.219363', '2024-12-04 06:28:26.446384', 0, 449227021, 14, NULL),
(159, '2024-12-04', '2024-12-04 06:21:04.949890', '2024-12-04 06:28:31.415043', 0, 446465153, 17, NULL),
(160, '2024-12-04', '2024-12-04 06:28:37.072207', '2024-12-04 06:33:36.261448', 0, 299189241, 14, NULL),
(161, '2024-12-04', '2024-12-04 06:28:44.195475', '2024-12-04 06:33:40.458219', 0, 296262744, 17, NULL),
(162, '2024-12-04', '2024-12-04 06:33:48.000047', '2024-12-04 06:51:30.707446', 0, 1062707399, 14, NULL),
(163, '2024-12-04', '2024-12-04 06:33:55.406826', '2024-12-04 06:51:36.159466', 0, 1060752640, 17, NULL),
(164, '2024-12-04', '2024-12-04 06:51:42.910655', '2024-12-04 07:18:46.802267', 0, 1623891612, 17, NULL),
(165, '2024-12-04', '2024-12-04 06:51:51.226477', '2024-12-04 07:18:30.670898', 0, 1599444421, 14, NULL),
(166, '2024-12-04', '2024-12-04 07:18:36.139122', '2024-12-04 07:41:38.335526', 0, 1382196404, 14, NULL),
(167, '2024-12-04', '2024-12-04 07:18:57.451317', '2024-12-04 07:41:42.837768', 0, 1365386451, 17, NULL),
(168, '2024-12-04', '2024-12-04 07:41:50.728049', '2024-12-04 07:49:26.004947', 0, 455276898, 14, NULL),
(169, '2024-12-04', '2024-12-04 07:42:39.262800', '2024-12-04 07:49:31.863018', 0, 412600218, 17, NULL),
(170, '2024-12-04', '2024-12-04 07:49:38.761014', '2024-12-04 07:51:12.363431', 0, 93602417, 17, NULL),
(171, '2024-12-04', '2024-12-04 07:49:52.302755', '2024-12-04 07:51:20.134292', 0, 87831537, 14, NULL),
(172, '2024-12-04', '2024-12-04 08:23:45.754506', '2024-12-04 10:36:18.034478', 1788694, 7950491278, 14, NULL),
(173, '2024-12-04', '2024-12-04 08:24:00.402756', '2024-12-04 10:36:46.272658', 0, 7965869902, 18, NULL),
(174, '2024-12-04', '2024-12-04 10:36:23.362634', '2024-12-04 11:10:09.628109', 0, 2026265475, 14, NULL),
(175, '2024-12-04', '2024-12-04 10:36:53.387160', '2024-12-04 10:37:06.611291', 0, 13224131, 18, NULL),
(176, '2024-12-04', '2024-12-04 10:37:13.836825', '2024-12-04 11:10:19.546612', 0, 1985709787, 17, NULL),
(177, '2024-12-04', '2024-12-04 11:10:26.928501', '2024-12-04 11:13:43.826968', 0, 196898467, 14, NULL),
(178, '2024-12-04', '2024-12-04 11:10:34.543450', '2024-12-04 11:13:48.270853', 0, 193727403, 17, NULL),
(179, '2024-12-04', '2024-12-04 11:22:55.097227', '2024-12-04 12:31:58.192552', 0, 4143095325, 14, NULL),
(180, '2024-12-04', '2024-12-04 11:23:09.588515', '2024-12-04 12:31:49.972172', 0, 4120383657, 17, NULL),
(181, '2024-12-05', '2024-12-05 03:52:38.251507', '2024-12-05 05:55:33.023580', 0, 7374772073, 14, NULL),
(182, '2024-12-05', '2024-12-05 04:42:45.491654', '2024-12-05 05:55:40.111188', 0, 4374619534, 17, NULL),
(183, '2024-12-05', '2024-12-05 05:55:52.362741', '2024-12-05 06:00:59.531216', 0, 307168475, 14, NULL),
(184, '2024-12-05', '2024-12-05 06:01:05.473440', '2024-12-05 08:30:55.458194', 43244424, 8946740330, 14, NULL),
(185, '2024-12-05', '2024-12-05 08:31:02.082697', '2024-12-05 08:37:44.668297', 0, 402585600, 14, NULL),
(186, '2024-12-05', '2024-12-05 08:37:50.392673', '2024-12-05 08:48:14.122624', 0, 623729951, 14, NULL),
(187, '2024-12-05', '2024-12-05 08:42:55.583179', '2024-12-05 08:48:10.620884', 0, 315037705, 17, NULL),
(188, '2024-12-05', '2024-12-05 08:48:19.768336', '2024-12-05 10:51:34.964600', 201369405, 7193826859, 14, NULL),
(189, '2024-12-05', '2024-12-05 08:59:45.455994', '2024-12-05 10:51:29.903771', 9724687, 6694723090, 17, NULL),
(190, '2024-12-05', '2024-12-05 10:52:43.603321', '2024-12-05 10:53:46.454036', 0, 62850715, 14, NULL),
(191, '2024-12-05', '2024-12-05 10:53:51.943610', NULL, 0, 0, 14, NULL),
(192, '2024-12-06', '2024-12-06 03:54:16.637135', '2024-12-06 04:08:33.892853', 0, 857255718, 14, NULL),
(193, '2024-12-06', '2024-12-06 04:08:43.052584', '2024-12-06 05:17:36.322600', 13611289, 4119658727, 17, NULL),
(194, '2024-12-06', '2024-12-06 04:43:02.361271', '2024-12-06 05:17:42.062790', 0, 2079701519, 14, NULL),
(195, '2024-12-06', '2024-12-06 05:17:48.796762', '2024-12-06 05:54:35.182293', 0, 2206385531, 14, NULL),
(196, '2024-12-06', '2024-12-06 05:54:40.867128', '2024-12-06 09:18:38.490907', 42409344, 12195214435, 14, NULL),
(197, '2024-12-06', '2024-12-06 09:18:54.619910', '2024-12-06 10:28:22.971320', 22631921, 4145719489, 17, NULL),
(198, '2024-12-06', '2024-12-06 10:20:54.031893', '2024-12-06 11:55:05.289586', 0, 5651257693, 14, NULL),
(199, '2024-12-06', '2024-12-06 10:28:43.250258', '2024-12-06 10:56:00.263507', 3497759, 1633515490, 13, NULL),
(200, '2024-12-06', '2024-12-06 10:56:06.952809', '2024-12-06 11:54:58.433845', 0, 3531481036, 17, NULL),
(201, '2024-12-06', '2024-12-06 12:04:46.134894', '2024-12-06 12:40:45.029112', 0, 2158894218, 17, NULL),
(202, '2024-12-09', '2024-12-09 03:50:52.011279', '2024-12-09 06:14:04.643671', 0, 8592632392, 14, NULL),
(203, '2024-12-09', '2024-12-09 06:14:10.342716', '2024-12-09 06:26:20.095934', 0, 729753218, 14, NULL),
(204, '2024-12-09', '2024-12-09 06:26:25.009314', '2024-12-09 06:40:47.718174', 0, 862708860, 14, NULL),
(205, '2024-12-09', '2024-12-09 06:40:58.914363', '2024-12-09 06:52:22.453722', 0, 683539359, 14, NULL),
(206, '2024-12-09', '2024-12-09 06:52:28.783896', '2024-12-09 06:58:44.807614', 0, 376023718, 17, NULL),
(207, '2024-12-09', '2024-12-09 06:58:51.960470', '2024-12-09 07:06:44.831234', 0, 472870764, 17, NULL),
(208, '2024-12-09', '2024-12-09 07:06:49.556788', '2024-12-09 07:18:19.239684', 0, 689682896, 14, NULL),
(209, '2024-12-09', '2024-12-09 07:18:24.439626', '2024-12-09 07:41:21.053282', 0, 1376613656, 14, NULL),
(210, '2024-12-09', '2024-12-09 08:39:54.706010', '2024-12-09 10:25:32.276951', 0, 6337570941, 17, NULL),
(211, '2024-12-09', '2024-12-09 10:25:37.353761', '2024-12-09 10:32:46.279664', 0, 428925903, 14, NULL),
(212, '2024-12-09', '2024-12-09 10:32:52.138411', '2024-12-09 10:38:13.759311', 0, 321620900, 14, NULL),
(213, '2024-12-09', '2024-12-09 10:38:20.232906', '2024-12-09 10:57:40.630052', 0, 1160397146, 17, NULL),
(214, '2024-12-09', '2024-12-09 10:57:47.098841', '2024-12-09 11:08:52.682373', 0, 665583532, 14, NULL),
(215, '2024-12-09', '2024-12-09 11:09:00.716657', '2024-12-09 11:17:48.814550', 0, 528097893, 14, NULL),
(216, '2024-12-09', '2024-12-09 11:17:54.804159', '2024-12-09 11:19:13.381223', 0, 78577064, 14, NULL),
(217, '2024-12-09', '2024-12-09 11:19:21.674163', '2024-12-09 11:27:44.510809', 0, 502836646, 17, NULL),
(218, '2024-12-09', '2024-12-09 11:27:51.998607', '2024-12-09 11:39:05.248409', 0, 673249802, 17, NULL),
(219, '2024-12-09', '2024-12-09 11:39:10.291094', '2024-12-09 11:52:01.030172', 0, 770739078, 14, NULL),
(220, '2024-12-09', '2024-12-09 11:52:26.672734', '2024-12-09 12:33:12.466756', 0, 2445794022, 18, NULL),
(221, '2024-12-09', '2024-12-09 12:33:19.554190', '2024-12-09 12:34:21.726097', 0, 62171907, 18, NULL),
(222, '2024-12-09', '2024-12-09 12:34:29.410769', '2024-12-09 12:37:27.719440', 0, 178308671, 14, NULL),
(223, '2024-12-09', '2024-12-09 12:37:34.651065', '2024-12-09 12:51:13.017188', 0, 818366123, 17, NULL),
(224, '2024-12-09', '2024-12-09 12:51:52.941497', '2024-12-09 12:52:52.513353', 0, 59571856, 14, NULL),
(225, '2024-12-09', '2024-12-09 12:54:04.284336', '2024-12-09 12:56:44.050821', 0, 159766485, 14, NULL),
(226, '2024-12-10', '2024-12-10 04:16:25.533885', '2024-12-10 04:31:49.575081', 0, 924041196, 17, NULL),
(227, '2024-12-10', '2024-12-10 04:32:05.299026', '2024-12-10 04:37:12.847559', 0, 307548533, 14, NULL),
(228, '2024-12-10', '2024-12-10 04:37:21.355087', '2024-12-10 04:54:51.629269', 0, 1050274182, 14, NULL),
(229, '2024-12-10', '2024-12-10 04:54:57.698810', '2024-12-10 05:03:36.109184', 0, 518410374, 14, NULL),
(230, '2024-12-10', '2024-12-10 05:03:42.506742', '2024-12-10 05:16:36.613604', 0, 774106862, 14, NULL),
(231, '2024-12-10', '2024-12-10 05:16:41.880374', '2024-12-10 05:17:12.928264', 0, 31047890, 14, NULL),
(232, '2024-12-10', '2024-12-10 05:17:19.715229', '2024-12-10 05:23:55.324096', 0, 395608867, 17, NULL),
(233, '2024-12-10', '2024-12-10 05:24:00.201733', '2024-12-10 05:30:17.312106', 6530713, 370579660, 14, NULL),
(234, '2024-12-10', '2024-12-10 05:30:24.593847', '2024-12-10 05:30:39.370779', 0, 14776932, 17, NULL),
(235, '2024-12-10', '2024-12-10 05:30:46.759935', '2024-12-10 05:33:35.147821', 0, 168387886, 18, NULL),
(236, '2024-12-10', '2024-12-10 05:33:40.054227', '2024-12-10 05:37:51.405012', 0, 251350785, 14, NULL),
(237, '2024-12-10', '2024-12-10 05:37:58.423804', '2024-12-10 05:38:12.691415', 0, 14267611, 17, NULL),
(238, '2024-12-10', '2024-12-10 05:38:19.014338', '2024-12-10 05:38:28.421134', 0, 9406796, 18, NULL),
(239, '2024-12-10', '2024-12-10 05:38:33.681710', '2024-12-10 05:41:50.303921', 0, 196622211, 14, NULL),
(240, '2024-12-10', '2024-12-10 05:41:55.005014', '2024-12-10 06:17:14.822003', 0, 2119816989, 14, NULL),
(241, '2024-12-10', '2024-12-10 06:17:20.033108', '2024-12-10 06:22:29.133314', 0, 309100206, 14, NULL),
(242, '2024-12-10', '2024-12-10 06:22:34.655461', '2024-12-10 06:23:14.709449', 0, 40053988, 14, NULL),
(243, '2024-12-10', '2024-12-10 06:23:21.242470', '2024-12-10 06:24:26.623376', 0, 65380906, 17, NULL),
(244, '2024-12-10', '2024-12-10 06:24:33.487282', '2024-12-10 06:25:33.086407', 0, 59599125, 18, NULL),
(245, '2024-12-10', '2024-12-10 06:25:38.010932', '2024-12-10 06:26:01.701480', 0, 23690548, 14, NULL),
(246, '2024-12-10', '2024-12-10 06:27:39.245236', '2024-12-10 06:34:35.802700', 0, 416557464, 14, NULL),
(247, '2024-12-10', '2024-12-10 06:34:40.909515', '2024-12-10 06:42:23.458030', 0, 462548515, 14, NULL),
(248, '2024-12-10', '2024-12-10 06:42:29.606741', '2024-12-10 06:49:53.992186', 0, 444385445, 14, NULL),
(249, '2024-12-10', '2024-12-10 06:49:59.277354', '2024-12-10 07:01:05.328551', 0, 666051197, 14, NULL),
(250, '2024-12-10', '2024-12-10 07:01:10.147981', '2024-12-10 07:06:21.202714', 0, 311054733, 14, NULL),
(251, '2024-12-10', '2024-12-10 07:06:27.526490', '2024-12-10 07:08:13.139981', 0, 105613491, 14, NULL),
(252, '2024-12-10', '2024-12-10 07:08:18.499588', '2024-12-10 07:24:15.399631', 0, 956900043, 14, NULL),
(253, '2024-12-10', '2024-12-10 07:24:20.594048', '2024-12-10 07:25:51.487060', 0, 90893012, 14, NULL),
(254, '2024-12-10', '2024-12-10 07:25:57.265712', '2024-12-10 07:45:22.908167', 0, 1165642455, 14, NULL),
(255, '2024-12-10', '2024-12-10 07:45:29.448524', '2024-12-10 07:47:36.261117', 0, 126812593, 14, NULL),
(256, '2024-12-10', '2024-12-10 07:47:42.410608', '2024-12-10 08:48:26.475246', 0, 3644064638, 14, NULL),
(257, '2024-12-10', '2024-12-10 08:48:33.104706', '2024-12-10 08:54:50.173727', 0, 377069021, 14, NULL),
(258, '2024-12-10', '2024-12-10 08:54:55.585075', '2024-12-10 08:55:55.303169', 0, 59718094, 14, NULL),
(259, '2024-12-10', '2024-12-10 08:55:59.482186', '2024-12-10 08:58:58.223026', 0, 178740840, 14, NULL),
(260, '2024-12-10', '2024-12-10 08:59:03.851521', '2024-12-10 09:00:42.906324', 0, 99054803, 17, NULL),
(261, '2024-12-10', '2024-12-10 09:04:06.695341', '2024-12-10 10:03:20.387991', 0, 3553692650, 18, NULL),
(262, '2024-12-10', '2024-12-10 10:03:26.501138', NULL, 0, 0, 14, NULL),
(263, '2024-12-10', '2024-12-10 10:03:27.424048', '2024-12-10 10:05:03.873851', 0, 96449803, 14, NULL),
(264, '2024-12-10', '2024-12-10 10:05:10.282567', '2024-12-10 10:06:37.211316', 0, 86928749, 14, NULL),
(265, '2024-12-10', '2024-12-10 10:06:42.441836', '2024-12-10 10:07:15.701017', 0, 33259181, 14, NULL),
(266, '2024-12-10', '2024-12-10 10:07:25.996679', '2024-12-10 10:30:58.723608', 0, 1412726929, 14, NULL),
(267, '2024-12-10', '2024-12-10 10:31:04.045360', '2024-12-10 10:58:31.112017', 0, 1647066657, 14, NULL),
(268, '2024-12-10', '2024-12-10 10:58:44.111849', '2024-12-10 12:28:23.989025', 0, 5379877176, 14, NULL),
(269, '2024-12-10', '2024-12-10 12:28:30.445333', '2024-12-10 13:14:10.526543', 0, 2740081210, 14, NULL),
(270, '2024-12-10', '2024-12-10 13:14:15.457517', '2024-12-10 13:14:52.858509', 0, 37400992, 14, NULL),
(271, '2024-12-10', '2024-12-10 13:19:00.836770', '2024-12-10 13:22:08.221961', 0, 187385191, 17, NULL),
(272, '2024-12-11', '2024-12-11 03:58:52.947996', '2024-12-11 04:53:12.297523', 2152153, 3257197374, 14, NULL),
(273, '2024-12-11', '2024-12-11 04:53:18.908800', '2024-12-11 09:07:01.976413', 0, 15223067613, 14, NULL),
(274, '2024-12-11', '2024-12-11 09:07:07.823554', '2024-12-11 09:21:26.815824', 0, 858992270, 14, NULL),
(275, '2024-12-11', '2024-12-11 09:21:31.672053', '2024-12-11 10:22:15.981014', 0, 3644308961, 14, NULL),
(276, '2024-12-11', '2024-12-11 10:22:28.218823', '2024-12-11 10:31:06.891930', 0, 518673107, 14, NULL),
(277, '2024-12-11', '2024-12-11 10:31:13.263875', '2024-12-11 11:20:34.206162', 0, 2960942287, 14, NULL),
(278, '2024-12-11', '2024-12-11 11:20:38.912599', '2024-12-11 11:25:11.296532', 0, 272383933, 14, NULL),
(279, '2024-12-11', '2024-12-11 11:25:17.694581', '2024-12-11 11:35:32.047014', 0, 614352433, 14, NULL),
(280, '2024-12-11', '2024-12-11 11:35:41.165714', '2024-12-11 11:39:31.911317', 0, 230745603, 14, NULL),
(281, '2024-12-11', '2024-12-11 11:39:37.696287', '2024-12-11 11:43:31.946730', 0, 234250443, 14, NULL),
(282, '2024-12-11', '2024-12-11 11:43:37.232130', NULL, 0, 0, 14, NULL),
(283, '2024-12-12', '2024-12-12 03:49:11.839265', '2024-12-12 04:51:51.839349', 0, 3760000084, 14, NULL),
(284, '2024-12-12', '2024-12-12 04:51:56.989275', '2024-12-12 05:00:20.514032', 0, 503524757, 14, NULL),
(285, '2024-12-12', '2024-12-12 05:00:25.564693', '2024-12-12 05:16:06.595728', 0, 941031035, 14, NULL),
(286, '2024-12-12', '2024-12-12 05:17:44.587548', '2024-12-12 05:19:24.354062', 0, 99766514, 14, NULL),
(287, '2024-12-12', '2024-12-12 05:27:26.959344', '2024-12-12 05:28:20.365744', 0, 53406400, 14, NULL),
(288, '2024-12-12', '2024-12-12 05:28:27.370393', '2024-12-12 05:53:42.943667', 0, 1515573274, 17, NULL),
(289, '2024-12-12', '2024-12-12 05:53:48.849126', '2024-12-12 05:57:37.775476', 0, 228926350, 17, NULL),
(290, '2024-12-12', '2024-12-12 05:57:46.903047', '2024-12-12 06:03:01.031847', 0, 314128800, 14, NULL),
(291, '2024-12-12', '2024-12-12 06:03:06.121191', '2024-12-12 06:04:28.232048', 0, 82110857, 14, NULL),
(292, '2024-12-12', '2024-12-12 06:05:36.541392', '2024-12-12 06:14:38.204283', 0, 541662891, 14, NULL),
(293, '2024-12-12', '2024-12-12 06:14:43.047303', '2024-12-12 06:23:04.144622', 0, 501097319, 14, NULL),
(294, '2024-12-12', '2024-12-12 06:23:10.833398', '2024-12-12 06:30:00.249710', 0, 409416312, 14, NULL),
(295, '2024-12-12', '2024-12-12 06:30:05.470967', '2024-12-12 06:59:03.792354', 0, 1738321387, 14, NULL),
(296, '2024-12-12', '2024-12-12 06:59:10.078929', '2024-12-12 07:06:58.837515', 0, 468758586, 14, NULL),
(297, '2024-12-12', '2024-12-12 07:07:04.484885', '2024-12-12 07:19:32.190264', 0, 747705379, 14, NULL),
(298, '2024-12-12', '2024-12-12 07:19:39.843401', '2024-12-12 10:51:48.767324', 0, 12728923923, 14, NULL),
(299, '2024-12-12', '2024-12-12 10:52:00.216188', '2024-12-12 11:01:39.691639', 0, 579475451, 14, NULL),
(300, '2024-12-12', '2024-12-12 11:02:50.352746', '2024-12-12 11:03:08.320572', 0, 17967826, 17, NULL),
(301, '2024-12-12', '2024-12-12 11:03:14.770759', '2024-12-12 11:32:46.584850', 2016681, 1769797410, 18, NULL),
(302, '2024-12-12', '2024-12-12 11:32:56.253114', '2024-12-12 11:35:27.362904', 0, 151109790, 14, NULL),
(303, '2024-12-12', '2024-12-12 11:35:32.493865', '2024-12-12 11:44:00.720528', 0, 508226663, 14, NULL),
(304, '2024-12-12', '2024-12-12 11:44:06.422605', '2024-12-12 11:52:32.069306', 0, 505646701, 14, NULL),
(305, '2024-12-12', '2024-12-12 11:52:37.653398', '2024-12-12 11:57:17.596832', 0, 279943434, 14, NULL),
(306, '2024-12-12', '2024-12-12 11:57:25.274683', '2024-12-12 12:28:03.292123', 0, 1838017440, 14, NULL),
(307, '2024-12-12', '2024-12-12 12:28:11.415595', '2024-12-12 12:32:43.609095', 0, 272193500, 14, NULL),
(308, '2024-12-12', '2024-12-12 12:32:49.547091', '2024-12-12 12:35:44.147935', 0, 174600844, 14, NULL),
(309, '2024-12-12', '2024-12-12 12:35:50.140391', NULL, 0, 0, 14, NULL),
(310, '2024-12-13', '2024-12-13 04:00:26.966580', '2024-12-13 04:19:21.313733', 0, 1134347153, 14, NULL),
(311, '2024-12-13', '2024-12-13 04:19:26.525483', '2024-12-13 04:21:31.409772', 0, 124884289, 14, NULL),
(312, '2024-12-13', '2024-12-13 04:21:37.758440', '2024-12-13 04:48:46.296235', 0, 1628537795, 14, NULL),
(313, '2024-12-13', '2024-12-13 04:48:53.320298', '2024-12-13 05:04:05.757697', 0, 912437399, 14, NULL),
(314, '2024-12-13', '2024-12-13 05:04:11.178344', '2024-12-13 05:05:26.110108', 0, 74931764, 14, NULL),
(315, '2024-12-13', '2024-12-13 05:05:38.605489', '2024-12-13 05:09:26.319893', 0, 227714404, 14, NULL),
(316, '2024-12-13', '2024-12-13 05:09:33.036610', '2024-12-13 05:15:37.214374', 0, 364177764, 14, NULL),
(317, '2024-12-13', '2024-12-13 05:15:45.056144', '2024-12-13 05:22:23.860546', 0, 398804402, 14, NULL),
(318, '2024-12-13', '2024-12-13 05:22:29.976699', '2024-12-13 05:27:52.122682', 0, 322145983, 14, NULL),
(319, '2024-12-13', '2024-12-13 05:27:56.974199', '2024-12-13 06:10:44.069681', 0, 2567095482, 14, NULL),
(320, '2024-12-13', '2024-12-13 06:10:50.803676', '2024-12-13 06:12:48.811282', 0, 118007606, 14, NULL),
(321, '2024-12-13', '2024-12-13 06:12:55.589424', '2024-12-13 06:38:05.876409', 0, 1510286985, 14, NULL),
(322, '2024-12-13', '2024-12-13 06:38:22.960407', '2024-12-13 06:48:29.587461', 0, 606627054, 14, NULL),
(323, '2024-12-13', '2024-12-13 06:48:36.759638', '2024-12-13 07:30:36.688059', 0, 2519928421, 17, NULL),
(324, '2024-12-13', '2024-12-13 07:30:42.002658', '2024-12-13 08:53:45.455584', 0, 4983452926, 14, NULL),
(325, '2024-12-13', '2024-12-13 08:53:51.123308', '2024-12-13 09:54:47.831769', 0, 3656708461, 14, NULL),
(326, '2024-12-13', '2024-12-13 09:55:07.432893', '2024-12-13 10:12:52.737879', 0, 1065304986, 14, NULL),
(327, '2024-12-13', '2024-12-13 10:13:02.609592', '2024-12-13 10:15:47.124480', 0, 164514888, 14, NULL),
(328, '2024-12-13', '2024-12-13 10:15:54.625206', '2024-12-13 10:17:53.605410', 0, 118980204, 17, NULL),
(329, '2024-12-13', '2024-12-13 10:25:11.525970', '2024-12-13 12:06:30.511059', 0, 6078985089, 14, NULL),
(330, '2024-12-13', '2024-12-13 12:06:36.159789', '2024-12-13 12:49:02.084269', 0, 2545924480, 14, NULL),
(331, '2024-12-17', '2024-12-17 03:53:12.610411', '2024-12-17 03:54:15.675708', 0, 63065297, 14, NULL),
(332, '2024-12-17', '2024-12-17 05:46:22.121525', '2024-12-17 08:58:48.636772', 0, 11546515247, 14, NULL),
(333, '2024-12-17', '2024-12-17 08:58:55.817304', '2024-12-17 12:48:06.300964', 0, 13750483660, 17, NULL),
(334, '2024-12-18', '2024-12-18 04:30:31.800346', '2024-12-18 08:45:04.851044', 0, 15273050698, 14, NULL),
(335, '2024-12-18', '2024-12-18 08:45:12.820393', '2024-12-18 09:48:58.374711', 0, 3825554318, 17, NULL),
(336, '2024-12-18', '2024-12-18 09:49:09.603338', '2024-12-18 10:30:29.391825', 0, 2479788487, 14, NULL),
(337, '2024-12-18', '2024-12-18 09:49:28.613485', '2024-12-18 10:30:46.893367', 0, 2478279882, 17, NULL),
(338, '2024-12-18', '2024-12-18 10:30:36.820474', '2024-12-18 11:03:12.755365', 0, 1955934891, 14, NULL),
(339, '2024-12-18', '2024-12-18 10:30:54.794483', '2024-12-18 11:03:27.002302', 0, 1952207819, 17, NULL),
(340, '2024-12-18', '2024-12-18 11:03:37.655365', '2024-12-18 11:11:20.429605', 0, 462774240, 14, NULL),
(341, '2024-12-18', '2024-12-18 11:03:48.772475', '2024-12-18 11:11:24.469260', 0, 455696785, 17, NULL),
(342, '2024-12-18', '2024-12-18 11:11:29.400416', '2024-12-18 12:22:41.419852', 0, 4272019436, 14, NULL),
(343, '2024-12-18', '2024-12-18 11:11:42.280607', '2024-12-18 12:22:33.222028', 0, 4250941421, 17, NULL),
(344, '2024-12-18', '2024-12-18 12:22:49.088282', NULL, 0, 0, 14, NULL),
(345, '2024-12-18', '2024-12-18 12:23:01.219034', NULL, 0, 0, 17, NULL),
(346, '2024-12-19', '2024-12-19 03:53:55.149734', '2024-12-19 04:40:54.597528', 0, 2819447794, 14, NULL),
(347, '2024-12-19', '2024-12-19 04:41:02.124118', '2024-12-19 05:32:01.989667', 0, 3059865549, 14, NULL),
(348, '2024-12-19', '2024-12-19 04:46:19.258529', '2024-12-19 05:31:45.288913', 2696892610, 29137774, 17, NULL),
(349, '2024-12-19', '2024-12-19 05:31:52.748397', '2024-12-19 05:48:12.139146', 0, 979390749, 17, NULL),
(350, '2024-12-19', '2024-12-19 05:32:08.656451', '2024-12-19 05:48:03.446196', 0, 954789745, 14, NULL),
(351, '2024-12-19', '2024-12-19 05:48:18.680452', '2024-12-19 06:19:19.672099', 0, 1860991647, 14, NULL),
(352, '2024-12-19', '2024-12-19 05:48:28.652735', '2024-12-19 06:45:17.748489', 21872524, 3387223230, 17, NULL),
(353, '2024-12-19', '2024-12-19 06:19:25.554090', '2024-12-19 06:27:52.085497', 0, 506531407, 14, NULL),
(354, '2024-12-19', '2024-12-19 06:27:58.103962', '2024-12-19 06:44:39.412380', 0, 1001308418, 14, NULL),
(355, '2024-12-19', '2024-12-19 06:44:45.178153', '2024-12-19 06:47:42.376758', 0, 177198605, 14, NULL),
(356, '2024-12-19', '2024-12-19 06:45:25.270956', '2024-12-19 06:47:35.562336', 115441983, 14849397, 17, NULL),
(357, '2024-12-19', '2024-12-19 06:57:30.763213', '2024-12-19 07:11:30.732933', 0, 839969720, 14, NULL),
(358, '2024-12-19', '2024-12-19 06:58:22.461744', NULL, 0, 0, 17, NULL),
(359, '2024-12-19', '2024-12-19 07:11:36.440598', '2024-12-19 07:13:17.330908', 0, 100890310, 14, NULL),
(360, '2024-12-19', '2024-12-19 07:13:24.966932', '2024-12-19 09:17:10.369055', 0, 7425402123, 14, NULL),
(361, '2024-12-19', '2024-12-19 09:17:22.090696', '2024-12-19 09:19:08.855037', 0, 106764341, 14, NULL),
(362, '2024-12-19', '2024-12-19 09:19:15.702590', '2024-12-19 12:46:14.462905', 0, 12418760315, 14, NULL),
(363, '2024-12-20', '2024-12-20 03:53:08.420774', '2024-12-20 05:01:30.654142', 0, 4102233368, 14, NULL),
(364, '2024-12-20', '2024-12-20 05:01:36.691570', '2024-12-20 05:05:24.035218', 0, 227343648, 14, NULL),
(365, '2024-12-20', '2024-12-20 05:05:29.768383', '2024-12-20 05:07:16.603837', 0, 106835454, 14, NULL),
(366, '2024-12-20', '2024-12-20 05:06:19.020316', '2024-12-20 05:07:21.977852', 0, 62957536, 17, NULL),
(367, '2024-12-20', '2024-12-20 05:16:39.845501', '2024-12-20 06:50:33.367927', 0, 5633522426, 14, NULL),
(368, '2024-12-20', '2024-12-20 05:17:38.048412', '2024-12-20 06:50:56.718071', 0, 5598669659, 17, NULL),
(369, '2024-12-20', '2024-12-20 06:50:39.478742', '2024-12-20 07:18:19.872665', 0, 1660393923, 14, NULL),
(370, '2024-12-20', '2024-12-20 06:51:11.733511', '2024-12-20 11:28:53.898667', 0, 16662165156, 17, NULL),
(371, '2024-12-20', '2024-12-20 07:18:25.205767', '2024-12-20 07:31:38.187737', 0, 792981970, 14, NULL),
(372, '2024-12-20', '2024-12-20 07:31:45.512434', '2024-12-20 10:58:42.554837', 0, 12417042403, 14, NULL),
(373, '2024-12-20', '2024-12-20 10:58:56.066675', '2024-12-20 11:21:51.724116', 0, 1375657441, 14, NULL),
(374, '2024-12-20', '2024-12-20 11:21:56.787635', '2024-12-20 12:59:05.946630', 0, 5829158995, 14, NULL),
(375, '2024-12-20', '2024-12-20 11:29:05.520559', '2024-12-20 12:59:11.732686', 0, 5406212127, 17, NULL),
(376, '2024-12-23', '2024-12-23 04:23:19.008356', '2024-12-23 08:12:52.739742', 0, 13773731386, 14, NULL),
(377, '2024-12-23', '2024-12-23 08:13:51.008375', '2024-12-23 08:18:40.264456', 0, 289256081, 14, NULL),
(378, '2024-12-23', '2024-12-23 08:18:49.038711', '2024-12-23 08:26:09.379527', 0, 440340816, 14, NULL),
(379, '2024-12-23', '2024-12-23 08:26:15.024662', '2024-12-23 08:30:55.944511', 0, 280919849, 14, NULL),
(380, '2024-12-23', '2024-12-23 08:31:04.694122', '2024-12-23 08:36:13.113409', 0, 308419287, 14, NULL),
(381, '2024-12-23', '2024-12-23 08:36:22.383577', '2024-12-23 08:40:33.545830', 0, 251162253, 14, NULL),
(382, '2024-12-23', '2024-12-23 08:40:39.801059', '2024-12-23 10:15:12.120257', 0, 5672319198, 14, NULL),
(383, '2024-12-23', '2024-12-23 08:57:54.503556', '2024-12-23 10:15:42.551954', 0, 4668048398, 17, NULL),
(384, '2024-12-23', '2024-12-23 10:15:17.532737', '2024-12-23 12:54:14.377715', 0, 9536844978, 14, NULL),
(385, '2024-12-23', '2024-12-23 10:15:49.517025', '2024-12-23 12:54:04.268815', 0, 9494751790, 17, NULL),
(386, '2024-12-24', '2024-12-24 03:27:20.340104', '2024-12-24 03:56:51.831200', 0, 1771491096, 14, NULL),
(387, '2024-12-24', '2024-12-24 03:57:03.392421', '2024-12-24 04:10:23.296436', 0, 799904015, 14, NULL),
(388, '2024-12-24', '2024-12-24 04:10:29.840859', '2024-12-24 04:22:38.616221', 0, 728775362, 14, NULL),
(389, '2024-12-24', '2024-12-24 04:22:44.912755', '2024-12-24 04:42:19.606765', 14706056, 1159987954, 14, NULL),
(390, '2024-12-24', '2024-12-24 04:42:24.885982', '2024-12-24 04:47:55.102948', 0, 330216966, 14, NULL),
(391, '2024-12-24', '2024-12-24 04:48:04.388413', '2024-12-24 05:01:47.341772', 22171726, 800781633, 14, NULL),
(392, '2024-12-24', '2024-12-24 05:01:53.093361', '2024-12-24 05:04:13.767393', 0, 140674032, 14, NULL),
(393, '2024-12-24', '2024-12-24 05:04:18.178637', '2024-12-24 05:08:04.961135', 0, 226782498, 14, NULL),
(394, '2024-12-24', '2024-12-24 05:08:10.549143', '2024-12-24 07:51:37.482584', 15768694, 9791164747, 14, NULL),
(395, '2024-12-24', '2024-12-24 07:51:47.513423', '2024-12-24 12:38:25.514443', 0, 17198001020, 17, NULL),
(396, '2024-12-27', '2024-12-27 03:40:51.461041', '2024-12-27 05:41:13.928305', 5019388, 7217447876, 14, NULL),
(397, '2024-12-27', '2024-12-27 03:58:40.046092', '2024-12-27 04:00:46.304653', 0, 126258561, 17, NULL),
(398, '2024-12-27', '2024-12-27 05:24:14.040764', '2024-12-27 05:41:22.020966', 0, 1027980202, 17, NULL),
(399, '2024-12-27', '2024-12-27 05:41:27.990238', '2024-12-27 06:11:34.204293', 0, 1806214055, 14, NULL),
(400, '2024-12-27', '2024-12-27 05:41:39.236547', '2024-12-27 06:11:41.459277', 0, 1802222730, 17, NULL),
(401, '2024-12-27', '2024-12-27 06:12:14.318670', '2024-12-27 06:19:38.335519', 0, 444016849, 14, NULL),
(402, '2024-12-27', '2024-12-27 06:12:46.054617', '2024-12-27 06:19:44.037971', 0, 417983354, 17, NULL),
(403, '2024-12-27', '2024-12-27 06:32:18.250010', '2024-12-27 11:42:55.317272', 0, 18637067262, 14, NULL),
(404, '2024-12-27', '2024-12-27 06:32:30.822310', '2024-12-27 11:43:01.284148', 0, 18630461838, 17, NULL),
(405, '2024-12-27', '2024-12-27 11:48:20.106995', '2024-12-27 11:54:10.304846', 0, 350197851, 14, NULL),
(406, '2024-12-27', '2024-12-27 11:54:16.683855', '2024-12-27 12:32:44.115050', 0, 2307431195, 17, NULL),
(407, '2024-12-30', '2024-12-30 04:06:09.269550', '2024-12-30 04:35:29.726956', 0, 1760457406, 14, NULL),
(408, '2024-12-30', '2024-12-30 04:35:34.976925', '2024-12-30 04:51:39.039477', 0, 964062552, 14, NULL),
(409, '2024-12-30', '2024-12-30 04:51:44.479384', '2024-12-30 04:59:24.872395', 0, 460393011, 14, NULL),
(410, '2024-12-30', '2024-12-30 04:53:50.823866', '2024-12-30 04:59:30.610377', 0, 339786511, 17, NULL),
(411, '2024-12-30', '2024-12-30 04:59:38.374997', '2024-12-30 05:08:58.120849', 0, 559745852, 17, NULL),
(412, '2024-12-30', '2024-12-30 04:59:47.541718', '2024-12-30 05:08:50.798731', 0, 543257013, 14, NULL),
(413, '2024-12-30', '2024-12-30 05:09:04.465717', '2024-12-30 05:15:16.415930', 0, 371950213, 17, NULL),
(414, '2024-12-30', '2024-12-30 05:09:12.748054', '2024-12-30 05:15:09.665644', 0, 356917590, 14, NULL),
(415, '2024-12-30', '2024-12-30 06:02:50.515722', '2024-12-30 06:31:47.390164', 0, 1736874442, 14, NULL),
(416, '2024-12-30', '2024-12-30 06:03:00.842306', '2024-12-30 06:05:05.155899', 0, 124313593, 17, NULL),
(417, '2024-12-30', '2024-12-30 06:05:21.427684', '2024-12-30 06:05:34.012972', 0, 12585288, 14, NULL),
(418, '2024-12-30', '2024-12-30 06:05:43.039481', '2024-12-30 06:29:11.150624', 0, 1408111143, 17, NULL),
(419, '2024-12-30', '2024-12-30 06:29:17.835700', '2024-12-30 06:31:40.489468', 0, 142653768, 17, NULL),
(420, '2024-12-30', '2024-12-30 06:31:54.397395', '2024-12-30 06:56:47.012173', 0, 1492614778, 17, NULL),
(421, '2024-12-30', '2024-12-30 06:32:00.793367', '2024-12-30 06:53:49.133085', 0, 1308339718, 14, NULL),
(422, '2024-12-30', '2024-12-30 06:53:56.515465', '2024-12-30 07:30:33.026429', 105702994, 2090807970, 14, NULL),
(423, '2024-12-30', '2024-12-30 06:56:55.405244', '2024-12-30 09:13:23.159053', 0, 8187753809, 17, NULL),
(424, '2024-12-30', '2024-12-30 07:30:37.909767', '2024-12-30 09:13:13.492824', 14307925, 6141275132, 14, NULL),
(425, '2024-12-30', '2024-12-30 09:13:30.351579', '2024-12-30 09:40:07.992723', 0, 1597641144, 14, NULL),
(426, '2024-12-30', '2024-12-30 09:40:29.488771', '2024-12-30 09:52:47.309200', 0, 737820429, 14, NULL),
(427, '2024-12-30', '2024-12-30 09:52:52.337723', '2024-12-30 10:32:24.340768', 58348716, 2313654329, 14, NULL),
(428, '2024-12-30', '2024-12-30 10:32:29.519251', '2024-12-30 12:36:14.426226', 17017761, 7407889214, 14, NULL),
(429, '2024-12-31', '2024-12-31 04:03:58.143634', '2024-12-31 09:15:33.397605', 0, 18695253971, 14, NULL),
(430, '2024-12-31', '2024-12-31 09:15:59.412763', '2024-12-31 09:21:25.486377', 0, 326073614, 14, NULL),
(431, '2024-12-31', '2024-12-31 09:49:24.294304', '2024-12-31 09:49:27.879109', 0, 3584805, 14, NULL),
(432, '2024-12-31', '2024-12-31 09:50:17.223882', '2024-12-31 09:50:24.675745', 0, 7451863, 17, NULL),
(433, '2024-12-31', '2024-12-31 10:05:50.679775', '2024-12-31 12:30:57.051045', 5448476, 8700922794, 14, NULL),
(434, '2025-01-03', '2025-01-03 04:28:37.452378', '2025-01-03 05:57:45.187679', 0, 5347735301, 14, NULL),
(435, '2025-01-03', '2025-01-03 05:57:52.165440', '2025-01-03 06:15:40.937469', 7799026, 1060973003, 14, NULL),
(436, '2025-01-03', '2025-01-03 06:15:54.959131', '2025-01-03 06:22:15.038594', 6918050, 373161413, 14, NULL),
(437, '2025-01-03', '2025-01-03 06:22:20.537667', '2025-01-03 06:35:54.744503', 9634523, 804572313, 14, NULL),
(438, '2025-01-03', '2025-01-03 06:36:01.424494', '2025-01-03 06:47:10.044667', 15040199, 653579974, 14, NULL),
(439, '2025-01-03', '2025-01-03 06:47:21.712512', '2025-01-03 07:04:26.156396', 5652232, 1018791652, 14, NULL),
(440, '2025-01-03', '2025-01-03 07:04:31.332844', '2025-01-03 07:05:41.339973', 0, 70007129, 14, NULL),
(441, '2025-01-03', '2025-01-03 07:05:46.330469', '2025-01-03 07:19:07.670204', 8724166, 792615569, 14, NULL),
(442, '2025-01-03', '2025-01-03 07:19:12.848135', '2025-01-03 10:15:55.167545', 6456824, 10595862586, 14, NULL),
(443, '2025-01-03', '2025-01-03 10:16:00.820002', '2025-01-03 12:48:45.286309', 0, 9164466307, 14, NULL),
(444, '2025-01-04', '2025-01-04 05:24:40.418019', '2025-01-04 10:10:39.437431', 0, 17159019412, 14, NULL),
(445, '2025-01-04', '2025-01-04 10:10:45.142470', '2025-01-04 10:21:51.840113', 0, 666697643, 14, NULL),
(446, '2025-01-04', '2025-01-04 10:21:56.703486', '2025-01-04 10:32:02.074783', 0, 605371297, 14, NULL),
(447, '2025-01-04', '2025-01-04 10:32:07.263490', '2025-01-04 12:45:29.484304', 0, 8002220814, 14, NULL),
(448, '2025-01-04', '2025-01-04 13:35:20.213167', '2025-01-04 13:40:32.031954', 0, 311818787, 14, NULL),
(449, '2025-01-04', '2025-01-04 13:39:26.393171', NULL, 0, 0, 17, NULL),
(450, '2025-01-06', '2025-01-06 04:01:51.085691', '2025-01-06 08:39:57.256051', 0, 16686170360, 14, NULL),
(451, '2025-01-06', '2025-01-06 08:40:02.866150', '2025-01-06 09:23:22.257139', 0, 2599390989, 14, NULL),
(452, '2025-01-06', '2025-01-06 09:23:30.686333', '2025-01-06 09:30:47.967648', 0, 437281315, 14, NULL),
(453, '2025-01-06', '2025-01-06 09:30:52.851180', '2025-01-06 10:10:20.988436', 0, 2368137256, 14, NULL),
(454, '2025-01-06', '2025-01-06 10:10:26.403724', '2025-01-06 12:31:59.842194', 0, 8493438470, 14, NULL),
(455, '2025-01-07', '2025-01-07 03:52:32.518679', '2025-01-07 12:41:46.002445', 0, 31753483766, 14, NULL),
(456, '2025-01-08', '2025-01-08 03:53:58.824667', '2025-01-08 06:08:10.474914', 0, 8051650247, 14, NULL),
(457, '2025-01-08', '2025-01-08 06:08:22.554939', '2025-01-08 06:30:28.839512', 0, 1326284573, 14, NULL),
(458, '2025-01-08', '2025-01-08 06:30:33.574775', '2025-01-08 06:33:06.073529', 0, 152498754, 14, NULL),
(459, '2025-01-08', '2025-01-08 06:33:12.623501', '2025-01-08 06:48:13.231112', 0, 900607611, 17, NULL),
(460, '2025-01-08', '2025-01-08 06:48:18.142552', '2025-01-08 06:53:28.388089', 0, 310245537, 14, NULL),
(461, '2025-01-08', '2025-01-08 06:53:33.325998', '2025-01-08 07:37:41.969387', 0, 2648643389, 14, NULL),
(462, '2025-01-08', '2025-01-08 07:37:49.330865', '2025-01-08 08:28:14.300654', 0, 3024969789, 14, NULL),
(463, '2025-01-08', '2025-01-08 08:28:19.682823', '2025-01-08 08:58:49.454660', 0, 1829771837, 14, NULL),
(464, '2025-01-08', '2025-01-08 08:58:58.387977', '2025-01-08 10:37:51.176402', 0, 5932788425, 14, NULL),
(465, '2025-01-08', '2025-01-08 10:37:57.648625', NULL, 0, 0, 14, NULL),
(466, '2025-01-08', '2025-01-08 10:42:01.741643', '2025-01-08 10:42:41.539526', 0, 39797883, 12, NULL),
(467, '2025-01-08', '2025-01-08 10:42:49.038813', '2025-01-08 10:51:46.077675', 0, 537038862, 14, NULL),
(468, '2025-01-08', '2025-01-08 12:17:04.742853', '2025-01-08 12:18:19.280707', 0, 74537854, 12, NULL),
(469, '2025-01-08', '2025-01-08 12:18:24.594439', NULL, 0, 0, 14, NULL),
(470, '2025-01-08', '2025-01-08 12:19:15.635216', '2025-01-08 12:20:12.549510', 0, 56914294, 12, NULL),
(471, '2025-01-08', '2025-01-08 12:20:17.396697', NULL, 0, 0, 14, NULL),
(472, '2025-01-08', '2025-01-08 12:21:00.646791', '2025-01-08 12:23:05.837155', 0, 125190364, 12, NULL),
(473, '2025-01-08', '2025-01-08 12:23:10.307153', '2025-01-08 12:50:33.565305', 0, 1643258152, 14, NULL),
(474, '2025-01-08', '2025-01-08 12:50:38.561698', '2025-01-08 12:56:37.006597', 0, 358444899, 14, NULL),
(475, '2025-01-08', '2025-01-08 12:56:41.599307', '2025-01-08 13:02:50.889249', 0, 369289942, 14, NULL),
(476, '2025-01-08', '2025-01-08 13:03:01.820030', NULL, 0, 0, 14, NULL),
(477, '2025-01-09', '2025-01-09 03:49:13.253952', NULL, 0, 0, 14, NULL),
(478, '2025-01-09', '2025-01-09 03:54:30.819792', '2025-01-09 04:31:23.847459', 0, 2213027667, 12, NULL),
(479, '2025-01-09', '2025-01-09 04:31:34.111156', '2025-01-09 04:39:19.673555', 0, 465562399, 14, NULL),
(480, '2025-01-09', '2025-01-09 04:39:25.129484', '2025-01-09 04:41:52.263082', 0, 147133598, 14, NULL),
(481, '2025-01-09', '2025-01-09 04:41:59.727853', NULL, 0, 0, 14, NULL),
(482, '2025-01-09', '2025-01-09 04:43:52.369264', '2025-01-09 04:44:26.916831', 0, 34547567, 12, NULL),
(483, '2025-01-09', '2025-01-09 04:44:31.459929', NULL, 0, 0, 14, NULL),
(484, '2025-01-09', '2025-01-09 04:46:00.520156', '2025-01-09 04:49:07.052369', 0, 186532213, 12, NULL),
(485, '2025-01-09', '2025-01-09 04:49:12.163683', NULL, 0, 0, 14, NULL),
(486, '2025-01-09', '2025-01-09 04:54:16.691060', '2025-01-09 04:55:44.207572', 0, 87516512, 12, NULL);
INSERT INTO `employee_sessionactivity` (`id`, `date`, `login_time`, `logout_time`, `break_duration`, `work_time`, `user_id`, `break_start_time`) VALUES
(487, '2025-01-09', '2025-01-09 04:55:49.374364', '2025-01-09 05:02:22.177486', 0, 392803122, 14, NULL),
(488, '2025-01-09', '2025-01-09 05:02:28.026600', '2025-01-09 05:03:57.057175', 0, 89030575, 14, NULL),
(489, '2025-01-09', '2025-01-09 05:04:08.293050', NULL, 0, 0, 14, NULL),
(490, '2025-01-09', '2025-01-09 05:06:01.720322', '2025-01-09 05:16:12.256176', 0, 610535854, 12, NULL),
(491, '2025-01-09', '2025-01-09 05:16:19.277405', NULL, 0, 0, 14, NULL),
(492, '2025-01-09', '2025-01-09 05:23:01.554506', '2025-01-09 05:27:12.404816', 0, 250850310, 12, NULL),
(493, '2025-01-09', '2025-01-09 05:27:19.544114', NULL, 0, 0, 17, NULL),
(494, '2025-01-09', '2025-01-09 05:27:58.600149', '2025-01-09 05:31:28.122888', 0, 209522739, 12, NULL),
(495, '2025-01-09', '2025-01-09 05:31:34.255758', '2025-01-09 10:44:32.329213', 0, 18778073455, 17, NULL),
(496, '2025-01-09', '2025-01-09 05:32:11.718136', '2025-01-09 05:41:27.114108', 0, 555395972, 12, NULL),
(497, '2025-01-09', '2025-01-09 05:41:39.489703', NULL, 0, 0, 14, NULL),
(498, '2025-01-09', '2025-01-09 05:43:42.102170', '2025-01-09 05:47:37.748568', 0, 235646398, 12, NULL),
(499, '2025-01-09', '2025-01-09 05:47:41.898155', NULL, 0, 0, 14, NULL),
(500, '2025-01-09', '2025-01-09 05:54:55.259694', '2025-01-09 06:02:30.099827', 0, 454840133, 12, NULL),
(501, '2025-01-09', '2025-01-09 06:02:35.190342', NULL, 0, 0, 14, NULL),
(502, '2025-01-09', '2025-01-09 06:03:37.589381', '2025-01-09 06:04:06.358797', 0, 28769416, 12, NULL),
(503, '2025-01-09', '2025-01-09 06:04:11.632352', '2025-01-09 06:06:51.005311', 0, 159372959, 14, NULL),
(504, '2025-01-09', '2025-01-09 06:06:55.920937', '2025-01-09 06:53:26.749823', 0, 2790828886, 14, NULL),
(505, '2025-01-09', '2025-01-09 06:53:35.213283', NULL, 0, 0, 14, NULL),
(506, '2025-01-09', '2025-01-09 06:54:01.515055', '2025-01-09 06:54:34.322370', 0, 32807315, 12, NULL),
(507, '2025-01-09', '2025-01-09 06:54:39.693515', NULL, 0, 0, 14, NULL),
(508, '2025-01-09', '2025-01-09 06:55:04.775532', '2025-01-09 07:49:56.362371', 0, 3291586839, 12, NULL),
(509, '2025-01-09', '2025-01-09 07:50:01.707150', NULL, 0, 0, 14, NULL),
(510, '2025-01-09', '2025-01-09 10:19:10.011064', '2025-01-09 10:20:06.594724', 0, 56583660, 12, NULL),
(511, '2025-01-09', '2025-01-09 10:20:11.454459', NULL, 22896106, 0, 14, NULL),
(512, '2025-01-09', '2025-01-09 10:44:39.861979', NULL, 38232763, 0, 17, NULL),
(513, '2025-01-10', '2025-01-10 04:29:29.052414', '2025-01-10 10:20:07.488148', 0, 21038435734, 14, NULL),
(514, '2025-01-10', '2025-01-10 10:20:21.147672', '2025-01-10 10:26:36.453854', 4916715, 370389467, 14, NULL),
(515, '2025-01-10', '2025-01-10 10:26:41.138868', NULL, 4898111, 0, 14, NULL),
(516, '2025-01-13', '2025-01-13 04:34:19.918641', '2025-01-13 05:21:59.702253', 0, 2859783612, 14, NULL),
(517, '2025-01-13', '2025-01-13 05:22:05.685798', '2025-01-13 05:44:44.911678', 0, 1359225880, 14, NULL),
(518, '2025-01-13', '2025-01-13 05:44:50.302101', '2025-01-13 06:16:13.390153', 0, 1883088052, 14, NULL),
(519, '2025-01-13', '2025-01-13 06:16:21.196043', '2025-01-13 06:31:01.397123', 0, 880201080, 14, NULL),
(520, '2025-01-13', '2025-01-13 06:31:07.582923', '2025-01-13 06:31:43.973826', 0, 36390903, 14, NULL),
(521, '2025-01-13', '2025-01-13 06:31:48.764723', '2025-01-13 06:56:45.457650', 0, 1496692927, 14, NULL),
(522, '2025-01-13', '2025-01-13 06:56:50.232913', '2025-01-13 07:03:12.366039', 0, 382133126, 14, NULL),
(523, '2025-01-13', '2025-01-13 07:03:17.122158', '2025-01-13 07:10:06.370286', 0, 409248128, 14, NULL),
(524, '2025-01-13', '2025-01-13 07:10:12.041914', '2025-01-13 07:25:13.341443', 0, 901299529, 14, NULL),
(525, '2025-01-13', '2025-01-13 07:25:18.256011', '2025-01-13 08:34:14.647179', 0, 4136391168, 14, NULL),
(526, '2025-01-13', '2025-01-13 08:34:20.504576', '2025-01-13 09:04:39.677873', 0, 1819173297, 14, NULL),
(527, '2025-01-13', '2025-01-13 09:04:48.475317', '2025-01-13 09:07:20.863039', 1505098, 150882624, 14, NULL),
(528, '2025-01-13', '2025-01-13 09:07:25.697468', '2025-01-13 09:18:29.776575', 0, 664079107, 14, NULL),
(529, '2025-01-13', '2025-01-13 09:18:35.237692', '2025-01-13 10:15:48.417971', 0, 3433180279, 14, NULL),
(530, '2025-01-13', '2025-01-13 10:15:54.458051', '2025-01-13 10:26:57.342468', 0, 662884417, 14, NULL),
(531, '2025-01-13', '2025-01-13 10:27:02.434244', '2025-01-13 11:10:56.117378', 0, 2633683134, 14, NULL),
(532, '2025-01-13', '2025-01-13 11:11:00.932201', '2025-01-13 11:28:08.359050', 0, 1027426849, 14, NULL),
(533, '2025-01-13', '2025-01-13 11:28:13.858722', '2025-01-13 11:29:50.325329', 0, 96466607, 14, NULL),
(534, '2025-01-13', '2025-01-13 11:29:57.408001', '2025-01-13 11:33:12.850729', 0, 195442728, 14, NULL),
(535, '2025-01-13', '2025-01-13 11:36:54.450883', '2025-01-13 12:45:52.401379', 0, 4137950496, 14, NULL),
(536, '2025-01-13', '2025-01-13 12:45:58.571071', '2025-01-13 12:47:03.260974', 0, 64689903, 14, NULL),
(537, '2025-01-14', '2025-01-14 04:34:40.884570', '2025-01-14 05:43:56.534906', 0, 4155650336, 14, NULL),
(538, '2025-01-14', '2025-01-14 05:44:03.936473', '2025-01-14 05:45:36.950938', 5916086, 87098379, 14, NULL),
(539, '2025-01-14', '2025-01-14 05:45:42.216802', '2025-01-14 05:48:05.205861', 10717314, 132271745, 14, NULL),
(540, '2025-01-14', '2025-01-14 05:48:11.628559', '2025-01-14 06:11:32.185183', 4885520, 1395671104, 14, NULL),
(541, '2025-01-14', '2025-01-14 06:11:38.784732', '2025-01-14 06:22:08.478217', 16907016, 612786469, 14, NULL),
(542, '2025-01-14', '2025-01-14 06:22:15.415040', '2025-01-14 06:34:13.817011', 10076706, 708325265, 14, NULL),
(543, '2025-01-14', '2025-01-14 06:34:20.670943', '2025-01-14 06:45:48.170380', 5265632, 682233805, 14, NULL),
(544, '2025-01-14', '2025-01-14 06:45:54.222161', '2025-01-14 06:47:53.221226', 0, 118999065, 14, NULL),
(545, '2025-01-14', '2025-01-14 06:47:59.042167', '2025-01-14 06:58:19.003542', 4932361, 615029014, 14, NULL),
(546, '2025-01-14', '2025-01-14 06:58:25.462514', '2025-01-14 07:01:18.657518', 0, 173195004, 14, NULL),
(547, '2025-01-14', '2025-01-14 07:01:23.551030', '2025-01-14 07:06:37.232959', 0, 313681929, 14, NULL),
(548, '2025-01-14', '2025-01-14 07:06:43.051775', '2025-01-14 09:37:37.333848', 0, 9054282073, 14, NULL),
(549, '2025-01-14', '2025-01-14 09:37:43.333314', '2025-01-14 09:47:18.415073', 5703310, 569378449, 14, NULL),
(550, '2025-01-14', '2025-01-14 09:47:25.056528', '2025-01-14 09:57:42.020775', 25785277, 591178970, 14, NULL),
(551, '2025-01-14', '2025-01-14 09:57:48.722174', '2025-01-14 12:44:56.341788', 0, 10027619614, 14, NULL),
(552, '2025-01-15', '2025-01-15 04:49:37.550535', '2025-01-15 05:19:58.065294', 0, 1820514759, 14, NULL),
(553, '2025-01-15', '2025-01-15 05:20:03.927724', '2025-01-15 07:04:41.859297', 213425255, 6064506318, 14, NULL),
(554, '2025-01-15', '2025-01-15 07:04:47.026899', '2025-01-15 08:45:13.156441', 32084707, 5994044835, 14, NULL),
(555, '2025-01-15', '2025-01-15 08:45:18.080357', '2025-01-15 09:04:19.095833', 0, 1141015476, 14, NULL),
(556, '2025-01-15', '2025-01-15 09:04:24.815406', '2025-01-15 09:12:57.241734', 0, 512426328, 14, NULL),
(557, '2025-01-15', '2025-01-15 09:13:02.001783', '2025-01-15 09:16:13.318918', 0, 191317135, 14, NULL),
(558, '2025-01-15', '2025-01-15 09:16:18.169502', '2025-01-15 10:09:51.592296', 785092640, 2428330154, 14, NULL),
(559, '2025-01-15', '2025-01-15 09:24:16.589141', '2025-01-15 10:10:02.647383', 10576606, 2735481636, 17, NULL),
(560, '2025-01-15', '2025-01-15 10:10:09.586298', '2025-01-15 11:24:57.425045', 267688045, 4220150702, 17, NULL),
(561, '2025-01-15', '2025-01-15 10:10:15.781067', '2025-01-15 11:24:49.774808', 0, 4473993741, 14, NULL),
(562, '2025-01-15', '2025-01-15 11:25:04.531405', '2025-01-15 12:35:46.071585', 0, 4241540180, 14, NULL),
(563, '2025-01-16', '2025-01-16 05:52:37.353347', '2025-01-16 06:50:45.856970', 0, 3488503623, 14, NULL),
(564, '2025-01-16', '2025-01-16 06:50:51.214063', '2025-01-16 06:52:21.852897', 0, 90638834, 14, NULL),
(565, '2025-01-16', '2025-01-16 08:03:06.617644', '2025-01-16 08:47:05.173989', 0, 2638556345, 14, NULL),
(566, '2025-01-16', '2025-01-16 08:03:28.668406', '2025-01-16 08:47:12.422002', 0, 2623753596, 17, NULL),
(567, '2025-01-16', '2025-01-16 08:47:18.919275', '2025-01-16 08:49:37.698581', 0, 138779306, 17, NULL),
(568, '2025-01-16', '2025-01-16 08:47:31.396915', '2025-01-16 08:49:42.399609', 0, 131002694, 14, NULL),
(569, '2025-01-16', '2025-01-16 09:07:18.727178', '2025-01-16 09:13:26.913826', 0, 368186648, 14, NULL),
(570, '2025-01-16', '2025-01-16 09:07:33.281619', '2025-01-16 09:13:34.879492', 0, 361597873, 17, NULL),
(571, '2025-01-16', '2025-01-16 09:13:42.466311', '2025-01-16 09:19:39.428782', 0, 356962471, 17, NULL),
(572, '2025-01-16', '2025-01-16 09:13:52.769036', '2025-01-16 09:19:33.602181', 0, 340833145, 14, NULL),
(573, '2025-01-16', '2025-01-16 09:19:44.871033', '2025-01-16 10:04:09.457434', 0, 2664586401, 14, NULL),
(574, '2025-01-16', '2025-01-16 09:19:56.751260', '2025-01-16 10:13:38.131937', 0, 3221380677, 17, NULL),
(575, '2025-01-16', '2025-01-16 10:04:18.381519', '2025-01-16 10:29:54.803146', 0, 1536421627, 14, NULL),
(576, '2025-01-16', '2025-01-16 10:13:52.230198', '2025-01-16 10:18:27.886037', 0, 275655839, 17, NULL),
(577, '2025-01-16', '2025-01-16 10:18:34.317430', '2025-01-16 12:49:13.172722', 0, 9038855292, 17, NULL),
(578, '2025-01-16', '2025-01-16 10:30:03.461017', '2025-01-16 10:30:56.233225', 0, 52772208, 13, NULL),
(579, '2025-01-16', '2025-01-16 11:32:29.482094', '2025-01-16 12:47:22.458312', 0, 4492976218, 14, NULL),
(580, '2025-01-16', '2025-01-16 12:47:27.486030', '2025-01-16 12:49:06.053346', 0, 98567316, 14, NULL),
(581, '2025-01-17', '2025-01-17 03:51:20.174148', NULL, 0, 0, 14, NULL),
(582, '2025-01-21', '2025-01-21 12:45:11.147714', '2025-01-21 12:46:27.967114', 0, 76819400, 14, NULL),
(583, '2025-01-21', '2025-01-21 12:46:33.450561', '2025-01-21 12:50:11.206584', 0, 217756023, 14, NULL),
(584, '2025-01-22', '2025-01-22 03:44:13.018936', '2025-01-22 04:10:58.155294', 0, 1605136358, 14, NULL),
(585, '2025-01-22', '2025-01-22 04:11:03.700692', '2025-01-22 05:25:30.117340', 0, 4466416648, 14, NULL),
(586, '2025-01-22', '2025-01-22 05:00:14.665110', '2025-01-22 05:01:30.355249', 0, 75690139, 17, NULL),
(587, '2025-01-22', '2025-01-22 05:25:35.192632', '2025-01-22 05:33:21.390741', 0, 466198109, 14, NULL),
(588, '2025-01-22', '2025-01-22 05:33:26.335421', '2025-01-22 10:02:35.982803', 0, 16149647382, 14, NULL),
(589, '2025-01-22', '2025-01-22 05:35:40.304771', '2025-01-22 10:48:13.134776', 0, 18752830005, 17, NULL),
(590, '2025-01-22', '2025-01-22 10:02:42.067600', '2025-01-22 10:08:10.339967', 0, 328272367, 14, NULL),
(591, '2025-01-22', '2025-01-22 10:08:15.713138', '2025-01-22 10:24:04.198626', 0, 948485488, 14, NULL),
(592, '2025-01-22', '2025-01-22 10:24:08.952105', '2025-01-22 10:34:48.199533', 0, 639247428, 14, NULL),
(593, '2025-01-22', '2025-01-22 10:34:53.511205', '2025-01-22 12:50:45.812783', 91959810, 8060341768, 14, NULL),
(594, '2025-01-22', '2025-01-22 10:48:20.610903', '2025-01-22 12:50:51.427730', 15356501, 7335460326, 17, NULL),
(595, '2025-01-23', '2025-01-23 04:00:02.377835', '2025-01-23 05:39:03.016121', 8673859, 5931964427, 14, NULL),
(596, '2025-01-23', '2025-01-23 05:39:08.036536', '2025-01-23 05:52:30.980528', 0, 802943992, 14, NULL),
(597, '2025-01-23', '2025-01-23 05:52:35.771482', '2025-01-23 05:58:23.538207', 0, 347766725, 14, NULL),
(598, '2025-01-23', '2025-01-23 05:58:30.180210', '2025-01-23 06:28:42.907325', 0, 1812727115, 14, NULL),
(599, '2025-01-23', '2025-01-23 06:28:47.703296', '2025-01-23 06:34:28.189139', 0, 340485843, 14, NULL),
(600, '2025-01-23', '2025-01-23 06:34:35.572817', '2025-01-23 07:00:38.511710', 0, 1562938893, 14, NULL),
(601, '2025-01-23', '2025-01-23 06:36:30.797813', '2025-01-23 07:00:55.523725', 0, 1464725912, 17, NULL),
(602, '2025-01-23', '2025-01-23 07:00:43.538355', '2025-01-23 11:26:46.660427', 0, 15963122072, 14, NULL),
(603, '2025-01-23', '2025-01-23 07:01:02.498415', '2025-01-23 11:28:57.477426', 0, 16074979011, 17, NULL),
(604, '2025-01-23', '2025-01-23 11:26:51.195968', '2025-01-23 11:56:26.828050', 0, 1775632082, 14, NULL),
(605, '2025-01-23', '2025-01-23 11:29:06.695623', '2025-01-23 12:25:11.273573', 0, 3364577950, 17, NULL),
(606, '2025-01-23', '2025-01-23 11:56:31.537008', '2025-01-23 12:03:38.570233', 0, 427033225, 14, NULL),
(607, '2025-01-23', '2025-01-23 12:03:43.534566', '2025-01-23 12:11:41.307188', 0, 477772622, 14, NULL),
(608, '2025-01-23', '2025-01-23 12:11:46.670881', '2025-01-23 12:14:15.486357', 0, 148815476, 14, NULL),
(609, '2025-01-23', '2025-01-23 12:14:20.770696', '2025-01-23 12:15:18.719701', 0, 57949005, 14, NULL),
(610, '2025-01-23', '2025-01-23 12:15:23.839836', '2025-01-23 12:20:35.541780', 0, 311701944, 14, NULL),
(611, '2025-01-23', '2025-01-23 12:20:43.042752', '2025-01-23 12:26:14.573497', 0, 331530745, 14, NULL),
(612, '2025-01-23', '2025-01-23 12:25:17.336658', '2025-01-23 12:26:09.484358', 0, 52147700, 17, NULL),
(613, '2025-01-23', '2025-01-23 12:26:19.866609', '2025-01-23 12:27:45.788680', 0, 85922071, 14, NULL),
(614, '2025-01-23', '2025-01-23 12:27:56.053294', NULL, 0, 0, 14, NULL),
(615, '2025-01-23', '2025-01-23 12:35:53.523223', NULL, 0, 0, 17, NULL),
(616, '2025-01-24', '2025-01-24 03:55:31.874106', '2025-01-24 04:22:39.845346', 0, 1627971240, 14, NULL),
(617, '2025-01-24', '2025-01-24 03:58:22.734522', '2025-01-24 04:22:46.044847', 0, 1463310325, 17, NULL),
(618, '2025-01-24', '2025-01-24 05:02:22.150603', '2025-01-24 05:39:17.599852', 0, 2215449249, 14, NULL),
(619, '2025-01-24', '2025-01-24 05:41:48.930562', '2025-01-24 06:17:57.525632', 0, 2168595070, 14, NULL),
(620, '2025-01-24', '2025-01-24 06:18:05.549819', '2025-01-24 06:29:16.143994', 0, 670594175, 14, NULL),
(621, '2025-01-24', '2025-01-24 06:29:22.015148', NULL, 0, 0, 14, NULL),
(622, '2025-01-24', '2025-01-24 06:53:02.174030', '2025-01-24 12:38:17.373498', 1623605, 20713575863, 17, NULL),
(623, '2025-01-24', '2025-01-24 07:10:29.412898', '2025-01-24 07:23:19.868508', 0, 770455610, 12, NULL),
(624, '2025-01-24', '2025-01-24 07:23:25.644977', '2025-01-24 12:37:32.551250', 0, 18846906273, 14, NULL),
(625, '2025-01-27', '2025-01-27 04:34:27.650704', '2025-01-27 06:12:03.047964', 0, 5855397260, 14, NULL),
(626, '2025-01-27', '2025-01-27 06:12:07.914308', '2025-01-27 06:47:00.200094', 0, 2092285786, 14, NULL),
(627, '2025-01-27', '2025-01-27 06:13:42.944541', '2025-01-27 06:47:39.440136', 0, 2036495595, 17, NULL),
(628, '2025-01-27', '2025-01-27 06:47:04.905316', '2025-01-27 07:00:27.860121', 0, 802954805, 14, NULL),
(629, '2025-01-27', '2025-01-27 07:00:40.237271', '2025-01-27 07:40:05.874291', 0, 2365637020, 14, NULL),
(630, '2025-01-27', '2025-01-27 07:07:33.648774', '2025-01-27 07:40:17.138500', 0, 1963489726, 17, NULL),
(631, '2025-01-27', '2025-01-27 07:40:22.556554', '2025-01-27 08:32:55.953444', 0, 3153396890, 14, NULL),
(632, '2025-01-27', '2025-01-27 08:33:00.331384', '2025-01-27 08:38:05.654375', 0, 305322991, 14, NULL),
(633, '2025-01-27', '2025-01-27 08:33:43.678893', '2025-01-27 08:38:13.864093', 0, 270185200, 17, NULL),
(634, '2025-01-27', '2025-01-27 08:38:42.765832', NULL, 0, 0, 14, NULL),
(635, '2025-01-27', '2025-01-27 08:41:02.309635', '2025-01-27 08:41:48.759713', 0, 46450078, 14, NULL),
(636, '2025-01-27', '2025-01-27 08:41:53.211685', '2025-01-27 10:51:25.650338', 0, 7772438653, 14, NULL),
(637, '2025-01-27', '2025-01-27 08:43:34.002732', '2025-01-27 10:52:04.067996', 0, 7710065264, 17, NULL),
(638, '2025-01-27', '2025-01-27 10:51:30.309788', '2025-01-27 11:02:08.608216', 0, 638298428, 14, NULL),
(639, '2025-01-27', '2025-01-27 10:52:10.932463', '2025-01-27 10:57:58.067872', 0, 347135409, 17, NULL),
(640, '2025-01-27', '2025-01-27 11:03:07.676150', '2025-01-27 11:29:13.624404', 0, 1565948254, 14, NULL),
(641, '2025-01-27', '2025-01-27 11:29:43.675428', '2025-01-27 11:44:55.294435', 0, 911619007, 14, NULL),
(642, '2025-01-27', '2025-01-27 11:45:29.448974', '2025-01-27 12:06:37.598375', 0, 1268149401, 14, NULL),
(643, '2025-01-27', '2025-01-27 12:07:11.373369', '2025-01-27 13:00:44.315718', 0, 3212942349, 14, NULL),
(644, '2025-01-28', '2025-01-28 03:57:11.409064', '2025-01-28 04:17:04.821593', 0, 1193412529, 14, NULL),
(645, '2025-01-28', '2025-01-28 04:26:06.348276', '2025-01-28 04:43:30.793314', 0, 1044445038, 14, NULL),
(646, '2025-01-28', '2025-01-28 04:43:59.201291', '2025-01-28 04:46:53.525108', 0, 174323817, 14, NULL),
(647, '2025-01-28', '2025-01-28 04:47:00.451173', '2025-01-28 05:38:34.287899', 0, 3093836726, 14, NULL),
(648, '2025-01-28', '2025-01-28 05:39:47.964344', '2025-01-28 05:50:15.210931', 0, 627246587, 14, NULL),
(649, '2025-01-28', '2025-01-28 05:50:20.657013', '2025-01-28 06:34:52.664338', 0, 2672007325, 14, NULL),
(650, '2025-01-28', '2025-01-28 06:49:26.329198', '2025-01-28 06:51:17.098599', 0, 110769401, 14, NULL),
(651, '2025-01-28', '2025-01-28 06:51:38.931756', '2025-01-28 07:12:35.244724', 0, 1256312968, 17, NULL),
(652, '2025-01-28', '2025-01-28 07:12:40.086080', '2025-01-28 07:29:40.204159', 4959370, 1015158709, 14, NULL),
(653, '2025-01-28', '2025-01-28 07:29:45.890420', '2025-01-28 08:24:15.971128', 0, 3270080708, 14, NULL),
(654, '2025-01-28', '2025-01-28 09:07:08.225818', '2025-01-28 09:08:39.463008', 0, 91237190, 14, NULL),
(655, '2025-01-28', '2025-01-28 09:08:54.531291', '2025-01-28 09:10:30.341401', 0, 95810110, 13, NULL),
(656, '2025-01-28', '2025-01-28 09:10:36.534044', '2025-01-28 10:17:46.977788', 0, 4030443744, 14, NULL),
(657, '2025-01-28', '2025-01-28 10:17:57.726575', '2025-01-28 10:28:54.616328', 0, 656889753, 14, NULL),
(658, '2025-01-28', '2025-01-28 10:29:01.436615', '2025-01-28 10:47:28.068516', 0, 1106631901, 14, NULL),
(659, '2025-01-28', '2025-01-28 10:29:56.583406', '2025-01-28 10:48:00.927093', 0, 1084343687, 15, NULL),
(660, '2025-01-28', '2025-01-28 10:48:06.902094', '2025-01-28 10:49:32.449403', 0, 85547309, 14, NULL),
(661, '2025-01-28', '2025-01-28 10:48:20.197762', '2025-01-28 10:49:37.593309', 0, 77395547, 15, NULL),
(662, '2025-01-28', '2025-01-28 11:00:53.929697', '2025-01-28 11:15:24.562492', 0, 870632795, 14, NULL),
(663, '2025-01-28', '2025-01-28 11:01:40.888656', '2025-01-28 11:15:53.998077', 0, 853109421, 15, NULL),
(664, '2025-01-28', '2025-01-28 11:16:02.336374', '2025-01-28 11:39:51.631925', 0, 1429295551, 14, NULL),
(665, '2025-01-28', '2025-01-28 11:16:14.361542', '2025-01-28 11:43:46.113611', 0, 1651752069, 15, NULL),
(666, '2025-01-28', '2025-01-28 11:39:59.541947', '2025-01-28 11:54:22.616317', 0, 863074370, 14, NULL),
(667, '2025-01-28', '2025-01-28 11:44:33.211023', '2025-01-28 11:49:31.243598', 0, 298032575, 15, NULL),
(668, '2025-01-28', '2025-01-28 11:55:24.843704', '2025-01-28 11:55:30.365297', 0, 5521593, 14, NULL),
(669, '2025-01-29', '2025-01-29 03:50:04.802795', '2025-01-29 05:01:15.761236', 0, 4270958441, 14, NULL),
(670, '2025-01-29', '2025-01-29 05:02:21.104967', '2025-01-29 05:32:20.648701', 0, 1799543734, 14, NULL),
(671, '2025-01-29', '2025-01-29 05:32:26.234971', '2025-01-29 06:02:47.405104', 0, 1821170133, 14, NULL),
(672, '2025-01-29', '2025-01-29 06:02:52.460666', '2025-01-29 06:25:02.268226', 0, 1329807560, 14, NULL),
(673, '2025-01-29', '2025-01-29 06:25:07.390503', '2025-01-29 06:40:31.504073', 0, 924113570, 14, NULL),
(674, '2025-01-29', '2025-01-29 06:40:36.569264', '2025-01-29 07:14:26.223021', 0, 2029653757, 14, NULL),
(675, '2025-01-29', '2025-01-29 06:44:25.245747', '2025-01-29 07:15:46.079620', 0, 1880833873, 17, NULL),
(676, '2025-01-29', '2025-01-29 07:14:30.645883', '2025-01-29 07:43:10.248433', 0, 1719602550, 14, NULL),
(677, '2025-01-29', '2025-01-29 07:15:55.127979', '2025-01-29 07:44:10.571221', 0, 1695443242, 17, NULL),
(678, '2025-01-29', '2025-01-29 07:43:16.676722', '2025-01-29 07:52:38.425872', 0, 561749150, 14, NULL),
(679, '2025-01-29', '2025-01-29 07:44:17.597634', '2025-01-29 07:52:44.392112', 0, 506794478, 17, NULL),
(680, '2025-01-29', '2025-01-29 07:52:51.321033', '2025-01-29 09:04:24.827435', 0, 4293506402, 14, NULL),
(681, '2025-01-29', '2025-01-29 07:53:06.991147', '2025-01-29 09:04:47.278677', 0, 4300287530, 17, NULL),
(682, '2025-01-29', '2025-01-29 09:04:29.442456', '2025-01-29 09:42:36.208346', 0, 2286765890, 14, NULL),
(683, '2025-01-29', '2025-01-29 09:04:53.390155', '2025-01-29 09:37:58.607126', 0, 1985216971, 17, NULL),
(684, '2025-01-29', '2025-01-29 09:38:09.984373', '2025-01-29 12:40:35.349850', 0, 10945365477, 17, NULL),
(685, '2025-01-29', '2025-01-29 09:42:40.807253', '2025-01-29 12:40:55.157259', 0, 10694350006, 14, NULL),
(686, '2025-01-30', '2025-01-30 03:51:25.278686', '2025-01-30 05:14:11.467287', 0, 4966188601, 14, NULL),
(687, '2025-01-30', '2025-01-30 05:14:17.319050', '2025-01-30 06:31:26.985273', 0, 4629666223, 14, NULL),
(688, '2025-01-30', '2025-01-30 06:31:35.901093', '2025-01-30 06:51:03.203471', 0, 1167302378, 14, NULL),
(689, '2025-01-30', '2025-01-30 06:51:09.643099', '2025-01-30 07:15:30.617000', 0, 1460973901, 14, NULL),
(690, '2025-01-30', '2025-01-30 07:15:35.716104', '2025-01-30 07:32:00.675116', 0, 984959012, 14, NULL),
(691, '2025-01-30', '2025-01-30 07:32:09.176743', '2025-01-30 07:53:09.902443', 0, 1260725700, 14, NULL),
(692, '2025-01-30', '2025-01-30 07:53:15.284900', '2025-01-30 08:55:48.142148', 0, 3752857248, 14, NULL),
(693, '2025-01-30', '2025-01-30 08:55:59.258988', '2025-01-30 09:10:26.354863', 0, 867095875, 14, NULL),
(694, '2025-01-30', '2025-01-30 09:07:53.952552', '2025-01-30 10:36:02.934800', 0, 5288982248, 17, NULL),
(695, '2025-01-30', '2025-01-30 09:10:31.346490', '2025-01-30 10:35:54.880207', 0, 5123533717, 14, NULL),
(696, '2025-01-30', '2025-01-30 10:36:10.845011', '2025-01-30 12:25:23.191085', 0, 6552346074, 14, NULL),
(697, '2025-01-30', '2025-01-30 10:36:32.542201', '2025-01-30 12:24:43.250006', 0, 6490707805, 17, NULL),
(698, '2025-01-31', '2025-01-31 05:01:42.754613', '2025-01-31 05:35:16.797755', 0, 2014043142, 14, NULL),
(699, '2025-01-31', '2025-01-31 05:36:09.028930', '2025-01-31 05:37:32.594516', 0, 83565586, 14, NULL),
(700, '2025-01-31', '2025-01-31 05:37:36.935542', '2025-01-31 06:17:25.183995', 0, 2388248453, 14, NULL),
(701, '2025-01-31', '2025-01-31 05:41:43.081529', '2025-01-31 06:17:51.509296', 0, 2168427767, 17, NULL),
(702, '2025-01-31', '2025-01-31 06:17:34.979548', '2025-01-31 06:19:51.394672', 0, 136415124, 14, NULL),
(703, '2025-01-31', '2025-01-31 06:17:57.419528', '2025-01-31 06:18:04.269261', 0, 6849733, 14, NULL),
(704, '2025-01-31', '2025-01-31 06:18:10.514049', '2025-01-31 06:45:00.359980', 0, 1609845931, 17, NULL),
(705, '2025-01-31', '2025-01-31 06:19:56.793947', '2025-01-31 06:44:53.522370', 0, 1496728423, 14, NULL),
(706, '2025-01-31', '2025-01-31 06:45:20.986484', '2025-01-31 06:55:34.662443', 0, 613675959, 14, NULL),
(707, '2025-01-31', '2025-01-31 06:46:29.835795', '2025-01-31 06:55:40.896001', 0, 551060206, 17, NULL),
(708, '2025-01-31', '2025-01-31 06:59:21.603843', '2025-01-31 07:03:01.043460', 0, 219439617, 14, NULL),
(709, '2025-01-31', '2025-01-31 06:59:38.516169', '2025-01-31 07:03:05.675621', 0, 207159452, 17, NULL),
(710, '2025-01-31', '2025-01-31 07:05:56.985541', '2025-01-31 07:36:52.745977', 0, 1855760436, 14, NULL),
(711, '2025-01-31', '2025-01-31 07:06:22.297551', '2025-01-31 07:37:05.903751', 0, 1843606200, 17, NULL),
(712, '2025-01-31', '2025-01-31 08:20:07.052706', '2025-01-31 12:53:13.226489', 0, 16386173783, 14, NULL),
(713, '2025-01-31', '2025-01-31 08:20:26.462398', '2025-01-31 09:13:13.946357', 0, 3167483959, 17, NULL),
(714, '2025-02-03', '2025-02-03 04:09:27.397569', '2025-02-03 04:10:38.277154', 0, 70879585, 14, NULL),
(715, '2025-02-03', '2025-02-03 04:10:50.026955', '2025-02-03 04:12:42.920381', 0, 112893426, 14, NULL),
(716, '2025-02-03', '2025-02-03 04:17:22.537223', '2025-02-03 06:32:44.832629', 0, 8122295406, 14, NULL),
(717, '2025-02-03', '2025-02-03 06:43:21.200835', '2025-02-03 06:50:01.873312', 0, 400672477, 14, NULL),
(718, '2025-02-03', '2025-02-03 06:50:08.577827', '2025-02-03 06:54:00.777334', 0, 232199507, 14, NULL),
(719, '2025-02-03', '2025-02-03 06:54:05.705280', '2025-02-03 12:33:04.275352', 0, 20338570072, 14, NULL),
(720, '2025-02-03', '2025-02-03 06:57:51.302005', '2025-02-03 12:33:12.407027', 0, 20121105022, 17, NULL),
(721, '2025-02-03', '2025-02-03 12:33:26.063139', '2025-02-03 12:46:29.221323', 0, 783158184, 14, NULL),
(722, '2025-02-03', '2025-02-03 12:37:17.225002', '2025-02-03 12:46:32.303625', 0, 555078623, 17, NULL),
(723, '2025-02-04', '2025-02-04 03:49:09.206538', '2025-02-04 04:09:59.790011', 0, 1250583473, 14, NULL),
(724, '2025-02-04', '2025-02-04 03:49:52.328773', '2025-02-04 04:09:52.811556', 0, 1200482783, 17, NULL),
(725, '2025-02-04', '2025-02-04 04:18:46.246388', '2025-02-04 04:38:04.010701', 0, 1157764313, 14, NULL),
(726, '2025-02-04', '2025-02-04 04:44:02.892762', '2025-02-04 05:17:30.444691', 0, 2007551929, 14, NULL),
(727, '2025-02-04', '2025-02-04 04:44:48.365072', '2025-02-04 05:17:45.288091', 0, 1976923019, 17, NULL),
(728, '2025-02-04', '2025-02-04 05:17:35.860031', '2025-02-04 05:19:05.401402', 0, 89541371, 14, NULL),
(729, '2025-02-04', '2025-02-04 05:17:51.572083', '2025-02-04 05:20:09.819084', 0, 138247001, 17, NULL),
(730, '2025-02-04', '2025-02-04 05:19:10.911371', '2025-02-04 05:20:25.162205', 0, 74250834, 14, NULL),
(731, '2025-02-04', '2025-02-04 05:20:17.400147', '2025-02-04 05:21:55.430190', 0, 98030043, 17, NULL),
(732, '2025-02-04', '2025-02-04 05:20:31.678581', '2025-02-04 05:21:51.609588', 0, 79931007, 14, NULL),
(733, '2025-02-04', '2025-02-04 05:22:38.925587', '2025-02-04 05:33:55.646701', 0, 676721114, 17, NULL),
(734, '2025-02-04', '2025-02-04 05:22:50.459673', '2025-02-04 05:33:49.336278', 0, 658876605, 14, NULL),
(735, '2025-02-04', '2025-02-04 05:34:01.456059', '2025-02-04 06:06:01.641481', 0, 1920185422, 14, NULL),
(736, '2025-02-04', '2025-02-04 05:35:08.435278', '2025-02-04 07:04:18.246948', 0, 5349811670, 17, NULL),
(737, '2025-02-04', '2025-02-04 06:06:06.822935', '2025-02-04 07:04:22.897852', 0, 3496074917, 14, NULL),
(738, '2025-02-04', '2025-02-04 07:04:28.777301', '2025-02-04 07:29:18.041510', 0, 1489264209, 14, NULL),
(739, '2025-02-04', '2025-02-04 07:04:41.826847', '2025-02-04 07:29:11.558990', 0, 1469732143, 17, NULL),
(740, '2025-02-04', '2025-02-04 08:24:03.989922', '2025-02-04 08:40:07.137764', 0, 963147842, 14, NULL),
(741, '2025-02-04', '2025-02-04 08:24:25.515916', '2025-02-04 08:40:14.300845', 0, 948784929, 17, NULL),
(742, '2025-02-04', '2025-02-04 08:46:10.619955', NULL, 0, 0, 14, NULL),
(743, '2025-02-04', '2025-02-04 09:17:29.710883', '2025-02-04 09:17:52.699687', 0, 22988804, 18, NULL),
(744, '2025-02-04', '2025-02-04 09:18:13.699986', '2025-02-04 09:19:40.160263', 0, 86460277, 18, NULL),
(745, '2025-02-04', '2025-02-04 09:20:15.100682', '2025-02-04 12:36:22.800728', 0, 11767700046, 18, NULL),
(746, '2025-02-05', '2025-02-05 03:55:15.276779', NULL, 0, 0, 17, NULL),
(747, '2025-02-05', '2025-02-05 04:29:31.763863', '2025-02-05 04:29:42.789975', 0, 11026112, 14, NULL),
(748, '2025-02-05', '2025-02-05 04:29:54.321407', '2025-02-05 04:29:59.158683', 0, 4837276, 14, NULL),
(749, '2025-02-05', '2025-02-05 04:30:11.930023', '2025-02-05 04:30:21.953895', 0, 10023872, 14, NULL),
(750, '2025-02-05', '2025-02-05 04:30:37.076574', '2025-02-05 04:30:44.875609', 0, 7799035, 14, NULL),
(751, '2025-02-05', '2025-02-05 04:31:04.976674', '2025-02-05 04:31:10.213262', 0, 5236588, 18, NULL),
(752, '2025-02-05', '2025-02-05 04:51:17.152782', '2025-02-05 04:51:23.132140', 0, 5979358, 18, NULL),
(753, '2025-02-05', '2025-02-05 04:53:12.364133', '2025-02-05 04:53:17.995675', 0, 5631542, 18, NULL),
(754, '2025-02-05', '2025-02-05 04:59:03.424337', '2025-02-05 04:59:17.927856', 0, 14503519, 15, NULL),
(755, '2025-02-05', '2025-02-05 05:02:51.688128', '2025-02-05 05:02:54.912153', 0, 3224025, 15, NULL),
(756, '2025-02-05', '2025-02-05 05:03:19.709864', '2025-02-05 05:03:25.075980', 0, 5366116, 18, NULL),
(757, '2025-02-05', '2025-02-05 05:05:22.258395', '2025-02-05 05:05:24.545687', 0, 2287292, 18, NULL),
(758, '2025-02-05', '2025-02-05 05:05:32.579777', '2025-02-05 05:05:38.160688', 0, 5580911, 18, NULL),
(759, '2025-02-05', '2025-02-05 05:29:30.968304', '2025-02-05 05:29:37.921338', 0, 6953034, 14, NULL),
(760, '2025-02-05', '2025-02-05 05:29:52.144792', '2025-02-05 05:31:47.451153', 0, 115306361, 13, NULL),
(761, '2025-02-05', '2025-02-05 05:48:50.702659', '2025-02-05 06:22:15.588994', 0, 2004886335, 13, NULL),
(762, '2025-02-05', '2025-02-05 06:07:54.114237', '2025-02-05 06:23:07.621388', 0, 913507151, 12, NULL),
(763, '2025-02-05', '2025-02-05 06:22:38.836689', '2025-02-05 06:28:12.835252', 0, 333998563, 16, NULL),
(764, '2025-02-05', '2025-02-05 06:23:29.388113', '2025-02-05 07:29:22.756002', 0, 3953367889, 14, NULL),
(765, '2025-02-05', '2025-02-05 07:29:39.139487', NULL, 0, 0, 17, NULL),
(766, '2025-02-05', '2025-02-05 09:08:37.390143', '2025-02-05 09:25:40.734046', 0, 1023343903, 18, NULL),
(767, '2025-02-05', '2025-02-05 10:38:07.816667', '2025-02-05 10:38:10.364176', 0, 2547509, 12, NULL),
(768, '2025-02-05', '2025-02-05 10:42:03.868208', NULL, 0, 0, 14, NULL),
(769, '2025-02-05', '2025-02-05 11:20:15.741817', '2025-02-05 11:20:18.004662', 0, 2262845, 12, NULL),
(770, '2025-02-05', '2025-02-05 11:20:24.084279', NULL, 0, 0, 14, NULL),
(771, '2025-02-05', '2025-02-05 11:34:53.043990', '2025-02-05 11:34:55.212968', 0, 2168978, 12, NULL),
(772, '2025-02-05', '2025-02-05 11:43:37.836492', NULL, 0, 0, 14, NULL),
(773, '2025-02-05', '2025-02-05 12:24:16.635216', '2025-02-05 12:24:19.543251', 0, 2908035, 12, NULL),
(774, '2025-02-05', '2025-02-05 12:24:25.108530', NULL, 0, 0, 14, NULL),
(775, '2025-02-05', '2025-02-05 12:32:37.121243', '2025-02-05 12:32:38.819963', 0, 1698720, 12, NULL),
(776, '2025-02-06', '2025-02-06 03:44:56.223606', NULL, 3803275, 0, 14, NULL),
(777, '2025-02-06', '2025-02-06 05:23:56.158977', '2025-02-06 05:23:57.894942', 0, 1735965, 12, NULL),
(778, '2025-02-06', '2025-02-06 05:40:46.812450', NULL, 43282672, 0, 14, NULL),
(779, '2025-02-06', '2025-02-06 05:41:20.052140', NULL, 20272889, 0, 17, NULL),
(780, '2025-02-06', '2025-02-06 05:57:56.255814', '2025-02-06 05:58:39.379341', 0, 43123527, 15, '2025-02-06 05:58:10.252278'),
(781, '2025-02-06', '2025-02-06 06:43:21.707642', '2025-02-06 06:43:23.954179', 0, 2246537, 12, NULL),
(782, '2025-02-06', '2025-02-06 06:43:43.939195', '2025-02-06 06:43:45.938531', 0, 1999336, 12, NULL),
(783, '2025-02-06', '2025-02-06 08:12:51.496358', NULL, 38121794, 0, 14, NULL),
(784, '2025-02-06', '2025-02-06 08:13:11.249766', NULL, 0, 0, 17, NULL),
(785, '2025-02-06', '2025-02-06 08:28:27.178449', '2025-02-06 08:28:29.250803', 0, 2072354, 12, NULL),
(786, '2025-02-06', '2025-02-06 08:28:44.741472', '2025-02-06 08:28:47.072468', 0, 2330996, 12, NULL),
(787, '2025-02-06', '2025-02-06 08:28:53.969220', NULL, 14289936, 0, 17, NULL),
(788, '2025-02-06', '2025-02-06 08:29:01.993397', NULL, 9731037, 0, 14, NULL),
(789, '2025-02-06', '2025-02-06 08:51:33.445177', '2025-02-06 08:51:35.708717', 0, 2263540, 12, NULL),
(790, '2025-02-06', '2025-02-06 08:51:56.212286', '2025-02-06 08:51:58.220873', 0, 2008587, 12, NULL),
(791, '2025-02-06', '2025-02-06 08:52:06.910458', NULL, 1399503, 0, 14, NULL),
(792, '2025-02-06', '2025-02-06 08:52:18.186515', '2025-02-06 08:52:43.723816', 7101582, 18435719, 15, NULL),
(793, '2025-02-06', '2025-02-06 08:53:14.387393', NULL, 12184925, 0, 17, NULL),
(794, '2025-02-06', '2025-02-06 12:43:39.317237', '2025-02-06 12:43:43.159054', 0, 3841817, 12, NULL),
(795, '2025-02-06', '2025-02-06 12:44:24.063867', '2025-02-06 12:44:26.041630', 0, 1977763, 12, NULL),
(796, '2025-02-07', '2025-02-07 04:28:51.729211', NULL, 51737350, 0, 14, NULL),
(797, '2025-02-07', '2025-02-07 04:30:10.828756', NULL, 4463513, 0, 17, NULL),
(798, '2025-02-07', '2025-02-07 07:03:07.352096', '2025-02-07 07:03:10.334205', 0, 2982109, 12, NULL),
(799, '2025-02-07', '2025-02-07 07:03:25.157309', '2025-02-07 07:03:27.496408', 0, 2339099, 12, NULL),
(800, '2025-02-07', '2025-02-07 07:03:33.921844', NULL, 0, 0, 14, NULL),
(801, '2025-02-07', '2025-02-07 08:44:45.373232', '2025-02-07 08:44:48.891925', 0, 3518693, 12, NULL),
(802, '2025-02-07', '2025-02-07 08:44:55.402796', NULL, 0, 0, 14, NULL),
(803, '2025-02-07', '2025-02-07 08:47:28.769255', NULL, 0, 0, 17, NULL),
(804, '2025-02-07', '2025-02-07 08:54:30.621920', '2025-02-07 08:54:32.059296', 0, 1437376, 12, NULL),
(805, '2025-02-07', '2025-02-07 08:54:52.203136', '2025-02-07 09:00:53.476725', 0, 361273589, 16, NULL),
(806, '2025-02-07', '2025-02-07 09:58:34.936440', NULL, 0, 0, 14, NULL),
(807, '2025-02-07', '2025-02-07 09:58:57.185286', '2025-02-07 09:58:59.052595', 0, 1867309, 12, NULL),
(808, '2025-02-07', '2025-02-07 09:59:13.612124', '2025-02-07 09:59:14.896184', 0, 1284060, 12, NULL),
(809, '2025-02-10', '2025-02-10 03:53:57.004927', NULL, 0, 0, 14, NULL),
(810, '2025-02-10', '2025-02-10 05:28:57.206965', '2025-02-10 05:28:59.483122', 0, 2276157, 12, NULL),
(811, '2025-02-10', '2025-02-10 05:29:06.520667', NULL, 0, 0, 14, NULL),
(812, '2025-02-10', '2025-02-10 05:38:35.899544', '2025-02-10 05:42:05.058675', 26665261, 182493870, 15, NULL),
(813, '2025-02-10', '2025-02-10 05:42:13.005949', NULL, 0, 0, 17, NULL),
(814, '2025-02-10', '2025-02-10 05:48:24.434723', '2025-02-10 05:48:27.290159', 0, 2855436, 12, NULL),
(815, '2025-02-10', '2025-02-10 05:49:13.219068', NULL, 0, 0, 17, NULL),
(816, '2025-02-10', '2025-02-10 06:07:31.536901', '2025-02-10 06:07:40.538233', 0, 9001332, 12, NULL),
(817, '2025-02-10', '2025-02-10 06:07:45.499241', NULL, 0, 0, 14, NULL),
(818, '2025-02-11', '2025-02-11 06:35:10.592117', '2025-02-11 06:35:12.720835', 0, 2128718, 12, NULL),
(819, '2025-02-11', '2025-02-11 06:35:22.348618', NULL, 0, 0, 14, NULL),
(820, '2025-02-11', '2025-02-11 06:39:48.572226', '2025-02-11 06:39:50.585259', 0, 2013033, 12, NULL),
(821, '2025-02-11', '2025-02-11 07:14:19.832887', NULL, 0, 0, 14, NULL),
(822, '2025-02-11', '2025-02-11 07:47:42.888967', '2025-02-11 07:47:49.770253', 0, 6881286, 12, NULL),
(823, '2025-02-11', '2025-02-11 07:48:06.069985', '2025-02-11 07:53:32.775343', 0, 326705358, 15, NULL),
(824, '2025-02-11', '2025-02-11 07:53:44.222059', NULL, 0, 0, 17, NULL),
(825, '2025-02-11', '2025-02-11 11:28:43.621874', '2025-02-11 11:28:46.006119', 0, 2384245, 12, NULL),
(826, '2025-02-11', '2025-02-11 11:28:54.586758', '2025-02-11 11:42:06.818178', 0, 792231420, 15, NULL),
(827, '2025-02-11', '2025-02-11 11:42:15.765884', NULL, 0, 0, 17, NULL),
(828, '2025-02-12', '2025-02-12 03:53:46.090833', '2025-02-12 03:53:48.967616', 0, 2876783, 12, NULL),
(829, '2025-02-12', '2025-02-12 03:54:06.589228', '2025-02-12 03:56:13.661178', 0, 127071950, 18, NULL),
(830, '2025-02-12', '2025-02-12 04:00:12.589232', '2025-02-12 09:02:14.113421', 0, 18121524189, 18, NULL),
(831, '2025-02-12', '2025-02-12 09:02:31.657721', NULL, 0, 0, 17, NULL),
(832, '2025-02-12', '2025-02-12 11:58:21.427000', '2025-02-12 11:58:24.075246', 0, 2648246, 12, NULL),
(833, '2025-02-12', '2025-02-12 11:58:32.953903', '2025-02-12 11:59:16.139096', 0, 43185193, 18, NULL),
(834, '2025-02-12', '2025-02-12 11:59:26.047378', '2025-02-12 12:57:28.820385', 0, 3482773007, 18, NULL),
(835, '2025-02-13', '2025-02-13 04:01:51.012526', NULL, 0, 0, 17, NULL),
(836, '2025-02-13', '2025-02-13 09:11:45.109431', '2025-02-13 09:11:48.147584', 0, 3038153, 12, NULL),
(837, '2025-02-13', '2025-02-13 09:11:57.513836', '2025-02-13 09:14:35.405917', 0, 157892081, 18, NULL),
(838, '2025-02-13', '2025-02-13 09:19:54.108188', '2025-02-13 09:39:40.753988', 0, 1186645800, 18, NULL),
(839, '2025-02-13', '2025-02-13 09:47:02.113538', '2025-02-13 09:47:07.219645', 0, 5106107, 15, NULL),
(840, '2025-02-13', '2025-02-13 09:47:43.646804', '2025-02-13 09:47:48.712950', 0, 5066146, 15, NULL),
(841, '2025-02-13', '2025-02-13 10:36:20.226257', NULL, 0, 0, 18, NULL),
(842, '2025-02-14', '2025-02-14 05:18:37.064967', NULL, 0, 0, 14, NULL),
(843, '2025-02-14', '2025-02-14 05:21:08.828231', NULL, 0, 0, 17, NULL),
(844, '2025-02-14', '2025-02-14 05:42:06.829904', NULL, 0, 0, 14, NULL),
(845, '2025-02-14', '2025-02-14 06:43:59.212844', '2025-02-14 06:44:04.204311', 0, 4991467, 12, NULL),
(846, '2025-02-14', '2025-02-14 06:44:12.017579', '2025-02-14 07:41:26.773907', 0, 3434756328, 18, NULL),
(847, '2025-02-17', '2025-02-17 05:18:49.487354', '2025-02-17 05:18:59.470243', 0, 9982889, 15, NULL),
(848, '2025-02-17', '2025-02-17 05:20:35.749348', '2025-02-17 05:20:57.166531', 0, 21417183, 18, NULL),
(849, '2025-02-17', '2025-02-17 05:22:06.361344', NULL, 0, 0, 15, NULL),
(850, '2025-02-18', '2025-02-18 08:57:11.801320', '2025-02-18 12:46:55.536531', 0, 13783735211, 18, NULL),
(851, '2025-02-19', '2025-02-19 09:48:20.812240', '2025-02-19 09:48:52.532787', 0, 31720547, 12, NULL),
(852, '2025-02-19', '2025-02-19 09:48:36.783760', NULL, 0, 0, 17, NULL),
(853, '2025-02-19', '2025-02-19 09:49:09.913759', NULL, 0, 0, 14, NULL),
(854, '2025-02-19', '2025-02-19 11:10:22.398522', '2025-02-19 11:10:26.212606', 0, 3814084, 12, NULL),
(855, '2025-02-19', '2025-02-19 11:10:33.135983', '2025-02-19 11:13:00.791272', 0, 147655289, 18, NULL),
(856, '2025-02-19', '2025-02-19 11:13:09.684536', NULL, 0, 0, 17, NULL),
(857, '2025-02-20', '2025-02-20 03:51:04.124101', '2025-02-20 03:51:06.761332', 0, 2637231, 12, NULL),
(858, '2025-02-20', '2025-02-20 03:51:20.332033', NULL, 0, 0, 14, NULL),
(859, '2025-02-25', '2025-02-25 05:10:33.984497', '2025-02-25 05:10:36.976749', 0, 2992252, 12, NULL),
(860, '2025-02-25', '2025-02-25 05:10:49.725112', '2025-02-25 05:14:17.944928', 0, 208219816, 18, NULL),
(861, '2025-02-25', '2025-02-25 05:14:27.130603', '2025-02-25 09:00:56.224499', 0, 13589093896, 18, NULL),
(862, '2025-02-25', '2025-02-25 09:30:51.612971', NULL, 0, 0, 17, NULL),
(863, '2025-02-25', '2025-02-25 10:13:43.528559', '2025-02-25 10:13:54.357062', 0, 10828503, 12, NULL),
(864, '2025-02-25', '2025-02-25 10:14:03.904211', '2025-02-25 10:33:57.972013', 0, 1194067802, 18, NULL),
(865, '2025-02-25', '2025-02-25 10:34:07.707358', NULL, 0, 0, 14, NULL),
(866, '2025-02-25', '2025-02-25 10:34:40.055210', '2025-02-25 10:34:44.412468', 0, 4357258, 12, NULL),
(867, '2025-02-25', '2025-02-25 10:34:56.160251', NULL, 0, 0, 17, NULL),
(868, '2025-03-04', '2025-03-04 06:07:27.964856', '2025-03-04 07:09:17.298484', 0, 3709333628, 12, NULL),
(869, '2025-03-04', '2025-03-04 07:09:24.978894', NULL, 0, 0, 14, NULL),
(870, '2025-03-04', '2025-03-04 07:09:41.142620', '2025-03-04 07:48:00.484354', 0, 2299341734, 12, NULL),
(871, '2025-03-04', '2025-03-04 07:48:09.281006', NULL, 0, 0, 13, NULL),
(872, '2025-03-04', '2025-03-04 07:48:33.830045', '2025-03-04 07:55:05.727126', 0, 391897081, 12, NULL),
(873, '2025-03-04', '2025-03-04 07:55:12.608676', NULL, 0, 0, 14, NULL),
(874, '2025-03-04', '2025-03-04 07:55:56.064778', '2025-03-04 07:56:19.359028', 0, 23294250, 12, NULL),
(875, '2025-03-04', '2025-03-04 07:56:29.066214', NULL, 0, 0, 13, NULL),
(876, '2025-03-04', '2025-03-04 07:56:53.624359', '2025-03-04 08:57:30.560101', 0, 3636935742, 12, NULL),
(877, '2025-03-04', '2025-03-04 08:57:40.293807', NULL, 0, 0, 13, NULL),
(878, '2025-03-04', '2025-03-04 09:59:55.996391', NULL, 0, 0, 12, NULL),
(879, '2025-03-05', '2025-03-05 03:49:51.486373', '2025-03-05 03:57:54.236362', 0, 482749989, 13, NULL),
(880, '2025-03-05', '2025-03-05 03:58:07.203062', NULL, 0, 0, 12, NULL),
(881, '2025-03-05', '2025-03-05 07:04:06.235043', NULL, 0, 0, 13, NULL),
(882, '2025-03-05', '2025-03-05 07:04:44.812852', '2025-03-05 07:05:35.931025', 0, 51118173, 13, NULL),
(883, '2025-03-05', '2025-03-05 07:05:54.655039', '2025-03-05 08:30:05.338101', 0, 5050683062, 13, NULL),
(884, '2025-03-05', '2025-03-05 08:30:25.168365', '2025-03-05 12:27:55.629660', 0, 14250461295, 13, NULL),
(885, '2025-03-05', '2025-03-05 12:28:15.041902', NULL, 0, 0, 13, NULL),
(886, '2025-03-06', '2025-03-06 04:07:06.421216', '2025-03-06 04:14:50.370278', 0, 463949062, 13, NULL),
(887, '2025-03-06', '2025-03-06 04:15:05.646224', NULL, 0, 0, 14, NULL),
(888, '2025-03-06', '2025-03-06 07:14:07.906023', '2025-03-06 07:21:21.749920', 0, 433843897, 12, NULL),
(889, '2025-03-06', '2025-03-06 07:21:42.258273', NULL, 0, 0, 13, NULL),
(890, '2025-03-06', '2025-03-06 07:54:36.619218', '2025-03-06 08:06:26.345726', 0, 709726508, 12, NULL),
(891, '2025-03-06', '2025-03-06 08:07:47.217707', NULL, 0, 0, 13, NULL),
(892, '2025-03-06', '2025-03-06 09:50:37.059955', '2025-03-06 10:13:57.117802', 0, 1400057847, 12, NULL),
(893, '2025-03-06', '2025-03-06 10:14:11.410385', '2025-03-06 10:54:39.843286', 0, 2428432901, 13, NULL),
(894, '2025-03-06', '2025-03-06 11:02:42.391015', '2025-03-06 12:51:52.015568', 0, 6549624553, 13, NULL),
(895, '2025-03-07', '2025-03-07 04:13:46.999101', '2025-03-07 05:01:30.387310', 11451949, 2851936260, 13, NULL),
(896, '2025-03-07', '2025-03-07 05:01:47.238777', NULL, 2966793, 0, 14, NULL),
(897, '2025-03-07', '2025-03-07 05:07:57.956231', '2025-03-07 05:26:19.885838', 0, 1101929607, 12, NULL),
(898, '2025-03-07', '2025-03-07 05:26:34.124469', NULL, 0, 0, 13, NULL),
(899, '2025-03-07', '2025-03-07 07:27:51.503184', '2025-03-07 07:30:22.955113', 0, 151451929, 12, NULL),
(900, '2025-03-07', '2025-03-07 07:30:43.993862', '2025-03-07 07:41:27.510832', 0, 643516970, 13, NULL),
(901, '2025-03-07', '2025-03-07 07:41:46.035426', '2025-03-07 08:28:45.500291', 0, 2819464865, 13, NULL),
(902, '2025-03-07', '2025-03-07 08:29:11.094362', '2025-03-07 11:57:56.810313', 0, 12525715951, 18, NULL),
(903, '2025-03-07', '2025-03-07 11:58:21.326893', NULL, 0, 0, 18, NULL),
(904, '2025-03-07', '2025-03-07 12:00:49.744656', '2025-03-07 12:02:06.237681', 0, 76493025, 12, NULL),
(905, '2025-03-07', '2025-03-07 12:02:17.068371', '2025-03-07 12:02:27.333464', 0, 10265093, 18, NULL),
(906, '2025-03-07', '2025-03-07 12:03:14.554176', '2025-03-07 12:45:20.164559', 2918829, 2522691554, 18, NULL),
(907, '2025-03-10', '2025-03-10 04:12:41.823617', '2025-03-10 06:41:59.987906', 0, 8958164289, 13, NULL),
(908, '2025-03-10', '2025-03-10 06:42:20.435730', '2025-03-10 06:44:46.104026', 0, 145668296, 18, NULL),
(909, '2025-03-10', '2025-03-10 06:51:42.219130', '2025-03-10 08:30:22.360770', 0, 5920141640, 13, NULL),
(910, '2025-03-10', '2025-03-10 07:52:28.990333', '2025-03-10 08:29:37.991400', 0, 2229001067, 18, NULL),
(911, '2025-03-10', '2025-03-10 08:29:51.285621', NULL, 12397711, 0, 14, NULL),
(912, '2025-03-10', '2025-03-10 08:30:36.950346', '2025-03-10 08:34:25.508475', 0, 228558129, 18, NULL),
(913, '2025-03-10', '2025-03-10 08:58:00.780581', '2025-03-10 13:19:03.306342', 0, 15662525761, 18, NULL),
(914, '2025-03-11', '2025-03-11 03:54:09.443961', '2025-03-11 03:54:49.782441', 0, 40338480, 13, NULL),
(915, '2025-03-11', '2025-03-11 03:55:04.997017', '2025-03-11 06:12:51.475899', 0, 8266478882, 18, NULL),
(916, '2025-03-11', '2025-03-11 03:55:58.323228', '2025-03-11 03:56:01.208757', 0, 2885529, 12, NULL),
(917, '2025-03-11', '2025-03-11 03:56:20.955418', NULL, 0, 0, 14, NULL),
(918, '2025-03-11', '2025-03-11 06:13:05.262414', '2025-03-11 12:46:14.054275', 2917653979, 20671137882, 13, NULL),
(919, '2025-03-11', '2025-03-11 10:16:33.540468', '2025-03-11 10:16:39.253891', 0, 5713423, 12, NULL),
(920, '2025-03-11', '2025-03-11 10:16:50.211823', NULL, 0, 0, 14, NULL),
(921, '2025-03-11', '2025-03-11 10:24:52.073685', '2025-03-11 10:24:56.449305', 0, 4375620, 12, NULL),
(922, '2025-03-11', '2025-03-11 10:25:06.610110', '2025-03-11 12:44:00.145037', 8614496, 8324920431, 14, NULL),
(923, '2025-03-12', '2025-03-12 03:56:32.651141', '2025-03-12 05:46:46.437422', 0, 6613786281, 14, NULL),
(924, '2025-03-12', '2025-03-12 03:59:02.263782', '2025-03-12 05:45:04.234034', 0, 6361970252, 13, NULL),
(925, '2025-03-12', '2025-03-12 05:45:19.831678', '2025-03-12 07:06:24.230555', 0, 4864398877, 12, NULL),
(926, '2025-03-12', '2025-03-12 05:47:04.827475', '2025-03-12 07:23:39.652926', 0, 5794825451, 13, NULL),
(927, '2025-03-12', '2025-03-12 07:23:57.013637', '2025-03-12 07:28:37.299718', 0, 280286081, 14, NULL),
(928, '2025-03-12', '2025-03-12 07:28:55.620427', '2025-03-12 09:13:10.072673', 0, 6254452246, 13, NULL),
(929, '2025-03-12', '2025-03-12 07:39:03.670901', '2025-03-12 09:13:41.217238', 0, 5677546337, 14, NULL),
(930, '2025-03-12', '2025-03-12 09:13:22.173775', '2025-03-12 11:37:46.299682', 0, 8664125907, 13, NULL),
(931, '2025-03-12', '2025-03-12 09:13:53.705929', '2025-03-12 09:29:39.232038', 0, 945526109, 12, NULL),
(932, '2025-03-12', '2025-03-12 09:47:06.281081', '2025-03-12 13:10:22.571843', 0, 12196290762, 12, NULL),
(933, '2025-03-12', '2025-03-12 11:38:02.729164', '2025-03-12 11:44:26.585350', 0, 383856186, 14, NULL),
(934, '2025-03-12', '2025-03-12 11:45:26.714630', '2025-03-12 13:10:35.351704', 0, 5108637074, 13, NULL),
(935, '2025-03-13', '2025-03-13 03:52:05.409139', '2025-03-13 04:27:57.906900', 0, 2152497761, 13, NULL),
(936, '2025-03-13', '2025-03-13 03:57:05.588979', '2025-03-13 04:30:50.376682', 0, 2024787703, 14, NULL),
(937, '2025-03-13', '2025-03-13 04:29:01.719338', '2025-03-13 04:30:30.060501', 0, 88341163, 14, NULL),
(938, '2025-03-13', '2025-03-13 04:31:01.458106', '2025-03-13 04:44:10.437669', 26583145, 762396418, 14, NULL),
(939, '2025-03-13', '2025-03-13 04:38:25.235538', '2025-03-13 04:44:00.369121', 13398587, 321734996, 13, NULL),
(940, '2025-03-13', '2025-03-13 04:44:24.314280', '2025-03-13 13:21:20.000429', 0, 31015686149, 13, NULL),
(941, '2025-03-13', '2025-03-13 04:45:07.126297', '2025-03-13 13:22:04.093610', 0, 31016967313, 12, NULL),
(942, '2025-03-14', '2025-03-14 03:55:07.039284', '2025-03-14 04:15:10.670555', 0, 1203631271, 13, NULL),
(943, '2025-03-14', '2025-03-14 04:04:57.175243', '2025-03-14 04:15:18.590592', 401387143, 220028206, 14, NULL),
(944, '2025-03-14', '2025-03-14 04:41:08.584802', '2025-03-14 08:01:17.110509', 0, 12008525707, 13, NULL),
(945, '2025-03-14', '2025-03-14 04:41:25.996467', '2025-03-14 05:41:05.224636', 0, 3579228169, 14, NULL),
(946, '2025-03-14', '2025-03-14 05:41:17.363981', '2025-03-14 08:01:03.997541', 0, 8386633560, 12, NULL),
(947, '2025-03-14', '2025-03-14 08:01:29.219271', '2025-03-14 09:10:25.011989', 0, 4135792718, 26, NULL),
(948, '2025-03-14', '2025-03-14 08:02:10.960151', '2025-03-14 12:44:06.576016', 0, 16915615865, 13, NULL),
(949, '2025-03-14', '2025-03-14 10:33:47.420356', '2025-03-14 10:47:49.241515', 0, 841821159, 12, NULL),
(950, '2025-03-14', '2025-03-14 11:01:14.875309', '2025-03-14 11:02:14.338853', 0, 59463544, 12, NULL),
(951, '2025-03-14', '2025-03-14 11:02:33.636816', '2025-03-14 12:38:31.183860', 0, 5757547044, 12, NULL),
(952, '2025-03-17', '2025-03-17 03:51:55.695608', '2025-03-17 05:51:50.516505', 13985566, 7180835331, 14, NULL),
(953, '2025-03-17', '2025-03-17 03:57:37.060063', '2025-03-17 06:25:28.690693', 0, 8871630630, 13, NULL),
(954, '2025-03-17', '2025-03-17 05:52:08.391444', '2025-03-17 06:25:19.888376', 10787455, 1980709477, 14, NULL),
(955, '2025-03-17', '2025-03-17 06:25:51.551581', '2025-03-17 09:36:24.952331', 0, 11433400750, 26, NULL),
(956, '2025-03-17', '2025-03-17 06:26:09.903426', '2025-03-17 11:35:14.440607', 0, 18544537181, 13, NULL),
(957, '2025-03-17', '2025-03-17 09:36:38.367337', '2025-03-17 09:54:27.881238', 0, 1069513901, 18, NULL),
(958, '2025-03-17', '2025-03-17 09:54:43.213805', '2025-03-17 09:56:30.523675', 0, 107309870, 12, NULL),
(959, '2025-03-17', '2025-03-17 09:56:38.296977', '2025-03-17 11:18:40.778320', 0, 4922481343, 14, NULL),
(960, '2025-03-17', '2025-03-17 11:18:50.818564', '2025-03-17 11:22:59.884785', 0, 249066221, 12, NULL),
(961, '2025-03-17', '2025-03-17 11:25:55.757353', '2025-03-17 11:58:53.106121', 0, 1977348768, 27, NULL),
(962, '2025-03-17', '2025-03-17 11:36:11.239100', '2025-03-17 12:50:45.554812', 0, 4474315712, 16, NULL),
(963, '2025-03-17', '2025-03-17 11:59:04.332227', '2025-03-17 12:36:19.744046', 0, 2235411819, 14, NULL),
(964, '2025-03-17', '2025-03-17 12:36:32.556900', '2025-03-17 12:52:46.016466', 0, 973459566, 27, NULL),
(965, '2025-03-17', '2025-03-17 12:53:24.484887', '2025-03-17 13:01:50.785138', 0, 506300251, 27, NULL),
(966, '2025-03-17', '2025-03-17 12:54:06.564257', '2025-03-17 13:01:57.140010', 0, 470575753, 16, NULL),
(967, '2025-03-18', '2025-03-18 03:43:33.106822', '2025-03-18 03:49:12.218131', 0, 339111309, 27, NULL),
(968, '2025-03-18', '2025-03-18 03:47:31.467200', '2025-03-18 05:40:19.049453', 0, 6767582253, 16, NULL),
(969, '2025-03-18', '2025-03-18 03:49:33.768319', '2025-03-18 03:50:33.560628', 0, 59792309, 26, NULL),
(970, '2025-03-18', '2025-03-18 03:50:56.742021', '2025-03-18 03:52:33.018266', 0, 96276245, 14, NULL),
(971, '2025-03-18', '2025-03-18 03:52:46.950671', '2025-03-18 03:53:27.325126', 0, 40374455, 28, NULL),
(972, '2025-03-18', '2025-03-18 03:54:03.647629', '2025-03-18 03:56:47.539536', 0, 163891907, 15, NULL),
(973, '2025-03-18', '2025-03-18 03:57:02.143110', '2025-03-18 04:02:51.991444', 0, 349848334, 28, NULL),
(974, '2025-03-18', '2025-03-18 04:03:11.839650', '2025-03-18 05:16:14.324244', 0, 4382484594, 27, NULL),
(975, '2025-03-18', '2025-03-18 05:16:30.670518', '2025-03-18 05:24:40.243876', 0, 489573358, 15, NULL),
(976, '2025-03-18', '2025-03-18 05:26:37.197775', '2025-03-18 12:32:30.263717', 0, 25553065942, 15, NULL),
(977, '2025-03-18', '2025-03-18 05:40:45.125097', '2025-03-18 07:11:31.543750', 0, 5446418653, 28, NULL),
(978, '2025-03-18', '2025-03-18 07:11:47.171695', '2025-03-18 07:22:00.542659', 0, 613370964, 14, NULL),
(979, '2025-03-18', '2025-03-18 07:22:09.551342', '2025-03-18 08:38:13.338993', 0, 4563787651, 28, NULL),
(980, '2025-03-18', '2025-03-18 08:38:25.863156', '2025-03-18 12:32:04.581845', 0, 14018718689, 13, NULL),
(981, '2025-03-19', '2025-03-19 03:56:50.854634', '2025-03-19 08:26:15.121048', 0, 16164266414, 13, NULL),
(982, '2025-03-19', '2025-03-19 04:12:54.085267', '2025-03-19 08:30:31.691670', 0, 15457606403, 15, NULL),
(983, '2025-03-19', '2025-03-19 08:32:24.403873', NULL, 0, 0, 13, NULL),
(984, '2025-03-19', '2025-03-19 09:27:59.926621', NULL, 0, 0, 14, NULL),
(985, '2025-03-20', '2025-03-20 05:07:47.629522', '2025-03-20 08:59:44.574535', 0, 13916945013, 14, NULL),
(986, '2025-03-20', '2025-03-20 08:59:56.620896', '2025-03-20 09:01:17.697663', 0, 81076767, 14, NULL),
(987, '2025-03-20', '2025-03-20 09:03:02.759573', NULL, 12113304, 0, 14, NULL),
(988, '2025-03-20', '2025-03-20 09:09:07.112470', NULL, 0, 0, 13, NULL),
(989, '2025-03-21', '2025-03-21 06:34:59.613494', NULL, 23341842, 0, 14, NULL),
(990, '2025-03-22', '2025-03-22 11:49:52.646679', '2025-03-22 12:28:49.780770', 0, 2337134091, 14, NULL),
(991, '2025-03-22', '2025-03-22 12:29:09.089734', '2025-03-22 12:33:09.902925', 0, 240813191, 17, NULL),
(992, '2025-03-22', '2025-03-22 12:34:28.505225', '2025-03-22 12:36:01.444511', 0, 92939286, 14, NULL);
INSERT INTO `employee_sessionactivity` (`id`, `date`, `login_time`, `logout_time`, `break_duration`, `work_time`, `user_id`, `break_start_time`) VALUES
(993, '2025-03-22', '2025-03-22 12:39:23.791281', '2025-03-22 12:57:18.397767', 0, 1074606486, 14, NULL),
(994, '2025-03-24', '2025-03-24 03:59:04.347608', '2025-03-24 08:28:50.781658', 11285654, 16175148396, 14, NULL),
(995, '2025-03-24', '2025-03-24 08:29:04.809156', '2025-03-24 11:08:52.559061', 65326493, 9522423412, 14, NULL),
(996, '2025-03-24', '2025-03-24 11:08:44.420167', '2025-03-24 11:09:37.230299', 0, 52810132, 17, NULL),
(997, '2025-03-24', '2025-03-24 11:09:03.102404', '2025-03-24 11:09:32.216915', 7758997, 21355514, 14, NULL),
(998, '2025-03-24', '2025-03-24 11:10:33.199380', '2025-03-24 13:34:44.520941', 27867856, 8623453705, 14, NULL),
(999, '2025-03-24', '2025-03-24 11:10:47.192583', '2025-03-24 13:34:29.226230', 0, 8622033647, 17, NULL),
(1000, '2025-03-25', '2025-03-25 03:28:27.482923', NULL, 133688223, 0, 14, NULL),
(1001, '2025-03-25', '2025-03-25 11:14:07.243821', NULL, 0, 0, 17, NULL),
(1002, '2025-03-26', '2025-03-26 03:54:00.223612', '2025-03-26 05:12:04.256914', 0, 4684033302, 13, NULL),
(1003, '2025-03-26', '2025-03-26 05:13:47.693817', '2025-03-26 05:39:21.910253', 0, 1534216436, 14, NULL),
(1004, '2025-03-26', '2025-03-26 05:22:29.570176', '2025-03-26 06:39:05.262311', 0, 4595692135, 13, NULL),
(1005, '2025-03-26', '2025-03-26 05:39:33.998051', '2025-03-26 06:24:36.282172', 0, 2702284121, 14, NULL),
(1006, '2025-03-26', '2025-03-26 06:24:50.824357', '2025-03-26 09:09:38.883290', 4906333, 9883152600, 14, NULL),
(1007, '2025-03-26', '2025-03-26 06:39:16.802749', '2025-03-26 11:05:22.476211', 0, 15965673462, 17, NULL),
(1008, '2025-03-26', '2025-03-26 09:09:53.054312', '2025-03-26 11:03:21.366198', 3429960, 6804881926, 14, NULL),
(1009, '2025-03-26', '2025-03-26 11:05:36.866391', '2025-03-26 11:33:37.018826', 0, 1680152435, 14, NULL),
(1010, '2025-03-26', '2025-03-26 11:05:48.964517', '2025-03-26 11:33:30.023906', 0, 1661059389, 17, NULL),
(1011, '2025-03-26', '2025-03-26 11:35:10.748148', NULL, 0, 0, 17, NULL),
(1012, '2025-03-26', '2025-03-26 11:35:33.483930', NULL, 0, 0, 14, NULL),
(1013, '2025-03-27', '2025-03-27 03:19:29.933607', NULL, 16032169, 0, 14, NULL),
(1014, '2025-03-27', '2025-03-27 03:24:43.146076', '2025-03-27 04:04:38.308662', 19535261, 2375627325, 17, NULL),
(1015, '2025-03-27', '2025-03-27 04:04:49.842275', NULL, 0, 0, 13, NULL),
(1016, '2025-03-31', '2025-03-31 06:39:01.342856', NULL, 2035719, 0, 14, NULL),
(1017, '2025-03-31', '2025-03-31 07:09:08.021301', '2025-03-31 12:56:31.326520', 9438266, 20833866953, 17, NULL),
(1018, '2025-03-31', '2025-03-31 12:56:41.475640', NULL, 0, 0, 13, NULL),
(1019, '2025-04-01', '2025-04-01 06:40:28.286873', '2025-04-01 07:41:08.962445', 0, 3640675572, 17, NULL),
(1020, '2025-04-01', '2025-04-01 07:41:37.739380', NULL, 0, 0, 13, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_ticket`
--

CREATE TABLE `employee_ticket` (
  `id` bigint(20) NOT NULL,
  `subject` varchar(300) NOT NULL,
  `status` varchar(50) NOT NULL,
  `group` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `assigned_to_id` int(11) DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `note` longtext NOT NULL,
  `assigned_by_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ticket_id` varchar(10) NOT NULL,
  `assigned_at` datetime(6) DEFAULT NULL,
  `time_spent` bigint(20) NOT NULL,
  `work_start_time` datetime(6) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `priority` varchar(10) NOT NULL,
  `call_duration` bigint(20) NOT NULL,
  `call_end_time` datetime(6) DEFAULT NULL,
  `call_note` longtext NOT NULL,
  `call_start_time` datetime(6) DEFAULT NULL,
  `call_in_progress` tinyint(1) NOT NULL,
  `call_timer_started_by_call` tinyint(1) NOT NULL,
  `individual_time_spent` bigint(20) NOT NULL,
  `break_duration` bigint(20) NOT NULL,
  `last_break_time` datetime(6) DEFAULT NULL,
  `client_call_note` longtext NOT NULL,
  `paused_by_other_call` tinyint(1) NOT NULL,
  `paused_time` datetime(6) DEFAULT NULL,
  `status_changed` datetime(6) DEFAULT NULL,
  `acknowledged_at` datetime(6) DEFAULT NULL,
  `is_acknowledged` tinyint(1) NOT NULL,
  `environment` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_ticket`
--

INSERT INTO `employee_ticket` (`id`, `subject`, `status`, `group`, `created_at`, `created_by_id`, `assigned_to_id`, `updated_at`, `note`, `assigned_by_id`, `user_id`, `ticket_id`, `assigned_at`, `time_spent`, `work_start_time`, `is_active`, `priority`, `call_duration`, `call_end_time`, `call_note`, `call_start_time`, `call_in_progress`, `call_timer_started_by_call`, `individual_time_spent`, `break_duration`, `last_break_time`, `client_call_note`, `paused_by_other_call`, `paused_time`, `status_changed`, `acknowledged_at`, `is_acknowledged`, `environment`) VALUES
(57, 'testing ticket 5', 'on_hold', 'Linux', '2024-11-08 09:53:28.954963', 13, 18, '2024-11-27 05:04:21.769764', 'assigned to didith', 13, NULL, '10004', NULL, 4012043, NULL, 0, 'low', 11127350, '2024-12-10 06:25:18.023131', 'time123', '2024-12-10 06:25:06.895781', 0, 0, 0, 0, NULL, '', 0, NULL, '2025-02-12 03:56:06.865551', '2025-02-04 09:22:26.887831', 1, 'postiefs'),
(58, 'testing ticket 6', 'waiting_on_customer', 'Linux', '2024-11-08 09:54:03.034763', 13, 18, '2024-12-10 09:54:43.609979', 'assigned to didith', 13, NULL, '10006', NULL, 26058492, NULL, 0, 'low', 2483996, '2024-12-10 09:54:39.571259', 'testing 12', '2024-12-10 09:54:37.087263', 0, 0, 4038723, 0, NULL, '', 0, NULL, '2025-02-04 09:19:34.966821', '2025-02-04 09:22:22.919977', 1, 'postiefs'),
(59, 'ticket id error checking', 'closed', 'Windows', '2024-11-11 04:44:46.855684', 17, 14, '2024-12-03 04:00:04.896490', 'reassigned to jobin', 14, 14, '10113', '2024-11-11 04:45:31.000000', 27975143541, NULL, 0, 'low', 0, NULL, 'nothing new1', '2025-01-09 06:54:44.000000', 0, 0, 27404685275, 0, NULL, 'note from ajil', 0, NULL, NULL, NULL, 0, 'postiefs'),
(60, 'assign time checking', 'closed', 'Windows', '2024-11-11 04:49:51.351060', 14, 17, '2024-12-05 08:46:07.279910', 'assigned to jobin', 14, NULL, '11111', '2024-11-11 04:49:51.350061', 2436873, NULL, 0, 'low', 0, NULL, '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, NULL, NULL, 0, 'postiefs'),
(61, 'assigned time error checking', 'closed', 'Windows', '2024-11-11 05:06:32.536528', 14, 17, '2024-12-06 10:23:41.767185', 'assigned to jobin', 14, NULL, '11112', '2024-12-03 04:43:34.834493', 654877023, NULL, 0, 'low', 33618400, '2025-01-16 10:15:30.681710', 'qdywgdsgd', '2025-01-16 10:14:57.063310', 0, 0, 0, 0, NULL, '', 0, NULL, '2025-01-30 09:08:12.882467', '2025-01-30 09:08:07.652236', 1, 'postiefs'),
(62, 'testing all problems', 'closed', 'Windows', '2024-11-11 05:56:40.050947', 15, 14, '2024-11-29 09:17:38.464470', 'assigned to ajil', 15, NULL, '11113', '2024-11-11 05:56:40.050947', 540315684557, NULL, 0, 'low', 0, NULL, '', NULL, 0, 0, 284952725925, 0, NULL, '', 0, NULL, NULL, NULL, 0, 'postiefs'),
(63, 'error checking', 'closed', 'Windows', '2024-11-11 05:57:11.425689', 15, 17, '2024-12-13 04:52:25.961586', 'Reassigned to jobin by Ajil.', 14, NULL, '11114', '2025-01-24 06:53:54.548417', 1810780233, NULL, 0, 'high', 17428343, '2025-01-16 10:18:05.201347', 'old', '2025-01-16 10:17:47.773004', 0, 0, 0, 0, NULL, 'this is the 2nd note', 0, NULL, '2025-01-30 10:15:59.510746', '2025-01-30 10:15:50.009091', 1, 'postiefs'),
(64, 'error checking', 'closed', 'Windows', '2024-11-12 08:13:44.869834', 17, 14, '2024-12-05 08:58:30.479426', 'assigned to ajil', 17, NULL, '112233', '2024-11-12 08:13:44.869834', 585277981351, NULL, 0, 'low', 0, NULL, '', NULL, 0, 0, 285010417569, 0, NULL, '', 0, NULL, NULL, NULL, 0, 'postiefs'),
(65, 'testing table', 'resolved', 'Windows', '2024-11-18 10:50:59.658362', 15, 14, '2024-12-13 04:49:22.902642', 'reassigned to jobin', 17, NULL, '111221', '2025-01-29 07:16:36.666421', 8397932876, NULL, 0, 'low', 7449075, '2025-01-16 10:18:52.060449', 'note1', '2025-01-16 10:18:44.611374', 0, 0, 0, 0, NULL, '', 0, NULL, '2025-01-29 07:17:17.542352', '2025-01-29 07:17:08.116704', 1, 'postiefs'),
(66, 'priority field', 'closed', 'Windows', '2024-12-04 05:24:11.637533', 14, 14, '2024-12-10 13:19:13.132685', 'Reassigned to Ajil by Jayamohan.', 15, 14, '100200', '2025-01-28 11:47:02.491584', 60452292177, NULL, 0, 'low', 67917551, '2025-01-29 05:35:20.743299', 'testing the time1', '2025-01-29 05:34:12.825748', 0, 0, 0, 0, NULL, 'new note for client call', 0, NULL, '2025-01-29 06:25:23.705233', '2025-01-29 04:56:17.631207', 1, 'postiefs'),
(70, 'ticket priority check', 'closed', 'Windows', '2025-01-23 06:38:25.023302', 17, 14, '0000-00-00 00:00:00.000000', 'this is about to check the ticket priority color and notification implementation', 17, NULL, '111111', '2025-01-23 06:38:25.023302', 0, NULL, 0, 'urgent', 0, NULL, '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, '2025-01-30 05:28:34.603098', '2025-01-28 10:29:15.328006', 1, 'postiefs'),
(71, 'individual column check', 'resolved', 'Windows', '2025-01-27 06:14:57.501992', 17, 17, '0000-00-00 00:00:00.000000', 'for testing purpose', 14, NULL, '111122', '2025-01-30 09:11:51.812585', 617007036, NULL, 0, 'urgent', 6838114, '2025-01-30 06:58:26.136969', '', '2025-01-30 06:58:19.298855', 0, 0, 0, 0, NULL, '', 0, NULL, '2025-01-31 06:27:54.262220', '2025-01-31 06:27:47.788025', 1, 'postiefs'),
(72, 'ticket for todat stats', 'closed', 'Windows', '2025-01-29 06:45:52.779004', 17, 14, '0000-00-00 00:00:00.000000', 'this is a test for stats display', 17, NULL, '123456', '2025-01-29 06:45:52.779004', 0, NULL, 0, 'medium', 0, NULL, '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, '2025-01-29 07:43:40.650190', '2025-01-29 06:46:36.322315', 1, 'postiefs'),
(73, 'created at field check', 'resolved', 'Windows', '2025-01-29 07:45:07.206117', 14, 17, '0000-00-00 00:00:00.000000', 'to check create time', 14, NULL, '123123', '2025-01-29 07:45:07.227778', 0, NULL, 0, 'medium', 0, NULL, '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, '2025-01-29 09:05:09.111587', NULL, 0, 'postiefs'),
(74, 'created time test', 'closed', 'Windows', '2025-01-29 07:54:05.382967', 14, 17, '0000-00-00 00:00:00.000000', 'time testing', 14, NULL, '111234', '2025-01-29 07:54:05.382967', 0, NULL, 0, 'low', 0, NULL, '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, '2025-01-29 09:05:21.260462', NULL, 0, 'postiefs'),
(75, 'create time', 'resolved', 'Windows', '2025-01-29 09:06:02.159429', 14, 14, '0000-00-00 00:00:00.000000', 'stat check', 14, NULL, '101201', '2025-02-04 07:27:23.460829', 0, NULL, 0, 'low', 0, NULL, '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, '2025-02-11 05:19:12.957293', '2025-02-04 07:27:48.264788', 1, 'postiefs'),
(76, 'timer check', 'closed', 'Windows', '2025-01-29 09:42:28.074031', 17, 14, '0000-00-00 00:00:00.000000', 'checking', 17, NULL, '101202', '2025-02-11 09:30:41.451055', 404691074, NULL, 0, 'low', 58749198, '2025-03-24 07:03:15.547592', '', '2025-03-24 07:02:16.798394', 0, 0, 0, 0, NULL, '', 0, NULL, '2025-03-25 11:37:30.478164', '2025-02-11 09:31:25.047742', 1, 'postiefs'),
(77, 'today status checking', 'closed', 'Windows', '2025-01-30 09:10:01.314402', 17, 14, '0000-00-00 00:00:00.000000', 'for check of status', 17, NULL, '112201', '2025-01-30 09:10:01.314402', 0, NULL, 0, 'low', 0, NULL, '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, '2025-02-11 07:57:25.954338', '2025-01-31 08:51:51.591836', 1, 'postiefs'),
(78, 'open status check', 'resolved', 'Windows', '2025-01-30 10:37:44.592875', 14, 17, '0000-00-00 00:00:00.000000', 'Reassigning to Ajil', 17, NULL, '111010', '2025-03-25 11:26:29.359324', 11281677, NULL, 0, 'medium', 0, NULL, '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, '2025-03-25 11:38:41.776245', '2025-03-25 11:26:33.541685', 1, 'postiefs'),
(79, 'Ticket creation check', 'closed', 'Windows', '2025-01-31 05:42:47.403686', 14, 14, '0000-00-00 00:00:00.000000', 'only for testing', 14, NULL, '101110', '2025-02-10 11:53:08.579994', 184127370, NULL, 0, 'high', 8169542, '2025-03-25 06:55:31.748170', '', '2025-03-25 06:55:23.578628', 0, 0, 0, 0, NULL, '', 0, NULL, '2025-03-25 11:40:22.815539', '2025-02-10 11:53:47.257959', 1, 'azure'),
(80, 'alert to assigned user', 'closed', 'Windows', '2025-01-31 06:19:27.261220', 17, 17, '0000-00-00 00:00:00.000000', 'testing for notification', 14, NULL, '101102', '2025-03-25 12:43:00.667084', 14840034881, NULL, 0, 'medium', 8609438, '2025-03-25 09:38:46.252841', '', '2025-03-25 09:38:37.643403', 0, 0, 0, 0, NULL, '', 0, NULL, '2025-03-26 06:42:15.371507', '2025-03-25 12:44:08.740722', 1, 'oracle'),
(81, 'notification alert', 'closed', 'Windows', '2025-01-31 07:01:53.194260', 14, 14, '0000-00-00 00:00:00.000000', 'testing purpose', 17, NULL, '101123', '2025-03-26 12:10:04.166398', 9748924660, NULL, 0, 'urgent', 7834016, '2025-03-25 11:09:40.401001', '', '2025-03-25 11:09:32.566985', 0, 0, 0, 0, NULL, '', 0, NULL, '2025-03-27 03:44:21.060404', '2025-03-26 12:10:34.814148', 1, 'azure'),
(82, 'work report', 'closed', 'Windows', '2025-02-11 09:28:03.584893', 17, 14, '0000-00-00 00:00:00.000000', 'this ticket is for the testing of work report on daily basis', 17, NULL, '100014', '2025-02-11 09:28:03.584893', 14630304023, NULL, 0, 'low', 14340219801, '2025-03-20 09:05:32.593114', '', '2025-03-20 05:06:32.373313', 0, 0, 0, 0, NULL, '', 0, NULL, '2025-03-21 06:41:30.849230', '2025-02-11 09:28:45.990524', 1, 'aws'),
(83, 'generate report', 'waiting_on_customer', 'Linux', '2025-02-12 04:01:23.220867', 14, 18, '0000-00-00 00:00:00.000000', 'report based check', 14, NULL, '100412', '2025-02-12 04:01:23.220867', 41268076, NULL, 0, 'low', 6104103, '2025-03-07 11:58:41.865235', '', '2025-03-07 11:58:35.761132', 0, 0, 0, 0, NULL, '', 0, NULL, '2025-03-10 13:18:46.417143', '2025-02-12 05:28:53.376956', 1, 'aws'),
(84, 'all notes check', 'waiting_on_customer', 'Windows', '2025-02-19 09:50:57.379448', 14, 14, '0000-00-00 00:00:00.000000', 'this is a note for checking the notes stored while reassigning this ticket', 17, NULL, '112206', '2025-03-25 12:23:13.233397', 494947112, NULL, 0, 'medium', 16241666, '2025-03-26 10:35:50.350193', '', '2025-03-26 10:35:34.108527', 0, 0, 12798613, 0, NULL, '', 0, NULL, '2025-03-26 10:33:59.398386', '2025-03-25 12:23:19.710466', 1, 'azure'),
(86, 'ticket creation', 'resolved', 'Windows', '2025-02-25 10:37:09.463010', 14, 17, '0000-00-00 00:00:00.000000', 'there is no note', 14, NULL, '110117', '2025-02-25 10:37:09.463010', 0, NULL, 0, 'medium', 0, NULL, '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, '2025-03-26 08:31:09.434787', '2025-02-25 10:37:36.942815', 1, 'postiefs'),
(87, 'ticket creation', 'closed', 'Windows', '2025-02-25 11:36:51.768823', 14, 17, '0000-00-00 00:00:00.000000', 'there is no note for this ticket', 17, NULL, '110207', '2025-03-25 12:19:03.157408', 0, NULL, 0, 'low', 0, NULL, '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, '2025-03-26 08:31:31.696209', '2025-03-25 12:19:10.856071', 1, 'postiefs'),
(88, 'Testing ticket 123', 'waiting_on_customer', 'Windows', '2025-03-26 09:34:17.631903', 14, 17, '0000-00-00 00:00:00.000000', 'Web pooling method checking', 14, NULL, '100001', '2025-03-26 09:34:17.631903', 0, NULL, 0, 'high', 0, NULL, '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, '2025-03-26 11:04:35.076576', '2025-03-26 09:38:16.493367', 1, 'azure'),
(89, 'Web pooling method', 'on_hold', 'Windows', '2025-03-26 09:41:10.851047', 14, 17, '0000-00-00 00:00:00.000000', 'For testing purpose', 14, NULL, '100002', '2025-03-26 09:41:10.851047', 0, NULL, 0, 'low', 0, NULL, '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, '2025-03-26 11:04:42.237940', '2025-03-26 09:41:39.886699', 1, 'aws'),
(90, 'ticket pooling', 'on_hold', 'Windows', '2025-03-26 11:08:53.475468', 17, 14, '0000-00-00 00:00:00.000000', 'web pooling testing purpose', 17, NULL, '100003', '2025-03-26 11:08:53.475468', 15899860, NULL, 0, 'high', 6570382, '2025-03-26 11:21:04.165609', '', '2025-03-26 11:20:57.595227', 0, 0, 0, 0, NULL, '', 0, NULL, '2025-03-26 12:33:12.029851', '2025-03-26 11:16:11.420716', 1, 'oracle'),
(91, 'ticket table checking', 'waiting_on_customer', 'Windows', '2025-03-26 11:37:16.293835', 14, 17, '0000-00-00 00:00:00.000000', 'overall ticket table checking', 14, NULL, '100004', '2025-03-26 11:37:16.293835', 67471410, NULL, 0, 'urgent', 26825540, '2025-03-31 12:47:02.981078', '', '2025-03-31 12:46:36.155538', 0, 0, 43651034, 0, NULL, '', 0, NULL, '2025-03-27 03:24:16.359745', '2025-03-26 11:52:15.933014', 1, 'postiefs'),
(92, 'ticket for pool', 'on_hold', 'Windows', '2025-03-27 03:20:22.668629', 17, 14, '0000-00-00 00:00:00.000000', 'testing ticket', 17, NULL, '100005', '2025-03-27 03:20:22.667630', 0, NULL, 0, 'medium', 0, NULL, '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, '2025-03-31 06:37:54.435851', '2025-03-27 03:21:43.628394', 1, 'aws'),
(93, 'ticket 123', 'waiting_on_customer', 'Windows', '2025-03-27 04:03:52.194917', 17, 14, '0000-00-00 00:00:00.000000', 'testing note', 17, NULL, '100006', '2025-03-27 04:03:52.194917', 13378648, NULL, 0, 'medium', 5953257, '2025-03-31 07:24:06.850861', '', '2025-03-31 07:24:00.897604', 0, 0, 13378648, 0, NULL, '', 0, NULL, '2025-03-31 06:37:45.351492', '2025-03-27 04:04:17.860125', 1, 'aws'),
(94, 'this ticket is to check whether the subject column shows the full subject when exceeding the column and while hovering over', 'open', 'Windows', '2025-03-31 09:37:09.598994', 17, 14, '0000-00-00 00:00:00.000000', 'testing note', 17, NULL, '100007', '2025-04-01 07:26:32.339434', 12125466, NULL, 0, 'low', 0, NULL, '', NULL, 0, 0, 12125466, 0, NULL, '', 0, NULL, NULL, '2025-04-01 07:26:43.685308', 1, 'aws');

-- --------------------------------------------------------

--
-- Table structure for table `employee_tickethistory`
--

CREATE TABLE `employee_tickethistory` (
  `id` bigint(20) NOT NULL,
  `note` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `assigned_to_id` int(11) DEFAULT NULL,
  `ticket_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_ticketnote`
--

CREATE TABLE `employee_ticketnote` (
  `id` bigint(20) NOT NULL,
  `note_type` varchar(50) NOT NULL,
  `note_text` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `call_duration` bigint(20) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `ticket_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_ticketnote`
--

INSERT INTO `employee_ticketnote` (`id`, `note_type`, `note_text`, `created_at`, `call_duration`, `created_by_id`, `ticket_id`) VALUES
(1, 'creation', 'this is a note for checking the notes while create a ticket', '2025-02-19 09:50:57.379448', NULL, 14, 84),
(2, 'general', 'this is test field note', '2025-02-19 10:01:54.691389', NULL, 14, 82),
(3, 'call', 'test note for note page', '2025-02-19 10:13:55.065206', 19002079, 17, 84),
(4, 'reassignment', 'this is a note for checking the notes stored while reassigning this ticket', '2025-02-19 11:04:27.651158', NULL, 17, 84),
(5, 'client_call', 'this is a client call note for testing the note field', '2025-02-19 11:07:03.496472', 28570654, 14, 84),
(6, 'client_call', 'this is test note from any other agent', '2025-02-19 11:11:11.609001', 18149386, 18, 84),
(7, 'call', 'shdgtsd', '2025-02-21 04:11:45.072194', 25463524, 14, 84),
(8, 'reassignment', 'this is a note for checking the notes stored while reassigning this ticket', '2025-02-21 04:13:31.932726', NULL, 14, 84),
(10, 'creation', 'there is no note', '2025-02-25 10:37:09.482621', NULL, 14, 86),
(11, 'creation', 'there is no note for this ticket', '2025-02-25 11:36:51.784450', NULL, 14, 87),
(12, 'general', 'testing note', '2025-03-03 07:15:08.397459', NULL, 14, 82),
(15, 'call', 'hwbdhwvyfh', '2025-03-07 11:55:35.139957', 31541858, 18, 83),
(17, 'call', 'ytftrx', '2025-03-07 11:58:41.854587', 6091437, 18, 83),
(22, 'call', 'wddw', '2025-03-10 09:52:05.917074', 19552026, 14, 82),
(23, 'call', 't', '2025-03-11 06:49:31.821886', 9998557, 14, 82),
(24, 'call', 'not a call', '2025-03-11 12:41:07.052309', 27918127, 14, 82),
(25, 'call', 'uyft', '2025-03-11 12:41:44.652041', 5778406, 14, 82),
(26, 'call', 'ydftd', '2025-03-20 09:05:32.593114', 14340219801, 14, 82),
(27, 'client_call', 'this is note for taking the ticket from you', '2025-03-21 06:54:35.470690', 47795982, 14, 75),
(28, 'call', 'bdu3b', '2025-03-22 12:41:07.060128', 89489684112, 14, 81),
(29, 'call', 'dtcqd', '2025-03-24 06:54:11.071158', 6560728964, 14, 81),
(30, 'call', 'stqftds', '2025-03-24 07:03:15.547592', 58749198, 14, 76),
(31, 'client_call', 'testing purpose for tailwind', '2025-03-24 09:14:43.585458', 19807089, 14, 81),
(32, 'client_call', 'this is a high priority ticket', '2025-03-24 09:36:09.861667', 32990283, 14, 80),
(33, 'client_call', 'this is a low priority ticket', '2025-03-24 09:38:16.730134', 32580804, 14, 76),
(34, 'client_call', 'transferring from jobin ', '2025-03-24 09:45:30.579296', 37564872, 14, 79),
(35, 'call', 'yd', '2025-03-24 10:33:14.420740', 2177967503, 14, 81),
(36, 'call', 'etfwqt', '2025-03-24 10:33:58.063627', 9204847, 14, 81),
(37, 'call', 'yqdgyqd', '2025-03-24 10:34:25.630462', 14018687, 14, 80),
(38, 'call', 'dtf', '2025-03-24 10:35:07.422007', 8094093, 14, 80),
(39, 'call', 'tdrt', '2025-03-24 10:36:21.824089', 9855578, 14, 81),
(40, 'call', 'wtdttd', '2025-03-24 11:19:38.868902', 7157069, 14, 80),
(41, 'call', 'etfte', '2025-03-25 05:34:07.675193', 9606607, 14, 81),
(42, 'client_call', 'testing purpose for new query', '2025-03-25 05:48:51.300423', 27882115, 14, 81),
(43, 'client_call', 'testing purpose for query', '2025-03-25 06:15:11.410362', 24365673, 14, 81),
(44, 'call', '1udgyd', '2025-03-25 06:34:09.689530', 104828363, 14, 81),
(45, 'call', 'dgqd', '2025-03-25 06:35:05.339865', 13634877, 14, 81),
(46, 'call', 'ydftwqvdgt', '2025-03-25 06:40:06.789200', 19266306, 14, 81),
(47, 'call', 'edygq', '2025-03-25 06:45:13.442192', 9101645, 14, 81),
(48, 'call', 'wdyg', '2025-03-25 06:48:24.898612', 6847786, 14, 81),
(49, 'call', 'dff2', '2025-03-25 06:54:28.848540', 6748327, 14, 81),
(50, 'call', 'd26q', '2025-03-25 06:55:31.744005', 8165251, 14, 79),
(51, 'call', 'ytd', '2025-03-25 06:58:03.737836', 7081534, 14, 81),
(52, 'call', '7yft6d', '2025-03-25 07:03:03.956262', 6340636, 14, 81),
(53, 'call', '56er6d', '2025-03-25 09:08:25.765294', 8237854, 14, 81),
(54, 'call', 'fdytwvd', '2025-03-25 09:32:46.911268', 9575626, 14, 81),
(55, 'client_call', 'testing for notification', '2025-03-25 09:34:02.063881', 26977429, 14, 80),
(56, 'call', 'whf', '2025-03-25 09:38:07.524445', 21701706, 14, 81),
(57, 'call', 'dgdt', '2025-03-25 09:38:46.252841', 8609438, 14, 80),
(58, 'call', 'idjqw', '2025-03-25 09:39:05.547166', 11043528, 14, 81),
(59, 'call', 'dyg', '2025-03-25 10:59:16.891280', 46836203, 14, 81),
(60, 'call', 'dgcq', '2025-03-25 10:59:26.591236', 5641909, 14, 81),
(61, 'call', 'svtyfs', '2025-03-25 11:09:40.385372', 7818387, 14, 81),
(62, 'reassignment', 'Reassigning to Ajil', '2025-03-25 11:14:55.358325', NULL, 17, 78),
(63, 'reassignment', 'Reassigning to Ajil', '2025-03-25 11:23:43.486398', NULL, 14, 78),
(64, 'reassignment', 'Reassigning to Ajil', '2025-03-25 11:25:00.719736', NULL, 17, 78),
(65, 'reassignment', 'Reassigning to Ajil', '2025-03-25 11:25:31.901564', NULL, 17, 78),
(66, 'reassignment', 'Reassigning to Ajil', '2025-03-25 11:26:02.250634', NULL, 17, 78),
(67, 'reassignment', 'Reassigning to Ajil', '2025-03-25 11:26:29.342762', NULL, 17, 78),
(68, 'reassignment', 'there is no note for this ticket', '2025-03-25 12:12:20.302662', NULL, 17, 87),
(69, 'reassignment', 'there is no note for this ticket', '2025-03-25 12:14:42.887375', NULL, 17, 87),
(70, 'reassignment', 'there is no note for this ticket', '2025-03-25 12:15:56.123398', NULL, 17, 87),
(71, 'reassignment', 'there is no note for this ticket', '2025-03-25 12:18:07.043179', NULL, 17, 87),
(72, 'reassignment', 'there is no note for this ticket', '2025-03-25 12:19:03.150431', NULL, 17, 87),
(73, 'reassignment', 'this is a note for checking the notes stored while reassigning this ticket', '2025-03-25 12:23:13.223268', NULL, 17, 84),
(74, 'call', 'dygw', '2025-03-25 12:26:12.076393', 6549220, 14, 84),
(75, 'reassignment', 'testing for notification', '2025-03-25 12:43:00.652698', NULL, 14, 80),
(76, 'call', 'fyywdyfgw', '2025-03-25 12:47:53.809445', 7095446, 14, 84),
(77, 'call', 'VSTCSTGV', '2025-03-26 03:47:46.656327', 9252730, 14, 84),
(78, 'call', 'udgydg', '2025-03-26 04:13:14.897166', 8036419, 14, 84),
(79, 'creation', 'Web pooling method checking', '2025-03-26 09:34:17.646295', NULL, 14, 88),
(80, 'creation', 'For testing purpose', '2025-03-26 09:41:10.861333', NULL, 14, 89),
(81, 'call', 'dygd', '2025-03-26 10:35:50.350193', 16241666, 14, 84),
(82, 'creation', 'web pooling testing purpose', '2025-03-26 11:08:53.480466', NULL, 17, 90),
(83, 'call', 'dftdf', '2025-03-26 11:21:03.835467', 6240240, 14, 90),
(84, 'creation', 'overall ticket table checking', '2025-03-26 11:37:16.293835', NULL, 14, 91),
(85, 'reassignment', 'testing purpose', '2025-03-26 12:06:20.831763', NULL, 14, 81),
(86, 'call', 'udgy', '2025-03-26 12:09:18.051646', 6529741, 17, 91),
(87, 'reassignment', 'testing purpose', '2025-03-26 12:10:04.152485', NULL, 17, 81),
(88, 'creation', 'testing ticket', '2025-03-27 03:20:22.675625', NULL, 17, 92),
(89, 'call', 'dhvd', '2025-03-27 03:47:58.352962', 13701323, 17, 91),
(90, 'creation', 'testing note', '2025-03-27 04:03:52.200896', NULL, 17, 93),
(91, 'call', 'dygw', '2025-03-31 06:47:57.352134', 7409751, 14, 93),
(92, 'call', 'fgwvf', '2025-03-31 07:24:06.850861', 5953257, 14, 93),
(93, 'creation', 'testing note', '2025-03-31 09:37:09.604993', NULL, 17, 94),
(94, 'call', 'dgwvd', '2025-03-31 12:47:02.965449', 26809911, 17, 91),
(95, 'reassignment', 'testing note', '2025-04-01 06:40:59.718997', NULL, 14, 94),
(96, 'reassignment', 'testing note', '2025-04-01 06:47:10.745525', NULL, 17, 94),
(97, 'reassignment', 'testing note', '2025-04-01 07:09:28.964791', NULL, 14, 94),
(98, 'reassignment', 'testing note', '2025-04-01 07:26:32.329225', NULL, 17, 94);

-- --------------------------------------------------------

--
-- Table structure for table `employee_unifiednotification`
--

CREATE TABLE `employee_unifiednotification` (
  `id` bigint(20) NOT NULL,
  `notification_type` varchar(20) NOT NULL,
  `message` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `last_notification_time` datetime(6) NOT NULL,
  `notification_count` int(11) NOT NULL,
  `ticket_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_unifiednotification`
--

INSERT INTO `employee_unifiednotification` (`id`, `notification_type`, `message`, `created_at`, `is_read`, `last_notification_time`, `notification_count`, `ticket_id`, `user_id`) VALUES
(2, 'exceeded', 'Ticket #112201 has exceeded its time limit', '2025-02-03 06:43:22.049464', 0, '2025-02-11 07:57:20.562597', 330, 77, 14),
(43, 'assigned', 'Ticket #101201 has been reassigned to you by Ajil', '2025-02-04 07:27:23.472718', 1, '2025-02-04 07:27:23.472718', 0, 75, 17),
(44, 'exceeded', 'Ticket #101201 has exceeded its time limit', '2025-02-04 07:27:33.021787', 1, '2025-02-11 05:16:16.932993', 126, 75, 17),
(45, 'exceeded', 'Ticket #10004 has exceeded its time limit', '2025-02-04 09:17:31.552763', 1, '2025-03-17 09:49:35.131670', 165, 57, 18),
(46, 'exceeded', 'Ticket #10006 has exceeded its time limit', '2025-02-04 09:17:31.581002', 1, '2025-03-17 09:49:35.131670', 165, 58, 18),
(61, 'assigned', 'Ticket #101110 has been reassigned to you by Ajil', '2025-02-10 11:53:08.615401', 1, '2025-02-10 11:53:08.615401', 0, 79, 17),
(62, 'exceeded', 'Ticket #101110 has exceeded its time limit', '2025-02-10 11:53:14.240011', 1, '2025-03-22 12:29:09.558715', 110, 79, 17),
(63, 'created', 'New ticket #100014 has been created and assigned to you by jobin', '2025-02-11 09:28:03.613254', 1, '2025-02-11 09:28:03.613254', 0, 82, 14),
(64, 'assigned', 'Ticket #101202 has been reassigned to you by jobin', '2025-02-11 09:30:41.467953', 1, '2025-02-11 09:30:41.467953', 0, 76, 14),
(65, 'exceeded', 'Ticket #101202 has exceeded its time limit', '2025-02-11 09:30:43.775489', 1, '2025-03-25 11:34:05.219540', 827, 76, 14),
(66, 'exceeded', 'Ticket #100014 has exceeded its time limit', '2025-02-11 11:53:08.480019', 0, '2025-03-21 06:40:50.213474', 607, 82, 14),
(67, 'created', 'New ticket #100412 has been created and assigned to you by Ajil', '2025-02-12 04:01:23.244866', 1, '2025-02-12 04:01:23.244866', 0, 83, 18),
(68, 'exceeded', 'Ticket #100412 has exceeded its time limit', '2025-02-12 07:52:08.414260', 0, '2025-03-17 09:49:35.131670', 114, 83, 18),
(78, 'created', 'New ticket #110117 has been created and assigned to you by Ajil', '2025-02-25 10:37:09.499282', 1, '2025-02-25 10:37:09.499282', 0, 86, 17),
(80, 'pre_notification', 'The SLA of ticket #110117 is going to end in 5 minutes', '2025-02-25 11:36:57.065678', 0, '2025-02-25 11:36:57.081306', 0, 86, 17),
(81, 'exceeded', 'Ticket #110117 has exceeded its time limit', '2025-02-25 11:37:27.015694', 0, '2025-03-26 08:25:54.478443', 52, 86, 17),
(83, 'exceeded', 'Ticket #101110 has exceeded its time limit', '2025-03-24 09:45:32.776842', 0, '2025-03-25 11:39:30.072560', 110, 79, 14),
(91, 'exceeded', 'Ticket #111010 has exceeded its time limit', '2025-03-25 11:26:31.824418', 1, '2025-03-25 11:37:02.933510', 2, 78, 17),
(96, 'exceeded', 'Ticket #110207 has exceeded its time limit', '2025-03-25 12:19:05.674545', 1, '2025-03-26 08:31:20.755875', 19, 87, 17),
(97, 'assigned', 'Ticket #112206 has been reassigned to you by jobin', '2025-03-25 12:23:13.233397', 1, '2025-03-25 12:23:13.233397', 0, 84, 14),
(98, 'exceeded', 'Ticket #112206 has exceeded its time limit', '2025-03-25 12:23:16.365200', 1, '2025-03-28 05:25:31.911486', 154, 84, 14),
(99, 'assigned', 'Ticket #101102 has been reassigned to you by Ajil', '2025-03-25 12:43:00.671082', 1, '2025-03-25 12:43:00.671082', 0, 80, 17),
(100, 'exceeded', 'Ticket #101102 has exceeded its time limit', '2025-03-25 12:43:04.404287', 1, '2025-03-26 06:39:17.292399', 6, 80, 17),
(101, 'created', 'New ticket #100001 has been created and assigned to you by Ajil', '2025-03-26 09:34:17.651992', 1, '2025-03-26 09:34:17.651992', 0, 88, 17),
(102, 'created', 'New ticket #100002 has been created and assigned to you by Ajil', '2025-03-26 09:41:10.861333', 1, '2025-03-26 09:41:10.861333', 0, 89, 17),
(103, 'exceeded', 'Ticket #100001 has exceeded its time limit', '2025-03-26 10:26:17.228861', 0, '2025-03-27 04:01:10.904349', 20, 88, 17),
(104, 'created', 'New ticket #100003 has been created and assigned to you by jobin', '2025-03-26 11:08:53.487661', 1, '2025-03-26 11:08:53.487661', 0, 90, 14),
(105, 'created', 'New ticket #100004 has been created and assigned to you by Ajil', '2025-03-26 11:37:16.304163', 1, '2025-03-26 11:37:16.304163', 0, 91, 17),
(106, 'exceeded', 'Ticket #100003 has exceeded its time limit', '2025-03-26 11:38:55.173844', 0, '2025-03-28 05:25:31.911486', 87, 90, 14),
(107, 'exceeded', 'Ticket #100002 has exceeded its time limit', '2025-03-26 11:50:40.257833', 0, '2025-03-27 04:01:10.904349', 13, 89, 17),
(108, 'pre_notification', 'The SLA of ticket #100004 is going to end in 5 minutes', '2025-03-26 11:50:40.267875', 1, '2025-03-26 11:52:04.003221', 1, 91, 17),
(109, 'exceeded', 'Ticket #100004 has exceeded its time limit', '2025-03-26 11:52:34.027941', 0, '2025-03-27 04:01:10.904349', 13, 91, 17),
(112, 'assigned', 'Ticket #101123 has been reassigned to you by jobin', '2025-03-26 12:10:04.171936', 1, '2025-03-26 12:10:04.171936', 0, 81, 14),
(113, 'exceeded', 'Ticket #101123 has exceeded its time limit', '2025-03-26 12:10:27.681895', 1, '2025-03-27 03:41:28.292528', 11, 81, 14),
(114, 'created', 'New ticket #100005 has been created and assigned to you by jobin', '2025-03-27 03:20:22.680622', 1, '2025-03-27 03:20:22.681621', 0, 92, 14),
(115, 'created', 'New ticket #100006 has been created and assigned to you by jobin', '2025-03-27 04:03:52.209890', 1, '2025-03-27 04:03:52.209890', 0, 93, 14),
(116, 'exceeded', 'Ticket #100005 has exceeded its time limit', '2025-03-27 04:25:05.365506', 0, '2025-03-28 05:25:31.911486', 66, 92, 14),
(117, 'pre_notification', 'The SLA of ticket #100006 is going to end in 5 minutes', '2025-03-27 04:59:07.394074', 0, '2025-03-27 05:03:31.761128', 3, 93, 14),
(118, 'exceeded', 'Ticket #100006 has exceeded its time limit', '2025-03-27 05:04:07.651726', 0, '2025-03-28 05:25:31.911486', 59, 93, 14),
(123, 'assigned', 'Ticket #100007 has been reassigned to you by jobin', '2025-04-01 07:26:32.339434', 1, '2025-04-01 07:26:32.339434', 0, 94, 14);

-- --------------------------------------------------------

--
-- Table structure for table `employee_workreport`
--

CREATE TABLE `employee_workreport` (
  `id` bigint(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_tickets` int(11) NOT NULL,
  `resolved_tickets` int(11) NOT NULL,
  `pending_tickets` int(11) NOT NULL,
  `total_call_duration` bigint(20) NOT NULL,
  `generated_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_workreport`
--

INSERT INTO `employee_workreport` (`id`, `start_date`, `end_date`, `total_tickets`, `resolved_tickets`, `pending_tickets`, `total_call_duration`, `generated_at`, `user_id`) VALUES
(1, '2025-02-03', '2025-02-10', 0, 0, 0, 3539625751, '2025-02-10 07:16:58.503004', 14),
(2, '2025-01-01', '2025-02-10', 6, 2, 3, 179128504780, '2025-02-10 07:18:01.662031', 14),
(3, '2024-10-02', '2025-02-10', 11, 7, 3, 2864402378494, '2025-02-10 07:19:59.255713', 14);

-- --------------------------------------------------------

--
-- Table structure for table `text_improver_improvedtext`
--

CREATE TABLE `text_improver_improvedtext` (
  `id` bigint(20) NOT NULL,
  `original_text` longtext NOT NULL,
  `improved_text` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tracking_activityreport`
--

CREATE TABLE `tracking_activityreport` (
  `id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `total_active_time` bigint(20) NOT NULL,
  `total_idle_time` bigint(20) NOT NULL,
  `activity_summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`activity_summary`)),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tracking_useractivity`
--

CREATE TABLE `tracking_useractivity` (
  `id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `idle_duration` double NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `is_idle` tinyint(1) NOT NULL,
  `time_of_day` time(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `idle_start_time` datetime(6) DEFAULT NULL,
  `hostname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tracking_useractivity`
--

INSERT INTO `tracking_useractivity` (`id`, `date`, `email`, `timestamp`, `idle_duration`, `created_at`, `is_idle`, `time_of_day`, `user_id`, `idle_start_time`, `hostname`) VALUES
(345, '2025-03-14', 'sanjeev.kumar@postiefs.com', '2025-03-14 08:07:51.073485', 333.5629999637604, '2025-03-14 08:07:53.133866', 1, '08:07:51.073485', 26, NULL, NULL),
(346, '2025-03-14', 'sanjeev.kumar@postiefs.com', '2025-03-14 08:12:53.150848', 635.6403639316559, '2025-03-14 08:12:55.175480', 1, '08:12:53.150848', 26, NULL, NULL),
(347, '2025-03-14', 'sanjeev.kumar@postiefs.com', '2025-03-14 08:17:55.194868', 937.684383392334, '2025-03-14 08:17:57.220096', 1, '08:17:55.194868', 26, NULL, NULL),
(348, '2025-03-14', 'sanjeev.kumar@postiefs.com', '2025-03-14 08:22:57.252107', 1239.741622686386, '2025-03-14 08:22:59.296723', 1, '08:22:57.252107', 26, NULL, NULL),
(349, '2025-03-14', 'sanjeev.kumar@postiefs.com', '2025-03-14 08:27:59.328319', 1541.8178343772888, '2025-03-14 08:28:01.371163', 1, '08:27:59.328319', 26, NULL, NULL),
(350, '2025-03-14', 'sanjeev.kumar@postiefs.com', '2025-03-14 08:33:01.389931', 1843.8794457912445, '2025-03-14 08:33:03.418004', 1, '08:33:01.389931', 26, NULL, NULL),
(351, '2025-03-14', 'sanjeev.kumar@postiefs.com', '2025-03-14 08:38:03.451045', 2145.9405603408813, '2025-03-14 08:38:05.461727', 1, '08:38:03.451045', 26, NULL, NULL),
(352, '2025-03-14', 'sanjeev.kumar@postiefs.com', '2025-03-14 08:43:05.492121', 2447.9816365242004, '2025-03-14 08:43:07.537517', 1, '08:43:05.492121', 26, NULL, NULL),
(353, '2025-03-14', 'sanjeev.kumar@postiefs.com', '2025-03-14 08:48:07.550586', 2750.0401010513306, '2025-03-14 08:48:09.589564', 1, '08:48:07.550586', 26, NULL, NULL),
(354, '2025-03-14', 'sanjeev.kumar@postiefs.com', '2025-03-14 08:53:09.609319', 3052.0988340377808, '2025-03-14 08:53:11.620387', 1, '08:53:09.609319', 26, NULL, NULL),
(355, '2025-03-14', 'sanjeev.kumar@postiefs.com', '2025-03-14 08:58:11.652002', 3354.141517162323, '2025-03-14 08:58:13.704799', 1, '08:58:11.652002', 26, NULL, NULL),
(356, '2025-03-14', 'sanjeev.kumar@postiefs.com', '2025-03-14 09:03:13.736622', 3656.226137638092, '2025-03-14 09:03:15.757142', 1, '09:03:13.736622', 26, NULL, NULL),
(357, '2025-03-14', 'sanjeev.kumar@postiefs.com', '2025-03-14 09:08:15.781516', 3958.271031141281, '2025-03-14 09:08:17.818096', 0, '14:38:15.781516', 26, '2025-03-14 08:02:17.510485', NULL),
(358, '2025-03-14', 'sanjeev.kumar@postiefs.com', '2025-03-14 09:16:17.849647', 311.9690001010895, '2025-03-14 09:16:19.895138', 1, '09:16:17.849647', 26, NULL, NULL),
(359, '2025-03-14', 'sanjeev.kumar@postiefs.com', '2025-03-14 09:17:19.900927', 374.02028036117554, '2025-03-14 09:17:21.959189', 0, '14:47:19.900927', 26, '2025-03-14 09:11:05.880647', NULL),
(360, '2025-03-14', 'sanjeev.kumar@postiefs.com', '2025-03-14 10:53:17.666739', 307.67199993133545, '2025-03-14 10:53:19.709089', 1, '10:53:17.666739', 26, NULL, NULL),
(361, '2025-03-14', 'sanjeev.kumar@postiefs.com', '2025-03-14 10:58:19.724483', 609.7297432422638, '2025-03-14 10:58:21.787203', 1, '10:58:19.724483', 26, NULL, NULL),
(362, '2025-03-14', 'sanjeev.kumar@postiefs.com', '2025-03-14 11:00:21.804402', 731.809662103653, '2025-03-14 11:00:23.843465', 0, '16:30:21.804402', 26, '2025-03-14 10:48:09.994740', NULL),
(363, '2025-03-17', 'sanjeev.kumar@postiefs.com', '2025-03-17 04:21:53.653001', 321.20300006866455, '2025-03-17 04:21:55.721887', 1, '04:21:53.653001', 26, NULL, NULL),
(364, '2025-03-17', 'sanjeev.kumar@postiefs.com', '2025-03-17 04:23:55.739764', 443.289763212204, '2025-03-17 04:23:57.792700', 0, '09:53:55.739764', 26, '2025-03-17 04:16:32.450001', NULL),
(365, '2025-03-17', 'sanjeev.kumar@postiefs.com', '2025-03-17 06:20:50.745478', 318.1410000324249, '2025-03-17 06:20:52.816559', 1, '06:20:50.745478', 26, NULL, NULL),
(366, '2025-03-17', 'sanjeev.kumar@postiefs.com', '2025-03-17 06:21:52.838555', 380.23407673835754, '2025-03-17 06:21:54.872647', 0, '11:51:52.838555', 26, '2025-03-17 06:15:32.604479', NULL),
(367, '2025-03-17', 'sanjeev.kumar@postiefs.com', '2025-03-17 07:53:10.194530', 352.0309998989105, '2025-03-17 07:53:12.263749', 1, '07:53:10.194530', 26, NULL, NULL),
(368, '2025-03-17', 'sanjeev.kumar@postiefs.com', '2025-03-17 07:58:12.279407', 654.1158776283264, '2025-03-17 07:58:14.309704', 1, '07:58:12.279407', 26, NULL, NULL),
(369, '2025-03-17', 'sanjeev.kumar@postiefs.com', '2025-03-17 08:03:14.319998', 956.1564683914185, '2025-03-17 08:03:16.400812', 1, '08:03:14.319998', 26, NULL, NULL),
(370, '2025-03-17', 'sanjeev.kumar@postiefs.com', '2025-03-17 08:08:16.409936', 1258.24640583992, '2025-03-17 08:08:18.454344', 1, '08:08:16.409936', 26, NULL, NULL),
(371, '2025-03-17', 'sanjeev.kumar@postiefs.com', '2025-03-17 08:13:18.462749', 1560.2992193698883, '2025-03-17 08:13:20.521757', 1, '08:13:18.462749', 26, NULL, NULL),
(372, '2025-03-17', 'sanjeev.kumar@postiefs.com', '2025-03-17 08:18:20.529790', 1862.3662598133087, '2025-03-17 08:18:22.607177', 1, '08:18:20.529790', 26, NULL, NULL),
(373, '2025-03-17', 'sanjeev.kumar@postiefs.com', '2025-03-17 08:23:22.615029', 2164.451499223709, '2025-03-17 08:23:24.701392', 1, '08:23:22.615029', 26, NULL, NULL),
(374, '2025-03-17', 'sanjeev.kumar@postiefs.com', '2025-03-17 08:26:24.712647', 2346.5491173267365, '2025-03-17 08:26:26.761208', 0, '13:56:24.712647', 26, '2025-03-17 07:47:18.163530', NULL),
(375, '2025-03-18', 'sanjeev.kumar@postiefs.com', '2025-03-18 04:41:56.031547', 317.34299993515015, '2025-03-18 04:41:58.111132', 1, '04:41:56.031547', 26, NULL, NULL),
(376, '2025-03-18', 'sanjeev.kumar@postiefs.com', '2025-03-18 04:46:58.121200', 619.4326529502869, '2025-03-18 04:47:00.163420', 1, '04:46:58.121200', 26, NULL, NULL),
(377, '2025-03-18', 'sanjeev.kumar@postiefs.com', '2025-03-18 04:48:00.172073', 681.4835259914398, '2025-03-18 04:48:02.241126', 0, '10:18:00.172073', 26, '2025-03-18 04:36:38.688548', NULL),
(378, '2025-03-18', 'sanjeev.kumar@postiefs.com', '2025-03-18 11:47:05.883211', 300.9849998950958, '2025-03-18 11:47:07.960870', 1, '11:47:05.883211', 26, NULL, 'PTPL-LAP-032'),
(379, '2025-03-18', 'sanjeev.kumar@postiefs.com', '2025-03-18 11:52:07.974149', 603.0759384632111, '2025-03-18 11:52:10.021881', 0, '17:22:07.974149', 26, '2025-03-18 11:42:04.898211', NULL),
(380, '2025-03-18', 'sanjeev.kumar@postiefs.com', '2025-03-18 12:08:45.465345', 339.17199993133545, '2025-03-18 12:08:47.507116', 1, '12:08:45.465345', 26, NULL, 'PTPL-LAP-032'),
(381, '2025-03-18', 'sanjeev.kumar@postiefs.com', '2025-03-18 12:10:47.520395', 461.2270493507385, '2025-03-18 12:10:49.556161', 0, '17:40:47.520395', 26, '2025-03-18 12:03:06.293346', 'PTPL-LAP-032'),
(382, '2025-03-18', 'sanjeev.kumar@postiefs.com', '2025-03-18 12:24:49.579702', 302.9690001010895, '2025-03-18 12:24:51.636551', 1, '12:24:49.579702', 26, NULL, 'PTPL-LAP-032'),
(383, '2025-03-18', 'sanjeev.kumar@postiefs.com', '2025-03-18 12:29:51.647460', 605.036758184433, '2025-03-18 12:29:53.705424', 1, '12:29:51.647460', 26, NULL, 'PTPL-LAP-032'),
(384, '2025-03-18', 'sanjeev.kumar@postiefs.com', '2025-03-18 12:31:53.717472', 727.1067705154419, '2025-03-18 12:31:55.753036', 0, '18:01:53.717472', 26, '2025-03-18 12:19:46.610702', 'PTPL-LAP-032'),
(385, '2025-03-19', 'sanjeev.kumar@postiefs.com', '2025-03-19 03:54:13.401528', 301.6559998989105, '2025-03-19 03:54:15.523558', 1, '03:54:13.401528', 26, NULL, 'PTPL-LAP-032'),
(386, '2025-03-19', 'sanjeev.kumar@postiefs.com', '2025-03-19 03:56:15.540228', 423.7946996688843, '2025-03-19 03:56:17.656066', 0, '09:26:15.540228', 26, '2025-03-19 03:49:11.745528', 'PTPL-LAP-032'),
(387, '2025-03-19', 'sanjeev.kumar@postiefs.com', '2025-03-19 04:10:17.687124', 331.78200006484985, '2025-03-19 04:10:19.738459', 1, '04:10:17.687124', 26, NULL, 'PTPL-LAP-032'),
(388, '2025-03-19', 'sanjeev.kumar@postiefs.com', '2025-03-19 04:13:19.744371', 513.8392469882965, '2025-03-19 04:13:21.797367', 0, '09:43:19.744371', 26, '2025-03-19 04:04:45.905124', 'PTPL-LAP-032'),
(389, '2025-03-28', 'sanjeev.kumar@postiefs.com', '2025-03-28 05:35:52.541914', 322.71799993515015, '2025-03-28 05:35:52.578486', 1, '05:35:52.541914', 26, NULL, 'PTPL-LAP-032'),
(390, '2025-03-28', 'sanjeev.kumar@postiefs.com', '2025-03-28 05:36:52.586289', 382.7623748779297, '2025-03-28 05:36:52.605200', 0, '11:06:52.586289', 26, '2025-03-28 05:30:29.823915', 'PTPL-LAP-032'),
(391, '2025-03-28', 'sanjeev.kumar@postiefs.com', '2025-03-28 12:41:07.273923', 301.57800006866455, '2025-03-28 12:41:07.355565', 1, '12:41:07.273923', 26, NULL, 'PTPL-LAP-032'),
(392, '2025-03-28', 'sanjeev.kumar@postiefs.com', '2025-03-28 12:43:05.955667', 420.2597441673279, '2025-03-28 12:43:06.002545', 0, '18:13:05.955667', 26, '2025-03-28 12:36:05.695924', 'PTPL-LAP-032'),
(393, '2025-03-28', 'sanjeev.kumar@postiefs.com', '2025-03-28 12:59:06.035224', 325.7660000324249, '2025-03-28 12:59:06.050893', 1, '12:59:06.035224', 26, NULL, 'PTPL-LAP-032'),
(394, '2025-03-28', 'sanjeev.kumar@postiefs.com', '2025-03-28 13:00:06.066562', 385.7973384857178, '2025-03-28 13:00:06.082718', 0, '18:30:06.066562', 26, '2025-03-28 12:53:40.269224', 'PTPL-LAP-032'),
(395, '2025-03-31', 'sanjeev.kumar@postiefs.com', '2025-03-31 12:36:35.203281', 347.5, '2025-03-31 12:36:35.291936', 1, '12:36:35.203281', 26, NULL, 'PTPL-LAP-032'),
(396, '2025-03-31', 'sanjeev.kumar@postiefs.com', '2025-03-31 12:36:37.400772', 349.70300006866455, '2025-03-31 12:36:37.422911', 1, '12:36:37.400772', 26, NULL, 'PTPL-LAP-032'),
(397, '2025-03-31', 'sanjeev.kumar@postiefs.com', '2025-03-31 12:37:35.311316', 407.6080355644226, '2025-03-31 12:37:35.342609', 0, '18:07:35.311316', 26, '2025-03-31 12:30:47.703281', 'PTPL-LAP-032'),
(398, '2025-03-31', 'sanjeev.kumar@postiefs.com', '2025-03-31 12:37:37.438221', 409.74044919013977, '2025-03-31 12:37:37.453852', 0, '18:07:37.438221', 26, '2025-03-31 12:30:47.697772', 'PTPL-LAP-032'),
(399, '2025-03-31', 'sanjeev.kumar@postiefs.com', '2025-03-31 13:19:35.411389', 342.875, '2025-03-31 13:19:35.439530', 1, '13:19:35.411389', 26, NULL, 'PTPL-LAP-032'),
(400, '2025-03-31', 'sanjeev.kumar@postiefs.com', '2025-03-31 13:19:37.538769', 345, '2025-03-31 13:19:37.560418', 1, '13:19:37.538769', 26, NULL, 'PTPL-LAP-032'),
(401, '2025-03-31', 'sanjeev.kumar@postiefs.com', '2025-03-31 13:21:35.458133', 462.9217438697815, '2025-03-31 13:21:35.473776', 0, '18:51:35.458133', 26, '2025-03-31 13:13:52.536389', 'PTPL-LAP-032'),
(402, '2025-03-31', 'sanjeev.kumar@postiefs.com', '2025-03-31 13:21:37.587719', 465.0489499568939, '2025-03-31 13:21:37.603350', 0, '18:51:37.587719', 26, '2025-03-31 13:13:52.538769', 'PTPL-LAP-032'),
(403, '2025-04-01', 'sanjeev.kumar@postiefs.com', '2025-04-01 04:30:26.290642', 327.56496834754944, '2025-04-01 04:30:26.371824', 1, '04:30:26.290642', 26, NULL, 'PTPL-LAP-032'),
(404, '2025-04-01', 'sanjeev.kumar@postiefs.com', '2025-04-01 04:30:28.246433', 329.5309998989105, '2025-04-01 04:30:28.277693', 1, '04:30:28.246433', 26, NULL, 'PTPL-LAP-032'),
(405, '2025-04-01', 'sanjeev.kumar@postiefs.com', '2025-04-01 04:35:26.391252', 627.6655783653259, '2025-04-01 04:35:26.416976', 1, '04:35:26.391252', 26, NULL, 'PTPL-LAP-032'),
(406, '2025-04-01', 'sanjeev.kumar@postiefs.com', '2025-04-01 04:35:28.299438', 629.584005355835, '2025-04-01 04:35:28.338241', 1, '04:35:28.299438', 26, NULL, 'PTPL-LAP-032'),
(407, '2025-04-01', 'sanjeev.kumar@postiefs.com', '2025-04-01 04:40:26.702846', 927.9771728515625, '2025-04-01 04:40:26.718480', 0, '10:10:26.702846', 26, '2025-04-01 04:24:58.725674', 'PTPL-LAP-032'),
(408, '2025-04-01', 'sanjeev.kumar@postiefs.com', '2025-04-01 04:40:28.350732', 929.6352994441986, '2025-04-01 04:40:28.366381', 0, '10:10:28.350732', 26, '2025-04-01 04:24:58.715433', 'PTPL-LAP-032');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `employee_call`
--
ALTER TABLE `employee_call`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_call_agent_id_6652b3ea_fk_auth_user_id` (`agent_id`),
  ADD KEY `employee_call_ticket_id_1501c788_fk_employee_ticket_id` (`ticket_id`);

--
-- Indexes for table `employee_callnote`
--
ALTER TABLE `employee_callnote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_callnote_agent_id_05c72b74_fk_auth_user_id` (`agent_id`);

--
-- Indexes for table `employee_clientcallnote`
--
ALTER TABLE `employee_clientcallnote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_clientcallnote_created_by_id_7349cb00_fk_auth_user_id` (`created_by_id`),
  ADD KEY `employee_clientcallnote_ticket_id_43e3beb7_fk_employee_ticket_id` (`ticket_id`);

--
-- Indexes for table `employee_dailyactivity`
--
ALTER TABLE `employee_dailyactivity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_dailyactivity_user_id_2f1ba67d_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `employee_employeeprofile`
--
ALTER TABLE `employee_employeeprofile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `employee_employeepro_reporting_manager_id_05252c28_fk_employee_` (`reporting_manager_id`);

--
-- Indexes for table `employee_newcallquery`
--
ALTER TABLE `employee_newcallquery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_newcallquery_agent_id_a2f082a3_fk_auth_user_id` (`agent_id`);

--
-- Indexes for table `employee_ondutyrequest`
--
ALTER TABLE `employee_ondutyrequest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_ondutyreque_approved_by_id_0dec23b7_fk_employee_` (`approved_by_id`),
  ADD KEY `employee_ondutyreque_employee_id_fb27a57d_fk_employee_` (`employee_id`);

--
-- Indexes for table `employee_sessionactivity`
--
ALTER TABLE `employee_sessionactivity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_sessionactivity_user_id_61e9171e_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `employee_ticket`
--
ALTER TABLE `employee_ticket`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_ticket_ticket_id_c100a934_uniq` (`ticket_id`),
  ADD KEY `employee_ticket_created_by_id_ffc4d110_fk_auth_user_id` (`created_by_id`),
  ADD KEY `employee_ticket_assigned_to_id_334775e6_fk_auth_user_id` (`assigned_to_id`),
  ADD KEY `employee_ticket_assigned_by_id_2bfbfa6e_fk_auth_user_id` (`assigned_by_id`),
  ADD KEY `employee_ticket_user_id_55bbb3ee_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `employee_tickethistory`
--
ALTER TABLE `employee_tickethistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_tickethistory_assigned_to_id_876e10e5_fk_auth_user_id` (`assigned_to_id`),
  ADD KEY `employee_tickethistory_ticket_id_fecac1d2_fk_employee_ticket_id` (`ticket_id`);

--
-- Indexes for table `employee_ticketnote`
--
ALTER TABLE `employee_ticketnote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_ticketnote_created_by_id_390be179_fk_auth_user_id` (`created_by_id`),
  ADD KEY `employee_ticketnote_ticket_id_a39fdeb8_fk_employee_ticket_id` (`ticket_id`);

--
-- Indexes for table `employee_unifiednotification`
--
ALTER TABLE `employee_unifiednotification`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_unifiednotifica_ticket_id_user_id_notifi_8f875615_uniq` (`ticket_id`,`user_id`,`notification_type`),
  ADD KEY `employee_unifiednotification_user_id_0ca5dc5e_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `employee_workreport`
--
ALTER TABLE `employee_workreport`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_workreport_user_id_45e7249b_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `text_improver_improvedtext`
--
ALTER TABLE `text_improver_improvedtext`
  ADD PRIMARY KEY (`id`),
  ADD KEY `text_improver_improvedtext_user_id_3c2cbc94_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `tracking_activityreport`
--
ALTER TABLE `tracking_activityreport`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tracking_activityreport_user_id_date_ff793f38_uniq` (`user_id`,`date`);

--
-- Indexes for table `tracking_useractivity`
--
ALTER TABLE `tracking_useractivity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tracking_useractivity_user_id_335dabd5_fk_auth_user_id` (`user_id`),
  ADD KEY `tracking_us_email_cc2120_idx` (`email`,`date`,`time_of_day`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=367;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `employee_call`
--
ALTER TABLE `employee_call`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT for table `employee_callnote`
--
ALTER TABLE `employee_callnote`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_clientcallnote`
--
ALTER TABLE `employee_clientcallnote`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `employee_dailyactivity`
--
ALTER TABLE `employee_dailyactivity`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT for table `employee_employeeprofile`
--
ALTER TABLE `employee_employeeprofile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `employee_newcallquery`
--
ALTER TABLE `employee_newcallquery`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `employee_ondutyrequest`
--
ALTER TABLE `employee_ondutyrequest`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employee_sessionactivity`
--
ALTER TABLE `employee_sessionactivity`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1021;

--
-- AUTO_INCREMENT for table `employee_ticket`
--
ALTER TABLE `employee_ticket`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `employee_tickethistory`
--
ALTER TABLE `employee_tickethistory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee_ticketnote`
--
ALTER TABLE `employee_ticketnote`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `employee_unifiednotification`
--
ALTER TABLE `employee_unifiednotification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `employee_workreport`
--
ALTER TABLE `employee_workreport`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `text_improver_improvedtext`
--
ALTER TABLE `text_improver_improvedtext`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tracking_activityreport`
--
ALTER TABLE `tracking_activityreport`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tracking_useractivity`
--
ALTER TABLE `tracking_useractivity`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=409;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `employee_call`
--
ALTER TABLE `employee_call`
  ADD CONSTRAINT `employee_call_agent_id_6652b3ea_fk_auth_user_id` FOREIGN KEY (`agent_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `employee_call_ticket_id_1501c788_fk_employee_ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `employee_ticket` (`id`);

--
-- Constraints for table `employee_callnote`
--
ALTER TABLE `employee_callnote`
  ADD CONSTRAINT `employee_callnote_agent_id_05c72b74_fk_auth_user_id` FOREIGN KEY (`agent_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `employee_clientcallnote`
--
ALTER TABLE `employee_clientcallnote`
  ADD CONSTRAINT `employee_clientcallnote_created_by_id_7349cb00_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `employee_clientcallnote_ticket_id_43e3beb7_fk_employee_ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `employee_ticket` (`id`);

--
-- Constraints for table `employee_dailyactivity`
--
ALTER TABLE `employee_dailyactivity`
  ADD CONSTRAINT `employee_dailyactivity_user_id_2f1ba67d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `employee_employeeprofile`
--
ALTER TABLE `employee_employeeprofile`
  ADD CONSTRAINT `employee_employeepro_reporting_manager_id_05252c28_fk_employee_` FOREIGN KEY (`reporting_manager_id`) REFERENCES `employee_employeeprofile` (`id`),
  ADD CONSTRAINT `employee_employeeprofile_user_id_d5e61f5c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `employee_newcallquery`
--
ALTER TABLE `employee_newcallquery`
  ADD CONSTRAINT `employee_newcallquery_agent_id_a2f082a3_fk_auth_user_id` FOREIGN KEY (`agent_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `employee_ondutyrequest`
--
ALTER TABLE `employee_ondutyrequest`
  ADD CONSTRAINT `employee_ondutyreque_approved_by_id_0dec23b7_fk_employee_` FOREIGN KEY (`approved_by_id`) REFERENCES `employee_employeeprofile` (`id`),
  ADD CONSTRAINT `employee_ondutyreque_employee_id_fb27a57d_fk_employee_` FOREIGN KEY (`employee_id`) REFERENCES `employee_employeeprofile` (`id`);

--
-- Constraints for table `employee_sessionactivity`
--
ALTER TABLE `employee_sessionactivity`
  ADD CONSTRAINT `employee_sessionactivity_user_id_61e9171e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `employee_ticket`
--
ALTER TABLE `employee_ticket`
  ADD CONSTRAINT `employee_ticket_assigned_by_id_2bfbfa6e_fk_auth_user_id` FOREIGN KEY (`assigned_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `employee_ticket_assigned_to_id_334775e6_fk_auth_user_id` FOREIGN KEY (`assigned_to_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `employee_ticket_created_by_id_ffc4d110_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `employee_ticket_user_id_55bbb3ee_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `employee_tickethistory`
--
ALTER TABLE `employee_tickethistory`
  ADD CONSTRAINT `employee_tickethistory_assigned_to_id_876e10e5_fk_auth_user_id` FOREIGN KEY (`assigned_to_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `employee_tickethistory_ticket_id_fecac1d2_fk_employee_ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `employee_ticket` (`id`);

--
-- Constraints for table `employee_ticketnote`
--
ALTER TABLE `employee_ticketnote`
  ADD CONSTRAINT `employee_ticketnote_created_by_id_390be179_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `employee_ticketnote_ticket_id_a39fdeb8_fk_employee_ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `employee_ticket` (`id`);

--
-- Constraints for table `employee_unifiednotification`
--
ALTER TABLE `employee_unifiednotification`
  ADD CONSTRAINT `employee_unifiednoti_ticket_id_1518a5ab_fk_employee_` FOREIGN KEY (`ticket_id`) REFERENCES `employee_ticket` (`id`),
  ADD CONSTRAINT `employee_unifiednotification_user_id_0ca5dc5e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `employee_workreport`
--
ALTER TABLE `employee_workreport`
  ADD CONSTRAINT `employee_workreport_user_id_45e7249b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `text_improver_improvedtext`
--
ALTER TABLE `text_improver_improvedtext`
  ADD CONSTRAINT `text_improver_improvedtext_user_id_3c2cbc94_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `tracking_activityreport`
--
ALTER TABLE `tracking_activityreport`
  ADD CONSTRAINT `tracking_activityreport_user_id_701d4ec1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `tracking_useractivity`
--
ALTER TABLE `tracking_useractivity`
  ADD CONSTRAINT `tracking_useractivity_user_id_335dabd5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
