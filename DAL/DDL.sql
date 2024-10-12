-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-10-2024 a las 18:23:09
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestion_empleados`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesos`
--

CREATE TABLE `accesos` (
  `ID_ACCESO` int(11) NOT NULL,
  `CODIGO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion_departamentos`
--

CREATE TABLE `asignacion_departamentos` (
  `ID_ASIGNACION` int(11) NOT NULL,
  `ID_EMPLEADO` int(11) DEFAULT NULL,
  `ID_DEPARTAMENTO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion_proyectos`
--

CREATE TABLE `asignacion_proyectos` (
  `ID_ASOCIACION` int(11) NOT NULL,
  `ID_EMPLEADO` int(11) DEFAULT NULL,
  `ID_PROYECTO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos_empleados`
--

CREATE TABLE `cargos_empleados` (
  `ID_CARGO` int(11) NOT NULL,
  `CARGO` varchar(255) DEFAULT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `ID_DEPARTAMENTO` int(11) NOT NULL,
  `TELEFONO` varchar(255) DEFAULT NULL,
  `NOMBRE_DEPARTAMENTO` varchar(255) DEFAULT NULL,
  `GERENTE_ASOCIADO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `ID_EMPLEADO` int(11) NOT NULL,
  `NOMBRE_EMPLEADO` varchar(255) DEFAULT NULL,
  `ID_ROLES` int(11) DEFAULT NULL,
  `IDCARGO` int(11) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `NUMERO_DE_TELEFONO` varchar(255) DEFAULT NULL,
  `CORREO` varchar(255) DEFAULT NULL,
  `FECHA_INICIO_CONTRATO` date DEFAULT NULL,
  `SALARIO` int(11) DEFAULT NULL,
  `RUT` varchar(255) DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `CONTRASEÑA` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generacion_informes`
--

CREATE TABLE `generacion_informes` (
  `ID_EMPELADO` int(11) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `FEHCA_CREACION` date DEFAULT NULL,
  `UBICACION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `CODIGO` int(11) NOT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `ID_PROYECTO` int(11) NOT NULL,
  `NOMBRE_PROYECTO` varchar(255) DEFAULT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `FEHCA_INICIO` date DEFAULT NULL,
  `FECHA_FIN` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_tiempo`
--

CREATE TABLE `registro_tiempo` (
  `ID_ASOCIACION` int(11) DEFAULT NULL,
  `ID_REGISTRO` int(11) NOT NULL,
  `FECHA` date DEFAULT NULL,
  `HORAS_TRABAJADAS` int(11) DEFAULT NULL,
  `TAREAS` varchar(255) DEFAULT NULL,
  `OBSERVACION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `ID_ROLES` int(11) NOT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `PERMISOS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD PRIMARY KEY (`ID_ACCESO`),
  ADD KEY `CODIGO` (`CODIGO`);

--
-- Indices de la tabla `asignacion_departamentos`
--
ALTER TABLE `asignacion_departamentos`
  ADD PRIMARY KEY (`ID_ASIGNACION`),
  ADD KEY `ID_EMPLEADO` (`ID_EMPLEADO`),
  ADD KEY `ID_DEPARTAMENTO` (`ID_DEPARTAMENTO`);

--
-- Indices de la tabla `asignacion_proyectos`
--
ALTER TABLE `asignacion_proyectos`
  ADD PRIMARY KEY (`ID_ASOCIACION`),
  ADD KEY `ID_PROYECTO` (`ID_PROYECTO`),
  ADD KEY `ID_EMPLEADO` (`ID_EMPLEADO`);

--
-- Indices de la tabla `cargos_empleados`
--
ALTER TABLE `cargos_empleados`
  ADD PRIMARY KEY (`ID_CARGO`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`ID_DEPARTAMENTO`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`ID_EMPLEADO`),
  ADD KEY `ID_ROLES` (`ID_ROLES`),
  ADD KEY `IDCARGO` (`IDCARGO`);

--
-- Indices de la tabla `generacion_informes`
--
ALTER TABLE `generacion_informes`
  ADD KEY `ID_EMPELADO` (`ID_EMPELADO`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`CODIGO`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`ID_PROYECTO`);

--
-- Indices de la tabla `registro_tiempo`
--
ALTER TABLE `registro_tiempo`
  ADD PRIMARY KEY (`ID_REGISTRO`),
  ADD KEY `ID_ASOCIACION` (`ID_ASOCIACION`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`ID_ROLES`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD CONSTRAINT `accesos_ibfk_1` FOREIGN KEY (`CODIGO`) REFERENCES `modulos` (`CODIGO`);

--
-- Filtros para la tabla `asignacion_departamentos`
--
ALTER TABLE `asignacion_departamentos`
  ADD CONSTRAINT `asignacion_departamentos_ibfk_1` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `empleados` (`ID_EMPLEADO`),
  ADD CONSTRAINT `asignacion_departamentos_ibfk_2` FOREIGN KEY (`ID_DEPARTAMENTO`) REFERENCES `departamentos` (`ID_DEPARTAMENTO`);

--
-- Filtros para la tabla `asignacion_proyectos`
--
ALTER TABLE `asignacion_proyectos`
  ADD CONSTRAINT `asignacion_proyectos_ibfk_1` FOREIGN KEY (`ID_PROYECTO`) REFERENCES `proyectos` (`ID_PROYECTO`),
  ADD CONSTRAINT `asignacion_proyectos_ibfk_2` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `empleados` (`ID_EMPLEADO`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`ID_ROLES`) REFERENCES `rol` (`ID_ROLES`),
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`IDCARGO`) REFERENCES `cargos_empleados` (`ID_CARGO`);

--
-- Filtros para la tabla `generacion_informes`
--
ALTER TABLE `generacion_informes`
  ADD CONSTRAINT `generacion_informes_ibfk_1` FOREIGN KEY (`ID_EMPELADO`) REFERENCES `empleados` (`ID_EMPLEADO`);

--
-- Filtros para la tabla `registro_tiempo`
--
ALTER TABLE `registro_tiempo`
  ADD CONSTRAINT `registro_tiempo_ibfk_1` FOREIGN KEY (`ID_ASOCIACION`) REFERENCES `asignacion_proyectos` (`ID_ASOCIACION`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
