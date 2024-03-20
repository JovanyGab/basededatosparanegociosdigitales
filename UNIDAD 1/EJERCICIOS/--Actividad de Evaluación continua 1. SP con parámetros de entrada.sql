use NORTHWND
--Realizar un sp para Calcular el Total de una orden.
create proc TotalOrdenes
@ordenes nvarchar(15)
as
begin
select sum(UnitPrice * Quantity) AS TotalOrder
from[Order Details]
where OrderID = @ordenes
end
go

--Realizar un sp para Actualizar la Cantidad de Productos en Stock
create proc ActualizarStock
@productoID int,
@cantidad int
as
begin
 update Products
 set UnitsInStock = UnitsInStock - @cantidad
where ProductID = @productoID
end
go

--Realizar un SP para Calcular el Total de Ventas de un Empleado
create proc TotalVentasEmpleado
@empleadoID int
as
begin
select sum(od.UnitPrice * od.Quantity) as TotalVentas
from [Order Details] od
inner join Orders o on od.OrderID = o.OrderID
where o.EmployeeID = @empleadoID
end
go

--Realizar un SP para Actualizar el Nombre de un Empleado
create proc ActualizarNombreEmpleado
@empleadoID int,
@nuevoNombre nvarchar(50),
@nuevoApellido nvarchar(50)
as
begin
 update Employees
 set FirstName = @nuevoNombre, LastName = @nuevoApellido
where EmployeeID = @empleadoID
end
go
--Realizar un SP para Obtener el Total de Ventas por Pa�s
create proc TotalVentasPorPais
as
begin
select c.Country, sum(od.UnitPrice * od.Quantity) as TotalVentas
from [Order Details] od
 INNER JOIN Orders o on od.OrderID = o.OrderID
 INNER JOIN Customers c on o.CustomerID = c.CustomerID
 group by c.Country
end
go
--Realizar un SP para Obtener el N�mero de �rdenes por Cliente
create proc NumeroOrdenesPorCliente
as
begin
select o.CustomerID, COUNT(o.OrderID) as NumeroOrdenes
from Orders o
group by o.CustomerID
end
go
--Realizar un SP para Calcular el Total de Productos Vendidos por Categor�a
create proc TotalProductosPorCategoria
as
begin
 select  p.CategoryID, sum(od.Quantity) as TotalProductosVendidos
from [Order Details] od
 INNER JOIN Products p on od.ProductID = p.ProductID
 group by p.CategoryID
end
go

--SP para Calcular el Total de Ventas por A�o
create proc TotalVentasPorA�o
as
begin
select year(o.OrderDate) AS A�o, sum(od.UnitPrice * od.Quantity) as TotalVentas
 from [Order Details] od
inner join Orders o on od.OrderID = o.OrderID
group by year (o.OrderDate)
end
go