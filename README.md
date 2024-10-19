# DB_SqlAlmAut -- Base de datos de proyecto para simulacion de almacen automatizado 🚀 ☣️ 🤙 ☘️

¡Claro! Aquí tienes un diseño para tu archivo README:

# DB_SqlAlmAut

## Descripción
[**DB_SqlAlmAut**](https://www.bing.com/search?form=SKPBOT&q=DB_SqlAlmAut) es una base de datos diseñada para la simulación de un almacén automatizado. Actualmente, incluye la creación de esquemas y un total de 12 tablas.

## Esquemas y Tablas

### Esquema: Buy
•  [**Proveedores**](https://www.bing.com/search?form=SKPBOT&q=Proveedores): Información sobre los proveedores.

•  [**AlbaranCompraEncabezado**](https://www.bing.com/search?form=SKPBOT&q=AlbaranCompraEncabezado): Encabezado de los albaranes de compra.

•  [**AlbaranCompraDetalle**](https://www.bing.com/search?form=SKPBOT&q=AlbaranCompraDetalle): Detalles de los albaranes de compra.


### Esquema: WareHouse
•  [**Productos**](https://www.bing.com/search?form=SKPBOT&q=Productos): Información sobre los productos.

•  [**Almacenes**](https://www.bing.com/search?form=SKPBOT&q=Almacenes): Información sobre los almacenes.

•  [**Estanterias**](https://www.bing.com/search?form=SKPBOT&q=Estanterias): Información sobre las estanterías dentro de los almacenes.

•  [**Ubicaciones**](https://www.bing.com/search?form=SKPBOT&q=Ubicaciones): Información sobre las ubicaciones en las estanterías.

•  [**Inventario**](https://www.bing.com/search?form=SKPBOT&q=Inventario): Información sobre el inventario de productos en los almacenes.

•  [**Trabajadores**](https://www.bing.com/search?form=SKPBOT&q=Trabajadores): Información sobre los trabajadores que realizan movimientos en el almacén.

•  [**TiposBot**](https://www.bing.com/search?form=SKPBOT&q=TiposBot): Información sobre los tipos de bots.

•  [**Bots**](https://www.bing.com/search?form=SKPBOT&q=Bots): Información sobre los bots con serial.

•  [**TiposMovimiento**](https://www.bing.com/search?form=SKPBOT&q=TiposMovimiento): Información sobre los tipos de movimiento.

•  [**MovimientosAlmacen**](https://www.bing.com/search?form=SKPBOT&q=MovimientosAlmacen): Información sobre los movimientos de almacén.


## Índices y Triggers
•  [**Índices**](https://www.bing.com/search?form=SKPBOT&q=%C3%8Dndices): Se han creado índices para mejorar las consultas por fecha y producto.

•  [**Triggers**](https://www.bing.com/search?form=SKPBOT&q=Triggers): Se ha implementado un trigger para actualizar el total en `AlbaranCompraEncabezado` al insertar o actualizar detalles.
