
import Asignacion_proyecto

class registro_de_tiempo(Asignacion_proyecto):
    def __init__(self,id_asociacion,id_registro,fecha,horas_trabajadas,tareas,observacion):
        Asignacion_proyecto.__init__(id_asociacion)
        self.id_registro=id_registro
        self.fecha= fecha
        self.horas_trabajadas=horas_trabajadas
        self.tareas=tareas
        self.observacion=observacion