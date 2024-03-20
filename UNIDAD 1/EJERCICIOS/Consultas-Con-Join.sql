--Consultas con joins
--inner joins
use NORTHWND

--Seleccionar el numero de ordenes, nombre del cliente yfechar de orden

select OrderID, CompanyName, OrderDate 
from Orders as O
inner join Customers as C
on C.CustomerID = O.CustomerID

--Mostrar el numero de ordenes de cada cliente mostrando el
--nombre de la compañia

select CompanyName as  'Nombre Compañia', count(*) as Total
from Orders as o
inner join Customers as c
on c.CustomerID = o.CustomerID
group by CompanyName
order by 2 desc

--Seleccionar el numero de producto, nombre de productos y
-- el nombre de la categoria ordenados de forma ascendente con respecto
-- al nombre de la categoria

select ProductName as 'Nombre del producto', count(*) as 'Total productos'
from Products

use NORTHWND

/*Seleccionar todas las órdenes de compra
mostrando las fechas de ordenes de compra
nombre del shipper y el nombre del cliente
al que se le vendió utlizado iner join
order, shipper y customers*/

select c.Companyname, o.orderdate, s.CompanyName from
customers as c
inner join orders as o
on c.CustomerID = o.CustomerID
inner join Shippers as s
on o.ShipVia = s.ShipperID

--Seleccionar orden del producto y su categoria
select c.categoryname, p.productname from
Categories as c
inner join Products as p
on c.CategoryID = p.CategoryID



--Listar el nombre del cliente, la fecha de la orden 
--nombres de los productos que fueron vendidos 

select c.companyname, o.orderdate, p. productname from 
customers as c
inner join Orders as o
on c.customerid = o.customerid
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Products as p
on od.ProductID = p.ProductID

/*Seleccionar el los nombrs completo de los empleados
los nombres de los productos que vendio y la
cantidad de ellos y calcular su importe*/

select  CONCAT(e.firstname,' ', e.lastname) as 'Nombre empleado',
p.productname as 'Nombre del producto',
od.quantity as 'Cantidad', od.quantity * od.unitprice as 'Importe'
from Employees as e
inner join Orders as o 
on e.employeeid = o.EmployeeID
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Products as p
on od.ProductID = p.ProductID

/*Seleccionar los nombres completos de los empleados
los nombres de los productos que vendio, la cantidad
de ellos, calcular el importe pero solo de suiza, alemania
y francia*/

select  CONCAT(e.firstname,' ', e.lastname) as 'Nombre empleado',
p.productname as 'Nombre del producto',
od.quantity as 'Cantidad', od.quantity * od.unitprice as 'Importe'
from Employees as e
inner join Orders as o 
on e.employeeid = o.EmployeeID
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Products as p
on od.ProductID = p.ProductID
where o.ShipCountry in ('Switzerland', 'Germany', 'France')


/*Seleccionar los nombres completos de los empleados
los nombres de los productos que vendio, la cantidad
de ellos, calcular el importe pero solo de suiza, alemania
y francia, agrupados por la cantidad total de ordenes hechas
por los empleados*/

select  CONCAT(e.firstname,' ', e.lastname) as 'Nombre empleado',
count(*) as 'total de ordenes',
p.productname as 'Nombre del producto', 
od.quantity as 'Cantidad', od.quantity * od.unitprice as 'Importe'
from Employees as e
inner join Orders as o 
on e.employeeid = o.EmployeeID
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Products as p
on od.ProductID = p.ProductID
where o.ShipCountry in ('Switzerland', 'Germany', 'France')
group by CONCAT(e.firstname,' ', e.lastname), o.ShipCountry, p.ProductID
order by 1


--Seleccionar el total de dinero que se le han vendido a cada uno 
-- de los clientes de 1996

SELECT c.CompanyName AS Nombre_Cliente,
    SUM(od.Quantity * od.UnitPrice) AS Total_Vendido
FROM Customers as c
INNER JOIN Orders as o
ON c.CustomerID = o.CustomerID
INNER JOIN OrderDetails as od
ON od.OrderID = od.OrderID
WHERE YEAR(o.OrderDate) = 1996
GROUP BY  c.CustomerID
¨
/*Seleccionar el total de dinero que se le han vendido a cada uno
de los clientes por cad años*/
