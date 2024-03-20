/*Ejercicio1 1.  Realizar un SP que calcule las ventas totales hechas por cada
empleado por a�o, el sp debe solicitar el nombre del empleado y un a�o inicial y un a�o final*/
use NORTHWND
select* from Employees
create proc CalcularVentasPorEmpleadoYA�o
    @NombreEmpleado nvarchar(100),
    @A�oInicial int,
    @A�oFinal int
as
begin
select e.EmployeeID,
e.FirstName + ' ' + e.LastName as NombreEmpleado,
year(o.OrderDate) as A�o,
sum(od.Quantity * od.UnitPrice) as VentasTotales
from Employees e
inner join Orders o on e.EmployeeID = o.EmployeeID
inner join [Order Details] od on  o.OrderID = od.OrderID
where e.FirstName + ' ' + e.LastName = @NombreEmpleado
and year(o.OrderDate) between @A�oInicial and @A�oFinal
group by e.EmployeeID, e.FirstName, e.LastName, year(o.OrderDate);
end
select * from Orders
exec CalcularVentasPorEmpleadoYA�o 
    @NombreEmpleado = 'Andrew Fuller',
    @A�oInicial = 1996,
    @A�oFinal = 1997



/*Ejercicio 2.  crear y  sp que Muestre el precio
promedio de los productos dentro de cada categor�a, incluyendo solo aquellas
categor�as cuyo precio promedio de producto supere el precio enviado en el store procedure*/

