CREATE DATABASE Videojuego;

CREATE TABLE Nivel(
	id      INT     PRIMARY KEY NOT NULL,
	nivel   INT     NOT NULL
);

CREATE TABLE Escenario(
	id         INT     PRIMARY KEY NOT NULL,
	clima      TEXT,
	terreno    TEXT,
	id_nivel   INT     NOT NULL,
	CONSTRAINT FK_escenarioNivel FOREIGN KEY (id_nivel) REFERENCES Nivel(id)
);

CREATE TABLE Experiencia(
	id          INT     PRIMARY KEY NOT NULL,
	tag         TEXT,
	cantidad    INT     NOT NULL
);

CREATE TABLE Objeto(
	id              INT         PRIMARY KEY NOT NULL,
	nombre          TEXT,
	tipo            TEXT,
	especial        BOOLEAN     NOT NULL
);

CREATE TABLE Enemigo(
	id              INT         PRIMARY KEY NOT NULL,
	estado_vital    BOOLEAN     NOT NULL,
	tipo            TEXT,
	salud           INT         NOT NULL,
	fuerza          INT	        NOT NULL,
	id_experiencia  INT         NOT NULL,
	id_objeto       INT         NOT NULL,
	CONSTRAINT FK_enemigoExperiencia FOREIGN KEY (id_experiencia) REFERENCES Experiencia(id),
	CONSTRAINT FK_enemigoObjeto FOREIGN KEY (id_objeto) REFERENCES Objeto(id)
);

CREATE TABLE NPC(
	id              INT     PRIMARY KEY NOT NULL,
	salud           INT     NOT NULL,
	tipo            TEXT,
	id_objeto       INT     NOT NULL,
	CONSTRAINT FK_NPCObjeto FOREIGN KEY (id_objeto) REFERENCES Objeto(id)
);

CREATE TABLE Personaje(
	id                  INT             PRIMARY KEY NOT NULL,
	nombre              TEXT,
	cont_muertes		INT             NOT NULL,
	cont_exp            INT             NOT NULL,
	edad                INT             NOT NULL,
	genero              VARCHAR(15)     NOT NULL,
	fuerza              INT             NOT NULL,
	salud               INT             NOT NULL,
	id_exp              INT             NOT NULL
);

ALTER TABLE Personaje
ADD CONSTRAINT FK_pExp FOREIGN KEY (id_exp)
REFERENCES Experiencia(id);

INSERT INTO Nivel(id, nivel) VALUES (1, 1);
INSERT INTO Nivel(id, nivel) VALUES(2, 2);

INSERT INTO Escenario(id, clima, terreno, id_nivel) VALUES (1, "Soleado", "Planicie", 1);
INSERT INTO Escenario(id, clima, terreno, id_nivel) VALUES (2, "Lluvioso", "Planicie", 1);

INSERT INTO Escenario(id, clima, terreno, id_nivel) VALUES (3, "Soleado", "Pantano", 2);

INSERT INTO Experiencia(id, tag, cantidad) VALUES (1, "expGuerrero", 	15);
INSERT INTO Experiencia(id, tag, cantidad) VALUES (2, "expNPC", 		0);
INSERT INTO Experiencia(id, tag, cantidad) VALUES (3, "expArquero", 	20);

INSERT INTO Objeto(id, nombre, tipo, especial) VALUES (1, "Espada", 	"Arma", 	 	   0);
INSERT INTO Objeto(id, nombre, tipo, especial) VALUES (2, "Martillo", "Herramienta", 0);
INSERT INTO Objeto(id, nombre, tipo, especial) VALUES (3, "Manzana",  "Comida", 	 	 0);
INSERT INTO Objeto(id, nombre, tipo, especial) VALUES (4, "Arco",  		"Comida", 	 	 0);
INSERT INTO Objeto(id, nombre, tipo, especial) VALUES (5, "Carne", 		"Comida", 		 0);

INSERT INTO Enemigo(id, estado_vital, tipo, salud, fuerza, id_experiencia, id_objeto) VALUES (1, 1, "Guerrero", 100, 10, 1, 1);
INSERT INTO Enemigo(id, estado_vital, tipo, salud, fuerza, id_experiencia, id_objeto) VALUES (2, 1, "Arquero",  50,  5,  3, 4);

INSERT INTO NPC(id, salud, tipo, id_objeto) VALUES (1, 100, "Herrero", 2);
INSERT INTO NPC(id, salud, tipo, id_objeto) VALUES (2, 20,  "Animal",  5);

INSERT INTO Personaje(id, nombre, cont_muertes, cont_exp, edad, genero, fuerza, salud, id_exp) VALUES (1, "Nombre", 0, 0, 0, "Genero", 15, 100, 1);

SELECT * FROM Personaje;

SELECT SUM(p.cont_exp + e.cantidad)
FROM Personaje AS p
INNER JOIN Experiencia AS e
WHERE p.id_exp = e.id;

