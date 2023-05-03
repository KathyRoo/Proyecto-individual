CREATE DATABASE reciclaje;


CREATE TABLE puntos_de_reciclaje (
  id INT PRIMARY KEY,
  nombre VARCHAR(255),
  direccion VARCHAR(255),
  comuna VARCHAR(255),
  region VARCHAR(255),
  imagen VARCHAR(255),
  capacidad INT NOT NULL DEFAULT 0,
  tipo_residuos VARCHAR(255)
);

CREATE TABLE capacidad (
  id INT PRIMARY KEY,
  punto_de_reciclaje_id INT,
  fecha_registro TIMESTAMP  NOT NULL,
  llenado INT NOT NULL DEFAULT 0,
  FOREIGN KEY (punto_de_reciclaje_id) REFERENCES puntos_de_reciclaje(id)
);

INSERT INTO puntos_de_reciclaje (id, nombre, direccion, comuna, region, imagen, tipo_residuos )
VALUES
  (1, 'Punto de reciclaje 1', 'Calle Progreso 962', 'Villa Alemana', 'V', '/img/centros.jpg','Papel, vidrio, plástico, metal'),
  (2, 'Punto de reciclaje 2', 'Calle Claudio Vicuña 524', 'Quilpue', 'V',  '/img/centros2.jpg', 'Papel, plástico'),
  (3, 'Punto de reciclaje 3', 'Calle Sucre 555', 'Viña del mar', 'V',  '/img/centros4.jpg', 'Vidrio, metal'),
  (4, 'Punto de reciclaje 4', 'Avenida Brasil 458', 'Valparaiso', 'V',  '/img/centros3.jpg', 'Papel, vidrio'),
  (5, 'Punto de reciclaje 5', 'Las Condes 1270', 'Las Condes', 'RM',  '/img/centros4.jpg', 'Metal'),
  (6, 'Punto de reciclaje 6', 'Nueva Providencia 6969', 'Providencia', 'RM',  '/img/centros4.jpg', 'Vidrio');


INSERT INTO capacidad (id, punto_de_reciclaje_id, fecha_registro, llenado )
VALUES
  (1, 1, '2023-05-01 14:00:00', 45),
  (2, 2, '2023-05-01 14:00:00', 20),
  (3, 3, '2023-05-02 14:00:00', 70),
  (4, 4, '2023-05-02 14:00:00', 85),
  (5, 5, '2023-05-02 14:00:00', 20),
  (6, 6, '2023-05-02 14:00:00', 30);

--Mostrar la información completa de todos los puntos de reciclaje

  SELECT * FROM puntos_de_reciclaje;

--Mostrar la direccion de cada punto de reciclaje

SELECT * FROM puntos_de_reciclaje;


SELECT * FROM capacidad;
--Mostrar la capacidad actual de cada punto de reciclaje


SELECT 
        pr.id,
        pr.nombre,
        pr.direccion,
        pr.comuna,
        pr.region,
        pr.imagen,
        pr.tipo_residuos,
        c.llenado
    FROM puntos_de_reciclaje pr
    INNER JOIN capacidad c
    ON pr.id = c.punto_de_reciclaje_id
    WHERE
    pr.region = 'V'
    ;


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

