import mysql.connector
from mysql.connector import errorcode
try:
    cnx=mysql.connector.connect(        
        host="localhost"
        user="rott"
        passwd="123321"
        database="biblioteca")
    cursor=cnx.cursor()
    cursor.execute("SELECT *FROM generar_informe")
    for base in cursor:
        print(base)
except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Something is wrong with your user name or password")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print ("Database does not exist")
    else:
        print(err)
else:
    cnx.close()
    
    
    
