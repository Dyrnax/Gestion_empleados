from empleados import clas_empleados
from departamento import clas_departamento

class clas_asignacion_departamentos(clas_departamento,clas_empleados):
    def __init__(self,id_asignacion_depto,id_empleado,id_departamento):
        clas_empleados.__init__(id_empleado)
        clas_departamento.__init__(id_departamento)
        self.id_asignacion_depto = id_asignacion_depto
    
    def validar_asignacion():
        pass