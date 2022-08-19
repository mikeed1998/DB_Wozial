CREATE DATABASE Videojuego;

USE Videojuego;

CREATE TABLE Nivel(
	id				INT		PRIMARY KEY NOT NULL,
	nivel			INT		NOT NULL,
	id_escenario	INT		NOT NULL
);

CREATE TABLE Escenario(
	id				INT		PRIMARY KEY NOT NULL,
	clima			TEXT	NOT NULL,
	terreno			TEXT	NOT NULL,
	id_nivel		INT		FOREIGN KEY REFERENCES Nivel(id_escenario)
);

CREATE TABLE Personaje(
	id					INT			PRIMARY KEY NOT NULL,
	nombre				TEXT,
	edad				INT			NOT NULL,
	genero				VARCHAR(15) NOT NULL,
	fuerza				INT			NOT NULL,
	salud				INT 		NOT NULL,
	id_experiencia		INT			NOT NULL,
	id_objeto			INT			NOT NULL,
	id_NPC 				INT			NOT NULL,
	id_enemigo 			INT			NOT NULL
);

CREATE TABLE Enemigo(
	id				INT		PRIMARY KEY NOT NULL,
	tipo			TEXT,
	salud			INT 	NOT NULL,
	fuerza			INT		NOT NULL,
	id_personaje	INT		NOT NULL,
	id_experiencia	INT		NOT NULL,
	id_objeto		INT		NOT NULL	
);

CREATE TABLE NPC(
	id				INT		PRIMARY KEY NOT NULL,
	salud			INT		NOT NULL,
	tipo			TEXT,
	id_personaje	INT		NOT NULL,
	id_objeto		INT		NOT NULL
);

CREATE TABLE Experiencia(
	id				INT		PRIMARY KEY NOT NULL,
	cantidad		INT		NOT NULL,
	id_personaje	INT 	NOT NULL,
	id_enemigo		INT		NOT NULL
);

CREATE TABLE Objeto(
	id				INT			PRIMARY KEY NOT NULL,
	nombre			TEXT,
	tipo			TEXT,
	especial		TINYINT(1)	NOT NULL,
	id_personaje	INT			NOT NULL,
	id_enemigo		INT			NOT NULL,
	id_NPC 			INT 		NOT NULL
);

ALTER TABLE Nivel
ADD FOREIGN KEY (id_escenario) REFERENCES Escenario(id_nivel);

ALTER TABLE Personaje
ADD FOREIGN KEY (id_experiencia) REFERENCES Experiencia(id_personaje),
ADD FOREIGN KEY (id_objeto) REFERENCES Objeto(id_personaje),
ADD FOREIGN KEY (id_NPC) REFERENCES NPC(id_personaje),
ADD FOREIGN KEY (id_enemigo) REFERENCES Enemigo(id_personaje);

ALTER TABLE Enemigo
ADD FOREIGN KEY (id_personaje) REFERENCES Personaje(id_enemigo),
ADD FOREIGN KEY (id_experiencia) REFERENCES Experiencia(id_enemigo),
ADD FOREIGN KEY (id_objeto) REFERENCES Objeto(id_enemigo);

ALTER TABLE NPC
ADD FOREIGN KEY (id_personaje) REFERENCES Personaje(id_NPC),
ADD FOREIGN KEY (id_objeto) REFERENCES Objeto(id_NPC);

ALTER TABLE Experiencia
ADD FOREIGN KEY (id_personaje) REFERENCES Personaje(id_experiencia),
ADD FOREIGN KEY (id_enemigo) REFERENCES Enemigo(id_experiencia);

ALTER TABLE Objeto
ADD FOREIGN KEY (id_personaje) REFERENCES Personaje(id_objeto),
ADD FOREIGN KEY (id_enemigo) REFERENCES Enemigo(id_objeto),
ADD FOREIGN KEY (id_NPC) REFERENCES NPC(id_objeto);

SELECT * FROM Personaje;

INSERT INTO Personaje(1, "Nombre", 0, "Genero", 0, 0, 0, 0, 0, 0);


