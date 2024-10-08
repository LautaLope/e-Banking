-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-10-2024 a las 23:52:48
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ebanking`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ciCliente` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefono` int(11) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`ciCliente`, `nombre`, `apellido`, `email`, `telefono`, `direccion`, `password`) VALUES
(12345678, 'Juan', 'Pérez', 'juan.perez@example.com', 99123456, 'Calle Falsa 123', '$2y$10$IQ6ZLvvqMEt52K5NBNLyuuO4RG2h3aMVeeWinjMr0zRh1ArjERHvK'),
(21436587, 'Ana', 'Martínez', 'ana.martinez@example.com', 97123987, 'Boulevard Artigas 321', ''),
(45678912, 'Pedro', 'López', 'pedro.lopez@example.com', 98765432, 'Calle 9 de Julio 789', ''),
(55558115, 'Lautaro', 'Lopez', 'bas.gdmc@gmail.com', 97385962, 'Jose P. Varela', '$2y$10$bz5l3XC6ut14BE3lhg2Yr.SLXGsAnt4pxLorxsO5gM5uEnB9NdhtG'),
(78912345, 'Luis', 'Rodríguez', 'luis.rodriguez@example.com', 96789123, 'Calle Rivera 654', ''),
(87654321, 'María', 'García', 'maria.garcia@example.com', 99654321, 'Avenida Siempre Viva 456', '$2y$10$oZkPyndD35vkeTRYqEo5z.K4UmBHP8T.ykLD/ixPR4GwGQC2vAL7W ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `nroCuenta` int(11) NOT NULL,
  `tipoCuenta` varchar(45) NOT NULL,
  `saldo` int(11) NOT NULL,
  `ciCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`nroCuenta`, `tipoCuenta`, `saldo`, `ciCliente`) VALUES
(100001, 'Caja de ahorro en pesos uruguayos', 15000, 12345678),
(100002, 'Caja de ahorro en dólares', 2000, 12345678),
(100003, 'Caja de ahorro en pesos uruguayos', 25000, 87654321),
(100004, 'Caja de ahorro en pesos uruguayos', 18000, 45678912),
(100005, 'Caja de ahorro en dólares', 500, 45678912),
(100006, 'Caja de ahorro en pesos uruguayos', 32000, 21436587),
(100007, 'Caja de ahorro en dólares', 1200, 21436587),
(100008, 'Caja de ahorro en pesos uruguayos', 27000, 78912345);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccion`
--

CREATE TABLE `transaccion` (
  `idTransaccion` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `monto` int(11) NOT NULL,
  `concepto` varchar(45) NOT NULL,
  `nroCuentaRemitente` int(11) NOT NULL,
  `nroCuentaDestinatario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `transaccion`
--

INSERT INTO `transaccion` (`idTransaccion`, `fecha`, `monto`, `concepto`, `nroCuentaRemitente`, `nroCuentaDestinatario`) VALUES
(1, '2024-09-20', 5000, 'Pago de servicios', 100001, 100003),
(2, '2024-09-21', 100, 'Transferencia familiar', 100005, 100008),
(3, '2024-09-22', 750, 'Compra de bienes', 100002, 100007),
(4, '2024-09-23', 2500, 'Pago de alquiler', 100006, 100001),
(5, '2024-09-24', 3000, 'Donación', 100004, 100003),
(6, '2024-09-25', 1500, 'Transferencia entre amigos', 100008, 100002);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ciCliente`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`nroCuenta`,`ciCliente`) USING BTREE,
  ADD KEY `ciCliente` (`ciCliente`);

--
-- Indices de la tabla `transaccion`
--
ALTER TABLE `transaccion`
  ADD PRIMARY KEY (`idTransaccion`,`nroCuentaRemitente`,`nroCuentaDestinatario`) USING BTREE,
  ADD KEY `nroCuentaRemitente` (`nroCuentaRemitente`) USING BTREE,
  ADD KEY `transaccion_ibfk_2` (`nroCuentaDestinatario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD CONSTRAINT `cuenta_ibfk_1` FOREIGN KEY (`ciCliente`) REFERENCES `cliente` (`ciCliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `transaccion`
--
ALTER TABLE `transaccion`
  ADD CONSTRAINT `transaccion_ibfk_1` FOREIGN KEY (`nroCuentaRemitente`) REFERENCES `cuenta` (`nroCuenta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaccion_ibfk_2` FOREIGN KEY (`nroCuentaDestinatario`) REFERENCES `cuenta` (`nroCuenta`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
