CREATE DATABASE Ejercicio;

CREATE TABLE Empresa(
	id              INT       PRIMARY KEY NOT NULL,
	id_actividad    INT       NOT NULL
);

CREATE TABLE Actividad(
	id             INT             PRIMARY KEY NOT NULL,
	nombre         VARCHAR(50)     NOT NULL,
	estatus        BOOLEAN         NOT NULL,
	id_usuario     INT             NOT NULL
);

ALTER TABLE Empresa
ADD CONSTRAINT FK_empresaActividad FOREIGN KEY (id_actividad) REFERENCES Actividad(id);

CREATE TABLE Usuario(
	id         INT           PRIMARY KEY NOT NULL,
	nombre     VARCHAR(50)   NOT NULL,
	id_tarea   INT           NOT NULL
);

CREATE TABLE Tarea(
	nombre               VARCHAR(50)      NOT NULL,
	descripcion          VARCHAR(200)     NOT NULL,
	nombre_usuario       VARCHAR(50)      NOT NULL,
	fecha_inicio         DATE             NOT NULL,
	fecha_vencimiento    DATE             NOT NULL,
	id_usuario           INT              NOT NULL,
	CONSTRAINT FK_tareaUsuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
);



