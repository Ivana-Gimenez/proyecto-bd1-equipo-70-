# Alcance del Sistema

El proyecto comprende el diseño y desarrollo de una base de datos relacional para la gestión comercial y de inventario de una tienda de indumentaria. Su objetivo es organizar y centralizar la información del negocio, permitiendo administrar las prendas comercializadas, sus características, los proveedores, los clientes y las operaciones de compra y venta.

El sistema abarca los siguientes módulos:

### 1. Gestión de prendas y catálogo
- Registro y administración de prendas mediante un código único.
- Clasificación de las prendas por categoría, talle y género.
- Registro de diseños y asociación de colores a cada uno.
- Administración de los materiales que componen cada prenda, indicando el porcentaje de participación de cada material.
- Registro de precios y cantidades disponibles en stock.

### 2. Gestión de proveedores y compras
- Registro y administración de proveedores.
- Registro de compras de mercadería asociadas a cada proveedor.
- Almacenamiento de la fecha y el importe total de cada compra.
- Registro de los artículos adquiridos, sus cantidades, precios unitarios y subtotales.
- Seguimiento de los ingresos de mercadería al inventario.

### 3. Gestión de clientes y ventas
- Registro y consulta de clientes mediante sus datos identificatorios.
- Registro de ventas asociadas a los clientes correspondientes.
- Administración del detalle de cada venta, permitiendo incluir múltiples prendas y sus respectivas cantidades.
- Conservación del precio unitario aplicado a cada artículo al momento de la operación.
- Registro y seguimiento del estado de las ventas: pendiente, confirmada o anulada.

### 4. Gestión de métodos de pago
- Registro y administración de los métodos de pago disponibles.
- Asociación de uno o varios métodos de pago a una misma venta.
- Registro del importe correspondiente a cada método utilizado, permitiendo representar pagos combinados.

### 5. Control de inventario e integridad de los datos
- Registro y seguimiento de las cantidades disponibles de cada prenda.
- Control de los movimientos de entrada y salida de mercadería derivados de las compras y ventas.
- Validación de la disponibilidad de stock antes de confirmar una venta.
- Cálculo automático de los subtotales de los detalles de compra y venta.
- Conservación de los precios históricos de las operaciones.
- Consideración de las anulaciones y devoluciones en la actualización del inventario.

### 6. Historial y consultas
- Almacenamiento del historial de compras y ventas realizadas.
- Consulta de operaciones anteriores y sus respectivos detalles.
- Obtención de información sobre prendas, categorías, materiales, diseños, colores y existencias.
- Consultas sobre clientes, proveedores y movimientos comerciales para facilitar el seguimiento y control del negocio.

### Límites del proyecto

El desarrollo se concentra en el diseño de la base de datos relacional, la definición de sus entidades, atributos, relaciones, claves y restricciones de integridad, así como en la implementación de las reglas necesarias para mantener la consistencia de la información.

No se contempla en esta etapa el desarrollo de una interfaz gráfica de usuario, una tienda en línea, la integración con plataformas externas de pago ni la implementación de servicios de facturación electrónica.
