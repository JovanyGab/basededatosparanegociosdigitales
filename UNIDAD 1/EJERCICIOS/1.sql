--Lengiaje sql de manipulacipon de datos sql-lmd(insert, delete, update and select)
--Seleccionar todos los datos de las tablas categoria

use dbentornosvip

select*from tblcategoria
--agregar una sola fila a tabal categoria

insert into tblcategoria
values (1, 'Carnes frias')
insert into tblcategoria
values (2, 'Lacteos')
insert into tblcategoria
values (3, 'Vinos y licores')
insert into tblcategoria
values (4, 'Ropa')

--insertar varios registros a la vez
insert into tblcategoria
values (7,'Carnes Buenas' ),
(8,'Dulces' ),
(9,'Panaderia' ),
(10,'Salchiconeria' )

use dbentornosvip
select categoriaid, descripcion from tblcategoria

--insertar datos a partir de una consulta
--aCTUALIZACION DE DATOS UTILIZANDO SQL-LMD
use Practica2

select * from tblProducto
insert into tblProducto
values(1, 'Salchiconeria', 600, 12)

insert into tblProducto
values (2,'Carnes Buenas' ),
(3,'Dulces' ),
(4,'Panaderia' ),
(5,'Salchiconeria' )


update tblProducto
set idProducto = 5
where descripcion = 'Salchiconeria'

update tblProducto
set descripcion =  'Salchiconeria',
existencia = 10
where idProducto = 1

alter table tblproducto
add constraint pk_
primary key(Productoid)

--Eliminar registors de una tabla
/*
	delete from tabla
	where expresion
	*/

	select * from tblProducto

	delete from tblProducto
	where idProducto = 1


