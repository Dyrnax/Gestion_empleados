-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-10-2024 a las 04:56:49
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

--
-- Volcado de datos para la tabla `asignaciones_departamentos`
--

INSERT INTO `asignaciones_departamentos` (`ID_ASIGNACION_DEPTO`, `ID_EMPLEADO`, `ID_DEPARTAMENTO`) VALUES
(1, 101, 201),
(2, 102, 202),
(3, 103, 203);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaciones_proyectos`
--

CREATE TABLE `asignaciones_proyectos` (
  `ID_ASIGNACION_PRO` int(11) NOT NULL,
  `ID_EMPLEADO` int(11) DEFAULT NULL,
  `ID_PROYECTO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asignaciones_proyectos`
--

INSERT INTO `asignaciones_proyectos` (`ID_ASIGNACION_PRO`, `ID_EMPLEADO`, `ID_PROYECTO`) VALUES
(1, 101, 301),
(2, 102, 302),
(3, 103, 303);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos_empleados`
--

CREATE TABLE `cargos_empleados` (
  `ID_CARGO` int(11) NOT NULL,
  `CARGO` varchar(255) DEFAULT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cargos_empleados`
--

INSERT INTO `cargos_empleados` (`ID_CARGO`, `CARGO`, `DESCRIPCION`) VALUES
(1, 'Gerente', 'Responsable de la supervisión general'),
(2, 'Analista', 'Realiza análisis y reportes'),
(3, 'Desarrollador', 'Encargado del desarrollo de software');

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

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`ID_DEPARTAMENTO`, `TELEFONO`, `NOMBRE_DEPARTAMENTO`, `ID_EMPLEADO`) VALUES
(201, '123-456-7890', 'Recursos Humanos', 101),
(202, '098-765-4321', 'Tecnología', 102),
(203, '555-555-5555', 'Marketing', 103);

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
  `CONTRASENA` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`ID_EMPLEADO`, `NOMBRE_EMPLEADO`, `ID_ROL`, `IDCARGO`, `DIRECCION`, `NUMERO_DE_TELEFONO`, `CORREO`, `FECHA_INICIO_CONTRATO`, `SALARIO`, `RUT`, `FECHA_NACIMIENTO`, `CONTRASENA`) VALUES
(101, 'Juan Pérez', 1, 1, 'Av. Principal 123', '987-654-3210', 'juan.perez@empresa.com', '2020-01-15', 50000, '12.345.678-9', '1985-06-15', 'password123'),
(102, 'María García', 2, 2, 'Calle Secundaria 456', '987-123-4567', 'maria.garcia@empresa.com', '2019-03-10', 45000, '98.765.432-1', '1990-11-25', 'password456'),
(103, 'Carlos López', 3, 3, 'Av. Tercera 789', '987-789-1234', 'carlos.lopez@empresa.com', '2021-07-20', 55000, '23.456.789-0', '1988-09-30', 'password789');

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

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`CODIGO`, `NOMBRE`) VALUES
('MOD001', 'Gestión de Empleados'),
('MOD002', 'Gestión de Proyectos'),
('MOD003', 'Generación de Informes');

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

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`ID_PROYECTO`, `NOMBRE_PROYECTO`, `DESCRIPCION`, `FEHCA_INICIO`, `FECHA_FIN`) VALUES
(301, 'Implementación de ERP', 'Proyecto para implementar sistema ERP', '2024-01-01', '2024-12-31'),
(302, 'Desarrollo de Aplicación Web', 'Creación de una plataforma web interna', '2024-03-01', '2024-11-30'),
(303, 'Campaña de Marketing Digital', 'Lanzamiento de una nueva campaña publicitaria', '2024-02-15', '2024-10-15');

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

--
-- Volcado de datos para la tabla `registros_tiempo`
--

INSERT INTO `registros_tiempo` (`ID_ASOCIACION_PRO`, `ID_REGISTRO`, `FECHA_CREACION`, `HORAS_TRABAJADAS`, `TAREAS`, `OBSERVACION`) VALUES
(1, 1, '2024-09-22', 9, 'Análisis de resultados', 'Análisis completado correctamente'),
(3, 2, '2024-09-21', 7, 'Desarrollo del backend', 'Se encontraron errores menores'),
(2, 3, '2024-09-20', 8, 'Revisión de avances', 'Sin observaciones');

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
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`ID_ROL`, `NOMBRE`, `PERMISOS`) VALUES
(1, 'Administrador', 'MOD001'),
(2, 'Gerente', 'MOD003'),
(3, 'Empleado', 'MOD003');

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
