
from rol import clas_rol
from cargo_empleados import clas_cargo_empleados
import re
import bcrypt


class clas_empleados(clas_rol,clas_cargo_empleados):
    def __init__(self,id_empleado=None ,nombre_empleado=None,id_roles=None,id_cargo=None,direccion=None,numero_de_telefono=None,correo=None,fecha_de_inicio_de_contrato=None,salario=None,rut=None,fecha_nacimiento=None,contrasena=None):
        self.id_empleado =id_empleado
        self.nombre_empleado =nombre_empleado
        clas_rol.__init__(id_roles)
        clas_cargo_empleados.__init__(id_cargo)
        self.direccion =direccion
        self.numero_de_telefono = numero_de_telefono
        self.correo =correo
        self.fecha_de_inicio_de_contrato =fecha_de_inicio_de_contrato
        self.salario=salario
        self.rut =rut
        self.fecha_nacimimeto =fecha_nacimiento  
        self.contrasena =contrasena
 
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



