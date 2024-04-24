use Tienda_Online
DROP PROCEDURE IF EXISTS AgregarCompra;
DROP PROCEDURE IF EXISTS Realizar_Compra;
DROP PROCEDURE IF EXISTS SP_InsertProductEntry;
DROP PROCEDURE IF EXISTS Complete_purchase;


-----Cambiar nombre a add purchase
go
Create Procedure AgregarCompra
@IdProducto Int,
@IdFactura Int,
@Quantity Int
As 
Begin
Begin transaction;
insert into  ProductsXFactura(ProductId, FacturaID, Quantity, LastModPXI) values
(@IdProducto, @IdFactura, @Quantity, default)
Commit transaction;
End;


---- Cambiar nombre a Complete_Purchase
go
Create procedure Realizar_Compra
@ID int
AS 
Begin
Begin transaction;
INSERT INTO Factura(Identification, TotalBruto, TotalImpuesto, TotalEnvio, TotalPagar, Fecha, LastModInvoice )
VALUES (@ID,0, 0, 0, 0, CONVERT(DATE, GETDATE()), default);
Commit transaction;
End;
go



CREATE PROCEDURE SP_InsertProductEntry
    @ProductId INT,
    @Quantity INT
AS
BEGIN
	Begin transaction;
    DECLARE @MinInventory INT, @MaxInventory INT, @ActualInventory INT;

    -- Obtener el mínimo inventario y el máximo inventario del producto
    SELECT @MinInventory = MinInventoryQuantity, @MaxInventory = MaxWareHouseQuantity, @ActualInventory = ActualInventoryInt
    FROM Products
    WHERE ProductId = @ProductId;

    -- Verificar si el mínimo inventario es mayor que el máximo inventario
    IF @MinInventory >= @MaxInventory
    BEGIN
        RAISERROR ('El valor del inventario mínimo no puede ser mayor o igual que el inventario máximo.', 16, 1);
        RETURN;
    END;

    -- Verificar si el inventario actual más la cantidad a añadir excede el máximo inventario
    IF @ActualInventory + @Quantity > @MaxInventory
    BEGIN
        RAISERROR ('La cantidad a añadir excede el inventario máximo permitido.', 16, 1);
        RETURN;
    END;

    -- Verificar si la cantidad a añadir es negativa
    IF @Quantity < 0
    BEGIN
        RAISERROR ('La cantidad a añadir no puede ser negativa.', 16, 1);
        RETURN;
    END;

    -- Insertar la entrada del producto
    INSERT INTO ProductEntries (ProductId, Quantity, LastModPE)
    VALUES (@ProductId, @Quantity, default);

	Commit transaction;
END
Go;



----------------##################
---------------###################
----------------##################
---------------###################
----------------##################
---------------###################
----------------##################
---------------###################
----------------##################
---------------###################
----------------##################
---------------###################


CREATE PROCEDURE Complete_purchase
    @ProductName VARCHAR(100),
	@Quantity int
AS
BEGIN
Begin transaction;
    SET NOCOUNT ON;

    DECLARE @ProductId INT;

    -- Buscar el ID del producto basado en el nombre proporcionado
    SELECT @ProductId = ProductId
    FROM Products
    WHERE ProductName = @ProductName;

    IF @ProductId IS NOT NULL
    BEGIN
        -- Restar la cantidad del producto de ProductEntries
        UPDATE ProductEntries
        SET Quantity = Quantity - @Quantity
        WHERE ProductId = @ProductId;
		
        
		UPDATE Products
        SET ActualInventoryInt = ActualInventoryInt - @Quantity
        WHERE ProductId = @ProductId;
		Commit transaction;
    END
    ELSE
    BEGIN
              RAISERROR ('Ocurrió un error al intentar comprar el producto', 16, 1);
			  Rollback transaction;
    END

END



