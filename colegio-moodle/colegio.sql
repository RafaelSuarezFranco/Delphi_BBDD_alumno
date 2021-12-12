-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.5.60 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para colegio
DROP DATABASE IF EXISTS `colegio`;
CREATE DATABASE IF NOT EXISTS `colegio` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci */;
USE `colegio`;

-- Volcando estructura para tabla colegio.alumnos
DROP TABLE IF EXISTS `alumnos`;
CREATE TABLE IF NOT EXISTS `alumnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL DEFAULT '0',
  `curso` varchar(10) COLLATE latin1_spanish_ci NOT NULL DEFAULT '0',
  `expediente` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla colegio.alumnos: ~4 rows (aproximadamente)
DELETE FROM `alumnos`;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` (`id`, `nombre`, `curso`, `expediente`) VALUES
	(1, 'MARIA GARCIA', 'PRIMERO', 777),
	(6, 'JUAN GARCIA', 'TERCERO', 888),
	(7, 'PEPE EL LOCO', 'SEGUNDO', 555),
	(8, 'KIKO MATAMOROS', 'TERCERO', 123);
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;

-- Volcando estructura para tabla colegio.historico
DROP TABLE IF EXISTS `historico`;
CREATE TABLE IF NOT EXISTS `historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL DEFAULT '0',
  `expediente` int(11) NOT NULL DEFAULT '0',
  `curso` varchar(10) COLLATE latin1_spanish_ci DEFAULT NULL,
  `nota` float DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `fechabaja` date DEFAULT NULL,
  `motivobaja` varchar(50) COLLATE latin1_spanish_ci NOT NULL DEFAULT '0',
  `asignatura` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla colegio.historico: ~9 rows (aproximadamente)
DELETE FROM `historico`;
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
INSERT INTO `historico` (`id`, `nombre`, `expediente`, `curso`, `nota`, `fecha`, `fechabaja`, `motivobaja`, `asignatura`) VALUES
	(61, 'KIKO PERA', 5656, 'QUINTO', 0, '2018-12-18', '2021-12-06', 'FIN DEL CURSO', 'INGLES'),
	(62, 'KIKO PERA', 5656, 'QUINTO', 0, '2019-03-03', '2021-12-06', 'FIN DEL CURSO', 'INGLES'),
	(63, 'KIKO PERA', 5656, 'QUINTO', 0, '2019-06-21', '2021-12-06', 'FIN DEL CURSO', 'INGLES'),
	(64, 'KIKO PERA', 5656, 'QUINTO', 0, '2018-12-18', '2021-12-06', 'FIN DEL CURSO', 'MATEMATICAS'),
	(65, 'KIKO PERA', 5656, 'QUINTO', 0, '2019-03-03', '2021-12-06', 'FIN DEL CURSO', 'MATEMATICAS'),
	(66, 'KIKO PERA', 5656, 'QUINTO', 0, '2019-06-21', '2021-12-06', 'FIN DEL CURSO', 'MATEMATICAS'),
	(67, 'KIKO PERA', 5656, 'QUINTO', 0, '2018-12-18', '2021-12-06', 'FIN DEL CURSO', 'EDUCACION FISICA'),
	(68, 'KIKO PERA', 5656, 'QUINTO', 0, '2019-03-03', '2021-12-06', 'FIN DEL CURSO', 'EDUCACION FISICA'),
	(69, 'KIKO PERA', 5656, 'QUINTO', 0, '2019-06-21', '2021-12-06', 'FIN DEL CURSO', 'EDUCACION FISICA');
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;

-- Volcando estructura para tabla colegio.notas
DROP TABLE IF EXISTS `notas`;
CREATE TABLE IF NOT EXISTS `notas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expediente` int(11) NOT NULL DEFAULT '0',
  `curso` varchar(10) COLLATE latin1_spanish_ci DEFAULT NULL,
  `nota` float DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `asignatura` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla colegio.notas: ~30 rows (aproximadamente)
DELETE FROM `notas`;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` (`id`, `expediente`, `curso`, `nota`, `fecha`, `asignatura`) VALUES
	(1, 777, 'PRIMERO', 4.5, '2021-11-02', 'INGLES'),
	(2, 777, 'PRIMERO', 5, '2021-12-02', 'LENGUA'),
	(3, 777, 'PRIMERO', 7.6, '2021-12-06', 'MATEMATICAS'),
	(25, 888, 'TERCERO', 0, '2018-12-18', 'INGLES'),
	(26, 888, 'TERCERO', 0, '2019-03-03', 'INGLES'),
	(27, 888, 'TERCERO', 0, '2019-06-21', 'INGLES'),
	(28, 888, 'TERCERO', 0, '2018-12-18', 'MATEMATICAS'),
	(29, 888, 'TERCERO', 0, '2019-03-03', 'MATEMATICAS'),
	(30, 888, 'TERCERO', 0, '2019-06-21', 'MATEMATICAS'),
	(31, 888, 'TERCERO', 0, '2018-12-18', 'EDUCACION FISICA'),
	(32, 888, 'TERCERO', 0, '2019-03-03', 'EDUCACION FISICA'),
	(33, 888, 'TERCERO', 0, '2019-06-21', 'EDUCACION FISICA'),
	(34, 555, 'SEGUNDO', 0, '2018-12-18', 'INGLES'),
	(35, 555, 'SEGUNDO', 0, '2019-03-03', 'INGLES'),
	(36, 555, 'SEGUNDO', 4, '2019-06-21', 'INGLES'),
	(37, 555, 'SEGUNDO', 0, '2018-12-18', 'MATEMATICAS'),
	(38, 555, 'SEGUNDO', 0, '2019-03-03', 'MATEMATICAS'),
	(39, 555, 'SEGUNDO', 0, '2019-06-21', 'MATEMATICAS'),
	(40, 555, 'SEGUNDO', 0, '2018-12-18', 'EDUCACION FISICA'),
	(41, 555, 'SEGUNDO', 0, '2019-03-03', 'EDUCACION FISICA'),
	(42, 555, 'SEGUNDO', 0, '2019-06-21', 'EDUCACION FISICA'),
	(43, 123, 'TERCERO', 0, '2018-12-18', 'INGLES'),
	(44, 123, 'TERCERO', 0, '2019-03-03', 'INGLES'),
	(45, 123, 'TERCERO', 0, '2019-06-21', 'INGLES'),
	(46, 123, 'TERCERO', 0, '2018-12-18', 'MATEMATICAS'),
	(47, 123, 'TERCERO', 0, '2019-03-03', 'MATEMATICAS'),
	(48, 123, 'TERCERO', 0, '2019-06-21', 'MATEMATICAS'),
	(49, 123, 'TERCERO', 0, '2018-12-18', 'EDUCACION FISICA'),
	(50, 123, 'TERCERO', 0, '2019-03-03', 'EDUCACION FISICA'),
	(51, 123, 'TERCERO', 10, '2019-06-21', 'EDUCACION FISICA');
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
