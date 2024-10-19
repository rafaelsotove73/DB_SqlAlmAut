-- // ##################################################
-- // ### QUERY BASE >>> PARA BASE DE DATOS
-- // ##################################################
-- // ##################################################
CREATE TABLE [Buy].Proveedores (
    ProveedorID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
	Apellido NVARCHAR(100) NOT NULL,
	RazonSocial NVARCHAR(100) NOT NULL,
    Direccion NVARCHAR(255),
    Telefono NVARCHAR(20),
    Email NVARCHAR(100),
    Contacto NVARCHAR(100)
);


-- Tabla de Productos
CREATE TABLE [WareHouse].Productos (
    ProductoID INT PRIMARY KEY IDENTITY(1,1),
	Codigo NVARCHAR(10) NOT NULL,
    Nombre NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(255),
    Precio DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL
);

-- Tabla para el encabezado del albarán
CREATE TABLE [Buy].AlbaranCompraEncabezado (
    AlbaranCompraID INT PRIMARY KEY IDENTITY(1,1),
    Fecha DATE NOT NULL,
    ProveedorID INT NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    Estado NVARCHAR(50) NOT NULL DEFAULT 'Pendiente', -- Por ejemplo: Pendiente, Recibido, Facturado
    Observaciones NVARCHAR(255),
    CONSTRAINT FK_Proveedor FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID)
);

-- Tabla para los detalles del albarán
CREATE TABLE [Buy].AlbaranCompraDetalle (
    DetalleID INT PRIMARY KEY IDENTITY(1,1),
    AlbaranCompraID INT NOT NULL,
    ProductoID INT NOT NULL,
    Cantidad INT NOT NULL,
    PrecioCompra DECIMAL(10, 2) NOT NULL, -- Precio de compra del producto
    Subtotal AS (Cantidad * PrecioCompra) PERSISTED,  -- Cálculo automático del subtotal
    CONSTRAINT FK_AlbaranCompra FOREIGN KEY (AlbaranCompraID) REFERENCES AlbaranCompraEncabezado(AlbaranCompraID),
    CONSTRAINT FK_Producto FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- Índices recomendados
CREATE INDEX IX_AlbaranCompraEncabezado_Fecha ON [Buy].AlbaranCompraEncabezado (Fecha);
CREATE INDEX IX_AlbaranCompraDetalle_ProductoID ON [Buy].AlbaranCompraDetalle (ProductoID);

-- Trigger para actualizar el total en AlbaranCompraEncabezado al insertar o actualizar detalles
CREATE TRIGGER trg_ActualizarTotalAlbaranCompra
ON [Buy].AlbaranCompraDetalle
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @AlbaranCompraID INT;
    SELECT @AlbaranCompraID = INSERTED.AlbaranCompraID FROM INSERTED;

    UPDATE AlbaranCompraEncabezado
    SET Total = (
        SELECT SUM(Cantidad * PrecioCompra)
        FROM AlbaranCompraDetalle
        WHERE AlbaranCompraID = @AlbaranCompraID
    )
    WHERE AlbaranCompraID = @AlbaranCompraID;
END;

--- ======================================
--- ======================================

CREATE TABLE [WareHouse].Almacenes (
    AlmacenID INT PRIMARY KEY IDENTITY(1,1),
	Codigo NVARCHAR(10) NOT NULL,
    Nombre NVARCHAR(100) NOT NULL,
    Direccion NVARCHAR(255)
);

-- Tabla de Estanterías (cada estante dentro de un almacén)
CREATE TABLE [WareHouse].Estanterias (
    EstanteriaID INT PRIMARY KEY IDENTITY(1,1),
	Codigo NVARCHAR(10) NOT NULL,
    AlmacenID INT NOT NULL,
    Descripcion NVARCHAR(100), -- Por ejemplo: "Estante A", "Estante B"
    CONSTRAINT FK_Almacen FOREIGN KEY (AlmacenID) REFERENCES Almacenes(AlmacenID)
);

-- Tabla de Ubicaciones en los estantes (niveles y tramos dentro de cada estante)
CREATE TABLE [WareHouse].Ubicaciones (
    UbicacionID INT PRIMARY KEY IDENTITY(1,1),
	Codigo NVARCHAR(10) NOT NULL,
    EstanteriaID INT NOT NULL,
    Nivel INT NOT NULL,  -- Nivel dentro del estante (por ejemplo, nivel 1, nivel 2)
    Tramo INT NOT NULL,  -- Tramo dentro del nivel (por ejemplo, tramo 1, tramo 2)
    CONSTRAINT FK_Estanteria FOREIGN KEY (EstanteriaID) REFERENCES Estanterias(EstanteriaID)
);

-- Tabla para el inventario de productos en almacenes (ubicación y cantidad)
CREATE TABLE [WareHouse].Inventario (
    InventarioID INT PRIMARY KEY IDENTITY(1,1),
    ProductoID INT NOT NULL,
    UbicacionID INT NOT NULL,
    Cantidad INT NOT NULL,
    CONSTRAINT FK_Product FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID),
    CONSTRAINT FK_Ubicacion FOREIGN KEY (UbicacionID) REFERENCES Ubicaciones(UbicacionID)
);

-- // ====================================================

-- Tabla de Trabajadores (humanos que realizan movimientos en el almacén)
CREATE TABLE [WareHouse].Trabajadores (
    TrabajadorID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Apellido NVARCHAR(100) NOT NULL,
    Cargo NVARCHAR(50) -- Cargo dentro de la empresa (ejemplo: Operador, Supervisor)
);

-- Tabla de Tipos de Bot
CREATE TABLE [WareHouse].TiposBot (
    TipoBotID INT PRIMARY KEY IDENTITY(1,1),
    Descripcion NVARCHAR(100) NOT NULL  -- Descripción del tipo de bot (ejemplo: Recepción, Entrada, Salida, Movimiento)
);

-- Tabla de Bots (con serial)
CREATE TABLE [WareHouse].Bots (
    BotID INT PRIMARY KEY IDENTITY(1,1),
    CodigoBot NVARCHAR(50) NOT NULL,  -- Identificador del bot
    Serial NVARCHAR(100) NOT NULL,    -- Serial único del bot
    TipoBotID INT NOT NULL,
    CONSTRAINT FK_TipoBot FOREIGN KEY (TipoBotID) REFERENCES TiposBot(TipoBotID)
);

-- Tabla de Tipos de Movimiento (Entrada, Salida, Movimiento)
CREATE TABLE [WareHouse].TiposMovimiento (
    TipoMovimientoID INT PRIMARY KEY IDENTITY(1,1),
    Descripcion NVARCHAR(100) NOT NULL  -- Ejemplo: "Entrada", "Salida", "Movimiento Interno"
);

-- Tabla de Movimientos de Almacén
CREATE TABLE [WareHouse].MovimientosAlmacen (
    MovimientoID INT PRIMARY KEY IDENTITY(1,1),
    Fecha DATETIME NOT NULL DEFAULT GETDATE(),
    ProductoID INT NOT NULL,
    TipoMovimientoID INT NOT NULL,
    UbicacionOrigenID INT NULL,  -- Solo para movimientos o salidas
    UbicacionDestinoID INT NULL, -- Solo para entradas o movimientos
    Cantidad INT NOT NULL,
    TrabajadorID INT NULL,  -- El trabajador que realizó la operación (si fue humano)
    BotID INT NULL,         -- El bot que realizó la operación (si fue automático)
    Observaciones NVARCHAR(255),  -- Detalles adicionales del movimiento
    CONSTRAINT FK_ProductoMovimiento FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID),
    CONSTRAINT FK_TipoMovimiento FOREIGN KEY (TipoMovimientoID) REFERENCES TiposMovimiento(TipoMovimientoID),
    CONSTRAINT FK_UbicacionOrigen FOREIGN KEY (UbicacionOrigenID) REFERENCES Ubicaciones(UbicacionID),
    CONSTRAINT FK_UbicacionDestino FOREIGN KEY (UbicacionDestinoID) REFERENCES Ubicaciones(UbicacionID),
    CONSTRAINT FK_Trabajador FOREIGN KEY (TrabajadorID) REFERENCES Trabajadores(TrabajadorID),
    CONSTRAINT FK_Bot FOREIGN KEY (BotID) REFERENCES Bots(BotID)
);

-- Índice para mejorar las consultas por fecha
CREATE INDEX IX_MovimientosAlmacen_Fecha ON [WareHouse].MovimientosAlmacen(Fecha);

-- // ====================================================
-- // ====================================================
-- // ====================================================
