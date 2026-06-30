-- MySQL dump 10.13  Distrib 9.6.0, for macos26.2 (arm64)
--
-- Host: localhost    Database: notionary_db
-- ------------------------------------------------------
-- Server version	9.6.0

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
-- Table structure for table `A Escala Geológica`
--

DROP TABLE IF EXISTS `A Escala Geológica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `A Escala Geológica` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aaadmin`
--

DROP TABLE IF EXISTS `aaadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aaadmin` (
  `userID` int NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aaavatar`
--

DROP TABLE IF EXISTS `aaavatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aaavatar` (
  `userID` int NOT NULL,
  `imageID` int NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aaconfo`
--

DROP TABLE IF EXISTS `aaconfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aaconfo` (
  `user` char(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `password` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `email` char(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `code` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aaemail`
--

DROP TABLE IF EXISTS `aaemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aaemail` (
  `userID` int NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aafname`
--

DROP TABLE IF EXISTS `aafname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aafname` (
  `userID` int NOT NULL,
  `fname` char(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aaformula`
--

DROP TABLE IF EXISTS `aaformula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aaformula` (
  `notionID` int NOT NULL,
  PRIMARY KEY (`notionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aaglobe`
--

DROP TABLE IF EXISTS `aaglobe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aaglobe` (
  `kodex` char(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `en` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `de` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `es` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `fr` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `pt` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `it` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `ru` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `hu` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`kodex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aaimage`
--

DROP TABLE IF EXISTS `aaimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aaimage` (
  `imageID` int NOT NULL AUTO_INCREMENT,
  `type` char(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `image` longblob NOT NULL,
  `size` char(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `name` char(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`imageID`)
) ENGINE=MyISAM AUTO_INCREMENT=11644 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aajamsg`
--

DROP TABLE IF EXISTS `aajamsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aajamsg` (
  `userID` int NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aakname`
--

DROP TABLE IF EXISTS `aakname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aakname` (
  `userID` int NOT NULL,
  `kname` char(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aalast`
--

DROP TABLE IF EXISTS `aalast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aalast` (
  `userID` int NOT NULL DEFAULT '0',
  `last` datetime NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aalogin`
--

DROP TABLE IF EXISTS `aalogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aalogin` (
  `userID` int DEFAULT NULL,
  `login` datetime NOT NULL,
  `ipadr` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aanosnd`
--

DROP TABLE IF EXISTS `aanosnd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aanosnd` (
  `userID` int NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aanotion`
--

DROP TABLE IF EXISTS `aanotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aanotion` (
  `notionID` int NOT NULL AUTO_INCREMENT,
  `userID` int DEFAULT NULL,
  `imageID` int DEFAULT NULL,
  `notion` char(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `slang` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `tlang` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `category` int DEFAULT NULL,
  `description` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`notionID`),
  KEY `userID` (`userID`),
  KEY `notion` (`notion`)
) ENGINE=MyISAM AUTO_INCREMENT=1822 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aaparam`
--

DROP TABLE IF EXISTS `aaparam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aaparam` (
  `kodex` char(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `value` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`kodex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aapart`
--

DROP TABLE IF EXISTS `aapart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aapart` (
  `notionID` int NOT NULL,
  `part` int NOT NULL DEFAULT '1',
  `cardinality` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`notionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aapdf`
--

DROP TABLE IF EXISTS `aapdf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aapdf` (
  `pdfID` int NOT NULL AUTO_INCREMENT,
  `type` char(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `pdf` longblob,
  `size` char(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `name` char(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`pdfID`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aapdfid`
--

DROP TABLE IF EXISTS `aapdfid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aapdfid` (
  `notionID` int NOT NULL,
  `pdfID` int NOT NULL,
  PRIMARY KEY (`notionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aaperfid`
--

DROP TABLE IF EXISTS `aaperfid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aaperfid` (
  `perfID` int NOT NULL AUTO_INCREMENT,
  `userID` int DEFAULT NULL,
  `notionID` int DEFAULT NULL,
  `ptype` int DEFAULT NULL,
  `dtime` datetime NOT NULL,
  `score` double NOT NULL,
  `elapsed` int NOT NULL,
  PRIMARY KEY (`perfID`),
  KEY `userID` (`userID`),
  KEY `notionID` (`notionID`)
) ENGINE=MyISAM AUTO_INCREMENT=6901 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aapiction`
--

DROP TABLE IF EXISTS `aapiction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aapiction` (
  `notionID` int NOT NULL,
  PRIMARY KEY (`notionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aaprobs`
--

DROP TABLE IF EXISTS `aaprobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aaprobs` (
  `perfID` int NOT NULL DEFAULT '0',
  `probs` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  KEY `testID` (`perfID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aarating`
--

DROP TABLE IF EXISTS `aarating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aarating` (
  `notionID` int NOT NULL,
  `userID` int NOT NULL,
  `rating` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aareview`
--

DROP TABLE IF EXISTS `aareview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aareview` (
  `notionID` int NOT NULL,
  `userID` int NOT NULL,
  `review` varchar(1500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  KEY `notionID` (`notionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aasound`
--

DROP TABLE IF EXISTS `aasound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aasound` (
  `soundID` int NOT NULL AUTO_INCREMENT,
  `type` char(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `sound` longblob NOT NULL,
  `size` char(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `name` char(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`soundID`)
) ENGINE=MyISAM AUTO_INCREMENT=11483 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aasperq`
--

DROP TABLE IF EXISTS `aasperq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aasperq` (
  `notionID` int NOT NULL,
  `sperq` int NOT NULL,
  PRIMARY KEY (`notionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aasuper`
--

DROP TABLE IF EXISTS `aasuper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aasuper` (
  `superID` int NOT NULL AUTO_INCREMENT,
  `userID` int DEFAULT NULL,
  `supernotion` char(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `slang` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `description` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `notions` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`superID`),
  KEY `userID` (`userID`),
  KEY `notion` (`supernotion`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aatwo55`
--

DROP TABLE IF EXISTS `aatwo55`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aatwo55` (
  `user` char(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `two55` char(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aauser`
--

DROP TABLE IF EXISTS `aauser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aauser` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `user` char(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `createDate` date NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `ulang` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'en',
  PRIMARY KEY (`userID`),
  KEY `user` (`user`)
) ENGINE=MyISAM AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aavideo`
--

DROP TABLE IF EXISTS `aavideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aavideo` (
  `notionID` int NOT NULL,
  `video` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`notionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `African Capitals`
--

DROP TABLE IF EXISTS `African Capitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `African Capitals` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Afrikai Fővárosok`
--

DROP TABLE IF EXISTS `Afrikai Fővárosok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Afrikai Fővárosok` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Afrikanische Hauptstädte`
--

DROP TABLE IF EXISTS `Afrikanische Hauptstädte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Afrikanische Hauptstädte` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Alapvető Angol`
--

DROP TABLE IF EXISTS `Alapvető Angol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Alapvető Angol` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Alapvető Német`
--

DROP TABLE IF EXISTS `Alapvető Német`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Alapvető Német` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Alemán Esencial`
--

DROP TABLE IF EXISTS `Alemán Esencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Alemán Esencial` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Alemão Essencial`
--

DROP TABLE IF EXISTS `Alemão Essencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Alemão Essencial` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Alfabeto Cirillico`
--

DROP TABLE IF EXISTS `Alfabeto Cirillico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Alfabeto Cirillico` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Alfabeto Cirílico`
--

DROP TABLE IF EXISTS `Alfabeto Cirílico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Alfabeto Cirílico` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Allemand Essentiel`
--

DROP TABLE IF EXISTS `Allemand Essentiel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Allemand Essentiel` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Alphabet Cyrillique`
--

DROP TABLE IF EXISTS `Alphabet Cyrillique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Alphabet Cyrillique` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Americas Capitals`
--

DROP TABLE IF EXISTS `Americas Capitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Americas Capitals` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Amerika Fővárosok`
--

DROP TABLE IF EXISTS `Amerika Fővárosok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Amerika Fővárosok` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Amerikai Államok Fővárosok`
--

DROP TABLE IF EXISTS `Amerikai Államok Fővárosok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Amerikai Államok Fővárosok` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Amerikanische Hauptstädte`
--

DROP TABLE IF EXISTS `Amerikanische Hauptstädte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Amerikanische Hauptstädte` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Amino Acids`
--

DROP TABLE IF EXISTS `Amino Acids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Amino Acids` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Anglais Essentiel`
--

DROP TABLE IF EXISTS `Anglais Essentiel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Anglais Essentiel` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Angol Főnevek 1`
--

DROP TABLE IF EXISTS `Angol Főnevek 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Angol Főnevek 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Angol Főnevek 2`
--

DROP TABLE IF EXISTS `Angol Főnevek 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Angol Főnevek 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Angol Főnevek 3`
--

DROP TABLE IF EXISTS `Angol Főnevek 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Angol Főnevek 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Angol Főnevek 4`
--

DROP TABLE IF EXISTS `Angol Főnevek 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Angol Főnevek 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Angol Főnevek 5`
--

DROP TABLE IF EXISTS `Angol Főnevek 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Angol Főnevek 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Angol Igék 1`
--

DROP TABLE IF EXISTS `Angol Igék 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Angol Igék 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Angol Igék 2`
--

DROP TABLE IF EXISTS `Angol Igék 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Angol Igék 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Angol Igék 3`
--

DROP TABLE IF EXISTS `Angol Igék 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Angol Igék 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Angol Igék 4`
--

DROP TABLE IF EXISTS `Angol Igék 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Angol Igék 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Angol Igék 5`
--

DROP TABLE IF EXISTS `Angol Igék 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Angol Igék 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Angol Szavak 1`
--

DROP TABLE IF EXISTS `Angol Szavak 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Angol Szavak 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Angol Szavak 2`
--

DROP TABLE IF EXISTS `Angol Szavak 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Angol Szavak 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Angol Szavak 3`
--

DROP TABLE IF EXISTS `Angol Szavak 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Angol Szavak 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Angol Szavak 4`
--

DROP TABLE IF EXISTS `Angol Szavak 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Angol Szavak 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Angol Szavak 5`
--

DROP TABLE IF EXISTS `Angol Szavak 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Angol Szavak 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Arithmetic Challenge`
--

DROP TABLE IF EXISTS `Arithmetic Challenge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Arithmetic Challenge` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Arithmetische Herausforderung`
--

DROP TABLE IF EXISTS `Arithmetische Herausforderung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Arithmetische Herausforderung` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Arithmétique Essentiel`
--

DROP TABLE IF EXISTS `Arithmétique Essentiel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Arithmétique Essentiel` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Arithmétique Négative`
--

DROP TABLE IF EXISTS `Arithmétique Négative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Arithmétique Négative` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Arithmétique PGCD et PPCM`
--

DROP TABLE IF EXISTS `Arithmétique PGCD et PPCM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Arithmétique PGCD et PPCM` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Aritmetica Essenziale`
--

DROP TABLE IF EXISTS `Aritmetica Essenziale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aritmetica Essenziale` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Aritmetica MCD e mcm`
--

DROP TABLE IF EXISTS `Aritmetica MCD e mcm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aritmetica MCD e mcm` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Aritmetica Negativa`
--

DROP TABLE IF EXISTS `Aritmetica Negativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aritmetica Negativa` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Aritmetica Percentuale`
--

DROP TABLE IF EXISTS `Aritmetica Percentuale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aritmetica Percentuale` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Aritmética Básica`
--

DROP TABLE IF EXISTS `Aritmética Básica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aritmética Básica` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Aritmética Essencial`
--

DROP TABLE IF EXISTS `Aritmética Essencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aritmética Essencial` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Aritmética MCD y mcm`
--

DROP TABLE IF EXISTS `Aritmética MCD y mcm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aritmética MCD y mcm` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Aritmética MDC e mmc`
--

DROP TABLE IF EXISTS `Aritmética MDC e mmc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aritmética MDC e mmc` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Aritmética Negativa`
--

DROP TABLE IF EXISTS `Aritmética Negativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aritmética Negativa` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Art History`
--

DROP TABLE IF EXISTS `Art History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Art History` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Asian Capitals`
--

DROP TABLE IF EXISTS `Asian Capitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Asian Capitals` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Asiatische Hauptstädte`
--

DROP TABLE IF EXISTS `Asiatische Hauptstädte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Asiatische Hauptstädte` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Atomic Numbers`
--

DROP TABLE IF EXISTS `Atomic Numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Atomic Numbers` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Atomic Symbols`
--

DROP TABLE IF EXISTS `Atomic Symbols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Atomic Symbols` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Basic Arithmetic`
--

DROP TABLE IF EXISTS `Basic Arithmetic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Basic Arithmetic` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Basic Geometry`
--

DROP TABLE IF EXISTS `Basic Geometry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Basic Geometry` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Basic Trigonometry`
--

DROP TABLE IF EXISTS `Basic Trigonometry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Basic Trigonometry` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Berühmte Menschen`
--

DROP TABLE IF EXISTS `Berühmte Menschen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Berühmte Menschen` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Biologie I`
--

DROP TABLE IF EXISTS `Biologie I`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Biologie I` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Biologie II`
--

DROP TABLE IF EXISTS `Biologie II`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Biologie II` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Branches de la Science`
--

DROP TABLE IF EXISTS `Branches de la Science`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Branches de la Science` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Branches of Science`
--

DROP TABLE IF EXISTS `Branches of Science`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Branches of Science` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Brazília Államok`
--

DROP TABLE IF EXISTS `Brazília Államok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Brazília Államok` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Bruchrechnen I`
--

DROP TABLE IF EXISTS `Bruchrechnen I`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bruchrechnen I` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Bruchrechnen II`
--

DROP TABLE IF EXISTS `Bruchrechnen II`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bruchrechnen II` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Bundesländer Hauptstädte`
--

DROP TABLE IF EXISTS `Bundesländer Hauptstädte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bundesländer Hauptstädte` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Bundesstaaten Mexikos`
--

DROP TABLE IF EXISTS `Bundesstaaten Mexikos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bundesstaaten Mexikos` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capi Militari`
--

DROP TABLE IF EXISTS `Capi Militari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capi Militari` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capitais Africanas`
--

DROP TABLE IF EXISTS `Capitais Africanas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitais Africanas` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capitais Asiáticas`
--

DROP TABLE IF EXISTS `Capitais Asiáticas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitais Asiáticas` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capitais da Oceania`
--

DROP TABLE IF EXISTS `Capitais da Oceania`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitais da Oceania` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capitais das Américas`
--

DROP TABLE IF EXISTS `Capitais das Américas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitais das Américas` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capitais dos Estados Unidos`
--

DROP TABLE IF EXISTS `Capitais dos Estados Unidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitais dos Estados Unidos` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capitais Europeias`
--

DROP TABLE IF EXISTS `Capitais Europeias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitais Europeias` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capitales Africaines`
--

DROP TABLE IF EXISTS `Capitales Africaines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitales Africaines` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capitales Africanas`
--

DROP TABLE IF EXISTS `Capitales Africanas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitales Africanas` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capitales Americanas`
--

DROP TABLE IF EXISTS `Capitales Americanas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitales Americanas` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capitales Amériques`
--

DROP TABLE IF EXISTS `Capitales Amériques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitales Amériques` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capitales Asiatiques`
--

DROP TABLE IF EXISTS `Capitales Asiatiques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitales Asiatiques` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capitales Asiáticas`
--

DROP TABLE IF EXISTS `Capitales Asiáticas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitales Asiáticas` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capitales de Colombia`
--

DROP TABLE IF EXISTS `Capitales de Colombia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitales de Colombia` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capitales de Estados Unidos`
--

DROP TABLE IF EXISTS `Capitales de Estados Unidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitales de Estados Unidos` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capitales de Océanie`
--

DROP TABLE IF EXISTS `Capitales de Océanie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitales de Océanie` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capitales des États-Unis`
--

DROP TABLE IF EXISTS `Capitales des États-Unis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitales des États-Unis` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capitales Europeas`
--

DROP TABLE IF EXISTS `Capitales Europeas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitales Europeas` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capitales Européennes`
--

DROP TABLE IF EXISTS `Capitales Européennes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitales Européennes` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capitales Oceánicas`
--

DROP TABLE IF EXISTS `Capitales Oceánicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitales Oceánicas` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capitali Africane`
--

DROP TABLE IF EXISTS `Capitali Africane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitali Africane` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capitali Americane`
--

DROP TABLE IF EXISTS `Capitali Americane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitali Americane` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capitali Asiatiche`
--

DROP TABLE IF EXISTS `Capitali Asiatiche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitali Asiatiche` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capitali degli Stati Uniti`
--

DROP TABLE IF EXISTS `Capitali degli Stati Uniti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitali degli Stati Uniti` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capitali dell'Oceania`
--

DROP TABLE IF EXISTS `Capitali dell'Oceania`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitali dell'Oceania` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capitali Europee`
--

DROP TABLE IF EXISTS `Capitali Europee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capitali Europee` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Celestial Objects`
--

DROP TABLE IF EXISTS `Celestial Objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Celestial Objects` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Cell Biology`
--

DROP TABLE IF EXISTS `Cell Biology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cell Biology` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Chemikalien`
--

DROP TABLE IF EXISTS `Chemikalien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Chemikalien` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Chimica Elementare`
--

DROP TABLE IF EXISTS `Chimica Elementare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Chimica Elementare` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Chimie Élémentaire`
--

DROP TABLE IF EXISTS `Chimie Élémentaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Chimie Élémentaire` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Common Chemicals`
--

DROP TABLE IF EXISTS `Common Chemicals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Common Chemicals` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Corpos Celestes`
--

DROP TABLE IF EXISTS `Corpos Celestes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Corpos Celestes` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Cyrillic Alphabet`
--

DROP TABLE IF EXISTS `Cyrillic Alphabet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cyrillic Alphabet` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Desafio Aritmético`
--

DROP TABLE IF EXISTS `Desafio Aritmético`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Desafio Aritmético` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Desafio de Multiplicação I`
--

DROP TABLE IF EXISTS `Desafio de Multiplicação I`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Desafio de Multiplicação I` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Desafio de Multiplicação II`
--

DROP TABLE IF EXISTS `Desafio de Multiplicação II`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Desafio de Multiplicação II` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Desafío Aritmético`
--

DROP TABLE IF EXISTS `Desafío Aritmético`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Desafío Aritmético` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Desafío de Multiplicación I`
--

DROP TABLE IF EXISTS `Desafío de Multiplicación I`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Desafío de Multiplicación I` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Desafío de Multiplicación II`
--

DROP TABLE IF EXISTS `Desafío de Multiplicación II`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Desafío de Multiplicación II` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Dinosaure`
--

DROP TABLE IF EXISTS `Dinosaure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dinosaure` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Dinosauri`
--

DROP TABLE IF EXISTS `Dinosauri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dinosauri` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Dinosaurier`
--

DROP TABLE IF EXISTS `Dinosaurier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dinosaurier` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Dinosaurios`
--

DROP TABLE IF EXISTS `Dinosaurios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dinosaurios` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Dinosaurs`
--

DROP TABLE IF EXISTS `Dinosaurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dinosaurs` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Dinossauros`
--

DROP TABLE IF EXISTS `Dinossauros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dinossauros` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Dirigeants Militaires`
--

DROP TABLE IF EXISTS `Dirigeants Militaires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dirigeants Militaires` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dis Science G6 2012`
--

DROP TABLE IF EXISTS `dis Science G6 2012`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dis Science G6 2012` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Distances Utiles`
--

DROP TABLE IF EXISTS `Distances Utiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Distances Utiles` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Distancias Útiles`
--

DROP TABLE IF EXISTS `Distancias Útiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Distancias Útiles` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Distanze Utili`
--

DROP TABLE IF EXISTS `Distanze Utili`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Distanze Utili` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Distâncias Úteis`
--

DROP TABLE IF EXISTS `Distâncias Úteis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Distâncias Úteis` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Défi Arithmétique`
--

DROP TABLE IF EXISTS `Défi Arithmétique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Défi Arithmétique` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Défi de Multiplication I`
--

DROP TABLE IF EXISTS `Défi de Multiplication I`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Défi de Multiplication I` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Défi de Multiplication II`
--

DROP TABLE IF EXISTS `Défi de Multiplication II`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Défi de Multiplication II` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Einmaleins I`
--

DROP TABLE IF EXISTS `Einmaleins I`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Einmaleins I` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Einmaleins II`
--

DROP TABLE IF EXISTS `Einmaleins II`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Einmaleins II` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Elementare Chemie`
--

DROP TABLE IF EXISTS `Elementare Chemie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Elementare Chemie` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Elementarphysik`
--

DROP TABLE IF EXISTS `Elementarphysik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Elementarphysik` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Elementary Chemistry`
--

DROP TABLE IF EXISTS `Elementary Chemistry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Elementary Chemistry` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Elementary Physics`
--

DROP TABLE IF EXISTS `Elementary Physics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Elementary Physics` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Elementsymbole`
--

DROP TABLE IF EXISTS `Elementsymbole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Elementsymbole` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Empire Romain`
--

DROP TABLE IF EXISTS `Empire Romain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empire Romain` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Endonimi Mondiale`
--

DROP TABLE IF EXISTS `Endonimi Mondiale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Endonimi Mondiale` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Endonymes du  Monde`
--

DROP TABLE IF EXISTS `Endonymes du  Monde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Endonymes du  Monde` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Endónimos Mundiales`
--

DROP TABLE IF EXISTS `Endónimos Mundiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Endónimos Mundiales` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Endônimos do Mundo`
--

DROP TABLE IF EXISTS `Endônimos do Mundo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Endônimos do Mundo` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Englisch das Wesentliche`
--

DROP TABLE IF EXISTS `Englisch das Wesentliche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Englisch das Wesentliche` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Englische Substantive 1`
--

DROP TABLE IF EXISTS `Englische Substantive 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Englische Substantive 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Englische Substantive 2`
--

DROP TABLE IF EXISTS `Englische Substantive 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Englische Substantive 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Englische Substantive 3`
--

DROP TABLE IF EXISTS `Englische Substantive 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Englische Substantive 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Englische Substantive 4`
--

DROP TABLE IF EXISTS `Englische Substantive 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Englische Substantive 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Englische Substantive 5`
--

DROP TABLE IF EXISTS `Englische Substantive 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Englische Substantive 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Englische Verben 1`
--

DROP TABLE IF EXISTS `Englische Verben 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Englische Verben 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Englische Verben 2`
--

DROP TABLE IF EXISTS `Englische Verben 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Englische Verben 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Englische Verben 3`
--

DROP TABLE IF EXISTS `Englische Verben 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Englische Verben 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Englische Verben 4`
--

DROP TABLE IF EXISTS `Englische Verben 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Englische Verben 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Englische Verben 5`
--

DROP TABLE IF EXISTS `Englische Verben 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Englische Verben 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Englische Wörter 1`
--

DROP TABLE IF EXISTS `Englische Wörter 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Englische Wörter 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Englische Wörter 2`
--

DROP TABLE IF EXISTS `Englische Wörter 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Englische Wörter 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Englische Wörter 3`
--

DROP TABLE IF EXISTS `Englische Wörter 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Englische Wörter 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Englische Wörter 4`
--

DROP TABLE IF EXISTS `Englische Wörter 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Englische Wörter 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Englische Wörter 5`
--

DROP TABLE IF EXISTS `Englische Wörter 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Englische Wörter 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Erweiterte Wortschatz`
--

DROP TABLE IF EXISTS `Erweiterte Wortschatz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Erweiterte Wortschatz` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Escala Geológica`
--

DROP TABLE IF EXISTS `Escala Geológica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Escala Geológica` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Espagnol Essentiel`
--

DROP TABLE IF EXISTS `Espagnol Essentiel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Espagnol Essentiel` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Espanhol Essencial`
--

DROP TABLE IF EXISTS `Espanhol Essencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Espanhol Essencial` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Essential French`
--

DROP TABLE IF EXISTS `Essential French`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Essential French` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Essential German`
--

DROP TABLE IF EXISTS `Essential German`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Essential German` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Essential Hungarian`
--

DROP TABLE IF EXISTS `Essential Hungarian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Essential Hungarian` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Essential Italian`
--

DROP TABLE IF EXISTS `Essential Italian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Essential Italian` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Essential Portuguese`
--

DROP TABLE IF EXISTS `Essential Portuguese`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Essential Portuguese` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Essential Russian`
--

DROP TABLE IF EXISTS `Essential Russian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Essential Russian` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Essential Spanish`
--

DROP TABLE IF EXISTS `Essential Spanish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Essential Spanish` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Essential Turkish`
--

DROP TABLE IF EXISTS `Essential Turkish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Essential Turkish` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Estados da Índia`
--

DROP TABLE IF EXISTS `Estados da Índia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Estados da Índia` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Estados de Brasil`
--

DROP TABLE IF EXISTS `Estados de Brasil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Estados de Brasil` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Estados de la India`
--

DROP TABLE IF EXISTS `Estados de la India`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Estados de la India` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Estados de México`
--

DROP TABLE IF EXISTS `Estados de México`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Estados de México` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Estados do Brasil`
--

DROP TABLE IF EXISTS `Estados do Brasil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Estados do Brasil` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Estados do México`
--

DROP TABLE IF EXISTS `Estados do México`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Estados do México` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `European Capitals`
--

DROP TABLE IF EXISTS `European Capitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `European Capitals` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Europäische Hauptstädte`
--

DROP TABLE IF EXISTS `Europäische Hauptstädte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Europäische Hauptstädte` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Európai Fővárosok`
--

DROP TABLE IF EXISTS `Európai Fővárosok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Európai Fővárosok` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Eventi di Estinzione`
--

DROP TABLE IF EXISTS `Eventi di Estinzione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Eventi di Estinzione` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Eventos de Extinción`
--

DROP TABLE IF EXISTS `Eventos de Extinción`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Eventos de Extinción` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Eventos de Extinção`
--

DROP TABLE IF EXISTS `Eventos de Extinção`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Eventos de Extinção` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Extinction Events`
--

DROP TABLE IF EXISTS `Extinction Events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Extinction Events` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Famous People`
--

DROP TABLE IF EXISTS `Famous People`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Famous People` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Fisica Elementare`
--

DROP TABLE IF EXISTS `Fisica Elementare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fisica Elementare` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `foople`
--

DROP TABLE IF EXISTS `foople`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foople` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Fraction Arithmetic I`
--

DROP TABLE IF EXISTS `Fraction Arithmetic I`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fraction Arithmetic I` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Fraction Arithmetic II`
--

DROP TABLE IF EXISTS `Fraction Arithmetic II`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fraction Arithmetic II` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Fractions Arithmétiques I`
--

DROP TABLE IF EXISTS `Fractions Arithmétiques I`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fractions Arithmétiques I` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Fractions Arithmétiques II`
--

DROP TABLE IF EXISTS `Fractions Arithmétiques II`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fractions Arithmétiques II` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Francese Essenziale`
--

DROP TABLE IF EXISTS `Francese Essenziale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Francese Essenziale` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Franciaország Régiók`
--

DROP TABLE IF EXISTS `Franciaország Régiók`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Franciaország Régiók` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Francés Esencial`
--

DROP TABLE IF EXISTS `Francés Esencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Francés Esencial` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Francês Essencial`
--

DROP TABLE IF EXISTS `Francês Essencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Francês Essencial` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Französisch das Wesentliche`
--

DROP TABLE IF EXISTS `Französisch das Wesentliche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Französisch das Wesentliche` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Französische Substantive 1`
--

DROP TABLE IF EXISTS `Französische Substantive 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Französische Substantive 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Französische Substantive 2`
--

DROP TABLE IF EXISTS `Französische Substantive 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Französische Substantive 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Französische Substantive 3`
--

DROP TABLE IF EXISTS `Französische Substantive 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Französische Substantive 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Französische Substantive 4`
--

DROP TABLE IF EXISTS `Französische Substantive 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Französische Substantive 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Französische Substantive 5`
--

DROP TABLE IF EXISTS `Französische Substantive 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Französische Substantive 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Französische Verben 1`
--

DROP TABLE IF EXISTS `Französische Verben 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Französische Verben 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Französische Verben 2`
--

DROP TABLE IF EXISTS `Französische Verben 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Französische Verben 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Französische Verben 3`
--

DROP TABLE IF EXISTS `Französische Verben 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Französische Verben 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Französische Verben 4`
--

DROP TABLE IF EXISTS `Französische Verben 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Französische Verben 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Französische Verben 5`
--

DROP TABLE IF EXISTS `Französische Verben 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Französische Verben 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Französische Wörter 1`
--

DROP TABLE IF EXISTS `Französische Wörter 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Französische Wörter 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Französische Wörter 2`
--

DROP TABLE IF EXISTS `Französische Wörter 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Französische Wörter 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Französische Wörter 3`
--

DROP TABLE IF EXISTS `Französische Wörter 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Französische Wörter 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Französische Wörter 4`
--

DROP TABLE IF EXISTS `Französische Wörter 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Französische Wörter 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Französische Wörter 5`
--

DROP TABLE IF EXISTS `Französische Wörter 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Französische Wörter 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Frazioni Aritmetiche I`
--

DROP TABLE IF EXISTS `Frazioni Aritmetiche I`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Frazioni Aritmetiche I` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Frazioni Aritmetiche II`
--

DROP TABLE IF EXISTS `Frazioni Aritmetiche II`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Frazioni Aritmetiche II` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Frações Aritméticas I`
--

DROP TABLE IF EXISTS `Frações Aritméticas I`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Frações Aritméticas I` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Frações Aritméticas II`
--

DROP TABLE IF EXISTS `Frações Aritméticas II`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Frações Aritméticas II` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `French Nouns 1`
--

DROP TABLE IF EXISTS `French Nouns 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `French Nouns 1` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `French Nouns 2`
--

DROP TABLE IF EXISTS `French Nouns 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `French Nouns 2` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `French Nouns 3`
--

DROP TABLE IF EXISTS `French Nouns 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `French Nouns 3` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `French Nouns 4`
--

DROP TABLE IF EXISTS `French Nouns 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `French Nouns 4` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `French Nouns 5`
--

DROP TABLE IF EXISTS `French Nouns 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `French Nouns 5` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `French Verbs 1`
--

DROP TABLE IF EXISTS `French Verbs 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `French Verbs 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `French Verbs 2`
--

DROP TABLE IF EXISTS `French Verbs 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `French Verbs 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `French Verbs 3`
--

DROP TABLE IF EXISTS `French Verbs 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `French Verbs 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `French Verbs 4`
--

DROP TABLE IF EXISTS `French Verbs 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `French Verbs 4` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `French Verbs 5`
--

DROP TABLE IF EXISTS `French Verbs 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `French Verbs 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `French Words 1`
--

DROP TABLE IF EXISTS `French Words 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `French Words 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `French Words 2`
--

DROP TABLE IF EXISTS `French Words 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `French Words 2` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `French Words 3`
--

DROP TABLE IF EXISTS `French Words 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `French Words 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `French Words 4`
--

DROP TABLE IF EXISTS `French Words 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `French Words 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `French Words 5`
--

DROP TABLE IF EXISTS `French Words 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `French Words 5` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Física Elemental`
--

DROP TABLE IF EXISTS `Física Elemental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Física Elemental` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Física Elementar`
--

DROP TABLE IF EXISTS `Física Elementar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Física Elementar` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GCD and LCM Arithmetic`
--

DROP TABLE IF EXISTS `GCD and LCM Arithmetic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GCD and LCM Arithmetic` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Gente Famosa`
--

DROP TABLE IF EXISTS `Gente Famosa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Gente Famosa` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Geologic Scale`
--

DROP TABLE IF EXISTS `Geologic Scale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Geologic Scale` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Geologische Zeitskala`
--

DROP TABLE IF EXISTS `Geologische Zeitskala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Geologische Zeitskala` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Geometria Essencial`
--

DROP TABLE IF EXISTS `Geometria Essencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Geometria Essencial` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Geometria Essenziale`
--

DROP TABLE IF EXISTS `Geometria Essenziale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Geometria Essenziale` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Geometría Básica`
--

DROP TABLE IF EXISTS `Geometría Básica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Geometría Básica` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `German Nouns 1`
--

DROP TABLE IF EXISTS `German Nouns 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `German Nouns 1` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `German Nouns 2`
--

DROP TABLE IF EXISTS `German Nouns 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `German Nouns 2` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `German Nouns 3`
--

DROP TABLE IF EXISTS `German Nouns 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `German Nouns 3` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `German Nouns 4`
--

DROP TABLE IF EXISTS `German Nouns 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `German Nouns 4` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `German Nouns 5`
--

DROP TABLE IF EXISTS `German Nouns 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `German Nouns 5` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `German Pop Songs 1`
--

DROP TABLE IF EXISTS `German Pop Songs 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `German Pop Songs 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `German Pop Songs 10`
--

DROP TABLE IF EXISTS `German Pop Songs 10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `German Pop Songs 10` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `German Pop Songs 2`
--

DROP TABLE IF EXISTS `German Pop Songs 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `German Pop Songs 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `German Pop Songs 3`
--

DROP TABLE IF EXISTS `German Pop Songs 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `German Pop Songs 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `German Pop Songs 4`
--

DROP TABLE IF EXISTS `German Pop Songs 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `German Pop Songs 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `German Pop Songs 5`
--

DROP TABLE IF EXISTS `German Pop Songs 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `German Pop Songs 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `German Pop Songs 6`
--

DROP TABLE IF EXISTS `German Pop Songs 6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `German Pop Songs 6` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `German Pop Songs 7`
--

DROP TABLE IF EXISTS `German Pop Songs 7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `German Pop Songs 7` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `German Pop Songs 8`
--

DROP TABLE IF EXISTS `German Pop Songs 8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `German Pop Songs 8` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `German Pop Songs 9`
--

DROP TABLE IF EXISTS `German Pop Songs 9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `German Pop Songs 9` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `German Verbs 1`
--

DROP TABLE IF EXISTS `German Verbs 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `German Verbs 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `German Verbs 2`
--

DROP TABLE IF EXISTS `German Verbs 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `German Verbs 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `German Verbs 3`
--

DROP TABLE IF EXISTS `German Verbs 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `German Verbs 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `German Verbs 4`
--

DROP TABLE IF EXISTS `German Verbs 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `German Verbs 4` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `German Verbs 5`
--

DROP TABLE IF EXISTS `German Verbs 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `German Verbs 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `German Words 1`
--

DROP TABLE IF EXISTS `German Words 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `German Words 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `German Words 2`
--

DROP TABLE IF EXISTS `German Words 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `German Words 2` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `German Words 3`
--

DROP TABLE IF EXISTS `German Words 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `German Words 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `German Words 4`
--

DROP TABLE IF EXISTS `German Words 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `German Words 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `German Words 5`
--

DROP TABLE IF EXISTS `German Words 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `German Words 5` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ggT und kgV Arithmetik`
--

DROP TABLE IF EXISTS `ggT und kgV Arithmetik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ggT und kgV Arithmetik` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grandes Batailles`
--

DROP TABLE IF EXISTS `Grandes Batailles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grandes Batailles` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grandes Batalhas`
--

DROP TABLE IF EXISTS `Grandes Batalhas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grandes Batalhas` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grandes Batallas`
--

DROP TABLE IF EXISTS `Grandes Batallas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grandes Batallas` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grandes Descobertas`
--

DROP TABLE IF EXISTS `Grandes Descobertas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grandes Descobertas` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grandes Descubrimientos`
--

DROP TABLE IF EXISTS `Grandes Descubrimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grandes Descubrimientos` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grandes Découvertes`
--

DROP TABLE IF EXISTS `Grandes Découvertes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grandes Découvertes` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grandes Exploradores`
--

DROP TABLE IF EXISTS `Grandes Exploradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grandes Exploradores` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grandes Gobernantes`
--

DROP TABLE IF EXISTS `Grandes Gobernantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grandes Gobernantes` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grandes Governantes`
--

DROP TABLE IF EXISTS `Grandes Governantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grandes Governantes` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grandes Imperios`
--

DROP TABLE IF EXISTS `Grandes Imperios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grandes Imperios` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grandes Inventions`
--

DROP TABLE IF EXISTS `Grandes Inventions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grandes Inventions` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grandes Inventos`
--

DROP TABLE IF EXISTS `Grandes Inventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grandes Inventos` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grandes Invenções`
--

DROP TABLE IF EXISTS `Grandes Invenções`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grandes Invenções` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grandi Battaglie`
--

DROP TABLE IF EXISTS `Grandi Battaglie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grandi Battaglie` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grandi Dirigenti`
--

DROP TABLE IF EXISTS `Grandi Dirigenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grandi Dirigenti` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grandi Esploratori`
--

DROP TABLE IF EXISTS `Grandi Esploratori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grandi Esploratori` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grandi Imperi`
--

DROP TABLE IF EXISTS `Grandi Imperi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grandi Imperi` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grandi Invenzioni`
--

DROP TABLE IF EXISTS `Grandi Invenzioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grandi Invenzioni` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grandi Scoperte`
--

DROP TABLE IF EXISTS `Grandi Scoperte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grandi Scoperte` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grands Empires`
--

DROP TABLE IF EXISTS `Grands Empires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grands Empires` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grands Explorateurs`
--

DROP TABLE IF EXISTS `Grands Explorateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grands Explorateurs` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grands Souverains`
--

DROP TABLE IF EXISTS `Grands Souverains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grands Souverains` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Great Battles`
--

DROP TABLE IF EXISTS `Great Battles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Great Battles` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Great Discoveries`
--

DROP TABLE IF EXISTS `Great Discoveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Great Discoveries` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Great Empires`
--

DROP TABLE IF EXISTS `Great Empires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Great Empires` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Great Explorers`
--

DROP TABLE IF EXISTS `Great Explorers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Great Explorers` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Great Inventions`
--

DROP TABLE IF EXISTS `Great Inventions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Great Inventions` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Great Rulers`
--

DROP TABLE IF EXISTS `Great Rulers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Great Rulers` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Greek Mythology`
--

DROP TABLE IF EXISTS `Greek Mythology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Greek Mythology` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Griechischen Mythologie`
--

DROP TABLE IF EXISTS `Griechischen Mythologie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Griechischen Mythologie` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Große Entdeckungen`
--

DROP TABLE IF EXISTS `Große Entdeckungen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Große Entdeckungen` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Große Erfindungen`
--

DROP TABLE IF EXISTS `Große Erfindungen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Große Erfindungen` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Große Forscher`
--

DROP TABLE IF EXISTS `Große Forscher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Große Forscher` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Große Herrscher`
--

DROP TABLE IF EXISTS `Große Herrscher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Große Herrscher` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Große Schlachten`
--

DROP TABLE IF EXISTS `Große Schlachten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Große Schlachten` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Großreiche`
--

DROP TABLE IF EXISTS `Großreiche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Großreiche` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grundlegende Arithmetik`
--

DROP TABLE IF EXISTS `Grundlegende Arithmetik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grundlegende Arithmetik` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grundlegende Geometrie`
--

DROP TABLE IF EXISTS `Grundlegende Geometrie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grundlegende Geometrie` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grundlegende Trigonometrie`
--

DROP TABLE IF EXISTS `Grundlegende Trigonometrie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grundlegende Trigonometrie` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Géométrie Essentiel`
--

DROP TABLE IF EXISTS `Géométrie Essentiel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Géométrie Essentiel` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Himmelsobjekte`
--

DROP TABLE IF EXISTS `Himmelsobjekte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Himmelsobjekte` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Histoire de l'Art`
--

DROP TABLE IF EXISTS `Histoire de l'Art`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Histoire de l'Art` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Histoire du Monde`
--

DROP TABLE IF EXISTS `Histoire du Monde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Histoire du Monde` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Historia del Arte`
--

DROP TABLE IF EXISTS `Historia del Arte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Historia del Arte` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Historia del Mundo`
--

DROP TABLE IF EXISTS `Historia del Mundo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Historia del Mundo` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `História da Arte`
--

DROP TABLE IF EXISTS `História da Arte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `História da Arte` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `História do Mundo`
--

DROP TABLE IF EXISTS `História do Mundo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `História do Mundo` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Hongrois Essentiel`
--

DROP TABLE IF EXISTS `Hongrois Essentiel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hongrois Essentiel` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Hungarian Nouns 1`
--

DROP TABLE IF EXISTS `Hungarian Nouns 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hungarian Nouns 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Hungarian Nouns 2`
--

DROP TABLE IF EXISTS `Hungarian Nouns 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hungarian Nouns 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Hungarian Nouns 3`
--

DROP TABLE IF EXISTS `Hungarian Nouns 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hungarian Nouns 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Hungarian Nouns 4`
--

DROP TABLE IF EXISTS `Hungarian Nouns 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hungarian Nouns 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Hungarian Nouns 5`
--

DROP TABLE IF EXISTS `Hungarian Nouns 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hungarian Nouns 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Hungarian Verbs 1`
--

DROP TABLE IF EXISTS `Hungarian Verbs 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hungarian Verbs 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Hungarian Verbs 2`
--

DROP TABLE IF EXISTS `Hungarian Verbs 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hungarian Verbs 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Hungarian Verbs 3`
--

DROP TABLE IF EXISTS `Hungarian Verbs 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hungarian Verbs 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Hungarian Verbs 4`
--

DROP TABLE IF EXISTS `Hungarian Verbs 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hungarian Verbs 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Hungarian Verbs 5`
--

DROP TABLE IF EXISTS `Hungarian Verbs 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hungarian Verbs 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Hungarian Words 1`
--

DROP TABLE IF EXISTS `Hungarian Words 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hungarian Words 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Hungarian Words 2`
--

DROP TABLE IF EXISTS `Hungarian Words 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hungarian Words 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Hungarian Words 3`
--

DROP TABLE IF EXISTS `Hungarian Words 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hungarian Words 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Hungarian Words 4`
--

DROP TABLE IF EXISTS `Hungarian Words 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hungarian Words 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Hungarian Words 5`
--

DROP TABLE IF EXISTS `Hungarian Words 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hungarian Words 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Húngaro Esencial`
--

DROP TABLE IF EXISTS `Húngaro Esencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Húngaro Esencial` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Húngaro Essencial`
--

DROP TABLE IF EXISTS `Húngaro Essencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Húngaro Essencial` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Imperio Romano`
--

DROP TABLE IF EXISTS `Imperio Romano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Imperio Romano` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Impero Romano`
--

DROP TABLE IF EXISTS `Impero Romano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Impero Romano` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `India Államok`
--

DROP TABLE IF EXISTS `India Államok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `India Államok` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Inglese Essenziale`
--

DROP TABLE IF EXISTS `Inglese Essenziale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Inglese Essenziale` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Inglés Esencial`
--

DROP TABLE IF EXISTS `Inglés Esencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Inglés Esencial` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Inglês Essencial`
--

DROP TABLE IF EXISTS `Inglês Essencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Inglês Essencial` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IPA Consonants Pulmonic`
--

DROP TABLE IF EXISTS `IPA Consonants Pulmonic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IPA Consonants Pulmonic` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italian Nouns 1`
--

DROP TABLE IF EXISTS `Italian Nouns 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italian Nouns 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italian Nouns 2`
--

DROP TABLE IF EXISTS `Italian Nouns 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italian Nouns 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italian Nouns 3`
--

DROP TABLE IF EXISTS `Italian Nouns 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italian Nouns 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italian Nouns 4`
--

DROP TABLE IF EXISTS `Italian Nouns 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italian Nouns 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italian Nouns 5`
--

DROP TABLE IF EXISTS `Italian Nouns 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italian Nouns 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italian Verbs 1`
--

DROP TABLE IF EXISTS `Italian Verbs 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italian Verbs 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italian Verbs 2`
--

DROP TABLE IF EXISTS `Italian Verbs 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italian Verbs 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italian Verbs 3`
--

DROP TABLE IF EXISTS `Italian Verbs 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italian Verbs 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italian Verbs 4`
--

DROP TABLE IF EXISTS `Italian Verbs 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italian Verbs 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italian Verbs 5`
--

DROP TABLE IF EXISTS `Italian Verbs 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italian Verbs 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italian Words 1`
--

DROP TABLE IF EXISTS `Italian Words 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italian Words 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italian Words 2`
--

DROP TABLE IF EXISTS `Italian Words 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italian Words 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italian Words 3`
--

DROP TABLE IF EXISTS `Italian Words 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italian Words 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italian Words 4`
--

DROP TABLE IF EXISTS `Italian Words 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italian Words 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italian Words 5`
--

DROP TABLE IF EXISTS `Italian Words 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italian Words 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italiano Esencial`
--

DROP TABLE IF EXISTS `Italiano Esencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italiano Esencial` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italiano Essencial`
--

DROP TABLE IF EXISTS `Italiano Essencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italiano Essencial` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italien Essentiel`
--

DROP TABLE IF EXISTS `Italien Essentiel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italien Essentiel` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italienisch das Wesentliche`
--

DROP TABLE IF EXISTS `Italienisch das Wesentliche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italienisch das Wesentliche` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italienische Substantive 1`
--

DROP TABLE IF EXISTS `Italienische Substantive 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italienische Substantive 1` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italienische Substantive 2`
--

DROP TABLE IF EXISTS `Italienische Substantive 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italienische Substantive 2` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italienische Substantive 3`
--

DROP TABLE IF EXISTS `Italienische Substantive 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italienische Substantive 3` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italienische Substantive 4`
--

DROP TABLE IF EXISTS `Italienische Substantive 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italienische Substantive 4` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italienische Substantive 5`
--

DROP TABLE IF EXISTS `Italienische Substantive 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italienische Substantive 5` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italienische Verben 1`
--

DROP TABLE IF EXISTS `Italienische Verben 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italienische Verben 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italienische Verben 2`
--

DROP TABLE IF EXISTS `Italienische Verben 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italienische Verben 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italienische Verben 3`
--

DROP TABLE IF EXISTS `Italienische Verben 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italienische Verben 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italienische Verben 4`
--

DROP TABLE IF EXISTS `Italienische Verben 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italienische Verben 4` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italienische Verben 5`
--

DROP TABLE IF EXISTS `Italienische Verben 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italienische Verben 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italienische Wörter 1`
--

DROP TABLE IF EXISTS `Italienische Wörter 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italienische Wörter 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italienische Wörter 2`
--

DROP TABLE IF EXISTS `Italienische Wörter 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italienische Wörter 2` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italienische Wörter 3`
--

DROP TABLE IF EXISTS `Italienische Wörter 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italienische Wörter 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italienische Wörter 4`
--

DROP TABLE IF EXISTS `Italienische Wörter 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italienische Wörter 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Italienische Wörter 5`
--

DROP TABLE IF EXISTS `Italienische Wörter 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Italienische Wörter 5` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Kunstgeschichte`
--

DROP TABLE IF EXISTS `Kunstgeschichte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Kunstgeschichte` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Kyrillisches Alphabet`
--

DROP TABLE IF EXISTS `Kyrillisches Alphabet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Kyrillisches Alphabet` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Lateinisch das Wesentliche`
--

DROP TABLE IF EXISTS `Lateinisch das Wesentliche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lateinisch das Wesentliche` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Líderes Militares`
--

DROP TABLE IF EXISTS `Líderes Militares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Líderes Militares` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Major League Baseball`
--

DROP TABLE IF EXISTS `Major League Baseball`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Major League Baseball` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Massenaussterben`
--

DROP TABLE IF EXISTS `Massenaussterben`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Massenaussterben` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Maßeinheiten`
--

DROP TABLE IF EXISTS `Maßeinheiten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Maßeinheiten` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mexikó Államok`
--

DROP TABLE IF EXISTS `Mexikó Államok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mexikó Államok` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Micronutrients`
--

DROP TABLE IF EXISTS `Micronutrients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Micronutrients` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Military Leaders`
--

DROP TABLE IF EXISTS `Military Leaders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Military Leaders` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Militärische Führer`
--

DROP TABLE IF EXISTS `Militärische Führer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Militärische Führer` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mitologia Greca`
--

DROP TABLE IF EXISTS `Mitologia Greca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mitologia Greca` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mitologia Grega`
--

DROP TABLE IF EXISTS `Mitologia Grega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mitologia Grega` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mitología Griega`
--

DROP TABLE IF EXISTS `Mitología Griega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mitología Griega` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Modern Chess Openings`
--

DROP TABLE IF EXISTS `Modern Chess Openings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Modern Chess Openings` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Allemands 1`
--

DROP TABLE IF EXISTS `Mots Allemands 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Allemands 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Allemands 2`
--

DROP TABLE IF EXISTS `Mots Allemands 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Allemands 2` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Allemands 3`
--

DROP TABLE IF EXISTS `Mots Allemands 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Allemands 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Allemands 4`
--

DROP TABLE IF EXISTS `Mots Allemands 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Allemands 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Allemands 5`
--

DROP TABLE IF EXISTS `Mots Allemands 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Allemands 5` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Anglais 1`
--

DROP TABLE IF EXISTS `Mots Anglais 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Anglais 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Anglais 2`
--

DROP TABLE IF EXISTS `Mots Anglais 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Anglais 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Anglais 3`
--

DROP TABLE IF EXISTS `Mots Anglais 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Anglais 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Anglais 4`
--

DROP TABLE IF EXISTS `Mots Anglais 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Anglais 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Anglais 5`
--

DROP TABLE IF EXISTS `Mots Anglais 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Anglais 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Espagnols 1`
--

DROP TABLE IF EXISTS `Mots Espagnols 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Espagnols 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Espagnols 2`
--

DROP TABLE IF EXISTS `Mots Espagnols 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Espagnols 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Espagnols 3`
--

DROP TABLE IF EXISTS `Mots Espagnols 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Espagnols 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Espagnols 4`
--

DROP TABLE IF EXISTS `Mots Espagnols 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Espagnols 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Espagnols 5`
--

DROP TABLE IF EXISTS `Mots Espagnols 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Espagnols 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Hongrois 1`
--

DROP TABLE IF EXISTS `Mots Hongrois 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Hongrois 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Hongrois 2`
--

DROP TABLE IF EXISTS `Mots Hongrois 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Hongrois 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Hongrois 3`
--

DROP TABLE IF EXISTS `Mots Hongrois 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Hongrois 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Hongrois 4`
--

DROP TABLE IF EXISTS `Mots Hongrois 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Hongrois 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Hongrois 5`
--

DROP TABLE IF EXISTS `Mots Hongrois 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Hongrois 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Italiens 1`
--

DROP TABLE IF EXISTS `Mots Italiens 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Italiens 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Italiens 2`
--

DROP TABLE IF EXISTS `Mots Italiens 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Italiens 2` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Italiens 3`
--

DROP TABLE IF EXISTS `Mots Italiens 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Italiens 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Italiens 4`
--

DROP TABLE IF EXISTS `Mots Italiens 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Italiens 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Italiens 5`
--

DROP TABLE IF EXISTS `Mots Italiens 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Italiens 5` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Portugais 1`
--

DROP TABLE IF EXISTS `Mots Portugais 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Portugais 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Portugais 2`
--

DROP TABLE IF EXISTS `Mots Portugais 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Portugais 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Portugais 3`
--

DROP TABLE IF EXISTS `Mots Portugais 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Portugais 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Portugais 4`
--

DROP TABLE IF EXISTS `Mots Portugais 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Portugais 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Portugais 5`
--

DROP TABLE IF EXISTS `Mots Portugais 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Portugais 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Russes 1`
--

DROP TABLE IF EXISTS `Mots Russes 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Russes 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Russes 2`
--

DROP TABLE IF EXISTS `Mots Russes 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Russes 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Russes 3`
--

DROP TABLE IF EXISTS `Mots Russes 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Russes 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Russes 4`
--

DROP TABLE IF EXISTS `Mots Russes 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Russes 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Russes 5`
--

DROP TABLE IF EXISTS `Mots Russes 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Russes 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Turcs 1`
--

DROP TABLE IF EXISTS `Mots Turcs 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Turcs 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Turcs 2`
--

DROP TABLE IF EXISTS `Mots Turcs 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Turcs 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Turcs 3`
--

DROP TABLE IF EXISTS `Mots Turcs 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Turcs 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Turcs 4`
--

DROP TABLE IF EXISTS `Mots Turcs 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Turcs 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mots Turcs 5`
--

DROP TABLE IF EXISTS `Mots Turcs 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mots Turcs 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Multiplication Challenge I`
--

DROP TABLE IF EXISTS `Multiplication Challenge I`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Multiplication Challenge I` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Multiplication Challenge II`
--

DROP TABLE IF EXISTS `Multiplication Challenge II`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Multiplication Challenge II` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Multiplication Tables I`
--

DROP TABLE IF EXISTS `Multiplication Tables I`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Multiplication Tables I` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Multiplication Tables II`
--

DROP TABLE IF EXISTS `Multiplication Tables II`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Multiplication Tables II` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Multiplikation Herausforderung I`
--

DROP TABLE IF EXISTS `Multiplikation Herausforderung I`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Multiplikation Herausforderung I` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Multiplikation Herausforderung II`
--

DROP TABLE IF EXISTS `Multiplikation Herausforderung II`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Multiplikation Herausforderung II` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musica Russa Pop 1`
--

DROP TABLE IF EXISTS `Musica Russa Pop 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musica Russa Pop 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musica Russa Pop 10`
--

DROP TABLE IF EXISTS `Musica Russa Pop 10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musica Russa Pop 10` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musica Russa Pop 2`
--

DROP TABLE IF EXISTS `Musica Russa Pop 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musica Russa Pop 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musica Russa Pop 3`
--

DROP TABLE IF EXISTS `Musica Russa Pop 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musica Russa Pop 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musica Russa Pop 4`
--

DROP TABLE IF EXISTS `Musica Russa Pop 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musica Russa Pop 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musica Russa Pop 5`
--

DROP TABLE IF EXISTS `Musica Russa Pop 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musica Russa Pop 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musica Russa Pop 6`
--

DROP TABLE IF EXISTS `Musica Russa Pop 6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musica Russa Pop 6` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musica Russa Pop 7`
--

DROP TABLE IF EXISTS `Musica Russa Pop 7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musica Russa Pop 7` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musica Russa Pop 8`
--

DROP TABLE IF EXISTS `Musica Russa Pop 8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musica Russa Pop 8` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musica Russa Pop 9`
--

DROP TABLE IF EXISTS `Musica Russa Pop 9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musica Russa Pop 9` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musica Tedesca Pop 1`
--

DROP TABLE IF EXISTS `Musica Tedesca Pop 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musica Tedesca Pop 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musica Tedesca Pop 10`
--

DROP TABLE IF EXISTS `Musica Tedesca Pop 10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musica Tedesca Pop 10` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musica Tedesca Pop 2`
--

DROP TABLE IF EXISTS `Musica Tedesca Pop 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musica Tedesca Pop 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musica Tedesca Pop 3`
--

DROP TABLE IF EXISTS `Musica Tedesca Pop 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musica Tedesca Pop 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musica Tedesca Pop 4`
--

DROP TABLE IF EXISTS `Musica Tedesca Pop 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musica Tedesca Pop 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musica Tedesca Pop 5`
--

DROP TABLE IF EXISTS `Musica Tedesca Pop 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musica Tedesca Pop 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musica Tedesca Pop 6`
--

DROP TABLE IF EXISTS `Musica Tedesca Pop 6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musica Tedesca Pop 6` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musica Tedesca Pop 7`
--

DROP TABLE IF EXISTS `Musica Tedesca Pop 7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musica Tedesca Pop 7` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musica Tedesca Pop 8`
--

DROP TABLE IF EXISTS `Musica Tedesca Pop 8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musica Tedesca Pop 8` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musica Tedesca Pop 9`
--

DROP TABLE IF EXISTS `Musica Tedesca Pop 9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musica Tedesca Pop 9` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musique Pop Allemande 1`
--

DROP TABLE IF EXISTS `Musique Pop Allemande 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musique Pop Allemande 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musique Pop Allemande 10`
--

DROP TABLE IF EXISTS `Musique Pop Allemande 10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musique Pop Allemande 10` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musique Pop Allemande 2`
--

DROP TABLE IF EXISTS `Musique Pop Allemande 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musique Pop Allemande 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musique Pop Allemande 3`
--

DROP TABLE IF EXISTS `Musique Pop Allemande 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musique Pop Allemande 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musique Pop Allemande 4`
--

DROP TABLE IF EXISTS `Musique Pop Allemande 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musique Pop Allemande 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musique Pop Allemande 5`
--

DROP TABLE IF EXISTS `Musique Pop Allemande 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musique Pop Allemande 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musique Pop Allemande 6`
--

DROP TABLE IF EXISTS `Musique Pop Allemande 6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musique Pop Allemande 6` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musique Pop Allemande 7`
--

DROP TABLE IF EXISTS `Musique Pop Allemande 7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musique Pop Allemande 7` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musique Pop Allemande 8`
--

DROP TABLE IF EXISTS `Musique Pop Allemande 8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musique Pop Allemande 8` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musique Pop Allemande 9`
--

DROP TABLE IF EXISTS `Musique Pop Allemande 9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musique Pop Allemande 9` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musique Pop Russe 1`
--

DROP TABLE IF EXISTS `Musique Pop Russe 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musique Pop Russe 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musique Pop Russe 10`
--

DROP TABLE IF EXISTS `Musique Pop Russe 10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musique Pop Russe 10` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musique Pop Russe 2`
--

DROP TABLE IF EXISTS `Musique Pop Russe 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musique Pop Russe 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musique Pop Russe 3`
--

DROP TABLE IF EXISTS `Musique Pop Russe 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musique Pop Russe 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musique Pop Russe 4`
--

DROP TABLE IF EXISTS `Musique Pop Russe 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musique Pop Russe 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musique Pop Russe 5`
--

DROP TABLE IF EXISTS `Musique Pop Russe 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musique Pop Russe 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musique Pop Russe 6`
--

DROP TABLE IF EXISTS `Musique Pop Russe 6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musique Pop Russe 6` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musique Pop Russe 7`
--

DROP TABLE IF EXISTS `Musique Pop Russe 7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musique Pop Russe 7` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musique Pop Russe 8`
--

DROP TABLE IF EXISTS `Musique Pop Russe 8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musique Pop Russe 8` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Musique Pop Russe 9`
--

DROP TABLE IF EXISTS `Musique Pop Russe 9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musique Pop Russe 9` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mythologie Grecque`
--

DROP TABLE IF EXISTS `Mythologie Grecque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mythologie Grecque` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Alemana 1`
--

DROP TABLE IF EXISTS `Música Pop Alemana 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Alemana 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Alemana 10`
--

DROP TABLE IF EXISTS `Música Pop Alemana 10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Alemana 10` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Alemana 2`
--

DROP TABLE IF EXISTS `Música Pop Alemana 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Alemana 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Alemana 3`
--

DROP TABLE IF EXISTS `Música Pop Alemana 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Alemana 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Alemana 4`
--

DROP TABLE IF EXISTS `Música Pop Alemana 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Alemana 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Alemana 5`
--

DROP TABLE IF EXISTS `Música Pop Alemana 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Alemana 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Alemana 6`
--

DROP TABLE IF EXISTS `Música Pop Alemana 6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Alemana 6` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Alemana 7`
--

DROP TABLE IF EXISTS `Música Pop Alemana 7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Alemana 7` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Alemana 8`
--

DROP TABLE IF EXISTS `Música Pop Alemana 8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Alemana 8` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Alemana 9`
--

DROP TABLE IF EXISTS `Música Pop Alemana 9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Alemana 9` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Alemã 1`
--

DROP TABLE IF EXISTS `Música Pop Alemã 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Alemã 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Alemã 10`
--

DROP TABLE IF EXISTS `Música Pop Alemã 10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Alemã 10` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Alemã 2`
--

DROP TABLE IF EXISTS `Música Pop Alemã 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Alemã 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Alemã 3`
--

DROP TABLE IF EXISTS `Música Pop Alemã 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Alemã 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Alemã 4`
--

DROP TABLE IF EXISTS `Música Pop Alemã 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Alemã 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Alemã 5`
--

DROP TABLE IF EXISTS `Música Pop Alemã 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Alemã 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Alemã 6`
--

DROP TABLE IF EXISTS `Música Pop Alemã 6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Alemã 6` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Alemã 7`
--

DROP TABLE IF EXISTS `Música Pop Alemã 7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Alemã 7` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Alemã 8`
--

DROP TABLE IF EXISTS `Música Pop Alemã 8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Alemã 8` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Alemã 9`
--

DROP TABLE IF EXISTS `Música Pop Alemã 9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Alemã 9` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Rusa 1`
--

DROP TABLE IF EXISTS `Música Pop Rusa 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Rusa 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Rusa 10`
--

DROP TABLE IF EXISTS `Música Pop Rusa 10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Rusa 10` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Rusa 2`
--

DROP TABLE IF EXISTS `Música Pop Rusa 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Rusa 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Rusa 3`
--

DROP TABLE IF EXISTS `Música Pop Rusa 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Rusa 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Rusa 4`
--

DROP TABLE IF EXISTS `Música Pop Rusa 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Rusa 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Rusa 5`
--

DROP TABLE IF EXISTS `Música Pop Rusa 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Rusa 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Rusa 6`
--

DROP TABLE IF EXISTS `Música Pop Rusa 6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Rusa 6` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Rusa 7`
--

DROP TABLE IF EXISTS `Música Pop Rusa 7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Rusa 7` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Rusa 8`
--

DROP TABLE IF EXISTS `Música Pop Rusa 8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Rusa 8` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Rusa 9`
--

DROP TABLE IF EXISTS `Música Pop Rusa 9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Rusa 9` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Russa 1`
--

DROP TABLE IF EXISTS `Música Pop Russa 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Russa 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Russa 10`
--

DROP TABLE IF EXISTS `Música Pop Russa 10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Russa 10` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Russa 2`
--

DROP TABLE IF EXISTS `Música Pop Russa 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Russa 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Russa 3`
--

DROP TABLE IF EXISTS `Música Pop Russa 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Russa 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Russa 4`
--

DROP TABLE IF EXISTS `Música Pop Russa 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Russa 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Russa 5`
--

DROP TABLE IF EXISTS `Música Pop Russa 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Russa 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Russa 6`
--

DROP TABLE IF EXISTS `Música Pop Russa 6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Russa 6` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Russa 7`
--

DROP TABLE IF EXISTS `Música Pop Russa 7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Russa 7` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Russa 8`
--

DROP TABLE IF EXISTS `Música Pop Russa 8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Russa 8` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Música Pop Russa 9`
--

DROP TABLE IF EXISTS `Música Pop Russa 9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Música Pop Russa 9` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `National Basketball Association`
--

DROP TABLE IF EXISTS `National Basketball Association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `National Basketball Association` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `National Football League`
--

DROP TABLE IF EXISTS `National Football League`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `National Football League` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `National Hockey League`
--

DROP TABLE IF EXISTS `National Hockey League`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `National Hockey League` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Negative Arithmetic`
--

DROP TABLE IF EXISTS `Negative Arithmetic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Negative Arithmetic` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Negative Arithmetik`
--

DROP TABLE IF EXISTS `Negative Arithmetik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Negative Arithmetik` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Neurotransmetteurs`
--

DROP TABLE IF EXISTS `Neurotransmetteurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Neurotransmetteurs` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Neurotransmisores`
--

DROP TABLE IF EXISTS `Neurotransmisores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Neurotransmisores` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Neurotransmissores`
--

DROP TABLE IF EXISTS `Neurotransmissores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Neurotransmissores` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Neurotransmitter`
--

DROP TABLE IF EXISTS `Neurotransmitter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Neurotransmitter` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Neurotransmitters`
--

DROP TABLE IF EXISTS `Neurotransmitters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Neurotransmitters` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Neurotrasmettitori`
--

DROP TABLE IF EXISTS `Neurotrasmettitori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Neurotrasmettitori` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Numeri Atomici`
--

DROP TABLE IF EXISTS `Numeri Atomici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Numeri Atomici` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Numéros Atomiques`
--

DROP TABLE IF EXISTS `Numéros Atomiques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Numéros Atomiques` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Német Főnevek 1`
--

DROP TABLE IF EXISTS `Német Főnevek 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Német Főnevek 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Német Főnevek 2`
--

DROP TABLE IF EXISTS `Német Főnevek 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Német Főnevek 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Német Főnevek 3`
--

DROP TABLE IF EXISTS `Német Főnevek 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Német Főnevek 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Német Főnevek 4`
--

DROP TABLE IF EXISTS `Német Főnevek 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Német Főnevek 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Német Főnevek 5`
--

DROP TABLE IF EXISTS `Német Főnevek 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Német Főnevek 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Német Igék 1`
--

DROP TABLE IF EXISTS `Német Igék 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Német Igék 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Német Igék 2`
--

DROP TABLE IF EXISTS `Német Igék 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Német Igék 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Német Igék 3`
--

DROP TABLE IF EXISTS `Német Igék 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Német Igék 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Német Igék 4`
--

DROP TABLE IF EXISTS `Német Igék 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Német Igék 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Német Igék 5`
--

DROP TABLE IF EXISTS `Német Igék 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Német Igék 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Német Szavak 1`
--

DROP TABLE IF EXISTS `Német Szavak 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Német Szavak 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Német Szavak 2`
--

DROP TABLE IF EXISTS `Német Szavak 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Német Szavak 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Német Szavak 3`
--

DROP TABLE IF EXISTS `Német Szavak 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Német Szavak 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Német Szavak 4`
--

DROP TABLE IF EXISTS `Német Szavak 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Német Szavak 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Német Szavak 5`
--

DROP TABLE IF EXISTS `Német Szavak 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Német Szavak 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Németország Régiók`
--

DROP TABLE IF EXISTS `Németország Régiók`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Németország Régiók` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Números Atómicos`
--

DROP TABLE IF EXISTS `Números Atómicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Números Atómicos` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Números en Inglés`
--

DROP TABLE IF EXISTS `Números en Inglés`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Números en Inglés` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Números Negativos`
--

DROP TABLE IF EXISTS `Números Negativos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Números Negativos` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Nützliche Entfernungen`
--

DROP TABLE IF EXISTS `Nützliche Entfernungen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Nützliche Entfernungen` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O Alfabeto Cirílico`
--

DROP TABLE IF EXISTS `O Alfabeto Cirílico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `O Alfabeto Cirílico` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O Império Romano`
--

DROP TABLE IF EXISTS `O Império Romano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `O Império Romano` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Objetos Celestes`
--

DROP TABLE IF EXISTS `Objetos Celestes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Objetos Celestes` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Objets Célestes`
--

DROP TABLE IF EXISTS `Objets Célestes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Objets Célestes` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Oceania Capitals`
--

DROP TABLE IF EXISTS `Oceania Capitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Oceania Capitals` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Oggetti Celesti`
--

DROP TABLE IF EXISTS `Oggetti Celesti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Oggetti Celesti` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Olaszország Régiók`
--

DROP TABLE IF EXISTS `Olaszország Régiók`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Olaszország Régiók` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ordnungszahlen`
--

DROP TABLE IF EXISTS `Ordnungszahlen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ordnungszahlen` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Os Grandes Exploradores`
--

DROP TABLE IF EXISTS `Os Grandes Exploradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Os Grandes Exploradores` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Os Grandes Impérios`
--

DROP TABLE IF EXISTS `Os Grandes Impérios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Os Grandes Impérios` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Os Líderes Militares`
--

DROP TABLE IF EXISTS `Os Líderes Militares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Os Líderes Militares` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Os Números Atômicos`
--

DROP TABLE IF EXISTS `Os Números Atômicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Os Números Atômicos` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Os Símbolos Atômicos`
--

DROP TABLE IF EXISTS `Os Símbolos Atômicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Os Símbolos Atômicos` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ozeanien Hauptstädte`
--

DROP TABLE IF EXISTS `Ozeanien Hauptstädte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ozeanien Hauptstädte` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Alemanas 1`
--

DROP TABLE IF EXISTS `Palabras Alemanas 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Alemanas 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Alemanas 2`
--

DROP TABLE IF EXISTS `Palabras Alemanas 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Alemanas 2` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Alemanas 3`
--

DROP TABLE IF EXISTS `Palabras Alemanas 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Alemanas 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Alemanas 4`
--

DROP TABLE IF EXISTS `Palabras Alemanas 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Alemanas 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Alemanas 5`
--

DROP TABLE IF EXISTS `Palabras Alemanas 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Alemanas 5` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Francesas 1`
--

DROP TABLE IF EXISTS `Palabras Francesas 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Francesas 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Francesas 2`
--

DROP TABLE IF EXISTS `Palabras Francesas 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Francesas 2` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Francesas 3`
--

DROP TABLE IF EXISTS `Palabras Francesas 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Francesas 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Francesas 4`
--

DROP TABLE IF EXISTS `Palabras Francesas 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Francesas 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Francesas 5`
--

DROP TABLE IF EXISTS `Palabras Francesas 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Francesas 5` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Húngaras 1`
--

DROP TABLE IF EXISTS `Palabras Húngaras 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Húngaras 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Húngaras 2`
--

DROP TABLE IF EXISTS `Palabras Húngaras 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Húngaras 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Húngaras 3`
--

DROP TABLE IF EXISTS `Palabras Húngaras 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Húngaras 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Húngaras 4`
--

DROP TABLE IF EXISTS `Palabras Húngaras 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Húngaras 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Húngaras 5`
--

DROP TABLE IF EXISTS `Palabras Húngaras 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Húngaras 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Inglesas 1`
--

DROP TABLE IF EXISTS `Palabras Inglesas 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Inglesas 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Inglesas 2`
--

DROP TABLE IF EXISTS `Palabras Inglesas 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Inglesas 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Inglesas 3`
--

DROP TABLE IF EXISTS `Palabras Inglesas 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Inglesas 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Inglesas 4`
--

DROP TABLE IF EXISTS `Palabras Inglesas 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Inglesas 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Inglesas 5`
--

DROP TABLE IF EXISTS `Palabras Inglesas 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Inglesas 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Italianas 1`
--

DROP TABLE IF EXISTS `Palabras Italianas 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Italianas 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Italianas 2`
--

DROP TABLE IF EXISTS `Palabras Italianas 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Italianas 2` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Italianas 3`
--

DROP TABLE IF EXISTS `Palabras Italianas 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Italianas 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Italianas 4`
--

DROP TABLE IF EXISTS `Palabras Italianas 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Italianas 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Italianas 5`
--

DROP TABLE IF EXISTS `Palabras Italianas 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Italianas 5` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Portuguesas 1`
--

DROP TABLE IF EXISTS `Palabras Portuguesas 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Portuguesas 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Portuguesas 2`
--

DROP TABLE IF EXISTS `Palabras Portuguesas 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Portuguesas 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Portuguesas 3`
--

DROP TABLE IF EXISTS `Palabras Portuguesas 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Portuguesas 3` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Portuguesas 4`
--

DROP TABLE IF EXISTS `Palabras Portuguesas 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Portuguesas 4` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Portuguesas 5`
--

DROP TABLE IF EXISTS `Palabras Portuguesas 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Portuguesas 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Rusas 1`
--

DROP TABLE IF EXISTS `Palabras Rusas 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Rusas 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Rusas 2`
--

DROP TABLE IF EXISTS `Palabras Rusas 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Rusas 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Rusas 3`
--

DROP TABLE IF EXISTS `Palabras Rusas 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Rusas 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Rusas 4`
--

DROP TABLE IF EXISTS `Palabras Rusas 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Rusas 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Rusas 5`
--

DROP TABLE IF EXISTS `Palabras Rusas 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Rusas 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Turcas 1`
--

DROP TABLE IF EXISTS `Palabras Turcas 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Turcas 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Turcas 2`
--

DROP TABLE IF EXISTS `Palabras Turcas 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Turcas 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Turcas 3`
--

DROP TABLE IF EXISTS `Palabras Turcas 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Turcas 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Turcas 4`
--

DROP TABLE IF EXISTS `Palabras Turcas 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Turcas 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palabras Turcas 5`
--

DROP TABLE IF EXISTS `Palabras Turcas 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palabras Turcas 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Alemãs 1`
--

DROP TABLE IF EXISTS `Palavras Alemãs 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Alemãs 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Alemãs 2`
--

DROP TABLE IF EXISTS `Palavras Alemãs 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Alemãs 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Alemãs 3`
--

DROP TABLE IF EXISTS `Palavras Alemãs 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Alemãs 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Alemãs 4`
--

DROP TABLE IF EXISTS `Palavras Alemãs 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Alemãs 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Alemãs 5`
--

DROP TABLE IF EXISTS `Palavras Alemãs 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Alemãs 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Espanholas 1`
--

DROP TABLE IF EXISTS `Palavras Espanholas 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Espanholas 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Espanholas 2`
--

DROP TABLE IF EXISTS `Palavras Espanholas 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Espanholas 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Espanholas 3`
--

DROP TABLE IF EXISTS `Palavras Espanholas 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Espanholas 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Espanholas 4`
--

DROP TABLE IF EXISTS `Palavras Espanholas 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Espanholas 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Espanholas 5`
--

DROP TABLE IF EXISTS `Palavras Espanholas 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Espanholas 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Francesas 1`
--

DROP TABLE IF EXISTS `Palavras Francesas 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Francesas 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Francesas 2`
--

DROP TABLE IF EXISTS `Palavras Francesas 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Francesas 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Francesas 3`
--

DROP TABLE IF EXISTS `Palavras Francesas 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Francesas 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Francesas 4`
--

DROP TABLE IF EXISTS `Palavras Francesas 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Francesas 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Francesas 5`
--

DROP TABLE IF EXISTS `Palavras Francesas 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Francesas 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Húngaras 1`
--

DROP TABLE IF EXISTS `Palavras Húngaras 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Húngaras 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Húngaras 2`
--

DROP TABLE IF EXISTS `Palavras Húngaras 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Húngaras 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Húngaras 3`
--

DROP TABLE IF EXISTS `Palavras Húngaras 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Húngaras 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Húngaras 4`
--

DROP TABLE IF EXISTS `Palavras Húngaras 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Húngaras 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Húngaras 5`
--

DROP TABLE IF EXISTS `Palavras Húngaras 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Húngaras 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Inglesas 1`
--

DROP TABLE IF EXISTS `Palavras Inglesas 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Inglesas 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Inglesas 2`
--

DROP TABLE IF EXISTS `Palavras Inglesas 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Inglesas 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Inglesas 3`
--

DROP TABLE IF EXISTS `Palavras Inglesas 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Inglesas 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Inglesas 4`
--

DROP TABLE IF EXISTS `Palavras Inglesas 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Inglesas 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Inglesas 5`
--

DROP TABLE IF EXISTS `Palavras Inglesas 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Inglesas 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Italianas 1`
--

DROP TABLE IF EXISTS `Palavras Italianas 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Italianas 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Italianas 2`
--

DROP TABLE IF EXISTS `Palavras Italianas 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Italianas 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Italianas 3`
--

DROP TABLE IF EXISTS `Palavras Italianas 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Italianas 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Italianas 4`
--

DROP TABLE IF EXISTS `Palavras Italianas 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Italianas 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Italianas 5`
--

DROP TABLE IF EXISTS `Palavras Italianas 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Italianas 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Russas 1`
--

DROP TABLE IF EXISTS `Palavras Russas 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Russas 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Russas 2`
--

DROP TABLE IF EXISTS `Palavras Russas 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Russas 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Russas 3`
--

DROP TABLE IF EXISTS `Palavras Russas 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Russas 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Russas 4`
--

DROP TABLE IF EXISTS `Palavras Russas 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Russas 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Russas 5`
--

DROP TABLE IF EXISTS `Palavras Russas 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Russas 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Turcas 1`
--

DROP TABLE IF EXISTS `Palavras Turcas 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Turcas 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Turcas 2`
--

DROP TABLE IF EXISTS `Palavras Turcas 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Turcas 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Turcas 3`
--

DROP TABLE IF EXISTS `Palavras Turcas 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Turcas 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Turcas 4`
--

DROP TABLE IF EXISTS `Palavras Turcas 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Turcas 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Palavras Turcas 5`
--

DROP TABLE IF EXISTS `Palavras Turcas 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Palavras Turcas 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Francesi 1`
--

DROP TABLE IF EXISTS `Parole Francesi 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Francesi 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Francesi 2`
--

DROP TABLE IF EXISTS `Parole Francesi 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Francesi 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Francesi 3`
--

DROP TABLE IF EXISTS `Parole Francesi 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Francesi 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Francesi 4`
--

DROP TABLE IF EXISTS `Parole Francesi 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Francesi 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Francesi 5`
--

DROP TABLE IF EXISTS `Parole Francesi 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Francesi 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Inglesi 1`
--

DROP TABLE IF EXISTS `Parole Inglesi 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Inglesi 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Inglesi 2`
--

DROP TABLE IF EXISTS `Parole Inglesi 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Inglesi 2` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Inglesi 3`
--

DROP TABLE IF EXISTS `Parole Inglesi 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Inglesi 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Inglesi 4`
--

DROP TABLE IF EXISTS `Parole Inglesi 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Inglesi 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Inglesi 5`
--

DROP TABLE IF EXISTS `Parole Inglesi 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Inglesi 5` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Portoghesi 1`
--

DROP TABLE IF EXISTS `Parole Portoghesi 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Portoghesi 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Portoghesi 2`
--

DROP TABLE IF EXISTS `Parole Portoghesi 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Portoghesi 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Portoghesi 3`
--

DROP TABLE IF EXISTS `Parole Portoghesi 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Portoghesi 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Portoghesi 4`
--

DROP TABLE IF EXISTS `Parole Portoghesi 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Portoghesi 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Portoghesi 5`
--

DROP TABLE IF EXISTS `Parole Portoghesi 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Portoghesi 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Russe 1`
--

DROP TABLE IF EXISTS `Parole Russe 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Russe 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Russe 2`
--

DROP TABLE IF EXISTS `Parole Russe 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Russe 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Russe 3`
--

DROP TABLE IF EXISTS `Parole Russe 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Russe 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Russe 4`
--

DROP TABLE IF EXISTS `Parole Russe 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Russe 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Russe 5`
--

DROP TABLE IF EXISTS `Parole Russe 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Russe 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Spagnole 1`
--

DROP TABLE IF EXISTS `Parole Spagnole 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Spagnole 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Spagnole 2`
--

DROP TABLE IF EXISTS `Parole Spagnole 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Spagnole 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Spagnole 3`
--

DROP TABLE IF EXISTS `Parole Spagnole 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Spagnole 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Spagnole 4`
--

DROP TABLE IF EXISTS `Parole Spagnole 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Spagnole 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Spagnole 5`
--

DROP TABLE IF EXISTS `Parole Spagnole 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Spagnole 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Tedesche 1`
--

DROP TABLE IF EXISTS `Parole Tedesche 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Tedesche 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Tedesche 2`
--

DROP TABLE IF EXISTS `Parole Tedesche 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Tedesche 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Tedesche 3`
--

DROP TABLE IF EXISTS `Parole Tedesche 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Tedesche 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Tedesche 4`
--

DROP TABLE IF EXISTS `Parole Tedesche 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Tedesche 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Tedesche 5`
--

DROP TABLE IF EXISTS `Parole Tedesche 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Tedesche 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Turche 1`
--

DROP TABLE IF EXISTS `Parole Turche 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Turche 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Turche 2`
--

DROP TABLE IF EXISTS `Parole Turche 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Turche 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Turche 3`
--

DROP TABLE IF EXISTS `Parole Turche 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Turche 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Turche 4`
--

DROP TABLE IF EXISTS `Parole Turche 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Turche 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Turche 5`
--

DROP TABLE IF EXISTS `Parole Turche 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Turche 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Ungheresi 1`
--

DROP TABLE IF EXISTS `Parole Ungheresi 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Ungheresi 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Ungheresi 2`
--

DROP TABLE IF EXISTS `Parole Ungheresi 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Ungheresi 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Ungheresi 3`
--

DROP TABLE IF EXISTS `Parole Ungheresi 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Ungheresi 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Ungheresi 4`
--

DROP TABLE IF EXISTS `Parole Ungheresi 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Ungheresi 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parole Ungheresi 5`
--

DROP TABLE IF EXISTS `Parole Ungheresi 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parole Ungheresi 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Percent Arithmetic`
--

DROP TABLE IF EXISTS `Percent Arithmetic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Percent Arithmetic` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Percentagens`
--

DROP TABLE IF EXISTS `Percentagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Percentagens` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Personaggi Famosi`
--

DROP TABLE IF EXISTS `Personaggi Famosi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Personaggi Famosi` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Personnages Célèbres`
--

DROP TABLE IF EXISTS `Personnages Célèbres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Personnages Célèbres` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Pessoas Famosas`
--

DROP TABLE IF EXISTS `Pessoas Famosas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pessoas Famosas` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Physique Élémentaire`
--

DROP TABLE IF EXISTS `Physique Élémentaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Physique Élémentaire` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Porcentajes`
--

DROP TABLE IF EXISTS `Porcentajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Porcentajes` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portoghese Essenziale`
--

DROP TABLE IF EXISTS `Portoghese Essenziale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portoghese Essenziale` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portugiesisch das Wesentlich`
--

DROP TABLE IF EXISTS `Portugiesisch das Wesentlich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portugiesisch das Wesentlich` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portugiesische Substantive 1`
--

DROP TABLE IF EXISTS `Portugiesische Substantive 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portugiesische Substantive 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portugiesische Substantive 2`
--

DROP TABLE IF EXISTS `Portugiesische Substantive 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portugiesische Substantive 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portugiesische Substantive 3`
--

DROP TABLE IF EXISTS `Portugiesische Substantive 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portugiesische Substantive 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portugiesische Substantive 4`
--

DROP TABLE IF EXISTS `Portugiesische Substantive 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portugiesische Substantive 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portugiesische Substantive 5`
--

DROP TABLE IF EXISTS `Portugiesische Substantive 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portugiesische Substantive 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portugiesische Verben 1`
--

DROP TABLE IF EXISTS `Portugiesische Verben 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portugiesische Verben 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portugiesische Verben 2`
--

DROP TABLE IF EXISTS `Portugiesische Verben 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portugiesische Verben 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portugiesische Verben 3`
--

DROP TABLE IF EXISTS `Portugiesische Verben 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portugiesische Verben 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portugiesische Verben 4`
--

DROP TABLE IF EXISTS `Portugiesische Verben 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portugiesische Verben 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portugiesische Verben 5`
--

DROP TABLE IF EXISTS `Portugiesische Verben 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portugiesische Verben 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portugiesische Wörter 1`
--

DROP TABLE IF EXISTS `Portugiesische Wörter 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portugiesische Wörter 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portugiesische Wörter 2`
--

DROP TABLE IF EXISTS `Portugiesische Wörter 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portugiesische Wörter 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portugiesische Wörter 3`
--

DROP TABLE IF EXISTS `Portugiesische Wörter 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portugiesische Wörter 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portugiesische Wörter 4`
--

DROP TABLE IF EXISTS `Portugiesische Wörter 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portugiesische Wörter 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portugiesische Wörter 5`
--

DROP TABLE IF EXISTS `Portugiesische Wörter 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portugiesische Wörter 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portuguese Essentiel`
--

DROP TABLE IF EXISTS `Portuguese Essentiel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portuguese Essentiel` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portuguese Nouns 1`
--

DROP TABLE IF EXISTS `Portuguese Nouns 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portuguese Nouns 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portuguese Nouns 2`
--

DROP TABLE IF EXISTS `Portuguese Nouns 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portuguese Nouns 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portuguese Nouns 3`
--

DROP TABLE IF EXISTS `Portuguese Nouns 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portuguese Nouns 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portuguese Nouns 4`
--

DROP TABLE IF EXISTS `Portuguese Nouns 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portuguese Nouns 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portuguese Nouns 5`
--

DROP TABLE IF EXISTS `Portuguese Nouns 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portuguese Nouns 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portuguese Verbs 1`
--

DROP TABLE IF EXISTS `Portuguese Verbs 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portuguese Verbs 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portuguese Verbs 2`
--

DROP TABLE IF EXISTS `Portuguese Verbs 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portuguese Verbs 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portuguese Verbs 3`
--

DROP TABLE IF EXISTS `Portuguese Verbs 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portuguese Verbs 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portuguese Verbs 4`
--

DROP TABLE IF EXISTS `Portuguese Verbs 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portuguese Verbs 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portuguese Verbs 5`
--

DROP TABLE IF EXISTS `Portuguese Verbs 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portuguese Verbs 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portuguese Words 1`
--

DROP TABLE IF EXISTS `Portuguese Words 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portuguese Words 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portuguese Words 2`
--

DROP TABLE IF EXISTS `Portuguese Words 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portuguese Words 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portuguese Words 3`
--

DROP TABLE IF EXISTS `Portuguese Words 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portuguese Words 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portuguese Words 4`
--

DROP TABLE IF EXISTS `Portuguese Words 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portuguese Words 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portuguese Words 5`
--

DROP TABLE IF EXISTS `Portuguese Words 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portuguese Words 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Portugués Esencial`
--

DROP TABLE IF EXISTS `Portugués Esencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portugués Esencial` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Pourcentages`
--

DROP TABLE IF EXISTS `Pourcentages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pourcentages` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Presidentes de Estados Unidos`
--

DROP TABLE IF EXISTS `Presidentes de Estados Unidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Presidentes de Estados Unidos` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Presidentes dos EUA`
--

DROP TABLE IF EXISTS `Presidentes dos EUA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Presidentes dos EUA` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Presidenti degli Stati Uniti`
--

DROP TABLE IF EXISTS `Presidenti degli Stati Uniti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Presidenti degli Stati Uniti` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Prodotti Chimici`
--

DROP TABLE IF EXISTS `Prodotti Chimici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Prodotti Chimici` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Productos Químicos`
--

DROP TABLE IF EXISTS `Productos Químicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Productos Químicos` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Produits Chimiques`
--

DROP TABLE IF EXISTS `Produits Chimiques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Produits Chimiques` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Produtos Químicos`
--

DROP TABLE IF EXISTS `Produtos Químicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Produtos Químicos` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Prozent Arithmetik`
--

DROP TABLE IF EXISTS `Prozent Arithmetik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Prozent Arithmetik` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Présidents des États-Unis`
--

DROP TABLE IF EXISTS `Présidents des États-Unis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Présidents des États-Unis` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Quebrados I`
--

DROP TABLE IF EXISTS `Quebrados I`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Quebrados I` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Quebrados II`
--

DROP TABLE IF EXISTS `Quebrados II`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Quebrados II` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Química Elemental`
--

DROP TABLE IF EXISTS `Química Elemental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Química Elemental` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Química Elementar`
--

DROP TABLE IF EXISTS `Química Elementar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Química Elementar` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ramas de la Ciencia`
--

DROP TABLE IF EXISTS `Ramas de la Ciencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ramas de la Ciencia` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Rami della Scienza`
--

DROP TABLE IF EXISTS `Rami della Scienza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rami della Scienza` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ramos da Ciência`
--

DROP TABLE IF EXISTS `Ramos da Ciência`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ramos da Ciência` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Regionen Frankreichs`
--

DROP TABLE IF EXISTS `Regionen Frankreichs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Regionen Frankreichs` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Regionen Italiens`
--

DROP TABLE IF EXISTS `Regionen Italiens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Regionen Italiens` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Regiones de Alemania`
--

DROP TABLE IF EXISTS `Regiones de Alemania`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Regiones de Alemania` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Regiones de Francia`
--

DROP TABLE IF EXISTS `Regiones de Francia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Regiones de Francia` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Regiones de Italia`
--

DROP TABLE IF EXISTS `Regiones de Italia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Regiones de Italia` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Regioni d'Italia`
--

DROP TABLE IF EXISTS `Regioni d'Italia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Regioni d'Italia` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Regioni della Francia`
--

DROP TABLE IF EXISTS `Regioni della Francia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Regioni della Francia` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Regioni della Germania`
--

DROP TABLE IF EXISTS `Regioni della Germania`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Regioni della Germania` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Regions of France`
--

DROP TABLE IF EXISTS `Regions of France`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Regions of France` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Regions of Germany`
--

DROP TABLE IF EXISTS `Regions of Germany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Regions of Germany` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Regions of Italy`
--

DROP TABLE IF EXISTS `Regions of Italy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Regions of Italy` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Regiões da Alemanha`
--

DROP TABLE IF EXISTS `Regiões da Alemanha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Regiões da Alemanha` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Regiões da França`
--

DROP TABLE IF EXISTS `Regiões da França`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Regiões da França` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Regiões da Itália`
--

DROP TABLE IF EXISTS `Regiões da Itália`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Regiões da Itália` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Roman Empire`
--

DROP TABLE IF EXISTS `Roman Empire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Roman Empire` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ruso Esencial`
--

DROP TABLE IF EXISTS `Ruso Esencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ruso Esencial` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russe Essentiel`
--

DROP TABLE IF EXISTS `Russe Essentiel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russe Essentiel` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russian Nouns 1`
--

DROP TABLE IF EXISTS `Russian Nouns 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russian Nouns 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russian Nouns 2`
--

DROP TABLE IF EXISTS `Russian Nouns 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russian Nouns 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russian Nouns 3`
--

DROP TABLE IF EXISTS `Russian Nouns 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russian Nouns 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russian Nouns 4`
--

DROP TABLE IF EXISTS `Russian Nouns 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russian Nouns 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russian Nouns 5`
--

DROP TABLE IF EXISTS `Russian Nouns 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russian Nouns 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russian Pop Songs 1`
--

DROP TABLE IF EXISTS `Russian Pop Songs 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russian Pop Songs 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russian Pop Songs 10`
--

DROP TABLE IF EXISTS `Russian Pop Songs 10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russian Pop Songs 10` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russian Pop Songs 2`
--

DROP TABLE IF EXISTS `Russian Pop Songs 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russian Pop Songs 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russian Pop Songs 3`
--

DROP TABLE IF EXISTS `Russian Pop Songs 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russian Pop Songs 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russian Pop Songs 4`
--

DROP TABLE IF EXISTS `Russian Pop Songs 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russian Pop Songs 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russian Pop Songs 5`
--

DROP TABLE IF EXISTS `Russian Pop Songs 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russian Pop Songs 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russian Pop Songs 6`
--

DROP TABLE IF EXISTS `Russian Pop Songs 6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russian Pop Songs 6` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russian Pop Songs 7`
--

DROP TABLE IF EXISTS `Russian Pop Songs 7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russian Pop Songs 7` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russian Pop Songs 8`
--

DROP TABLE IF EXISTS `Russian Pop Songs 8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russian Pop Songs 8` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russian Pop Songs 9`
--

DROP TABLE IF EXISTS `Russian Pop Songs 9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russian Pop Songs 9` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russian Verbs 1`
--

DROP TABLE IF EXISTS `Russian Verbs 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russian Verbs 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russian Verbs 2`
--

DROP TABLE IF EXISTS `Russian Verbs 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russian Verbs 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russian Verbs 3`
--

DROP TABLE IF EXISTS `Russian Verbs 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russian Verbs 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russian Verbs 4`
--

DROP TABLE IF EXISTS `Russian Verbs 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russian Verbs 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russian Verbs 5`
--

DROP TABLE IF EXISTS `Russian Verbs 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russian Verbs 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russian Words 1`
--

DROP TABLE IF EXISTS `Russian Words 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russian Words 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russian Words 2`
--

DROP TABLE IF EXISTS `Russian Words 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russian Words 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russian Words 3`
--

DROP TABLE IF EXISTS `Russian Words 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russian Words 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russian Words 4`
--

DROP TABLE IF EXISTS `Russian Words 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russian Words 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russian Words 5`
--

DROP TABLE IF EXISTS `Russian Words 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russian Words 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russisch das Wesentliche`
--

DROP TABLE IF EXISTS `Russisch das Wesentliche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russisch das Wesentliche` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russische Popmusik 1`
--

DROP TABLE IF EXISTS `Russische Popmusik 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russische Popmusik 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russische Popmusik 10`
--

DROP TABLE IF EXISTS `Russische Popmusik 10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russische Popmusik 10` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russische Popmusik 2`
--

DROP TABLE IF EXISTS `Russische Popmusik 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russische Popmusik 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russische Popmusik 3`
--

DROP TABLE IF EXISTS `Russische Popmusik 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russische Popmusik 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russische Popmusik 4`
--

DROP TABLE IF EXISTS `Russische Popmusik 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russische Popmusik 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russische Popmusik 5`
--

DROP TABLE IF EXISTS `Russische Popmusik 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russische Popmusik 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russische Popmusik 6`
--

DROP TABLE IF EXISTS `Russische Popmusik 6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russische Popmusik 6` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russische Popmusik 7`
--

DROP TABLE IF EXISTS `Russische Popmusik 7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russische Popmusik 7` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russische Popmusik 8`
--

DROP TABLE IF EXISTS `Russische Popmusik 8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russische Popmusik 8` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russische Popmusik 9`
--

DROP TABLE IF EXISTS `Russische Popmusik 9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russische Popmusik 9` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `imageID` int DEFAULT NULL,
  `soundID` int DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russische Substantive 1`
--

DROP TABLE IF EXISTS `Russische Substantive 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russische Substantive 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russische Substantive 2`
--

DROP TABLE IF EXISTS `Russische Substantive 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russische Substantive 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russische Substantive 3`
--

DROP TABLE IF EXISTS `Russische Substantive 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russische Substantive 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russische Substantive 4`
--

DROP TABLE IF EXISTS `Russische Substantive 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russische Substantive 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russische Substantive 5`
--

DROP TABLE IF EXISTS `Russische Substantive 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russische Substantive 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russische Verben 1`
--

DROP TABLE IF EXISTS `Russische Verben 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russische Verben 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russische Verben 2`
--

DROP TABLE IF EXISTS `Russische Verben 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russische Verben 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russische Verben 3`
--

DROP TABLE IF EXISTS `Russische Verben 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russische Verben 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russische Verben 4`
--

DROP TABLE IF EXISTS `Russische Verben 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russische Verben 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russische Verben 5`
--

DROP TABLE IF EXISTS `Russische Verben 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russische Verben 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russische Wörter 1`
--

DROP TABLE IF EXISTS `Russische Wörter 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russische Wörter 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russische Wörter 2`
--

DROP TABLE IF EXISTS `Russische Wörter 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russische Wörter 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russische Wörter 3`
--

DROP TABLE IF EXISTS `Russische Wörter 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russische Wörter 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russische Wörter 4`
--

DROP TABLE IF EXISTS `Russische Wörter 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russische Wörter 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russische Wörter 5`
--

DROP TABLE IF EXISTS `Russische Wörter 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russische Wörter 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russo Essencial`
--

DROP TABLE IF EXISTS `Russo Essencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russo Essencial` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Russo Essenziale`
--

DROP TABLE IF EXISTS `Russo Essenziale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Russo Essenziale` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Régions de l'Allemagne`
--

DROP TABLE IF EXISTS `Régions de l'Allemagne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Régions de l'Allemagne` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Régions de l'Italie`
--

DROP TABLE IF EXISTS `Régions de l'Italie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Régions de l'Italie` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Régions de la France`
--

DROP TABLE IF EXISTS `Régions de la France`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Régions de la France` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Römisches Reich`
--

DROP TABLE IF EXISTS `Römisches Reich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Römisches Reich` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Scala Geologica`
--

DROP TABLE IF EXISTS `Scala Geologica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Scala Geologica` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Schwedenrätsel Kurz`
--

DROP TABLE IF EXISTS `Schwedenrätsel Kurz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Schwedenrätsel Kurz` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Schwedenrätsel Lange`
--

DROP TABLE IF EXISTS `Schwedenrätsel Lange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Schwedenrätsel Lange` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Schwedenrätsel Medium`
--

DROP TABLE IF EXISTS `Schwedenrätsel Medium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Schwedenrätsel Medium` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sfida Aritmetica`
--

DROP TABLE IF EXISTS `Sfida Aritmetica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sfida Aritmetica` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sfida di Moltiplicazione I`
--

DROP TABLE IF EXISTS `Sfida di Moltiplicazione I`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sfida di Moltiplicazione I` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sfida di Moltiplicazione II`
--

DROP TABLE IF EXISTS `Sfida di Moltiplicazione II`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sfida di Moltiplicazione II` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Simboli Atomici`
--

DROP TABLE IF EXISTS `Simboli Atomici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Simboli Atomici` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Francesi 1`
--

DROP TABLE IF EXISTS `Sostantivi Francesi 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Francesi 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Francesi 2`
--

DROP TABLE IF EXISTS `Sostantivi Francesi 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Francesi 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Francesi 3`
--

DROP TABLE IF EXISTS `Sostantivi Francesi 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Francesi 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Francesi 4`
--

DROP TABLE IF EXISTS `Sostantivi Francesi 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Francesi 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Francesi 5`
--

DROP TABLE IF EXISTS `Sostantivi Francesi 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Francesi 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Inglesi 1`
--

DROP TABLE IF EXISTS `Sostantivi Inglesi 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Inglesi 1` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Inglesi 2`
--

DROP TABLE IF EXISTS `Sostantivi Inglesi 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Inglesi 2` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Inglesi 3`
--

DROP TABLE IF EXISTS `Sostantivi Inglesi 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Inglesi 3` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Inglesi 4`
--

DROP TABLE IF EXISTS `Sostantivi Inglesi 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Inglesi 4` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Inglesi 5`
--

DROP TABLE IF EXISTS `Sostantivi Inglesi 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Inglesi 5` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Portoghese 1`
--

DROP TABLE IF EXISTS `Sostantivi Portoghese 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Portoghese 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Portoghese 2`
--

DROP TABLE IF EXISTS `Sostantivi Portoghese 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Portoghese 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Portoghese 3`
--

DROP TABLE IF EXISTS `Sostantivi Portoghese 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Portoghese 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Portoghese 4`
--

DROP TABLE IF EXISTS `Sostantivi Portoghese 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Portoghese 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Portoghese 5`
--

DROP TABLE IF EXISTS `Sostantivi Portoghese 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Portoghese 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Russi 1`
--

DROP TABLE IF EXISTS `Sostantivi Russi 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Russi 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Russi 2`
--

DROP TABLE IF EXISTS `Sostantivi Russi 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Russi 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Russi 3`
--

DROP TABLE IF EXISTS `Sostantivi Russi 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Russi 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Russi 4`
--

DROP TABLE IF EXISTS `Sostantivi Russi 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Russi 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Russi 5`
--

DROP TABLE IF EXISTS `Sostantivi Russi 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Russi 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Spagnoli 1`
--

DROP TABLE IF EXISTS `Sostantivi Spagnoli 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Spagnoli 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Spagnoli 2`
--

DROP TABLE IF EXISTS `Sostantivi Spagnoli 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Spagnoli 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Spagnoli 3`
--

DROP TABLE IF EXISTS `Sostantivi Spagnoli 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Spagnoli 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Spagnoli 4`
--

DROP TABLE IF EXISTS `Sostantivi Spagnoli 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Spagnoli 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Spagnoli 5`
--

DROP TABLE IF EXISTS `Sostantivi Spagnoli 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Spagnoli 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Tedeschi 1`
--

DROP TABLE IF EXISTS `Sostantivi Tedeschi 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Tedeschi 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Tedeschi 2`
--

DROP TABLE IF EXISTS `Sostantivi Tedeschi 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Tedeschi 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Tedeschi 3`
--

DROP TABLE IF EXISTS `Sostantivi Tedeschi 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Tedeschi 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Tedeschi 4`
--

DROP TABLE IF EXISTS `Sostantivi Tedeschi 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Tedeschi 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Tedeschi 5`
--

DROP TABLE IF EXISTS `Sostantivi Tedeschi 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Tedeschi 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Turchi 1`
--

DROP TABLE IF EXISTS `Sostantivi Turchi 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Turchi 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Turchi 2`
--

DROP TABLE IF EXISTS `Sostantivi Turchi 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Turchi 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Turchi 3`
--

DROP TABLE IF EXISTS `Sostantivi Turchi 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Turchi 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Turchi 4`
--

DROP TABLE IF EXISTS `Sostantivi Turchi 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Turchi 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Turchi 5`
--

DROP TABLE IF EXISTS `Sostantivi Turchi 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Turchi 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Ungheresi 1`
--

DROP TABLE IF EXISTS `Sostantivi Ungheresi 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Ungheresi 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Ungheresi 2`
--

DROP TABLE IF EXISTS `Sostantivi Ungheresi 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Ungheresi 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Ungheresi 3`
--

DROP TABLE IF EXISTS `Sostantivi Ungheresi 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Ungheresi 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Ungheresi 4`
--

DROP TABLE IF EXISTS `Sostantivi Ungheresi 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Ungheresi 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sostantivi Ungheresi 5`
--

DROP TABLE IF EXISTS `Sostantivi Ungheresi 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sostantivi Ungheresi 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spagnolo Essenziale`
--

DROP TABLE IF EXISTS `Spagnolo Essenziale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spagnolo Essenziale` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanisch das Wesentliche`
--

DROP TABLE IF EXISTS `Spanisch das Wesentliche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanisch das Wesentliche` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanische Substantive 1`
--

DROP TABLE IF EXISTS `Spanische Substantive 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanische Substantive 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanische Substantive 2`
--

DROP TABLE IF EXISTS `Spanische Substantive 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanische Substantive 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanische Substantive 3`
--

DROP TABLE IF EXISTS `Spanische Substantive 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanische Substantive 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanische Substantive 4`
--

DROP TABLE IF EXISTS `Spanische Substantive 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanische Substantive 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanische Substantive 5`
--

DROP TABLE IF EXISTS `Spanische Substantive 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanische Substantive 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanische Verben 1`
--

DROP TABLE IF EXISTS `Spanische Verben 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanische Verben 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanische Verben 2`
--

DROP TABLE IF EXISTS `Spanische Verben 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanische Verben 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanische Verben 3`
--

DROP TABLE IF EXISTS `Spanische Verben 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanische Verben 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanische Verben 4`
--

DROP TABLE IF EXISTS `Spanische Verben 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanische Verben 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanische Verben 5`
--

DROP TABLE IF EXISTS `Spanische Verben 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanische Verben 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanische Wörter 1`
--

DROP TABLE IF EXISTS `Spanische Wörter 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanische Wörter 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanische Wörter 2`
--

DROP TABLE IF EXISTS `Spanische Wörter 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanische Wörter 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanische Wörter 3`
--

DROP TABLE IF EXISTS `Spanische Wörter 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanische Wörter 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanische Wörter 4`
--

DROP TABLE IF EXISTS `Spanische Wörter 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanische Wörter 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanische Wörter 5`
--

DROP TABLE IF EXISTS `Spanische Wörter 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanische Wörter 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanish Nouns 1`
--

DROP TABLE IF EXISTS `Spanish Nouns 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanish Nouns 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanish Nouns 2`
--

DROP TABLE IF EXISTS `Spanish Nouns 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanish Nouns 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanish Nouns 3`
--

DROP TABLE IF EXISTS `Spanish Nouns 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanish Nouns 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanish Nouns 4`
--

DROP TABLE IF EXISTS `Spanish Nouns 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanish Nouns 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanish Nouns 5`
--

DROP TABLE IF EXISTS `Spanish Nouns 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanish Nouns 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanish Verbs 1`
--

DROP TABLE IF EXISTS `Spanish Verbs 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanish Verbs 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanish Verbs 2`
--

DROP TABLE IF EXISTS `Spanish Verbs 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanish Verbs 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanish Verbs 3`
--

DROP TABLE IF EXISTS `Spanish Verbs 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanish Verbs 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanish Verbs 4`
--

DROP TABLE IF EXISTS `Spanish Verbs 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanish Verbs 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanish Verbs 5`
--

DROP TABLE IF EXISTS `Spanish Verbs 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanish Verbs 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanish Words 1`
--

DROP TABLE IF EXISTS `Spanish Words 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanish Words 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanish Words 2`
--

DROP TABLE IF EXISTS `Spanish Words 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanish Words 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanish Words 3`
--

DROP TABLE IF EXISTS `Spanish Words 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanish Words 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanish Words 4`
--

DROP TABLE IF EXISTS `Spanish Words 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanish Words 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spanish Words 5`
--

DROP TABLE IF EXISTS `Spanish Words 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spanish Words 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Staaten von Brasilien`
--

DROP TABLE IF EXISTS `Staaten von Brasilien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Staaten von Brasilien` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Staaten von Indien`
--

DROP TABLE IF EXISTS `Staaten von Indien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Staaten von Indien` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `States of Brazil`
--

DROP TABLE IF EXISTS `States of Brazil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `States of Brazil` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `States of India`
--

DROP TABLE IF EXISTS `States of India`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `States of India` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `States of Mexico`
--

DROP TABLE IF EXISTS `States of Mexico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `States of Mexico` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Stati del Brasile`
--

DROP TABLE IF EXISTS `Stati del Brasile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stati del Brasile` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Stati del Messico`
--

DROP TABLE IF EXISTS `Stati del Messico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stati del Messico` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Stati dell'India`
--

DROP TABLE IF EXISTS `Stati dell'India`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stati dell'India` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Storia del Mondo`
--

DROP TABLE IF EXISTS `Storia del Mondo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Storia del Mondo` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Storia dell'Arte`
--

DROP TABLE IF EXISTS `Storia dell'Arte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Storia dell'Arte` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Allemands 1`
--

DROP TABLE IF EXISTS `Substantifs Allemands 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Allemands 1` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Allemands 2`
--

DROP TABLE IF EXISTS `Substantifs Allemands 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Allemands 2` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Allemands 3`
--

DROP TABLE IF EXISTS `Substantifs Allemands 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Allemands 3` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Allemands 4`
--

DROP TABLE IF EXISTS `Substantifs Allemands 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Allemands 4` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Allemands 5`
--

DROP TABLE IF EXISTS `Substantifs Allemands 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Allemands 5` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Anglais 1`
--

DROP TABLE IF EXISTS `Substantifs Anglais 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Anglais 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Anglais 2`
--

DROP TABLE IF EXISTS `Substantifs Anglais 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Anglais 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Anglais 3`
--

DROP TABLE IF EXISTS `Substantifs Anglais 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Anglais 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Anglais 4`
--

DROP TABLE IF EXISTS `Substantifs Anglais 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Anglais 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Anglais 5`
--

DROP TABLE IF EXISTS `Substantifs Anglais 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Anglais 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Espagnols 1`
--

DROP TABLE IF EXISTS `Substantifs Espagnols 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Espagnols 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Espagnols 2`
--

DROP TABLE IF EXISTS `Substantifs Espagnols 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Espagnols 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Espagnols 3`
--

DROP TABLE IF EXISTS `Substantifs Espagnols 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Espagnols 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Espagnols 4`
--

DROP TABLE IF EXISTS `Substantifs Espagnols 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Espagnols 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Espagnols 5`
--

DROP TABLE IF EXISTS `Substantifs Espagnols 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Espagnols 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Hongrois 1`
--

DROP TABLE IF EXISTS `Substantifs Hongrois 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Hongrois 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Hongrois 2`
--

DROP TABLE IF EXISTS `Substantifs Hongrois 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Hongrois 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Hongrois 3`
--

DROP TABLE IF EXISTS `Substantifs Hongrois 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Hongrois 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Hongrois 4`
--

DROP TABLE IF EXISTS `Substantifs Hongrois 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Hongrois 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Hongrois 5`
--

DROP TABLE IF EXISTS `Substantifs Hongrois 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Hongrois 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Italiens 1`
--

DROP TABLE IF EXISTS `Substantifs Italiens 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Italiens 1` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Italiens 2`
--

DROP TABLE IF EXISTS `Substantifs Italiens 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Italiens 2` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Italiens 3`
--

DROP TABLE IF EXISTS `Substantifs Italiens 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Italiens 3` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Italiens 4`
--

DROP TABLE IF EXISTS `Substantifs Italiens 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Italiens 4` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Italiens 5`
--

DROP TABLE IF EXISTS `Substantifs Italiens 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Italiens 5` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Portugais 1`
--

DROP TABLE IF EXISTS `Substantifs Portugais 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Portugais 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Portugais 2`
--

DROP TABLE IF EXISTS `Substantifs Portugais 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Portugais 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Portugais 3`
--

DROP TABLE IF EXISTS `Substantifs Portugais 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Portugais 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Portugais 4`
--

DROP TABLE IF EXISTS `Substantifs Portugais 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Portugais 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Portugais 5`
--

DROP TABLE IF EXISTS `Substantifs Portugais 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Portugais 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Russes 1`
--

DROP TABLE IF EXISTS `Substantifs Russes 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Russes 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Russes 2`
--

DROP TABLE IF EXISTS `Substantifs Russes 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Russes 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Russes 3`
--

DROP TABLE IF EXISTS `Substantifs Russes 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Russes 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Russes 4`
--

DROP TABLE IF EXISTS `Substantifs Russes 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Russes 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Russes 5`
--

DROP TABLE IF EXISTS `Substantifs Russes 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Russes 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Turcs 1`
--

DROP TABLE IF EXISTS `Substantifs Turcs 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Turcs 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Turcs 2`
--

DROP TABLE IF EXISTS `Substantifs Turcs 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Turcs 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Turcs 3`
--

DROP TABLE IF EXISTS `Substantifs Turcs 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Turcs 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Turcs 4`
--

DROP TABLE IF EXISTS `Substantifs Turcs 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Turcs 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantifs Turcs 5`
--

DROP TABLE IF EXISTS `Substantifs Turcs 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantifs Turcs 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Alemães 1`
--

DROP TABLE IF EXISTS `Substantivos Alemães 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Alemães 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Alemães 2`
--

DROP TABLE IF EXISTS `Substantivos Alemães 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Alemães 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Alemães 3`
--

DROP TABLE IF EXISTS `Substantivos Alemães 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Alemães 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Alemães 4`
--

DROP TABLE IF EXISTS `Substantivos Alemães 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Alemães 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Alemães 5`
--

DROP TABLE IF EXISTS `Substantivos Alemães 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Alemães 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Espanhóis 1`
--

DROP TABLE IF EXISTS `Substantivos Espanhóis 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Espanhóis 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Espanhóis 2`
--

DROP TABLE IF EXISTS `Substantivos Espanhóis 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Espanhóis 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Espanhóis 3`
--

DROP TABLE IF EXISTS `Substantivos Espanhóis 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Espanhóis 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Espanhóis 4`
--

DROP TABLE IF EXISTS `Substantivos Espanhóis 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Espanhóis 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Espanhóis 5`
--

DROP TABLE IF EXISTS `Substantivos Espanhóis 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Espanhóis 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Franceses 1`
--

DROP TABLE IF EXISTS `Substantivos Franceses 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Franceses 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Franceses 2`
--

DROP TABLE IF EXISTS `Substantivos Franceses 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Franceses 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Franceses 3`
--

DROP TABLE IF EXISTS `Substantivos Franceses 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Franceses 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Franceses 4`
--

DROP TABLE IF EXISTS `Substantivos Franceses 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Franceses 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Franceses 5`
--

DROP TABLE IF EXISTS `Substantivos Franceses 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Franceses 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Húngaros 1`
--

DROP TABLE IF EXISTS `Substantivos Húngaros 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Húngaros 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Húngaros 2`
--

DROP TABLE IF EXISTS `Substantivos Húngaros 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Húngaros 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Húngaros 3`
--

DROP TABLE IF EXISTS `Substantivos Húngaros 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Húngaros 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Húngaros 4`
--

DROP TABLE IF EXISTS `Substantivos Húngaros 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Húngaros 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Húngaros 5`
--

DROP TABLE IF EXISTS `Substantivos Húngaros 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Húngaros 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Ingleses 1`
--

DROP TABLE IF EXISTS `Substantivos Ingleses 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Ingleses 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Ingleses 2`
--

DROP TABLE IF EXISTS `Substantivos Ingleses 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Ingleses 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Ingleses 3`
--

DROP TABLE IF EXISTS `Substantivos Ingleses 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Ingleses 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Ingleses 4`
--

DROP TABLE IF EXISTS `Substantivos Ingleses 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Ingleses 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Ingleses 5`
--

DROP TABLE IF EXISTS `Substantivos Ingleses 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Ingleses 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Italianos 1`
--

DROP TABLE IF EXISTS `Substantivos Italianos 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Italianos 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Italianos 2`
--

DROP TABLE IF EXISTS `Substantivos Italianos 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Italianos 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Italianos 3`
--

DROP TABLE IF EXISTS `Substantivos Italianos 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Italianos 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Italianos 4`
--

DROP TABLE IF EXISTS `Substantivos Italianos 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Italianos 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Italianos 5`
--

DROP TABLE IF EXISTS `Substantivos Italianos 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Italianos 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Russos 1`
--

DROP TABLE IF EXISTS `Substantivos Russos 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Russos 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Russos 2`
--

DROP TABLE IF EXISTS `Substantivos Russos 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Russos 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Russos 3`
--

DROP TABLE IF EXISTS `Substantivos Russos 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Russos 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Russos 4`
--

DROP TABLE IF EXISTS `Substantivos Russos 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Russos 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Russos 5`
--

DROP TABLE IF EXISTS `Substantivos Russos 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Russos 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Turcos 1`
--

DROP TABLE IF EXISTS `Substantivos Turcos 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Turcos 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Turcos 2`
--

DROP TABLE IF EXISTS `Substantivos Turcos 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Turcos 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Turcos 3`
--

DROP TABLE IF EXISTS `Substantivos Turcos 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Turcos 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Turcos 4`
--

DROP TABLE IF EXISTS `Substantivos Turcos 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Turcos 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Substantivos Turcos 5`
--

DROP TABLE IF EXISTS `Substantivos Turcos 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Substantivos Turcos 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Alemanes 1`
--

DROP TABLE IF EXISTS `Sustantivos Alemanes 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Alemanes 1` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Alemanes 2`
--

DROP TABLE IF EXISTS `Sustantivos Alemanes 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Alemanes 2` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Alemanes 3`
--

DROP TABLE IF EXISTS `Sustantivos Alemanes 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Alemanes 3` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Alemanes 4`
--

DROP TABLE IF EXISTS `Sustantivos Alemanes 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Alemanes 4` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Alemanes 5`
--

DROP TABLE IF EXISTS `Sustantivos Alemanes 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Alemanes 5` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Franceses 1`
--

DROP TABLE IF EXISTS `Sustantivos Franceses 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Franceses 1` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Franceses 2`
--

DROP TABLE IF EXISTS `Sustantivos Franceses 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Franceses 2` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Franceses 3`
--

DROP TABLE IF EXISTS `Sustantivos Franceses 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Franceses 3` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Franceses 4`
--

DROP TABLE IF EXISTS `Sustantivos Franceses 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Franceses 4` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Franceses 5`
--

DROP TABLE IF EXISTS `Sustantivos Franceses 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Franceses 5` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Húngaros 1`
--

DROP TABLE IF EXISTS `Sustantivos Húngaros 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Húngaros 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Húngaros 2`
--

DROP TABLE IF EXISTS `Sustantivos Húngaros 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Húngaros 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Húngaros 3`
--

DROP TABLE IF EXISTS `Sustantivos Húngaros 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Húngaros 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Húngaros 4`
--

DROP TABLE IF EXISTS `Sustantivos Húngaros 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Húngaros 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Húngaros 5`
--

DROP TABLE IF EXISTS `Sustantivos Húngaros 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Húngaros 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Ingleses 1`
--

DROP TABLE IF EXISTS `Sustantivos Ingleses 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Ingleses 1` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Ingleses 2`
--

DROP TABLE IF EXISTS `Sustantivos Ingleses 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Ingleses 2` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Ingleses 3`
--

DROP TABLE IF EXISTS `Sustantivos Ingleses 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Ingleses 3` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Ingleses 4`
--

DROP TABLE IF EXISTS `Sustantivos Ingleses 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Ingleses 4` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Ingleses 5`
--

DROP TABLE IF EXISTS `Sustantivos Ingleses 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Ingleses 5` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Italianos 1`
--

DROP TABLE IF EXISTS `Sustantivos Italianos 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Italianos 1` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Italianos 2`
--

DROP TABLE IF EXISTS `Sustantivos Italianos 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Italianos 2` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Italianos 3`
--

DROP TABLE IF EXISTS `Sustantivos Italianos 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Italianos 3` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Italianos 4`
--

DROP TABLE IF EXISTS `Sustantivos Italianos 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Italianos 4` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Italianos 5`
--

DROP TABLE IF EXISTS `Sustantivos Italianos 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Italianos 5` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Portugueses 1`
--

DROP TABLE IF EXISTS `Sustantivos Portugueses 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Portugueses 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Portugueses 2`
--

DROP TABLE IF EXISTS `Sustantivos Portugueses 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Portugueses 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Portugueses 3`
--

DROP TABLE IF EXISTS `Sustantivos Portugueses 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Portugueses 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Portugueses 4`
--

DROP TABLE IF EXISTS `Sustantivos Portugueses 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Portugueses 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Portugueses 5`
--

DROP TABLE IF EXISTS `Sustantivos Portugueses 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Portugueses 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Rusos 1`
--

DROP TABLE IF EXISTS `Sustantivos Rusos 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Rusos 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Rusos 2`
--

DROP TABLE IF EXISTS `Sustantivos Rusos 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Rusos 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Rusos 3`
--

DROP TABLE IF EXISTS `Sustantivos Rusos 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Rusos 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Rusos 4`
--

DROP TABLE IF EXISTS `Sustantivos Rusos 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Rusos 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Rusos 5`
--

DROP TABLE IF EXISTS `Sustantivos Rusos 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Rusos 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Turcos 1`
--

DROP TABLE IF EXISTS `Sustantivos Turcos 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Turcos 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Turcos 2`
--

DROP TABLE IF EXISTS `Sustantivos Turcos 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Turcos 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Turcos 3`
--

DROP TABLE IF EXISTS `Sustantivos Turcos 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Turcos 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Turcos 4`
--

DROP TABLE IF EXISTS `Sustantivos Turcos 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Turcos 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sustantivos Turcos 5`
--

DROP TABLE IF EXISTS `Sustantivos Turcos 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sustantivos Turcos 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Symboles Atomiques`
--

DROP TABLE IF EXISTS `Symboles Atomiques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Symboles Atomiques` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Szorzótábla I`
--

DROP TABLE IF EXISTS `Szorzótábla I`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Szorzótábla I` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Szorzótábla II`
--

DROP TABLE IF EXISTS `Szorzótábla II`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Szorzótábla II` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Számtani Kihívás`
--

DROP TABLE IF EXISTS `Számtani Kihívás`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Számtani Kihívás` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Símbolos Atómicos`
--

DROP TABLE IF EXISTS `Símbolos Atómicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Símbolos Atómicos` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tabelline I`
--

DROP TABLE IF EXISTS `Tabelline I`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tabelline I` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tabelline II`
--

DROP TABLE IF EXISTS `Tabelline II`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tabelline II` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tablas de Multiplicar I`
--

DROP TABLE IF EXISTS `Tablas de Multiplicar I`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tablas de Multiplicar I` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tablas de Multiplicar II`
--

DROP TABLE IF EXISTS `Tablas de Multiplicar II`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tablas de Multiplicar II` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tables de Multiplication I`
--

DROP TABLE IF EXISTS `Tables de Multiplication I`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tables de Multiplication I` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tables de Multiplication II`
--

DROP TABLE IF EXISTS `Tables de Multiplication II`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tables de Multiplication II` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tabuadas de Multiplicação I`
--

DROP TABLE IF EXISTS `Tabuadas de Multiplicação I`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tabuadas de Multiplicação I` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tabuadas de Multiplicação II`
--

DROP TABLE IF EXISTS `Tabuadas de Multiplicação II`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tabuadas de Multiplicação II` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tedesco Essenziale`
--

DROP TABLE IF EXISTS `Tedesco Essenziale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tedesco Essenziale` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Trigonometria Essencial`
--

DROP TABLE IF EXISTS `Trigonometria Essencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Trigonometria Essencial` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Trigonometria Essenziale`
--

DROP TABLE IF EXISTS `Trigonometria Essenziale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Trigonometria Essenziale` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Trigonometría Básica`
--

DROP TABLE IF EXISTS `Trigonometría Básica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Trigonometría Básica` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Trigonométrie Essentiel`
--

DROP TABLE IF EXISTS `Trigonométrie Essentiel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Trigonométrie Essentiel` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Turc Essentiel`
--

DROP TABLE IF EXISTS `Turc Essentiel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Turc Essentiel` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Turco Esencial`
--

DROP TABLE IF EXISTS `Turco Esencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Turco Esencial` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Turco Essencial`
--

DROP TABLE IF EXISTS `Turco Essencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Turco Essencial` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Turco Essenziale`
--

DROP TABLE IF EXISTS `Turco Essenziale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Turco Essenziale` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Turkish Nouns 1`
--

DROP TABLE IF EXISTS `Turkish Nouns 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Turkish Nouns 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Turkish Nouns 2`
--

DROP TABLE IF EXISTS `Turkish Nouns 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Turkish Nouns 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Turkish Nouns 3`
--

DROP TABLE IF EXISTS `Turkish Nouns 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Turkish Nouns 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Turkish Nouns 4`
--

DROP TABLE IF EXISTS `Turkish Nouns 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Turkish Nouns 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Turkish Nouns 5`
--

DROP TABLE IF EXISTS `Turkish Nouns 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Turkish Nouns 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Turkish Verbs 1`
--

DROP TABLE IF EXISTS `Turkish Verbs 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Turkish Verbs 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Turkish Verbs 2`
--

DROP TABLE IF EXISTS `Turkish Verbs 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Turkish Verbs 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Turkish Verbs 3`
--

DROP TABLE IF EXISTS `Turkish Verbs 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Turkish Verbs 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Turkish Verbs 4`
--

DROP TABLE IF EXISTS `Turkish Verbs 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Turkish Verbs 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Turkish Verbs 5`
--

DROP TABLE IF EXISTS `Turkish Verbs 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Turkish Verbs 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Turkish Words 1`
--

DROP TABLE IF EXISTS `Turkish Words 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Turkish Words 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Turkish Words 2`
--

DROP TABLE IF EXISTS `Turkish Words 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Turkish Words 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Turkish Words 3`
--

DROP TABLE IF EXISTS `Turkish Words 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Turkish Words 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Turkish Words 4`
--

DROP TABLE IF EXISTS `Turkish Words 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Turkish Words 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Turkish Words 5`
--

DROP TABLE IF EXISTS `Turkish Words 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Turkish Words 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Türkisch das Wesentliche`
--

DROP TABLE IF EXISTS `Türkisch das Wesentliche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Türkisch das Wesentliche` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Türkische Substantive 1`
--

DROP TABLE IF EXISTS `Türkische Substantive 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Türkische Substantive 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Türkische Substantive 2`
--

DROP TABLE IF EXISTS `Türkische Substantive 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Türkische Substantive 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Türkische Substantive 3`
--

DROP TABLE IF EXISTS `Türkische Substantive 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Türkische Substantive 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Türkische Substantive 4`
--

DROP TABLE IF EXISTS `Türkische Substantive 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Türkische Substantive 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Türkische Substantive 5`
--

DROP TABLE IF EXISTS `Türkische Substantive 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Türkische Substantive 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Türkische Verben 1`
--

DROP TABLE IF EXISTS `Türkische Verben 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Türkische Verben 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Türkische Verben 2`
--

DROP TABLE IF EXISTS `Türkische Verben 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Türkische Verben 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Türkische Verben 3`
--

DROP TABLE IF EXISTS `Türkische Verben 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Türkische Verben 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Türkische Verben 4`
--

DROP TABLE IF EXISTS `Türkische Verben 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Türkische Verben 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Türkische Verben 5`
--

DROP TABLE IF EXISTS `Türkische Verben 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Türkische Verben 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Türkische Wörter 1`
--

DROP TABLE IF EXISTS `Türkische Wörter 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Türkische Wörter 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Türkische Wörter 2`
--

DROP TABLE IF EXISTS `Türkische Wörter 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Türkische Wörter 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Türkische Wörter 3`
--

DROP TABLE IF EXISTS `Türkische Wörter 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Türkische Wörter 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Türkische Wörter 4`
--

DROP TABLE IF EXISTS `Türkische Wörter 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Türkische Wörter 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Türkische Wörter 5`
--

DROP TABLE IF EXISTS `Türkische Wörter 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Türkische Wörter 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ungarisch das Wesentliche`
--

DROP TABLE IF EXISTS `Ungarisch das Wesentliche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ungarisch das Wesentliche` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ungarische Substantive 1`
--

DROP TABLE IF EXISTS `Ungarische Substantive 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ungarische Substantive 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ungarische Substantive 2`
--

DROP TABLE IF EXISTS `Ungarische Substantive 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ungarische Substantive 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ungarische Substantive 3`
--

DROP TABLE IF EXISTS `Ungarische Substantive 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ungarische Substantive 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ungarische Substantive 4`
--

DROP TABLE IF EXISTS `Ungarische Substantive 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ungarische Substantive 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ungarische Substantive 5`
--

DROP TABLE IF EXISTS `Ungarische Substantive 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ungarische Substantive 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ungarische Verben 1`
--

DROP TABLE IF EXISTS `Ungarische Verben 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ungarische Verben 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ungarische Verben 2`
--

DROP TABLE IF EXISTS `Ungarische Verben 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ungarische Verben 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ungarische Verben 3`
--

DROP TABLE IF EXISTS `Ungarische Verben 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ungarische Verben 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ungarische Verben 4`
--

DROP TABLE IF EXISTS `Ungarische Verben 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ungarische Verben 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ungarische Verben 5`
--

DROP TABLE IF EXISTS `Ungarische Verben 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ungarische Verben 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ungarische Wörter 1`
--

DROP TABLE IF EXISTS `Ungarische Wörter 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ungarische Wörter 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ungarische Wörter 2`
--

DROP TABLE IF EXISTS `Ungarische Wörter 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ungarische Wörter 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ungarische Wörter 3`
--

DROP TABLE IF EXISTS `Ungarische Wörter 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ungarische Wörter 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ungarische Wörter 4`
--

DROP TABLE IF EXISTS `Ungarische Wörter 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ungarische Wörter 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ungarische Wörter 5`
--

DROP TABLE IF EXISTS `Ungarische Wörter 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ungarische Wörter 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ungherese Essenziale`
--

DROP TABLE IF EXISTS `Ungherese Essenziale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ungherese Essenziale` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Unidade de Medida`
--

DROP TABLE IF EXISTS `Unidade de Medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Unidade de Medida` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Unidades de Medida`
--

DROP TABLE IF EXISTS `Unidades de Medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Unidades de Medida` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Units of Measurement`
--

DROP TABLE IF EXISTS `Units of Measurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Units of Measurement` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Unità di Misura`
--

DROP TABLE IF EXISTS `Unità di Misura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Unità di Misura` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Unités de Mesure`
--

DROP TABLE IF EXISTS `Unités de Mesure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Unités de Mesure` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `US Presidents`
--

DROP TABLE IF EXISTS `US Presidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `US Presidents` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `US Präsidenten`
--

DROP TABLE IF EXISTS `US Präsidenten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `US Präsidenten` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `US State Capitals`
--

DROP TABLE IF EXISTS `US State Capitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `US State Capitals` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `US State Mottos`
--

DROP TABLE IF EXISTS `US State Mottos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `US State Mottos` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `US State Slogans`
--

DROP TABLE IF EXISTS `US State Slogans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `US State Slogans` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `USA Hauptstädte`
--

DROP TABLE IF EXISTS `USA Hauptstädte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USA Hauptstädte` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Useful Distances`
--

DROP TABLE IF EXISTS `Useful Distances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Useful Distances` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Allemands 1`
--

DROP TABLE IF EXISTS `Verbes Allemands 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Allemands 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Allemands 2`
--

DROP TABLE IF EXISTS `Verbes Allemands 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Allemands 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Allemands 3`
--

DROP TABLE IF EXISTS `Verbes Allemands 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Allemands 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Allemands 4`
--

DROP TABLE IF EXISTS `Verbes Allemands 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Allemands 4` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Allemands 5`
--

DROP TABLE IF EXISTS `Verbes Allemands 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Allemands 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Anglais 1`
--

DROP TABLE IF EXISTS `Verbes Anglais 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Anglais 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Anglais 2`
--

DROP TABLE IF EXISTS `Verbes Anglais 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Anglais 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Anglais 3`
--

DROP TABLE IF EXISTS `Verbes Anglais 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Anglais 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Anglais 4`
--

DROP TABLE IF EXISTS `Verbes Anglais 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Anglais 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Anglais 5`
--

DROP TABLE IF EXISTS `Verbes Anglais 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Anglais 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Espagnols 1`
--

DROP TABLE IF EXISTS `Verbes Espagnols 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Espagnols 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Espagnols 2`
--

DROP TABLE IF EXISTS `Verbes Espagnols 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Espagnols 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Espagnols 3`
--

DROP TABLE IF EXISTS `Verbes Espagnols 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Espagnols 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Espagnols 4`
--

DROP TABLE IF EXISTS `Verbes Espagnols 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Espagnols 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Espagnols 5`
--

DROP TABLE IF EXISTS `Verbes Espagnols 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Espagnols 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Hongrois 1`
--

DROP TABLE IF EXISTS `Verbes Hongrois 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Hongrois 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Hongrois 2`
--

DROP TABLE IF EXISTS `Verbes Hongrois 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Hongrois 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Hongrois 3`
--

DROP TABLE IF EXISTS `Verbes Hongrois 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Hongrois 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Hongrois 4`
--

DROP TABLE IF EXISTS `Verbes Hongrois 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Hongrois 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Hongrois 5`
--

DROP TABLE IF EXISTS `Verbes Hongrois 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Hongrois 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Italiens 1`
--

DROP TABLE IF EXISTS `Verbes Italiens 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Italiens 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Italiens 2`
--

DROP TABLE IF EXISTS `Verbes Italiens 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Italiens 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Italiens 3`
--

DROP TABLE IF EXISTS `Verbes Italiens 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Italiens 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Italiens 4`
--

DROP TABLE IF EXISTS `Verbes Italiens 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Italiens 4` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Italiens 5`
--

DROP TABLE IF EXISTS `Verbes Italiens 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Italiens 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Portugais 1`
--

DROP TABLE IF EXISTS `Verbes Portugais 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Portugais 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Portugais 2`
--

DROP TABLE IF EXISTS `Verbes Portugais 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Portugais 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Portugais 3`
--

DROP TABLE IF EXISTS `Verbes Portugais 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Portugais 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Portugais 4`
--

DROP TABLE IF EXISTS `Verbes Portugais 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Portugais 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Portugais 5`
--

DROP TABLE IF EXISTS `Verbes Portugais 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Portugais 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Russes 1`
--

DROP TABLE IF EXISTS `Verbes Russes 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Russes 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Russes 2`
--

DROP TABLE IF EXISTS `Verbes Russes 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Russes 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Russes 3`
--

DROP TABLE IF EXISTS `Verbes Russes 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Russes 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Russes 4`
--

DROP TABLE IF EXISTS `Verbes Russes 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Russes 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Russes 5`
--

DROP TABLE IF EXISTS `Verbes Russes 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Russes 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Turcs 1`
--

DROP TABLE IF EXISTS `Verbes Turcs 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Turcs 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Turcs 2`
--

DROP TABLE IF EXISTS `Verbes Turcs 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Turcs 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Turcs 3`
--

DROP TABLE IF EXISTS `Verbes Turcs 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Turcs 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Turcs 4`
--

DROP TABLE IF EXISTS `Verbes Turcs 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Turcs 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbes Turcs 5`
--

DROP TABLE IF EXISTS `Verbes Turcs 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbes Turcs 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Francesi 1`
--

DROP TABLE IF EXISTS `Verbi Francesi 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Francesi 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Francesi 2`
--

DROP TABLE IF EXISTS `Verbi Francesi 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Francesi 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Francesi 3`
--

DROP TABLE IF EXISTS `Verbi Francesi 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Francesi 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Francesi 4`
--

DROP TABLE IF EXISTS `Verbi Francesi 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Francesi 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Francesi 5`
--

DROP TABLE IF EXISTS `Verbi Francesi 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Francesi 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Inglesi 1`
--

DROP TABLE IF EXISTS `Verbi Inglesi 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Inglesi 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Inglesi 2`
--

DROP TABLE IF EXISTS `Verbi Inglesi 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Inglesi 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Inglesi 3`
--

DROP TABLE IF EXISTS `Verbi Inglesi 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Inglesi 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Inglesi 4`
--

DROP TABLE IF EXISTS `Verbi Inglesi 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Inglesi 4` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Inglesi 5`
--

DROP TABLE IF EXISTS `Verbi Inglesi 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Inglesi 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Portoghese 1`
--

DROP TABLE IF EXISTS `Verbi Portoghese 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Portoghese 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Portoghese 2`
--

DROP TABLE IF EXISTS `Verbi Portoghese 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Portoghese 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Portoghese 3`
--

DROP TABLE IF EXISTS `Verbi Portoghese 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Portoghese 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Portoghese 4`
--

DROP TABLE IF EXISTS `Verbi Portoghese 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Portoghese 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Portoghese 5`
--

DROP TABLE IF EXISTS `Verbi Portoghese 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Portoghese 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Russi 1`
--

DROP TABLE IF EXISTS `Verbi Russi 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Russi 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Russi 2`
--

DROP TABLE IF EXISTS `Verbi Russi 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Russi 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Russi 3`
--

DROP TABLE IF EXISTS `Verbi Russi 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Russi 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Russi 4`
--

DROP TABLE IF EXISTS `Verbi Russi 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Russi 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Russi 5`
--

DROP TABLE IF EXISTS `Verbi Russi 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Russi 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Spagnoli 1`
--

DROP TABLE IF EXISTS `Verbi Spagnoli 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Spagnoli 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Spagnoli 2`
--

DROP TABLE IF EXISTS `Verbi Spagnoli 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Spagnoli 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Spagnoli 3`
--

DROP TABLE IF EXISTS `Verbi Spagnoli 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Spagnoli 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Spagnoli 4`
--

DROP TABLE IF EXISTS `Verbi Spagnoli 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Spagnoli 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Spagnoli 5`
--

DROP TABLE IF EXISTS `Verbi Spagnoli 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Spagnoli 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Tedeschi 1`
--

DROP TABLE IF EXISTS `Verbi Tedeschi 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Tedeschi 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Tedeschi 2`
--

DROP TABLE IF EXISTS `Verbi Tedeschi 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Tedeschi 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Tedeschi 3`
--

DROP TABLE IF EXISTS `Verbi Tedeschi 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Tedeschi 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Tedeschi 4`
--

DROP TABLE IF EXISTS `Verbi Tedeschi 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Tedeschi 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Tedeschi 5`
--

DROP TABLE IF EXISTS `Verbi Tedeschi 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Tedeschi 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Turchi 1`
--

DROP TABLE IF EXISTS `Verbi Turchi 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Turchi 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Turchi 2`
--

DROP TABLE IF EXISTS `Verbi Turchi 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Turchi 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Turchi 3`
--

DROP TABLE IF EXISTS `Verbi Turchi 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Turchi 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Turchi 4`
--

DROP TABLE IF EXISTS `Verbi Turchi 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Turchi 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Turchi 5`
--

DROP TABLE IF EXISTS `Verbi Turchi 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Turchi 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Ungheresi 1`
--

DROP TABLE IF EXISTS `Verbi Ungheresi 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Ungheresi 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Ungheresi 2`
--

DROP TABLE IF EXISTS `Verbi Ungheresi 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Ungheresi 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Ungheresi 3`
--

DROP TABLE IF EXISTS `Verbi Ungheresi 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Ungheresi 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Ungheresi 4`
--

DROP TABLE IF EXISTS `Verbi Ungheresi 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Ungheresi 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbi Ungheresi 5`
--

DROP TABLE IF EXISTS `Verbi Ungheresi 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbi Ungheresi 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Alemães 1`
--

DROP TABLE IF EXISTS `Verbos Alemães 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Alemães 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Alemães 2`
--

DROP TABLE IF EXISTS `Verbos Alemães 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Alemães 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Alemães 3`
--

DROP TABLE IF EXISTS `Verbos Alemães 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Alemães 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Alemães 4`
--

DROP TABLE IF EXISTS `Verbos Alemães 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Alemães 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Alemães 5`
--

DROP TABLE IF EXISTS `Verbos Alemães 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Alemães 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Alemán 1`
--

DROP TABLE IF EXISTS `Verbos del Alemán 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Alemán 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Alemán 2`
--

DROP TABLE IF EXISTS `Verbos del Alemán 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Alemán 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Alemán 3`
--

DROP TABLE IF EXISTS `Verbos del Alemán 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Alemán 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Alemán 4`
--

DROP TABLE IF EXISTS `Verbos del Alemán 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Alemán 4` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Alemán 5`
--

DROP TABLE IF EXISTS `Verbos del Alemán 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Alemán 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Francés  1`
--

DROP TABLE IF EXISTS `Verbos del Francés  1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Francés  1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Francés  2`
--

DROP TABLE IF EXISTS `Verbos del Francés  2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Francés  2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Francés  3`
--

DROP TABLE IF EXISTS `Verbos del Francés  3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Francés  3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Francés  4`
--

DROP TABLE IF EXISTS `Verbos del Francés  4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Francés  4` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Francés  5`
--

DROP TABLE IF EXISTS `Verbos del Francés  5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Francés  5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Húngaro 1`
--

DROP TABLE IF EXISTS `Verbos del Húngaro 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Húngaro 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Húngaro 2`
--

DROP TABLE IF EXISTS `Verbos del Húngaro 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Húngaro 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Húngaro 3`
--

DROP TABLE IF EXISTS `Verbos del Húngaro 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Húngaro 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Húngaro 4`
--

DROP TABLE IF EXISTS `Verbos del Húngaro 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Húngaro 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Húngaro 5`
--

DROP TABLE IF EXISTS `Verbos del Húngaro 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Húngaro 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Inglés 1`
--

DROP TABLE IF EXISTS `Verbos del Inglés 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Inglés 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Inglés 2`
--

DROP TABLE IF EXISTS `Verbos del Inglés 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Inglés 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Inglés 3`
--

DROP TABLE IF EXISTS `Verbos del Inglés 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Inglés 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Inglés 4`
--

DROP TABLE IF EXISTS `Verbos del Inglés 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Inglés 4` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Inglés 5`
--

DROP TABLE IF EXISTS `Verbos del Inglés 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Inglés 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Italiano 1`
--

DROP TABLE IF EXISTS `Verbos del Italiano 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Italiano 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Italiano 2`
--

DROP TABLE IF EXISTS `Verbos del Italiano 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Italiano 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Italiano 3`
--

DROP TABLE IF EXISTS `Verbos del Italiano 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Italiano 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Italiano 4`
--

DROP TABLE IF EXISTS `Verbos del Italiano 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Italiano 4` (
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Italiano 5`
--

DROP TABLE IF EXISTS `Verbos del Italiano 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Italiano 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Portugués 1`
--

DROP TABLE IF EXISTS `Verbos del Portugués 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Portugués 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Portugués 2`
--

DROP TABLE IF EXISTS `Verbos del Portugués 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Portugués 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Portugués 3`
--

DROP TABLE IF EXISTS `Verbos del Portugués 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Portugués 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Portugués 4`
--

DROP TABLE IF EXISTS `Verbos del Portugués 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Portugués 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Portugués 5`
--

DROP TABLE IF EXISTS `Verbos del Portugués 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Portugués 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Ruso 1`
--

DROP TABLE IF EXISTS `Verbos del Ruso 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Ruso 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Ruso 2`
--

DROP TABLE IF EXISTS `Verbos del Ruso 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Ruso 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Ruso 3`
--

DROP TABLE IF EXISTS `Verbos del Ruso 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Ruso 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Ruso 4`
--

DROP TABLE IF EXISTS `Verbos del Ruso 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Ruso 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Ruso 5`
--

DROP TABLE IF EXISTS `Verbos del Ruso 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Ruso 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Turco 1`
--

DROP TABLE IF EXISTS `Verbos del Turco 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Turco 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Turco 2`
--

DROP TABLE IF EXISTS `Verbos del Turco 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Turco 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Turco 3`
--

DROP TABLE IF EXISTS `Verbos del Turco 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Turco 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Turco 4`
--

DROP TABLE IF EXISTS `Verbos del Turco 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Turco 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos del Turco 5`
--

DROP TABLE IF EXISTS `Verbos del Turco 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos del Turco 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Espanhóis 1`
--

DROP TABLE IF EXISTS `Verbos Espanhóis 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Espanhóis 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Espanhóis 2`
--

DROP TABLE IF EXISTS `Verbos Espanhóis 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Espanhóis 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Espanhóis 3`
--

DROP TABLE IF EXISTS `Verbos Espanhóis 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Espanhóis 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Espanhóis 4`
--

DROP TABLE IF EXISTS `Verbos Espanhóis 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Espanhóis 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Espanhóis 5`
--

DROP TABLE IF EXISTS `Verbos Espanhóis 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Espanhóis 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Franceses 1`
--

DROP TABLE IF EXISTS `Verbos Franceses 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Franceses 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Franceses 2`
--

DROP TABLE IF EXISTS `Verbos Franceses 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Franceses 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Franceses 3`
--

DROP TABLE IF EXISTS `Verbos Franceses 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Franceses 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Franceses 4`
--

DROP TABLE IF EXISTS `Verbos Franceses 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Franceses 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Franceses 5`
--

DROP TABLE IF EXISTS `Verbos Franceses 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Franceses 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Húngaros 1`
--

DROP TABLE IF EXISTS `Verbos Húngaros 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Húngaros 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Húngaros 2`
--

DROP TABLE IF EXISTS `Verbos Húngaros 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Húngaros 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Húngaros 3`
--

DROP TABLE IF EXISTS `Verbos Húngaros 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Húngaros 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Húngaros 4`
--

DROP TABLE IF EXISTS `Verbos Húngaros 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Húngaros 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Húngaros 5`
--

DROP TABLE IF EXISTS `Verbos Húngaros 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Húngaros 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Ingleses 1`
--

DROP TABLE IF EXISTS `Verbos Ingleses 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Ingleses 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Ingleses 2`
--

DROP TABLE IF EXISTS `Verbos Ingleses 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Ingleses 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Ingleses 3`
--

DROP TABLE IF EXISTS `Verbos Ingleses 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Ingleses 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Ingleses 4`
--

DROP TABLE IF EXISTS `Verbos Ingleses 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Ingleses 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Ingleses 5`
--

DROP TABLE IF EXISTS `Verbos Ingleses 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Ingleses 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Italianos 1`
--

DROP TABLE IF EXISTS `Verbos Italianos 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Italianos 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Italianos 2`
--

DROP TABLE IF EXISTS `Verbos Italianos 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Italianos 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Italianos 3`
--

DROP TABLE IF EXISTS `Verbos Italianos 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Italianos 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Italianos 4`
--

DROP TABLE IF EXISTS `Verbos Italianos 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Italianos 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Italianos 5`
--

DROP TABLE IF EXISTS `Verbos Italianos 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Italianos 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Russos 1`
--

DROP TABLE IF EXISTS `Verbos Russos 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Russos 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Russos 2`
--

DROP TABLE IF EXISTS `Verbos Russos 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Russos 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Russos 3`
--

DROP TABLE IF EXISTS `Verbos Russos 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Russos 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Russos 4`
--

DROP TABLE IF EXISTS `Verbos Russos 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Russos 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Russos 5`
--

DROP TABLE IF EXISTS `Verbos Russos 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Russos 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Turcos 1`
--

DROP TABLE IF EXISTS `Verbos Turcos 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Turcos 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Turcos 2`
--

DROP TABLE IF EXISTS `Verbos Turcos 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Turcos 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Turcos 3`
--

DROP TABLE IF EXISTS `Verbos Turcos 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Turcos 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Turcos 4`
--

DROP TABLE IF EXISTS `Verbos Turcos 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Turcos 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Verbos Turcos 5`
--

DROP TABLE IF EXISTS `Verbos Turcos 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Verbos Turcos 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Vocabulary Enhancer`
--

DROP TABLE IF EXISTS `Vocabulary Enhancer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vocabulary Enhancer` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Welt Endonyme`
--

DROP TABLE IF EXISTS `Welt Endonyme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Welt Endonyme` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Weltgeschichte`
--

DROP TABLE IF EXISTS `Weltgeschichte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Weltgeschichte` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `World Endonyms`
--

DROP TABLE IF EXISTS `World Endonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `World Endonyms` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `World History`
--

DROP TABLE IF EXISTS `World History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `World History` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Zweige der Wissenschaft`
--

DROP TABLE IF EXISTS `Zweige der Wissenschaft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Zweige der Wissenschaft` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zzdébugger`
--

DROP TABLE IF EXISTS `zzdébugger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zzdébugger` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ázsiai Fővárosok`
--

DROP TABLE IF EXISTS `Ázsiai Fővárosok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ázsiai Fővárosok` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Échelle Géologique`
--

DROP TABLE IF EXISTS `Échelle Géologique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Échelle Géologique` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `États de l'Inde`
--

DROP TABLE IF EXISTS `États de l'Inde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `États de l'Inde` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `États du Brésil`
--

DROP TABLE IF EXISTS `États du Brésil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `États du Brésil` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `États du Mexique`
--

DROP TABLE IF EXISTS `États du Mexique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `États du Mexique` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Événements d'Extinction`
--

DROP TABLE IF EXISTS `Événements d'Extinction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Événements d'Extinction` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Óceánia Fővárosok`
--

DROP TABLE IF EXISTS `Óceánia Fővárosok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Óceánia Fővárosok` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Азиатских столиц`
--

DROP TABLE IF EXISTS `Азиатских столиц`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Азиатских столиц` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Английские Глаголы 1`
--

DROP TABLE IF EXISTS `Английские Глаголы 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Английские Глаголы 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Английские Глаголы 2`
--

DROP TABLE IF EXISTS `Английские Глаголы 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Английские Глаголы 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Английские Глаголы 3`
--

DROP TABLE IF EXISTS `Английские Глаголы 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Английские Глаголы 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Английские Глаголы 4`
--

DROP TABLE IF EXISTS `Английские Глаголы 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Английские Глаголы 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Английские Глаголы 5`
--

DROP TABLE IF EXISTS `Английские Глаголы 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Английские Глаголы 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Английские Слова 1`
--

DROP TABLE IF EXISTS `Английские Слова 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Английские Слова 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Английские Слова 2`
--

DROP TABLE IF EXISTS `Английские Слова 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Английские Слова 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Английские Слова 3`
--

DROP TABLE IF EXISTS `Английские Слова 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Английские Слова 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Английские Слова 4`
--

DROP TABLE IF EXISTS `Английские Слова 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Английские Слова 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Английские Слова 5`
--

DROP TABLE IF EXISTS `Английские Слова 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Английские Слова 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Английские Существительные 1`
--

DROP TABLE IF EXISTS `Английские Существительные 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Английские Существительные 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Английские Существительные 2`
--

DROP TABLE IF EXISTS `Английские Существительные 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Английские Существительные 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Английские Существительные 3`
--

DROP TABLE IF EXISTS `Английские Существительные 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Английские Существительные 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Английские Существительные 4`
--

DROP TABLE IF EXISTS `Английские Существительные 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Английские Существительные 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Английские Существительные 5`
--

DROP TABLE IF EXISTS `Английские Существительные 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Английские Существительные 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Арифметической задачей`
--

DROP TABLE IF EXISTS `Арифметической задачей`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Арифметической задачей` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Африканских столицах`
--

DROP TABLE IF EXISTS `Африканских столицах`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Африканских столицах` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Важный Английский`
--

DROP TABLE IF EXISTS `Важный Английский`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Важный Английский` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Важный Венгерский`
--

DROP TABLE IF EXISTS `Важный Венгерский`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Важный Венгерский` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Важный Испанский`
--

DROP TABLE IF EXISTS `Важный Испанский`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Важный Испанский` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Важный Итальянский`
--

DROP TABLE IF EXISTS `Важный Итальянский`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Важный Итальянский` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Важный Немецкий`
--

DROP TABLE IF EXISTS `Важный Немецкий`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Важный Немецкий` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Важный Португальский`
--

DROP TABLE IF EXISTS `Важный Португальский`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Важный Португальский` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Важный Турецкий`
--

DROP TABLE IF EXISTS `Важный Турецкий`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Важный Турецкий` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Важный Французский`
--

DROP TABLE IF EXISTS `Важный Французский`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Важный Французский` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Венгерские Глаголы 1`
--

DROP TABLE IF EXISTS `Венгерские Глаголы 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Венгерские Глаголы 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Венгерские Глаголы 2`
--

DROP TABLE IF EXISTS `Венгерские Глаголы 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Венгерские Глаголы 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Венгерские Глаголы 3`
--

DROP TABLE IF EXISTS `Венгерские Глаголы 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Венгерские Глаголы 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Венгерские Глаголы 4`
--

DROP TABLE IF EXISTS `Венгерские Глаголы 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Венгерские Глаголы 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Венгерские Глаголы 5`
--

DROP TABLE IF EXISTS `Венгерские Глаголы 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Венгерские Глаголы 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Венгерские Слова 1`
--

DROP TABLE IF EXISTS `Венгерские Слова 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Венгерские Слова 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Венгерские Слова 2`
--

DROP TABLE IF EXISTS `Венгерские Слова 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Венгерские Слова 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Венгерские Слова 3`
--

DROP TABLE IF EXISTS `Венгерские Слова 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Венгерские Слова 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Венгерские Слова 4`
--

DROP TABLE IF EXISTS `Венгерские Слова 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Венгерские Слова 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Венгерские Слова 5`
--

DROP TABLE IF EXISTS `Венгерские Слова 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Венгерские Слова 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Венгерские Существительные 1`
--

DROP TABLE IF EXISTS `Венгерские Существительные 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Венгерские Существительные 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Венгерские Существительные 2`
--

DROP TABLE IF EXISTS `Венгерские Существительные 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Венгерские Существительные 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Венгерские Существительные 3`
--

DROP TABLE IF EXISTS `Венгерские Существительные 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Венгерские Существительные 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Венгерские Существительные 4`
--

DROP TABLE IF EXISTS `Венгерские Существительные 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Венгерские Существительные 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Венгерские Существительные 5`
--

DROP TABLE IF EXISTS `Венгерские Существительные 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Венгерские Существительные 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Главная лига бейсбола`
--

DROP TABLE IF EXISTS `Главная лига бейсбола`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Главная лига бейсбола` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Греческая мифология`
--

DROP TABLE IF EXISTS `Греческая мифология`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Греческая мифология` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Дробное Арифметика I`
--

DROP TABLE IF EXISTS `Дробное Арифметика I`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Дробное Арифметика I` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Дробное Арифметика II`
--

DROP TABLE IF EXISTS `Дробное Арифметика II`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Дробное Арифметика II` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Европейских столиц`
--

DROP TABLE IF EXISTS `Европейских столиц`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Европейских столиц` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Испанские Глаголы 1`
--

DROP TABLE IF EXISTS `Испанские Глаголы 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Испанские Глаголы 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Испанские Глаголы 2`
--

DROP TABLE IF EXISTS `Испанские Глаголы 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Испанские Глаголы 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Испанские Глаголы 3`
--

DROP TABLE IF EXISTS `Испанские Глаголы 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Испанские Глаголы 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Испанские Глаголы 4`
--

DROP TABLE IF EXISTS `Испанские Глаголы 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Испанские Глаголы 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Испанские Глаголы 5`
--

DROP TABLE IF EXISTS `Испанские Глаголы 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Испанские Глаголы 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Испанские Слова 1`
--

DROP TABLE IF EXISTS `Испанские Слова 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Испанские Слова 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Испанские Слова 2`
--

DROP TABLE IF EXISTS `Испанские Слова 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Испанские Слова 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Испанские Слова 3`
--

DROP TABLE IF EXISTS `Испанские Слова 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Испанские Слова 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Испанские Слова 4`
--

DROP TABLE IF EXISTS `Испанские Слова 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Испанские Слова 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Испанские Слова 5`
--

DROP TABLE IF EXISTS `Испанские Слова 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Испанские Слова 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Испанские Существительные 1`
--

DROP TABLE IF EXISTS `Испанские Существительные 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Испанские Существительные 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Испанские Существительные 2`
--

DROP TABLE IF EXISTS `Испанские Существительные 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Испанские Существительные 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Испанские Существительные 3`
--

DROP TABLE IF EXISTS `Испанские Существительные 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Испанские Существительные 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Испанские Существительные 4`
--

DROP TABLE IF EXISTS `Испанские Существительные 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Испанские Существительные 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Испанские Существительные 5`
--

DROP TABLE IF EXISTS `Испанские Существительные 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Испанские Существительные 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Итальянские Глаголы 1`
--

DROP TABLE IF EXISTS `Итальянские Глаголы 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Итальянские Глаголы 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Итальянские Глаголы 2`
--

DROP TABLE IF EXISTS `Итальянские Глаголы 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Итальянские Глаголы 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Итальянские Глаголы 3`
--

DROP TABLE IF EXISTS `Итальянские Глаголы 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Итальянские Глаголы 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Итальянские Глаголы 4`
--

DROP TABLE IF EXISTS `Итальянские Глаголы 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Итальянские Глаголы 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Итальянские Глаголы 5`
--

DROP TABLE IF EXISTS `Итальянские Глаголы 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Итальянские Глаголы 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Итальянские Слова 1`
--

DROP TABLE IF EXISTS `Итальянские Слова 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Итальянские Слова 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Итальянские Слова 2`
--

DROP TABLE IF EXISTS `Итальянские Слова 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Итальянские Слова 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Итальянские Слова 3`
--

DROP TABLE IF EXISTS `Итальянские Слова 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Итальянские Слова 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Итальянские Слова 4`
--

DROP TABLE IF EXISTS `Итальянские Слова 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Итальянские Слова 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Итальянские Слова 5`
--

DROP TABLE IF EXISTS `Итальянские Слова 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Итальянские Слова 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Итальянские Существительные 1`
--

DROP TABLE IF EXISTS `Итальянские Существительные 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Итальянские Существительные 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Итальянские Существительные 2`
--

DROP TABLE IF EXISTS `Итальянские Существительные 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Итальянские Существительные 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Итальянские Существительные 3`
--

DROP TABLE IF EXISTS `Итальянские Существительные 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Итальянские Существительные 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Итальянские Существительные 4`
--

DROP TABLE IF EXISTS `Итальянские Существительные 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Итальянские Существительные 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Итальянские Существительные 5`
--

DROP TABLE IF EXISTS `Итальянские Существительные 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Итальянские Существительные 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Национальная баскетбольная ассоциация`
--

DROP TABLE IF EXISTS `Национальная баскетбольная ассоциация`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Национальная баскетбольная ассоциация` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Национальная футбольная лига`
--

DROP TABLE IF EXISTS `Национальная футбольная лига`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Национальная футбольная лига` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Национальная хоккейная лига`
--

DROP TABLE IF EXISTS `Национальная хоккейная лига`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Национальная хоккейная лига` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Немецкие Глаголы 1`
--

DROP TABLE IF EXISTS `Немецкие Глаголы 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Немецкие Глаголы 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Немецкие Глаголы 2`
--

DROP TABLE IF EXISTS `Немецкие Глаголы 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Немецкие Глаголы 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Немецкие Глаголы 3`
--

DROP TABLE IF EXISTS `Немецкие Глаголы 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Немецкие Глаголы 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Немецкие Глаголы 4`
--

DROP TABLE IF EXISTS `Немецкие Глаголы 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Немецкие Глаголы 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Немецкие Глаголы 5`
--

DROP TABLE IF EXISTS `Немецкие Глаголы 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Немецкие Глаголы 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Немецкие Слова 1`
--

DROP TABLE IF EXISTS `Немецкие Слова 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Немецкие Слова 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Немецкие Слова 2`
--

DROP TABLE IF EXISTS `Немецкие Слова 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Немецкие Слова 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Немецкие Слова 3`
--

DROP TABLE IF EXISTS `Немецкие Слова 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Немецкие Слова 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Немецкие Слова 4`
--

DROP TABLE IF EXISTS `Немецкие Слова 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Немецкие Слова 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Немецкие Слова 5`
--

DROP TABLE IF EXISTS `Немецкие Слова 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Немецкие Слова 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Немецкие Существительные 1`
--

DROP TABLE IF EXISTS `Немецкие Существительные 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Немецкие Существительные 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Немецкие Существительные 2`
--

DROP TABLE IF EXISTS `Немецкие Существительные 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Немецкие Существительные 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Немецкие Существительные 3`
--

DROP TABLE IF EXISTS `Немецкие Существительные 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Немецкие Существительные 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Немецкие Существительные 4`
--

DROP TABLE IF EXISTS `Немецкие Существительные 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Немецкие Существительные 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Немецкие Существительные 5`
--

DROP TABLE IF EXISTS `Немецкие Существительные 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Немецкие Существительные 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `НОД и НОК Арифметика`
--

DROP TABLE IF EXISTS `НОД и НОК Арифметика`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `НОД и НОК Арифметика` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Океании столиц`
--

DROP TABLE IF EXISTS `Океании столиц`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Океании столиц` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Отрицательная Арифметика`
--

DROP TABLE IF EXISTS `Отрицательная Арифметика`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Отрицательная Арифметика` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Португальские Глаголы 1`
--

DROP TABLE IF EXISTS `Португальские Глаголы 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Португальские Глаголы 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Португальские Глаголы 2`
--

DROP TABLE IF EXISTS `Португальские Глаголы 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Португальские Глаголы 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Португальские Глаголы 3`
--

DROP TABLE IF EXISTS `Португальские Глаголы 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Португальские Глаголы 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Португальские Глаголы 4`
--

DROP TABLE IF EXISTS `Португальские Глаголы 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Португальские Глаголы 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Португальские Глаголы 5`
--

DROP TABLE IF EXISTS `Португальские Глаголы 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Португальские Глаголы 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Португальские Слова 1`
--

DROP TABLE IF EXISTS `Португальские Слова 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Португальские Слова 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Португальские Слова 2`
--

DROP TABLE IF EXISTS `Португальские Слова 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Португальские Слова 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Португальские Слова 3`
--

DROP TABLE IF EXISTS `Португальские Слова 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Португальские Слова 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Португальские Слова 4`
--

DROP TABLE IF EXISTS `Португальские Слова 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Португальские Слова 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Португальские Слова 5`
--

DROP TABLE IF EXISTS `Португальские Слова 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Португальские Слова 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Португальские Существительные 1`
--

DROP TABLE IF EXISTS `Португальские Существительные 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Португальские Существительные 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Португальские Существительные 2`
--

DROP TABLE IF EXISTS `Португальские Существительные 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Португальские Существительные 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Португальские Существительные 3`
--

DROP TABLE IF EXISTS `Португальские Существительные 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Португальские Существительные 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Португальские Существительные 4`
--

DROP TABLE IF EXISTS `Португальские Существительные 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Португальские Существительные 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Португальские Существительные 5`
--

DROP TABLE IF EXISTS `Португальские Существительные 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Португальские Существительные 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Процент Арифметика`
--

DROP TABLE IF EXISTS `Процент Арифметика`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Процент Арифметика` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Регионы Германии`
--

DROP TABLE IF EXISTS `Регионы Германии`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Регионы Германии` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Регионы Италии`
--

DROP TABLE IF EXISTS `Регионы Италии`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Регионы Италии` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Регионы Франции`
--

DROP TABLE IF EXISTS `Регионы Франции`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Регионы Франции` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Столицах Америки`
--

DROP TABLE IF EXISTS `Столицах Америки`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Столицах Америки` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `США государственный столиц`
--

DROP TABLE IF EXISTS `США государственный столиц`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `США государственный столиц` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Таблицы умножения I`
--

DROP TABLE IF EXISTS `Таблицы умножения I`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Таблицы умножения I` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Таблицы умножения II`
--

DROP TABLE IF EXISTS `Таблицы умножения II`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Таблицы умножения II` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Турецкие Глаголы 1`
--

DROP TABLE IF EXISTS `Турецкие Глаголы 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Турецкие Глаголы 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Турецкие Глаголы 2`
--

DROP TABLE IF EXISTS `Турецкие Глаголы 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Турецкие Глаголы 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Турецкие Глаголы 3`
--

DROP TABLE IF EXISTS `Турецкие Глаголы 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Турецкие Глаголы 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Турецкие Глаголы 4`
--

DROP TABLE IF EXISTS `Турецкие Глаголы 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Турецкие Глаголы 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Турецкие Глаголы 5`
--

DROP TABLE IF EXISTS `Турецкие Глаголы 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Турецкие Глаголы 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Турецкие Слова 1`
--

DROP TABLE IF EXISTS `Турецкие Слова 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Турецкие Слова 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Турецкие Слова 2`
--

DROP TABLE IF EXISTS `Турецкие Слова 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Турецкие Слова 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Турецкие Слова 3`
--

DROP TABLE IF EXISTS `Турецкие Слова 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Турецкие Слова 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Турецкие Слова 4`
--

DROP TABLE IF EXISTS `Турецкие Слова 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Турецкие Слова 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Турецкие Слова 5`
--

DROP TABLE IF EXISTS `Турецкие Слова 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Турецкие Слова 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Турецкие Существительные 1`
--

DROP TABLE IF EXISTS `Турецкие Существительные 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Турецкие Существительные 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Турецкие Существительные 2`
--

DROP TABLE IF EXISTS `Турецкие Существительные 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Турецкие Существительные 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Турецкие Существительные 3`
--

DROP TABLE IF EXISTS `Турецкие Существительные 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Турецкие Существительные 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Турецкие Существительные 4`
--

DROP TABLE IF EXISTS `Турецкие Существительные 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Турецкие Существительные 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Турецкие Существительные 5`
--

DROP TABLE IF EXISTS `Турецкие Существительные 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Турецкие Существительные 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Умножение вызов I`
--

DROP TABLE IF EXISTS `Умножение вызов I`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Умножение вызов I` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Умножение вызов II`
--

DROP TABLE IF EXISTS `Умножение вызов II`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Умножение вызов II` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Французские Глаголы 1`
--

DROP TABLE IF EXISTS `Французские Глаголы 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Французские Глаголы 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Французские Глаголы 2`
--

DROP TABLE IF EXISTS `Французские Глаголы 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Французские Глаголы 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Французские Глаголы 3`
--

DROP TABLE IF EXISTS `Французские Глаголы 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Французские Глаголы 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Французские Глаголы 4`
--

DROP TABLE IF EXISTS `Французские Глаголы 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Французские Глаголы 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Французские Глаголы 5`
--

DROP TABLE IF EXISTS `Французские Глаголы 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Французские Глаголы 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Французские Слова 1`
--

DROP TABLE IF EXISTS `Французские Слова 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Французские Слова 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Французские Слова 2`
--

DROP TABLE IF EXISTS `Французские Слова 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Французские Слова 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Французские Слова 3`
--

DROP TABLE IF EXISTS `Французские Слова 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Французские Слова 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Французские Слова 4`
--

DROP TABLE IF EXISTS `Французские Слова 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Французские Слова 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Французские Слова 5`
--

DROP TABLE IF EXISTS `Французские Слова 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Французские Слова 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Французские Существительные 1`
--

DROP TABLE IF EXISTS `Французские Существительные 1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Французские Существительные 1` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Французские Существительные 2`
--

DROP TABLE IF EXISTS `Французские Существительные 2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Французские Существительные 2` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Французские Существительные 3`
--

DROP TABLE IF EXISTS `Французские Существительные 3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Французские Существительные 3` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Французские Существительные 4`
--

DROP TABLE IF EXISTS `Французские Существительные 4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Французские Существительные 4` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Французские Существительные 5`
--

DROP TABLE IF EXISTS `Французские Существительные 5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Французские Существительные 5` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Штаты Бразилии`
--

DROP TABLE IF EXISTS `Штаты Бразилии`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Штаты Бразилии` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Штаты Индии`
--

DROP TABLE IF EXISTS `Штаты Индии`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Штаты Индии` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Штаты Мексики`
--

DROP TABLE IF EXISTS `Штаты Мексики`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Штаты Мексики` (
  `question` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `answer` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-30 11:49:18
