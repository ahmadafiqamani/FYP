-- MariaDB dump 10.19  Distrib 10.11.3-MariaDB, for debian-linux-gnueabihf (armv7l)
--
-- Host: localhost    Database: FYP
-- ------------------------------------------------------
-- Server version	10.11.3-MariaDB-1+rpi1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actuator_control_actuatorcontrol`
--

DROP TABLE IF EXISTS `actuator_control_actuatorcontrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actuator_control_actuatorcontrol` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `actuator_type` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  `color` varchar(10) DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actuator_control_actuatorcontrol`
--

LOCK TABLES `actuator_control_actuatorcontrol` WRITE;
/*!40000 ALTER TABLE `actuator_control_actuatorcontrol` DISABLE KEYS */;
/*!40000 ALTER TABLE `actuator_control_actuatorcontrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actuator_control_actuatorstate`
--

DROP TABLE IF EXISTS `actuator_control_actuatorstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actuator_control_actuatorstate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `node` varchar(10) NOT NULL,
  `red_led` tinyint(1) NOT NULL,
  `green_led` tinyint(1) NOT NULL,
  `buzzer` tinyint(1) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actuator_control_actuatorstate`
--

LOCK TABLES `actuator_control_actuatorstate` WRITE;
/*!40000 ALTER TABLE `actuator_control_actuatorstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `actuator_control_actuatorstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add sensor reading',7,'add_sensorreading'),
(26,'Can change sensor reading',7,'change_sensorreading'),
(27,'Can delete sensor reading',7,'delete_sensorreading'),
(28,'Can view sensor reading',7,'view_sensorreading'),
(29,'Can add sensor threshold',8,'add_sensorthreshold'),
(30,'Can change sensor threshold',8,'change_sensorthreshold'),
(31,'Can delete sensor threshold',8,'delete_sensorthreshold'),
(32,'Can view sensor threshold',8,'view_sensorthreshold'),
(33,'Can add node',9,'add_node'),
(34,'Can change node',9,'change_node'),
(35,'Can delete node',9,'delete_node'),
(36,'Can view node',9,'view_node'),
(37,'Can add edge',10,'add_edge'),
(38,'Can change edge',10,'change_edge'),
(39,'Can delete edge',10,'delete_edge'),
(40,'Can view edge',10,'view_edge'),
(41,'Can add blocked path',11,'add_blockedpath'),
(42,'Can change blocked path',11,'change_blockedpath'),
(43,'Can delete blocked path',11,'delete_blockedpath'),
(44,'Can view blocked path',11,'view_blockedpath'),
(45,'Can add actuator state',12,'add_actuatorstate'),
(46,'Can change actuator state',12,'change_actuatorstate'),
(47,'Can delete actuator state',12,'delete_actuatorstate'),
(48,'Can view actuator state',12,'view_actuatorstate'),
(49,'Can add actuator control',13,'add_actuatorcontrol'),
(50,'Can change actuator control',13,'change_actuatorcontrol'),
(51,'Can delete actuator control',13,'delete_actuatorcontrol'),
(52,'Can view actuator control',13,'view_actuatorcontrol'),
(53,'Can add user',14,'add_customuser'),
(54,'Can change user',14,'change_customuser'),
(55,'Can delete user',14,'delete_customuser'),
(56,'Can view user',14,'view_customuser'),
(57,'Can add test result',15,'add_testresult'),
(58,'Can change test result',15,'change_testresult'),
(59,'Can delete test result',15,'delete_testresult'),
(60,'Can view test result',15,'view_testresult'),
(61,'Can add test scenario',16,'add_testscenario'),
(62,'Can change test scenario',16,'change_testscenario'),
(63,'Can delete test scenario',16,'delete_testscenario'),
(64,'Can view test scenario',16,'view_testscenario');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_mana` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_mana` FOREIGN KEY (`user_id`) REFERENCES `user_management_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(13,'actuator_control','actuatorcontrol'),
(12,'actuator_control','actuatorstate'),
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(10,'evac_pathfinding','edge'),
(9,'evac_pathfinding','node'),
(11,'layout_display','blockedpath'),
(8,'sensor_config','sensorthreshold'),
(7,'sensor_monitor','sensorreading'),
(6,'sessions','session'),
(15,'system_testing','testresult'),
(16,'system_testing','testscenario'),
(14,'user_management','customuser');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2025-01-06 04:38:16.201192'),
(2,'auth','0001_initial','2025-01-06 04:38:16.849166'),
(6,'contenttypes','0002_remove_content_type_name','2025-01-06 04:38:17.138658'),
(7,'auth','0002_alter_permission_name_max_length','2025-01-06 04:38:17.213907'),
(8,'auth','0003_alter_user_email_max_length','2025-01-06 04:38:17.253086'),
(9,'auth','0004_alter_user_username_opts','2025-01-06 04:38:17.268803'),
(10,'auth','0005_alter_user_last_login_null','2025-01-06 04:38:17.495331'),
(11,'auth','0006_require_contenttypes_0002','2025-01-06 04:38:17.501125'),
(12,'auth','0007_alter_validators_add_error_messages','2025-01-06 04:38:17.516397'),
(13,'auth','0008_alter_user_username_max_length','2025-01-06 04:38:17.550257'),
(14,'auth','0009_alter_user_last_name_max_length','2025-01-06 04:38:17.582598'),
(15,'auth','0010_alter_group_name_max_length','2025-01-06 04:38:17.615222'),
(16,'auth','0011_update_proxy_permissions','2025-01-06 04:38:17.631155'),
(17,'auth','0012_alter_user_first_name_max_length','2025-01-06 04:38:17.669039'),
(18,'sessions','0001_initial','2025-01-06 04:38:17.713345'),
(19,'sensor_monitor','0001_initial','2025-01-06 05:03:07.068829'),
(20,'sensor_config','0001_initial','2025-01-06 06:00:35.910161'),
(21,'evac_pathfinding','0001_initial','2025-01-06 07:46:20.257176'),
(22,'layout_display','0001_initial','2025-01-06 08:14:16.657981'),
(23,'actuator_control','0001_initial','2025-01-08 08:35:53.007254'),
(24,'actuator_control','0002_actuatorcontrol','2025-01-08 08:55:56.003655'),
(25,'user_management','0001_initial','2025-01-09 08:21:23.120010'),
(26,'admin','0001_initial','2025-01-09 08:26:56.485870'),
(27,'admin','0002_logentry_remove_auto_add','2025-01-09 08:26:56.511333'),
(28,'admin','0003_logentry_add_action_flag_choices','2025-01-09 08:26:56.532224'),
(29,'system_testing','0001_initial','2025-01-13 04:35:31.264988');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('328ulu9ajlqcnfnkpcc3coknrqe8asfe','.eJxVjDsOwjAQBe_iGlnOOv5R0nMGa9fe4ABypDipEHcHSymgfTPzXiLivpW4N17jnMVZgDj9boTpwbWDfMd6W2Ra6rbOJLsiD9rkdcn8vBzu30HBVnoNzjlNKilrvWKetFEQwPgBRgc8MkFSbMHrpHMO2Q3B4pej0ZMnQvH-ALx7N0M:1tZiRF:YXPOzbDC2aAFr-334NGg1PA49kb0S7dZ2ik7-W5W5C4','2025-02-03 03:26:57.732666'),
('ay5zo86byyvwacoayl3yvt5aqgo80lqr','.eJxVjDsOwjAQBe_iGlnOOv5R0nMGa9fe4ABypDipEHcHSymgfTPzXiLivpW4N17jnMVZgDj9boTpwbWDfMd6W2Ra6rbOJLsiD9rkdcn8vBzu30HBVnoNzjlNKilrvWKetFEQwPgBRgc8MkFSbMHrpHMO2Q3B4pej0ZMnQvH-ALx7N0M:1tVx66:SfSl2RIzYyRCTimrrpvm1xg88F1DJga8nohvKlcqYIU','2025-01-23 18:17:34.906134'),
('g2kqajite73fo9mt00zid88svzp7ym0b','.eJxVjDsOwjAQBe_iGlnOOv5R0nMGa9fe4ABypDipEHcHSymgfTPzXiLivpW4N17jnMVZgDj9boTpwbWDfMd6W2Ra6rbOJLsiD9rkdcn8vBzu30HBVnoNzjlNKilrvWKetFEQwPgBRgc8MkFSbMHrpHMO2Q3B4pej0ZMnQvH-ALx7N0M:1tWT1W:Uo1-t9FRCaeQm5jVlpAdepDwSvNbrX6tBOV82lntWEo','2025-01-25 04:22:58.532066'),
('mzlgr15438krqrpo560y7hirh4rozpf5','.eJxVjDsOwjAQBe_iGlnOOv5R0nMGa9fe4ABypDipEHcHSymgfTPzXiLivpW4N17jnMVZgDj9boTpwbWDfMd6W2Ra6rbOJLsiD9rkdcn8vBzu30HBVnoNzjlNKilrvWKetFEQwPgBRgc8MkFSbMHrpHMO2Q3B4pej0ZMnQvH-ALx7N0M:1tWS7t:_XegXhsYfhtz1E9pr8StgiS_-H2tYMQK6nZIr64aqUo','2025-01-25 03:25:29.089841'),
('wp59nzwiirf0trcd7s4lqbseurha3qxw','.eJxVjDsOwjAQBe_iGlnOOv5R0nMGa9fe4ABypDipEHcHSymgfTPzXiLivpW4N17jnMVZgDj9boTpwbWDfMd6W2Ra6rbOJLsiD9rkdcn8vBzu30HBVnoNzjlNKilrvWKetFEQwPgBRgc8MkFSbMHrpHMO2Q3B4pej0ZMnQvH-ALx7N0M:1tZiNQ:caQyV3gkOENBWR34a-n-ewLmkQc4oyFD_ADZws6fY5Y','2025-02-03 03:23:00.247110');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evac_pathfinding_edge`
--

DROP TABLE IF EXISTS `evac_pathfinding_edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evac_pathfinding_edge` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `weight` double NOT NULL,
  `destination_id` bigint(20) NOT NULL,
  `source_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `evac_pathfinding_edg_destination_id_57eb0743_fk_evac_path` (`destination_id`),
  KEY `evac_pathfinding_edg_source_id_ebde767b_fk_evac_path` (`source_id`),
  CONSTRAINT `evac_pathfinding_edg_destination_id_57eb0743_fk_evac_path` FOREIGN KEY (`destination_id`) REFERENCES `evac_pathfinding_node` (`id`),
  CONSTRAINT `evac_pathfinding_edg_source_id_ebde767b_fk_evac_path` FOREIGN KEY (`source_id`) REFERENCES `evac_pathfinding_node` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evac_pathfinding_edge`
--

LOCK TABLES `evac_pathfinding_edge` WRITE;
/*!40000 ALTER TABLE `evac_pathfinding_edge` DISABLE KEYS */;
INSERT INTO `evac_pathfinding_edge` VALUES
(1,8,2,1),
(2,8,1,2),
(3,12,5,1),
(4,12,1,5),
(5,12,6,1),
(6,12,1,6),
(7,10,5,2),
(8,10,2,5),
(9,13,6,2),
(10,13,2,6),
(11,15,5,3),
(12,15,3,5),
(13,9,6,3),
(14,9,3,6),
(15,13,5,4),
(16,13,4,5),
(17,11,6,4),
(18,11,4,6),
(19,3,7,5),
(20,3,5,7),
(21,16,6,5),
(22,16,5,6);
/*!40000 ALTER TABLE `evac_pathfinding_edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evac_pathfinding_node`
--

DROP TABLE IF EXISTS `evac_pathfinding_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evac_pathfinding_node` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evac_pathfinding_node`
--

LOCK TABLES `evac_pathfinding_node` WRITE;
/*!40000 ALTER TABLE `evac_pathfinding_node` DISABLE KEYS */;
INSERT INTO `evac_pathfinding_node` VALUES
(1,'A'),
(2,'B'),
(3,'C'),
(4,'D'),
(5,'E'),
(6,'F'),
(7,'G');
/*!40000 ALTER TABLE `evac_pathfinding_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layout_display_blockedpath`
--

DROP TABLE IF EXISTS `layout_display_blockedpath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layout_display_blockedpath` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `start` varchar(1) NOT NULL,
  `end` varchar(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layout_display_blockedpath`
--

LOCK TABLES `layout_display_blockedpath` WRITE;
/*!40000 ALTER TABLE `layout_display_blockedpath` DISABLE KEYS */;
/*!40000 ALTER TABLE `layout_display_blockedpath` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor_config_sensorthreshold`
--

DROP TABLE IF EXISTS `sensor_config_sensorthreshold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor_config_sensorthreshold` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `flame_threshold` int(11) NOT NULL,
  `smokeB_threshold` int(11) NOT NULL,
  `smokeC_threshold` int(11) NOT NULL,
  `temperature_threshold` double NOT NULL,
  `humidity_threshold` double NOT NULL,
  `distance_threshold` int(11) NOT NULL,
  `reedswitch_threshold` int(11) NOT NULL,
  `motion_threshold` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor_config_sensorthreshold`
--

LOCK TABLES `sensor_config_sensorthreshold` WRITE;
/*!40000 ALTER TABLE `sensor_config_sensorthreshold` DISABLE KEYS */;
INSERT INTO `sensor_config_sensorthreshold` VALUES
(1,0,0,0,40,50,5,1,0);
/*!40000 ALTER TABLE `sensor_config_sensorthreshold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor_monitor_sensorreading`
--

DROP TABLE IF EXISTS `sensor_monitor_sensorreading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor_monitor_sensorreading` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `flame` int(11) DEFAULT NULL,
  `smokeB` int(11) DEFAULT NULL,
  `smokeC` int(11) DEFAULT NULL,
  `temperature` double DEFAULT NULL,
  `humidity` double DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `reedswitch` int(11) DEFAULT NULL,
  `motion` int(11) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor_monitor_sensorreading`
--

LOCK TABLES `sensor_monitor_sensorreading` WRITE;
/*!40000 ALTER TABLE `sensor_monitor_sensorreading` DISABLE KEYS */;
INSERT INTO `sensor_monitor_sensorreading` VALUES
(1,0,0,0,27,67,15,1,0,'2025-01-06 06:05:55'),
(2,0,0,0,31,60,19,1,0,'2025-01-06 06:34:02'),
(3,0,0,0,31,60,19,1,0,'2025-01-06 06:34:04'),
(4,0,0,0,31,60,19,1,0,'2025-01-06 06:34:06'),
(5,0,0,0,31,60,19,1,0,'2025-01-06 06:34:08'),
(6,0,0,0,31,60,19,1,0,'2025-01-06 06:34:10'),
(7,0,0,0,31,60,19,1,0,'2025-01-06 06:34:12'),
(8,0,0,0,31,60,19,1,0,'2025-01-06 06:34:14'),
(9,0,0,0,31,60,19,1,0,'2025-01-06 06:34:16'),
(10,0,0,0,31,60,19,1,0,'2025-01-06 06:34:18'),
(11,0,0,0,31,60,19,1,0,'2025-01-06 06:34:20'),
(12,0,0,0,31,60,19,1,0,'2025-01-06 06:34:22'),
(13,0,0,0,31,60,19,1,0,'2025-01-06 06:34:24'),
(14,0,0,0,31,60,19,1,0,'2025-01-06 06:34:26'),
(15,0,0,0,31,60,19,1,0,'2025-01-06 06:34:28'),
(16,0,0,0,31,60,19,1,0,'2025-01-06 06:34:30'),
(17,0,0,0,31,60,19,1,0,'2025-01-06 06:34:32'),
(18,0,0,0,31,60,19,1,0,'2025-01-06 06:34:34'),
(19,0,0,0,31,60,19,1,0,'2025-01-06 06:34:36'),
(20,0,0,0,31,60,19,1,0,'2025-01-06 06:34:38'),
(21,0,0,0,31,60,19,1,0,'2025-01-06 06:34:40'),
(22,0,0,0,31,60,19,1,0,'2025-01-06 06:34:42'),
(23,0,0,0,31,60,19,1,0,'2025-01-06 06:34:44'),
(24,0,0,0,31,60,19,1,0,'2025-01-06 06:34:46'),
(25,0,0,0,31,60,19,1,0,'2025-01-06 06:34:48'),
(26,0,0,0,31,60,19,1,0,'2025-01-06 06:34:50'),
(27,0,0,0,31,60,19,1,0,'2025-01-06 06:34:52'),
(28,0,0,0,31,60,19,1,0,'2025-01-06 06:34:54'),
(29,0,0,0,31,60,19,1,0,'2025-01-06 06:34:56'),
(30,0,0,0,31,60,19,1,0,'2025-01-06 06:34:58'),
(31,0,0,0,31,60,19,1,0,'2025-01-06 06:35:00'),
(32,0,0,0,31,60,19,1,0,'2025-01-06 06:35:02'),
(33,0,0,0,31,60,19,1,0,'2025-01-06 06:35:04'),
(34,0,0,0,31,60,19,1,0,'2025-01-06 06:35:06'),
(35,0,0,0,31,60,19,1,0,'2025-01-06 06:35:08'),
(36,0,0,0,31,60,19,1,0,'2025-01-06 06:35:10'),
(37,0,0,0,31,60,19,1,0,'2025-01-06 06:35:12'),
(38,0,0,0,31,60,19,1,0,'2025-01-06 06:35:14'),
(39,0,0,0,31,60,19,1,0,'2025-01-06 06:35:16'),
(40,0,0,0,31,60,19,1,0,'2025-01-06 06:35:18'),
(41,0,0,0,31,60,19,1,0,'2025-01-06 06:35:20'),
(42,0,0,0,31,60,19,1,0,'2025-01-06 06:35:22'),
(43,0,0,0,31,60,19,1,0,'2025-01-06 06:35:24'),
(44,0,0,0,31,60,19,1,0,'2025-01-06 06:35:26'),
(45,0,0,0,31,60,19,1,0,'2025-01-06 06:35:28'),
(46,0,0,0,31,60,19,1,0,'2025-01-06 06:35:30'),
(47,0,0,0,31,60,19,1,0,'2025-01-06 06:35:32'),
(48,0,0,0,31,60,19,1,0,'2025-01-06 06:35:34'),
(49,0,0,0,31,60,19,1,0,'2025-01-06 06:35:36'),
(50,0,0,0,31,60,19,1,0,'2025-01-06 06:35:38'),
(51,0,0,0,31,60,19,1,0,'2025-01-06 06:35:40'),
(52,0,0,0,31,60,19,1,0,'2025-01-06 06:35:42'),
(53,0,0,0,31,60,19,1,0,'2025-01-06 06:35:44'),
(54,0,0,0,31,60,19,1,0,'2025-01-06 06:35:46'),
(55,0,0,0,31,60,19,1,0,'2025-01-06 06:35:48'),
(56,0,0,0,31,60,19,1,0,'2025-01-06 06:35:50'),
(57,0,0,0,31,60,19,1,0,'2025-01-06 06:35:52'),
(58,0,0,0,31,60,19,1,0,'2025-01-06 06:35:54'),
(59,0,0,0,31,60,19,1,0,'2025-01-06 06:35:56'),
(60,0,0,0,31,60,19,1,0,'2025-01-06 06:35:58'),
(61,0,0,0,31,60,19,1,0,'2025-01-06 06:36:00'),
(62,0,0,0,31,60,19,1,0,'2025-01-06 06:36:02'),
(63,0,0,0,31,60,19,1,0,'2025-01-06 06:36:04'),
(64,0,0,0,31,60,19,1,0,'2025-01-06 06:36:06'),
(65,0,0,0,31,60,19,1,0,'2025-01-06 06:36:08'),
(66,0,0,0,31,60,19,1,0,'2025-01-06 06:36:11'),
(67,0,0,0,31,60,19,1,0,'2025-01-06 06:36:13'),
(68,0,0,0,31,60,19,1,0,'2025-01-06 06:36:15'),
(69,0,0,0,31,60,19,1,0,'2025-01-06 06:36:17'),
(70,0,0,0,31,60,19,1,0,'2025-01-06 06:36:19'),
(71,0,0,0,31,60,19,1,0,'2025-01-06 06:36:21'),
(72,0,0,0,31,60,19,1,0,'2025-01-06 06:36:23'),
(73,0,0,0,31,60,19,1,0,'2025-01-06 06:36:25'),
(74,0,0,0,31,60,19,1,0,'2025-01-06 06:36:27'),
(75,0,0,0,31,60,19,1,0,'2025-01-06 06:36:29'),
(76,0,0,0,31,60,19,1,0,'2025-01-06 06:36:31'),
(77,0,0,0,31,60,19,1,0,'2025-01-06 06:36:33'),
(78,0,0,0,31,60,19,1,0,'2025-01-06 06:36:35'),
(79,0,0,0,31,60,19,1,0,'2025-01-06 06:36:37'),
(80,0,0,0,31,60,19,1,0,'2025-01-06 06:36:39'),
(81,0,0,0,31,60,19,1,0,'2025-01-06 06:36:41'),
(82,0,0,0,31,60,19,1,0,'2025-01-06 06:36:43'),
(83,0,0,0,31,60,19,1,0,'2025-01-06 06:36:45'),
(84,0,0,0,31,60,19,1,0,'2025-01-06 06:36:47'),
(85,0,0,0,31,60,19,1,0,'2025-01-06 06:36:49'),
(86,0,0,0,31,60,19,1,0,'2025-01-06 06:36:51'),
(87,0,0,0,31,60,19,1,0,'2025-01-06 06:36:53'),
(88,0,0,0,31,60,19,1,0,'2025-01-06 06:36:55'),
(89,0,0,0,31,60,19,1,0,'2025-01-06 06:36:57'),
(90,0,0,0,31,60,19,1,0,'2025-01-06 06:36:59'),
(91,0,0,0,31,60,19,1,0,'2025-01-06 06:37:01'),
(92,0,0,0,31,60,19,1,1,'2025-01-06 06:37:03'),
(93,0,0,0,31,60,19,1,0,'2025-01-06 06:37:05'),
(94,0,0,0,31,60,19,1,0,'2025-01-06 06:37:07'),
(95,0,0,0,31,60,19,1,0,'2025-01-06 06:37:09'),
(96,0,0,0,31,60,19,1,0,'2025-01-06 06:37:11'),
(97,0,0,0,31,60,19,1,0,'2025-01-06 06:37:13'),
(98,0,0,0,31,60,19,1,0,'2025-01-06 06:37:15'),
(99,0,0,0,31,60,19,1,0,'2025-01-06 06:37:17'),
(100,0,0,0,31,60,19,1,0,'2025-01-06 06:37:19'),
(101,0,0,0,31,60,19,1,0,'2025-01-06 06:37:21'),
(102,0,0,0,31,60,19,1,0,'2025-01-06 06:37:23'),
(103,0,0,0,31,60,19,1,0,'2025-01-06 06:37:25'),
(104,0,0,0,31,60,19,1,0,'2025-01-06 06:37:27'),
(105,0,0,0,31,60,19,1,0,'2025-01-06 06:37:29'),
(106,0,0,0,31,60,19,1,0,'2025-01-06 06:37:31'),
(107,0,0,0,31,60,19,1,0,'2025-01-06 06:37:33'),
(108,0,0,0,31,60,19,1,0,'2025-01-06 06:37:35'),
(109,0,0,0,31,60,19,1,0,'2025-01-06 06:37:37'),
(110,0,0,0,31,60,19,1,0,'2025-01-06 06:37:39'),
(111,0,0,0,31,60,19,1,0,'2025-01-06 06:37:41'),
(112,0,0,0,31,60,19,1,0,'2025-01-06 06:37:43'),
(113,0,0,0,31,60,19,1,0,'2025-01-06 06:37:45'),
(114,0,0,0,31,60,19,1,0,'2025-01-06 06:37:47'),
(115,0,0,0,31,60,19,1,0,'2025-01-06 06:37:49'),
(116,0,0,0,31,60,19,1,0,'2025-01-06 06:37:51'),
(117,0,0,0,31,60,19,1,0,'2025-01-06 06:37:53'),
(118,0,0,0,31,60,19,1,0,'2025-01-06 06:37:55'),
(119,0,0,0,31,60,19,1,0,'2025-01-06 06:37:57'),
(120,0,0,0,31,60,19,1,0,'2025-01-06 06:37:59'),
(121,0,0,0,31,60,19,1,0,'2025-01-06 06:38:01'),
(122,0,0,0,31,60,19,1,0,'2025-01-06 06:38:03'),
(123,0,0,0,31,60,19,1,0,'2025-01-06 06:38:05'),
(124,0,0,0,31,60,19,1,0,'2025-01-06 06:38:07'),
(125,0,0,0,31,60,19,1,0,'2025-01-06 06:38:09'),
(126,0,0,0,31,60,19,1,0,'2025-01-06 06:38:11'),
(127,0,0,0,31,60,19,1,0,'2025-01-06 06:38:13'),
(128,0,0,0,31,60,19,1,0,'2025-01-06 06:38:15'),
(129,0,0,0,31,60,19,1,0,'2025-01-06 06:38:17'),
(130,0,0,0,31,60,19,1,0,'2025-01-06 06:38:19'),
(131,0,0,0,31,60,19,1,0,'2025-01-06 06:38:21'),
(132,0,0,0,31,60,19,1,0,'2025-01-06 06:38:23'),
(133,0,0,0,31,60,19,1,0,'2025-01-06 06:38:25'),
(134,0,0,0,31,60,19,1,0,'2025-01-06 06:38:27'),
(135,0,0,0,31,60,19,1,0,'2025-01-06 06:38:29'),
(136,0,0,0,31,60,19,1,0,'2025-01-06 06:38:31'),
(137,0,0,0,31,60,19,1,0,'2025-01-06 06:38:33'),
(138,0,0,0,31,60,19,1,0,'2025-01-06 06:38:35'),
(139,0,0,0,31,60,19,1,0,'2025-01-06 06:38:37'),
(140,0,0,0,31,60,19,1,0,'2025-01-06 06:38:39'),
(141,0,0,0,31,60,19,1,0,'2025-01-06 06:38:41'),
(142,0,0,0,31,60,19,1,0,'2025-01-06 06:38:43');
/*!40000 ALTER TABLE `sensor_monitor_sensorreading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_testing_testresult`
--

DROP TABLE IF EXISTS `system_testing_testresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_testing_testresult` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `response_time_ms` double NOT NULL,
  `sensor_accuracy` double NOT NULL,
  `pathfinding_time_ms` double NOT NULL,
  `notes` longtext DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `scenario_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `system_testing_testr_scenario_id_fb17c5cc_fk_system_te` (`scenario_id`),
  CONSTRAINT `system_testing_testr_scenario_id_fb17c5cc_fk_system_te` FOREIGN KEY (`scenario_id`) REFERENCES `system_testing_testscenario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_testing_testresult`
--

LOCK TABLES `system_testing_testresult` WRITE;
/*!40000 ALTER TABLE `system_testing_testresult` DISABLE KEYS */;
INSERT INTO `system_testing_testresult` VALUES
(1,12.63427734375,95.84725951562392,3.607662684101822,'Simulated successfully.','2025-01-13 04:42:52.491058',1),
(2,4.06956672668457,97.35804259434244,3.7830319083294275,'Simulated successfully.','2025-01-13 04:42:52.508843',2),
(3,3.423929214477539,91.90551507611998,4.217175608456194,'Simulated successfully.','2025-01-13 04:42:52.520174',3),
(4,7.972240447998047,98.5128855489556,3.5876400541553553,'Simulated successfully.','2025-01-13 04:43:48.183075',4),
(5,2.9146671295166016,91.9251782328879,4.408222743791026,'Simulated successfully.','2025-01-13 04:43:48.192255',5),
(6,3.6263465881347656,92.8272280059446,4.680520784642774,'Simulated successfully.','2025-01-13 04:43:48.204365',6),
(7,8.653879165649414,96.21078502106289,4.627501794918655,'Simulated successfully.','2025-01-13 04:44:46.767527',7),
(8,3.656625747680664,91.10120923086593,3.891063971906119,'Simulated successfully.','2025-01-13 04:44:46.777716',8),
(9,3.7889480590820312,91.97923007691118,4.521687245404709,'Simulated successfully.','2025-01-13 04:44:46.787437',9),
(10,9.644269943237305,93.21657792858271,4.806027091068355,'Simulated successfully.','2025-01-13 04:44:49.623507',10),
(11,3.6835670471191406,98.17639548518025,4.274669248289546,'Simulated successfully.','2025-01-13 04:44:49.633431',11),
(12,3.087759017944336,93.81571436247827,3.4524781110984737,'Simulated successfully.','2025-01-13 04:44:49.644906',12),
(13,8.508682250976562,97.73980476000456,3.331654047240151,'Simulated successfully.','2025-01-13 04:45:28.162214',13),
(14,2.740621566772461,92.58356435445417,4.041970652916843,'Simulated successfully.','2025-01-13 04:45:28.170286',14),
(15,3.553152084350586,98.34266476960076,3.961788707652926,'Simulated successfully.','2025-01-13 04:45:28.180185',15),
(16,9.34743881225586,98.90687665592779,4.414546862669971,'Simulated successfully.','2025-01-13 04:46:17.989865',16),
(17,3.2074451446533203,90.5326280045093,3.8908469413392464,'Simulated successfully.','2025-01-13 04:46:17.999209',17),
(18,3.461599349975586,91.04360021867039,4.975938844622228,'Simulated successfully.','2025-01-13 04:46:18.012314',18),
(19,86.27724647521973,95.09175678831991,4.032025397536623,'Emergencies at [\'A\'], closed paths: [\'A-B\', \'A-F\'].','2025-01-13 05:45:15.582572',19),
(20,88.27686309814453,92.2619844208493,4.961164784961592,'Emergencies at [\'A\'], closed paths: [\'A-E\', \'A-F\'].','2025-01-13 05:46:15.430846',20),
(21,86.87853813171387,98.10007075585393,3.20633175157936,'Emergencies at [\'G\'], closed paths: [\'A-B\'].','2025-01-13 05:46:32.840098',21);
/*!40000 ALTER TABLE `system_testing_testresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_testing_testscenario`
--

DROP TABLE IF EXISTS `system_testing_testscenario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_testing_testscenario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_testing_testscenario`
--

LOCK TABLES `system_testing_testscenario` WRITE;
/*!40000 ALTER TABLE `system_testing_testscenario` DISABLE KEYS */;
INSERT INTO `system_testing_testscenario` VALUES
(1,'Single Emergency - Flame','Flame detected at Node A.','2025-01-13 04:42:52.485831'),
(2,'Multiple Emergencies - Flame and Smoke','Flame at Node A and smoke at Node B.','2025-01-13 04:42:52.505367'),
(3,'Dynamic Conditions','Conditions change during evacuation.','2025-01-13 04:42:52.517528'),
(4,'Single Emergency - Flame','Flame detected at Node A.','2025-01-13 04:43:48.177620'),
(5,'Multiple Emergencies - Flame and Smoke','Flame at Node A and smoke at Node B.','2025-01-13 04:43:48.189130'),
(6,'Dynamic Conditions','Conditions change during evacuation.','2025-01-13 04:43:48.198919'),
(7,'Single Emergency - Flame','Flame detected at Node A.','2025-01-13 04:44:46.761489'),
(8,'Multiple Emergencies - Flame and Smoke','Flame at Node A and smoke at Node B.','2025-01-13 04:44:46.773932'),
(9,'Dynamic Conditions','Conditions change during evacuation.','2025-01-13 04:44:46.784703'),
(10,'Single Emergency - Flame','Flame detected at Node A.','2025-01-13 04:44:49.618679'),
(11,'Multiple Emergencies - Flame and Smoke','Flame at Node A and smoke at Node B.','2025-01-13 04:44:49.630441'),
(12,'Dynamic Conditions','Conditions change during evacuation.','2025-01-13 04:44:49.639838'),
(13,'Single Emergency - Flame','Flame detected at Node A.','2025-01-13 04:45:28.156512'),
(14,'Multiple Emergencies - Flame and Smoke','Flame at Node A and smoke at Node B.','2025-01-13 04:45:28.167833'),
(15,'Dynamic Conditions','Conditions change during evacuation.','2025-01-13 04:45:28.176974'),
(16,'Single Emergency - Flame','Flame detected at Node A.','2025-01-13 04:46:17.984603'),
(17,'Multiple Emergencies - Flame and Smoke','Flame at Node A and smoke at Node B.','2025-01-13 04:46:17.996167'),
(18,'Dynamic Conditions','Conditions change during evacuation.','2025-01-13 04:46:18.009359'),
(19,'Custom Emergency Scenario','User-defined emergency nodes and closed paths.','2025-01-13 05:45:15.576008'),
(20,'Custom Emergency Scenario','User-defined emergency nodes and closed paths.','2025-01-13 05:46:15.425593'),
(21,'Custom Emergency Scenario','User-defined emergency nodes and closed paths.','2025-01-13 05:46:32.835124');
/*!40000 ALTER TABLE `system_testing_testscenario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_management_customuser`
--

DROP TABLE IF EXISTS `user_management_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_management_customuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `role` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_management_customuser`
--

LOCK TABLES `user_management_customuser` WRITE;
/*!40000 ALTER TABLE `user_management_customuser` DISABLE KEYS */;
INSERT INTO `user_management_customuser` VALUES
(2,'pbkdf2_sha256$870000$Y0qQYIAu8I9e5aQ9vD2Evm$xT3TbtZ5ldIlN4JMEp8zgaNpLTnfRZWGWNqmcZl5dQM=','2025-01-20 03:26:57.727114',1,'amani','Afiq','Amani','ahmadafiqamani@gmail.com',1,1,'2025-01-09 17:35:28.841326','admin'),
(3,'pbkdf2_sha256$870000$KmBeZhWu4W8hDlc5rEZJ3Q$ajO9CPA24+WnlmfnYTKnCxQxilaixi3Zj8FS2a4NJ4k=','2025-01-12 09:52:29.882064',1,'amanibasicuser','','','',1,1,'2025-01-12 09:49:06.228601','basic');
/*!40000 ALTER TABLE `user_management_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_management_customuser_groups`
--

DROP TABLE IF EXISTS `user_management_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_management_customuser_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_management_customus_customuser_id_group_id_5c501b9c_uniq` (`customuser_id`,`group_id`),
  KEY `user_management_cust_group_id_89c2ce00_fk_auth_grou` (`group_id`),
  CONSTRAINT `user_management_cust_customuser_id_66e96b95_fk_user_mana` FOREIGN KEY (`customuser_id`) REFERENCES `user_management_customuser` (`id`),
  CONSTRAINT `user_management_cust_group_id_89c2ce00_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_management_customuser_groups`
--

LOCK TABLES `user_management_customuser_groups` WRITE;
/*!40000 ALTER TABLE `user_management_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_management_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_management_customuser_user_permissions`
--

DROP TABLE IF EXISTS `user_management_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_management_customuser_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_management_customus_customuser_id_permission_e37ca3bb_uniq` (`customuser_id`,`permission_id`),
  KEY `user_management_cust_permission_id_6b578585_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_management_cust_customuser_id_955b4f91_fk_user_mana` FOREIGN KEY (`customuser_id`) REFERENCES `user_management_customuser` (`id`),
  CONSTRAINT `user_management_cust_permission_id_6b578585_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_management_customuser_user_permissions`
--

LOCK TABLES `user_management_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `user_management_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_management_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-20 11:58:32
