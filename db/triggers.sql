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
ON ProductsXFactura
AFTER INSERT
AS
BEGIN
    -- Declarar variables para almacenar los totales
    DECLARE @FacturaID INT;
    DECLARE @TotalBruto DECIMAL(10, 2);
    DECLARE @TotalImpuesto DECIMAL(10, 2);
    DECLARE @TotalEnvio DECIMAL(10, 2);
    DECLARE @TotalPagar DECIMAL(10, 2);

    -- Obtener el ID de la factura insertada
    SELECT @FacturaID = FacturaID FROM ProductsXFactura;


    -- Calcular el precio total de la factura
    SELECT @TotalBruto = SUM(P.Price * PXF.Quantity),
           @TotalImpuesto = SUM(P.Price * PXF.Quantity) * 0.18, -- Suponiendo un impuesto del 18%
           @TotalEnvio = 10, -- Suponiendo un costo de envío fijo de $10
           @TotalPagar = SUM(P.Price * PXF.Quantity) + (SUM(P.Price * PXF.Quantity) * 0.18) + 10 -- Suma del precio total, impuesto y envío
    FROM ProductsXFactura PXF
    JOIN Products P ON P.ProductId = PXF.ProductId
	join Factura f on f.FacturaID = PXF.FacturaID
	where @FacturaID = PXF.FacturaID;

    -- Actualizar los campos de total en la tabla factura
    UPDATE Factura
    SET TotalBruto = @TotalBruto,
        TotalImpuesto = @TotalImpuesto,
        TotalEnvio = @TotalEnvio,
        TotalPagar = @TotalPagar
    WHERE FacturaID = @FacturaID;


	--Actualizar inventario
	DECLARE @Quantity INT
	DECLARE @ProductId INT;

	-- Obtener el ID del producto yy cantidad
    SELECT @Quantity = Quantity, @ProductId = ProductId FROM ProductsXFactura;

	UPDATE ProductEntries
    SET Quantity = Quantity - @Quantity
    WHERE ProductId = @ProductId;
END;


