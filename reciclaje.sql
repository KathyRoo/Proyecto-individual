CREATE DATABASE reciclaje;


CREATE TABLE puntos_de_reciclaje (
  id INT PRIMARY KEY,
  nombre VARCHAR(255),
  direccion VARCHAR(255),
  comuna VARCHAR(255),
  imagen VARCHAR(255),
  capacidad INT NOT NULL DEFAULT 0,
  tipo_residuos VARCHAR(255)
);

CREATE TABLE capacidad (
  id INT PRIMARY KEY,
  punto_de_reciclaje_id INT,
  fecha_registro TIMESTAMP  NOT NULL,
  capacidad INT NOT NULL DEFAULT 0,
  FOREIGN KEY (punto_de_reciclaje_id) REFERENCES puntos_de_reciclaje(id)
);

INSERT INTO puntos_de_reciclaje (id, nombre, direccion, comuna, imagen, capacidad, tipo_residuos )
VALUES
  (1, 'Punto de reciclaje 1', 'Calle Progreso 962', 'Villa Alemana', '/img/centros.jpg', 45,'Papel, vidrio, plástico, metal'),
  (2, 'Punto de reciclaje 2', 'Calle Claudio Vicuña 524', 'Quilpue', '/img/centros2.jpg', 20,'Papel, plástico'),
  (3, 'Punto de reciclaje 3', 'Calle Sucre 555', 'Viña del mar', '/img/centros4.jpg', 70, 'Vidrio, metal'),
  (4, 'Punto de reciclaje 4', 'Avenida Brasil 458', 'Valparaiso', '/img/centros3.jpg', 85, 'Papel, vidrio');


INSERT INTO capacidad (id, punto_de_reciclaje_id, fecha_registro, capacidad )
VALUES
  (1, 1, '2023-05-01 14:00:00', 45),
  (2, 2, '2023-05-01 14:00:00', 20),
  (3, 3, '2023-05-02 14:00:00', 70),
  (4, 4, '2023-05-02 14:00:00', 85);

--Mostrar la información completa de todos los puntos de reciclaje

  SELECT * FROM puntos_de_reciclaje;

--Mostrar la direccion de cada punto de reciclaje

SELECT nombre, direccion FROM puntos_de_reciclaje;

--Mostrar la capacidad actual de cada punto de reciclaje

SELECT pr.nombre, c.capacidad 
FROM capacidad c 
INNER JOIN puntos_de_reciclaje pr ON c.punto_de_reciclaje_id = pr.id;

--Mostrar los puntos de reciclaje de la comuna de Viña del Mar

SELECT * FROM puntos_de_reciclaje WHERE comuna = 'Viña del mar';

--Mostrar la capacidad promedio de todos los puntos de reciclaje

SELECT AVG(capacidad) FROM capacidad;

--Mostrar la capacidad máxima registrada en cada punto de reciclaje

SELECT pr.nombre, MAX(c.capacidad) 
FROM capacidad c 
INNER JOIN puntos_de_reciclaje pr ON c.punto_de_reciclaje_id = pr.id 
GROUP BY pr.nombre;

--Mostrar la capacidad actual de un punto de reciclaje específico (por ejemplo, el punto de reciclaje con ID 1):

SELECT capacidad FROM capacidad WHERE punto_de_reciclaje_id = 1 ORDER BY fecha_registro DESC LIMIT 1;

