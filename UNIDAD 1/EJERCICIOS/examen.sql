use NORTHWND
--1
select p.ProductName as 'Nombre producto', (od.Quantity * od.UnitPrice)
 as 'Importe' 
from [Order Details] as od
inner join Products as p 
on p.ProductID = od.ProductID
inner join Orders as o 
on o.OrderID = od.OrderID
where year(o.OrderDate) = '1997'
order by 2

--2
select c.CompanyName as 'Cliente', count(*) as 'Cantidad Compras'
from Orders as o
inner join  Customers as c
on o.CustomerID = c.CustomerID
group by c.CompanyName
having count(*) 1

--3
select * from
Products as p
left join [Order Details] as od
on p.ProductID = od.ProductID
where od.ProductID is null
order by p.ProductName asc

--4
select
from Categories as c
inner join Products as p
on c.CategoryID = p.ProductID
inner join [Order Details] as od
on od.ProductID = p.ProductID
group by 



--
