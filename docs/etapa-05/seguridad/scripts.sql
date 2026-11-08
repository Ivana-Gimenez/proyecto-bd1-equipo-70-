-- Crear logins y usuarios en la base de datos
CREATE LOGIN UsrAdmin WITH PASSWORD = 'PasswordSeguro123!';
CREATE USER UsuarioAdmin FOR LOGIN UsrAdmin;

CREATE LOGIN UsrLectura WITH PASSWORD = 'PasswordSeguro123!';
CREATE USER UsuarioLectura FOR LOGIN UsrLectura;

-- Asignar rol de administrador (db_owner) usando el procedimiento compatible
EXEC sp_addrolemember @rolename = 'db_owner', @membername = 'UsuarioAdmin';
GO

-- Asignar permisos de solo lectura al usuario de lectura
GRANT SELECT TO UsuarioLectura;
GO
-----------------------------
GRANT EXECUTE ON sp_InsertarCategoria TO UsuarioLectura;

-- Ejecutado como UsuarioAdmin
INSERT INTO Categoria (id_categoria, descripcion) VALUES (9, 'Accesorios'); -- ÉXITO

-- Ejecutado como UsuarioLectura
INSERT INTO Categoria (id_categoria, descripcion) VALUES (10, 'Calzado'); 
-- Resultado: Mensaje de error (The INSERT permission was denied on the object 'Categoria'...)

-- Ejecutado como UsuarioLectura
EXEC sp_InsertarCategoria @id_categoria = 11, @descripcion = 'Ropa Interior';

CREATE LOGIN UsrConRol WITH PASSWORD = 'PasswordSeguro123!';
CREATE USER UsuarioConRol FOR LOGIN UsrConRol;

CREATE LOGIN UsrSinRol WITH PASSWORD = 'PasswordSeguro123!';
CREATE USER UsuarioSinRol FOR LOGIN UsrSinRol;

-- Crear el rol de base de datos
CREATE ROLE RolSoloLecturaPrendas;

-- Dar permisos de lectura sobre la tabla Prenda al rol creado
GRANT SELECT ON Prenda TO RolSoloLecturaPrendas;

EXEC sp_addrolemember @rolename = 'RolSoloLecturaPrendas', @membername = 'UsuarioConRol';

----------
SELECT * FROM Prenda;


