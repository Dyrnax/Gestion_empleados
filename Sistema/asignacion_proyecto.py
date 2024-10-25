from empleados import clas_empleados
from proyecto import clas_proyecto

class clas_asignacion_proyecto(clas_empleados,clas_proyecto):
    def __init__(self,id_asignacion_pro,id_empleado,id_proyecto):
        clas_empleados.__init__(id_empleado)
        clas_proyecto.__init__(id_proyecto)
        self.id_asignacion_pro = id_asignacion_pro

    def validar_asignacion():
        pass
