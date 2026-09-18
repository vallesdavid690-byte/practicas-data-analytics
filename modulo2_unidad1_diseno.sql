-- Tabla de clientes
CREATE TABLE clientes (
    -- Identificador único del cliente
    id_cliente INT PRIMARY KEY,

    -- Nombre de hasta 100 caracteres
    nombre VARCHAR(100),

    -- Biografía o notas largas del cliente
    perfil_bio TEXT,

    -- Fecha de registro sin incluir la hora
    fecha_registro DATE
);

-- Tabla de productos
CREATE TABLE productos (
    -- Identificador único del producto
    id_producto INT PRIMARY KEY,

    -- Descripción de hasta 255 caracteres
    descripcion VARCHAR(255),

    -- Precio con hasta 10 dígitos y 2 decimales
    precio DECIMAL(10,2),

    -- Cantidad disponible
    stock INT
);