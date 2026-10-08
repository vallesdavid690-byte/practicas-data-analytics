-- =========================================================
-- BodegaTech - Script de Inventario
-- Autor: David
-- Fecha: 2026-09-18
-- =========================================================

-- ================= SECCION DDL =================

-- Elimina la tabla si ya existe para poder ejecutar nuevamente el script.
DROP TABLE IF EXISTS inventario;

-- Crea la estructura de la tabla de inventario.
CREATE TABLE inventario (
    -- INT es adecuado para identificar cada producto con un numero entero.
    id_producto INT PRIMARY KEY,

    -- VARCHAR(100) permite nombres de productos de hasta 100 caracteres.
    nombre_producto VARCHAR(100) NOT NULL,

    -- VARCHAR(50) permite almacenar categorias de longitud variable.
    categoria VARCHAR(50) NOT NULL,

    -- DECIMAL(10,2) conserva exactamente dos decimales en valores monetarios.
    precio_unitario DECIMAL(10,2) NOT NULL,

    -- INT almacena cantidades completas de unidades disponibles.
    stock_actual INT NOT NULL,

    -- INT almacena el umbral minimo de reposicion en unidades completas.
    stock_minimo INT NOT NULL,

    -- DATE almacena la fecha de ingreso sin incluir una hora.
    fecha_ingreso DATE NOT NULL,

    -- PostgreSQL no admite TINYINT(1). SMALLINT permite guardar 0 o 1;
    -- el CHECK impide ingresar cualquier otro valor.
    activo SMALLINT NOT NULL CHECK (activo IN (0, 1))
);

-- ================= SECCION DML =================

-- Carga inicial de los 10 productos del inventario.
INSERT INTO inventario
    (id_producto, nombre_producto, categoria, precio_unitario,
     stock_actual, stock_minimo, fecha_ingreso, activo)
VALUES
    (1, 'Laptop Pro 15',          'Computación',    1200.00, 15,  3, '2024-01-10', 1),
    (2, 'Mouse Inalámbrico',      'Accesorios',       28.00, 80, 10, '2024-01-10', 1),
    (3, 'Monitor 4K 27"',         'Computación',      450.00, 12,  2, '2024-01-15', 1),
    (4, 'Teclado Mecánico',       'Accesorios',       95.00, 40,  5, '2024-01-15', 1),
    (5, 'Laptop Basic 14',        'Computación',      650.00, 20,  3, '2024-02-01', 1),
    (6, 'Auriculares BT Pro',     'Audio',            120.00, 35,  5, '2024-02-01', 1),
    (7, 'Hub USB-C 7 puertos',    'Accesorios',       45.00, 60, 10, '2024-02-10', 1),
    (8, 'Webcam HD 1080p',        'Accesorios',       85.00, 25,  5, '2024-02-10', 1),
    (9, 'SSD Externo 1TB',        'Almacenamiento',  130.00, 18,  3, '2024-03-01', 1),
    (10, 'Parlante Bluetooth',    'Audio',             60.00, 45,  8, '2024-03-01', 1);

-- Actualiza el stock por las ventas del dia.
-- Se vendieron 3 unidades de Laptop Pro 15: 15 - 3 = 12.
UPDATE inventario
SET stock_actual = stock_actual - 3
WHERE id_producto = 1;

-- Se vendieron 12 unidades de Mouse Inalambrico: 80 - 12 = 68.
UPDATE inventario
SET stock_actual = stock_actual - 12
WHERE id_producto = 2;

-- Se vendieron 5 unidades de Auriculares BT Pro: 35 - 5 = 30.
UPDATE inventario
SET stock_actual = stock_actual - 5
WHERE id_producto = 6;

-- Marca la Webcam HD 1080p como descontinuada.
UPDATE inventario
SET activo = 0
WHERE id_producto = 8;

-- Validacion final: muestra los 10 productos con los cambios aplicados.
SELECT * FROM inventario;
