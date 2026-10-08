-- ============================================================
-- RetailPro - Pre-entrega 5: Consultas con JOINs
-- Titulo: Cruzando tablas para enriquecer el analisis
-- Autor: David
-- Fecha: 2026-10-08
-- Base de datos: Ventas_Tech_DB
-- ============================================================

-- Este archivo utiliza las tablas creadas en el Modulo 3:
-- clientes, categorias, productos y ventas.


-- ============================================================
-- CONSULTA 1: VISTA BASE DEL PROYECTO (INNER JOIN)
-- Combina cada venta con la informacion descriptiva del cliente,
-- el producto y su categoria. Esta vista puede usarse en Power BI.
-- ============================================================

SELECT
    v.id_venta,
    v.fecha_venta,
    c.id_cliente,
    c.nombre AS nombre_cliente,
    c.email,
    c.ciudad AS ciudad_cliente,
    p.id_producto,
    p.nombre_producto AS descripcion_producto,
    cat.nombre_categoria AS categoria_producto,
    v.cantidad,
    v.precio_unitario,
    ROUND(v.cantidad * v.precio_unitario, 2) AS total_venta
FROM ventas AS v
INNER JOIN clientes AS c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos AS p
    ON v.id_producto = p.id_producto
INNER JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria
ORDER BY v.fecha_venta, v.id_venta;


-- ============================================================
-- CONSULTA 2: CLIENTES SIN VENTAS (LEFT JOIN)
-- Conserva todos los clientes y selecciona solamente aquellos
-- para los que no existe ninguna venta relacionada.
-- ============================================================

SELECT
    c.id_cliente,
    c.nombre AS nombre_cliente,
    c.email,
    c.fecha_registro
FROM clientes AS c
LEFT JOIN ventas AS v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL
ORDER BY c.id_cliente;


-- ============================================================
-- CONSULTA 3: PRODUCTOS SIN VENTAS (LEFT JOIN)
-- Conserva todo el catalogo y selecciona solamente los productos
-- que nunca aparecen en una transaccion de ventas.
-- ============================================================

SELECT
    p.id_producto,
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    p.precio
FROM productos AS p
INNER JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria
LEFT JOIN ventas AS v
    ON p.id_producto = v.id_producto
WHERE v.id_venta IS NULL
ORDER BY p.id_producto;


-- ============================================================
-- CONSULTA 4: CONSOLIDADO POR ORIGEN (UNION ALL)
-- La columna canal se crea como un valor literal. Como el esquema
-- no almacena el canal real, se utilizan dos periodos de ventas.
-- Los rangos son excluyentes y cada venta se contabiliza una vez.
-- Resultado esperado con los datos del Modulo 3:
-- Periodo 05-10 Mar = 3620.00
-- Periodo 11-15 Mar = 2824.00
-- ============================================================

SELECT
    canal,
    ROUND(SUM(total), 2) AS total_canal
FROM (
    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total,
        'Periodo 05-10 Mar' AS canal
    FROM ventas
    WHERE fecha_venta BETWEEN DATE '2024-03-05' AND DATE '2024-03-10'

    UNION ALL

    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total,
        'Periodo 11-15 Mar' AS canal
    FROM ventas
    WHERE fecha_venta BETWEEN DATE '2024-03-11' AND DATE '2024-03-15'
) AS consolidado
GROUP BY canal
ORDER BY canal;
