USE practicas;

CREATE TABLE usuarios(
--  NOMBRE  DATATYPE  	Config adicionales
	id 		INT 		AUTO_INCREMENT UNIQUE PRIMARY KEY,
    nombre  TEXT		NOT NULL,
    dni		CHAR(8)		UNIQUE
);

CREATE TABLE tareas(
	id			int				AUTO_INCREMENT PRIMARY KEY,
    titulo		varchar(100)	UNIQUE,
    descripcion	text,
	usuario_id	INT,
    -- CREO LA RELACION ENTRE LAS TABLAS
    -- indico entre parentesis la columna de esta tabla y luego la tabla(su columna)
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);


-- SUB LENGUAJES
-- DDL (Data Definition Language)
-- Es un procedimiento que sirve para definir  estructuras de datos (Cread bd, crear tablas, actualizar tablas, eliminar tablas)
-- CREATE (crear)
-- ALTER (actualizar)
-- DROP (eliminar) elimina absolutamente TODO

-- DML (Data Mnipulation Language)
-- Es un lenguaje que sirve para definir la informacion que ira dentro de las estructuras
-- Insertar datos, actualizar datos, eliminar datos y leer datos
-- INSERT (insertar)
-- SELECT (Visualizar)
-- UPDATE (Actualizar)
-- DELETE (Eliminar)

-- En este caso con el 'id' es auto_increment no le pondremos un valor
INSERT INTO usuarios (nombre, dni) VALUES ('Javier', '70577293');

-- Si queremos utilizar el valor por defecto de una columna
INSERT INTO usuarios (id, nombre, dni) VALUES (DEFAULT, 'Juana', '74563214');

-- Si queremos registrar varios registros
INSERT INTO usuarios (id, nombre, dni) VALUES (DEFAULT, 'Roberto', '12365895'),
											(DEFAULT, 'William', '25698748'),
                                            (DEFAULT, 'Roxana', '56789563');

INSERT INTO tareas (id, titulo, descripcion, usuario_id) VALUES (DEFAULT, 'ir a la playa', 'ire a la playa el fin de semana', 1),
																(DEFAULT, 'ire a la piscina', 'ire a la piscina a mis clases de natacion', 2);

-- Sirve para VISUALIZAR la informacion
SELECT nombre, dni, id FROM usuarios;

-- VISUALIZAR la totalidad de la informacion
SELECT * FROM usuarios;

INSERT INTO usuarios (id, nombre, dni) VALUES (DEFAULT, 'Roberto', '98745632'),
											(DEFAULT, 'William', '58963245');

-- SELECCIONA TODAS LAS COLUMNAS DE LA TABLA USUARIOS DONDE EL NOMBRE SEA JUANA
SELECT * FROM usuarios WHERE nombre= 'Juana' AND id=2;

-- Visualizar todas las tareas del usuario 1 y/o del usuario 2
SELECT * FROM tareas WHERE usuario_id=1 OR usuario_id=2;

INSERT INTO tareas (id, itulo, descripcion, usuario_id) VALUES (DEFAULT, 'Ir a comer', 'Comer pollo a la brasa', 1),
																(DEFAULT, 'Comer pizza', 'Comer una rica pizza', 1);

SELECT * FROM tareas WHERE usuario_id=1;
