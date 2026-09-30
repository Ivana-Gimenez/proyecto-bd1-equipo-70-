# **Restricciones de Integridad en el Esquema**

Este documento analiza las restricciones definitorias aplicadas en el diseño de la base de datos para asegurar la consistencia y fiabilidad de los datos guardados.

## **1\. Claves Primarias (Primary Keys)**

Garantizan la unicidad de cada fila dentro de una tabla:

* **Simples**: `cuit` en Proveedor, **`id_cliente`** en Cliente, **`cod_prenda`** en Prenda, `id_venta` en **Cabecera\_Venta**, etc.  
* **Compuestas**: `(id_venta, cod_metodo_pago)` en la tabla **`Venta_Metodo_Pago`**, impidiendo que se repita la combinación del mismo método de pago para la misma venta.

## **2\. Claves Únicas (UNIQUE Constraints)**

Aseguran que no se dupliquen atributos que por definición de negocio deben ser únicos:

* **`Cliente.dni`**: Evita la duplicación de personas.  
* **`Talle.desc_talle`**, **`Color.descripcion`**, **`Categoria.descripcion`**, **`Metodo_Pago.descripcion`**: Garantizan un catálogo limpio sin duplicados.

## **3\. Claves Foráneas y Reglas de Integridad Referencial**

### **Reglas de Eliminación y Actualización (`ON DELETE` / `ON UPDATE`):**

1. **`ON DELETE RESTRICT`**:  
   * Utilizado en la relación con tablas maestras o catálogos (`Cliente`, `Proveedor`, `Prenda`, `Talle`, `Color`, `Categoria`, `Metodo_Pago`).  
   * **Propósito**: Impide borrar un cliente, prenda o catálogo si ya tiene transacciones (ventas, compras, detalles) asociadas. Evita la pérdida de datos históricos.  
2. **`ON DELETE CASCADE`**:  
   * Aplicado en relaciones fuertemente dependientes:  
     * `Detalle_Venta` y `Venta_Metodo_Pago` hacia `Cabecera_Venta`.  
     * `Detalle_Compra` hacia `Cabecera_Compra`.  
   * **Propósito**: Si se elimina un registro de cabecera (una venta o compra completa), sus detalles asociados se eliminan en cascada automáticamente.  
3. **`ON UPDATE CASCADE`**:  
   * Aplicado globalmente en las claves foráneas para reflejar de forma transparente cualquier actualización de IDs o códigos en las tablas referenciadas.

## **4\. Restricciones de Dominio y Verificación (`CHECK`)**

Aseguran que los valores numéricos y cualitativos se mantengan dentro de límites coherentes:

* **`Prenda.stock >= 0`**: El stock nunca puede ser negativo.  
* **`Prenda.precio_unitario >= 0`**: Precios mayores o iguales a cero.  
* **`Detalle_Venta.cantidad > 0` / `Detalle_Compra.cantidad > 0`**: Las transacciones exigen al menos 1 unidad de producto.  
* **`Detalle_Venta.subtotal >= 0` / `Detalle_Compra.subtotal >= 0`**: Evita importes negativos.  
* **`Cabecera_Venta.estado IN ('pendiente', 'confirmada', 'anulada')`**: Limita el estado de una venta a tres valores definidos.

