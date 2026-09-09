# Sistema de Auditoría y Consolidación de Hechos Avícolas 🐔📊

Este proyecto implementa una tubería de datos (Data Pipeline) automatizada y una arquitectura analítica híbrida para la extracción, limpieza, control de calidad y consolidación gerencial de la información transaccional de una operación de engorde avícola. 

El ecosistema está diseñado para mitigar anomalías operativas de origen (registros duplicados, ediciones retroactivas y distorsiones ortográficas) y gobernar la transición tecnológica hacia la automatización total de reportes.

## 🚀 Arquitectura del Ecosistema Analítico

La solución en producción se compone de un ecosistema de **tres informes interconectados** en Power BI Service (Nube) y Desktop, alimentados por múltiples fuentes integradas:


┌───> [PBI Lotes Abiertos] <─── [Excel Indicadores] (Contingencia Manantiales)
│                     ▼  
[PBI Inicio]           (Conexión Directa)
(Menú Nube) │          [MySQL Server] <─── (Python + SP) <─── [API Transaccional App]│
   ▲
└───> [PBI Lotes Cerrados] <─── [Excel Históricos] (Soporte Auditoría)
                         ▲
                         (Conexión API Directa) <─── [ERP Siesa]


### 1. PBI Inicio (Menú Maestro)
Actúa como la puerta de acceso centralizada en la nube, sirviendo de interfaz de navegación para redireccionar a los usuarios gerenciales hacia los dos reportes misionales del negocio.

### 2. PBI Lotes Activos (Lotes Abiertos)
Monitorea la operación en tiempo real mediante dos orígenes de datos:
* **Capa MySQL (`tabla_usuarios`):** Consume la data transaccional desinfectada de la API de la app de cárnicos.
* **Excel Periférico (Tabla de Indicadores):** Almacena de forma temporal y manual la información de la granja *Manantiales*. Esta contingencia se diseñó para aislar la granja mientras estabiliza el ingreso de sus datos en la app. Una vez aprobada, se removerá el origen manual desde Power Query para integrarla directamente al flujo automatizado de MySQL.

### 3. PBI Histórico de Cierres (Lotes Cerrados)
Consolida el cierre definitivo de ciclos productivos a través de tres fuentes combinadas:
* **Capa MySQL (`vista_hechos_app`):** Carga los cierres procesados bajo las 11 capas CTE.
* **Excel Históricos de Cierre:** Resguarda la data histórica de ciclos pasados. Su actualización manual cesará una vez que la fase de auditoría actual valide el funcionamiento óptimo de la vista de hechos, quedando este archivo estático como soporte del histórico heredado.
* **API ERP Siesa:** Conexión directa desde Power BI al sistema ERP para complementar la información financiera y operativa de los cierres sin pasar por almacenamiento intermedio.

## 🛠️ Arquitectura de la Tubería Local (MySQL / Python)

Para la sección de lotes automatizados, el pipeline se ejecuta en cascada a través de `actualizar_todo.bat`:
1. **`proceso_api.py`:** Descarga los datos de la API y aplica desinfección nativa en memoria (recorte de nulos y `.strip()` de texto) para poblar la aduana.
2. **`sp_validar_y_transferir_lotes`:** Procedimiento almacenado que evalúa la consistencia biológica (frena el pipeline si detecta múltiples lotes activos en una misma granja) y actualiza la `tabla_usuarios`.
3. **`proceso_acumulativo.py`:** Algoritmo de auto-corrección por bloque. Si un operario edita o elimina un registro en la granja, Python detecta el lote activo, remueve quirúrgicamente su bloque viejo en la base de datos y lo sobreescribe con la foto vigente del día, evitando duplicidades.
4. **`vista_historica_lotes`:** Escudo ortográfico que destruye en tiempo real los espacios fantasmas de la base de datos antes de enviar la llave unificada (`Identificador`) a la vista de hechos analítica.


## 🛠️ Tecnologías Utilizadas
* **Base de Datos:** MySQL Server (CTEs Avanzadas, Window Functions, Stored Procedures).
* **Lenguaje:** Python 3.x (Pandas, Requests, MySQL Connector).
* **Orígenes No Relacionales:** REST APIs (App + ERP Siesa) y Microsoft Excel (Modelos de Contingencia).
* **Consumo:** Power BI Service / Desktop.
