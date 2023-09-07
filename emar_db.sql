-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2023 at 11:26 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emar_db`
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
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add products', 8, 'add_products'),
(30, 'Can change products', 8, 'change_products'),
(31, 'Can delete products', 8, 'delete_products'),
(32, 'Can view products', 8, 'view_products'),
(33, 'Can add sales', 9, 'add_sales'),
(34, 'Can change sales', 9, 'change_sales'),
(35, 'Can delete sales', 9, 'delete_sales'),
(36, 'Can view sales', 9, 'view_sales'),
(37, 'Can add sales items', 10, 'add_salesitems'),
(38, 'Can change sales items', 10, 'change_salesitems'),
(39, 'Can delete sales items', 10, 'delete_salesitems'),
(40, 'Can view sales items', 10, 'view_salesitems'),
(41, 'Can add expense', 11, 'add_expense'),
(42, 'Can change expense', 11, 'change_expense'),
(43, 'Can delete expense', 11, 'delete_expense'),
(44, 'Can view expense', 11, 'view_expense');

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
(1, 'pbkdf2_sha256$600000$3jJmO0zgfArIXIdff9PWLb$F1Ld3TZSOIaUDV9GktzuRnN2/BdXnOBtps2kuEP6GGA=', '2023-09-07 03:29:17.074869', 1, 'admin', 'Administrator', '', 'admin@admin.com', 1, 1, '2022-03-04 01:27:51.000000');

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
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'posApp', 'category'),
(11, 'posApp', 'expense'),
(8, 'posApp', 'products'),
(9, 'posApp', 'sales'),
(10, 'posApp', 'salesitems'),
(6, 'sessions', 'session');

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
(1, 'contenttypes', '0001_initial', '2023-09-04 02:35:16.081056'),
(2, 'auth', '0001_initial', '2023-09-04 02:35:16.576248'),
(3, 'admin', '0001_initial', '2023-09-04 02:35:16.679915'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-09-04 02:35:16.689914'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-09-04 02:35:16.698914'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-09-04 02:35:16.777138'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-09-04 02:35:16.827116'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-09-04 02:35:16.853118'),
(9, 'auth', '0004_alter_user_username_opts', '2023-09-04 02:35:16.860850'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-09-04 02:35:16.917741'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-09-04 02:35:16.922740'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-09-04 02:35:16.931121'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-09-04 02:35:16.956221'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-09-04 02:35:16.978959'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-09-04 02:35:17.002622'),
(16, 'auth', '0011_update_proxy_permissions', '2023-09-04 02:35:17.011633'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-09-04 02:35:17.036634'),
(18, 'posApp', '0001_initial', '2023-09-04 02:35:17.055635'),
(19, 'posApp', '0002_products', '2023-09-04 02:35:17.118262'),
(20, 'posApp', '0003_sales', '2023-09-04 02:35:17.139262'),
(21, 'posApp', '0004_salesitems', '2023-09-04 02:35:17.246178'),
(22, 'posApp', '0005_expense', '2023-09-04 02:35:17.265181'),
(23, 'sessions', '0001_initial', '2023-09-04 02:35:17.299180');

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
('9i8307bg2vwaff056y2zmecgsv9ww642', '.eJxVjEsOwjAMBe-SNYpiTD5myb5nqOw4kAJqpaZdIe4OlbqA7ZuZ9zI9r0vt11bmflBzNmAOv5twfpRxA3rn8TbZPI3LPIjdFLvTZrtJy_Oyu38HlVv91k59SerTMSP4mNOVMqoQghOILjoMSiRMISAlYEASAjmBOgiYI5v3B8eqNuM:1qdPKj:WZgqEoDJ-QXoizgsODCovg95EJVM6BjI6qQC4pBgVXE', '2023-09-19 06:14:41.151230'),
('dfcnytskwvh1bsr3o6mx73yjumvww9zo', '.eJxVjEsOwjAMBe-SNYpiTD5myb5nqOw4kAJqpaZdIe4OlbqA7ZuZ9zI9r0vt11bmflBzNmAOv5twfpRxA3rn8TbZPI3LPIjdFLvTZrtJy_Oyu38HlVv91k59SerTMSP4mNOVMqoQghOILjoMSiRMISAlYEASAjmBOgiYI5v3B8eqNuM:1qdOKJ:PqkCGu0oMCVzobbYKoTiwDHgraUqFbeXSHUYX0ix1fw', '2023-09-19 05:10:11.111358'),
('e7lnmwjo9qwfxc0rrfplkfm2eqn4wy3p', '.eJxVjEsOwjAMBe-SNYpiTD5myb5nqOw4kAJqpaZdIe4OlbqA7ZuZ9zI9r0vt11bmflBzNmAOv5twfpRxA3rn8TbZPI3LPIjdFLvTZrtJy_Oyu38HlVv91k59SerTMSP4mNOVMqoQghOILjoMSiRMISAlYEASAjmBOgiYI5v3B8eqNuM:1qdOfj:PjJ0G9UphOhaDrzV4sPXBDzVPgx6E-l-pAvl_Ad7j1A', '2023-09-19 05:32:19.948586'),
('ftlky1mknuzyomi8r5e9vsohqz7rc2r2', '.eJxVjEsOwjAMBe-SNYpiTD5myb5nqOw4kAJqpaZdIe4OlbqA7ZuZ9zI9r0vt11bmflBzNmAOv5twfpRxA3rn8TbZPI3LPIjdFLvTZrtJy_Oyu38HlVv91k59SerTMSP4mNOVMqoQghOILjoMSiRMISAlYEASAjmBOgiYI5v3B8eqNuM:1qdPIW:U1yv6J45CqEEMUuSKx2XpDYGeFaibXguGpbwwnYZdEY', '2023-09-19 06:12:24.734550'),
('g72j6phhwhh6u69yqpaq6lruw2trj0wb', '.eJxVjEsOwjAMBe-SNYpiTD5myb5nqOw4kAJqpaZdIe4OlbqA7ZuZ9zI9r0vt11bmflBzNmAOv5twfpRxA3rn8TbZPI3LPIjdFLvTZrtJy_Oyu38HlVv91k59SerTMSP4mNOVMqoQghOILjoMSiRMISAlYEASAjmBOgiYI5v3B8eqNuM:1qdOo3:XiYY0CUSE0AP9g39-IkUhsqT3tIRssPxWW0qfqbhzqI', '2023-09-19 05:40:55.560474'),
('h8y529bpjtw1f8wu5p62fmdtt3dh3u7u', '.eJxVjEsOwjAMBe-SNYpiTD5myb5nqOw4kAJqpaZdIe4OlbqA7ZuZ9zI9r0vt11bmflBzNmAOv5twfpRxA3rn8TbZPI3LPIjdFLvTZrtJy_Oyu38HlVv91k59SerTMSP4mNOVMqoQghOILjoMSiRMISAlYEASAjmBOgiYI5v3B8eqNuM:1qdPMA:vL_-W0U1hj2P-zY01lkcckcHfMCwM40qlry_zH_PPaE', '2023-09-19 06:16:10.851942'),
('nbs70jzt4mc5jcme1hkxq2vo9tub10rn', '.eJxVjEsOwjAMBe-SNYpiTD5myb5nqOw4kAJqpaZdIe4OlbqA7ZuZ9zI9r0vt11bmflBzNmAOv5twfpRxA3rn8TbZPI3LPIjdFLvTZrtJy_Oyu38HlVv91k59SerTMSP4mNOVMqoQghOILjoMSiRMISAlYEASAjmBOgiYI5v3B8eqNuM:1qdPFn:eXJgvfEx-NhuRyyKU5RhJI2ZFsfG29hWk8akc0JZd6g', '2023-09-19 06:09:35.453432'),
('oe0uy1ittqjed5obi1y2ftuu91lb8ge4', '.eJxVjEsOwjAMBe-SNYpiTD5myb5nqOw4kAJqpaZdIe4OlbqA7ZuZ9zI9r0vt11bmflBzNmAOv5twfpRxA3rn8TbZPI3LPIjdFLvTZrtJy_Oyu38HlVv91k59SerTMSP4mNOVMqoQghOILjoMSiRMISAlYEASAjmBOgiYI5v3B8eqNuM:1qe5hl:lwEGeyBsz7kQ7dkEGuyK-f9BD1L9pVb0X-W6wLILa1A', '2023-09-21 03:29:17.074869'),
('xfd17wq4eenmsmry5lt8xndecfcifq1a', '.eJxVjEsOwjAMBe-SNYpiTD5myb5nqOw4kAJqpaZdIe4OlbqA7ZuZ9zI9r0vt11bmflBzNmAOv5twfpRxA3rn8TbZPI3LPIjdFLvTZrtJy_Oyu38HlVv91k59SerTMSP4mNOVMqoQghOILjoMSiRMISAlYEASAjmBOgiYI5v3B8eqNuM:1qdOP5:yKBUihfkgySSatJQ6mPxIzsMIRWJIUoF4qSwKEmP9bk', '2023-09-19 05:15:07.744877');

-- --------------------------------------------------------

--
-- Table structure for table `posapp_category`
--

CREATE TABLE `posapp_category` (
  `id` bigint(20) NOT NULL,
  `name` longtext NOT NULL,
  `description` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `date_added` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posapp_category`
--

INSERT INTO `posapp_category` (`id`, `name`, `description`, `status`, `date_added`, `date_updated`) VALUES
(1, 'gio', 'wala pa video', 1, '2023-09-04 03:11:17.600402', '2023-09-04 03:11:17.601398');

-- --------------------------------------------------------

--
-- Table structure for table `posapp_expense`
--

CREATE TABLE `posapp_expense` (
  `id` bigint(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `category` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posapp_expense`
--

INSERT INTO `posapp_expense` (`id`, `amount`, `category`, `description`, `date`) VALUES
(1, 360.00, 'Food', 'Tatlong Bugok', '2023-09-06'),
(2, 1100.00, 'Shopee', 'Pants', '2023-09-05'),
(3, 1500.00, 'Fun', 'Bingo', '2023-08-30'),
(4, 125125.00, 'Food', 'Bingo', '2023-09-05');

-- --------------------------------------------------------

--
-- Table structure for table `posapp_products`
--

CREATE TABLE `posapp_products` (
  `id` bigint(20) NOT NULL,
  `code` varchar(100) NOT NULL,
  `name` longtext NOT NULL,
  `description` longtext NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date_added` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `category_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posapp_products`
--

INSERT INTO `posapp_products` (`id`, `code`, `name`, `description`, `price`, `quantity`, `status`, `date_added`, `date_updated`, `category_id_id`) VALUES
(1, '18171350', 'Hahaha', 'HAHAHA', 768, 1231000, 1, '2023-09-04 06:43:48.800771', '2023-09-07 03:37:33.723096', 1);

-- --------------------------------------------------------

--
-- Table structure for table `posapp_sales`
--

CREATE TABLE `posapp_sales` (
  `id` bigint(20) NOT NULL,
  `code` varchar(100) NOT NULL,
  `sub_total` double NOT NULL,
  `grand_total` double NOT NULL,
  `tax_amount` double NOT NULL,
  `tax` double NOT NULL,
  `tendered_amount` double NOT NULL,
  `amount_change` double NOT NULL,
  `date_added` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posapp_sales`
--

INSERT INTO `posapp_sales` (`id`, `code`, `sub_total`, `grand_total`, `tax_amount`, `tax`, `tendered_amount`, `amount_change`, `date_added`, `date_updated`) VALUES
(1, '404600001', 0, 768, 0, 0, 800, 32, '2023-09-07 03:29:47.577267', '2023-09-07 03:29:47.577267'),
(2, '404600002', 177408000, 177408000, 0, 0, 1000000000, 822592000, '2023-09-07 03:31:01.307868', '2023-09-07 03:31:01.307868'),
(3, '404600003', 357888, 357888, 0, 0, 400000, 42112, '2023-09-07 03:37:33.679262', '2023-09-07 03:37:33.679262'),
(4, '404600004', 0, 0, 0, 0, 0, 0, '2023-09-07 03:59:02.968698', '2023-09-07 03:59:02.968698'),
(5, '404600005', 0, 768, 0, 0, 800, 32, '2023-09-07 05:05:55.248811', '2023-09-07 05:05:55.248811'),
(6, '404600006', 0, 768, 0, 0, 800, 32, '2023-09-07 06:01:23.098664', '2023-09-07 06:01:23.098664'),
(7, '404600007', 0, 768, 0, 0, 800, 32, '2023-09-07 06:04:07.889779', '2023-09-07 06:04:07.889779'),
(8, '404600008', 0, 3840, 0, 0, 4000, 160, '2023-09-07 06:06:32.643692', '2023-09-07 06:06:32.643692'),
(9, '404600009', 0, 768, 0, 0, 800, 32, '2023-09-07 06:32:31.354453', '2023-09-07 06:32:31.354453'),
(10, '404600010', 0, 768, 0, 0, 800, 32, '2023-09-07 06:36:14.408536', '2023-09-07 06:36:14.408536'),
(11, '404600011', 0, 768, 0, 0, 800, 32, '2023-09-07 06:56:45.512191', '2023-09-07 06:56:45.512191'),
(12, '404600012', 0, 768, 0, 0, 800, 32, '2023-09-07 07:18:10.508154', '2023-09-07 07:18:10.508154'),
(13, '404600013', 0, 768, 0, 0, 800, 32, '2023-09-07 07:34:17.638541', '2023-09-07 07:34:17.638541'),
(14, '404600014', 0, 768, 0, 0, 800, 32, '2023-09-07 08:11:54.237185', '2023-09-07 08:11:54.237185');

-- --------------------------------------------------------

--
-- Table structure for table `posapp_salesitems`
--

CREATE TABLE `posapp_salesitems` (
  `id` bigint(20) NOT NULL,
  `price` double NOT NULL,
  `qty` double NOT NULL,
  `total` double NOT NULL,
  `product_id_id` bigint(20) NOT NULL,
  `sale_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posapp_salesitems`
--

INSERT INTO `posapp_salesitems` (`id`, `price`, `qty`, `total`, `product_id_id`, `sale_id_id`) VALUES
(1, 768, 231000, 177408000, 1, 2),
(2, 768, 466, 357888, 1, 3);

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
-- Indexes for table `posapp_category`
--
ALTER TABLE `posapp_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posapp_expense`
--
ALTER TABLE `posapp_expense`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posapp_products`
--
ALTER TABLE `posapp_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posApp_products_category_id_id_46bd9586_fk_posApp_category_id` (`category_id_id`);

--
-- Indexes for table `posapp_sales`
--
ALTER TABLE `posapp_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posapp_salesitems`
--
ALTER TABLE `posapp_salesitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posApp_salesitems_product_id_id_fc74a6d5_fk_posApp_products_id` (`product_id_id`),
  ADD KEY `posApp_salesitems_sale_id_id_dc0c6e0b_fk_posApp_sales_id` (`sale_id_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `posapp_category`
--
ALTER TABLE `posapp_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posapp_expense`
--
ALTER TABLE `posapp_expense`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posapp_products`
--
ALTER TABLE `posapp_products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posapp_sales`
--
ALTER TABLE `posapp_sales`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `posapp_salesitems`
--
ALTER TABLE `posapp_salesitems`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- Constraints for table `posapp_products`
--
ALTER TABLE `posapp_products`
  ADD CONSTRAINT `posApp_products_category_id_id_46bd9586_fk_posApp_category_id` FOREIGN KEY (`category_id_id`) REFERENCES `posapp_category` (`id`);

--
-- Constraints for table `posapp_salesitems`
--
ALTER TABLE `posapp_salesitems`
  ADD CONSTRAINT `posApp_salesitems_product_id_id_fc74a6d5_fk_posApp_products_id` FOREIGN KEY (`product_id_id`) REFERENCES `posapp_products` (`id`),
  ADD CONSTRAINT `posApp_salesitems_sale_id_id_dc0c6e0b_fk_posApp_sales_id` FOREIGN KEY (`sale_id_id`) REFERENCES `posapp_sales` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
