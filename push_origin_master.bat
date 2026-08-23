@echo off
:: Cambia a la ruta de tu repositorio

echo === Iniciando proceso Git Automatico ===

:: 1. Agregar todos los cambios
echo Agregando archivos...
git add .
if %errorlevel% neq 0 goto error

:: 2. Generar fecha y hora para el mensaje
set "fecha=%date%"
set "hora=%time:~0,5%"
set "mensaje=subiendo pagina %fecha% %hora%"

:: 3. Crear el commit
echo Creando commit: "%mensaje%"
git commit -m "%mensaje%"
if %errorlevel% neq 0 goto error

:: 4. Subir al repositorio remoto
echo Subiendo cambios a master...
git push origin master
if %errorlevel% neq 0 goto error

echo === Proceso completado con exito ===
timeout /t 5
exit

:error
echo.
echo [ERROR] Hubo un problema al ejecutar los comandos de Git.
pause