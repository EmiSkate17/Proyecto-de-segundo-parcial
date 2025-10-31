-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2025 a las 08:08:34
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
-- Base de datos: `proyectoo`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarCliente` (IN `IC` VARCHAR(10))   BEGIN
DELETE FROM cliente WHERE id_cliente = IC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `guardarCliente` (IN `IC` VARCHAR(10), IN `HC` DATE, `NC` VARCHAR(50), IN `FDN` DATE)   BEGIN
INSERT INTO cliente(id_cliente, historial, nombre, fecha_de_nacimiento)VALUES(IC, HC, NC, FDN);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` varchar(10) NOT NULL,
  `historial` date DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `historial`, `nombre`, `fecha_de_nacimiento`) VALUES
('00100', '2025-05-11', 'saul', '2008-03-31'),
('00200', '2022-04-12', 'alexis', '2000-04-25'),
('00300', '2021-03-31', 'emilio', '2001-02-12'),
('00400', '2024-11-14', 'laura', '2004-11-14'),
('00500', '2023-08-16', 'rosa', '2003-04-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id_venta` varchar(10) NOT NULL,
  `articulo` varchar(50) NOT NULL,
  `cantidad` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id_venta`, `articulo`, `cantidad`) VALUES
('10000', 'Tortilla grande', '1 kilo'),
('20000', 'Tortilla chica', '¼ kilo'),
('20000', 'Tortilla normal', '½ kilo'),
('30000', 'Tortilla chica', '5 kilo'),
('40000', 'Tortilla normal', '3 kilo'),
('50000', 'monopol', '3 kilo'),
('50000', 'Sal', '20 kilo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` varchar(10) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `fechaDeNacimiento` date DEFAULT NULL,
  `domicilio` varchar(100) DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `nombre`, `sexo`, `fechaDeNacimiento`, `domicilio`, `hora_inicio`, `hora_fin`, `salario`) VALUES
('01000', 'Ernesto flores', 'm', '2002-08-02', 'Jacarandas#21', '06:30:00', '07:00:00', 2620.00),
('02000', 'María lopez', 'f', '2000-02-12', 'Nardo#285', '06:30:00', '08:00:00', 2500.00),
('03000', 'Juan jose', 'M', '2000-05-30', 'Av. De las rosas#22', '06:30:00', '09:00:00', 2500.00),
('04000', 'Mario hernandez', 'M', '2003-04-20', 'Villas #3-A', '09:30:00', '18:00:00', 2500.00),
('05000', 'Luis vazquez', 'M', '1989-01-16', 'Revolución #420', '07:30:00', '17:50:00', 2500.00),
('06000', 'Alejandra', 'F', '0000-00-00', 'Villas los cantaros #12', '06:30:00', '14:00:00', 2500.00),
('07000', 'Yazmin Chaires', 'F', '2006-11-21', '16 de septiembre', '06:30:00', '14:00:00', 2500.00);

--
-- Disparadores `empleado`
--
DELIMITER $$
CREATE TRIGGER `empleadoHorario` BEFORE INSERT ON `empleado` FOR EACH ROW BEGIN
SET NEW.hora_inicio = '06:30:00';
SET NEW.hora_fin = '14:00:00';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_puesto`
--

CREATE TABLE `empleado_puesto` (
  `id_empleado` varchar(10) NOT NULL,
  `puesto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado_puesto`
--

INSERT INTO `empleado_puesto` (`id_empleado`, `puesto`) VALUES
('01000', 'Administrador de ventas'),
('01000', 'Gerencia'),
('02000', 'repartidor'),
('03000', 'amasador'),
('03000', 'Repartidor'),
('04000', 'Gerencia'),
('05000', 'amasador'),
('07000', 'Cajero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrega_provedor`
--

CREATE TABLE `entrega_provedor` (
  `id_entrega` int(11) NOT NULL,
  `id_proveedor` varchar(5) NOT NULL,
  `dia_entrega` date NOT NULL,
  `cantidad_producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entrega_provedor`
--

INSERT INTO `entrega_provedor` (`id_entrega`, `id_proveedor`, `dia_entrega`, `cantidad_producto`) VALUES
(1, '00001', '2025-02-01', 25),
(2, '00001', '2025-02-01', 50),
(3, '00002', '2025-04-03', 30),
(4, '00003', '2025-06-05', 120),
(5, '00004', '2025-08-07', 200),
(6, '00005', '2025-10-09', 30),
(7, '00005', '2025-10-09', 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` varchar(10) NOT NULL,
  `fabricante` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `articulo` varchar(50) DEFAULT NULL,
  `categoria` varchar(50) NOT NULL,
  `ganancia` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `fabricante`, `precio`, `stock`, `articulo`, `categoria`, `ganancia`) VALUES
('10', 'tortilleria_pozarica', 20.00, 500, 'tortilla', 'chica', 3.00),
('15', 'tortilleria_pozarica', 24.00, 700, 'tortilla', 'normal', 3.60),
('20', 'INCA', 450.00, 30, 'manteca', '5kilos', 67.50),
('30', 'La_morisca', 350.00, 15, 'monopol', '10kilos', 52.50),
('40', 'promesa', 30.00, 50, 'bicarbonato', '1kilo', 4.50),
('50', 'SOL', 400.00, 15, 'sal', '20kilos', 60.00),
('60', 'tortilleria_pozarica', 24.00, 170, 'tortilla', 'integral', 3.60);

--
-- Disparadores `producto`
--
DELIMITER $$
CREATE TRIGGER `ganaciaProducto` BEFORE INSERT ON `producto` FOR EACH ROW BEGIN
SET NEW.ganancia = NEW.precio * .15;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_proveedor`
--

CREATE TABLE `producto_proveedor` (
  `clave_r` int(11) NOT NULL,
  `id_producto` varchar(10) NOT NULL,
  `id_proveedor` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_venta`
--

CREATE TABLE `producto_venta` (
  `clave_R` int(11) NOT NULL,
  `id_producto` varchar(10) NOT NULL,
  `id_venta` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` varchar(5) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `id_empleado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `nombre`, `id_empleado`) VALUES
('00001', 'Juan', '01000'),
('00002', 'carlos', '02000'),
('00003', 'Jose', '03000'),
('00004', 'Alberto', '04000'),
('00005', 'Emi', '05000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos_cliente`
--

CREATE TABLE `telefonos_cliente` (
  `id_cliente` varchar(10) NOT NULL,
  `telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `telefonos_cliente`
--

INSERT INTO `telefonos_cliente` (`id_cliente`, `telefono`) VALUES
('00100', '3314152222'),
('00100', '332222803'),
('00200', '3314525354'),
('00300', '3315168574'),
('00300', '3396851547'),
('00400', '3322225500'),
('00500', '3333905002');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` varchar(10) NOT NULL,
  `fecha` date DEFAULT NULL,
  `id_empleado` varchar(10) NOT NULL,
  `id_cliente` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_venta`, `fecha`, `id_empleado`, `id_cliente`) VALUES
('10000', '2025-05-05', '30', '00100'),
('20000', '2025-04-01', '30', '00200'),
('30000', '2025-04-01', '20', '00300'),
('40000', '2025-04-01', '30', '00400'),
('50000', '2025-04-01', '20', '00500');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id_venta`,`articulo`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `empleado_puesto`
--
ALTER TABLE `empleado_puesto`
  ADD PRIMARY KEY (`id_empleado`,`puesto`);

--
-- Indices de la tabla `entrega_provedor`
--
ALTER TABLE `entrega_provedor`
  ADD PRIMARY KEY (`id_entrega`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`,`precio`,`stock`,`categoria`);

--
-- Indices de la tabla `producto_proveedor`
--
ALTER TABLE `producto_proveedor`
  ADD PRIMARY KEY (`clave_r`),
  ADD KEY `id_producto2` (`id_producto`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `producto_venta`
--
ALTER TABLE `producto_venta`
  ADD PRIMARY KEY (`clave_R`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_venta` (`id_venta`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD KEY `id_empleado2` (`id_empleado`);

--
-- Indices de la tabla `telefonos_cliente`
--
ALTER TABLE `telefonos_cliente`
  ADD PRIMARY KEY (`id_cliente`,`telefono`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_empleado` (`id_empleado`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `entrega_provedor`
--
ALTER TABLE `entrega_provedor`
  MODIFY `id_entrega` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `producto_proveedor`
--
ALTER TABLE `producto_proveedor`
  MODIFY `clave_r` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto_venta`
--
ALTER TABLE `producto_venta`
  MODIFY `clave_R` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`);

--
-- Filtros para la tabla `empleado_puesto`
--
ALTER TABLE `empleado_puesto`
  ADD CONSTRAINT `empleado_puesto_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`);

--
-- Filtros para la tabla `entrega_provedor`
--
ALTER TABLE `entrega_provedor`
  ADD CONSTRAINT `entrega_provedor_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`);

--
-- Filtros para la tabla `producto_proveedor`
--
ALTER TABLE `producto_proveedor`
  ADD CONSTRAINT `id_producto2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `id_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`);

--
-- Filtros para la tabla `producto_venta`
--
ALTER TABLE `producto_venta`
  ADD CONSTRAINT `id_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `id_venta` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`);

--
-- Filtros para la tabla `telefonos_cliente`
--
ALTER TABLE `telefonos_cliente`
  ADD CONSTRAINT `telefonos_cliente_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
