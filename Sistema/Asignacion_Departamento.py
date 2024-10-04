import Empleados

class Asignacion_departament(Empleados) :
    def __init__(self,id_empleados,id_departamento):
        Empleados.__init__(id_empleados)
        self.id_departamento = id_departamento
        
    def asignar_departamento(self, nuevo_departamento):
        self.id_departamento = nuevo_departamento
        print(f"Empleado {self.empleado.nombre} (ID: {self.empleado.id_empleado}) asignado al departamento {self.id_departamento}")

        