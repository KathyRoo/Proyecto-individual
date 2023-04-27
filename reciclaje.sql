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

INSERT INTO puntos_de_reciclaje (id, nombre, direccion, tipo_de_residuos)
VALUES
  (1, 'Punto de reciclaje 1', 'Calle 1, Ciudad 1', 'Papel, vidrio, plástico, metal'),
  (2, 'Punto de reciclaje 2', 'Calle 2, Ciudad 1', 'Papel, plástico'),
  (3, 'Punto de reciclaje 3', 'Calle 3, Ciudad 2', 'Vidrio, metal'),
  (4, 'Punto de reciclaje 4', 'Calle 4, Ciudad 3', 'Papel, vidrio');


INSERT INTO disponibilidad (id, punto_de_reciclaje_id, fecha, horario_de_apertura, horario_de_cierre)
VALUES
  (1, 1, '2023-05-01', '09:00:00', '13:00:00'),
  (2, 1, '2023-05-01', '14:00:00', '18:00:00'),
  (3, 1, '2023-05-02', '09:00:00', '13:00:00'),
  (4, 1, '2023-05-02', '14:00:00', '18:00:00'),
  (5, 2, '2023-05-01', '10:00:00', '14:00:00'),
  (6, 2, '2023-05-01', '15:00:00', '19:00:00'),
  (7, 2, '2023-05-02', '10:00:00', '14:00:00'),
  (8, 2, '2023-05-02', '15:00:00', '19:00:00'),
  (9, 3, '2023-05-01', '09:00:00', '12:00:00'),
  (10, 3, '2023-05-01', '13:00:00', '16:00:00')


