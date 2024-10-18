from Empleados import Empleados
from Departamentos import Departamentos
    
class Asignacion_de_partamento(Empleados, Departamentos):
    def __init__(self, id_asignacion, id_empleados, id_departamento):
        Empleados.__init__(self, id_empleados)
        Departamentos.__init__(self, id_departamento)
        self.id_asignacion = id_asignacion