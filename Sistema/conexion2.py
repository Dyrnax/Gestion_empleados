import mysql.connector
from mysql.connector import Error
class Conexion_DB():
    
    def conexionbasededatos():
        try:
            conexion = mysql.connector.connect(
                user='root',
                host='localhost',
                database='gestion_empleados',
                password='',
                port ='3306'

                                               )
            print("Conexion Correcta")

            return conexion
        
        except mysql.connector.Error as error:
            print("Error al conectarse a la base de datos{}".format(error))

            return conexion
        
    conexionbasededatos()
