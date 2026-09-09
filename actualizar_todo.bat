@echo off
title Actualizador de API Carnicos
echo ===================================================
echo   DESCARGANDO DATOS DE LA API Y ACTUALIZANDO MYSQL
echo ===================================================
echo.

cd /d "%userprofile%\Desktop"

echo [1/2] Actualizando tabla de Lotes Activos...
python proceso_api.py

:: BLOQUEO DE SEGURIDAD CRÍTICO: Si proceso_api.py falla o arroja la alerta roja, aborta el .bat de inmediato
if errorlevel 1 (
    echo.
    echo [ALERTA] Proceso detenido en el Paso 1 por control de calidad. 
    echo No se ejecutara el proceso acumulativo para proteger el historico.
    echo.
    goto fin
)

echo [2/2] Actualizando tabla Acumulativa Historica...
python proceso_acumulativo.py
echo.

echo ===================================================
echo   ┬íPROCESO COMPLETADO EXITOSAMENTE EN MYSQL!
echo ===================================================
echo.

:fin
pause

