use Tienda_Online

DROP TRIGGER IF EXISTS Trg_Login_log ON Users;
DROP TRIGGER IF EXISTS Calcular_totales ON Factura;
DROP TRIGGER IF EXISTS  TR_Products_CheckInventory On Products;

/*Trigger
------------------
--------------------
--------------------
----------------------
------------------------*/

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
    SELECT @PrecioTotal = SUM(P.Price * F.Quantity)
    FROM inserted F
    JOIN Products P ON P.ProductId = F.ProductId;

    -- Actualiza los campos de total en la tabla factura
    UPDATE Factura
    SET TotalImpuesto = @PrecioTotal * 0.18, -- Suponiendo un impuesto del 18%
        TotalEnvio = 10, -- Suponiendo un costo de envío fijo de $10
        TotalPagar = @PrecioTotal + (@PrecioTotal * 0.18) + 10 -- Suma del precio total, impuesto y envío
    WHERE FacturaID IN (SELECT FacturaID FROM inserted);
END;

