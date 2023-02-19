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

INSERT INTO tareas (id, titulo, descripcion, usuario_id) VALUES (DEFAULT, 'Ir a comer', 'Comer pollo a la brasa', 1),
																(DEFAULT, 'Comer pizza', 'Comer una rica pizza', 1);

-- buscar una palabra o palabras dentro de un texto
SELECT * FROM tareas WHERE usuario_id=1 AND titulo LIKE '%comer%';
SELECT * FROM usuarios WHERE nombre LIKE '%O';
SELECT * FROM usuarios WHERE nombre LIKE 'J%';
-- Si queremos hacer la distincion entre mayusculas y mimnusculas antes de poner el texto colocaremos la palabra BINARY y esto sirve para que haga la comparacion a nivel de numeros de caracteres (formato ASCII)
SELECT * FROM usuarios WHERE nombre LIKE BINARY 'j%';

-- El _ indica cuantos caracteres debe de 'saltar' para que busque el caracter indicado
SELECT * FROM usuarios WHERE nombre LIKE '_u%';

SELECT * FROM usuarios WHERE nombre NOT LIKE '_u%';

INSERT INTO tareas (id, titulo, descripcion, usuario_id) VALUES (default, 'no hacer nada', 'no tengo explicacion', null);

SELECT * FROM tareas;

INSERT INTO tareas (id, titulo, descripcion, usuario_id) VALUES (DEFAULT, 'Jugar LOL', 'Jugar con mis amigos', 3);

-- Interseccion entre la tabla usuarios con la tabla tareas 
SELECT * FROM usuarios INNER JOIN tareas ON usuarios.id = tareas.usuario_id;

SELECT * FROM usuarios LEFT JOIN tareas ON usuarios.id = tareas.usuario_id;

SELECT * FROM usuarios RIGHT JOIN tareas ON usuarios.id = tareas.usuario_id;

-- FULL OUTER JOIN (DEVUELVE TODO EL CONTENIDO)
SELECT * FROM usuarios LEFT JOIN tareas ON usuarios.id = tareas.usuario_id UNION
SELECT * FROM usuarios RIGHT JOIN tareas ON usuarios.id = tareas.usuario_id;

-- UNION mezcla o combina las dos o mas consultas en una sola 'tabla virtual' pero estas consultas tienen que tener el mismo nimero de columnas, sino la union sera incorrecta
SELECT id FROM usuarios UNION
SELECT titulo FROM tareas;

-- CONCATENAR -> juntar combinar, asi mismo si uso AS es para poner un alias o nombre a la columna
SELECT CONCAT(titulo, ' ', descripcion) AS 'Nombre completo' FROM tareas;

-- 1. Devolver todos los usuarios cuyo DNI contengan el numero 5
SELECT * FROM usuarios WHERE dni LIKE '%5%';
-- 2. Devolver todos los usuarios cuyo DNI tengan el tercer digito 8
SELECT * FROM usuarios WHERE dni LIKE '__8%';
-- 3. Devolver todas las tareas del usuario 'Javier'
SELECT * FROM usuarios INNER JOIN tareas ON usuarios.id = tareas.usuario_id WHERE nombre ='Javier'; 