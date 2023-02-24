-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: iglesia
-- ------------------------------------------------------
-- Server version	5.7.41-log

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
-- Table structure for table `bautizos`
--

DROP TABLE IF EXISTS `bautizos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bautizos` (
  `IdBautizo` bigint(20) NOT NULL AUTO_INCREMENT,
  `Parroquia` varchar(250) NOT NULL,
  `FechaBautizo` date NOT NULL,
  `NombreParroco` varchar(250) NOT NULL,
  `Alcaldia` varchar(200) NOT NULL,
  `Libro` int(11) NOT NULL,
  `NumPartida` int(11) NOT NULL,
  `Folio` int(11) NOT NULL,
  `Year` varchar(50) NOT NULL,
  `Comentarios` varchar(500) DEFAULT NULL,
  `IdPersona` bigint(20) NOT NULL,
  `NumTomo` int(11) NOT NULL,
  `NumPag` int(11) NOT NULL,
  PRIMARY KEY (`IdBautizo`),
  KEY `fk_Bautizos_Familiares1_idx` (`IdPersona`),
  CONSTRAINT `fk_Bautizos_Familiares1` FOREIGN KEY (`IdPersona`) REFERENCES `personas` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bautizos`
--

LOCK TABLES `bautizos` WRITE;
/*!40000 ALTER TABLE `bautizos` DISABLE KEYS */;
INSERT INTO `bautizos` VALUES (2,'Dolores','2023-01-04','Roberto Antonio Flores Barrientos','Sonsonate',12,12,12,'2015 - 2020','Este es una Prueba si hubiera comentarios',9,222,111),(3,'Los angeles','2023-02-22','Samuel Hernandez','Sonsonate',47,63,69,'2010-2015','No hay nadie',13,45,85);
/*!40000 ALTER TABLE `bautizos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confirma`
--

DROP TABLE IF EXISTS `confirma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `confirma` (
  `IdConfirma` bigint(20) NOT NULL AUTO_INCREMENT,
  `Parroquia` varchar(250) NOT NULL,
  `FechaConfirma` date NOT NULL,
  `NombreParroco` varchar(250) NOT NULL,
  `Padrinos` varchar(300) NOT NULL,
  `Year` varchar(50) NOT NULL,
  `Comentarios` varchar(500) DEFAULT NULL,
  `ParroquiaBautizo` varchar(500) NOT NULL,
  `IdPersona` bigint(20) NOT NULL,
  `NumTomo` int(11) NOT NULL,
  `NumPag` int(11) NOT NULL,
  PRIMARY KEY (`IdConfirma`),
  KEY `fk_Confirma_Personas1_idx` (`NombreParroco`),
  KEY `fk_Confirma_Familiares1_idx` (`IdPersona`),
  CONSTRAINT `fk_Confirma_Familiares1` FOREIGN KEY (`IdPersona`) REFERENCES `personas` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confirma`
--

LOCK TABLES `confirma` WRITE;
/*!40000 ALTER TABLE `confirma` DISABLE KEYS */;
INSERT INTO `confirma` VALUES (1,'Dolores Trinidad','2023-01-04','Roberto Flores','Raul Melara y Teresa Hueso ','2000-2015','N/A','Catedral Sonsonate',9,10,120);
/*!40000 ALTER TABLE `confirma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `declaraciones`
--

DROP TABLE IF EXISTS `declaraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `declaraciones` (
  `IdDeclaracion` bigint(20) NOT NULL AUTO_INCREMENT,
  `FechaDeclaracion` date NOT NULL,
  `Parroquia` varchar(200) NOT NULL,
  `IdPersona` bigint(20) NOT NULL,
  `FechaCelebracion` date NOT NULL,
  `SiMatrimonio` varchar(45) NOT NULL,
  `ImpedimentoCanonico` varchar(45) NOT NULL,
  `TengoHijos` varchar(45) NOT NULL,
  `Administrador` varchar(250) NOT NULL,
  `NumExpediente` varchar(250) NOT NULL,
  `Libro` varchar(45) NOT NULL,
  `Years` varchar(45) NOT NULL,
  `TipoAdmin` varchar(45) NOT NULL,
  `ConfirmadoEn` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`IdDeclaracion`),
  KEY `fk_Declaraciones_Personas1_idx` (`IdPersona`),
  CONSTRAINT `fk_Declaraciones_Personas1` FOREIGN KEY (`IdPersona`) REFERENCES `personas` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `declaraciones`
--

LOCK TABLES `declaraciones` WRITE;
/*!40000 ALTER TABLE `declaraciones` DISABLE KEYS */;
INSERT INTO `declaraciones` VALUES (1,'2020-01-10','Dolores',1,'2020-01-10','Si','No','No','Diego Samuel Moran Lopez','542','1','2005-2010','Cura Párroco','Dolores de Santo Domingo'),(2,'2020-01-01','Dlores',2,'2020-01-01','Si','No','No','Diego Samuel Moran Lopez','542','1','2005-2010','Cura Párroco','Santisima Trinidad Del Mañana'),(3,'2023-01-14','Dolores',4,'2023-01-14','No','No','No','Pamela Flores','23337','1','2005-2010','',NULL),(4,'2023-02-05','San Jose',8,'2023-02-05','No','No','No','Geremias','5482','1','2011-2015','',NULL);
/*!40000 ALTER TABLE `declaraciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `declaracionestestigos`
--

DROP TABLE IF EXISTS `declaracionestestigos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `declaracionestestigos` (
  `IdDeclaracionTestigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `IdPersona` bigint(20) NOT NULL,
  `IdPrimerNovio` bigint(20) NOT NULL,
  `IdSegundoNovio` bigint(20) NOT NULL,
  `SiMatrimonio` varchar(45) NOT NULL,
  `ImpedimentoCanonico` varchar(45) NOT NULL,
  `TengoHijos` varchar(45) NOT NULL,
  `Years` varchar(200) NOT NULL,
  `IdDeclaracion` bigint(20) NOT NULL,
  PRIMARY KEY (`IdDeclaracionTestigo`),
  KEY `fk_Declaraciones_Personas1_idx` (`IdPersona`),
  KEY `fk_DeclaracionesTestigos_Personas1_idx` (`IdPrimerNovio`),
  KEY `fk_DeclaracionesTestigos_Personas2_idx` (`IdSegundoNovio`),
  KEY `fk_Declaracion` (`IdDeclaracion`),
  CONSTRAINT `fk_Declaracion` FOREIGN KEY (`IdDeclaracion`) REFERENCES `declaraciones` (`IdDeclaracion`),
  CONSTRAINT `fk_DeclaracionesTestigos_Personas1` FOREIGN KEY (`IdPrimerNovio`) REFERENCES `personas` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DeclaracionesTestigos_Personas2` FOREIGN KEY (`IdSegundoNovio`) REFERENCES `personas` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Declaraciones_Personas10` FOREIGN KEY (`IdPersona`) REFERENCES `personas` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `declaracionestestigos`
--

LOCK TABLES `declaracionestestigos` WRITE;
/*!40000 ALTER TABLE `declaracionestestigos` DISABLE KEYS */;
INSERT INTO `declaracionestestigos` VALUES (1,10,1,2,'No','No','No','5',1),(2,8,2,1,'No','No','No','5',2);
/*!40000 ALTER TABLE `declaracionestestigos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `IdDepartamento` int(11) NOT NULL AUTO_INCREMENT,
  `Departamentos` varchar(45) NOT NULL,
  PRIMARY KEY (`IdDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Ahuachapán'),(2,'Santa Ana'),(3,'Sonsonate'),(4,'La Libertad'),(5,'Chalatenango'),(6,'Cuscatlán'),(7,'San Salvador'),(8,'La Paz'),(9,'Cabañas'),(10,'San Vicente'),(11,'Usulután'),(12,'San Miguel'),(13,'Morazán'),(14,'La Unión');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familiares`
--

DROP TABLE IF EXISTS `familiares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `familiares` (
  `IdFamiliar` bigint(20) NOT NULL AUTO_INCREMENT,
  `IdPrimerFamiliar` bigint(20) NOT NULL,
  `IdSegundoFamiliar` bigint(20) NOT NULL,
  `Parentezco` varchar(45) NOT NULL,
  PRIMARY KEY (`IdFamiliar`),
  KEY `fk_Familiares_Personas1_idx` (`IdSegundoFamiliar`),
  KEY `fk_Familiares_Personas2_idx` (`IdPrimerFamiliar`),
  CONSTRAINT `fk_Familiares_Personas1` FOREIGN KEY (`IdSegundoFamiliar`) REFERENCES `personas` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Familiares_Personas2` FOREIGN KEY (`IdPrimerFamiliar`) REFERENCES `personas` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familiares`
--

LOCK TABLES `familiares` WRITE;
/*!40000 ALTER TABLE `familiares` DISABLE KEYS */;
INSERT INTO `familiares` VALUES (3,9,10,'Padre'),(4,1,5,'Padre'),(5,9,2,'Madre'),(6,9,1,'Padrino'),(7,1,11,'Madre'),(8,2,13,'Padre'),(9,2,12,'Madre'),(10,9,7,'Madrina');
/*!40000 ALTER TABLE `familiares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gastos`
--

DROP TABLE IF EXISTS `gastos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gastos` (
  `IdGastos` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Descripcion` varchar(250) NOT NULL,
  `Monto` decimal(18,2) NOT NULL,
  `TipoGasto` varchar(45) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Total` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`IdGastos`),
  UNIQUE KEY `IdGatos_UNIQUE` (`IdGastos`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastos`
--

LOCK TABLES `gastos` WRITE;
/*!40000 ALTER TABLE `gastos` DISABLE KEYS */;
INSERT INTO `gastos` VALUES (4,'2023-01-11','Bautizo',20.00,'Ingreso ',2,40.00),(5,'2023-01-10','Donacion',10.00,'Aporte especial',1,10.00),(6,'2023-01-07','Compra Pan',-3.00,'Egreso',1,-3.00),(7,'2023-01-04','Compra de Ostias Para las semanas del primer mes del año y asi tener mas tiempo de mas ostias',-20.00,'Egreso',1,-20.00),(8,'2023-01-04','Bautizo',10.00,'Ingreso ',1,10.00),(9,'2023-01-13','Bautizo',20.00,'Ingreso ',2,40.00),(10,'2023-01-14','Donacion',10.00,'Aporte especial',1,10.00),(11,'2023-01-17','Compra Pan',-3.00,'Egreso',1,-3.00),(12,'2023-01-15','Compra de Ostias Para las semanas del primer mes del año y asi tener mas tiempo de mas ostias',-20.00,'Egreso',1,-20.00),(13,'2023-01-18','Bautizo',10.00,'Ingreso ',1,10.00),(14,'2023-01-18','Bautizo',10.00,'Ingreso',3,30.00),(15,'2023-01-18','Compra de Pan',-5.00,'Egreso',2,-10.00),(16,'2023-01-04','Este es un agregado',12.00,'Ingreso ',1,12.00);
/*!40000 ALTER TABLE `gastos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER TotalIngresos
BEFORE INSERT ON gastos
FOR EACH ROW
BEGIN
    SET NEW.Total = NEW.Monto*NEW.Cantidad;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER TotalIngresosUpdate
BEFORE UPDATE ON gastos
FOR EACH ROW
BEGIN
    SET NEW.Total = NEW.Monto*NEW.Cantidad;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `opciones`
--

DROP TABLE IF EXISTS `opciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opciones` (
  `IDOpcion` int(11) NOT NULL AUTO_INCREMENT,
  `Opcion` varchar(45) NOT NULL,
  PRIMARY KEY (`IDOpcion`),
  UNIQUE KEY `IDOpcion_UNIQUE` (`IDOpcion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opciones`
--

LOCK TABLES `opciones` WRITE;
/*!40000 ALTER TABLE `opciones` DISABLE KEYS */;
INSERT INTO `opciones` VALUES (1,'GESTION USUARIO');
/*!40000 ALTER TABLE `opciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisos` (
  `IDPermiso` int(11) NOT NULL AUTO_INCREMENT,
  `IDRol` int(11) NOT NULL,
  `IDOpcion` int(11) NOT NULL,
  PRIMARY KEY (`IDPermiso`),
  UNIQUE KEY `IDPermiso_UNIQUE` (`IDPermiso`),
  KEY `fk_Permisos_Opciones1_idx` (`IDOpcion`),
  KEY `fk_Permisos_Roles1_idx` (`IDRol`),
  CONSTRAINT `fk_Permisos_Opciones1` FOREIGN KEY (`IDOpcion`) REFERENCES `opciones` (`IDOpcion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Permisos_Roles1` FOREIGN KEY (`IDRol`) REFERENCES `roles` (`IDRol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (1,1,1);
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `IdPersona` bigint(20) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Apellidos` varchar(45) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `DUI` varchar(10) DEFAULT '0',
  `FechaNacimiento` date NOT NULL,
  `IdDepartamento` int(11) NOT NULL,
  `EstadoCivil` varchar(45) NOT NULL,
  `Profession` varchar(45) DEFAULT 'N/A',
  `Religion` varchar(60) DEFAULT 'N/A',
  PRIMARY KEY (`IdPersona`),
  KEY `fk_Personas_Departamentos_idx` (`IdDepartamento`),
  CONSTRAINT `fk_Personas_Departamentos` FOREIGN KEY (`IdDepartamento`) REFERENCES `departamentos` (`IdDepartamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'Dannis Osmel','Sanchez Sanchez','Izalco, Sosonate El Salvador','05355745-9','2000-01-01',1,'Divorciado/a','Estudiante','No Profesa'),(2,'Carolina Beatriz','Saldaña Espinozza','Nahui','05355745-4','2001-12-04',1,'','Estudiante','No Profesa'),(3,'Testigo 1','Morazan','Izalco','05344745-4','1998-12-04',1,'Soltero','Estudiante','No Profesa'),(4,'Rodrigo','Moran','Sonsonate','02030123-5','2001-01-29',1,'Soltero','Estudiante','No Profesa'),(5,'Carlos','Flores','Acajutla','45639863-7','2000-05-02',5,'Soltero','Estudiante','No Profesa'),(6,'Maria','Castro','Acajutla','85639863-7','2000-07-02',5,'Soltera','Estudiante','No Profesa'),(7,'Juana Estefania','Zaldaña Cuestas','Acajutla','45639453-7','1990-05-02',7,'','Estudiante','No Profesa'),(8,'Pamela','Arias','SanAntonio','45965876-9','1995-03-22',4,'Soltera','Estudiante','No Profesa'),(9,'Melissa Estafany','Orellana Quijanos','SanBenito San Salvador El Salvador','N/A','2009-02-02',11,'Soltero/a','Estudiante','Catolica'),(10,'Jose Antonio','Salazar Argumedo','Sensunapam','78965123-8','1988-02-23',6,'Casado/a','Obrero','No Profesa'),(11,'Maria de los angeles teresa','Martinez de la paz sonsonate','izalco, col las nieves pasaje 69 av Flores','05214783-4','2023-02-05',3,'Soltero/a','Maester','Catolico'),(12,'Fulano de tal','Camsagua miguel','San miguel centro','02147896-5','2023-02-05',12,'Casado/a','Ama de casa','No hay'),(13,'Giorgio Armani','Exchange Facela','Italia, base central','02147896-6','2023-02-05',4,'Separación en proceso judicial','Modelo','Catolico');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `IDRol` int(11) NOT NULL AUTO_INCREMENT,
  `Rol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDRol`),
  UNIQUE KEY `IDRol_UNIQUE` (`IDRol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador'),(2,'Usuario');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `IdUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(250) NOT NULL,
  `IDRol` int(11) NOT NULL,
  PRIMARY KEY (`IdUsuario`),
  KEY `fk_Usuarios_Roles1_idx` (`IDRol`),
  CONSTRAINT `fk_Usuarios_Roles1` FOREIGN KEY (`IDRol`) REFERENCES `roles` (`IDRol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'RFLORES','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'iglesia'
--

--
-- Dumping routines for database 'iglesia'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-24 11:44:48
