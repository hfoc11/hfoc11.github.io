#!/usr/bin/env pwsh
<#
Script para crear/activar un virtualenv, instalar dependencias y servir la
documentacion con MkDocs.

Uso: abrir PowerShell en la raiz del repo y ejecutar .\scripts\serve-docs.ps1
#>

param(
    [string]$EnvDir = ".venv"
)

if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
    Write-Error "Python no esta en PATH. Instala Python 3.x antes de continuar."
    exit 1
}

if (-not (Test-Path $EnvDir)) {
    Write-Host "Creando entorno virtual en $EnvDir..."
    python -m venv $EnvDir
}

$activate = Join-Path $EnvDir "Scripts\Activate.ps1"
if (-not (Test-Path $activate)) {
    Write-Error ("No se encontro el script de activacion: {0}" -f $activate)
    exit 1
}

Write-Host "Activando entorno virtual..."
. $activate

Write-Host "Actualizando pip e instalando dependencias desde requirements.txt..."
python -m pip install --upgrade pip
pip install -r requirements.txt

Write-Host "Iniciando MkDocs en 0.0.0.0:8000 (accesible desde esta máquina) - presiona Ctrl+C para detener"
python -m mkdocs serve -a 0.0.0.0:8000
