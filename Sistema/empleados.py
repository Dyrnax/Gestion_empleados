
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

# Conexión a la base de datos MySQL
def conectar_bd():
    try:
        conexion = mysql.connector.connect(
            user='root',
            host='localhost',
            database='gestion_empleados',
            password='',  # Añade tu contraseña aquí si es necesario
            port='3306'
        )
        return conexion
    except mysql.connector.Error as e:
        messagebox.showerror("Error de Conexión", f"No se pudo conectar a la base de datos: {e}")
        return None

# Función para crear un empleado
def agregar_empleado():
    conn = conectar_bd()
    if conn is None:
        return
    cursor = conn.cursor()

    contrasena_encriptada = bcrypt.hashpw(entry_contrasena.get().encode(), bcrypt.gensalt())
    query = '''INSERT INTO empleados (ID_EMPLEADO, NOMBRE_EMPLEADO, ID_ROL, IDCARGO, DIRECCION,
                                      NUMERO_DE_TELEFONO, CORREO, FECHA_INICIO_CONTRATO, SALARIO, 
                                      RUT, FECHA_NACIMIENTO, CONTRASENA, habilitado)
               VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)'''
    data = (entry_id.get(), entry_nombre.get(), entry_id_rol.get(), entry_id_cargo.get(),
            entry_direccion.get(), entry_telefono.get(), entry_correo.get(),
            entry_fecha_inicio.get(), entry_salario.get(), entry_rut.get(),
            entry_fecha_nacimiento.get(), contrasena_encriptada, 1)  # habilitado = 1 para activado
    
    try:
        cursor.execute(query, data)
        conn.commit()
        messagebox.showinfo("Éxito", "Empleado creado exitosamente.")
        limpiar_campos()
        mostrar_empleados()  # Mostrar empleados habilitados
        mostrar_empleados_deshabilitados()  # Actualizar empleados deshabilitados
    except mysql.connector.Error as e:
        messagebox.showerror("Error", f"Error creando el empleado: {e}")
    finally:
        cursor.close()
        conn.close()

# Función para mostrar empleados habilitados
def mostrar_empleados():
    conn = conectar_bd()
    if conn is None:
        return
    cursor = conn.cursor()
    query = "SELECT * FROM empleados WHERE habilitado = %s"
    data = (1,)  # Solo muestra empleados con habilitado = 1

    try:
        cursor.execute(query, data)
        rows = cursor.fetchall()
        tree.delete(*tree.get_children())  # Limpiar tabla de empleados habilitados
        for row in rows:
            tree.insert("", tk.END, values=row)
    except mysql.connector.Error as e:
        messagebox.showerror("Error", f"Error al mostrar empleados: {e}")
    finally:
        cursor.close()
        conn.close()

# Función para mostrar empleados deshabilitados
def mostrar_empleados_deshabilitados():
    conn = conectar_bd()
    if conn is None:
        return
    cursor = conn.cursor()
    query = "SELECT * FROM empleados WHERE habilitado = %s"
    data = (0,)  # Solo muestra empleados con habilitado = 0

    try:
        cursor.execute(query, data)
        rows = cursor.fetchall()
        tree_deshabilitados.delete(*tree_deshabilitados.get_children())  # Limpiar tabla de empleados deshabilitados
        for row in rows:
            tree_deshabilitados.insert("", tk.END, values=row)
    except mysql.connector.Error as e:
        messagebox.showerror("Error", f"Error al mostrar empleados deshabilitados: {e}")
    finally:
        cursor.close()
        conn.close()

# Función para actualizar la información de un empleado
def modificar_empleado():
    conn = conectar_bd()
    if conn is None:
        return
    cursor = conn.cursor()
    
    contrasena_encriptada = bcrypt.hashpw(entry_contrasena.get().encode(), bcrypt.gensalt())
    query = '''UPDATE empleados SET NOMBRE_EMPLEADO=%s, ID_ROL=%s, IDCARGO=%s, DIRECCION=%s,
               NUMERO_DE_TELEFONO=%s, CORREO=%s, FECHA_INICIO_CONTRATO=%s, SALARIO=%s,
               RUT=%s, FECHA_NACIMIENTO=%s, CONTRASENA=%s WHERE ID_EMPLEADO=%s AND habilitado = %s'''
    data = (entry_nombre.get(), entry_id_rol.get(), entry_id_cargo.get(),
            entry_direccion.get(), entry_telefono.get(), entry_correo.get(),
            entry_fecha_inicio.get(), entry_salario.get(), entry_rut.get(),
            entry_fecha_nacimiento.get(), contrasena_encriptada, entry_id.get(), 1)
    
    try:
        cursor.execute(query, data)
        conn.commit()
        messagebox.showinfo("Éxito", "Empleado actualizado exitosamente.")
        limpiar_campos()
        mostrar_empleados()  # Actualizar empleados habilitados
        mostrar_empleados_deshabilitados()  # Actualizar empleados deshabilitados
    except mysql.connector.Error as e:
        messagebox.showerror("Error", f"Error actualizando el empleado: {e}")
    finally:
        cursor.close()
        conn.close()

# Función para deshabilitar un empleado
def deshabilitar_empleado():
    conn = conectar_bd()
    if conn is None:
        return
    cursor = conn.cursor()

    # Cambiar el campo habilitado a 0 para deshabilitar
    query = "UPDATE empleados SET habilitado = %s WHERE ID_EMPLEADO = %s"
    data = (0, entry_id.get())  # Cambia a 1 para volver a habilitar si es necesario

    try:
        cursor.execute(query, data)
        conn.commit()
        messagebox.showinfo("Éxito", "Empleado deshabilitado exitosamente.")
        limpiar_campos()
        mostrar_empleados()  # Actualizar empleados habilitados
        mostrar_empleados_deshabilitados()  # Actualizar empleados deshabilitados
    except mysql.connector.Error as e:
        messagebox.showerror("Error", f"Error deshabilitando el empleado: {e}")
    finally:
        cursor.close()
        conn.close()

# Función para habilitar un empleado
def habilitar_empleado():
    conn = conectar_bd()
    if conn is None:
        return
    cursor = conn.cursor()

    # Cambiar el campo habilitado a 1 para habilitar
    query = "UPDATE empleados SET habilitado = %s WHERE ID_EMPLEADO = %s"
    data = (1, entry_id.get())

    try:
        cursor.execute(query, data)
        conn.commit()
        messagebox.showinfo("Éxito", "Empleado habilitado exitosamente.")
        limpiar_campos()
        mostrar_empleados()  # Actualizar empleados habilitados
        mostrar_empleados_deshabilitados()  # Actualizar empleados deshabilitados
    except mysql.connector.Error as e:
        messagebox.showerror("Error", f"Error habilitando el empleado: {e}")
    finally:
        cursor.close()
        conn.close()

# Función para limpiar los campos de entrada
def limpiar_campos():
    for entry in entradas:
        entry.delete(0, tk.END)

# Función para manejar la selección de un empleado en la tabla
def seleccionar_empleado(event):
    seleccion = tree.selection()
    if seleccion:
        item = tree.item(seleccion[0])
        valores = item["values"]
        for i, entry in enumerate(entradas):
            entry.delete(0, tk.END)
            entry.insert(0, valores[i])
    else:
        seleccion_deshabilitado = tree_deshabilitados.selection()
        if seleccion_deshabilitado:
            item = tree_deshabilitados.item(seleccion_deshabilitado[0])
            valores = item["values"]
            for i, entry in enumerate(entradas):
                entry.delete(0, tk.END)
                entry.insert(0, valores[i])

# Interfaz
root = tk.Tk()
root.title("Gestión de Empleados")

# Etiquetas y entradas
etiquetas = [
    "ID Empleado", "Nombre Empleado", "ID Rol", "ID Cargo", "Dirección", "Teléfono",
    "Correo", "Fecha Inicio Contrato (YYYY-MM-DD)", "Salario", "RUT", 
    "Fecha Nacimiento (YYYY-MM-DD)", "Contraseña"
]
entradas = []
for i, etiqueta in enumerate(etiquetas):
    tk.Label(root, text=etiqueta).grid(row=i, column=0, padx=10, pady=5)
    entry = tk.Entry(root)
    entry.grid(row=i, column=1, padx=10, pady=5)
    entradas.append(entry)
entradas[-1].config(show="*")  

entry_id, entry_nombre, entry_id_rol, entry_id_cargo, entry_direccion, entry_telefono, \
entry_correo, entry_fecha_inicio, entry_salario, entry_rut, \
entry_fecha_nacimiento, entry_contrasena = entradas

# Botones de acción
btn_agregar = tk.Button(root, text="Agregar Empleado", command=agregar_empleado)
btn_agregar.grid(row=len(etiquetas), column=0, padx=10, pady=10)

btn_modificar = tk.Button(root, text="Actualizar Empleado", command=modificar_empleado)
btn_modificar.grid(row=len(etiquetas) + 1, column=0, padx=10, pady=10)

btn_deshabilitar = tk.Button(root, text="Deshabilitar Empleado", command=deshabilitar_empleado)
btn_deshabilitar.grid(row=len(etiquetas) + 1, column=1, padx=10, pady=10)

btn_habilitar = tk.Button(root, text="Habilitar Empleado", command=habilitar_empleado)
btn_habilitar.grid(row=len(etiquetas) + 2, column=0, padx=10, pady=10)

# Configuración de la tabla para mostrar empleados habilitados
tree = ttk.Treeview(root, columns=("ID", "Nombre", "Rol", "Cargo", "Dirección", "Teléfono", 
                                    "Correo", "Fecha Inicio", "Salario", "RUT", "Fecha Nac", "Contraseña"), show="headings")
tree.grid(row=len(etiquetas) + 3, column=0, columnspan=2, padx=10, pady=10, sticky='nsew')

# Configuración de la tabla para mostrar empleados deshabilitados
tree_deshabilitados = ttk.Treeview(root, columns=("ID", "Nombre", "Rol", "Cargo", "Dirección", "Teléfono", 
                                    "Correo", "Fecha Inicio", "Salario", "RUT", "Fecha Nac", "Contraseña"), show="headings")
tree_deshabilitados.grid(row=len(etiquetas) + 4, column=0, columnspan=2, padx=10, pady=10, sticky='nsew')

# Configuración de las columnas de la tabla
for col in tree["columns"]:
    tree.heading(col, text=col)
    tree.column(col, anchor="center")

# Configuración de las columnas de la tabla deshabilitados
for col in tree_deshabilitados["columns"]:
    tree_deshabilitados.heading(col, text=col)
    tree_deshabilitados.column(col, anchor="center")

# Configuración de la cuadrícula para expandirse
root.grid_rowconfigure(len(etiquetas) + 3, weight=1)
root.grid_rowconfigure(len(etiquetas) + 4, weight=1)
root.grid_columnconfigure(0, weight=1)
root.grid_columnconfigure(1, weight=1)

# Enlazar la selección del árbol a la función
tree.bind("<<TreeviewSelect>>", seleccionar_empleado)
tree_deshabilitados.bind("<<TreeviewSelect>>", seleccionar_empleado)


mostrar_empleados()
mostrar_empleados_deshabilitados()

root.mainloop()





