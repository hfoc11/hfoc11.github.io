# Contribuir a la documentación

Gracias por ayudar a mantener la documentación clara y útil. Siga estas pautas:

1. Ramas y flujo de trabajo
- Cree una rama por cambio: `docs/<tema>-<breve-descripción>`.
- Abra un Pull Request contra `main` cuando el cambio esté listo.

2. Estructura de archivos
- Escriba especificaciones en `docs/specs/`.
- Coloque diagramas en `docs/diagrams/` (archivos vectoriales o PNG optimizados).
- Registre decisiones en `docs/adr/` siguiendo el formato ADR (titulo, contexto, decisión).

3. Formato y convenciones
- Markdown estándar; use encabezados claros y tablas cuando corresponda.
- Añada front matter si planea publicar con Jekyll/MkDocs.

4. Revisión y aprobaciones
- Asigne revisores relevantes y responda a comentarios de PR.

5. Commits y mensajes
- Use mensajes claros: `docs(spec): añadir especificación de programación de viajes`.

6. Imágenes y recursos
- No suba archivos muy pesados; prefiera SVG para diagramas y PNG comprimido para capturas.

7. Diagramas con Mermaid
- Preferimos diagramas en Mermaid embebidos en Markdown (`docs/diagrams/*.md`).
- Use bloques fenced con `mermaid` y nombre los archivos de forma descriptiva: `architecture.md`, `process-flow.md`.
- Para previsualizar localmente use la extensión **Mermaid Preview** en VS Code o genere el sitio con MkDocs + `mkdocs-mermaid2-plugin`.

8. Publicar la documentación

- Localmente: instale dependencias y pruebe el servidor:

```bash
python -m pip install -r requirements.txt
mkdocs serve
```

- Despliegue automático: el workflow `/.github/workflows/deploy-docs.yml` construye el sitio y publica `site/` en GitHub Pages.

