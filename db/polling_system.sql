-- MySQL dump 10.13  Distrib 8.1.0, for macos14.0 (arm64)
--
-- Host: localhost    Database: polling_system
-- ------------------------------------------------------
-- Server version	8.1.0

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

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP,
  `text` varchar(255) NOT NULL,
  `poll_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `options_polls` (`poll_id`),
  CONSTRAINT `options_polls` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (3,'2023-11-25 11:02:59','2023-11-25 13:02:59','PHP',1),(4,'2023-11-25 11:02:59','2023-11-25 13:02:59','C#',1),(5,'2023-11-25 11:02:59','2023-11-25 13:02:59','JAVA',1),(6,'2023-11-25 11:02:59','2023-11-25 13:02:59','Python',1),(7,'2023-11-25 11:02:59','2023-11-25 13:02:59','C',1),(8,'2023-11-25 11:02:59','2023-11-25 13:02:59','C++',1);
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_results`
--

DROP TABLE IF EXISTS `poll_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poll_results` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `option_id` int NOT NULL,
  `poll_id` int NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `option_id` (`option_id`),
  KEY `polls_results_polls` (`poll_id`),
  KEY `polls_results_users` (`user_id`),
  CONSTRAINT `polls_results_options` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`),
  CONSTRAINT `polls_results_polls` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`),
  CONSTRAINT `polls_results_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_results`
--

LOCK TABLES `poll_results` WRITE;
/*!40000 ALTER TABLE `poll_results` DISABLE KEYS */;
INSERT INTO `poll_results` VALUES (7,14,6,1,'2023-11-26 18:44:49','2023-11-26 20:44:49');
/*!40000 ALTER TABLE `poll_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls`
--

DROP TABLE IF EXISTS `polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polls` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `question` (`question`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls`
--

LOCK TABLES `polls` WRITE;
/*!40000 ALTER TABLE `polls` DISABLE KEYS */;
INSERT INTO `polls` VALUES (1,'What is your favourite coding language?','2023-11-24 23:14:46','2023-11-25 01:14:46');
/*!40000 ALTER TABLE `polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John','Doe','email@gmail.com','e0f1c78766c505f987c9fa3b3ad4c688'),(2,'John','Doe','nsaail@gmail.com','e0f1c78766c505f987c9fa3b3ad4c688'),(4,'','','Doe','05952cc071fcf6101d751da6bc1825f2'),(5,'why','mara','nice','c02f44b130a46db6b23648743cd86c27'),(6,'why','mara','jupstPSS','b8caa387ec500e04cda98ad9734b8c0f'),(7,'why','mara','jupstPaSS','b8caa387ec500e04cda98ad9734b8c0f'),(8,'why','mara','jupsstPdaSS','b8caa387ec500e04cda98ad9734b8c0f'),(9,'why','mara','jupsstPedaSS','b8caa387ec500e04cda98ad9734b8c0f'),(10,'John','Doe','Doe@effrgr.com','faa9f00e9223eaab365e75f3713076b0'),(11,'John','Doe','why@mlog.com','b3e6c1ac0b994ca3d393c6366ef19806'),(12,'John','Doe','lll@mlog.com','b8caa387ec500e04cda98ad9734b8c0f'),(13,'mokoko','Mahlangu','mokoko@gmail.com','ed98bcf77331568751227a6d914770e3'),(14,'moo','work','maloba@gmail.com','ed98bcf77331568751227a6d914770e3'),(15,'John','Doe','melolo','ed98bcf77331568751227a6d914770e3'),(16,'Jon','mo','jane@gmail.com','ed98bcf77331568751227a6d914770e3'),(17,'John','Doe','Doe@gmail.com','ed98bcf77331568751227a6d914770e3');
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

-- Dump completed on 2023-11-27  8:26:36
