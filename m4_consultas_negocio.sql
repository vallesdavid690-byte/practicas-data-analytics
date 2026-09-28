-- ============================================================
-- RetailPro - Pre-entrega: Consultas SQL de negocio
-- Autor: David
-- Fecha: 2026-09-28
-- Base de datos: Ventas_Tech_DB
-- Tabla utilizada: ventas
-- ============================================================

-- ============================================================
-- CONSULTA 1: RESUMEN EJECUTIVO MENSUAL
-- Muestra el total facturado, la cantidad de pedidos y el ticket
-- promedio de cada mes.
-- ============================================================
SELECT
    EXTRACT(MONTH FROM fecha_venta) AS mes,
    ROUND(SUM(cantidad * precio_unitario), 2) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    ROUND(AVG(cantidad * precio_unitario), 2) AS ticket_promedio
FROM ventas
GROUP BY EXTRACT(MONTH FROM fecha_venta)
ORDER BY mes;


-- ============================================================
-- CONSULTA 2: RANKING DE PRODUCTOS
-- Muestra los 5 productos con mayor facturacion, junto con las
-- unidades vendidas y el total generado.
-- ============================================================
SELECT
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    ROUND(SUM(cantidad * precio_unitario), 2) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY total_generado DESC
LIMIT 5;


-- ============================================================
-- CONSULTA 3: CLIENTES RECURRENTES
-- Muestra solamente los clientes que realizaron mas de un pedido,
-- indicando su cantidad de pedidos y el total gastado.
-- ============================================================
SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    ROUND(SUM(cantidad * precio_unitario), 2) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY total_gastado DESC;


-- ============================================================
-- CONSULTA 4: MESES POR ENCIMA O POR DEBAJO DEL PROMEDIO
-- Primero calcula la facturacion de cada mes. Luego compara cada
-- resultado con el promedio mensual general mediante CASE WHEN.
-- ============================================================
WITH facturacion_mensual AS (
    SELECT
        EXTRACT(MONTH FROM fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY EXTRACT(MONTH FROM fecha_venta)
)
SELECT
    mes,
    ROUND(total_facturado, 2) AS total_facturado,
    ROUND((SELECT AVG(total_facturado) FROM facturacion_mensual), 2)
        AS promedio_mensual_general,
    CASE
        WHEN total_facturado >= (
            SELECT AVG(total_facturado)
            FROM facturacion_mensual
        ) THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM facturacion_mensual
ORDER BY mes;


-- ============================================================
-- HALLAZGOS DE NEGOCIO
-- 1. La facturacion total registrada es de 6444.00, distribuida en
--    10 pedidos, con un ticket promedio general de 644.40.
-- 2. El producto con id_producto = 1 lidera el ranking: genero
--    3600.00 con 3 unidades vendidas, equivalente al 55.87 % de
--    toda la facturacion registrada.
-- 3. Todos los clientes son recurrentes porque realizaron 2 pedidos.
--    Los clientes 1 y 5 concentran juntos 4740.00, equivalente al
--    73.56 % de la facturacion total.
-- ============================================================
