# Sistema de Auditoría y Consolidación de Hechos Avícolas 🐔📊

Este proyecto implementa un Data Pipeline automatizada y una arquitectura analítica híbrida para la extracción, limpieza, control de calidad y consolidación gerencial de la información transaccional de una operación de engorde avícola. 

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
* **Capa MySQL (`tabla_usuarios`):** Consume la data transaccional de la API de la app de cárnicos.
* **Excel Periférico (Tabla de Indicadores):** Almacena de forma temporal y manual la información de la granja *Manantiales*. Esta contingencia se diseñó para aislar la granja mientras estabiliza el ingreso de sus datos en la app. Una vez aprobada, se removerá el origen manual desde Power Query para integrarla directamente al flujo automatizado de MySQL.

### 3. PBI Histórico de Cierres (Lotes Cerrados)
Consolida el cierre definitivo de ciclos productivos a través de tres fuentes combinadas:
* **Capa MySQL (`vista_hechos_app`):** Carga los cierres procesados bajo las 11 capas CTE.
* **Excel Históricos de Cierre:** Resguarda la data histórica de ciclos pasados. Su actualización manual cesará una vez que la fase de auditoría actual valide el funcionamiento óptimo de la vista de hechos, quedando este archivo estático como soporte del histórico heredado.
* **API ERP Siesa:** Conexión directa desde Power BI al sistema ERP para complementar la información operativa de los cierres sin pasar por almacenamiento intermedio.

## 🛠️ Arquitectura de pipeline Local (MySQL / Python)

Para la sección de lotes automatizados, el pipeline se ejecuta en cascada a través de `actualizar_todo.bat`:
1. **`proceso_api.py`:** Descarga los datos de la API y aplica desinfección nativa en memoria (recorte de nulos y `.strip()` de texto) para poblar la aduana.
2. **`sp_validar_y_transferir_lotes`:** Procedimiento almacenado que evalúa la consistencia biológica (frena el pipeline si detecta múltiples lotes activos en una misma granja) y actualiza la `tabla_usuarios`.
3. **`proceso_acumulativo.py`:** Algoritmo de auto-corrección por bloque. Si un operario edita o elimina un registro en la granja, Python detecta el lote activo, remueve su bloque viejo en la base de datos y lo sobreescribe con la foto vigente del día, evitando duplicidades.
4. **`vista_historica_lotes`:** Escudo ortográfico que destruye en tiempo real los espacios fantasmas de la base de datos antes de enviar la llave unificada (`Identificador`) a la vista de hechos analítica.


## 🛠️ Tecnologías Utilizadas
* **Base de Datos:** MySQL Server (CTEs Avanzadas, Window Functions, Stored Procedures).
* **Lenguaje:** Python 3.x (Pandas, Requests, MySQL Connector).
* **Orígenes No Relacionales:** REST APIs (App + ERP Siesa) y Microsoft Excel (Modelos de Contingencia).
* **Consumo:** Power BI Service / Desktop.

* ## 🔄 Flujo de Ejecución Diario y Consolidación (Paso a Paso)

Para garantizar la consistencia analítica y la eliminación de datos huérfanos o duplicados, la rutina diaria sigue una secuencia cronológica rígida automatizada por el archivo de procesamiento por lotes:

1. **Extracción Directa desde la API:** Al ejecutar `actualizar_todo.bat`, el sistema invoca en primer lugar a `proceso_api.py` para descargar la información fresca y depositarla en `tabla_calidad_api`.
2. **Activación del Escudo de Control de Calidad:** Se dispara el procedimiento `CALL sp_validar_y_transferir_lotes();`. Si detecta anomalías biológicas críticas (múltiples lotes activos por granja), aborta la ejecución para proteger el histórico. Si la data está limpia, aplica un formateo `TRIM` riguroso a `granja` y `nombre_galpon` y actualiza la `tabla_usuarios`.
3. **Consolidación Dinámica por Bloques:** Se ejecuta `proceso_acumulativo.py`. Python identifica los lotes activos del día, ejecuta un `DELETE` únicamente sobre sus registros en estado `'ABIERTO'` en la `tabla_acumulativa_lotes`, y sobreescribe la foto corregida vigente de la API. Si un lote activo deja de reportarse (ya no viene en la API), se actualiza automáticamente a estado `'CERRADO'`.
4. **Cálculos Analíticos en Tiempo Real:** Al ser consultadas, las vistas analíticas procesan la data de forma instantánea. `vista_historica_lotes` de-duplica y unifica el identificador espejo del galpón, y la vista maestra `vista_hechos_app` calcula saldos poblacionales, traslados, congelando pesajes fijos y mortalidades acumuladas.

---

## 💻 Guía de Despliegue y Manual de Ejecución en el Ambiente

Siga estos pasos exactos para configurar el entorno y poner en marcha la solución analítica desde cero:

### Paso 1: Ubicación de Scripts y Archivos Locales
1. Descargue los scripts de este repositorio y mueva obligatoriamente los archivos `actualizar_todo.bat`, `proceso_api.py` y `proceso_acumulativo.py` a la ruta física del **Escritorio de Windows** del equipo servidor local.

### Paso 2: Configuración del Motor de Base de Datos (MySQL)
1. Instale **MySQL Server (versión 8.0 o 9.x)** y **MySQL Workbench** en el puerto estándar `3306` con la contraseña de raíz correspondiente.
2. Desde el editor de código, cree el esquema maestro ejecutando: `CREATE DATABASE data_app_carnicos;`.
3. Diríjase al menú superior **Server ➔ Data Import**, seleccione *Import from Self-Contained File*, cargue el archivo de respaldo `Base cárnicos.sql` de este proyecto (asegurándose de marcar las opciones de *Stored Procedures, Triggers y Events*) y presione **Start Import**.

### Paso 3: Preparación de Python y Librerías
1. Instale Python 3.x asegurándose de marcar el check de `[X] Add python.exe to PATH` al inicio del asistente.
2. Abra una consola de comandos de Windows (`cmd`) y ejecute la siguiente instrucción para instalar las dependencias de red de un solo golpe:
   ```bash
   python -m pip install requests pandas mysql-connector-python
   ```
3. Ejecute por primera vez el archivo **`actualizar_todo.bat`** dándole doble clic en el Escritorio para poblar la base de datos con los registros del día.

### Paso 4: Despliegue General y Reconfiguración de Informes (Power BI)

*Por motivos de seguridad y confidencialidad , los archivos originales de diseño no se almacenan en este repositorio y deberán ser compartidos a través de un canal privado seguro.*

1. Instale el componente oficial **MySQL Connector/NET** en el sistema operativo Windows para habilitar el canal de comunicación de Microsoft.
2. Abra los archivos de diseño compartidos en su herramienta **Power BI Desktop** en el siguiente orden secuencial:
   * **`Inicio.pbix`**
   * **`Lotes abiertos.pbix`**
   * **`Lotes cerrados.pbix`**
3. En cada uno de los archivos abiertos, diríjase a la barra superior, haga clic en la flecha de *Transformar datos* ➔ **Configuración de origen de datos**.
4. Seleccione la conexión de base de datos y haga clic en **Cambiar origen**, apuntando el servidor a la base de datos local creada (`localhost` / base de datos: `data_app_carnicos`). Sincronice las credenciales de seguridad de la base de datos con su usuario `root` y contraseña del servidor.
5. De igual manera, identifique los orígenes de archivos planos complementarios y actualice sus rutas apuntando al directorio o carpeta de red local donde se resguarden físicamente los archivos de **Excel** maestros (*Tabla de Indicadores* e *Históricos de Cierre*). Presione **Aplicar cambios**.
6. Realice la publicación individual de los tres informes en el **Power BI Web (Service)** oficial de la empresa dentro del área de trabajo asignada.
7. Una vez publicados los reportes en la nube, extraiga los enlaces URL públicos de acceso de los informes de *Lotes Abiertos* y *Lotes Cerrados*. Abra el archivo de **`Inicio.pbix`**, reconfigure los hipervínculos del menú maestro apuntándolos hacia estas nuevas direcciones URL web y vuelva a publicar el menú central en la nube.
8. **Configuración de Actualización Automática (Gateway):** Ingrese a la consola de administración de Power BI Web corporativo, diríjase a la configuración de los conjuntos de datos publicados y configure la **Puerta de Enlace (On-premises Data Gateway)** de la empresa. Sincronice los permisos de la base de datos local MySQL y las carpetas de Excel para programar las actualizaciones automáticas recurrentes del tablero de forma exitosa.

