-- phpMyAdmin SQL Dump
-- Banco: agenciadeviagens

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `agenciadeviagens`
DEFAULT CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

USE `agenciadeviagens`;

DROP TABLE IF EXISTS `viagem`;

CREATE TABLE `viagem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destino` varchar(100) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `duracao` int(11) NOT NULL,
  `vDiaria` decimal(10,2) NOT NULL,
  `dtViagem` date NOT NULL,
  `meioTrans` varchar(100) NOT NULL,
  `valorPassagem` decimal(10,2) NOT NULL,
  `nPessoas` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

INSERT INTO `viagem`
(`id`, `destino`, `pais`, `duracao`, `vDiaria`, `dtViagem`, `meioTrans`, `valorPassagem`, `nPessoas`)
VALUES
(1, 'Paris', 'França', 7, 400.00, '2026-07-21', 'aviao', 3000.00, 2),
(2, 'Rio de Janeiro', 'Brasil', 5, 280.00, '2026-08-10', 'onibus', 180.00, 3),
(3, 'Roma', 'Itália', 10, 520.00, '2026-09-05', 'aviao', 3500.00, 2),
(4, 'Maceió', 'Brasil', 6, 320.00, '2026-10-18', 'cruzeiro', 950.00, 4);

ALTER TABLE `viagem`
AUTO_INCREMENT = 5;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;