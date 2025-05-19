-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: db_unifecaf
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `tbl_aluno`
--

DROP TABLE IF EXISTS `tbl_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_aluno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome_completo` varchar(45) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `rg` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) NOT NULL,
  `id_unifecaf` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_aluno_unifecaf` (`id_unifecaf`),
  CONSTRAINT `fk_aluno_unifecaf` FOREIGN KEY (`id_unifecaf`) REFERENCES `tbl_unifecaf` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_aluno_curso`
--

DROP TABLE IF EXISTS `tbl_aluno_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_aluno_curso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cursos` int NOT NULL,
  `id_aluno` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_aluno_curso_aluno` (`id_aluno`),
  KEY `fk_aluno_curso_cursos` (`id_cursos`),
  CONSTRAINT `fk_aluno_curso_aluno` FOREIGN KEY (`id_aluno`) REFERENCES `tbl_aluno` (`id`),
  CONSTRAINT `fk_aluno_curso_cursos` FOREIGN KEY (`id_cursos`) REFERENCES `tbl_cursos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_cursos`
--

DROP TABLE IF EXISTS `tbl_cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cursos` (
  `materias` varchar(45) DEFAULT NULL,
  `id_aluno` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_cursos_aluno` (`id_aluno`),
  CONSTRAINT `fk_cursos_aluno` FOREIGN KEY (`id_aluno`) REFERENCES `tbl_aluno` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_endereco_aluno`
--

DROP TABLE IF EXISTS `tbl_endereco_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_endereco_aluno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `id_unifecaf` int NOT NULL,
  `id_aluno` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_endereco_aluno_unifecaf` (`id_unifecaf`),
  KEY `fk_endereco_aluno_aluno` (`id_aluno`),
  CONSTRAINT `fk_endereco_aluno_aluno` FOREIGN KEY (`id_aluno`) REFERENCES `tbl_aluno` (`id`),
  CONSTRAINT `fk_endereco_aluno_unifecaf` FOREIGN KEY (`id_unifecaf`) REFERENCES `tbl_unifecaf` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_endereco_professor`
--

DROP TABLE IF EXISTS `tbl_endereco_professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_endereco_professor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `id_unifecaf` int NOT NULL,
  `id_professores` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_endereco_proferssor_unifecaf` (`id_unifecaf`),
  KEY `fk_endereco_professor_professor` (`id_professores`),
  CONSTRAINT `fk_endereco_proferssor_unifecaf` FOREIGN KEY (`id_unifecaf`) REFERENCES `tbl_unifecaf` (`id`),
  CONSTRAINT `fk_endereco_professor_professor` FOREIGN KEY (`id_professores`) REFERENCES `tbl_professores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_notas`
--

DROP TABLE IF EXISTS `tbl_notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_notas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nota` varchar(45) NOT NULL,
  `data` date NOT NULL,
  `id_aluno` int NOT NULL,
  `id_cursos` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_notas_aluno` (`id_aluno`),
  KEY `fk_notas_cursos` (`id_cursos`),
  CONSTRAINT `fk_notas_aluno` FOREIGN KEY (`id_aluno`) REFERENCES `tbl_aluno` (`id`),
  CONSTRAINT `fk_notas_cursos` FOREIGN KEY (`id_cursos`) REFERENCES `tbl_cursos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_professores`
--

DROP TABLE IF EXISTS `tbl_professores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_professores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome_completo` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `rg` varchar(45) DEFAULT NULL,
  `id_unifecaf` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_professores_unifecaf` (`id_unifecaf`),
  CONSTRAINT `fk_professores_unifecaf` FOREIGN KEY (`id_unifecaf`) REFERENCES `tbl_unifecaf` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_relatorios`
--

DROP TABLE IF EXISTS `tbl_relatorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_relatorios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `relatorio_aluno` varchar(200) NOT NULL,
  `id_unifecaf` int NOT NULL,
  `id_professores` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relatorios_unifecaf` (`id_unifecaf`),
  KEY `fk_relatorios_professores` (`id_professores`),
  CONSTRAINT `fk_relatorios_professores` FOREIGN KEY (`id_professores`) REFERENCES `tbl_professores` (`id`),
  CONSTRAINT `fk_relatorios_unifecaf` FOREIGN KEY (`id_unifecaf`) REFERENCES `tbl_unifecaf` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_responsaveis_legais`
--

DROP TABLE IF EXISTS `tbl_responsaveis_legais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_responsaveis_legais` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome_completo` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `id_unifecaf` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_responsaveis_legais_unifecaf` (`id_unifecaf`),
  CONSTRAINT `fk_responsaveis_legais_unifecaf` FOREIGN KEY (`id_unifecaf`) REFERENCES `tbl_unifecaf` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_unifecaf`
--

DROP TABLE IF EXISTS `tbl_unifecaf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_unifecaf` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-19 18:18:41
