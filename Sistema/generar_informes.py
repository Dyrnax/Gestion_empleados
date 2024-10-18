from Empleados import Empleados

class Generar_informes(Empleados):
    def __init__(self,id_empleado,nombre,fecha_creacion,ubicacion):
        Empleados.__init__(id_empleado)
        self.nombre=nombre
        self.fecha_creacion=fecha_creacion
        self.ubicacion=ubicacion
        
    def generar_informe(self):
        # Aquí puedes personalizar el formato del informe como desees
        informe = f"""
        INFORME: {self.nombre_informe}
        ===============================
        ID Empleado: {self.id_empleado}
        Nombre Empleado: {self.nombre_empleado}
        Fecha de Creación: {self.fecha_creacion}
        Ubicación: {self.ubicacion}
        ===============================
        """
        return informe