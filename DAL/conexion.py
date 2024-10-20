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
        cursor.execute("SELECT * FROM empleados")
    
except Error as e:
    print(f"Error al conectar a MySQL: {e}")
    
