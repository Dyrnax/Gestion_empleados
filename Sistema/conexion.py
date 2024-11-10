import mysql.connector
from mysql.connector import Error

try:
    conexion = mysql.connector.connect(
        user="root",
        password="",
        host="localhost",
        database="gestion_empleados",
        port=3306
    )

    if conexion.is_connected():
        print("Conexión exitosa a la base de datos")
        cursor = conexion.cursor()

        sql2="INSERT INTO modulos (CODIGO, NOMBRE)  VALUES (%s, %s)"
        valores2 =('MOD001', 'Gestión de Empleados')
        valores3 =('MOD002', 'Gestión de Proyectos')
        valores4 =('MOD003', 'Generación de Informes')

        sql3 = "INSERT INTO roles ( ID_ROL, NOMBRE, PERMISOS) VALUES (%s, %s, %s) "
        valores5=(1, 'Administrador', 'MOD001')
        valores6=(2, 'Gerente', 'MOD003')
        valores7=(3, 'Empleado', 'MOD003')

        sql4= "INSERT INTO cargos_empleados (ID_CARGO, CARGO, DESCRIPCION) VALUES (%s, %s, %s) "
        valores8=(1, 'Gerente', 'Responsable de la supervisión general')
        valores9= (2, 'Analista', 'Realiza análisis y reportes')
        valores10= (3, 'Desarrollador', 'Encargado del desarrollo de software')

        sql5="INSERT INTO empleados (ID_EMPLEADO, NOMBRE_EMPLEADO, ID_ROL, IDCARGO, DIRECCION, NUMERO_DE_TELEFONO, CORREO, FECHA_INICIO_CONTRATO, SALARIO, RUT, FECHA_NACIMIENTO, CONTRASENA) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"  
        valores11=(101, 'Juan Pérez', 1, 1, 'Av. Principal 123', '987-654-3210', 'juan.perez@empresa.com', '2020-01-15', 50000, '12.345.678-9', '1985-06-15', 'password123')
        valores12=(102, 'María García', 2, 2, 'Calle Secundaria 456', '987-123-4567', 'maria.garcia@empresa.com', '2019-03-10', 45000, '98.765.432-1', '1990-11-25', 'password456')
        valores13=(103, 'Carlos López', 3, 3, 'Av. Tercera 789', '987-789-1234', 'carlos.lopez@empresa.com', '2021-07-20', 55000, '23.456.789-0', '1988-09-30', 'password789')

        sql6="INSERT INTO proyectos (ID_PROYECTO, NOMBRE_PROYECTO, DESCRIPCION, FEHCA_INICIO, FECHA_FIN) VALUES (%s, %s, %s, %s, %s) "
        valores14=(301, 'Implementación de ERP', 'Proyecto para implementar sistema ERP', '2024-01-01', '2024-12-31')
        valores15=(302, 'Desarrollo de Aplicación Web', 'Creación de una plataforma web interna', '2024-03-01', '2024-11-30')
        valores16=(303, 'Campaña de Marketing Digital', 'Lanzamiento de una nueva campaña publicitaria', '2024-02-15', '2024-10-15')

        sql7="INSERT INTO departamentos (ID_DEPARTAMENTO, TELEFONO, NOMBRE_DEPARTAMENTO, ID_EMPLEADO) VALUES (%s,%s,%s,%s)"
        valores17=(201, '123-456-7890', 'Recursos Humanos', 101)
        valores18=(202, '098-765-4321', 'Tecnología', 102)
        valores19=(203, '555-555-5555', 'Marketing', 103)

        sql8="INSERT INTO asignaciones_departamentos (ID_ASIGNACION_DEPTO, ID_EMPLEADO, ID_DEPARTAMENTO) VALUES (%s,%s,%s)"
        valores20=(1, 101, 201)
        valores21=(2, 102, 202)
        valores22=(3, 103, 203)
        
        sql9="INSERT INTO asignaciones_proyectos (ID_ASIGNACION_PRO, ID_EMPLEADO, ID_PROYECTO) VALUES (%s,%s,%s)"
        valores23=(1, 101, 301)
        valores24=(2, 102, 302)
        valores25=(3, 103, 303)
        

        sql10="INSERT INTO generacion_informes (ID_INFORME, ID_PROYECTO, ID_EMPLEADO, ID_DEPARTAMENTO, NOMBRE, FECHA_CREACION, DESCRIPCION, UBICACION) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)"
        valores26=(1, 301, 101, 201, 'Informe de Recursos Humanos', '2024-09-01', 'Informe sobre el desempeño de empleados', '/informes/rrhh.pdf')
        valores27=(2, 302, 102, 202, 'Reporte de Desarrollo', '2024-10-01', 'Informe sobre avances en el proyecto de software', '/informes/desarrollo.pdf')
        valores28=(3, 303, 103, 203, 'Análisis de Marketing', '2024-08-15', 'Estudio del impacto de la última campaña', '/informes/marketing.pdf')

        sql11="INSERT INTO registros_tiempo (ID_ASOCIACION_PRO, ID_REGISTRO, FECHA_CREACION, HORAS_TRABAJADAS, TAREAS, OBSERVACION) VALUES (%s, %s, %s, %s, %s, %s)"
        valores29=(2, 3, '2024-09-20', 8, 'Revisión de avances', 'Sin observaciones')
        valores30=(3, 2, '2024-09-21', 7, 'Desarrollo del backend', 'Se encontraron errores menores')
        valores31=(1, 1, '2024-09-22', 9, 'Análisis de resultados', 'Análisis completado correctamente')
        ##conexion.commit()  # Confirma los cambios
        print("Datos insertados correctamente") 
except Error as e:
    print(f"Error al conectar a MySQL: {e}")


finally:
    if conexion.is_connected():
        cursor.close()
        conexion.close()
        print("Conexión cerrada")