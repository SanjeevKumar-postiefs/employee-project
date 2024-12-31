-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2024 at 11:42 AM
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
(68, 'Can view call status', 17, 'view_callstatus');

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
(12, 'pbkdf2_sha256$600000$B2QQOVRcndLTvC5i2GDwYj$Ql7Shjmra+2rsNTQPLwnzla28oUxJ109NV7hBVt/EZE=', '2024-11-29 06:24:45.382286', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2024-10-25 09:04:39.482323'),
(13, 'pbkdf2_sha256$600000$f8DmTqWfeOGbTm72fd5pAb$muim+iKMHt4IGxwssxjMUdkVcytUSFNDyQSmqulHenE=', '2024-12-06 10:28:43.210373', 0, 'sanjeev', 'sanjeev', 'kumar', 'sanjeev@gmail.com', 0, 1, '2024-10-25 09:35:53.197315'),
(14, 'pbkdf2_sha256$600000$9lThxBjICjJ4OyVvBVHWts$fAXrWQhLT+V4gf0B+N6/h9PNa9PktSdamBNzaDaazag=', '2024-12-31 10:05:50.676710', 0, 'Ajil', 'Ajil', 'TU', 'ajil@gmail.com', 0, 1, '2024-10-25 09:38:10.503884'),
(15, 'pbkdf2_sha256$600000$pZ3F32yjPfSpXFAsaVaIfX$TX1DaGyKSpLt7CXQ4Zb14FvpPxAPFF78o4Dh+WYQRks=', '2024-11-18 10:50:04.740806', 0, 'Jayamohan', 'Jayamohan', 'x', 'jayamohan@gmail.com', 0, 1, '2024-10-25 10:57:17.559935'),
(16, 'pbkdf2_sha256$600000$RmmQaw7LOqBnvTF00zMvoR$9Zh0gyPknaXFnzcWaYT8a7zZMbx6Kn0xNa3D7XZWvPk=', '2024-10-30 03:40:21.940231', 0, 'Georgy', 'Georgy', 'Cheriyan', 'Georgy@gmail.com', 0, 1, '2024-10-28 06:58:42.078089'),
(17, 'pbkdf2_sha256$600000$pCIXsYCDKtCUWJ9oFE5UVx$QQRyWznGi7iG9nKIWUt8kdoCB2afDa4zgSJOmzyFlN4=', '2024-12-31 09:50:17.208371', 0, 'jobin', 'jobin', 'ps', 'jobin@gmail.com', 0, 1, '2024-10-29 05:46:56.459314'),
(18, 'pbkdf2_sha256$600000$VOGstnPjqJROKoQlMpLUAr$Z/skEG1BQUYK4yxAPvPJwSFvjfXtxsR8hl0V0kvBpfs=', '2024-12-12 11:03:14.760213', 0, 'didith', 'didith', 'antony', 'didith@gmail.com', 0, 1, '2024-10-29 05:48:06.536978'),
(23, 'pbkdf2_sha256$600000$t7ObAVGZGE0Z4dvZjdmCgf$e5WqOrVXtk78D2N65gpUGcjo2IUgWK2KKaXrrReYB3I=', NULL, 0, 'manuel', 'manuel', 'sijo', 'manuel@gmail.com', 0, 1, '2024-10-29 06:05:37.039900');

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
(14, '2024-10-29 06:04:45.583087', '21', 'manuel', 3, '', 6, 12);

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
(7, 'contenttypes', 'contenttype'),
(16, 'employee', 'call'),
(15, 'employee', 'callnote'),
(17, 'employee', 'callstatus'),
(12, 'employee', 'dailyactivity'),
(1, 'employee', 'employeeprofile'),
(14, 'employee', 'notification'),
(10, 'employee', 'session'),
(13, 'employee', 'sessionactivity'),
(2, 'employee', 'ticket'),
(9, 'employee', 'tickethistory'),
(11, 'employee', 'useractivity'),
(8, 'sessions', 'session');

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
(75, 'employee', '0031_ticket_break_duration_ticket_last_break_time', '2024-12-30 10:32:02.312662');

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
('emhlyq9her12hfk7bc08qiwwx9bpa4at', '.eJxVjssOgjAQRf-lW6WZPmyHLt27c0-mL0EJJFBMjPHfhYSFbs89Oblv1tBS2maZ09R0kTkmLDv-Qk_hkYZtiXcabiMP41CmzvNN4fs688sYU3_e3b9AS3O7dSWGGrxGq2xCj5iNScasLBgkr2IW-YQos86WRCCpBNbRm2gV6UDbq57m0lAo3bMrrzUpQepKiArsFYwD6UBxNHWt9QHAAbDPF5_yRQw:1t8val:Jl5nc8oJcg8lQpuuOXCwxpQ4Y5HTRmlDIRYycYnfr_w', '2024-11-07 06:17:03.891487'),
('f70uclmajpsabpi3jkw6d79zhlyxgw4m', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1t8a8G:nFu3BP1aOtucBx6trK1D-fQnkKlmD23fcobNmN1Jcic', '2024-11-06 07:17:12.595735'),
('fjtyovyewqrfh7qta3f8ets4zd6glkwl', '.eJxVjM0OwiAQhN-FsyGFbvnx6N1nILuwSNXQpLQn47srSQ96m8z3zbxEwH0rYW-8hjmJs1AgTr8lYXxw7STdsd4WGZe6rTPJrsiDNnldEj8vh_t3ULCV73rwSqFll6YM1itiwsFZmydWI2PWJvIIzivIBhAogdM9GdIxGSQU7w8LmziX:1tSZ8I:4IWbB9IvFsdZSAr9JPdYQXw_rHFmXh1DaNLDIPzj3AE', '2025-01-14 10:05:50.698268'),
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
  `call_duration` bigint(20) NOT NULL,
  `call_note` longtext DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `ticket_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_call`
--

INSERT INTO `employee_call` (`id`, `call_start_time`, `call_end_time`, `call_duration`, `call_note`, `agent_id`, `ticket_id`) VALUES
(1, '2024-12-12 11:36:43.121607', '2024-12-12 11:36:46.004609', 2883002, NULL, 14, 65),
(2, '2024-12-12 11:44:09.875970', '2024-12-12 11:44:12.640612', 2764642, 'bug fix', 14, 65),
(3, '2024-12-12 11:45:04.014145', '2024-12-12 11:45:08.073252', 4059107, NULL, 14, 65),
(4, '2024-12-12 11:52:44.998819', '2024-12-12 11:52:49.445666', 4446847, NULL, 14, 65),
(5, '2024-12-12 11:53:06.591212', '2024-12-12 11:53:10.073101', 3481889, NULL, 14, 65),
(6, '2024-12-12 11:57:28.104298', '2024-12-12 11:57:30.902298', 2798000, NULL, 14, 65),
(7, '2024-12-12 11:57:34.477281', '2024-12-12 11:57:37.555817', 3078536, NULL, 14, 65),
(8, '2024-12-12 12:04:41.066129', '2024-12-12 12:04:43.750234', 2684105, NULL, 14, 63),
(9, '2024-12-12 12:04:48.248651', '2024-12-12 12:04:50.399960', 2151309, 'script', 14, 63),
(10, '2024-12-12 12:15:30.151728', '2024-12-12 12:15:34.355211', 4203483, NULL, 14, 65),
(11, '2024-12-12 12:15:38.161256', '2024-12-12 12:15:40.384637', 2223381, NULL, 14, 65),
(12, '2024-12-12 12:15:48.616850', '2024-12-12 12:15:51.318874', 2702024, NULL, 14, 65),
(13, '2024-12-12 12:17:07.646330', '2024-12-12 12:17:09.434146', 1787816, 'error', 14, 63),
(14, '2024-12-12 12:28:13.616946', '2024-12-12 12:28:16.261776', 2644830, NULL, 14, 65),
(15, '2024-12-12 12:29:06.894424', '2024-12-12 12:29:09.017617', 2123193, NULL, 14, 65),
(16, '2024-12-12 12:32:51.514140', NULL, 0, NULL, 14, 65),
(17, '2024-12-13 04:19:28.730876', '2024-12-13 04:19:33.312979', 4582103, NULL, 14, 65),
(18, '2024-12-13 04:19:38.541120', '2024-12-13 04:19:42.299914', 3758794, NULL, 14, 65),
(19, '2024-12-13 04:22:03.122506', '2024-12-13 04:22:06.316162', 3193656, 'note1', 14, 65),
(20, '2024-12-13 04:49:01.232576', '2024-12-13 04:49:22.902642', 21670066, 'end call corrected', 14, 65),
(21, '2024-12-13 04:51:41.420906', '2024-12-13 04:51:56.246503', 14825597, 'status pending', 14, 63),
(22, '2024-12-13 04:52:00.844817', '2024-12-13 04:52:25.961586', 25116769, 'status open', 14, 63),
(23, '2024-12-13 05:04:13.076148', '2024-12-13 05:15:52.793607', 699717459, 'open', 14, 63),
(24, '2024-12-13 05:16:06.282921', '2024-12-13 05:16:16.947603', 10664682, 'pending', 14, 65),
(25, '2024-12-13 05:16:51.480990', '2024-12-13 05:17:20.896403', 29415413, 'open', 14, 65),
(26, '2024-12-13 05:22:33.401344', '2024-12-13 05:28:06.198726', 332797382, 'pending', 14, 65),
(27, '2024-12-13 05:28:18.387605', '2024-12-13 05:28:33.067291', 14679686, 'open', 14, 65),
(28, '2024-12-13 05:37:26.823138', '2024-12-13 05:37:45.099069', 18275931, 'customer waiting', 14, 65),
(29, '2024-12-13 05:37:48.709939', '2024-12-13 05:38:11.336130', 22626191, 'status', 14, 65),
(30, '2024-12-13 05:42:04.464320', '2024-12-13 05:42:13.477269', 9012949, '', 14, 65),
(31, '2024-12-13 06:09:02.308837', '2024-12-13 06:13:03.177079', 240868242, 'error', 14, 65),
(32, '2024-12-13 06:13:37.196586', '2024-12-13 06:14:00.594491', 23397905, 'initial response', 14, 63),
(33, '2024-12-13 06:24:28.804724', '2024-12-13 06:24:38.190108', 9385384, '', 14, 63),
(34, '2024-12-13 06:34:38.780708', '2024-12-13 06:34:48.967796', 10187088, 'pending', 14, 65),
(35, '2024-12-13 06:34:52.323102', '2024-12-13 06:35:17.202712', 24879610, 'customer', 14, 63),
(36, '2024-12-13 06:38:25.341193', '2024-12-13 06:38:52.355075', 27013882, 'initial', 14, 65),
(37, '2024-12-13 06:47:14.570291', '2024-12-13 06:47:37.439721', 22869430, 'customer', 14, 65),
(38, '2024-12-13 06:48:45.230191', '2024-12-13 06:49:09.692722', 24462531, 'status change', 17, 66),
(39, '2024-12-13 06:50:48.012549', '2024-12-13 06:51:03.968099', 15955550, 'customer', 17, 66),
(40, '2024-12-13 06:54:22.635510', '2024-12-13 06:54:45.701302', 23065792, 'initial response', 17, 66),
(41, '2024-12-13 06:56:31.239610', '2024-12-13 06:56:45.678007', 14438397, 'p', 17, 66),
(42, '2024-12-13 06:58:17.915931', '2024-12-13 06:58:56.187294', 38271363, 'x', 17, 66),
(43, '2024-12-13 07:30:45.814601', '2024-12-13 07:30:59.162293', 13347692, 'pending', 14, 65),
(44, '2024-12-13 07:32:29.656688', '2024-12-13 07:32:44.047171', 14390483, 'x', 14, 63),
(45, '2024-12-13 07:40:53.677672', '2024-12-13 07:41:07.944732', 14267060, 'open', 14, 65),
(46, '2024-12-13 07:45:13.315132', '2024-12-13 07:45:25.944801', 12629669, 'x', 14, 63),
(47, '2024-12-13 07:46:09.440466', '2024-12-13 07:57:41.174571', 691734105, 'x', 14, 63),
(48, '2024-12-13 07:57:45.749684', '2024-12-13 08:02:57.550989', 311801305, 'z', 14, 63),
(49, '2024-12-13 08:03:13.259343', '2024-12-13 08:03:31.611138', 18351795, 'w', 14, 63),
(50, '2024-12-13 08:03:37.344588', '2024-12-13 08:03:59.993241', 22648653, 's', 14, 63),
(51, '2024-12-13 08:04:24.899614', '2024-12-13 08:06:07.446904', 102547290, 'p', 14, 63),
(52, '2024-12-13 08:06:10.763576', '2024-12-13 08:06:39.684031', 28920455, 'p', 14, 65),
(53, '2024-12-13 08:06:42.966420', '2024-12-13 08:07:01.308042', 18341622, 'i', 14, 65),
(54, '2024-12-13 08:53:55.116478', '2024-12-13 08:54:16.401359', 21284881, 'call check', 14, 65),
(55, '2024-12-13 09:02:07.278450', '2024-12-13 09:02:26.681912', 19403462, 'p', 14, 65),
(56, '2024-12-13 09:02:30.031450', '2024-12-13 09:02:42.577321', 12545871, 'w', 14, 65),
(57, '2024-12-13 09:21:20.025477', '2024-12-13 09:23:11.145343', 111119866, 'c', 14, 65),
(58, '2024-12-13 09:23:24.829363', '2024-12-13 09:23:56.218480', 31389117, 'q', 14, 63),
(59, '2024-12-13 09:31:55.914073', '2024-12-13 09:33:09.244522', 73330449, 'p', 14, 65),
(60, '2024-12-13 09:33:24.058364', '2024-12-13 09:34:06.258616', 42200252, 'w', 14, 63),
(61, '2024-12-13 09:37:19.899608', '2024-12-13 09:39:04.863094', 104963486, 'in', 14, 65),
(62, '2024-12-13 09:39:20.112478', '2024-12-13 09:46:09.294148', 409181670, 'p', 14, 65),
(63, '2024-12-13 09:48:54.957784', '2024-12-13 09:56:32.480323', 457522539, 's', 14, 65),
(64, '2024-12-13 09:55:18.926714', '2024-12-13 09:56:42.279244', 83352530, 'p', 14, 63),
(65, '2024-12-13 09:57:23.448467', '2024-12-13 10:00:00.126834', 156678367, 'x', 14, 65),
(66, '2024-12-13 10:05:04.655900', '2024-12-13 10:05:16.689143', 12033243, 'o', 14, 65),
(67, '2024-12-13 10:09:11.514276', '2024-12-13 10:09:28.127031', 16612755, 'p', 14, 63),
(68, '2024-12-13 10:13:08.088611', '2024-12-13 10:13:22.759064', 14670453, 'ndjwjd', 14, 63),
(69, '2024-12-13 10:16:05.325549', '2024-12-13 10:16:45.374338', 40048789, 'i', 17, 66),
(70, '2024-12-13 12:06:40.140165', '2024-12-13 12:07:02.422318', 22282153, 'p', 14, 65),
(71, '2024-12-13 12:07:04.543030', '2024-12-13 12:07:25.238401', 20695371, 'w', 14, 63),
(72, '2024-12-13 12:08:39.080310', '2024-12-13 12:08:57.983620', 18903310, 'pending', 14, 65),
(73, '2024-12-13 12:09:20.631715', '2024-12-13 12:09:44.348631', 23716916, 'waiting', 14, 63),
(74, '2024-12-13 12:10:19.450755', '2024-12-13 12:11:50.092472', 90641717, '', 14, 63),
(75, '2024-12-13 12:12:51.722805', '2024-12-13 12:13:04.239234', 12516429, 's', 14, 65),
(76, '2024-12-13 12:39:02.628941', '2024-12-13 12:39:26.413223', 23784282, 'done', 14, 65),
(77, '2024-12-13 12:40:34.592063', '2024-12-13 12:40:56.291240', 21699177, 'done', 14, 63),
(78, '2024-12-17 03:53:18.466142', '2024-12-17 03:53:39.897663', 21431521, 'still pending', 14, 65),
(79, '2024-12-17 05:55:26.117569', '2024-12-17 05:55:44.366813', 18249244, 'call note 1', 14, 63),
(80, '2024-12-18 09:50:00.082260', '2024-12-18 09:50:15.570692', 15488432, 'noted', 14, 65),
(81, '2024-12-18 09:52:29.097957', '2024-12-18 09:52:58.764436', 29666479, '', 17, 66),
(82, '2024-12-19 05:32:27.969334', '2024-12-19 05:33:09.164365', 41195031, 'described', 17, 66),
(83, '2024-12-19 05:48:42.969811', '2024-12-19 06:03:02.211897', 859242086, NULL, 14, 65),
(84, '2024-12-19 06:18:04.917509', '2024-12-19 06:18:06.854530', 1937021, NULL, 14, 63),
(85, '2024-12-19 06:19:27.623337', '2024-12-19 06:19:35.998498', 8375161, 'bad request', 14, 65),
(86, '2024-12-19 06:21:25.490491', '2024-12-19 06:21:43.731940', 18241449, 'described', 14, 65),
(87, '2024-12-19 06:28:04.818623', '2024-12-19 06:28:13.959683', 9141060, 'check', 14, 65),
(88, '2024-12-19 06:31:28.429502', '2024-12-19 06:33:13.083491', 104653989, 'print', 14, 65),
(89, '2024-12-19 06:34:13.433396', '2024-12-19 06:34:46.694844', 33261448, 'true', 14, 63),
(90, '2024-12-19 06:45:04.642822', '2024-12-19 06:57:39.830880', 755188058, 'ss', 14, 65),
(91, '2024-12-19 06:57:54.603090', '2024-12-19 07:12:47.202070', 892598980, 'vdtqf', 14, 63),
(92, '2024-12-19 07:12:58.610153', '2024-12-19 07:13:11.616598', 13006445, '123', 14, 65),
(93, '2024-12-19 07:13:28.690398', '2024-12-19 07:13:52.273016', 23582618, '234', 14, 65),
(94, '2024-12-19 09:19:18.035363', '2024-12-19 09:19:28.952884', 10917521, '1', 14, 65),
(95, '2024-12-20 04:33:48.611159', '2024-12-20 04:34:03.063087', 14451928, 'okay', 14, 65),
(96, '2024-12-20 05:01:42.253268', '2024-12-20 05:05:41.255397', 239002129, NULL, 14, 65),
(97, '2024-12-20 05:05:51.053134', '2024-12-20 05:16:58.453889', 667400755, '00', 14, 65),
(98, '2024-12-20 05:49:12.231515', '2024-12-20 05:49:53.112237', 40880722, 'dd', 17, 66),
(99, '2024-12-20 05:50:18.996117', '2024-12-20 05:50:40.580615', 21584498, 'r', 17, 66),
(100, '2024-12-20 05:51:25.576223', '2024-12-20 05:51:38.926732', 13350509, 'w', 17, 66),
(101, '2024-12-20 05:53:52.782934', '2024-12-20 05:58:03.761023', 250978089, 'ZZ', 17, 61),
(102, '2024-12-20 06:00:43.883782', '2024-12-20 06:03:09.423116', 145539334, 'r', 17, 66),
(103, '2024-12-20 06:57:39.852026', '2024-12-20 06:57:44.713095', 4861069, 'd', 14, 65),
(104, '2024-12-27 11:52:58.872243', '2024-12-27 11:53:14.923258', 16051015, 'yufrsjh', 14, 66),
(105, '2024-12-30 06:03:12.194551', NULL, 0, NULL, 17, 65),
(106, '2024-12-30 06:06:08.791099', '2024-12-30 06:06:25.976437', 17185338, 'pending', 17, 65),
(107, '2024-12-30 06:29:21.799742', '2024-12-30 06:29:54.657576', 32857834, 'test', 17, 65),
(108, '2024-12-30 06:32:08.153167', '2024-12-30 06:32:39.659006', 31505839, 'testing', 14, 66),
(109, '2024-12-30 06:34:35.366064', '2024-12-30 06:34:58.273459', 22907395, 'x', 14, 66),
(110, '2024-12-30 06:55:59.454376', '2024-12-30 06:56:25.801352', 26346976, 'x', 14, 66);

-- --------------------------------------------------------

--
-- Table structure for table `employee_callnote`
--

CREATE TABLE `employee_callnote` (
  `id` bigint(20) NOT NULL,
  `client_email` varchar(254) NOT NULL,
  `note` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `agent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_dailyactivity`
--

INSERT INTO `employee_dailyactivity` (`id`, `date`, `login_time`, `logout_time`, `break_duration`, `total_work_time`, `user_id`) VALUES
(22, '2024-11-15', '2024-11-15 12:00:15.681512', '2024-11-15 12:01:36.251115', 0, 0, 14),
(23, '2024-11-15', '2024-11-15 11:35:17.413025', '2024-11-15 11:59:45.239269', 0, 2912798802, 13),
(24, '2024-11-15', '2024-11-15 11:10:30.648416', '2024-11-15 11:16:21.498169', 0, 0, 17),
(25, '2024-11-15', '2024-11-15 09:27:21.224168', '2024-11-15 09:57:01.503153', 0, 0, 15),
(26, '2024-11-15', '2024-11-15 12:01:56.584781', '2024-11-15 12:07:54.379894', 0, 0, 18),
(27, '2024-11-18', '2024-11-18 12:00:13.431078', '2024-11-18 12:20:41.768418', 0, 0, 13),
(28, '2024-11-18', '2024-11-18 11:58:27.308584', '2024-11-18 12:21:00.732723', 0, 0, 14),
(29, '2024-11-18', '2024-11-18 10:50:04.744594', '2024-11-18 12:00:05.742107', 0, 0, 15),
(30, '2024-11-18', '2024-11-18 10:34:56.267280', '2024-11-18 10:49:16.665536', 0, 0, 17),
(31, '2024-11-18', '2024-11-18 10:49:25.361358', '2024-11-18 10:49:56.101977', 0, 0, 18),
(32, '2024-11-19', '2024-11-19 08:58:59.061452', '2024-11-19 11:32:28.917490', 0, 0, 17),
(33, '2024-11-19', '2024-11-19 04:20:52.666926', '2024-11-19 05:09:12.578984', 0, 0, 13),
(34, '2024-11-19', '2024-11-19 11:27:23.020808', '2024-11-19 11:57:57.665629', 0, 0, 14),
(35, '2024-11-20', '2024-11-20 04:19:39.186599', NULL, 0, 0, 14),
(36, '2024-11-20', '2024-11-20 05:03:40.539411', '2024-11-20 05:03:54.697104', 0, 0, 17),
(37, '2024-11-27', '2024-11-27 11:44:12.120498', '2024-11-27 11:46:28.107136', 0, 0, 14),
(38, '2024-11-27', '2024-11-27 11:19:26.815963', NULL, 0, 0, 17),
(39, '2024-11-27', '2024-11-27 05:04:14.635107', '2024-11-27 05:14:11.987468', 0, 0, 18),
(40, '2024-11-28', '2024-11-28 08:15:43.586702', '2024-11-28 10:25:30.926469', 0, 0, 14),
(41, '2024-11-28', '2024-11-28 10:25:38.700123', '2024-11-28 12:36:23.913623', 0, 0, 17),
(42, '2024-11-29', '2024-11-29 11:09:29.994659', NULL, 0, 0, 14),
(43, '2024-11-29', '2024-11-29 06:10:26.186842', '2024-11-29 06:11:05.463151', 0, 0, 13),
(44, '2024-11-29', '2024-11-29 06:24:45.498672', '2024-11-29 06:26:07.886812', 0, 0, 12),
(45, '2024-11-29', '2024-11-29 11:20:35.245218', NULL, 0, 0, 17),
(46, '2024-12-03', '2024-12-03 05:38:56.674969', '2024-12-03 06:41:16.247966', 0, 0, 17),
(47, '2024-12-03', '2024-12-03 12:37:52.878749', NULL, 0, 0, 14),
(48, '2024-12-03', '2024-12-03 10:08:56.613999', '2024-12-03 12:15:33.288279', 0, 0, 18),
(49, '2024-12-04', '2024-12-04 11:22:55.092028', '2024-12-04 12:31:58.186046', 0, 0, 14),
(50, '2024-12-04', '2024-12-04 11:23:09.586447', '2024-12-04 12:31:49.956544', 0, 0, 17),
(51, '2024-12-04', '2024-12-04 10:36:53.383957', '2024-12-04 10:37:06.609260', 0, 0, 18),
(52, '2024-12-05', '2024-12-05 10:53:51.940613', NULL, 0, 0, 14),
(53, '2024-12-05', '2024-12-05 08:59:45.451247', '2024-12-05 10:51:29.894307', 0, 0, 17),
(54, '2024-12-06', '2024-12-06 10:20:54.026887', '2024-12-06 11:55:05.284660', 0, 0, 14),
(55, '2024-12-06', '2024-12-06 12:04:46.130285', '2024-12-06 12:40:45.021171', 0, 0, 17),
(56, '2024-12-06', '2024-12-06 10:28:43.225434', '2024-12-06 10:56:00.255512', 0, 0, 13),
(57, '2024-12-09', '2024-12-09 12:54:04.281344', '2024-12-09 12:56:44.045345', 0, 0, 14),
(58, '2024-12-09', '2024-12-09 12:37:34.647854', '2024-12-09 12:51:13.011195', 0, 0, 17),
(59, '2024-12-09', '2024-12-09 12:33:19.550835', '2024-12-09 12:34:21.721077', 0, 0, 18),
(60, '2024-12-10', '2024-12-10 13:19:00.833772', '2024-12-10 13:22:08.221961', 0, 0, 17),
(61, '2024-12-10', '2024-12-10 13:14:15.441608', '2024-12-10 13:14:52.858509', 0, 0, 14),
(62, '2024-12-10', '2024-12-10 09:04:06.695341', '2024-12-10 10:03:20.381994', 0, 0, 18),
(63, '2024-12-11', '2024-12-11 11:43:37.229139', NULL, 0, 0, 14),
(64, '2024-12-12', '2024-12-12 12:35:50.137412', NULL, 0, 0, 14),
(65, '2024-12-12', '2024-12-12 11:02:50.352746', '2024-12-12 11:03:08.316733', 0, 0, 17),
(66, '2024-12-12', '2024-12-12 11:03:14.762231', '2024-12-12 11:32:46.584850', 0, 0, 18),
(67, '2024-12-13', '2024-12-13 12:06:36.157483', '2024-12-13 12:49:02.076362', 0, 0, 14),
(68, '2024-12-13', '2024-12-13 10:15:54.621773', '2024-12-13 10:17:53.605410', 0, 0, 17),
(69, '2024-12-17', '2024-12-17 05:46:22.118999', '2024-12-17 08:58:48.635705', 0, 0, 14),
(70, '2024-12-17', '2024-12-17 08:58:55.811067', '2024-12-17 12:48:06.295963', 0, 0, 17),
(71, '2024-12-18', '2024-12-18 12:22:49.088282', NULL, 0, 0, 14),
(72, '2024-12-18', '2024-12-18 12:23:01.203301', NULL, 0, 0, 17),
(73, '2024-12-19', '2024-12-19 09:19:15.702590', '2024-12-19 12:46:14.451048', 0, 0, 14),
(74, '2024-12-19', '2024-12-19 06:58:22.461744', NULL, 0, 0, 17),
(75, '2024-12-20', '2024-12-20 11:21:56.784100', '2024-12-20 12:59:05.940411', 0, 0, 14),
(76, '2024-12-20', '2024-12-20 11:29:05.516554', '2024-12-20 12:59:11.669723', 0, 0, 17),
(77, '2024-12-23', '2024-12-23 10:15:17.517122', '2024-12-23 12:54:14.358585', 0, 0, 14),
(78, '2024-12-23', '2024-12-23 10:15:49.517025', '2024-12-23 12:54:04.261306', 0, 0, 17),
(79, '2024-12-24', '2024-12-24 05:08:10.549143', '2024-12-24 07:51:37.481683', 0, 0, 14),
(80, '2024-12-24', '2024-12-24 07:51:47.504232', '2024-12-24 12:38:25.508008', 0, 0, 17),
(81, '2024-12-27', '2024-12-27 11:48:20.103334', '2024-12-27 11:54:10.304613', 0, 0, 14),
(82, '2024-12-27', '2024-12-27 11:54:16.683855', '2024-12-27 12:32:44.097676', 0, 0, 17),
(83, '2024-12-30', '2024-12-30 10:32:29.516254', '2024-12-30 12:36:14.416217', 0, 0, 14),
(84, '2024-12-30', '2024-12-30 06:56:55.387797', '2024-12-30 09:13:23.159053', 0, 0, 17),
(85, '2024-12-31', '2024-12-31 10:05:50.679775', NULL, 0, 0, 14),
(86, '2024-12-31', '2024-12-31 09:50:17.208371', '2024-12-31 09:50:24.659537', 0, 0, 17);

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
  `promoted_to_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_employeeprofile`
--

INSERT INTO `employee_employeeprofile` (`id`, `level`, `skill`, `is_admin`, `user_id`, `status`, `total_time`, `is_active`, `is_on_break`, `promoted_to_admin`) VALUES
(9, '', '', 0, 12, 'offline', 0, 0, 0, 0),
(10, '', '', 1, 13, 'offline', 0, 0, 0, 0),
(11, '1', 'Windows', 0, 14, 'offline', 0, 1, 0, 0),
(12, '1', 'Windows', 0, 15, 'offline', 0, 0, 0, 0),
(13, '1', 'Linux', 1, 16, 'offline', 0, 0, 0, 0),
(14, '1', 'Windows', 0, 17, 'offline', 0, 0, 0, 0),
(15, '1', 'Linux', 0, 18, 'offline', 0, 0, 0, 0),
(16, '1', 'Linux', 1, 23, 'offline', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee_notification`
--

CREATE TABLE `employee_notification` (
  `id` bigint(20) NOT NULL,
  `message` longtext NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_notification`
--

INSERT INTO `employee_notification` (`id`, `message`, `is_read`, `created_at`, `user_id`) VALUES
(1, 'Ticket with ID: 100200 has been assigned to you.', 1, '2024-12-04 10:37:35.220646', 14),
(2, 'Ticket with ID: 100200 has been assigned to you.', 1, '2024-12-04 10:38:40.302733', 17),
(3, 'Ticket with ID: 100200 has been assigned to you.', 1, '2024-12-04 10:48:54.488634', 14),
(4, 'Ticket with ID: 100200 has been assigned to you.', 1, '2024-12-04 10:57:39.042834', 17),
(5, 'Ticket with ID: 100200 has been assigned to you.', 1, '2024-12-04 11:10:52.246460', 14),
(6, 'Ticket with ID: 100200 has been assigned to you.', 1, '2024-12-04 11:11:25.431782', 17),
(7, 'Ticket with ID: 111221 has been assigned to you.', 1, '2024-12-04 11:11:34.427962', 17),
(8, 'Ticket with ID: 111221 has been assigned to you.', 1, '2024-12-04 11:12:10.709489', 14),
(9, 'Ticket with ID: 100200 has been assigned to you.', 1, '2024-12-04 11:23:31.161640', 14),
(10, 'Ticket with ID: 100200 has been assigned to you.', 1, '2024-12-05 05:22:22.963069', 17),
(11, 'Ticket with ID: 100200 has been assigned to you.', 1, '2024-12-06 10:21:11.399665', 14),
(12, 'Ticket with ID: 100200 has been assigned to you.', 1, '2024-12-06 10:57:11.059107', 17),
(13, 'Ticket with ID: 100200 has been assigned to you.', 1, '2024-12-27 06:14:07.850550', 14),
(14, 'Ticket with ID: 111221 has been assigned to you.', 1, '2024-12-27 06:19:18.505252', 17);

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
(433, '2024-12-31', '2024-12-31 10:05:50.679775', NULL, 5448476, 10041944, 14, NULL);

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
  `last_break_time` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_ticket`
--

INSERT INTO `employee_ticket` (`id`, `subject`, `status`, `group`, `created_at`, `created_by_id`, `assigned_to_id`, `updated_at`, `note`, `assigned_by_id`, `user_id`, `ticket_id`, `assigned_at`, `time_spent`, `work_start_time`, `is_active`, `priority`, `call_duration`, `call_end_time`, `call_note`, `call_start_time`, `call_in_progress`, `call_timer_started_by_call`, `individual_time_spent`, `break_duration`, `last_break_time`) VALUES
(53, 'testing ticket 1', 'open', 'Windows', '2024-11-08 09:49:06.800220', 13, NULL, '2024-11-08 09:57:37.314071', 'reassigned to didith', 14, NULL, '53', NULL, 0, NULL, 0, 'low', 0, NULL, '', NULL, 0, 0, 0, 0, NULL),
(57, 'testing ticket 5', 'open', 'Linux', '2024-11-08 09:53:28.954963', 13, 18, '2024-11-27 05:04:21.769764', 'assigned to didith', 13, NULL, '10004', NULL, 4012043, NULL, 0, 'low', 11127350, '2024-12-10 06:25:18.023131', 'time123', '2024-12-10 06:25:06.895781', 0, 0, 0, 0, NULL),
(58, 'testing ticket 6', 'pending', 'Linux', '2024-11-08 09:54:03.034763', 13, 18, '2024-12-10 09:54:43.609979', 'assigned to didith', 13, NULL, '10006', NULL, 22019769, NULL, 0, 'low', 2483996, '2024-12-10 09:54:39.571259', 'testing 12', '2024-12-10 09:54:37.087263', 0, 0, 0, 0, NULL),
(59, 'ticket id error checking', 'open', 'Windows', '2024-11-11 04:44:46.855684', 17, 17, '2024-12-03 04:00:04.896490', 'reassigned to jobin', 14, NULL, '10113', '2024-11-11 04:45:31.346990', 380463971, NULL, 0, 'low', 11480314, '2024-12-10 06:24:11.579639', 'nothing new1', '2024-12-10 06:24:00.099325', 0, 0, 0, 0, NULL),
(60, 'assign time checking', 'closed', 'Windows', '2024-11-11 04:49:51.351060', 14, 17, '2024-12-05 08:46:07.279910', 'assigned to jobin', 14, NULL, '11111', '2024-11-11 04:49:51.350061', 2436873, NULL, 0, 'low', 0, NULL, '', NULL, 0, 0, 0, 0, NULL),
(61, 'assigned time error checking', 'open', 'Windows', '2024-11-11 05:06:32.536528', 14, 17, '2024-12-06 10:23:41.767185', 'assigned to jobin', 14, NULL, '11112', '2024-12-03 04:43:34.834493', 387536384, NULL, 0, 'low', 7281542, '2024-12-10 06:23:47.371550', 'qdywgdsgd', '2024-12-10 06:23:40.090008', 0, 0, 0, 0, NULL),
(62, 'testing all problems', 'closed', 'Windows', '2024-11-11 05:56:40.050947', 15, 14, '2024-11-29 09:17:38.464470', 'assigned to ajil', 15, NULL, '11113', '2024-11-11 05:56:40.050947', 528013035852, NULL, 0, 'low', 0, NULL, '', NULL, 0, 0, 272840055872, 0, NULL),
(63, 'testing', 'waiting_on_customer', 'Windows', '2024-11-11 05:57:11.425689', 15, 14, '2024-12-13 04:52:25.961586', 'assigned to ajil', 15, NULL, '11114', '2024-11-11 05:57:11.425689', 1292539132, NULL, 0, 'low', 13937137, '2024-12-12 12:36:10.980367', 'old', '2024-12-12 12:35:57.043230', 0, 1, 476790191, 0, NULL),
(64, 'error checking', 'closed', 'Windows', '2024-11-12 08:13:44.869834', 17, 14, '2024-12-05 08:58:30.479426', 'assigned to ajil', 17, NULL, '112233', '2024-11-12 08:13:44.869834', 572917633420, NULL, 0, 'low', 0, NULL, '', NULL, 0, 0, 272840063928, 0, NULL),
(65, 'testing table', 'pending', 'Windows', '2024-11-18 10:50:59.658362', 15, 17, '2024-12-13 04:49:22.902642', 'reassigned to jobin', 14, NULL, '111221', '2024-12-27 06:19:18.489622', 8295436888, NULL, 0, 'low', 19255512, '2024-12-13 04:01:33.922527', 'note1', '2024-12-13 04:01:14.667015', 0, 1, 3818643, 0, NULL),
(66, 'priority field', 'open', 'Windows', '2024-12-04 05:24:11.637533', 14, 14, '2024-12-10 13:19:13.132685', 'testing priority field', 17, NULL, '100200', '2024-12-27 06:14:07.834745', 1017888742, NULL, 0, 'urgent', 9709967, '2024-12-10 13:19:13.132685', 'testing the time1', '2024-12-10 13:19:03.422718', 0, 0, 366659454, 0, NULL);

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

--
-- Indexes for dumped tables
--

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
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `employee_notification`
--
ALTER TABLE `employee_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_notification_user_id_4ded77db_fk_auth_user_id` (`user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `employee_call`
--
ALTER TABLE `employee_call`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `employee_callnote`
--
ALTER TABLE `employee_callnote`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_dailyactivity`
--
ALTER TABLE `employee_dailyactivity`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `employee_employeeprofile`
--
ALTER TABLE `employee_employeeprofile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `employee_notification`
--
ALTER TABLE `employee_notification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `employee_sessionactivity`
--
ALTER TABLE `employee_sessionactivity`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=434;

--
-- AUTO_INCREMENT for table `employee_ticket`
--
ALTER TABLE `employee_ticket`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `employee_tickethistory`
--
ALTER TABLE `employee_tickethistory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

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
-- Constraints for table `employee_dailyactivity`
--
ALTER TABLE `employee_dailyactivity`
  ADD CONSTRAINT `employee_dailyactivity_user_id_2f1ba67d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `employee_employeeprofile`
--
ALTER TABLE `employee_employeeprofile`
  ADD CONSTRAINT `employee_employeeprofile_user_id_d5e61f5c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `employee_notification`
--
ALTER TABLE `employee_notification`
  ADD CONSTRAINT `employee_notification_user_id_4ded77db_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
