Drop database prueba;
CREATE DATABASE prueba;

USE prueba;

CREATE TABLE materias (
  id_materia INT AUTO_INCREMENT PRIMARY KEY,
  materia VARCHAR(100) NOT NULL,
  cuatrimestre INT NOT NULL
);
LOAD DATA LOCAL INFILE "Base de datos - materias.csv"
INTO TABLE materias
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE temas (
  id_tema INT AUTO_INCREMENT PRIMARY KEY,
  nombre_tema VARCHAR(100) NOT NULL,
  dificultad INT NOT NULL,
  id_materia INT,
  FOREIGN KEY (id_materia) REFERENCES materias(id_materia)
  CONSTRAINT chk_dificultad CHECK (dificultad >= 1 AND dificultad <= 5);
);
LOAD DATA LOCAL INFILE "Base de datos - temas.csv"
INTO TABLE temas
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE preguntas (
  id_pregunta INT AUTO_INCREMENT PRIMARY KEY,
  pregunta TEXT NOT NULL,
  id_tema INT,
  calidad_prompt INT NOT NULL,
  FOREIGN KEY (id_tema) REFERENCES temas(id_tema)
);
LOAD DATA LOCAL INFILE "Base de datos - preguntas.csv"
INTO TABLE preguntas
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE respuestas (
  id_respuesta INT AUTO_INCREMENT PRIMARY KEY,
  respuesta TEXT NOT NULL,
  ia VARCHAR(100) NOT NULL,
  calidad_respuesta INT NOT NULL,
  id_pregunta INT,
  FOREIGN KEY (id_pregunta) REFERENCES preguntas(id_pregunta)
);
LOAD DATA LOCAL INFILE "Base de datos - respuestas.csv"
INTO TABLE respuestas
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


select * from materias;
