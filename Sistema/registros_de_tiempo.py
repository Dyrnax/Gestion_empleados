from asignacion_proyecto import clas_asignacion_proyecto
class clas_registro_tiempo(clas_asignacion_proyecto):
    def __init__(self,id_registro,id_asignacion_pro,fecha,horas_trabajadas,tareas,observacion):
        clas_asignacion_proyecto.__init__(id_asignacion_pro)
        self.id_registro=id_registro
        self.fecha=fecha
        self.horas_trabajadas=horas_trabajadas
        self.tareas=tareas
        self.observacion=observacion


    def registrar_horas():
        pass
    
    def validar_cant_horas():
        pass 