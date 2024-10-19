from empleados import Empleados
from proyecto import Proyecto
from asignacion_proyecto import AsignacionProyecto

class RegistroDeTiempo(Empleados,Proyecto,AsignacionProyecto):
    def __init__(self,id_asignacion_pro,id_registro,fecha,horas_trabajadas,tareas,observacion):
        AsignacionProyecto.__init__(id_asignacion_pro)
        self.id_registro = id_registro
        self.fecha = fecha
        self.horas_trabajadas = horas_trabajadas
        self.tareas = tareas
        self.observacion = observacion