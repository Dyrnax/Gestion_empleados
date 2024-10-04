import Empleados
import Proyecto

class asignacion_proyecto(Empleados,Proyecto):
    def __init__(self,id_emplado,id_asocacion,id_proyecto):
        Proyecto.__init__(id_proyecto)
        Empleados.__init__(id_emplado)
        self.id_asocacion=id_asocacion
