use NORTHWND

/*Sintaxis
CASE
	When condicion 1 THEN resultado 1
	When condicion 1 THEN resultado 1
	When condicion 1 THEN resultado 1
	ELSE result
	ENd;
	*/
	select *,
		case 
			when Quantity >30 then 'La cantidad es mayor a 30'
			when Quantity = 30 then ' La cantidad es 30'
			else ' La cantidad esta por debajo de los 30'
			end as CatidadTexto
	from [Order Details]

	select *,
		case 
			when 
			when UnitPrice between 0 and 20 then 'stock bajo'
			when UnitPrice between 21 and 50 then 'stock medio'
			when UnitsInStock >= 51 and UnitsInStock <= 90 then 'stock alto'
			else' stock maximo'
			end as 'tipo stock'
	Northwnd.dbo.from Products

	create database pruebacase

create table nuevatabla(
id int not null,
nombre nvarchar (40) not null,
unitprice money,
unitinstock smallint,
constraint pk_nuevatabla
primary key (id)
)
--Crear la estructura de una tabla en base a una consulta
select top 0 productid as numeroproducto,
productname as decripcion, unitprice as preciounitario,
unitinstock as existencia
into nuevatabla2
from Northwind.dbo.Products