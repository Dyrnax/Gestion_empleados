import Proyecto
import Empleados
import departamentos
import Registro_de_tiempo

class informes(Proyecto,Empleados,departamentos,Registro_de_tiempo):
    def __init__(self,id_proyecto,id_empleado,id_departamento,id_registro):
        Proyecto.__init__(id_proyecto),
        Empleados.__init__(id_empleado),
        departamentos.__init__(id_departamento),
        Registro_de_tiempo.__init__(id_registro)
        
        
        