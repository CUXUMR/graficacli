
create database tienda2


CREATE TABLE ventas (
venta_id SERIAL NOT NULL,
venta_fecha datetime year to minute,
venta_situacion SMALLINT DEFAULT 1 NOT NULL,
PRIMARY KEY(venta_id)
)



CREATE TABLE productos (
producto_id SERIAL NOT NULL,
producto_nombre VARCHAR(50) NOT NULL,
producto_precio DECIMAL(10,2) NOT NULL,
producto_situacion SMALLINT DEFAULT 1 NOT NULL,
PRIMARY KEY(producto_id)
)

create table detalle_ventas(
detalle_id serial not null,
detalle_cliente integer,
detalle_venta integer,
detalle_producto integer,
detalle_cantidad integer,
detalle_situacion smallint default 1,
primary key (detalle_id),
foreign key (detalle_cliente) references clientes (cli_id),
foreign key (detalle_venta) references ventas (venta_id),
foreign key (detalle_producto) references productos (producto_id)
)

create table clientes (
    cli_id serial,
    cli_nombre varchar (25),
    cli_situacion smallint default 1,
    primary key (cli_id)
)

INSERT INTO productos (producto_nombre, producto_precio) values ('MESA', 1500.25);
INSERT INTO productos (producto_nombre, producto_precio) values ('ESCRITORIO', 9000);
INSERT INTO productos (producto_nombre, producto_precio) values ('COMPUTADORA', 15000);

insert into ventas (venta_fecha) values (current);
insert into ventas (venta_fecha) values (current);


insert into detalle_ventas (detalle_cliente, detalle_venta, detalle_producto, detalle_cantidad) values (1,1,1,1);
insert into detalle_ventas (detalle_cliente, detalle_venta, detalle_producto, detalle_cantidad) values (2,1,3,2);
insert into detalle_ventas (detalle_cliente, detalle_venta, detalle_producto, detalle_cantidad) values (2,2,2,3);
insert into detalle_ventas (detalle_cliente, detalle_venta, detalle_producto, detalle_cantidad) values (3,2,1,1);

insert into detalle_ventas (detalle_cliente, detalle_venta, detalle_producto, detalle_cantidad) values (2,1,1,1);
insert into detalle_ventas (detalle_cliente, detalle_venta, detalle_producto, detalle_cantidad) values (1,1,3,2);
insert into detalle_ventas (detalle_cliente, detalle_venta, detalle_producto, detalle_cantidad) values (1,2,2,2);
insert into detalle_ventas (detalle_cliente, detalle_venta, detalle_producto, detalle_cantidad) values (3,2,1,1);

insert into detalle_ventas (detalle_cliente, detalle_venta, detalle_producto, detalle_cantidad) values (4,2,2,4);
insert into detalle_ventas (detalle_cliente, detalle_venta, detalle_producto, detalle_cantidad) values (4,2,1,2);

insert into detalle_ventas (detalle_cliente, detalle_venta, detalle_producto, detalle_cantidad) values (1,2,2,4);
insert into detalle_ventas (detalle_cliente, detalle_venta, detalle_producto, detalle_cantidad) values (1,2,1,2);
insert into detalle_ventas (detalle_cliente, detalle_venta, detalle_producto, detalle_cantidad) values (1,2,2,4);
insert into detalle_ventas (detalle_cliente, detalle_venta, detalle_producto, detalle_cantidad) values (2,2,1,2);



insert into clientes (cli_nombre) values ('CUXUM RAXCACO NIXON');
insert into clientes (cli_nombre) values ('CHOCOJ CRUZ');
insert into clientes (cli_nombre) values ('MARDOQUEO ROBERTO');
insert into clientes (cli_nombre) values ('JEAN JUAN PABLO');





select producto_nombre as producto, sum(detalle_cantidad) as cantidad
from detalle_ventas 
inner join productos on detalle_producto = producto_id 
where detalle_situacion = 1
group by producto_nombre

SELECT
    cli_id AS cliente_id,
    cli_nombre AS cliente_nombre,
    COUNT(detalle_id) AS cantidad_compras
FROM
    clientes
LEFT JOIN
    detalle_ventas ON cli_id = detalle_cliente
GROUP BY
    cli_id, 
    cli_nombre
ORDER BY
    cantidad_compras DESC;
