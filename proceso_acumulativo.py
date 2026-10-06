import requests
import pandas as pd
import mysql.connector

# --- 1. CONFIGURACIÓN DE LA API ---
URL_REAL_API = "http://181.143.22.234:3000/granjas/get-informacion-lotes-activos" 
TOKEN_REAL = "381fc0c5f54eb41c5a9dc4ee249192d1"

cabeceras = {
    "Authorization": f"{TOKEN_REAL}",
    "Content-Type": "application/json"
}

print("Conectando con la API para el proceso acumulativo maestro...")

try:
    # Descargar datos actuales de la API
    respuesta = requests.get(URL_REAL_API, headers=cabeceras)
    respuesta.raise_for_status() 
    datos_json = respuesta.json()
    
    print("¡Conexión exitosa! Analizando bloques de lotes activos...")

    if isinstance(datos_json, dict):
        for clave, valor in datos_json.items():
            if isinstance(valor, list):
                datos_json = valor
                break

    df = pd.DataFrame(datos_json)

    # Organizar formatos de fecha
    columnas_fecha = ['fecha_registro', 'fecha_desde', 'fecha_cierre']
    for col in columnas_fecha:
        if col in df.columns:
            df[col] = pd.to_datetime(df[col], errors='coerce')

    # --- 2. CONECTAR A MYSQL ---
    conexion = mysql.connector.connect(
        host="localhost",
        user="root",          
        password="Franco1531+*",  
        database="data_app_carnicos"
    )
    cursor = conexion.cursor()

    # --- 3. LÓGICA INTELIGENTE DE COMPARACIÓN ---
    
    # A. Combinaciones únicas (Granja y Lote) que vienen HOY en la API
    lotes_activos_api = set(zip(df['granja'].astype(str), df['lote'].astype(str)))

    # B. Buscamos qué granjas y lotes tenemos guardados en MySQL que sigan como 'ABIERTO'
    cursor.execute("SELECT DISTINCT granja, lote FROM tabla_acumulativa_lotes WHERE estado2 = 'ABIERTO';")
    lotes_en_base_datos = cursor.fetchall()

    # C. COMPARACIÓN DE CIERRE: Si un lote estaba 'ABIERTO' pero YA NO VIENE en la API, lo cerramos definitivamente
    contador_cerrados = 0
    for granja_bd, lote_bd in lotes_en_base_datos:
        if (str(granja_bd), str(lote_bd)) not in lotes_activos_api:
            sql_cerrar = "UPDATE tabla_acumulativa_lotes SET estado2 = 'CERRADO' WHERE granja = %s AND lote = %s;"
            cursor.execute(sql_cerrar, (granja_bd, lote_bd))
            contador_cerrados += 1

    if contador_cerrados > 0:
        print(f"-> Se identificaron y cerraron {contador_cerrados} lotes antiguos en el histórico.")
    else:
        print("-> Todos los históricos cerrados permanecen protegidos.")

    # =========================================================================
    # 🛡️ REEMPLAZO ESTRUCTURAL ABSOLUTO (RESET DE BLOQUE ACTIVO)
    # =========================================================================
    granjas_lotes_api_unicos = df[['granja', 'lote']].drop_duplicates()
    
    print("Aplicando reemplazo absoluto estructural. Purgando fantasmas transaccionales...")
    for _, fila_reemplazo in granjas_lotes_api_unicos.iterrows():
        sql_limpiar_bloque = """
        DELETE FROM tabla_acumulativa_lotes 
        WHERE granja = %s AND lote = %s;
        """
        cursor.execute(sql_limpiar_bloque, (str(fila_reemplazo['granja']), str(fila_reemplazo['lote'])))
    # =========================================================================

    # D. INSERCIÓN: Insertamos las filas frescas, vigentes y reales de la API
    print("Poblation tabla acumulativa con la foto limpia del día...")
    
    def limpiar_vacio(valor, tipo):
        if pd.isna(valor) or str(valor).strip() == '' or str(valor).strip().lower() in ['nat', 'none', 'null']:
            return None
        try:
            return tipo(str(valor).strip())
        except:
            return None

    for index, fila in df.iterrows():
        sql_insertar = """
        INSERT INTO tabla_acumulativa_lotes (
            granja, lote, edad, nombre_galpon, sexo, dia, motivo, saldo_inicial, 
            total_mortalidad, traslado, saldo_final, fecha_registro, fecha_desde, 
            estado, consumos, peso, fecha_cierre, aplica_consumo_conversion, 
            mortalidad_acumulado, consumo_ave_excel, estado2
        ) 
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 'ABIERTO');
        """
        
        valores = (
            limpiar_vacio(fila['granja'], str),
            limpiar_vacio(fila['lote'], str),
            limpiar_vacio(fila['edad'], int),
            limpiar_vacio(fila['nombre_galpon'], str),
            limpiar_vacio(fila['sexo'], str),
            limpiar_vacio(fila['dia'], int),
            limpiar_vacio(fila['motivo'], str),
            limpiar_vacio(fila['saldo_inicial'], int),
            limpiar_vacio(fila['total_mortalidad'], int),
            limpiar_vacio(fila['traslado'], int),
            limpiar_vacio(fila['saldo_final'], int),
            fila['fecha_registro'].strftime('%Y-%m-%d %H:%M:%S') if pd.notna(fila['fecha_registro']) else None,
            fila['fecha_desde'].strftime('%Y-%m-%d %H:%M:%S') if pd.notna(fila['fecha_desde']) else None,
            limpiar_vacio(fila['estado'], str),
            limpiar_vacio(fila['consumos'], float),
            limpiar_vacio(fila['peso'], float),
            fila['fecha_cierre'].strftime('%Y-%m-%d %H:%M:%S') if pd.notna(fila['fecha_cierre']) else None,
            limpiar_vacio(fila['aplica_consumo_conversion'], str),
            limpiar_vacio(fila['mortalidad_acumulado'], int),
            limpiar_vacio(fila['consumo_ave_excel'], float)
        )
        cursor.execute(sql_insertar, valores)

    # =========================================================================
    # 🍒 LA CEREZA DEL PASTEL: CANDADO DE UNIFICACIÓN DE CIERRES RETROACTIVOS
    # =========================================================================
    print("Sincronizando estados de cierre para registros rezagados...")
    sql_unificar_fantasmas = """
    UPDATE tabla_acumulativa_lotes t
    INNER JOIN (
        SELECT DISTINCT granja, lote 
        FROM tabla_acumulativa_lotes 
        WHERE estado2 = 'CERRADO'
    ) c ON t.granja = c.granja AND t.lote = c.lote
    SET t.estado2 = 'CERRADO'
    WHERE t.estado2 = 'ABIERTO';
    """
    cursor.execute(sql_unificar_fantasmas)
    # =========================================================================

    conexion.commit()
    print("\n--- ¡TABLA ACUMULATIVA RESUMIDA, SANEADA Y UNIFICADA CON ÉXITO EN MYSQL! ---")

except requests.exceptions.HTTPError as error_api:
    print(f"\n❌ Error al comunicarse con la API: {error_api}")
except mysql.connector.Error as error_sql:
    print(f"\n❌ Error en la Base de Datos MySQL: {error_sql}")
finally:
    if 'conexion' in locals() and conexion.is_connected():
        cursor.close()
        conexion.close()

