#!/usr/bin/env bash
# Script para WSL / Linux / macOS: crea venv, instala deps y sirve MkDocs
set -euo pipefail

REPO_DIR="/mnt/d/CHANALTIL"
ENV_DIR=".venv"

cd "$REPO_DIR"

if ! command -v python >/dev/null 2>&1; then
  echo "Python no está disponible en WSL. Instala Python 3.x dentro de WSL." >&2
  exit 1
fi

if [ ! -d "$ENV_DIR" ]; then
  echo "Creando entorno virtual en $ENV_DIR..."
  python -m venv "$ENV_DIR"
fi

echo "Activando entorno virtual..."
# shellcheck disable=SC1091
source "$ENV_DIR/bin/activate"

echo "Actualizando pip e instalando dependencias..."
python -m pip install --upgrade pip
pip install -r requirements.txt

echo "Iniciando MkDocs (http://127.0.0.1:8000) — presiona Ctrl+C para detener"
mkdocs serve
