-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-10-2023 a las 20:15:33
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mi_tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id`, `id_venta`, `id_producto`, `nombre`, `cantidad`, `precio`) VALUES
(1, 1, 1, 'ACEITE VEGETAL NUTRIOLI 12/946ML', 1, '28.00'),
(2, 1, 2, 'CATSUP CLEMENTE JAQUES 24/350G', 1, '7.50'),
(3, 1, 3, 'MAYONESA MCCORMIC 190G #8', 3, '9.20'),
(4, 2, 4, 'ALCOHOL ETILICO LOURDES 24/500ML', 2, '9.50'),
(5, 2, 5, 'ALCOHOL ETILICO LOURDES 36/250ML', 2, '6.00'),
(6, 3, 6, 'ALIMENTO PERRO ADULTO PEDIGREE 375G', 3, '11.00'),
(7, 4, 7, 'PAPEL ALUMINIO ALUPAK 24/7.5M', 2, '8.50'),
(8, 4, 8, 'PAPEL ALUMINIO REYNOLDS WRAP 7.6M', 2, '16.00'),
(9, 5, 9, 'PELICULA AUTOADHERENTE KLEEN 30 MTS', 3, '18.50'),
(10, 5, 10, 'PELICULA PLASTICA REYNOLDS  30.4M', 2, '21.50'),
(11, 5, 11, 'AROMATIZANTE GLADE LAVANDA12/400ML', 2, '24.80'),
(12, 5, 12, 'AROMATIZANTE GLADE HAWAIIAN 400ML', 2, '25.80'),
(13, 5, 13, 'AROMATIZANTE GLADE MANZANA', 1, '29.00'),
(14, 6, 14, 'AROMATIZANTE GLADE NEUTRALIZER 400ML', 2, '24.80'),
(15, 6, 15, 'AZUCAR IMPERIAL OBSCURA 24/454G', 3, '15.50'),
(16, 7, 16, 'BARRA BRAN-FRUT CHOCO/FRESA 40gr', 2, '3.50'),
(17, 7, 17, 'BARRA BRAN-FRUT CITRUS BIMBO 40gr', 1, '3.50'),
(18, 7, 18, 'BARRA BRAN-FRUT FRESA BIMBO 40gr', 3, '3.50'),
(19, 8, 19, 'BARRA BRAN-FRUT MANZ/CAN 40gr', 1, '3.50'),
(20, 9, 20, 'BARRA DOBLE FIBRA BIMBO 32gr', 1, '4.00'),
(21, 10, 21, 'BARRA MULTIGRANO AVENA BIMBO 32gr', 2, '4.00'),
(22, 10, 22, 'BARRA MULTIGRANO LINAZA BIMBO 42gr', 2, '4.00'),
(23, 11, 23, 'BARRA MULTIGRANO NUEZ 34gr', 3, '4.00'),
(24, 11, 24, 'BARRA PLUSVITA FRESA BIMBO  22gr', 3, '3.50'),
(25, 11, 25, 'AGUA BONAFONT 12/1.5L', 1, '7.50'),
(26, 12, 26, 'AGUA BONAFONT 12/1L', 2, '6.00'),
(27, 13, 27, 'AGUA CIEL 6/1.5L LIMON', 3, '11.00'),
(28, 14, 28, 'AGUA CIEL JAMAICA 6/1.5L', 2, '11.00'),
(29, 14, 29, 'AGUA CIEL MANDARINA 6/600ML', 3, '7.00'),
(30, 15, 30, 'BEBIDA CRISTALIN MANDARINA 500ML', 1, '6.00'),
(31, 15, 31, 'BEBIDA CRISTALIN SABOR FRUTAS 500ML', 2, '6.00'),
(32, 15, 32, 'BEBIDA GATORADE LIMA LIMON 355ML', 3, '8.00'),
(33, 16, 33, 'BEBIDA GATORADE LIMONADA 24/521ML', 2, '13.00'),
(34, 17, 34, 'BEBIDA GATORADE MANDARINA 24/500ML', 1, '11.00'),
(35, 17, 35, 'BEBIDA GATORADE NARANJA 24/355ML', 1, '8.00'),
(36, 18, 36, 'BEBIDA GATORADE TUTTI FRUTI 236ML', 3, '5.50'),
(37, 19, 37, 'BEBIDA GATORADE UVA 24/355ML', 2, '8.00'),
(38, 19, 38, 'BEBIDA RED BULL ENERGETICA 250ML', 3, '20.00'),
(39, 20, 39, 'BEBIDA VITALINEA LIMA LIMON 12/1L', 2, '10.00'),
(40, 20, 40, 'BEBIDA VITALINEA SABOR MANZANA 1L', 2, '10.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `existencia` int(11) NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `codigo`, `nombre`, `precio`, `existencia`, `activo`) VALUES
(1, '7501039120149', 'ACEITE VEGETAL NUTRIOLI 12/946ML', '28.00', 17, 1),
(2, '7501052472102', 'CATSUP CLEMENTE JAQUES 24/350G', '7.50', 20, 1),
(3, '7501003340122', 'MAYONESA MCCORMIC 190G #8', '9.20', 12, 1),
(4, '7503000720129', 'ALCOHOL ETILICO LOURDES 24/500ML', '9.50', 25, 1),
(5, '7503000720105', 'ALCOHOL ETILICO LOURDES 36/250ML', '6.00', 5, 1),
(6, '706460235982', 'ALIMENTO PERRO ADULTO PEDIGREE 375G', '11.00', 16, 1),
(7, '7501067280143', 'PAPEL ALUMINIO ALUPAK 24/7.5M', '8.50', 6, 1),
(8, '10900000406', 'PAPEL ALUMINIO REYNOLDS WRAP 7.6M', '16.00', 27, 1),
(9, '7501017361236', 'PELICULA AUTOADHERENTE KLEEN 30 MTS', '18.50', 27, 1),
(10, '10900002844', 'PELICULA PLASTICA REYNOLDS  30.4M', '21.50', 20, 1),
(11, '7501032938215', 'AROMATIZANTE GLADE LAVANDA12/400ML', '24.80', 22, 1),
(12, '46500005602', 'AROMATIZANTE GLADE HAWAIIAN 400ML', '25.80', 5, 1),
(13, '7501032900243', 'AROMATIZANTE GLADE MANZANA', '29.00', 26, 1),
(14, '46500005657', 'AROMATIZANTE GLADE NEUTRALIZER 400ML', '24.80', 10, 1),
(15, '7501040492037', 'AZUCAR IMPERIAL OBSCURA 24/454G', '15.50', 30, 1),
(16, '7501030448136', 'BARRA BRAN-FRUT CHOCO/FRESA 40gr', '3.50', 29, 1),
(17, '7501030476139', 'BARRA BRAN-FRUT CITRUS BIMBO 40gr', '3.50', 11, 1),
(18, '7501000116447', 'BARRA BRAN-FRUT FRESA BIMBO 40gr', '3.50', 17, 1),
(19, '7501000109340', 'BARRA BRAN-FRUT MANZ/CAN 40gr', '3.50', 13, 1),
(20, '7501000326570', 'BARRA DOBLE FIBRA BIMBO 32gr', '4.00', 30, 1),
(21, '7501030473060', 'BARRA MULTIGRANO AVENA BIMBO 32gr', '4.00', 23, 1),
(22, '7501000339198', 'BARRA MULTIGRANO LINAZA BIMBO 42gr', '4.00', 19, 1),
(23, '7501030424345', 'BARRA MULTIGRANO NUEZ 34gr', '4.00', 17, 1),
(24, '7501030452188', 'BARRA PLUSVITA FRESA BIMBO  22gr', '3.50', 12, 1),
(25, '758104000159', 'AGUA BONAFONT 12/1.5L', '7.50', 12, 1),
(26, '758104100422', 'AGUA BONAFONT 12/1L', '6.00', 11, 1),
(27, '7501055313815', 'AGUA CIEL 6/1.5L LIMON', '11.00', 16, 1),
(28, '7501055313822', 'AGUA CIEL JAMAICA 6/1.5L', '11.00', 8, 1),
(29, '7501055319046', 'AGUA CIEL MANDARINA 6/600ML', '7.00', 21, 1),
(30, '7501621102287', 'BEBIDA CRISTALIN MANDARINA 500ML', '6.00', 25, 1),
(31, '7501621102171', 'BEBIDA CRISTALIN SABOR FRUTAS 500ML', '6.00', 9, 1),
(32, '36731183002', 'BEBIDA GATORADE LIMA LIMON 355ML', '8.00', 7, 1),
(33, '36731320520', 'BEBIDA GATORADE LIMONADA 24/521ML', '13.00', 10, 1),
(34, '36731505002', 'BEBIDA GATORADE MANDARINA 24/500ML', '11.00', 19, 1),
(35, '36731181008', 'BEBIDA GATORADE NARANJA 24/355ML', '8.00', 11, 1),
(36, '36731100061', 'BEBIDA GATORADE TUTTI FRUTI 236ML', '5.50', 15, 1),
(37, '36731184009', 'BEBIDA GATORADE UVA 24/355ML', '8.00', 23, 1),
(38, '9002490100070', 'BEBIDA RED BULL ENERGETICA 250ML', '20.00', 17, 1),
(39, '758104001248', 'BEBIDA VITALINEA LIMA LIMON 12/1L', '10.00', 12, 1),
(40, '758104001255', 'BEBIDA VITALINEA SABOR MANZANA 1L', '10.00', 15, 1),
(41, '36731322005', 'GATORADE 12/1L  LIMONADA', '18.00', 11, 1),
(42, '36731323002', 'GATORADE 12/1L LIMA LIMON', '18.00', 9, 1),
(43, '36731325006', 'GATORADE 12/1L MANDARINA', '18.00', 9, 1),
(44, '36731326003', 'GATORADE 12/1L PONCHE DE FRUTAS', '18.00', 26, 1),
(45, '36731202000', 'GATORADE CHUPON  24/591 LIMA LIMON', '13.00', 15, 1),
(46, '36731320537', 'GATORADE CHUPON NARANJA 24/591', '13.00', 15, 1),
(47, '36731132512', 'GATORADE FIERCE BLUEGATOR 24/591', '13.00', 23, 1),
(48, '36731502001', 'GATORADE TAPA 24/500ML LIMONADA', '11.00', 10, 1),
(49, '36731501004', 'GATORADE TAPA 24/500ML NARANJA', '11.00', 17, 1),
(50, '36731506009', 'GATORADE 500ML PONCHE DE FRUTAS', '11.00', 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `folio` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `id_usuario` smallint(6) NOT NULL,
  `activo` tinyint(4) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `folio`, `total`, `id_usuario`, `activo`, `fecha`) VALUES
(1, '00001', '63.10', 1, 1, '2023-10-01 10:00:00'),
(2, '00002', '31.00', 1, 1, '2023-10-01 10:00:00'),
(3, '00003', '33.00', 1, 1, '2023-10-01 10:00:00'),
(4, '00004', '49.00', 1, 1, '2023-10-01 10:00:00'),
(5, '00005', '228.70', 1, 1, '2023-10-01 10:00:00'),
(6, '00006', '96.10', 1, 1, '2023-10-01 10:00:00'),
(7, '00007', '21.00', 1, 1, '2023-10-01 10:00:00'),
(8, '00008', '3.50', 1, 1, '2023-10-01 10:00:00'),
(9, '00009', '4.00', 1, 1, '2023-10-01 10:00:00'),
(10, '00010', '16.00', 1, 1, '2023-10-01 10:00:00'),
(11, '00011', '30.00', 1, 1, '2023-10-01 10:00:00'),
(12, '00012', '12.00', 1, 1, '2023-10-01 10:00:00'),
(13, '00013', '33.00', 1, 1, '2023-10-01 10:00:00'),
(14, '00014', '43.00', 1, 1, '2023-10-01 10:00:00'),
(15, '00015', '42.00', 1, 1, '2023-10-01 10:00:00'),
(16, '00016', '26.00', 1, 1, '2023-10-01 10:00:00'),
(17, '00017', '19.00', 1, 1, '2023-10-01 10:00:00'),
(18, '00018', '16.50', 1, 1, '2023-10-01 10:00:00'),
(19, '00019', '76.00', 1, 1, '2023-10-01 10:00:00'),
(20, '00020', '40.00', 1, 1, '2023-10-01 10:00:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detalle_venta` (`id_venta`),
  ADD KEY `fk_detalle_producto` (`id_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `fk_detalle_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `fk_detalle_venta` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;