CREATE DATABASE Ejercicio;

CREATE TABLE Tarea(
	id                   INT              PRIMARY KEY NOT NULL,
	nombre               VARCHAR(50)      NOT NULL,
	descripcion          VARCHAR(200)     NOT NULL,
	nombre_usuario       VARCHAR(50)      NOT NULL,
	fecha_inicio         VARCHAR(10)      NOT NULL,
	fecha_vencimiento    VARCHAR(10)      NOT NULL,
	estatus        		 BOOLEAN          NOT NULL
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
VALUES(1, "Tarea 1", "descripcion", "User1", "22/08/2022", "23/08/2022", 0);
INSERT INTO Tarea(id, nombre, descripcion, nombre_usuario, fecha_inicio, fecha_vencimiento, estatus) 
VALUES(2, "Tarea 2", "descripcion", "User1", "22/08/2022", "23/08/2022", 0);
INSERT INTO Tarea(id, nombre, descripcion, nombre_usuario, fecha_inicio, fecha_vencimiento, estatus) 
VALUES(3, "Tarea 3", "descripcion", "User1", "22/08/2022", "23/08/2022", 0);
INSERT INTO Tarea(id, nombre, descripcion, nombre_usuario, fecha_inicio, fecha_vencimiento, estatus) 
VALUES(4, "Tarea 4", "descripcion", "User1", "22/08/2022", "23/08/2022", 0);
INSERT INTO Tarea(id, nombre, descripcion, nombre_usuario, fecha_inicio, fecha_vencimiento, estatus) 
VALUES(5, "Tarea 5", "descripcion", "User1", "22/08/2022", "23/08/2022", 0);
INSERT INTO Tarea(id, nombre, descripcion, nombre_usuario, fecha_inicio, fecha_vencimiento, estatus) 
VALUES(6, "Tarea 6", "descripcion", "User2", "22/08/2022", "23/08/2022", 0);
INSERT INTO Tarea(id, nombre, descripcion, nombre_usuario, fecha_inicio, fecha_vencimiento, estatus) 
VALUES(7, "Tarea 7", "descripcion", "User2", "22/08/2022", "23/08/2022", 1);
INSERT INTO Tarea(id, nombre, descripcion, nombre_usuario, fecha_inicio, fecha_vencimiento, estatus) 
VALUES(8, "Tarea 8", "descripcion", "User2", "22/08/2022", "23/08/2022", 0);
INSERT INTO Tarea(id, nombre, descripcion, nombre_usuario, fecha_inicio, fecha_vencimiento, estatus) 
VALUES(9, "Tarea 9", "descripcion", "User3", "22/08/2022", "23/08/2022", 1);
INSERT INTO Tarea(id, nombre, descripcion, nombre_usuario, fecha_inicio, fecha_vencimiento, estatus) 
VALUES(10, "Tarea 10", "descripcion", "User3", "22/08/2022", "23/08/2022", 0);

INSERT INTO Empresa(id, nombre, id_tarea) VALUES(1, "Empresa 1", 1);
INSERT INTO Empresa(id, nombre, id_tarea) VALUES(2, "Empresa 1", 2);
INSERT INTO Empresa(id, nombre, id_tarea) VALUES(3, "Empresa 1", 3);
INSERT INTO Empresa(id, nombre, id_tarea) VALUES(4, "Empresa 1", 4);
INSERT INTO Empresa(id, nombre, id_tarea) VALUES(5, "Empresa 1", 5);
INSERT INTO Empresa(id, nombre, id_tarea) VALUES(6, "Empresa 2", 6);
INSERT INTO Empresa(id, nombre, id_tarea) VALUES(7, "Empresa 2", 7);
INSERT INTO Empresa(id, nombre, id_tarea) VALUES(8, "Empresa 2", 8);
INSERT INTO Empresa(id, nombre, id_tarea) VALUES(9, "Empresa 2", 9);
INSERT INTO Empresa(id, nombre, id_tarea) VALUES(10, "Empresa 2", 10);

INSERT INTO Usuario(id, nombre, id_tarea) VALUES(1, "User1", 1);
INSERT INTO Usuario(id, nombre, id_tarea) VALUES(2, "User1", 2);
INSERT INTO Usuario(id, nombre, id_tarea) VALUES(3, "User1", 3);
INSERT INTO Usuario(id, nombre, id_tarea) VALUES(4, "User1", 4);
INSERT INTO Usuario(id, nombre, id_tarea) VALUES(5, "User1", 5);
INSERT INTO Usuario(id, nombre, id_tarea) VALUES(6, "User2", 6);
INSERT INTO Usuario(id, nombre, id_tarea) VALUES(7, "User2", 7);
INSERT INTO Usuario(id, nombre, id_tarea) VALUES(8, "User2", 8);
INSERT INTO Usuario(id, nombre, id_tarea) VALUES(9, "User3", 9);
INSERT INTO Usuario(id, nombre, id_tarea) VALUES(10, "User3", 10);

/* Tareas pendientes agrupadas por empresas con su usuaio seleccionado */
SELECT e.nombre, t.nombre, t.estatus, u.nombre
FROM Empresa AS e
INNER JOIN Tarea AS t
INNER JOIN Usuario AS u
WHERE e.id_tarea = t.id
AND u.id_tarea = t.id
AND t.estatus != 1;

/* Empresas con mas tareas pendientes */
SELECT e.nombre, COUNT(t.estatus)
FROM Empresa AS e
INNER JOIN Tarea AS t
WHERE e.id_tarea = t.id AND t.estatus = 0
GROUP BY e.nombre
HAVING COUNT(t.estatus);

/* Usuarios que no tienen el máximo de tareas asignadas ( < 5) */
SELECT u.nombre, COUNT(t.nombre_usuario)
FROM Usuario AS u
INNER JOIN Tarea AS t 
WHERE u.id_tarea = t.id AND u.nombre = t.nombre_usuario
GROUP BY t.nombre_usuario
HAVING COUNT(t.nombre_usuario) < 5;









