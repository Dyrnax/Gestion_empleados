import Empleados

class Generar_informes(Empleados):
    def __init__(self,id_empleado,nombre,fecha_creacion,ubicacion):
        Empleados.__init__(id_empleado)
        self.nombre=nombre
        self.fecha_creacion=fecha_creacion
        self.ubicacion=ubicacion
        
        