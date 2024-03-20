--Consultas de agregado
--Caracteristicas principales es que se duvuelven un solo registro

use NORTHWND

--TOP Y PERCENT
--Selecciona las primeras 10 ordenes de compra

--Primeros 10 registros
select top 10* from Orders

--Ultimos 10 registros
select top 10* from Orders
order by OrderID desc

select top 10 CustomerID as 'Numero de Cliente', orderdate as 'Fecha de orden',
shipcountry as 'Pais de entrega' from Orders
order by OrderID desc

--Selccionar el 50% de los registros

select top 50 percent * from Orders

--Sleccionar los primeros 3 clientes de alemania
 Select top 3 CompanyName, Country from Customers
 where Country = 'germany'


-- Seleccionar el producto con el precio mayor
Select ProductName, UnitPrice from Products
order by unitprice desc

--Muestra el precio mas alto de los productos (MAX)
select max(unitprice) as 'Precio máximo'  from Products

--Mostrar el precio mínimo de los productos
select min(unitprice) as 'Precio nínimo'  from Products

--Sleccionar todas las órdenes de compra

select * from Orders
--Seleccionar el numero total de ordenes 
--Cuenta todas las filas
select count(*) as 'Total de ordenes' from Orders

--Cuenta todos aquellos que no sean null
select count(ShipRegion) as 'Total de ordenes' from Orders

--Selecionar todas aquella ordenes dodne la region de envio no sea null
select ShipRegion from Orders
where ShipRegion is not null

--Seleccionar de forma ascendente los productos por precio
select ProductName, UnitPrice from Products
order by UnitPrice asc

--Sleccionar el numero de precios de los productos
select count( distinct unitprice) from Products

--Contar todos los diferentes paises de los clientes
select count  (distinct country) as 'Paises'  from Customers

--Seleccionar la suma total de cantidades de las ordenes de compra
select sum(Quantity) from [Order Details]

select * from [Order Details]
--Selecionar todos los registros de orde detaisl calculando su importe
--CAMPO CALCULADO

select *, (unitprice*quantity) as 'Importe' from [Order Details]

--Seleccionar el total en dinero que ha vendido la empresa
select sum(unitprice*quantity) as 'Total vendido'from [Order Details]
use NORTHWND
--Seleccionar el total de ventas del producto Chang
select * from[Order Details]
select sum(unitprice*Quantity) as Total from [Order Details]
where ProductID = 2

--Sleccionar el promedio de los precios de los productos (avg)
select avg(unitprice) from Products
--Sleccionar el promedio total y el total de venta de los productos
--41, 60 y 31
select sum(unitprice*quantity) as Total, avg(unitprice*quantity)
from [Order Details]
where ProductID in(41,60,31)

select sum(unitprice*quantity) as Total, avg(unitprice*quantity)
from [Order Details]
where ProductID = 41 or ProductID= 60 or ProductID = 31

--Seleccionar el numero de ordenes realizadas entre 1996 y 19978
-- Seleccionar el numero de ordenes realizadas entre 1996 y 1997
select count(*) from Orders
where OrderDate>='1996-01-01' and OrderDate<='1997-12-31'

select count(*) from Orders
where OrderDate between '1996-01-01' and '1997-12-31'

select year(OrderDate) from Orders

select count(*) from Orders
where year(OrderDate)='1996'


select count(*) from Orders
where year(OrderDate)in('1996', '1997')

select count(*) from Orders
where year(OrderDate)between '1996' and '1997'

--Instrucción gruop by

select country, count(*) as Numero from Customers
group by Country

--Seleccionar el numero de ordenes por el Shippervia
select  ShipVia, count(*) from Orders
group by shipvia

select  ShipVia, count(*) from Orders

select s.CompanyName as  'Nombre Compañia', count(*) as Total
from Orders as o
inner join Shippers as s
on o.ShipVia = s.ShipperID
group by s.CompanyName
