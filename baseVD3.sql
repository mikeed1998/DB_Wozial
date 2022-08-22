CREATE DATABASE Ejercicio;

CREATE TABLE Tarea(
	id                   INT              PRIMARY KEY NOT NULL,
	nombre               VARCHAR(50)      NOT NULL,
	descripcion          VARCHAR(200)     NOT NULL,
	nombre_usuario       VARCHAR(50)      NOT NULL,
	fecha_inicio         VARCHAR(10)      NOT NULL,
	fecha_vencimiento    VARCHAR(10)      NOT NULL,
	estatus        		   BOOLEAN          NOT NULL
);

CREATE TABLE Empresa(
	id            INT            PRIMARY KEY NOT NULL,
	nombre        VARCHAR(50)    NOT NULL,
	id_tarea      INT            NOT NULL,
	CONSTRAINT FK_empresaTarea FOREIGN KEY (id_tarea) REFERENCES Tarea(id)
);

CREATE TABLE Usuario(
	id         INT           PRIMARY KEY NOT NULL,
	nombre     VARCHAR(50)   NOT NULL,
	id_tarea   INT           NOT NULL,
	CONSTRAINT FK_usuarioTarea FOREIGN KEY (id_tarea) REFERENCES Tarea(id)
);

INSERT INTO Tarea(id, nombre, descripcion, nombre_usuario, fecha_inicio, fecha_vencimiento, estatus) 
VALUES(1, "Tarea 1", "User1", "descripcion", "22/08/2022", "23/08/2022", 0);
INSERT INTO Tarea(id, nombre, descripcion, nombre_usuario, fecha_inicio, fecha_vencimiento, estatus) 
VALUES(2, "Tarea 2", "User1", "descripcion_2", "22/08/2022", "23/08/2022", 0);
INSERT INTO Tarea(id, nombre, descripcion, nombre_usuario, fecha_inicio, fecha_vencimiento, estatus) 
VALUES(3, "Tarea 3", "User1", "descripcion_3", "22/08/2022", "23/08/2022", 0);

INSERT INTO Empresa(id, nombre, id_tarea) VALUES(1, "Empresa 1", 1);

INSERT INTO Usuario(id, nombre, id_tarea) VALUES(1, "Usuario 1", 1);

SELECT e.nombre, t.nombre, t.estatus, u.nombre
FROM Empresa AS e
INNER JOIN Tarea AS t
INNER JOIN Usuario AS u
WHERE e.id_tarea = t.id
AND u.id_tarea = t.id
AND t.estatus != 1;

/*
SELECT *
FROM Tarea
WHERE estatus = 0;
*/



