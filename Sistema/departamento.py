from empleados import clas_empleados

class clas_departamento(clas_empleados):
    def __init__(self,id_departamento,telefono,nombre_departamento,id_empleado):
        clas_empleados.__init__(id_empleado)
        self.id_departamento = id_departamento
        self.telefono = telefono
        self.nombre_departamento = nombre_departamento
        