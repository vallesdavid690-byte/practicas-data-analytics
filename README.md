# Prácticas de SQL – Data Analytics

Este repositorio contiene los ejercicios y pre-entregas realizados durante el curso de Data Analytics.

## Estructura del repositorio

| Carpeta | Archivo | Contenido |
|---|---|---|
| `M1/` | `modulo2_unidad1_diseno.sql` | Creación básica de tablas. |
| `M2/` | `modulo2_unidad2_inventario.sql` | Administración del inventario con DDL y DML. |
| `M3/` | `ventas_tech_db.sql` | Base de datos de ventas, relaciones y carga inicial. |
| `M4/` | `m4_consultas_negocio.sql` | Consultas SQL y métricas de negocio. |
| `M5/` | `m5_consultas_joins.sql` | Consultas con INNER JOIN, LEFT JOIN y UNION ALL. |

Las siguientes entregas se agregarán en su propia carpeta para mantener una estructura clara: `M6/`, `M7/`, etc.

## Herramientas utilizadas

- PostgreSQL
- pgAdmin 4
- GitHub

## Cómo ejecutar el proyecto

1. Abrir pgAdmin 4.
2. Crear o seleccionar la base de datos `ventas_tech_db`.
3. Abrir **Query Tool**.
4. Ejecutar primero `M3/ventas_tech_db.sql`.
5. Ejecutar después `M4/m4_consultas_negocio.sql` o `M5/m5_consultas_joins.sql`.
6. Revisar los resultados en **Data Output**.

> Los archivos de M1 y M2 corresponden a prácticas anteriores y pueden ejecutarse de manera independiente.

## Contenido de M4

El archivo `M4/m4_consultas_negocio.sql` incluye:

1. Resumen ejecutivo mensual.
2. Los cinco productos con mayor facturación.
3. Identificación de clientes recurrentes.
4. Comparación de la facturación mensual con el promedio general.

## Contenido de M5

El archivo `M5/m5_consultas_joins.sql` incluye:

1. Vista detallada de ventas mediante `INNER JOIN`.
2. Identificación de clientes sin ventas mediante `LEFT JOIN`.
3. Identificación de productos sin ventas mediante `LEFT JOIN`.
4. Consolidación de periodos de ventas mediante `UNION ALL`.

## Autor

David Valles
