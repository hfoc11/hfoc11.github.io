#!/usr/bin/env pwsh
<#
Inicia MkDocs en segundo plano y guarda logs en logs/mkdocs.log
Uso: ejecutar desde la raiz del repo: .\scripts\serve-docs-bg.ps1
#>

$logDir = "logs"
if (-not (Test-Path $logDir)) { New-Item -ItemType Directory -Path $logDir | Out-Null }

$envDir = ".venv"
$venvPython = Join-Path $envDir "Scripts\python.exe"
if (Test-Path $venvPython) { $exe = $venvPython } else { $exe = "python" }

$args = "-m mkdocs serve -a 0.0.0.0:8000"

$outLog = Join-Path $logDir "mkdocs_out.log"
$errLog = Join-Path $logDir "mkdocs_err.log"

$cwd = (Get-Location).Path
Write-Host "Iniciando MkDocs en segundo plano... logs en $outLog y $errLog (working dir: $cwd)"
# Lanza PowerShell que activa el venv y ejecuta mkdocs; esto evita problemas con pyvenv.cfg
$venvPythonFull = Join-Path $cwd "$envDir\Scripts\python.exe"
if (Test-Path $venvPythonFull) {
	$activateFull = Join-Path $cwd ".venv\Scripts\Activate.ps1"
	$psCmd = "& { . '$activateFull'; python -m mkdocs serve -a 0.0.0.0:8000 }"
} else {
	$psCmd = "python -m mkdocs serve -a 0.0.0.0:8000"
}

Start-Process -FilePath "powershell" -ArgumentList "-NoProfile","-Command",$psCmd -RedirectStandardOutput $outLog -RedirectStandardError $errLog -WorkingDirectory $cwd -WindowStyle Hidden

Write-Host "Proceso iniciado en una nueva PowerShell. Revisa $outLog y $errLog para salida." 
