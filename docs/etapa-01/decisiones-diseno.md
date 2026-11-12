# Requerimientos funcionales principales

El sistema deberá proporcionar las siguientes funcionalidades:

### 1. Gestión de prendas y catálogo
- Registrar, modificar, consultar y dar de baja prendas comercializadas.
- Administrar las categorías utilizadas para clasificar los distintos tipos de prendas.
- Gestionar talles y géneros asociados a las prendas.
- Registrar diseños y asociarles uno o varios colores.
- Administrar los materiales que componen cada prenda, indicando el porcentaje correspondiente a cada uno.
- Consultar los precios y las existencias disponibles de cada prenda.

### 2. Gestión de proveedores y compras
- Registrar y consultar proveedores.
- Registrar compras de mercadería asociadas a un proveedor.
- Incorporar múltiples prendas en una misma compra.
- Registrar las cantidades y los precios unitarios de los artículos adquiridos.
- Calcular automáticamente los subtotales de cada detalle de compra.
- Registrar y consultar el historial de compras realizadas.

### 3. Gestión de clientes y ventas
- Registrar y consultar clientes.
- Registrar ventas asociadas a un cliente.
- Incorporar múltiples prendas en una misma venta.
- Registrar las cantidades y los precios unitarios aplicados a cada artículo.
- Conservar los precios históricos de las operaciones, independientemente de las modificaciones posteriores en los precios actuales.
- Administrar los estados de las ventas, permitiendo identificar operaciones pendientes, confirmadas o anuladas.
- Consultar el historial de ventas y sus respectivos detalles.

### 4. Gestión de métodos de pago
- Registrar y administrar los métodos de pago disponibles.
- Asociar uno o varios métodos de pago a una misma venta.
- Registrar el importe abonado mediante cada método de pago.

### 5. Control de inventario y operaciones
- Consultar y controlar las existencias disponibles de cada prenda.
- Actualizar el stock a partir de los movimientos de entrada y salida de mercadería.
- Incrementar las existencias mediante las compras registradas.
- Descontar las unidades correspondientes a las ventas confirmadas.
- Validar la disponibilidad de stock antes de confirmar una venta.
- Contemplar la restitución de unidades ante anulaciones y devoluciones, evitando duplicar movimientos de inventario.

### 6. Cálculos y consultas
- Calcular automáticamente los subtotales de los detalles de compra y venta.
- Determinar los totales correspondientes a cada operación.
- Consultar información sobre prendas, categorías, materiales, diseños y colores.
- Generar consultas sobre clientes, proveedores, compras, ventas, métodos de pago y stock.

# Principales entidades del dominio

Las principales entidades que intervienen en el sistema son:

### Entidades relacionadas con las prendas

- **Prenda:** representa cada artículo de indumentaria comercializado por la tienda. Almacena su código identificador, descripción, stock, precio unitario y las referencias a su categoría, talle, género y diseño.

- **Categoria:** permite clasificar las prendas según su tipo, por ejemplo: remeras, pantalones, camisas, camperas o vestidos.

- **Talle:** almacena las distintas medidas disponibles para las prendas.

- **Genero:** permite clasificar las prendas según el género al que están destinadas.

- **Disenno:** representa el patrón o apariencia visual de una prenda, como lisa, rayada o a cuadros.

- **Color:** almacena los colores disponibles para representar los diseños.

- **Disenno_Color:** establece la relación entre diseños y colores. Permite que un diseño esté compuesto por varios colores y que un mismo color pueda utilizarse en diferentes diseños.

- **Material:** representa los materiales utilizados en la composición de las prendas, como algodón, poliéster o elastano.

- **Prenda_Material:** establece la relación entre las prendas y los materiales que las componen, almacenando el porcentaje correspondiente a cada material.

### Entidades relacionadas con las compras

- **Proveedor:** representa a las personas o empresas que suministran la mercadería al negocio. Se identifica mediante su CUIT.

- **Cabecera_Compra:** almacena la información general de cada compra, incluyendo su identificador, fecha, proveedor y total.

- **Detalle_Compra:** registra las prendas adquiridas en cada compra, junto con las cantidades, los precios unitarios y los subtotales correspondientes.

### Entidades relacionadas con las ventas

- **Cliente:** representa a las personas que realizan compras en el comercio. Almacena un identificador, DNI y nombre y apellido.

- **Cabecera_Venta:** representa la operación comercial realizada. Almacena su identificador, fecha, cliente asociado, estado y total.

- **Detalle_Venta:** contiene las prendas incluidas en cada venta, sus cantidades, los precios unitarios aplicados y los subtotales correspondientes.

- **Estado:** almacena los posibles estados de una venta, permitiendo identificar su situación dentro del proceso comercial.

### Entidades relacionadas con los pagos

- **Metodo_Pago:** representa los medios de pago habilitados por el comercio, como efectivo, tarjetas, transferencias o billeteras virtuales.

- **Venta_Metodo_Pago:** establece la relación entre las ventas y los métodos de pago utilizados, registrando el importe correspondiente a cada uno. Permite representar operaciones abonadas mediante más de un método de pago.
