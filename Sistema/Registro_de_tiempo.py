
from asignacion_proyecto import AsignacionProyecto

class RegistroDeTiempo(AsignacionProyecto):
    def __init__(self,id_asociacion,id_registro,fecha,horas_trabajadas,tareas,observacion):
        AsignacionProyecto().__init__(id_asociacion)
        self.id_registro=id_registro
        self.fecha= fecha
        self.horas_trabajadas=horas_trabajadas
        self.tareas=tareas
        self.observacion=observacion
