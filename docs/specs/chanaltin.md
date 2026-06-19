# 1. Sistema Avanzado de Programación de Viajes (Trip Scheduling)

El Sistema Avanzado de Programación de Viajes para Chanaltín centraliza la planificación, validación de seguridad y control de costos. Su objetivo es reemplazar el uso de Excel y procesos manuales por un flujo integrado en Odoo v18.

## 1. Gestión de Insumos para la Programación
El proceso inicia cuando se recibe la necesidad de servicio y requiere consolidar los siguientes datos maestros:

- **Asignación multivariable:** Unidad (tracto), Carreta, Conductor titular y, en rutas largas, Conductor asistente.
- **Definición de rutas:** Clasificación entre *Rutas Cortas* y *Rutas Largas* para aplicar reglas de descanso y viáticos.
- **Tercerización:** Posibilidad de asignar viajes a proveedores terceros, generando una Orden de Servicio vinculada para controlar el costo.

## 2. Motor de Validaciones Críticas (Lógica avanzada)
Validaciones automáticas antes de confirmar una programación:

- **Control de descansos:** Si un conductor realiza una ruta larga, no debe programarse inmediatamente otra ruta larga.
- **Disponibilidad documental:** Bloqueo si la unidad o el conductor tienen documentos vencidos (SOAT, revisión técnica, brevete, SCTR, etc.).
- **Estado de mantenimiento:** Sincronización con el módulo de taller para impedir despachos si hay mantenimiento crítico pendiente.

## 3. Ejecución y seguimiento de viaje
Durante y después del viaje se registran y gestionan:

- **Documentación de salida:** Generación o vinculación de Guía de Remisión Transportista electrónica.
- **Carga operativa:** Registro de capacidad vs. carga real.
- **Integración de viáticos:** Conexión con el módulo de Gastos para liquidar montos por placa y ruta.

## 4. Cierre operativo y "data sucia"
Al retorno, el planificador cierra el viaje y alimenta el repositorio operacional ("data sucia") para KPIs:

- **KPI Entrega Perfecta:** Incidencias (faltantes, daños, demoras).
- **Tiempos de atención:** Horas de llegada, inicio de descarga y salida en CDs.
- **Gestión de retornos:** Indicador de retorno con/sin carga que impacta rentabilidad por placa.

## 5. Integración con planilla y contabilidad
Automatizaciones administrativas relacionadas con la programación:

- **Cálculo de incentivos:** Pagos variables a conductores basados en viajes y retornos.
- **Valor referencial MTC:** Cálculo automatizado para detracciones (4%).

---

## Fase 1.5 — Inventario y Surtidor (Control de insumos críticos)
Objetivo: trazabilidad total de combustible y repuestos por unidad.

### 1. Configuración de sedes y almacenes

- Almacenes físicos (ej. Huara 80%, Arequipa 20%).
- Ubicaciones internas por repuestos, neumáticos, lubricantes y tanque de combustible.

### 2. Gestión del surtidor

- Productos con UoM estrictas: petróleo (galones), urea (litros).
- Registro de ingresos masivos (tanques) y despacho rápido ligado a placa y kilometraje.

### 3. Desglose de kits de repuestos

- Recepción automática que desglosa kits en componentes individuales para control de saldos.

### 4. Flujo virtual de solicitud y aprobación (Arequipa)

- Solicitud virtual en Odoo, validación por responsable en Huara antes del consumo.

### 5. Control financiero de inventarios

- Método AVCO (costo promedio ponderado) y bloqueo de stock negativo.

### 6. Vinculación con centros de costo

- Cada salida genera un asiento contable afectando la cuenta analítica de la placa o centro de costo.

---

## 2. Motor de integración con GPS (PRODCOM / FROTCOM)
Objetivo: automatizar la captura de datos operativos desde GPS.

### Funcionalidades clave

- **Kilometraje y horómetro:** importación automática de odómetros y horas motor; disparadores de mantenimiento.
- **Telemetría de combustible:** comparación galones abastecidos vs. consumo registrado; KPI de rendimiento.
- **Control de tiempos en CDs:** registro automático de llegada, inicio de descarga y salida.
- **Alimentación de la "data sucia":** trazabilidad de ruta y ubicación en tiempo real.

Estrategia: esta integración se plantea como fase posterior (Fase 4) tras estabilizar procesos base en Odoo.

---

## 3. Digitalización de la "data sucia" y dashboard de KPIs
Objetivo: convertir el repositorio Excel en un flujo automatizado que alimente tableros en Odoo.

### Datos a digitalizar

- Métricas de carga (capacidad vs. carga real).
- Tiempos reales (salida, llegada, inicio y fin de descarga, retorno).
- Calidad del servicio (campo Entrega Perfecta y motivos de incumplimiento).
- Logística de retornos y estado de operatividad por unidad.

### KPIs sugeridos

- Rentabilidad por placa.
- Rendimiento de combustible.
- Eficiencia por ruta.
- Productividad de conductores.
- Disponibilidad de flota.

---

## 4. Control de conductores y seguridad vial

### Gestión documental y alertas

- Maestro de conductores con SCTR, tipo de brevete y fechas de vencimiento.
- Notificaciones y bloqueos automáticos ante vencimientos.

### Lógica de descansos y registro de horas

- Implementar regla para rutas largas y trazabilidad de horas de conducción.

### Récord e incidencias

- Historial disciplinario digital, papeletas, memorándums e infracciones.

### Conductores terceros

- Homologación, controles documentales y lista negra operativa.

### Deslinde de responsabilidades

- Checklists de entrega/recepción con evidencias fotográficas.

---

## 5. Flujo de checklists operativos integrados

### Tipos de checklists

- Checklist operativo (salida y retorno).
- Checklist de entrega y recepción entre conductores.

### Funcionalidad móvil y multimedia

- Formularios móviles, evidencias fotográficas y firmas digitales.

### Integración con mantenimiento

- Disparador de solicitudes y bloqueo preventivo si hay observaciones críticas.

### KPIs derivados

- Tiempo de respuesta del taller y reincidencia de observaciones.

---

## 6. Gestión de terceros (subarriendo de fletes)

### Modelo operativo

- Gestión simultánea de la venta al cliente y compra del servicio al tercero.
- Volumen estimado: ~15 unidades tercerizadas por día.

### Registro y homologación

- Maestros de proveedores, conductores y unidades; control documental preventivo.

### Control de márgenes y flujo documental

- Validación de margen en tiempo real al generar la OS.
- Emisión de guías y cálculo automático de detracciones (4%).

### Seguridad y contratos

- Bloqueos por documentos vencidos o incidencias; diseño preparado para evolución a contratos marco.

---

## Conclusión
La implementación propuesta transforma el rol del planificador de flota de digitador a gestor, apoyado en alertas, validaciones y KPIs en tiempo real. El camino recomendado es comenzar por estabilizar el proceso operativo base en Odoo y luego iterar fases (inventario, GPS, KPIs, terceros).
