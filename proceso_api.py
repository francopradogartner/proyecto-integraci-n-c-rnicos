import requests
import pandas as pd
import mysql.connector
import sys  # Importado para detener el archivo .bat si falla la validación

# --- CONFIGURACIÓN DE LA API ---
# Se limpia la URL asegurando que Python interprete la IP completa con su puerto
URL_REAL_API = "http://181.143.22.234:3000/granjas/get-informacion-lotes-activos" 
TOKEN_REAL = "381fc0c5f54eb41c5a9dc4ee249192d1"

cabeceras = {
    "Authorization": f"{TOKEN_REAL}",
    "Content-Type": "application/json"
}

print("Conectando con la API de Cárnicos...")

try:
    respuesta = requests.get(URL_REAL_API, headers=cabeceras, timeout=120)
    respuesta.raise_for_status() 
    datos_json = respuesta.json()
    
    print("¡Conexión a la API exitosa! Desempaquetando información...")

    if isinstance(datos_json, dict):
        for clave, valor in datos_json.items():
            if isinstance(valor, list):
                datos_json = valor
                break

    df = pd.DataFrame(datos_json)

    columnas_interes = [
        'granja', 'lote', 'edad', 'nombre_galpon', 'sexo', 'dia', 'motivo', 'saldo_inicial', 
        'total_mortalidad', 'traslado', 'saldo_final', 'fecha_registro', 'fecha_desde', 
        'estado', 'consumos', 'peso', 'fecha_cierre', 'aplica_consumo_conversion', 
        'mortalidad_acumulado', 'consumo_ave_excel'
    ]
    
    df_modificado = df[columnas_interes].copy()

    # --- BASE DE DATOS MYSQL ---
    print("Conectando a MySQL local...")
    conexion = mysql.connector.connect(
        host="localhost",
        user="root",          
        password="Franco1531+*",  
        database="data_app_carnicos"
    )
    cursor = conexion.cursor()

    print("Preparando mesa de control de calidad en MySQL...")
    cursor.execute("TRUNCATE TABLE tabla_calidad_api;")

    # Función inteligente para proteger contra celdas en blanco y aplicar TRIM nativo en Python
    def limpiar_vacio(valor, tipo, aplicar_trim=False):
        if pd.isna(valor) or str(valor).strip() == '' or str(valor).strip().lower() in ['nat', 'none', 'null']:
            return None
        try:
            texto = str(valor)
            if aplicar_trim:
                # CIRUGÍA DE RAÍZ: Elimina espacios fantasmas al inicio y al final en Python ('8 ' -> '8')
                texto = texto.strip()
            return tipo(texto) if tipo != str else texto
        except:
            return None

    print("Descargando datos en tabla de aduana para inspección...")
    for index, fila in df_modificado.iterrows():
        sql = """
        INSERT INTO tabla_calidad_api (
            granja, lote, edad, nombre_galpon, sexo, dia, motivo, saldo_inicial, 
            total_mortalidad, traslado, saldo_final, fecha_registro, fecha_desde, 
            estado, consumos, peso, fecha_cierre, aplica_consumo_conversion, 
            mortalidad_acumulado, consumo_ave_excel
        ) 
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);
        """
        
        valores = (
            # Se activa el flag aplicar_trim=True para limpiar de raíz la granja y el galpón
            limpiar_vacio(fila['granja'], str, aplicar_trim=True),
            limpiar_vacio(fila['lote'], str),
            limpiar_vacio(fila['edad'], int),
            limpiar_vacio(fila['nombre_galpon'], str, aplicar_trim=True),
            limpiar_vacio(fila['sexo'], str),
            limpiar_vacio(fila['dia'], int),
            limpiar_vacio(fila['motivo'], str),
            limpiar_vacio(fila['saldo_inicial'], int),
            limpiar_vacio(fila['total_mortalidad'], int),
            limpiar_vacio(fila['traslado'], int),
            limpiar_vacio(fila['saldo_final'], int),
            limpiar_vacio(fila['fecha_registro'], str), 
            limpiar_vacio(fila['fecha_desde'], str),    
            limpiar_vacio(fila['estado'], str),
            limpiar_vacio(fila['consumos'], float),
            limpiar_vacio(fila['peso'], float),
            limpiar_vacio(fila['fecha_cierre'], str),   
            limpiar_vacio(fila['aplica_consumo_conversion'], str),
            limpiar_vacio(fila['mortalidad_acumulado'], int),
            limpiar_vacio(fila['consumo_ave_excel'], float)
        )

        cursor.execute(sql, valores)

    conexion.commit()

    print("Ejecutando auditoría de consistencia de lotes (Regla de Oro)...")
    try:
        cursor.execute("CALL sp_validar_y_transferir_lotes();")
        conexion.commit()
        print("\n--- ¡TABLA UNIVERSAL DE USUARIOS ACTUALIZADA Y COMPROBADA CON ÉXITO! ---")
    except mysql.connector.Error as error_validacion:
        print(f"\n🛑 ALERTA DE CONTROL DE CALIDAD:")
        print(f"{error_validacion.msg}")
        print("\nEl proceso ha sido suspendido inmediatamente. Las bases de datos permanecen intactas.")
        sys.exit(1)

except (requests.exceptions.RequestException, requests.exceptions.HTTPError) as error_api:
    print(f"\n❌ Error crítico de comunicación con la API: {error_api}")
    sys.exit(1)
except mysql.connector.Error as error_sql:
    print(f"\n❌ Error en la Base de Datos MySQL: {error_sql}")
    sys.exit(1)
finally:
    if 'conexion' in locals() and conexion.is_connected():
        cursor.close()
        conexion.close()
