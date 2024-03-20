--Consultas simples con select-sq-lmd
--Seleccionar los nuevos clientes

select * from Customers


--Seleccionar nombre del cliente, nombre del contacto y la ciudad
select CompanyName, ContactName, City from Customers

--seleccionar todos los paises de los clientes
select country from Customers

--Selecciona el numero de paises de donde son mis clientes(count)
select count(*) from Customers
select count(Country) from Customers
select count(distinct Country) from Customers
-- ''
--Seleccionar el cliente que tenga un id Anton
select * from Customers
where CustomerID = 'ANTON'

--Seleccionar todos los clientes de mexico
select * from Customers
where Country = 'Mexico'

--Seleecionar todos los registros de los clientes de berlin
select CompanyName, City, Country from Customers
where City = 'Berlin'

--Order by
--Seleccionar todos los productos ordenados por precio


select * from Products
order by UnitPrice

--Sleccionar todos los productos ordenados porel precio de mayor a menor 
select * from Products
order by UnitPrice desc

--Seleccionar todos los prodcutos alfabeticamente
select * from Products
order by ProductName 

--Seleccionar todos los clientes por paies y dentro por nombre de forma ascendente
select  City, CompanyName,Country from Customers
order by Country, CompanyName desc

--Operador and
--Seleccionar todos los clientes de españa y que su nombre comience con g
select ContactName, Country from Customers 
where Country = 'Spain' and CompanyName like 'G%'

--Seleccionar todos los clientes de berlin, alemania con un codigo postal mayor a 1200
select Country, City, PostalCode from Customers
where Country = 'Germany' and 
City = 'Berlin' and PostalCode 1200

--Seleccionar todos los clientes de españa y
-- que su nombre comience con g o con R

select CompanyName, Country from Customers
where Country  ='Spain' and (CompanyName like 'G%'or CompanyName like 'R%') 

--Calusula or
--Selecionar todos los clientes de alemania o españa
select Country from Customers
where Country = 'Germany' or
Country = 'Spain'

--Seleccionar todos los clientes de Berlin o de Noruega o que comience su nombre con G
select * from Customers

--Seleccionar todos los productos que no tengan un precio
--entre 18 y 20 dolares

select unitprice, productname from Products
where UnitPrice >=18 and UnitPrice <=20
--between solo para rangos
select unitprice, productname from Products
where UnitPrice not between 18 and 20

select city, companyname from Customers
where not (city = 'paris'or city = 'london')

select city, companyname from Customers
where city in ('paris','london')

select city, companyname from Customers
where city not in ('paris','london')

--Seleccionar todos los productos que no tengan precios mayores a 30

--Sleccionar todos los productos que no tengan precios menores a 30

--Sleccionar todos los clientes que comiencen con a
where companyname like ''

--Seleccionar todos los clientes que finalizan con la palabra "es"

--Seleccionat todos los clientes que contengas la palabra "mer"

--Seleccionar todos los clientes con una ciudad que cominece
--con cualquier caracter seguido de la palabra londo

select city, CompanyName from customers
where City like '%_ondon' 

use NORTHWND

select * from
Customers
where City like '%L___on'

--Sleccionar todos los productos que comiencen con "a", "c","t"
select ProductName from
Products
where productname like '[act]%'

-
/* Seleccionar todos los productos que comiencen
de la letra b a la g */

select ProductName from
Products
where productname like '[b-g]%'

/* Clausula in()
alemania, españa y reino unido*/
Select Country from 
Customers
where country in('germany', 'spain', 'uk')

/* Seleccionar todos los clientes que no son de 
alemania, españa y reino unido*/
Select Country from 
Customers
where country not in('germany', 'spain', 'uk')

Select Country from 
Customers
where not (country= 'germany'
or country='spain' or country= 'uk')

--Instruccion between
--Seleccionar todos los productos de un precio 
--de entre 10 y 20 dls

select unitprice from Products
where UnitPrice between 10 and 20 

--Alias de columnas y alias de productos
--seleccionat el mombre del prodcuto, su stock y su precio

select productname as 'Nombre del Producto', unitsinstock, unitprice from Products

select ProductName as 'Nombre del Producto',
UnitsInStock as existencia, UnitPrice precio from Products

select ProductName as 'Nombre del Producto',
UnitsInStock as existencia, p.UnitPrice precio
from Products as p
inner join [Order Details] as od
on p.ProductID = od.ProductID