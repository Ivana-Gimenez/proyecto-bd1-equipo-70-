# **Pruebas y Validaciones de la Base de Datos**

En esta etapa se realizan diferentes pruebas para comprobar que la base de datos funciona correctamente y que las **restricciones de integridad** definidas impiden ingresar o modificar datos incorrectos.

Las pruebas permiten verificar tanto los casos en los que el sistema **debe generar un error**, como aquellos en los que la operación **debe realizarse correctamente**.

---

## **1\. Pruebas de restricciones — Resultado esperado: ERROR**

Estas pruebas buscan comprobar que la base de datos rechaza operaciones que no cumplen con las reglas establecidas.

### **Prueba 1.1: Ingreso de un DNI duplicado — `UNIQUE`**

INSERT INTO Cliente (id\_cliente, dni, nombre\_apellido)   
VALUES (11, '35111222', 'Pedro duplicado');

**Explicación:**  
 Se intenta registrar un nuevo cliente utilizando un DNI que ya existe en la tabla `Cliente`.

El campo `dni` posee una restricción `UNIQUE`, por lo tanto, **no se permiten dos clientes con el mismo DNI**.

**Resultado esperado:**  
 La base de datos debe rechazar la operación y mostrar un error de clave única.

---

### **Prueba 1.2: Ingreso de stock negativo — `CHECK`**

INSERT INTO Prenda   
(cod\_prenda, tipo\_prenda, stock, precio\_unitario, cod\_talle, cod\_color, id\_categoria)   
VALUES (200, 'Remera', \-5, 10000.00, 1, 1, 1);

**Explicación:**  
 Se intenta ingresar una prenda con un stock de `-5`.

La base de datos tiene una restricción `CHECK` que establece que el stock debe ser un valor válido, por ejemplo, **mayor o igual a cero**.

**Resultado esperado:**  
 La operación debe ser rechazada porque no es posible tener una cantidad de stock negativa.

---

### **Prueba 1.3: Estado de venta incorrecto — `CHECK`**

INSERT INTO Cabecera\_Venta   
(id\_venta, fecha, total, estado, id\_cliente)   
VALUES (99, NOW(), 5000.00, 'entregado', 1);

**Explicación:**  
 Se intenta registrar una venta utilizando el estado `'entregado'`.

Si la restricción `CHECK` solamente permite determinados estados, como por ejemplo `pendiente`, `pagado` o `cancelado`, el valor `'entregado'` no será aceptado.

**Resultado esperado:**  
 La base de datos debe generar un error porque el estado ingresado no pertenece a los valores permitidos.

---

### **Prueba 1.4: Eliminación de una prenda relacionada — `RESTRICT`**

DELETE FROM Prenda   
WHERE cod\_prenda \= 101;

**Explicación:**  
 Se intenta eliminar una prenda que ya se encuentra relacionada con registros de ventas.

La restricción `RESTRICT` evita eliminar el registro principal cuando existen otros registros que dependen de él.

Esto permite mantener la **integridad referencial** de la base de datos.

**Resultado esperado:**  
 La eliminación debe ser rechazada para evitar que queden ventas haciendo referencia a una prenda que ya no existe.

---

# **2\. Pruebas de funcionamiento correcto y acciones en cascada**

En estas pruebas se verifica que determinadas operaciones se ejecuten correctamente y que las relaciones entre las tablas se actualicen automáticamente cuando corresponde.

### **Prueba 2.1: Modificación de una clave — `UPDATE CASCADE`**

UPDATE Talle   
SET cod\_talle \= 100   
WHERE cod\_talle \= 1;

Luego se realiza una consulta para comprobar el resultado:

SELECT cod\_prenda, tipo\_prenda, cod\_talle   
FROM Prenda   
WHERE cod\_talle \= 100;

**Explicación:**  
 Se modifica el código de un talle, pasando de `1` a `100`.

Como las prendas están relacionadas con la tabla `Talle` mediante una **clave foránea**, la opción `UPDATE CASCADE` permite que el cambio se propague automáticamente a las tablas relacionadas.

**Resultado esperado:**  
 Las prendas que anteriormente tenían `cod_talle = 1` deben pasar automáticamente a tener `cod_talle = 100`.

---

### **Prueba 2.2: Eliminación en cascada — `DELETE CASCADE`**

DELETE FROM Cabecera\_Venta   
WHERE id\_venta \= 1;

Luego se verifica si permanece el detalle:

SELECT \*   
FROM Detalle\_Venta   
WHERE id\_venta \= 1;

**Explicación:**  
 Se elimina una venta de la tabla `Cabecera_Venta`.

Como la tabla `Detalle_Venta` depende de esa venta y la relación está configurada con `DELETE CASCADE`, los detalles correspondientes se eliminan automáticamente.

Esto evita que queden **detalles de venta sin una cabecera asociada**.

**Resultado esperado:**  
 La consulta sobre `Detalle_Venta` debe devolver **0 filas**, demostrando que los registros relacionados fueron eliminados automáticamente.

---

## **Conclusión**

Las pruebas permiten comprobar que la base de datos **controla correctamente la información ingresada** y mantiene la integridad de las relaciones entre las tablas.

En particular, se verificó:

* `UNIQUE`: evita datos duplicados.  
* `CHECK`: impide valores no permitidos.  
* `RESTRICT`: evita eliminar información que tiene registros relacionados.  
* `UPDATE CASCADE`: actualiza automáticamente las claves relacionadas.  
* `DELETE CASCADE`: elimina automáticamente los registros dependientes.

De esta manera, las pruebas demuestran que las restricciones implementadas cumplen con las reglas definidas para el funcionamiento de la base de datos.

