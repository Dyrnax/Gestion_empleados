from empleados import Empleados


class Departamentos(Empleados):
    def __init__(self,id_departamento,telefono,nombre_departamento,id_empleado):
        self.id_departamento = id_departamento
        self.telefono = telefono
        self.nombre_departamento = nombre_departamento
        Empleados().__init__(id_empleado)
