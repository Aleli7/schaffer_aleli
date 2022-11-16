-- 1. Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar
-- ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
SELECT * FROM ventas.pedidos ORDER BY ventas.pedidos.fecha DESC;

-- 2. Devuelve todos los datos de los dos pedidos de mayor valor.
SELECT * FROM ventas.pedidos ORDER BY pedidos.cantidad DESC LIMIT 2;

-- 3. Devuelve un listado con los identificadores de los clientes que han realizado algún pedido.
-- Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
SELECT DISTINCT id_cliente FROM ventas.pedidos WHERE pedidos.id >= 1 ORDER BY id_cliente ASC;

-- 4. Devuelve un listado de todos los pedidos que se realizaron durante el año 2022, cuya cantidad total sea superior a $500.
SELECT * FROM ventas.pedidos WHERE pedidos.fecha BETWEEN '2022-01-01' AND '2022-12-31' AND pedidos.cantidad > 500;

-- 5. Devuelve un listado con el nombre y apellido de los vendedores que tienen una comisión entre 0.05 y 0.11.
SELECT * FROM ventas.vendedores WHERE comisión BETWEEN 0.05 AND 0.11;

-- 6. Devuelve el valor de la comisión de mayor valor que existe en la tabla vendedores.
SELECT MAX(vendedores.comisión) FROM ventas.vendedores;

-- 7. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo cuitcuil no es
-- NULL. El listado deberá estar ordenado alfabéticamente por apellido y nombre.
SELECT clientes.id, clientes.nombre, clientes.apellido FROM ventas.clientes WHERE clientes.cuitcuil IS NOT NULL 
ORDER BY clientes.apellido, clientes.nombre ASC;

-- 8. Devuelve un listado de los nombres de los clientes que empiezan por “A” y terminan por “n” y también los nombres que 
-- empiezan por “P”. El listado deberá estar ordenado alfabéticamente.
SELECT clientes.nombre FROM ventas.clientes WHERE clientes.nombre 
LIKE 'A%N' OR clientes.nombre LIKE 'P%' ORDER BY clientes.nombre ASC;

-- 9. Devuelve un listado de los nombres de los clientes que no empiezan por “A”. El listado deberá
-- estar ordenado alfabéticamente.
SELECT clientes.nombre FROM ventas.clientes WHERE clientes.nombre NOT LIKE 'A%' ORDER BY clientes.nombre ASC;

-- 10.Devuelve un listado con los nombres de los vendedores que terminan por “el” o “o”. Tenga en
--cuenta que se deberán eliminar los nombres repetidos.
SELECT DISTINCT clientes.nombre FROM ventas.clientes WHERE clientes.nombre LIKE '%O' OR clientes.nombre LIKE '%EL';

-- 11.Devuelve un listado con el identificador, nombre y apellido de todos los clientes que han
--realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar
--los elementos repetidos.
SELECT DISTINCT clientes.id, clientes.nombre, clientes.apellido FROM ventas.clientes
INNER JOIN ventas.pedidos ON clientes.id = pedidos.id_cliente
WHERE pedidos.id_cliente NOT NULL;

-- 12.Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado
--debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de
--los clientes ordenados alfabéticamente.
SELECT * FROM ventas.clientes
INNER JOIN ventas.pedidos ON clientes.id = pedidos.id_cliente
WHERE pedidos.id_cliente >= 1 ORDER BY clientes.nombre, clientes.apellido, clientes.cuitcuil ASC;

-- 13.Devuelve un listado que muestre todos los pedidos en los que ha participado un vendedor. El
--resultado debe mostrar todos los datos de los pedidos y de los vendedores. El listado debe
--mostrar los datos de los vendedores ordenados alfabéticamente.
SELECT * FROM ventas.clientes
INNER JOIN ventas.pedidos ON clientes.id = pedidos.id_cliente
WHERE pedidos.id_vendedor NOT NULL ORDER BY pedidos;

-- 14.Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y
--con los datos de los vendedores asociados a cada pedido.
SELECT * FROM ventas.clientes
INNER JOIN ventas.pedidos ON clientes.id = pedidos.id_cliente 
INNER JOIN ventas.vendedores ON pedidos.id_vendedor = vendedores.id
WHERE pedidos.id_vendedor NOT NULL
ORDER BY vendedores.nombre, vendedores.apellido, vendedores.cuitcuil ASC;

--15.Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2022, cuyo
--monto esté entre $300 y $1000.
SELECT clientes.id, clientes.nombre, clientes.apellido FROM ventas.clientes
INNER JOIN ventas.pedidos ON clientes.id = pedidos.id_cliente
WHERE pedidos.id >= 1 AND pedidos.fecha BETWEEN '2022-01-01' AND '2022-12-31'
AND pedidos.cantidad BETWEEN '300' AND '1000';

--16.Devuelve el nombre y apellido de todos los vendedores que han participado en algún pedido
--realizado por María Santana.
SELECT DISTINCT vendedores.nombre, vendedores.apellido FROM ventas.clientes
INNER JOIN ventas.pedidos ON clientes.id = pedidos.id_cliente 
INNER JOIN ventas.vendedores ON pedidos.id_vendedor = vendedores.id
WHERE clientes.nombre = 'María' AND clientes.apellido = 'Santana';


--17.Devuelve el nombre de todos los clientes que han realizado algún pedido con el vendedor
--Daniel Sáez.
SELECT clientes.nombre FROM ventas.clientes
INNER JOIN ventas.pedidos ON clientes.id = pedidos.id_cliente 
INNER JOIN ventas.vendedores ON pedidos.id_vendedor = vendedores.id
WHERE vendedores.nombre = 'Daniel' AND vendedores.apellido = 'Sáez';

-- 18.Devuelve un listado con todos los clientes junto con los datos de los pedidos que han
-- realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido.
-- El listado debe estar ordenado alfabéticamente por el apellido y nombre de los clientes.
SELECT * FROM ventas.clientes
LEFT JOIN ventas.pedidos ON clientes.id = pedidos.id_cliente 
ORDER BY clientes.apellido, clientes.nombre ASC;

-- 19.Devuelve un listado con todos los vendedores junto con los datos de los pedidos que han
-- realizado. Este listado también debe incluir los vendedores que no han realizado ningún
-- pedido. El listado debe estar ordenado alfabéticamente por el apellido y nombre de los
-- vendedores.
SELECT * FROM ventas.vendedores
LEFT JOIN ventas.pedidos ON vendedores.id = pedidos.id_vendedor
ORDER BY vendedores.apellido, vendedores.nombre ASC;

-- 20.Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
SELECT * FROM ventas.clientes
LEFT JOIN ventas.pedidos ON clientes.id = pedidos.id_cliente 
WHERE pedidos.id_cliente IS NULL;
-- 21.Devuelve un listado que solamente muestre los vendedores que no han realizado ningún
-- pedido.
SELECT * FROM ventas.vendedores
LEFT JOIN ventas.pedidos ON pedidos.id_vendedor = vendedores.id
WHERE pedidos.id_vendedor IS NULL;

-- 22.Devuelve un listado con los clientes que no han realizado ningún pedido y de los vendedores
-- que no han participado en ningún pedido. Ordene el listado alfabéticamente por el apellido y
-- el nombre. En el listado deberá diferenciar de algún modo los clientes y los vendedores.
SELECT vendedores.nombre AS nombre, vendedores.apellido AS apellido, ' ' AS clientes_id, vendedor.id AS vendedor_id
FROM pedidos RIGHT JOIN vendedores ON vendedores.id = pedidos.id_vendedor
WHERE pedidos.id_vendedor IS NULL 
UNION
SELECT clientes.nombre AS nombre, clientes.apellido AS apellido, clientes.id AS clientes_id, ' ' AS vendedor_id
FROM pedidos RIGHT JOIN clientes ON clientes.id = pedidos.id_cliente
WHERE pedidos.id_cliente IS NULL ORDER BY apellido, nombre ASC;

-- 23.Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
SELECT SUM(pedidos.id) FROM ventas.pedidos;

-- 24.Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
SELECT AVG(pedidos.id) FROM ventas.pedidos;

-- 25.Calcula el número total de vendedores distintos que aparecen en la tabla pedido.
SELECT DISTINCT COUNT(pedidos.id_vendedor) FROM ventas.pedidos;

-- 26.Calcula el número total de clientes que aparecen en la tabla cliente.
SELECT DISTINCT COUNT(pedidos.id_cliente) FROM ventas.pedidos;

-- 27.Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
SELECT MAX(pedidos.cantidad) FROM ventas.pedidos;

-- 28.Calcula cuál es la menor cantidad que aparece en la tabla pedido.
SELECT MIN(pedidos.cantidad) FROM ventas.pedidos;

-- 29.Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la
-- tabla cliente.
SELECT MAX(clientes.categoría), ventas.clientes.ciudad FROM ventas.clientes GROUP BY clientes.ciudad 
ORDER BY MAX(clientes.categoría) DESC;

---30.Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno
-- de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes
-- cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada
-- uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del
-- cliente, nombre, apellido, la fecha y el valor de la cantidad.
SELECT clientes.nombre, clientes.apellido, pedidos.fecha, MAX(pedidos.id) FROM ventas.clientes
INNER JOIN ventas.pedidos ON clientes.id = pedidos.id_cliente 
GROUP BY pedidos.id_cliente, pedidos.fecha ORDER BY pedidos.fecha DESC;

-- 31.Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno
-- los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen
-- la cantidad de $2000.
SELECT clientes.nombre, MAX(pedidos.id) FROM ventas.clientes
INNER JOIN ventas.pedidos ON clientes.id = pedidos.id_cliente 
GROUP BY pedidos.id_cliente WHERE pedidos.cantidad > 2000;

-- 32.Calcula el máximo valor de los pedidos realizados para cada uno de los vendedores durante la
-- fecha 2021-08-17. Muestra el identificador del vendedor, nombre, apellido y total.
SELECT MAX(pedidos.id), SUM(pedidos.id), vendedores.nombre, vendedores.apellido, vendedores.id vendedor
FROM ventas.vendedores
INNER JOIN ventas.pedidos ON vendedores.id = pedidos.id_vendedor
WHERE pedidos.fecha = '2021-08-17';

-- 33.Devuelve un listado con el identificador de cliente, nombre y apellido y el número total de
-- pedidos que ha realizado cada uno de los clientes. Tenga en cuenta que pueden existir
-- clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el
-- listado indicando que el número de pedidos realizados es 0.
SELECT COUNT(pedidos.id), clientes.nombre, clientes.apellido, clientes.id
FROM ventas.clientes
INNER JOIN ventas.pedidos ON clientes.id = pedidos.id_cliente 
WHERE pedidos.id_cliente IS NOT NULL OR pedidos.id_cliente IS NULL
GROUP BY clientes.id;

-- 34.Devuelve un listado con el identificador de cliente, nombre, apellido y el número total de
-- pedidos que ha realizado cada uno de clientes durante el año 2020.
SELECT COUNT(pedidos.id), clientes.nombre, clientes.apellido, clientes.id
FROM ventas.clientes
INNER JOIN ventas.pedidos ON clientes.id = pedidos.id_cliente 
WHERE pedidos.fecha LIKE '%2020%'
GROUP BY clientes.id;

-- 35.Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
SELECT MAX(pedidos.cantidad) FROM ventas.pedidos
GROUP BY YEAR(pedidos.fecha);

--36.Devuelve el número total de pedidos que se han realizado cada año.
SELECT COUNT(pedidos.id) FROM ventas.pedidos
GROUP BY year(pedidos.fecha);

-- 37.Devuelve un listado con todos los pedidos que ha realizado Adela Salas. (Sin utilizar INNER
-- JOIN).
SELECT count(*) FROM ventas.pedidos WHERE pedidos.id_cliente = (SELECT clientes.id 
FROM ventas.clientes
WHERE clientes.nombre = 'Adela' AND clientes.apellido = 'Salas');

-- 38.Devuelve el número de pedidos en los que ha participado el vendedor Daniel Sáez. (Sin utilizar
-- INNER JOIN).
SELECT count(*) FROM ventas.pedidos WHERE pedidos.id_cliente = (SELECT clientes.id 
FROM ventas.clientes
WHERE clientes.nombre = 'Daniel' AND clientes.apellido = 'Sáez');

-- 39.Devuelve los datos del cliente que realizó el pedido más caro en el año 2020. (Sin utilizar
-- INNER JOIN)
SELECT * FROM ventas.clientes
WHERE clientes.id = (SELECT id_cliente FROM ventas.pedidos 
WHERE pedidos.cantidad = (SELECT MAX(pedidos.cantidad) FROM pedidos 
WHERE year(pedidos.fecha) = 2020));

-- 40.Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz
-- Santana.
SELECT * FROM ventas.clientes
WHERE clientes.id = (SELECT id_cliente FROM ventas.pedidos 
WHERE pedidos.cantidad = (SELECT MIN(pedidos.cantidad) FROM pedidos 
WHERE clientes.nombre = 'Pepe' AND clientes.apellido = 'Ruiz Santana'));

-- 41.Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT
-- IN).
SELECT * FROM ventas.clientes
WHERE clientes.id NOT IN (SELECT id_cliente FROM ventas.pedidos);

-- 42.Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando IN o
-- NOT IN).
SELECT * FROM ventas.vendedores
WHERE vendedores.id NOT IN (SELECT id_vendedor FROM ventas.pedidos);

-- 43.Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o
-- NOT EXISTS).
SELECT * FROM ventas.clientes
WHERE NOT EXISTS (SELECT id_cliente FROM ventas.pedidos 
WHERE clientes.id = pedidos.id_cliente);

-- 44.Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando
-- EXISTS o NOT EXISTS).
SELECT * FROM ventas.vendedores
WHERE NOT EXISTS (SELECT id_vendedor FROM ventas.pedidos 
WHERE vendedores.id = pedidos.id_vendedor);
