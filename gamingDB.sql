-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: gaming
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `gamer`
--

DROP TABLE IF EXISTS `gamer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamer` (
  `GAMER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `GAMER_NAME` varchar(30) NOT NULL,
  PRIMARY KEY (`GAMER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamer`
--

LOCK TABLES `gamer` WRITE;
/*!40000 ALTER TABLE `gamer` DISABLE KEYS */;
INSERT INTO `gamer` VALUES (1,'Neil'),(3,'Joe'),(6,'Neil');
/*!40000 ALTER TABLE `gamer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GAME_NAME` varchar(30) NOT NULL,
  `GENRE` varchar(30) NOT NULL,
  `GAME_CONSOLE` varchar(30) NOT NULL,
  `PUBLISHER` varchar(30) DEFAULT NULL,
  `RELEASE_DATE` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,'Doom','Shooter','PC','','1993-12-10'),(2,'Zelda: Ocarina of Time','action-adventure','N64','Nintendo ',NULL),(6,'Minecraft','Sandbox','Xbox 1','Mojang ',NULL),(7,'Skyrim','RPG','Playstation 3','','2011-11-11');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games_on_list`
--

DROP TABLE IF EXISTS `games_on_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games_on_list` (
  `GAME_ID` int(11) NOT NULL,
  `LIST_ID` int(11) NOT NULL,
  KEY `LIST_ID` (`LIST_ID`),
  KEY `GAME_ID` (`GAME_ID`),
  CONSTRAINT `games_on_list_ibfk_1` FOREIGN KEY (`LIST_ID`) REFERENCES `list_details` (`LIST_ID`),
  CONSTRAINT `games_on_list_ibfk_2` FOREIGN KEY (`GAME_ID`) REFERENCES `games` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games_on_list`
--

LOCK TABLES `games_on_list` WRITE;
/*!40000 ALTER TABLE `games_on_list` DISABLE KEYS */;
INSERT INTO `games_on_list` VALUES (7,2),(6,2),(1,5),(2,5),(7,5);
/*!40000 ALTER TABLE `games_on_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_details`
--

DROP TABLE IF EXISTS `list_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_details` (
  `LIST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LIST_NAME` varchar(30) DEFAULT NULL,
  `GAMER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LIST_ID`),
  KEY `GAMER_ID` (`GAMER_ID`),
  CONSTRAINT `list_details_ibfk_1` FOREIGN KEY (`GAMER_ID`) REFERENCES `gamer` (`GAMER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_details`
--

LOCK TABLES `list_details` WRITE;
/*!40000 ALTER TABLE `list_details` DISABLE KEYS */;
INSERT INTO `list_details` VALUES (2,'Joe\'s List',3),(5,'My list',6);
/*!40000 ALTER TABLE `list_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-10 15:55:58
