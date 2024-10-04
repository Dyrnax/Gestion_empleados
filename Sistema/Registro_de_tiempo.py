import Empleados
import Proyecto
import asignacion_proyecto

class registro_de_tiempo(Empleados,Proyecto,asignacion_proyecto):
    def __init__(self,id_empleado,id_proyecto,id_asociacion,id_registro,fecha,horas_trabajadas,tareas):
        Empleados.__init__(id_empleado),
        Proyecto.__init__(id_proyecto),
        asignacion_proyecto.__init__(id_asociacion),
        self.id_registro=id_registro,
        self.fecha= fecha,
        self.horas_trabajadas=horas_trabajadas,
        self.tareas=tareas