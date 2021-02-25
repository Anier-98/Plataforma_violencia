-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-02-2021 a las 20:41:37
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `violencia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `Id_Area` varchar(10) NOT NULL,
  `Des_Area` varchar(40) DEFAULT NULL,
  `Recinto` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`Id_Area`, `Des_Area`, `Recinto`) VALUES
('CTYMA01', 'Ciencias,Tecnologia Y Medio Ambiente', 'Las Minas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denuncias`
--

CREATE TABLE `denuncias` (
  `Id_D` int(11) NOT NULL,
  `N_cedula` varchar(25) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `descripcion` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `N_cedula` varchar(25) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `Apellido` varchar(25) DEFAULT NULL,
  `Id_Area` varchar(10) DEFAULT NULL,
  `Correro_Ins` varchar(30) DEFAULT NULL,
  `contrasena` varchar(15) DEFAULT NULL,
  `Tipo_Usuario` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitas_plat`
--

CREATE TABLE `visitas_plat` (
  `Id` int(11) NOT NULL,
  `N_cedula` varchar(25) DEFAULT NULL,
  `resultado` varchar(40) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`Id_Area`);

--
-- Indices de la tabla `denuncias`
--
ALTER TABLE `denuncias`
  ADD PRIMARY KEY (`Id_D`),
  ADD KEY `FK_DENUNCIAS_USUARIOS` (`N_cedula`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`N_cedula`),
  ADD UNIQUE KEY `contrasena` (`contrasena`),
  ADD KEY `FK_AREA_USUARIO` (`Id_Area`);

--
-- Indices de la tabla `visitas_plat`
--
ALTER TABLE `visitas_plat`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_VISITAS_USUARIO` (`N_cedula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `denuncias`
--
ALTER TABLE `denuncias`
  MODIFY `Id_D` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `visitas_plat`
--
ALTER TABLE `visitas_plat`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `denuncias`
--
ALTER TABLE `denuncias`
  ADD CONSTRAINT `FK_DENUNCIAS_USUARIOS` FOREIGN KEY (`N_cedula`) REFERENCES `usuarios` (`N_cedula`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `FK_AREA_USUARIO` FOREIGN KEY (`Id_Area`) REFERENCES `area` (`Id_Area`);

--
-- Filtros para la tabla `visitas_plat`
--
ALTER TABLE `visitas_plat`
  ADD CONSTRAINT `FK_VISITAS_USUARIO` FOREIGN KEY (`N_cedula`) REFERENCES `usuarios` (`N_cedula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
