# RetailPro — Proyecto de análisis de ventas

RetailPro es un proyecto académico de análisis de datos construido sobre la base PostgreSQL `Ventas_Tech_DB`. Integra diseño de tablas, carga de datos, consultas de negocio y cruces mediante `JOIN` para obtener información útil sobre facturación, productos, clientes y periodos de venta.

## Objetivo del proyecto

El objetivo es transformar datos transaccionales en información comprensible para el equipo comercial. El repositorio permite:

- Crear el modelo relacional de ventas.
- Cargar un conjunto de datos de prueba.
- Calcular métricas mensuales y rankings de productos.
- Identificar clientes recurrentes y registros sin ventas.
- Construir una vista detallada que puede conectarse a Power BI.

## Estructura del repositorio

| Carpeta | Archivo principal | Contenido |
|---|---|---|
| `M1/` | `modulo2_unidad1_diseno.sql` | Creación básica de tablas. |
| `M2/` | `modulo2_unidad2_inventario.sql` | Administración de inventario con DDL y DML. |
| `M3/` | `ventas_tech_db.sql` | Esquema relacional, restricciones y carga inicial. |
| `M4/` | `m4_consultas_negocio.sql` | Métricas y consultas de negocio. |
| `M5/` | `m5_consultas_joins.sql` | Consultas con `INNER JOIN`, `LEFT JOIN` y `UNION ALL`. |

Las próximas entregas se incorporarán en carpetas independientes para mantener la trazabilidad del proyecto.

## Modelo de datos

El modelo utiliza cuatro tablas principales:

- `categorias`: catálogo de categorías.
- `productos`: productos relacionados con una categoría mediante `id_categoria`.
- `clientes`: información básica de los clientes.
- `ventas`: transacciones relacionadas con clientes y productos mediante `id_cliente` e `id_producto`.

Relaciones:

- `categorias (1) → (N) productos`
- `clientes (1) → (N) ventas`
- `productos (1) → (N) ventas`

Las claves primarias, claves foráneas y restricciones `CHECK` protegen la integridad de los datos.

## Herramientas utilizadas

- PostgreSQL
- pgAdmin 4
- SQL
- Power BI
- Git y GitHub
- ChatGPT como apoyo para documentación y revisión, con validación manual de resultados

## Requisitos previos

1. Tener PostgreSQL y pgAdmin 4 instalados.
2. Crear una base de datos llamada `Ventas_Tech_DB`.
3. Disponer de permisos para crear y modificar tablas.
4. Descargar o clonar este repositorio.

## Cómo ejecutar el proyecto

1. Abrir pgAdmin 4 y conectarse al servidor PostgreSQL.
2. Seleccionar la base de datos `Ventas_Tech_DB`.
3. Abrir **Query Tool**.
4. Ejecutar primero `M3/ventas_tech_db.sql` para crear y cargar el modelo.
5. Ejecutar `M4/m4_consultas_negocio.sql` para obtener las métricas comerciales.
6. Ejecutar `M5/m5_consultas_joins.sql` para analizar los cruces entre tablas.
7. Revisar cada resultado en **Data Output** antes de utilizarlo en un informe.

> Los scripts de `M1` y `M2` son prácticas independientes y no son necesarios para ejecutar el flujo principal de RetailPro.

## Consultas de negocio de M4

El archivo `M4/m4_consultas_negocio.sql` incluye:

1. Resumen ejecutivo mensual.
2. Ranking de los cinco productos con mayor facturación.
3. Identificación de clientes recurrentes.
4. Comparación de la facturación mensual con el promedio general.

## Consultas relacionales de M5

El archivo `M5/m5_consultas_joins.sql` incluye:

1. Vista detallada de ventas mediante `INNER JOIN`.
2. Identificación de clientes sin ventas mediante `LEFT JOIN`.
3. Identificación de productos sin ventas mediante `LEFT JOIN`.
4. Consolidación de periodos mediante `UNION ALL`.

## Validación de resultados

Antes de comunicar un hallazgo:

- Comparar los totales con la tabla `ventas`.
- Confirmar que los `JOIN` no dupliquen transacciones.
- Verificar que cada número pueda rastrearse hasta su consulta y fuente.
- Interpretar los resultados considerando el tamaño y el periodo de la muestra.
- Revisar manualmente cualquier código o conclusión sugerida por IA.

## Autor

David Valles
