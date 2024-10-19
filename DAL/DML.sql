
-- Inserciones para la tabla asignaciones_departamentos
INSERT INTO asignaciones_departamentos (ID_ASIGNACION_DEPTO, ID_EMPLEADO, ID_DEPARTAMENTO) 
VALUES 
(1, 101, 201),
(2, 102, 202),
(3, 103, 203);

-- Inserciones para la tabla asignaciones_proyectos
INSERT INTO asignaciones_proyectos (ID_ASIGNACION_PRO, ID_EMPLEADO, ID_PROYECTO) 
VALUES 
(1, 101, 301),
(2, 102, 302),
(3, 103, 303);

-- Inserciones para la tabla cargos_empleados
INSERT INTO cargos_empleados (ID_CARGO, CARGO, DESCRIPCION) 
VALUES 
(1, 'Gerente', 'Responsable de la supervisión general'),
(2, 'Analista', 'Realiza análisis y reportes'),
(3, 'Desarrollador', 'Encargado del desarrollo de software');

-- Inserciones para la tabla departamentos
INSERT INTO departamentos (ID_DEPARTAMENTO, TELEFONO, NOMBRE_DEPARTAMENTO, ID_EMPLEADO) 
VALUES 
(201, '123-456-7890', 'Recursos Humanos', 101),
(202, '098-765-4321', 'Tecnología', 102),
(203, '555-555-5555', 'Marketing', 103);

-- Inserciones para la tabla empleados
INSERT INTO empleados (ID_EMPLEADO, NOMBRE_EMPLEADO, ID_ROL, IDCARGO, DIRECCION, NUMERO_DE_TELEFONO, CORREO, FECHA_INICIO_CONTRATO, SALARIO, RUT, FECHA_NACIMIENTO, CONTRASENA) 
VALUES 
(101, 'Juan Pérez', 1, 1, 'Av. Principal 123', '987-654-3210', 'juan.perez@empresa.com', '2020-01-15', 50000, '12.345.678-9', '1985-06-15', 'password123'),
(102, 'María García', 2, 2, 'Calle Secundaria 456', '987-123-4567', 'maria.garcia@empresa.com', '2019-03-10', 45000, '98.765.432-1', '1990-11-25', 'password456'),
(103, 'Carlos López', 3, 3, 'Av. Tercera 789', '987-789-1234', 'carlos.lopez@empresa.com', '2021-07-20', 55000, '23.456.789-0', '1988-09-30', 'password789');

-- Inserciones para la tabla generacion_informes
INSERT INTO generacion_informes (ID_INFORME, ID_PROYECTO, ID_EMPLEADO, ID_DEPARTAMENTO, NOMBRE, FECHA_CREACION, DESCRIPCION, UBICACION) 
VALUES 
(1, 301, 101, 201, 'Informe de Recursos Humanos', '2024-09-01', 'Informe sobre el desempeño de empleados', '/informes/rrhh.pdf'),
(2, 302, 102, 202, 'Reporte de Desarrollo', '2024-10-01', 'Informe sobre avances en el proyecto de software', '/informes/desarrollo.pdf'),
(3, 303, 103, 203, 'Análisis de Marketing', '2024-08-15', 'Estudio del impacto de la última campaña', '/informes/marketing.pdf');

-- Inserciones para la tabla modulos
INSERT INTO modulos (CODIGO, NOMBRE) 
VALUES 
('MOD001', 'Gestión de Empleados'),
('MOD002', 'Gestión de Proyectos'),
('MOD003', 'Generación de Informes');

-- Inserciones para la tabla proyectos
INSERT INTO proyectos (ID_PROYECTO, NOMBRE_PROYECTO, DESCRIPCION, FEHCA_INICIO, FECHA_FIN) 
VALUES 
(301, 'Implementación de ERP', 'Proyecto para implementar sistema ERP', '2024-01-01', '2024-12-31'),
(302, 'Desarrollo de Aplicación Web', 'Creación de una plataforma web interna', '2024-03-01', '2024-11-30'),
(303, 'Campaña de Marketing Digital', 'Lanzamiento de una nueva campaña publicitaria', '2024-02-15', '2024-10-15');

-- Inserciones para la tabla registros_tiempo
INSERT INTO registros_tiempo (ID_ASOCIACION_PRO, ID_REGISTRO, FECHA_CREACION, HORAS_TRABAJADAS, TAREAS, OBSERVACION) 
VALUES 
(1, 1, '2024-09-20', 8, 'Revisión de avances', 'Sin observaciones'),
(2, 2, '2024-09-21', 7, 'Desarrollo del backend', 'Se encontraron errores menores'),
(3, 3, '2024-09-22', 9, 'Análisis de resultados', 'Análisis completado correctamente');

-- Inserciones para la tabla roles
INSERT INTO roles (ID_ROL, NOMBRE, PERMISOS) 
VALUES 
(1, 'Administrador', 'MOD001,MOD002,MOD003'),
(2, 'Gerente', 'MOD002,MOD003'),
(3, 'Empleado', 'MOD003');
