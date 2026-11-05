BEGIN TRANSACTION;

  BEGIN TRY
      -- 1. Insertar la cabecera de la venta
      INSERT INTO Cabecera_Venta (id_venta, fecha, total, estado, id_cliente) 
      VALUES (11, '2026-05-06 12:00:00', 30000.00, 'confirmada', 1);
  
      -- 2. Insertar el detalle de la venta
      INSERT INTO Detalle_Venta (id_det_venta, cantidad, precio_unitario, subtotal, id_venta, cod_prenda) 
      VALUES (11, 2, 15000.00, 30000.00, 11, 101);
  
      -- 3. Actualizar el stock de la prenda (descontar 2 unidades de la prenda 101)
      UPDATE Prenda 
      SET stock = stock - 2 
      WHERE cod_prenda = 101;
  
      -- Si todo sale bien, consolidamos los cambios
      COMMIT TRANSACTION;
      PRINT 'Transacción de venta procesada y confirmada exitosamente.';
  
  END TRY
  BEGIN CATCH
      -- Si ocurre cualquier error, deshacemos todos los cambios
      IF @@TRANCOUNT > 0
          ROLLBACK TRANSACTION;
      
      PRINT 'Error en la transacción. Se aplicó ROLLBACK.';
      PRINT ERROR_MESSAGE();
  END CATCH;