-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: e_Localhood3
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Address` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `UserID` bigint NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Locality` varchar(50) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `HouseName` varchar(100) NOT NULL,
  `Pincode` bigint NOT NULL,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `Address_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BusinessInformation`
--

DROP TABLE IF EXISTS `BusinessInformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BusinessInformation` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `BusinessOwnerID` bigint NOT NULL,
  `ShopName` varchar(50) DEFAULT NULL,
  `ShopCategory` varchar(50) DEFAULT NULL,
  `WhatsAppNo` bigint NOT NULL,
  `DeliveryDetails` varchar(50) NOT NULL,
  `ShopPhoto` blob,
  `PhotoInsideShop` blob,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `BusinessOwnerID` (`BusinessOwnerID`),
  CONSTRAINT `BusinessInformation_ibfk_1` FOREIGN KEY (`BusinessOwnerID`) REFERENCES `BusinessOwner` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BusinessInformation`
--

LOCK TABLES `BusinessInformation` WRITE;
/*!40000 ALTER TABLE `BusinessInformation` DISABLE KEYS */;
/*!40000 ALTER TABLE `BusinessInformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BusinessOwner`
--

DROP TABLE IF EXISTS `BusinessOwner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BusinessOwner` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `UserID` bigint NOT NULL,
  `AadharCardNo` bigint NOT NULL,
  `AadharFrontImage` blob NOT NULL,
  `AadharBackImage` blob,
  `PassportPhotoImage` blob NOT NULL,
  `AccountHolderName` varchar(100) NOT NULL,
  `BankACNo` bigint NOT NULL,
  `IFSCCode` varchar(11) NOT NULL,
  `UPIID` varchar(25) NOT NULL,
  `QRCodeImage` blob NOT NULL,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `BusinessOwner_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BusinessOwner`
--

LOCK TABLES `BusinessOwner` WRITE;
/*!40000 ALTER TABLE `BusinessOwner` DISABLE KEYS */;
/*!40000 ALTER TABLE `BusinessOwner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cart`
--

DROP TABLE IF EXISTS `Cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cart` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `UserID` bigint NOT NULL,
  `ProductID` bigint NOT NULL,
  `Quantity` bigint NOT NULL,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `UserID` (`UserID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `Cart_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`),
  CONSTRAINT `Cart_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cart`
--

LOCK TABLES `Cart` WRITE;
/*!40000 ALTER TABLE `Cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderDescription`
--

DROP TABLE IF EXISTS `OrderDescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderDescription` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `Order_1ID` bigint NOT NULL,
  `UserID` bigint NOT NULL,
  `ProductID` bigint NOT NULL,
  `Price` bigint NOT NULL,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `Order_1ID` (`Order_1ID`),
  KEY `UserID` (`UserID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `OrderDescription_ibfk_1` FOREIGN KEY (`Order_1ID`) REFERENCES `Order_1` (`ID`),
  CONSTRAINT `OrderDescription_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`),
  CONSTRAINT `OrderDescription_ibfk_3` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderDescription`
--

LOCK TABLES `OrderDescription` WRITE;
/*!40000 ALTER TABLE `OrderDescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderDescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_1`
--

DROP TABLE IF EXISTS `Order_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order_1` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `UserID` bigint NOT NULL,
  `Quantity` bigint NOT NULL,
  `NetAmount` bigint NOT NULL,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `Order_1_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_1`
--

LOCK TABLES `Order_1` WRITE;
/*!40000 ALTER TABLE `Order_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `Order_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `UserID` bigint NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `Payment_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `BusinessInformationID` bigint NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Price` bigint NOT NULL,
  `Category` varchar(50) NOT NULL,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `BusinessInformationID` (`BusinessInformationID`),
  CONSTRAINT `Product_ibfk_1` FOREIGN KEY (`BusinessInformationID`) REFERENCES `BusinessInformation` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductColor`
--

DROP TABLE IF EXISTS `ProductColor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProductColor` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ProductID` bigint NOT NULL,
  `Color` varchar(50) NOT NULL,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `ProductColor_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductColor`
--

LOCK TABLES `ProductColor` WRITE;
/*!40000 ALTER TABLE `ProductColor` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductColor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductPhoto`
--

DROP TABLE IF EXISTS `ProductPhoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProductPhoto` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ProductID` bigint NOT NULL,
  `Photo` blob NOT NULL,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `ProductPhoto_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductPhoto`
--

LOCK TABLES `ProductPhoto` WRITE;
/*!40000 ALTER TABLE `ProductPhoto` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductPhoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductSize`
--

DROP TABLE IF EXISTS `ProductSize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProductSize` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ProductID` bigint NOT NULL,
  `Size` varchar(500) NOT NULL,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `ProductSize_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductSize`
--

LOCK TABLES `ProductSize` WRITE;
/*!40000 ALTER TABLE `ProductSize` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductSize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Role` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `Role` varchar(25) NOT NULL,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShopAddress`
--

DROP TABLE IF EXISTS `ShopAddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ShopAddress` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `BusinessInformationID` bigint NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Locality` varchar(50) NOT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `Pincode` bigint NOT NULL,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `BusinessInformationID` (`BusinessInformationID`),
  CONSTRAINT `ShopAddress_ibfk_1` FOREIGN KEY (`BusinessInformationID`) REFERENCES `BusinessInformation` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShopAddress`
--

LOCK TABLES `ShopAddress` WRITE;
/*!40000 ALTER TABLE `ShopAddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShopAddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `RoleID` bigint NOT NULL,
  `EmailID` varchar(100) NOT NULL,
  `PhoneNo` bigint NOT NULL,
  `Password` varchar(25) NOT NULL,
  `OTP` bigint NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `RoleID` (`RoleID`),
  CONSTRAINT `User_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `Role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-06 19:49:54
