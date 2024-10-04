
import re 
import cargo_empleados as cargo

class Empleados:
    def __init__(self, id_empleado, nombre_empleado, id_cargo, direccion, numero_de_telefono, correo, fecha_de_inicio_de_contrato, salario, rut, fecha_nacimiento):
        self.id_empleado = id_empleado
        self.nombre_empleado = nombre_empleado
        cargo.__init__(id_cargo)
        self.direccion = direccion
        self.numero_de_telefono = numero_de_telefono
        self.correo = correo
        self.fecha_de_inicio_de_contrato = fecha_de_inicio_de_contrato
        self.salario = salario
        self.rut = rut
        self.fecha_nacimiento = fecha_nacimiento
        
    def validar_correo(self):
        pat_correo= r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$'
        if (re.match(pat_correo,self.correo)):
            return True 
        else:
            return False
        
    def validar_telefono(self):
        pat_telefono= r'^\+?[\d\s\-]{7,15}$'
        if re.match(pat_telefono,self.numero_de_telefono):
            return  True 
        else:
            return False
        