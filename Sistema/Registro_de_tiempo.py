
from Asignacion_Departamento import Asignacion_de_partamento

class registro_de_tiempo(Asignacion_de_partamento):
    def __init__(self,id_asociacion,id_registro,fecha,horas_trabajadas,tareas,observacion):
        Asignacion_de_partamento.__init__(id_asociacion)
        self.id_registro=id_registro
        self.fecha= fecha
        self.horas_trabajadas=horas_trabajadas
        self.tareas=tareas
        self.observacion=observacion