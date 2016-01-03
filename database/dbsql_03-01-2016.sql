CREATE DATABASE  IF NOT EXISTS `pensoft` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pensoft`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: pensoft
-- ------------------------------------------------------
-- Server version	5.6.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `candidateid` int(10) unsigned DEFAULT NULL,
  `joboffersid` int(10) unsigned DEFAULT NULL,
  `statusid` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `applications_candidateid_foreign` (`candidateid`),
  KEY `applications_joboffersid_foreign` (`joboffersid`),
  KEY `applications_statusid_foreign` (`statusid`),
  CONSTRAINT `applications_candidateid_foreign` FOREIGN KEY (`candidateid`) REFERENCES `candidates` (`id`),
  CONSTRAINT `applications_joboffersid_foreign` FOREIGN KEY (`joboffersid`) REFERENCES `joboffers` (`id`),
  CONSTRAINT `applications_statusid_foreign` FOREIGN KEY (`statusid`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidates`
--

DROP TABLE IF EXISTS `candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `experienceid` int(10) unsigned DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `candidates_experienceid_foreign` (`experienceid`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidates`
--

LOCK TABLES `candidates` WRITE;
/*!40000 ALTER TABLE `candidates` DISABLE KEYS */;
INSERT INTO `candidates` VALUES (7,'Alabala',0,'2016-01-01 10:57:56','2016-01-01 10:57:56'),(8,'dsfsds',0,'2016-01-02 20:07:19','2016-01-02 20:07:19'),(9,'dsdfs',0,'2016-01-02 20:08:26','2016-01-02 20:08:26'),(10,'xvcv',0,'2016-01-02 22:48:44','2016-01-02 22:48:44'),(11,'asdsadad',0,'2016-01-03 07:45:35','2016-01-03 07:45:35'),(12,'Kameliya',0,'2016-01-03 09:02:54','2016-01-03 09:02:54'),(13,'Kameliya Tincheva',0,'2016-01-03 09:53:51','2016-01-03 09:53:51'),(14,'Kameliya',0,'2016-01-03 10:26:27','2016-01-03 10:26:27'),(15,'asdadasdad',0,'2016-01-03 10:38:30','2016-01-03 10:38:30'),(16,'sadadad',0,'2016-01-03 10:57:23','2016-01-03 10:57:23'),(17,'kamel',0,'2016-01-03 11:02:37','2016-01-03 11:02:37'),(18,'sadsada',0,'2016-01-03 11:04:00','2016-01-03 11:04:00'),(19,'sadada',0,'2016-01-03 11:05:37','2016-01-03 11:05:37'),(20,'Kameliya',0,'2016-01-03 11:09:36','2016-01-03 11:09:36'),(21,'Kameliya',0,'2016-01-03 11:15:16','2016-01-03 11:15:16'),(22,'sfsdfsfs',0,'2016-01-03 11:15:38','2016-01-03 11:15:38'),(23,'sdad',0,'2016-01-03 11:16:21','2016-01-03 11:16:21'),(24,'sdadada',0,'2016-01-03 11:18:41','2016-01-03 11:18:41'),(25,'zxczczc',0,'2016-01-03 11:21:53','2016-01-03 11:21:53'),(26,'asdasda',0,'2016-01-03 11:42:26','2016-01-03 11:42:26'),(27,'xvxcvx',0,'2016-01-03 11:42:54','2016-01-03 11:42:54'),(28,'xzczxzcz',0,'2016-01-03 11:43:41','2016-01-03 11:43:41'),(29,'z\\x\\xz\\xz\\',0,'2016-01-03 11:54:50','2016-01-03 11:54:50'),(30,'z\\x\\xz\\xz\\',0,'2016-01-03 11:55:05','2016-01-03 11:55:05'),(31,'CXVXV',0,'2016-01-03 11:58:10','2016-01-03 11:58:10'),(32,'CXCX',0,'2016-01-03 12:01:02','2016-01-03 12:01:02'),(33,'fsfsdfsdf',0,'2016-01-03 12:06:02','2016-01-03 12:06:02'),(34,'sdadas',0,'2016-01-03 12:08:10','2016-01-03 12:08:10'),(35,'dsdada',0,'2016-01-03 12:14:17','2016-01-03 12:14:17'),(36,'sdsada',0,'2016-01-03 12:15:03','2016-01-03 12:15:03'),(37,'sdadasd',0,'2016-01-03 12:17:18','2016-01-03 12:17:18'),(38,'dfsfddsf',0,'2016-01-03 12:19:43','2016-01-03 12:19:43'),(39,'xvxcvxc',0,'2016-01-03 12:26:09','2016-01-03 12:26:09'),(40,'czxczc',0,'2016-01-03 12:28:53','2016-01-03 12:28:53'),(41,'asdada',0,'2016-01-03 12:41:39','2016-01-03 12:41:39'),(42,'dsdada',0,'2016-01-03 12:43:35','2016-01-03 12:43:35'),(43,'kam',0,'2016-01-03 12:59:48','2016-01-03 12:59:48'),(44,'dasdad',0,'2016-01-03 13:04:47','2016-01-03 13:04:47'),(45,'dsfsfsfsf',0,'2016-01-03 15:42:41','2016-01-03 15:42:41');
/*!40000 ALTER TABLE `candidates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experience` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `experience_lebel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience`
--

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
INSERT INTO `experience` VALUES (1,'Less tnan 1 yaer','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'1 yaer','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'3 years','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'5 years','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'More than 5 years','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joboffers`
--

DROP TABLE IF EXISTS `joboffers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `joboffers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `experience_id` tinyint(4) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joboffers`
--

LOCK TABLES `joboffers` WRITE;
/*!40000 ALTER TABLE `joboffers` DISABLE KEYS */;
INSERT INTO `joboffers` VALUES (7,'Test job 7',3,'test again','2016-01-03 14:19:24','2016-01-03 15:36:04'),(8,'weqeq wewqeqeqe',4,'eqewqewqewq sdfsdfsf','2016-01-03 14:20:47','2016-01-03 16:46:09'),(13,'weqeq',0,'Test 45','2016-01-03 14:31:10','2016-01-03 16:09:49'),(14,'weqeq',0,'eqewqewqewq','2016-01-03 14:31:21','2016-01-03 14:31:21'),(15,'weqeq sdsad',2,'eqewqewqewq dfsdf','2016-01-03 14:34:08','2016-01-03 16:25:30'),(16,'dasdsads dsdad',3,'sadasdasd asddada','2016-01-03 14:37:30','2016-01-03 16:46:03'),(17,'weqeq',3,'eqewq','2016-01-03 14:38:26','2016-01-03 16:48:31'),(20,'zzxzcxzc',2,'zxczxc','2016-01-03 17:06:48','2016-01-03 17:06:48'),(21,'xczczc   fvcvxv',4,'zxczcz xvxcvxv','2016-01-03 17:08:47','2016-01-03 17:08:57');
/*!40000 ALTER TABLE `joboffers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table',1),('2014_10_12_100000_create_password_resets_table',1),('2015_12_31_191717_create_joboffers_table',1),('2015_12_31_194355_create_statuses_table',1),('2016_01_01_070456_create_experience_table',1),('2016_01_01_070601_create_candidates_table',1),('2016_01_01_071916_create_applications_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'progress','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'finalist','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'selected','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'discarded','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'Kameliya Tincheva','ktincheva@gmail.com','$2y$10$7Uh7AoI3Cys6/qYQHbLzCumsNHw1kxk3y3mytnkCAxkZQaH5IppUm',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-03 21:47:40
