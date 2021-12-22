DROP DATABASE IF EXISTS superheroes;
CREATE DATABASE superheroes CHARACTER SET utf8mb4;
USE superheroes;

CREATE TABLE creador (
id_creador INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  nombre VARCHAR(20) NOT NULL
);


CREATE TABLE personajes (
  id_personaje INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre_real VARCHAR(20) NOT NULL,
  personaje VARCHAR(20) NOT NULL,
  inteligencia INT(10) NOT NULL,
  fuerza VARCHAR(10) NOT NULL,
  velocidad INT(11) NOT NULL,
  poder INT(11) NOT NULL,
  aparicion INT(11) NOT NULL,
  ocupacion VARCHAR(30) NULL,
  id_creador INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_creador) REFERENCES creador(id_creador)
  );


INSERT INTO creador VALUES(1, "Marvel");
INSERT INTO creador VALUES(2, "DC Comics");
INSERT INTO personajes(id_personaje, nombre_real, personaje, inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (1, "Bruce Banner", "Hulk", 160,"600mil",75,98,1962,"Fisico Nuclear",1);
INSERT INTO personajes(id_personaje, nombre_real, personaje, inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (2, "Tony Stark", "Iron Man", 170,"200mil",70,123,1963,"Invertor Industrial",1);
INSERT INTO personajes(id_personaje, nombre_real, personaje, inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (3, "Thor Odinson", "Thor", 145,"infinita",100,235,1962,"Rey de Asgard",1);
INSERT INTO personajes(id_personaje, nombre_real, personaje, inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (4, "Wanda Maximoff", "Bruja Escarlata", 170,"100mil",90,345,1964,"Bruja",1);
INSERT INTO personajes(id_personaje, nombre_real, personaje, inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (5, "Carol Denvers", "Capitana Marvel", 157,"250mil",85,128,1968,"Oficial de Inteligencia",1);
INSERT INTO personajes(id_personaje, nombre_real, personaje, inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (6, "Thanos", "Thanos", 170,"infinita",40,306,1973,"Adorador de la muerte",1);
INSERT INTO personajes(id_personaje, nombre_real, personaje, inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (7, "Peter Parker", "Spiderman", 165,"25mil",80,74,1962,"Fotografo",1);
INSERT INTO personajes(id_personaje, nombre_real, personaje, inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (8, "Steve Rogers", "Capitan America", 145,"600",45,60,1941,"Oficial federal",1);
INSERT INTO personajes(id_personaje, nombre_real, personaje, inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (9, "Bobby Drake", "Ice Man", 140,"2mil",64,122,1963,"Contador",2);
INSERT INTO personajes(id_personaje, nombre_real, personaje, inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (10, "Barry Allen", "Flash", 160,"10mil",120,168,1956,"Cientifico forense",2);
INSERT INTO personajes(id_personaje, nombre_real, personaje, inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (11, "Bruce Wayne", "Batman", 170,"500",32,47,1939,"Hombre de negocios",2);
INSERT INTO personajes(id_personaje, nombre_real, personaje, inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (12, "Clark Kent", "Superman", 165,"infinita",120,182,1948,"Reportero",2);
INSERT INTO personajes(id_personaje, nombre_real, personaje, inteligencia, fuerza, velocidad, poder, aparicion, ocupacion, id_creador) VALUES (13, "Diana Prince", "Mujer Maravilla", 160,"infinita",35,127,1949,"Princesa guerrera",2);

SELECT * FROM personajes;


UPDATE personajes
SET aparicion = 1938
WHERE id_personaje = 12;

DELETE FROM personajes
WHERE id_personaje=10;
