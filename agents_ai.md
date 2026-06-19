# Instrucciones para agentes IA: publicar este repositorio en GitHub Pages

Objetivo: guiar a otra IA (o script automatizado) para publicar la documentación contenida en este repositorio en GitHub Pages.

1) Información necesaria (proveer antes de proceder)
- **Repositorio remoto**: URL completa `https://github.com/<usuario>/<repositorio>.git` o `git@github.com:<usuario>/<repositorio>.git`.
- **Rama principal**: nombre de la rama fuente (por defecto `main`).
- **Método de autenticación**: indicar si se usará `GITHUB_TOKEN` (workflow Actions) o un PAT (Personal Access Token) con scope `repo` para empujar ramas.
- **Destino Pages**: rama objetivo para Pages (por ejemplo `gh-pages`) o usar el workflow existente que publica mediante Actions.
- **Dominio personalizado** (opcional): si existe, indicar el `CNAME` a añadir.
- **Autor y mensaje de commit** (opcional): nombre y email para commits automáticos.

2) Opciones de despliegue (elige una)

- A. Usar workflow de GitHub Actions (recomendado):
  - Requisito: push a la rama `main` (o la rama configurada) activará `.github/workflows/deploy-docs.yml` que ya está presente.
  - Credenciales: solo necesita `GITHUB_TOKEN` (proporcionado por Actions). Si la IA empuja cambios remotos, necesita un PAT con permisos `repo`.
  - Flujo:
    1. Confirmar que el repo remoto apunta a la URL indicada.
    2. `git push origin main` con las ramas actualizadas.
    3. Monitorizar GitHub Actions hasta completar la job `Deploy docs to GitHub Pages`.

- B. Publicar manualmente (ghp-import):
  - Requisito: acceso con PAT o push autorizado para crear/actualizar la rama `gh-pages`.
  - Comandos (desde la raíz del repo, en entorno con Python y mkdocs instalado):

```bash
# Construir el sitio
.venv/Scripts/python.exe -m mkdocs build  # Windows
./.venv/bin/python -m mkdocs build         # WSL/macOS/Linux

# Publicar con ghp-import (empuja site/ a gh-pages)
.venv/Scripts/python.exe -m pip install ghp-import
.venv/Scripts/python.exe -m ghp_import -n -p -f site
```

3) Pasos mínimos para un agente con PAT (push directo)

```bash
git remote add origin https://<token>@github.com/<usuario>/<repositorio>.git
git branch -M main
git add .
git commit -m "chore(docs): publicar site"
git push -u origin main
```

Nota: incluir el token en la URL expone el secreto en el historial del agente; es preferible usar `git push` con credenciales seguras o crear un workflow que use `GITHUB_TOKEN`.

4) Verificaciones que debe devolver el agente
- URL pública del site (por ejemplo `https://<usuario>.github.io/<repositorio>/`).
- Estado del workflow (si se utilizó Actions): `success` o `failed` y link al run.
- Logs relevantes (salida `mkdocs build` o errores de Actions).

5) Recomendaciones de seguridad y permisos
- No incluir PATs en ficheros del repo. Si la IA necesita un token, pídelo al usuario y úsalo solo en memoria para la sesión.
- Preferir la publicación mediante GitHub Actions (usa `GITHUB_TOKEN`) para no transferir credenciales.

6) Errores comunes y cómo manejarlos
- Workflow falló: revisar Actions → Logs. Reintentar push tras corregir errores de build.
- Permiso denegado al empujar: el token no tiene scope `repo` o falta acceso de escritura.
- Archivos grandes o binarios: evitar subir assets pesados al repo; usar releases o almacenamiento externo.

7) Resultado final esperado
- Confirmación con la URL pública y una captura breve del estado (ej.: "Deploy succeed, site available at https://... ").

Si me provees la URL del repositorio y confirmas el método de despliegue (workflow o ghp-import con PAT), puedo: 1) preparar el commit/PR necesario, 2) empujar los cambios o 3) disparar el workflow y monitorizar el resultado.
