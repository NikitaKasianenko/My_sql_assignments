-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: football__v3
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `goals`
--

DROP TABLE IF EXISTS `goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `match_id` int NOT NULL,
  `player_id` int NOT NULL,
  `team_id` int NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `match_id` (`match_id`),
  KEY `player_id` (`player_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `goals_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`),
  CONSTRAINT `goals_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`),
  CONSTRAINT `goals_ibfk_3` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goals`
--

LOCK TABLES `goals` WRITE;
/*!40000 ALTER TABLE `goals` DISABLE KEYS */;
INSERT INTO `goals` VALUES (1,1,7,1,'00:35:00'),(2,1,6,2,'00:40:00'),(3,2,7,1,'00:25:00'),(4,3,3,3,'00:20:00'),(5,4,5,4,'00:15:00'),(6,5,4,5,'00:30:00'),(7,6,6,6,'00:10:00'),(8,7,1,7,'00:40:00'),(9,4,2,4,'00:50:00'),(10,5,1,6,'00:20:00'),(11,6,7,2,'00:45:00'),(12,7,4,3,'00:10:00'),(13,8,3,1,'00:25:00'),(14,9,5,5,'00:35:00'),(15,10,6,7,'00:55:00'),(16,11,1,4,'00:15:00'),(17,12,7,6,'00:40:00'),(18,13,2,3,'00:20:00');
/*!40000 ALTER TABLE `goals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leagues`
--

DROP TABLE IF EXISTS `leagues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leagues` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `number_of_teams` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leagues`
--

LOCK TABLES `leagues` WRITE;
/*!40000 ALTER TABLE `leagues` DISABLE KEYS */;
INSERT INTO `leagues` VALUES (1,'Ligue 1',20),(2,'Premier League',20),(3,'Bundesliga',18),(4,'La Liga',20),(5,'Serie A',20),(6,'Eredivisie',18),(7,'Primeira Liga',18);
/*!40000 ALTER TABLE `leagues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_days`
--

DROP TABLE IF EXISTS `match_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match_days` (
  `id` int NOT NULL AUTO_INCREMENT,
  `season_id` int NOT NULL,
  `league_id` int NOT NULL,
  `day_number` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `season_league_day_unique` (`season_id`,`league_id`,`day_number`),
  KEY `league_id` (`league_id`),
  CONSTRAINT `match_days_ibfk_1` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`),
  CONSTRAINT `match_days_ibfk_2` FOREIGN KEY (`league_id`) REFERENCES `leagues` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_days`
--

LOCK TABLES `match_days` WRITE;
/*!40000 ALTER TABLE `match_days` DISABLE KEYS */;
INSERT INTO `match_days` VALUES (1,1,1,1),(2,1,1,2),(3,1,1,3),(4,2,2,1),(5,2,2,2),(6,2,2,3),(7,3,3,1),(8,4,4,4),(9,4,5,4),(10,4,6,4),(11,5,1,5),(12,5,2,5),(13,5,3,5),(14,6,4,6),(15,6,5,6),(16,6,6,6),(17,7,1,7);
/*!40000 ALTER TABLE `match_days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime NOT NULL,
  `venue` varchar(255) NOT NULL,
  `home_team_id` int DEFAULT NULL,
  `away_team_id` int DEFAULT NULL,
  `home_score` int NOT NULL,
  `away_score` int NOT NULL,
  `match_day_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `home_team_id` (`home_team_id`),
  KEY `away_team_id` (`away_team_id`),
  KEY `match_day_id` (`match_day_id`),
  CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`home_team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`away_team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `matches_ibfk_3` FOREIGN KEY (`match_day_id`) REFERENCES `match_days` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (1,'2025-08-12 18:00:00','Parc des Princes',1,2,3,1,1),(2,'2025-08-13 17:30:00','Anfield',2,1,2,2,1),(3,'2025-08-14 16:00:00','Allianz Arena',3,4,1,2,1),(4,'2026-08-12 18:00:00','Etihad Stadium',4,5,2,1,2),(5,'2026-08-13 17:30:00','Johan Cruyff Arena',5,6,1,3,2),(6,'2026-08-14 16:00:00','Allianz Stadium',6,7,2,2,2),(7,'2027-08-12 18:00:00','Stamford Bridge',7,1,1,2,3),(8,'2028-08-12 18:00:00','Etihad Stadium',3,2,2,0,4),(9,'2028-08-13 17:30:00','Allianz Stadium',6,1,4,1,4),(10,'2028-08-14 16:00:00','Anfield',2,4,3,2,4),(11,'2029-08-12 18:00:00','Allianz Arena',3,5,0,1,5),(12,'2029-08-13 17:30:00','Johan Cruyff Arena',5,6,2,3,5),(13,'2029-08-14 16:00:00','Stamford Bridge',7,3,1,0,5),(14,'2030-08-12 18:00:00','Parc des Princes',1,2,2,1,6),(15,'2030-08-13 17:30:00','Anfield',2,7,0,3,6),(16,'2030-08-14 16:00:00','Allianz Arena',3,1,4,0,6),(17,'2031-08-12 18:00:00','Etihad Stadium',4,6,3,1,7);
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `number` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Neymar','Jr','1992-02-05','Brazilian','ST',10),(2,'Virgil','van Dijk','1991-07-08','Dutch','CB',4),(3,'Kevin','De Bruyne','1991-06-28','Belgian','MID',17),(4,'Robert','Lewandowski','1988-08-21','Polish','ST',9),(5,'Kylian','Mbappe','1998-12-20','French','ST',7),(6,'Sergio','Aguero','1988-06-02','Argentinian','ST',10),(7,'Mohamed','Salah','1992-06-15','Egyptian','RW',11);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seasons`
--

DROP TABLE IF EXISTS `seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seasons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasons`
--

LOCK TABLES `seasons` WRITE;
/*!40000 ALTER TABLE `seasons` DISABLE KEYS */;
INSERT INTO `seasons` VALUES (1,'2025-2026'),(2,'2026-2027'),(3,'2027-2028'),(4,'2028-2029'),(5,'2029-2030'),(6,'2030-2031'),(7,'2031-2032');
/*!40000 ALTER TABLE `seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `standings`
--

DROP TABLE IF EXISTS `standings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `standings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `match_day_id` int NOT NULL,
  `team_id` int NOT NULL,
  `points` int NOT NULL,
  `played` int NOT NULL,
  `won` int NOT NULL,
  `drawn` int NOT NULL,
  `lost` int NOT NULL,
  `goals_for` int NOT NULL,
  `goals_against` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `match_day_id` (`match_day_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `standings_ibfk_1` FOREIGN KEY (`match_day_id`) REFERENCES `match_days` (`id`),
  CONSTRAINT `standings_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `standings`
--

LOCK TABLES `standings` WRITE;
/*!40000 ALTER TABLE `standings` DISABLE KEYS */;
INSERT INTO `standings` VALUES (1,1,1,3,1,1,0,0,3,1),(2,1,2,0,1,0,0,1,1,3),(3,2,1,3,1,1,0,0,4,1),(4,2,2,0,1,0,0,1,2,2),(5,2,3,3,1,1,0,0,1,2),(6,2,4,3,1,1,0,0,2,1),(7,2,5,0,1,0,0,1,1,2),(8,2,6,1,1,0,1,0,2,2),(9,2,7,3,1,1,0,0,1,0),(10,3,1,3,1,1,0,0,1,2),(11,3,2,1,1,0,1,0,2,2),(12,3,3,0,1,0,0,1,1,2),(13,3,4,0,1,0,0,1,1,2),(14,3,5,0,1,0,0,1,1,2),(15,3,6,0,1,0,0,1,1,2),(16,3,7,0,1,0,0,1,1,2);
/*!40000 ALTER TABLE `standings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_squads`
--

DROP TABLE IF EXISTS `team_squads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_squads` (
  `team_id` int NOT NULL,
  `player_id` int NOT NULL,
  PRIMARY KEY (`team_id`,`player_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `team_squads_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `team_squads_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_squads`
--

LOCK TABLES `team_squads` WRITE;
/*!40000 ALTER TABLE `team_squads` DISABLE KEYS */;
INSERT INTO `team_squads` VALUES (2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(3,2),(4,3),(6,4),(5,5),(2,6),(1,7),(2,7),(4,7),(6,7),(7,7);
/*!40000 ALTER TABLE `team_squads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `stadium` varchar(255) NOT NULL,
  `manager` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Paris Saint-Germain','Paris','Parc des Princes','Mauricio Pochettino'),(2,'Liverpool','Liverpool','Anfield','Jurgen Klopp'),(3,'Bayern Munich','Munich','Allianz Arena','Julian Nagelsmann'),(4,'Manchester City','Manchester','Etihad Stadium','Pep Guardiola'),(5,'Ajax','Amsterdam','Johan Cruyff Arena','Erik ten Hag'),(6,'Juventus','Turin','Allianz Stadium','Massimiliano Allegri'),(7,'Chelsea','London','Stamford Bridge','Thomas Tuchel');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-10 17:41:06
