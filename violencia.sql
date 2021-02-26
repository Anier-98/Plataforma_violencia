-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-02-2021 a las 19:24:01
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
-- Estructura de tabla para la tabla `accesos_plat`
--

CREATE TABLE `accesos_plat` (
  `Id` int(11) NOT NULL,
  `N_carnet` varchar(25) DEFAULT NULL,
  `resultado` varchar(40) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `Id_Area` varchar(10) NOT NULL,
  `Des_Area` varchar(40) DEFAULT NULL,
  `Rec_Perteneciente` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denuncias`
--

CREATE TABLE `denuncias` (
  `Id_D` int(11) NOT NULL,
  `N_carnet` varchar(25) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Descripcion` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recinto`
--

CREATE TABLE `recinto` (
  `ID_RECINTO` varchar(30) NOT NULL,
  `DESCRIPCION` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_usuarios`
--

CREATE TABLE `roles_usuarios` (
  `ID_Rol` smallint(6) NOT NULL,
  `Descripcion` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `N_carnet` varchar(25) NOT NULL,
  `Nombre` varchar(40) DEFAULT NULL,
  `Apellido` varchar(40) DEFAULT NULL,
  `Id_Area` varchar(10) DEFAULT NULL,
  `contrasena` varchar(25) DEFAULT NULL,
  `Tipo_Usuario` smallint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accesos_plat`
--
ALTER TABLE `accesos_plat`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_VISITAS_USUARIO` (`N_carnet`);

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`Id_Area`),
  ADD KEY `FK_AREA_RECINTO` (`Rec_Perteneciente`);

--
-- Indices de la tabla `denuncias`
--
ALTER TABLE `denuncias`
  ADD PRIMARY KEY (`Id_D`),
  ADD KEY `FK_DENUNCIAS_USUARIOS` (`N_carnet`);

--
-- Indices de la tabla `recinto`
--
ALTER TABLE `recinto`
  ADD PRIMARY KEY (`ID_RECINTO`);

--
-- Indices de la tabla `roles_usuarios`
--
ALTER TABLE `roles_usuarios`
  ADD PRIMARY KEY (`ID_Rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`N_carnet`),
  ADD KEY `FK_AREA_USUARIO` (`Id_Area`),
  ADD KEY `FK_USUARIO_ROL` (`Tipo_Usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accesos_plat`
--
ALTER TABLE `accesos_plat`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `denuncias`
--
ALTER TABLE `denuncias`
  MODIFY `Id_D` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accesos_plat`
--
ALTER TABLE `accesos_plat`
  ADD CONSTRAINT `FK_VISITAS_USUARIO` FOREIGN KEY (`N_carnet`) REFERENCES `usuarios` (`N_carnet`);

--
-- Filtros para la tabla `area`
--
ALTER TABLE `area`
  ADD CONSTRAINT `FK_AREA_RECINTO` FOREIGN KEY (`Rec_Perteneciente`) REFERENCES `recinto` (`ID_RECINTO`);

--
-- Filtros para la tabla `denuncias`
--
ALTER TABLE `denuncias`
  ADD CONSTRAINT `FK_DENUNCIAS_USUARIOS` FOREIGN KEY (`N_carnet`) REFERENCES `usuarios` (`N_carnet`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `FK_AREA_USUARIO` FOREIGN KEY (`Id_Area`) REFERENCES `area` (`Id_Area`),
  ADD CONSTRAINT `FK_USUARIO_ROL` FOREIGN KEY (`Tipo_Usuario`) REFERENCES `roles_usuarios` (`ID_Rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
