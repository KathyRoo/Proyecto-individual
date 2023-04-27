CREATE TABLE puntos_de_reciclaje (
  id INT PRIMARY KEY,
  nombre VARCHAR(255),
  direccion VARCHAR(255),
  tipo_de_residuos VARCHAR(255)
);

CREATE TABLE disponibilidad (
  id INT PRIMARY KEY,
  punto_de_reciclaje_id INT,
  fecha DATE,
  horario_de_apertura TIME,
  horario_de_cierre TIME,
  FOREIGN KEY (punto_de_reciclaje_id) REFERENCES puntos_de_reciclaje(id)
);


