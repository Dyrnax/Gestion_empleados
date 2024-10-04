import Empleados

class Asignacion_departament(Empleados) :
    def __init__(self,id_empleados,id_departamento):
        Empleados.__init__(id_empleados)
        self.id_departamento = id_departamento
        
    
        