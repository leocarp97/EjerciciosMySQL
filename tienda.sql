DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);


/*Ejercicio 1 */
SELECT nombre FROM PRODUCTO;
/*Ejercicio 2 */
SELECT nombre , precio FROM PRODUCTO;
/*Ejercicio 3 */
SELECT * FROM PRODUCTO;
/*Ejercicio 4 */
SELECT nombre , ROUND(precio) FROM PRODUCTO;
/*Ejercicio 5 */
SELECT p.codigo_fabricante, p.nombre
FROM PRODUCTO p 
INNER JOIN FABRICANTE f
ON p.codigo_fabricante = f.codigo;
/*Ejercicio 10 */
SELECT p.codigo_fabricante, p.nombre, f.codigo
FROM PRODUCTO p 
INNER JOIN FABRICANTE f
ON p.codigo_fabricante = f.codigo
GROUP BY p.codigo_fabricante ;
/*Ejercicio 11 */
SELECT nombre FROM FABRICANTE
ORDER BY nombre ASC;
/*Ejercicio 12 */
SELECT nombre , precio FROM PRODUCTO
ORDER BY nombre ASC, precio DESC;

SELECT nombre , precio FROM PRODUCTO
ORDER BY  precio DESC;
/*Ejercicio 13 */
SELECT * FROM FABRICANTE
WHERE codigo<=5;
/*Ejercicio 14 */
SELECT nombre , precio FROM PRODUCTO 
ORDER BY precio ASC LIMIT 1;
/*Ejercicio 15 */
SELECT nombre , precio FROM PRODUCTO 
ORDER BY precio DESC LIMIT 1;
/*Ejercicio 16 */
SELECT nombre , precio FROM PRODUCTO 
WHERE precio <=120;
/*Ejercicio 17 */
SELECT nombre , precio FROM PRODUCTO 
WHERE precio BETWEEN 60 AND 200;
/*Ejercicio 18 */
SELECT * FROM PRODUCTO 
WHERE codigo_fabricante IN (1,3,5);
/*Ejercicio 23 */
SELECT nombre FROM PRODUCTO
WHERE  nombre LIKE "Portátil%";
/*Consultas multitabla
Ejercicio 1
 */
SELECT p.codigo_fabricante, p.nombre, f.codigo, f.nombre
FROM PRODUCTO p 
INNER JOIN FABRICANTE f
ON p.codigo_fabricante = f.codigo;
/*Ejercicio 2*/
SELECT p.nombre, p.precio, f.nombre
FROM PRODUCTO p 
INNER JOIN FABRICANTE f
ON p.codigo_fabricante = f.codigo
ORDER BY f.nombre ASC;
/*Ejercicio 3*/
SELECT p.nombre, p.precio, f.nombre
FROM PRODUCTO p 
INNER JOIN FABRICANTE f
ON p.codigo_fabricante = f.codigo
ORDER BY p.precio ASC LIMIT 1;
/*Ejercicio 4*/
SELECT *
FROM PRODUCTO p 
INNER JOIN FABRICANTE f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre="Lenovo";
/*Ejercicio 5*/
SELECT *
FROM PRODUCTO p 
INNER JOIN FABRICANTE f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre="Crucial" AND p.precio>200;
/*Ejercicio 6*/
SELECT *
FROM PRODUCTO p 
INNER JOIN FABRICANTE f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre IN("Asus", "Hewlett-Packard");
/*Ejercicio 7*/
SELECT p.nombre, p.precio, f.nombre
FROM PRODUCTO p 
INNER JOIN FABRICANTE f
ON p.codigo_fabricante = f.codigo
WHERE p.precio>=180
ORDER BY p.precio DESC, p.nombre ASC;
/* USAR LEFT JOIN AND RIGHT JOIN
Ejercicio 1 */
SELECT *
FROM FABRICANTE f
LEFT JOIN PRODUCTO p
ON p.codigo_fabricante = f.codigo;
/*Ejercicio 2 */
SELECT *
FROM FABRICANTE f
LEFT JOIN PRODUCTO p
ON p.codigo_fabricante = f.codigo
WHERE f.codigo=null;
/* USAR SUBCONSULTAS WHERE
Ejercicio 1*/
SELECT f.nombre FROM FABRICANTE f, PRODUCTO p
WHERE p.codigo_fabricante=2 IN (
SELECT p.nombre FROM FABRICANTE f, PRODUCTO p
WHERE f.nombre="Lenovo" OR p.codigo_fabricante=2 
);

SELECT p.nombre FROM FABRICANTE f, PRODUCTO p
WHERE f.nombre="Lenovo" AND p.codigo_fabricante=2;
/*Ejercicio 2 */
SELECT * FROM PRODUCTO p 
WHERE precio=(
SELECT p.precio FROM PRODUCTO p, FABRICANTE f
WHERE f.nombre = "Lenovo" 
ORDER BY p.precio DESC LIMIT 1
);
/*Ejercicio 3*/
SELECT p.nombre, f.nombre, p.precio FROM PRODUCTO p, FABRICANTE f
WHERE   (
SELECT f.nombre FROM PRODUCTO p, FABRICANTE f
WHERE f.nombre="Lenovo" AND p.codigo_fabricante=2
HAVING MAX(p.precio)
);
SELECT f.nombre, p.precio FROM PRODUCTO p, FABRICANTE f
WHERE f.nombre="Lenovo" AND p.codigo_fabricante=2
HAVING MAX(p.precio);
/*Ejercicio 4*/
SELECT DISTINCT p.nombre, p.precio FROM PRODUCTO p, FABRICANTE f
WHERE p.codigo_fabricante=1 AND p.precio>(
SELECT AVG(p.precio) FROM FABRICANTE f, PRODUCTO p
WHERE f.nombre="Asus" AND p.codigo_fabricante=1
);
SELECT AVG(p.precio) FROM FABRICANTE f, PRODUCTO p
WHERE f.nombre="Asus" AND p.codigo_fabricante=1;

/* USAR SUBCONSULTAS IN / NOT IN
Ejercicio 1*/
SELECT DISTINCT f.nombre FROM FABRICANTE f, PRODUCTO p
WHERE f.nombre  IN (
SELECT DISTINCT f.nombre FROM FABRICANTE f, PRODUCTO p 
WHERE p.codigo_fabricante IN (f.codigo) 
);
/*Ejercicio 2*/
SELECT DISTINCT f.nombre FROM FABRICANTE f, PRODUCTO p
WHERE f.nombre NOT IN( 
SELECT DISTINCT f.nombre FROM FABRICANTE f, PRODUCTO p 
WHERE f.codigo IN (p.codigo_fabricante) 
);
/* USAR SUBCONSULTAS HAVING
Ejercicio 1*/
