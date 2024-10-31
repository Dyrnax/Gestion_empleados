
from rol import clas_rol
from cargo_empleados import clas_cargo_empleados
import re
import bcrypt
import mysql.connector
import bcrypt
import tkinter as tk
from tkinter import messagebox, ttk
import sqlite3

class clas_empleados(clas_rol,clas_cargo_empleados):
    def __init__(self,id_empleado=None ,nombre_empleado=None,id_roles=None,id_cargo=None,direccion=None,numero_de_telefono=None,correo=None,fecha_de_inicio_de_contrato=None,salario=None,rut=None,fecha_nacimiento=None,contrasena=None):
        self.id_empleado =id_empleado
        self.nombre_empleado =nombre_empleado
        clas_rol.__init__(id_roles)
        clas_cargo_empleados.__init__(id_cargo)
        self.direccion =direccion
        self.numero_de_telefono = numero_de_telefono
        self.correo =correo
        self.fecha_de_inicio_de_contrato =fecha_de_inicio_de_contrato
        self.salario=salario
        self.rut =rut
        self.fecha_nacimimeto =fecha_nacimiento  
        self.contrasena =contrasena
 
    def validar_correo(self):
        pat_correo= r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$'
        if (re.match(pat_correo,self.correo)):
            return True 
        else:
            return False
        
    def validar_telefono(self):
        pat_telefono= r'^\+?[\d\s\-]{7,15}$'
        if re.match(pat_telefono,self.numero_de_empleado):
            return  True 
        else:
            return False
        
    def encriptar_contrasena(self, contrasena):
        salt = bcrypt.gensalt() 
        hashed_contrasena = bcrypt.hashpw(contrasena.encode('utf-8'), salt)
        return hashed_contrasena

    
    def desencriptar_contrasena(self, contrasena):
        return bcrypt.checkpw(contrasena.encode('utf-8'), self.contrasena)

import mysql.connector
import bcrypt
import tkinter as tk
from tkinter import messagebox, ttk

def conectar_bd():
    try:
        conexion = mysql.connector.connect(
            user='root',
            host='localhost',
            database='gestion_empleados',
            password='',  
            port='3306'
        )
        return conexion
    except mysql.connector.Error as e:
        messagebox.showerror("Error de Conexión", f"No se pudo conectar a la base de datos: {e}")
        return None

# Función para crear un empleado
def crear_empleado():
    conn = conectar_bd()
    if conn is None:
        return
    cursor = conn.cursor()
    
    # Encriptar contraseña
    contrasena_encriptada = bcrypt.hashpw(entry_contrasena.get().encode(), bcrypt.gensalt())
    query = '''INSERT INTO empleados (ID_EMPLEADO, NOMBRE_EMPLEADO, ID_ROL, IDCARGO, DIRECCION,
                                      NUMERO_DE_TELEFONO, CORREO, FECHA_INICIO_CONTRATO,
                                      SALARIO, RUT, FECHA_NACIMIENTO, CONTRASENA)
               VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)'''
    data = (entry_id.get(), entry_nombre.get(), entry_id_roles.get(), entry_id_cargo.get(),
            entry_direccion.get(), entry_telefono.get(), entry_correo.get(),
            entry_fecha_inicio.get(), entry_salario.get(), entry_rut.get(),
            entry_fecha_nacimiento.get(), contrasena_encriptada)
    
    try:
        cursor.execute(query, data)
        conn.commit()
        messagebox.showinfo("Éxito", "Empleado creado exitosamente.")
        limpiar_campos()
    except mysql.connector.Error as e:
        messagebox.showerror("Error", f"Error creando el empleado: {e}")
    finally:
        cursor.close()
        conn.close()

# Función para leer empleados
def mostrar_empleados():
    conn = conectar_bd()
    if conn is None:
        return
    cursor = conn.cursor()
    query = "SELECT * FROM empleados"

    
    for item in tree.get_children():
        tree.delete(item)

    try:
        cursor.execute(query)
        rows = cursor.fetchall()
        for row in rows:
            tree.insert("", tk.END, values=row)  # Mostrar todos los detalles del empleado
    except mysql.connector.Error as e:
        messagebox.showerror("Error", f"Error leyendo los empleados: {e}")
    finally:
        cursor.close()
        conn.close()

# Función para actualizar un empleado
def actualizar_empleado():
    conn = conectar_bd()
    if conn is None:
        return
    cursor = conn.cursor()


    contrasena_encriptada = bcrypt.hashpw(entry_contrasena.get().encode(), bcrypt.gensalt())
    query = '''UPDATE empleados SET 
                NOMBRE_EMPLEADO=%s, 
                ID_ROL=%s, 
                IDCARGO=%s, 
                DIRECCION=%s,
                NUMERO_DE_TELEFONO=%s, 
                CORREO=%s, 
                FECHA_INICIO_CONTRATO=%s, 
                SALARIO=%s,
                RUT=%s, 
                FECHA_NACIMIENTO=%s, 
                CONTRASENA=%s 
                WHERE ID_EMPLEADO=%s'''
    
    data = (entry_nombre.get(), entry_id_roles.get(), entry_id_cargo.get(),
            entry_direccion.get(), entry_telefono.get(), entry_correo.get(),
            entry_fecha_inicio.get(), entry_salario.get(), entry_rut.get(),
            entry_fecha_nacimiento.get(), contrasena_encriptada, entry_id.get())
    
    try:
        cursor.execute(query, data)
        conn.commit()
        messagebox.showinfo("Éxito", "Empleado actualizado exitosamente.")
        limpiar_campos()
    except mysql.connector.Error as e:
        messagebox.showerror("Error", f"Error actualizando el empleado: {e}")
    finally:
        cursor.close()
        conn.close()


def eliminar_empleado():
    conn = conectar_bd()
    if conn is None:
        return
    cursor = conn.cursor()
    query = "DELETE FROM empleados WHERE ID_EMPLEADO=%s"
    data = (entry_id.get(),)
    
    try:
        cursor.execute(query, data)
        conn.commit()
        messagebox.showinfo("Éxito", "Empleado eliminado exitosamente.")
        limpiar_campos()
    except mysql.connector.Error as e:
        messagebox.showerror("Error", f"Error eliminando el empleado: {e}")
    finally:
        cursor.close()
        conn.close()


def limpiar_campos():
    entry_id.delete(0, tk.END)
    entry_nombre.delete(0, tk.END)
    entry_id_roles.delete(0, tk.END)
    entry_id_cargo.delete(0, tk.END)
    entry_direccion.delete(0, tk.END)
    entry_telefono.delete(0, tk.END)
    entry_correo.delete(0, tk.END)
    entry_fecha_inicio.delete(0, tk.END)
    entry_salario.delete(0, tk.END)
    entry_rut.delete(0, tk.END)
    entry_fecha_nacimiento.delete(0, tk.END)
    entry_contrasena.delete(0, tk.END)


def seleccionar_empleado(event):
    selected_item = tree.selection()
    if selected_item:
        item = tree.item(selected_item)
        values = item['values']
        
       
        entry_id.delete(0, tk.END)
        entry_id.insert(0, values[0])
        entry_nombre.delete(0, tk.END)
        entry_nombre.insert(0, values[1])
        entry_id_roles.delete(0, tk.END)
        entry_id_roles.insert(0, values[2])
        entry_id_cargo.delete(0, tk.END)
        entry_id_cargo.insert(0, values[3])
        entry_direccion.delete(0, tk.END)
        entry_direccion.insert(0, values[4])
        entry_telefono.delete(0, tk.END)
        entry_telefono.insert(0, values[5])
        entry_correo.delete(0, tk.END)
        entry_correo.insert(0, values[6])
        entry_fecha_inicio.delete(0, tk.END)
        entry_fecha_inicio.insert(0, values[7])
        entry_salario.delete(0, tk.END)
        entry_salario.insert(0, values[8])
        entry_rut.delete(0, tk.END)
        entry_rut.insert(0, values[9])
        entry_fecha_nacimiento.delete(0, tk.END)
        entry_fecha_nacimiento.insert(0, values[10])
        entry_contrasena.delete(0, tk.END)  

# Interfaz Tkinter para agregar empleados
root = tk.Tk()
root.title("Gestión de Empleados")

# Crear etiquetas para los campos de entrada
etiquetas = [
    "ID Empleado", "Nombre Empleado", "ID Rol", "ID Cargo", "Dirección", 
    "Teléfono", "Correo", "Fecha Inicio Contrato (YYYY-MM-DD)", 
    "Salario", "RUT", "Fecha Nacimiento (YYYY-MM-DD)", "Contraseña"
]
for i, texto in enumerate(etiquetas):
    tk.Label(root, text=texto).grid(row=i, column=0, padx=10, pady=10)


entry_id = tk.Entry(root)
entry_nombre = tk.Entry(root)
entry_id_roles = tk.Entry(root)
entry_id_cargo = tk.Entry(root)
entry_direccion = tk.Entry(root)
entry_telefono = tk.Entry(root)
entry_correo = tk.Entry(root)
entry_fecha_inicio = tk.Entry(root)
entry_salario = tk.Entry(root)
entry_rut = tk.Entry(root)
entry_fecha_nacimiento = tk.Entry(root)
entry_contrasena = tk.Entry(root, show="*")


entries = [
    entry_id, entry_nombre, entry_id_roles, entry_id_cargo, entry_direccion, 
    entry_telefono, entry_correo, entry_fecha_inicio, entry_salario, 
    entry_rut, entry_fecha_nacimiento, entry_contrasena
]
for i, entry in enumerate(entries):
    entry.grid(row=i, column=1, padx=10, pady=10)

# Botones para agregar, mostrar, actualizar y eliminar empleados
btn_crear = tk.Button(root, text="Agregar Empleado", command=crear_empleado)
btn_crear.grid(row=len(etiquetas), column=0, padx=10, pady=10)

btn_mostrar = tk.Button(root, text="Mostrar Empleados", command=mostrar_empleados)
btn_mostrar.grid(row=len(etiquetas), column=1, padx=10, pady=10)

btn_actualizar = tk.Button(root, text="Actualizar Empleado", command=actualizar_empleado)
btn_actualizar.grid(row=len(etiquetas) + 1, column=0, padx=10, pady=10)

btn_eliminar = tk.Button(root, text="Eliminar Empleado", command=eliminar_empleado)
btn_eliminar.grid(row=len(etiquetas) + 1, column=1, padx=10, pady=10)

# Configuración de la tabla para mostrar empleados
tree = ttk.Treeview(root, columns=("ID", "Nombre", "Rol", "Cargo", "Dirección", "Teléfono", 
                                    "Correo", "Fecha Inicio", "Salario", "RUT", "Fecha Nac", "Contraseña"), show="headings")
tree.grid(row=len(etiquetas) + 2, column=0, columnspan=2, padx=10, pady=10, sticky='nsew')

# Configuración de las columnas de la tabla
for col in tree["columns"]:
    tree.heading(col, text=col)
    tree.column(col, anchor="center")

# Configuración de la cuadrícula para expandirse
root.grid_rowconfigure(len(etiquetas) + 2, weight=1)
root.grid_columnconfigure(0, weight=1)
root.grid_columnconfigure(1, weight=1)

# Enlazar la selección del árbol a la función
tree.bind("<<TreeviewSelect>>", seleccionar_empleado)

root.mainloop()
