-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: platzi-market
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Table structure for table `CATEGORIAS`
--

DROP TABLE IF EXISTS `CATEGORIAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CATEGORIAS` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `estado` tinyint NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CLIENTES`
--

DROP TABLE IF EXISTS `CLIENTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENTES` (
  `id` varchar(20) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `celular` decimal(10,0) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `correo_electronico` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `COMPRAS`
--

DROP TABLE IF EXISTS `COMPRAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPRAS` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `id_cliente` varchar(20) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `medio_pago` char(1) DEFAULT NULL,
  `comentario` varchar(300) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `fk_COMPRAS_CLIENTES1_idx` (`id_cliente`),
  CONSTRAINT `fk_COMPRAS_CLIENTES1` FOREIGN KEY (`id_cliente`) REFERENCES `CLIENTES` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `COMPRAS_PRODUCTOS`
--

DROP TABLE IF EXISTS `COMPRAS_PRODUCTOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPRAS_PRODUCTOS` (
  `id_compra` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  `total` decimal(16,2) DEFAULT NULL,
  `estado` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_compra`,`id_producto`),
  KEY `fk_COMPRAS_PRODUCTOS_COMPRAS1_idx` (`id_compra`),
  KEY `fk_COMPRAS_PRODUCTOS_PRODUCTOS1` (`id_producto`),
  CONSTRAINT `fk_COMPRAS_PRODUCTOS_COMPRAS1` FOREIGN KEY (`id_compra`) REFERENCES `COMPRAS` (`id_compra`),
  CONSTRAINT `fk_COMPRAS_PRODUCTOS_PRODUCTOS1` FOREIGN KEY (`id_producto`) REFERENCES `PRODUCTOS` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PRODUCTOS`
--

DROP TABLE IF EXISTS `PRODUCTOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRODUCTOS` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `id_categoria` int NOT NULL,
  `codigo_barras` varchar(150) DEFAULT NULL,
  `precio_venta` decimal(16,2) DEFAULT NULL,
  `cantidad_stock` int NOT NULL,
  `estado` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_PRODUCTOS_CATEGORIAS_idx` (`id_categoria`),
  CONSTRAINT `fk_PRODUCTOS_CATEGORIAS` FOREIGN KEY (`id_categoria`) REFERENCES `CATEGORIAS` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-26 10:00:13
