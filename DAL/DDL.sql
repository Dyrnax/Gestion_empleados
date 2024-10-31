-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-10-2024 a las 17:24:40
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
-- Estructura de tabla para la tabla `asignaciones_departamentos`
--

CREATE TABLE `asignaciones_departamentos` (
  `ID_ASIGNACION_DEPTO` int(11) NOT NULL,
  `ID_EMPLEADO` int(11) DEFAULT NULL,
  `ID_DEPARTAMENTO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaciones_proyectos`
--

CREATE TABLE `asignaciones_proyectos` (
  `ID_ASIGNACION_PRO` int(11) NOT NULL,
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
  `ID_EMPLEADO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `ID_EMPLEADO` int(11) NOT NULL,
  `NOMBRE_EMPLEADO` varchar(255) DEFAULT NULL,
  `ID_ROL` int(11) DEFAULT NULL,
  `IDCARGO` int(11) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `NUMERO_DE_TELEFONO` varchar(255) DEFAULT NULL,
  `CORREO` varchar(255) DEFAULT NULL,
  `FECHA_INICIO_CONTRATO` date DEFAULT NULL,
  `SALARIO` int(11) DEFAULT NULL,
  `RUT` varchar(255) DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `CONTRASENA` varchar(255) DEFAULT NULL,
  `HABILITADO` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generacion_informes`
--

CREATE TABLE `generacion_informes` (
  `ID_INFORME` int(11) NOT NULL,
  `ID_PROYECTO` int(11) DEFAULT NULL,
  `ID_EMPLEADO` int(11) DEFAULT NULL,
  `ID_DEPARTAMENTO` int(11) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `UBICACION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `CODIGO` varchar(255) NOT NULL,
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
-- Estructura de tabla para la tabla `registros_tiempo`
--

CREATE TABLE `registros_tiempo` (
  `ID_ASOCIACION_PRO` int(11) DEFAULT NULL,
  `ID_REGISTRO` int(11) NOT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `HORAS_TRABAJADAS` int(11) DEFAULT NULL,
  `TAREAS` varchar(255) DEFAULT NULL,
  `OBSERVACION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `ID_ROL` int(11) NOT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `PERMISOS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignaciones_departamentos`
--
ALTER TABLE `asignaciones_departamentos`
  ADD PRIMARY KEY (`ID_ASIGNACION_DEPTO`),
  ADD KEY `ID_EMPLEADO` (`ID_EMPLEADO`),
  ADD KEY `ID_DEPARTAMENTO` (`ID_DEPARTAMENTO`);

--
-- Indices de la tabla `asignaciones_proyectos`
--
ALTER TABLE `asignaciones_proyectos`
  ADD PRIMARY KEY (`ID_ASIGNACION_PRO`),
  ADD KEY `ID_EMPLEADO` (`ID_EMPLEADO`),
  ADD KEY `ID_PROYECTO` (`ID_PROYECTO`);

--
-- Indices de la tabla `cargos_empleados`
--
ALTER TABLE `cargos_empleados`
  ADD PRIMARY KEY (`ID_CARGO`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`ID_DEPARTAMENTO`),
  ADD KEY `ID_EMPLEADO` (`ID_EMPLEADO`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`ID_EMPLEADO`),
  ADD KEY `IDCARGO` (`IDCARGO`),
  ADD KEY `ID_ROL` (`ID_ROL`);

--
-- Indices de la tabla `generacion_informes`
--
ALTER TABLE `generacion_informes`
  ADD PRIMARY KEY (`ID_INFORME`),
  ADD KEY `ID_EMPLEADO` (`ID_EMPLEADO`),
  ADD KEY `ID_PROYECTO` (`ID_PROYECTO`),
  ADD KEY `ID_DEPARTAMENTO` (`ID_DEPARTAMENTO`);

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
-- Indices de la tabla `registros_tiempo`
--
ALTER TABLE `registros_tiempo`
  ADD PRIMARY KEY (`ID_REGISTRO`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID_ROL`),
  ADD KEY `PERMISOS` (`PERMISOS`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignaciones_departamentos`
--
ALTER TABLE `asignaciones_departamentos`
  ADD CONSTRAINT `asignaciones_departamentos_ibfk_1` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `empleados` (`ID_EMPLEADO`),
  ADD CONSTRAINT `asignaciones_departamentos_ibfk_2` FOREIGN KEY (`ID_DEPARTAMENTO`) REFERENCES `departamentos` (`ID_DEPARTAMENTO`);

--
-- Filtros para la tabla `asignaciones_proyectos`
--
ALTER TABLE `asignaciones_proyectos`
  ADD CONSTRAINT `asignaciones_proyectos_ibfk_1` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `empleados` (`ID_EMPLEADO`),
  ADD CONSTRAINT `asignaciones_proyectos_ibfk_2` FOREIGN KEY (`ID_PROYECTO`) REFERENCES `proyectos` (`ID_PROYECTO`);

--
-- Filtros para la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD CONSTRAINT `departamentos_ibfk_1` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `empleados` (`ID_EMPLEADO`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`IDCARGO`) REFERENCES `cargos_empleados` (`ID_CARGO`),
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`ID_ROL`) REFERENCES `roles` (`ID_ROL`);

--
-- Filtros para la tabla `generacion_informes`
--
ALTER TABLE `generacion_informes`
  ADD CONSTRAINT `generacion_informes_ibfk_1` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `empleados` (`ID_EMPLEADO`),
  ADD CONSTRAINT `generacion_informes_ibfk_2` FOREIGN KEY (`ID_PROYECTO`) REFERENCES `proyectos` (`ID_PROYECTO`),
  ADD CONSTRAINT `generacion_informes_ibfk_3` FOREIGN KEY (`ID_DEPARTAMENTO`) REFERENCES `departamentos` (`ID_DEPARTAMENTO`);

--
-- Filtros para la tabla `registros_tiempo`
--
ALTER TABLE `registros_tiempo`
  ADD CONSTRAINT `registros_tiempo_ibfk_1` FOREIGN KEY (`ID_REGISTRO`) REFERENCES `asignaciones_proyectos` (`ID_ASIGNACION_PRO`);

--
-- Filtros para la tabla `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`PERMISOS`) REFERENCES `modulos` (`CODIGO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
