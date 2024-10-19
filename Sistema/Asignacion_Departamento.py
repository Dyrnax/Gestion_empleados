from empleados import Empleados
from departamentos import Departamentos

class AsignacionDepartamento(Empleados,Departamentos) :
    def __init__(self,id_empleado,id_departamento,id_asignacion_depto):
        Empleados().__init__(id_empleado)
        Departamentos().__init__(id_departamento)
        self.id_asignacion_depto = id_asignacion_depto
        
    def validar_asignacion():
        pass
