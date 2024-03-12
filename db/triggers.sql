use Tienda_Online

DROP TRIGGER IF EXISTS Trg_Login_log
DROP TRIGGER IF EXISTS Calcular_totales
DROP TRIGGER IF EXISTS  TR_Products_CheckInventory

/*Trigger
------------------
--------------------
--------------------
----------------------
------------------------*/
go

create trigger Trg_Login_log
---Aplica a la tabla Users
on Users
--El trigger aplica despu�s de una inserci�n de datos

after insert

as
begin
declare @Position varchar(50)
declare @UserID int 


---obtenemos el puesto del usuario

Select @Position =i.Position, @UserID = i.UserID

--desde inserted
from inserted i;

----si es un empleado,
If @Position = 'Employee'
Begin

---El sistema indicar� que es un empleado
Print 'User employee logged in'
End

--- si no, 
else if @Position = 'Client'
Begin

---indica que es un cliente
Print 'User client logged in'
End

Else 
Begin

---Si no es ninguno de los dos, indicar� que el puesto no se reconoce
Print 'Position not recognized'

end

end;

GO
/*Trigger
------------------
--------------------
--------------------
----------------------
------------------------*/

CREATE TRIGGER Calcular_totales
ON Factura
AFTER INSERT
AS
BEGIN
    DECLARE @PrecioTotal DECIMAL(10, 2);

    -- Calcula el precio total de la factura
    SELECT @PrecioTotal = SUM(P.Price * pxf.Quantity)
    FROM ProductsXFactura pxf
    JOIN Products P ON P.ProductId = pxf.ProductId
	JOIN inserted i on i.FacturaID = pxf.FacturaID;


	DECLARE @TotalBruto DECIMAL(10, 2);
	@TotalBruto = @PrecioTotal

    -- Actualiza los campos de total en la tabla factura
    UPDATE Factura
    SET TotalBruto = @TotalBruto,
		TotalImpuesto = @PrecioTotal * 0.18, -- Suponiendo un impuesto del 18%
        TotalEnvio = 10, -- Suponiendo un costo de envío fijo de $10
        TotalPagar = @PrecioTotal + (@PrecioTotal * 0.18) + 10 -- Suma del precio total, impuesto y envío
    WHERE FacturaID IN (SELECT FacturaID FROM inserted);
END;

