-- MariaDB dump 10.19  Distrib 10.5.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: alpha-silicon-01
-- ------------------------------------------------------
-- Server version	10.5.18-MariaDB-0+deb11u1

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
-- Table structure for table `CURSOS`
--

DROP TABLE IF EXISTS `CURSOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CURSOS` (
  `idcurso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`idcurso`),
  UNIQUE KEY `idcurso_UNIQUE` (`idcurso`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CURSOS`
--

LOCK TABLES `CURSOS` WRITE;
/*!40000 ALTER TABLE `CURSOS` DISABLE KEYS */;
INSERT INTO `CURSOS` VALUES (5,'Administracion','Conceptos basicos y enfoque en planificación, organización, dirección y control','5');
/*!40000 ALTER TABLE `CURSOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MATERIAS`
--

DROP TABLE IF EXISTS `MATERIAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MATERIAS` (
  `idmateria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `objetivo` text DEFAULT NULL,
  `plan_estudio` text DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`idmateria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MATERIAS`
--

LOCK TABLES `MATERIAS` WRITE;
/*!40000 ALTER TABLE `MATERIAS` DISABLE KEYS */;
INSERT INTO `MATERIAS` VALUES (1,'Base de datos','Aprender a utilizar workbench y hacer diferentes consultas a una base de datos.',NULL,'1'),(2,'Programación Backend','Aprender a utilizar node.js y trabajar con una base de datos',NULL,'1'),(3,'Inglés intermediate','Mejorar habilidades y competencias. Inglés nivel 2.',NULL,'2'),(4,'Inglés beginners','Aprender conceptos básicos de idioma inglés',NULL,'2'),(5,'Derivadas','Analizar el comportamiento de las funciones y saber calcular sus derivadas',NULL,'3');
/*!40000 ALTER TABLE `MATERIAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEDES`
--

DROP TABLE IF EXISTS `SEDES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEDES` (
  `idsede` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `dirección` text DEFAULT NULL,
  `localidad` varchar(50) DEFAULT NULL,
  `cod_postal` varchar(10) DEFAULT NULL,
  `telcontacto1` varchar(15) DEFAULT NULL,
  `telcontacto2` varchar(15) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`idsede`),
  UNIQUE KEY `idsede_UNIQUE` (`idsede`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEDES`
--

LOCK TABLES `SEDES` WRITE;
/*!40000 ALTER TABLE `SEDES` DISABLE KEYS */;
/*!40000 ALTER TABLE `SEDES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIOS`
--

DROP TABLE IF EXISTS `USUARIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USUARIOS` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `idusuario_UNIQUE` (`idusuario`),
  UNIQUE KEY `nickname_UNIQUE` (`nickname`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIOS`
--

LOCK TABLES `USUARIOS` WRITE;
/*!40000 ALTER TABLE `USUARIOS` DISABLE KEYS */;
INSERT INTO `USUARIOS` VALUES (1,'Marcos Galperin','marcosgalperin@gmial.com','howareyou1','1'),(2,'André Le glacier','Le.glacier.mode@outlook.com','riseandshine1','1'),(3,'Adrian Rossi','adrian.mode@outlook.com','Easypeasy23','1'),(4,'Jeon Kim','jeonkim@outlook.com','allencripted21','1'),(5,'Andrea Musso','andreamusso@gmail.com','lastpass1234','1');
/*!40000 ALTER TABLE `USUARIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `dni` varchar(12) NOT NULL,
  `sexo` char(1) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`idpersona`),
  UNIQUE KEY `idpersona_UNIQUE` (`idpersona`),
  UNIQUE KEY `dni_UNIQUE` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'Antonia','Lopez','42133221','F','2001-11-02','1'),(2,'Gabriela','Gutierres','32337879','F','1998-02-03','1'),(3,'Juan Gabriel','Rosas','32245566','M','1988-02-03','1'),(4,'Roberto','Carlos','31998876','M','1986-02-03','1'),(5,'Julian','Alcaraz','29654876','M','1978-12-05','1'),(6,'Florecia','Gimenez','43454612','F','2002-07-12','1'),(7,'Juana','Richmond','46454612','F','2007-07-12','1'),(8,'Ramona','Gimenez','41287346','F','2001-11-27','1'),(9,'Andres','Kuhn','31454612','M','1985-07-12','1');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-04 15:54:02
