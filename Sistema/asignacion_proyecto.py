from empleados import Empleados
from proyecto import Proyecto

class AsignacionProyecto(Empleados,Proyecto):
    def __init__(self,id_emplado,id_asignacion_pro,id_proyecto):
        Proyecto.__init__(id_proyecto)
        Empleados.__init__(id_emplado)
        self.id_asignacion_pro = id_asignacion_pro
        
    def validar_asignacion():
        pass
