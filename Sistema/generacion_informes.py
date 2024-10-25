from proyecto import clas_proyecto
from empleados  import clas_empleados
from departamento import clas_departamento
from registros_de_tiempo import clas_registro_tiempo
import pandas

class clas_generarcion_informe(clas_registro_tiempo,clas_departamento,clas_empleados,clas_proyecto):
    def __init__(self,id_informe,id_proyecto,id_empleado,id_departamento,id_registro,nombre,fecha_creacion,descripcion,ubicacion):
        clas_proyecto.__init__(id_proyecto)
        clas_empleados.__init__(id_empleado)
        clas_departamento.__init__(id_departamento)
        clas_generarcion_informe.__init__(id_registro)
        self.nombre =nombre
        self.fecha_creacion =fecha_creacion
        self.descripcion=descripcion
        self.ubicacion=ubicacion

    def exportar_informe():
        # Se usa pandas
        pass