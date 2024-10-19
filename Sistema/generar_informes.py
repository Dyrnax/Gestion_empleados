import pandas
from proyecto import Proyecto
from empleados import Empleados
from departamentos import Departamentos
from registro_de_tiempo import RegistroDeTiempo

class GeneracionInformes(Proyecto,Empleados,Departamentos,RegistroDeTiempo):
    def __init__(self,id_informe,id_proyecto,id_empleado,id_departamento,id_registro,nombre,fecha_creacion,descripcion,ubicacion):
        self.id_informe = id_informe
        Proyecto.__init__(id_proyecto)
        Empleados.__init__(id_empleado)
        Departamentos.__init__(id_departamento)
        RegistroDeTiempo.__init__(id_registro)
        self.nombre = nombre
        self.fecha_creacion = fecha_creacion
        self.descripcion = descripcion
        self.uicacion = ubicacion
    
    def exportar_informe():
        #esto con pandas
        pass