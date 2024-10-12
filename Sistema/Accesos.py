import modulo
import Empleados

class accesos(modulo,Empleados):
    def __init__(self,id_acceso,id_empleado,codigo):
        modulo.__init__(codigo)
        Empleados.__init__(id_empleado)
        self.id_acceso= id_acceso