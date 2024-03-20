use NORTHWND
/*Crear un store procedure que 
permita insertar registros en la
tabla de customers*/

create proc insertarCustomers_sp
@companyname varchar(40),
@country varchar(15),
@city varchar(15)
as
begin
insert into Customers(CompanyName, Country, City)
values(@companyName,@country, @city)
end
go

/*Crear un stored procedure que permita
eliminar registros en  la tabla customers
por customerId*/
select* from Customers

create proc eliminarResgistrosCustomers
@customerId varchar(5)
as
begin
delete Customers
where CustomerID = @customerId
end
go

exec eliminarResgistrosCustomers @customerid = 'ALFKI'


/*Crear un store procedure que 
permita eliminar un producto de una
orden dada*/
create proc EliminarProductoDeOrden
    @OrderID int,
    @ProductID int
as
begin
delete from [Order Details]
where OrderID = @OrderID
and ProductID = @ProductID;
END

exec EliminarProductoDeOrden @OrderID = 10248, @ProductID = 11

/*Crear un store procedure que 
permita eliminar un producto de una orden
y modificar el store(unitinstock del producto)*/
create proc eliminarOrdenyModificar
@orderid int,
@productid int
as
begin
declare @cantidad int
select @cantidad= quantity 
from [orderdetails]
where orderid = @orderid
and productid = @productid
delete from [Order Details]
   where OrderID = @OrderID
and ProductID = @ProductID;

update Products
set UnitsInStock = UnitsInStock + @Cantidad
where ProductID = @ProductID
end 

exec eliminarOrdenyModificar @OrderID = 10248, @ProductID = 11, @Cantidad = 1;

select * from [Order Details]