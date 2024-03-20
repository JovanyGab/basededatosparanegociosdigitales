declare @numero int 
set @numero= 10
if @numero >5
begin
print 'el numero es mayor a 5'



---Realizar codigo transact para determinar si una persona tiene la edad para beber alcohol.
--El codigo debe tener variable que determine la edad minima permitida y otro variable
--con la edad de la persona
--Comparar si la persona iene la edad minima permitida, Mostrando un mensaje 'Edad'
declare @EdadMinimaPermitida int;
declare @EdadPersona int;
set @EdadMinimaPermitida = 18;
set @EdadPersona = 21;|
if @EdadPersona >= @EdadMinimaPermitida
begin
print 'Edad Permitida';
end
begin
print 'Edad no permitida';
end;

/*Genera un sp en donde se compare si un producto tiene mas de
100 unidades en stock, incrementar su precio en un 10% de lo 
contrario incrementarlo en un 20% */



use nort
--sp2
create or alter proc sumadediez2
@valor int, @resultado int output
as 
set @resultado = @valor + 10
declare @result int
exec sumadediez2 @valor = 50, @resultado = @result output
print ('el resultado es: '+ cast(@result as varchar(10)))

--hacer sp que haga suma y resta y
-- resultado de con parametros de salida
create or alter proc sumayresta
DECLARE @ResultadoSuma INT;
DECLARE @ResultadoResta INT;

EXEC CalculadoraSumaResta @Numero1 = 10, @Numero2 = 5, @Suma = @ResultadoSuma OUTPUT, @Resta = @ResultadoResta OUTPUT;

SELECT 'Suma:' AS Operacion, @ResultadoSuma AS Resultado
UNION ALL
SELECT 'Resta:', @ResultadoResta;
