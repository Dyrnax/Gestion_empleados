import Modulo
import Empleados

class accesos(Modulo,Empleados):
    def __init__(self,id_acceso,id_empleado,codigo):
        Modulo.__init__(codigo)
        Empleados.__init__(id_empleado)
        self.id_acceso= id_acceso