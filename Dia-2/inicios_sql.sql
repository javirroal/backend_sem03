-- Asi se crea una base de datos
CREATE DATABASE IF NOT EXISTS practicas;

USE practicas;

-- ahora procedemos a crear nuestra primera tabla
-- Tipos de string: https://dev.mysql.com/doc/refman/8.0/en/string-types.html
-- Tipos de datos: https://dev.mysql.com/doc/refman/8.0/en/data-types.html
-- AUTO_INCREMENT -> solamente puede haber uno por tabla
CREATE TABLE usuarios(
--  NOMBRE  DATATYPE  [CONF ADICIONALES]
	id 		INT 		NULL default(10) auto_increment UNIQUE PRIMARY KEY,
    nombre  TEXT		NOT NULL,
    dni		CHAR(8)		UNIQUE
);