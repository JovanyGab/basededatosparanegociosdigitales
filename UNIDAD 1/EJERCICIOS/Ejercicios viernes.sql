/*Ejercicio1 1.  Realizar un SP que calcule las ventas totales hechas por cada
empleado por año, el sp debe solicitar el nombre del empleado y un año inicial y un año final*/
use NORTHWND
select* from Employees
create proc CalcularVentasPorEmpleadoYAño
    @NombreEmpleado nvarchar(100),
    @AñoInicial int,
    @AñoFinal int
as
begin
select e.EmployeeID,
e.FirstName + ' ' + e.LastName as NombreEmpleado,
year(o.OrderDate) as Año,
sum(od.Quantity * od.UnitPrice) as VentasTotales
from Employees e
inner join Orders o on e.EmployeeID = o.EmployeeID
inner join [Order Details] od on  o.OrderID = od.OrderID
where e.FirstName + ' ' + e.LastName = @NombreEmpleado
and year(o.OrderDate) between @AñoInicial and @AñoFinal
group by e.EmployeeID, e.FirstName, e.LastName, year(o.OrderDate);
end
select * from Orders
exec CalcularVentasPorEmpleadoYAño 
    @NombreEmpleado = 'Andrew Fuller',
    @AñoInicial = 1996,
    @AñoFinal = 1997



/*Ejercicio 2.  crear y  sp que Muestre el precio
promedio de los productos dentro de cada categoría, incluyendo solo aquellas
categorías cuyo precio promedio de producto supere el precio enviado en el store procedure*/

