
import re 
from cargo_empleados import CargoEmpleados
from Rol import rol
import bcrypt


class Empleados(CargoEmpleados,rol):
    def __init__(self, id_empleado, nombre_empleado, id_cargo, direccion, numero_de_telefono, correo, fecha_de_inicio_de_contrato, salario, rut, fecha_nacimiento,id_rol,contrasena):
        self.id_empleado = id_empleado
        self.nombre_empleado = nombre_empleado
        CargoEmpleados().__init__(id_cargo)
        rol().__init__(id_rol)
        self.direccion = direccion
        self.numero_de_telefono = numero_de_telefono
        self.correo = correo
        self.fecha_de_inicio_de_contrato = fecha_de_inicio_de_contrato
        self.salario = salario
        self.rut = rut
        self.fecha_nacimiento = fecha_nacimiento
        self.contrasena= contrasena
        
    def validar_correo(self):
        pat_correo= r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$'
        if (re.match(pat_correo,self.correo)):
            return True 
        else:
            return False
        
    def validar_telefono(self):
        pat_telefono= r'^\+?[\d\s\-]{7,15}$'
        if re.match(pat_telefono,self.numero_de_empleado):
            return  True 
        else:
            return False
        
    def encriptar_contrasena(self, contrasena):
        salt = bcrypt.gensalt() 
        hashed_contrasena = bcrypt.hashpw(contrasena.encode('utf-8'), salt)
        return hashed_contrasena

    
    def desencriptar_contrasena(self, contrasena):
        return bcrypt.checkpw(contrasena.encode('utf-8'), self.contrasena)
