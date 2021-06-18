-- MySQL dump 10.13  Distrib 8.0.19, for osx10.14 (x86_64)
--
-- Host: localhost    Database: blog_db_new
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` longtext,
  `text` text,
  `published_at` datetime DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `catagories_id` int DEFAULT NULL,
  `users_id` int DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (11,'test test test tes update','test-test-test-tes','<p>test test test tes&nbsp;test test test tes&nbsp;test test test tes<br></p>',NULL,NULL,1,'2020-11-30 09:08:57','2020-12-28 09:45:52',2,1,'caa650e1fad92fdd8c89724ee319a68c.jpg'),(12,'test test test tes','test-test-test-tes','<p>test test test tes&nbsp;test test test tes&nbsp;test test test tes<br></p>',NULL,NULL,1,'2020-11-30 09:09:50','2020-11-30 09:09:50',1,NULL,'caa650e1fad92fdd8c89724ee319a68c.jpg'),(13,'test test new','test-test-new','<p>test test new&nbsp;test test newtest test new&nbsp;test test newtest test new&nbsp;test test newtest test new&nbsp;test test new<br></p>',NULL,NULL,1,'2020-12-01 05:56:54','2020-12-01 06:22:24',1,2,'caa650e1fad92fdd8c89724ee319a68c.jpg'),(14,'test test debug','test-test-debug','<p>test test debug<br></p>',NULL,NULL,1,'2020-12-01 06:02:23','2020-12-01 06:22:29',1,2,'648329005a4885c364d3f1314e0738a3.jpeg'),(15,'test test 7','test-test-7','<p>test test 7&nbsp;test test 7<br></p>',NULL,NULL,1,'2020-12-01 10:45:47','2020-12-01 10:45:47',5,2,'caa650e1fad92fdd8c89724ee319a68c.jpg');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catagories`
--

DROP TABLE IF EXISTS `catagories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catagories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` longtext,
  `published_at` datetime DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `users_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catagories`
--

LOCK TABLES `catagories` WRITE;
/*!40000 ALTER TABLE `catagories` DISABLE KEYS */;
INSERT INTO `catagories` VALUES (1,'General info update','General info','<p>General info&nbsp;General info<br></p>',NULL,1,'2020-11-25 10:09:01','2020-12-02 02:38:39',1),(2,'test test 1','test test 1','<p>test test 1<br></p>',NULL,1,'2020-12-01 10:06:48','2020-12-01 10:06:48',1),(3,'test test 2','test test 2','<p>test test 1<br></p>',NULL,1,'2020-12-01 10:07:02','2020-12-01 10:07:02',1),(4,'test test 3','test test 3','<p>test test 3<br></p>',NULL,0,'2020-12-01 10:07:15','2020-12-01 10:07:15',1);
/*!40000 ALTER TABLE `catagories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_attachments`
--

DROP TABLE IF EXISTS `post_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_attachments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` int DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_attachments`
--

LOCK TABLES `post_attachments` WRITE;
/*!40000 ALTER TABLE `post_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_attachments` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `user_menu_actions`
--

DROP TABLE IF EXISTS `user_menu_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_menu_actions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_menu_id` int DEFAULT NULL,
  `menuType` int DEFAULT NULL,
  `actionName` varchar(255) DEFAULT NULL,
  `actionLink` varchar(255) DEFAULT NULL,
  `orderBy` int DEFAULT NULL,
  `actionStatus` tinyint DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_menu_actions`
--

LOCK TABLES `user_menu_actions` WRITE;
/*!40000 ALTER TABLE `user_menu_actions` DISABLE KEYS */;
INSERT INTO `user_menu_actions` VALUES (1,2,2,'Add','new',1,1,'2020-12-10 07:19:48','2020-12-10 08:50:00'),(2,2,3,'Edit','edit',2,1,'2020-12-10 07:24:30','2021-01-05 06:14:26'),(3,2,4,'Published','publish',3,1,'2020-12-10 07:25:09','2020-12-10 08:57:53'),(4,2,5,'Unpublished','unpublish',4,1,'2020-12-10 07:25:32','2020-12-10 08:55:49'),(5,2,NULL,'Delete','destroy',5,1,'2020-12-10 07:25:54','2020-12-10 08:58:18'),(6,4,2,'Add','new',6,1,'2020-12-10 08:59:31','2020-12-10 08:59:31'),(7,4,3,'Edit','edit',7,1,'2020-12-10 08:59:46','2020-12-10 08:59:46'),(8,4,4,'Published','publish',8,1,'2020-12-10 09:00:03','2020-12-10 09:00:03'),(9,4,5,'Unpublished','unpublish',9,1,'2020-12-10 09:00:30','2020-12-10 09:00:30'),(10,4,6,'Delete','destroy',10,1,'2020-12-10 09:01:14','2020-12-10 09:01:14'),(11,5,2,'add','new',11,1,'2020-12-10 09:01:40','2020-12-10 09:01:40'),(12,5,3,'Edit','edit',12,1,'2020-12-10 09:01:51','2020-12-10 09:01:51'),(13,5,4,'Published','publish',13,1,'2020-12-10 09:02:06','2020-12-10 09:02:06'),(14,5,5,'Unpublished','unpublish',14,1,'2020-12-10 09:02:22','2020-12-10 09:02:22'),(15,5,6,'Delete','destroy',15,1,'2020-12-10 09:02:39','2020-12-10 09:02:39'),(16,7,NULL,'Add','index',16,1,'2020-12-30 03:03:43','2020-12-30 03:06:34'),(17,7,NULL,'Add','new',17,1,'2020-12-30 03:04:34','2020-12-30 03:11:03'),(18,7,3,'Edit','edit',18,1,'2020-12-30 03:05:03','2020-12-30 03:13:27'),(19,7,4,'Published','publish',19,1,'2020-12-30 03:06:08','2020-12-30 03:36:51'),(20,8,1,'show','index',20,1,'2020-12-30 03:53:06','2021-01-06 04:01:11'),(21,8,2,'Add','new',21,1,'2020-12-30 03:53:26','2020-12-30 03:53:26'),(22,8,3,'Edit','edit',22,1,'2020-12-30 03:53:46','2020-12-30 03:53:46'),(23,8,4,'published','published',23,1,'2020-12-30 03:54:15','2020-12-30 03:54:15'),(24,8,5,'unpublished','unpublished',24,1,'2020-12-30 03:54:32','2020-12-30 03:54:32'),(25,8,6,'Delete','destroy',25,1,'2020-12-30 03:54:49','2020-12-30 03:54:49'),(26,8,7,'View User menu','view',26,1,'2020-12-30 03:55:09','2020-12-30 03:55:09'),(27,2,7,'view','view',27,1,'2020-12-30 03:55:47','2021-01-05 10:48:04'),(28,7,9,'permission','permission',28,1,'2021-01-05 07:34:03','2021-01-05 07:34:03');
/*!40000 ALTER TABLE `user_menu_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_menus`
--

DROP TABLE IF EXISTS `user_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_menus` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parentMenu` varchar(255) DEFAULT NULL,
  `menuName` varchar(255) DEFAULT NULL,
  `menuLink` varchar(255) DEFAULT NULL,
  `menuIcon` varchar(255) DEFAULT NULL,
  `orderBy` int DEFAULT NULL,
  `menuStatus` tinyint DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_menus`
--

LOCK TABLES `user_menus` WRITE;
/*!40000 ALTER TABLE `user_menus` DISABLE KEYS */;
INSERT INTO `user_menus` VALUES (1,'','User Managment','#','fa fa-bars',5,1,'2020-12-09 06:59:57','2021-01-11 05:09:51'),(2,'1','Users','users','fas fa-user',6,1,'2020-12-09 08:27:45','2020-12-31 06:57:05'),(3,'','Content','#','fas fa-copy',2,1,'2020-12-09 08:58:34','2020-12-31 06:55:38'),(4,'3','Articles','articles','far fa-circle',4,1,'2020-12-09 08:59:28','2020-12-09 08:59:28'),(5,'3','Catagories','catagories','far fa-circle',3,1,'2020-12-09 09:00:21','2020-12-31 06:55:54'),(6,'','Dashboard','dashboard','fas fa-th',1,1,'2020-12-09 09:01:00','2020-12-31 06:55:13'),(7,'1','Role','user_roles','fas fa-copy',7,1,'2020-12-30 03:01:44','2020-12-31 06:52:47'),(8,'1','Menus','user_menus','fas fa-copy',8,1,'2020-12-30 03:52:21','2020-12-30 03:52:21');
/*!40000 ALTER TABLE `user_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `menuType` int DEFAULT NULL,
  `permission` text,
  `actionPermission` text,
  `status` tinyint DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (3,'Super User',NULL,'1,2,3,4,5,6,7,8','1,2,3,4,5,27,6,7,8,9,10,11,12,13,14,15,16,17,18,19,28,20,21,22,23,24,25,26',1,'2020-12-30 06:47:43','2021-01-05 08:54:14'),(4,'Admin',NULL,'3,4,5,6','6,7,11,12',1,'2020-12-30 06:47:51','2021-01-07 05:00:43'),(5,'Editor',NULL,'3,4,5,6','7,12',1,'2020-12-31 05:42:26','2020-12-31 05:48:40');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `encrypted_password` varchar(128) NOT NULL,
  `confirmation_token` varchar(128) DEFAULT NULL,
  `remember_token` varchar(128) NOT NULL,
  `f_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `l_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `user_roles_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_users_on_email` (`email`),
  KEY `index_users_on_remember_token` (`remember_token`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2019-12-09 04:34:14','2021-01-21 03:23:34','mdjalal2012@gmail.com','$2a$12$zKsjvsvUmMPlEm66sVXFROcHwMY.ohxAAJdg2UnkfjDxQgY3lb0Oy',NULL,'29d424005cb7d461d0ed64928eec4cb1372ef6b2','shah','Jalal','shahjalal7311','017856827565','3'),(2,'2019-12-09 04:34:14','2021-01-07 05:01:22','mdjalal201@gmail.com','$2a$12$o5znqNd6wknU7H4Hepi5juoWZXyWTTLae4mpND/NHIcGVBXPEhY3q',NULL,'4aaa5236aab8937f2a3bac87aed77ce281a01be6','shah','Jalal','shahjalal7311','01923480997','4'),(3,'2019-12-09 04:34:14','2021-01-05 07:26:41','mdjalal20@gmail.com','$2a$12$EtPNDsM5vN/ij8GWYAi3jux.VCsjs.Fe/dxL8uaXKedQaklDtV2Ja',NULL,'d50d02f00fab13b91abf50cd3356eccbfdabf9a4','shah','Jalal','shahjalal7311',NULL,NULL),(4,'2019-12-09 04:34:14','2020-12-03 09:03:42','mdjalal2@gmail.com','$2a$12$EtPNDsM5vN/ij8GWYAi3jux.VCsjs.Fe/dxL8uaXKedQaklDtV2Ja',NULL,'882220cbd13b6c4bb44ad8aa84701c40a1bce009','shah','Jalal','shahjalal7311',NULL,NULL),(5,'2020-11-26 06:08:48','2021-01-07 04:57:28','shahjalal7311@gmail.com','$2a$12$QFZutBO7hDyFW2apcIqqQ.ZWy0aaAZ4BpyC2.ORv6oBcW6XfZMET.',NULL,'ecbe468d2d7f2fee0ed103e8f964d55bc2736cc8','shah','jalal','shah7311','01923480997',NULL),(6,'2020-12-02 02:44:10','2020-12-03 09:49:26','mdjalal20123@gmail.com','$2a$12$z8b1DO9a.v4.Av6uCfI2VOM/y5dBNAQutUCuRS2jk6kJG0gf6ovVW',NULL,'455ee4c6cb5764f39e5240b14410aef33b4b64d5','shahjalal','jalal','shahjalal89','01234567890',NULL),(7,'2020-12-03 09:06:57','2021-01-07 02:23:25','shah7311@gmail.com','$2a$12$x1ESvudGylIgqO1ir7yGlO5c8ERQlFKN6SvvJM7zeWBvh.DvP2ohG',NULL,'dbfc2466f010f81113dadfeb66c8933d3ef8d8fa','shahjk','jalal','shahj7311','01923486768','5');
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

-- Dump completed on 2021-01-29 10:57:09
