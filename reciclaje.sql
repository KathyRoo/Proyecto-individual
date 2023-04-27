CREATE DATABASE reciclaje;


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
  (1, 'Punto de reciclaje 1', 'Calle Progreso 962, Villa Alemana', 'Papel, vidrio, plástico, metal'),
  (2, 'Punto de reciclaje 2', 'Calle Claudio Vicuña 524, Quilpue', 'Papel, plástico'),
  (3, 'Punto de reciclaje 3', 'Calle Sucre 555, Viña del mar', 'Vidrio, metal'),
  (4, 'Punto de reciclaje 4', 'Avenida Brasil 458, Valparaiso', 'Papel, vidrio');


INSERT INTO disponibilidad (id, punto_de_reciclaje_id, fecha, horario_de_apertura, horario_de_cierre)
VALUES
  (1, 1, '2023-05-01', '09:00:00', '13:00:00'),
  (2, 1, '2023-05-01', '14:00:00', '18:00:00'),
  (3, 1, '2023-05-02', '09:00:00', '13:00:00'),
  (4, 1, '2023-05-02', '14:00:00', '18:00:00');
  


SELECT nombre, direccion FROM puntos_de_reciclaje;

--Mostrar los horarios de disponibilidad de todos los puntos de reciclaje:

SELECT puntos_de_reciclaje.nombre, disponibilidad.fecha, disponibilidad.horario_de_apertura, disponibilidad.horario_de_cierre
FROM puntos_de_reciclaje
INNER JOIN disponibilidad
ON puntos_de_reciclaje.id = disponibilidad.punto_de_reciclaje_id;

--Mostrar los puntos de reciclaje que están disponibles el 1 de mayo de 2023:
SELECT puntos_de_reciclaje.nombre, disponibilidad.horario_de_apertura, disponibilidad.horario_de_cierre
FROM puntos_de_reciclaje
INNER JOIN disponibilidad
ON puntos_de_reciclaje.id = disponibilidad.punto_de_reciclaje_id
WHERE disponibilidad.fecha = '2023-05-01';

--Mostrar los puntos de reciclaje que aceptan vidrio como tipo de residuo:
SELECT nombre, direccion
FROM puntos_de_reciclaje
WHERE tipo_de_residuos LIKE '%vidrio%';

--Mostrar los horarios de disponibilidad de los puntos de reciclaje que están disponibles el 2 de mayo de 2023:
SELECT puntos_de_reciclaje.nombre, disponibilidad.horario_de_apertura, disponibilidad.horario_de_cierre
FROM puntos_de_reciclaje
INNER JOIN disponibilidad
ON puntos_de_reciclaje.id = disponibilidad.punto_de_reciclaje_id
WHERE disponibilidad.fecha = '2023-05-02';




