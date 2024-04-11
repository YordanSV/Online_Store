DROP PROCEDURE IF EXISTS AgregarCompra;
DROP PROCEDURE IF EXISTS Realizar_Compra;
DROP PROCEDURE IF EXISTS SP_InsertProductEntry;


-----Cambiar nombre a add purchase
go
Create Procedure AgregarCompra
@IdProducto Int,
@IdFactura Int,
@Quantity Int
As 
Begin
insert into  ProductsXFactura(ProductId, FacturaID, Quantity) values
(@IdProducto, @IdFactura, @Quantity)

End;


---- Cambiar nombre a Complete_Purchase
go
Create procedure Realizar_Compra
@ID int
AS 
Begin
INSERT INTO Factura(Identification, TotalBruto, TotalImpuesto, TotalEnvio, TotalPagar, Fecha)
VALUES (@ID,0, 0, 0, 0, CONVERT(DATE, GETDATE()));

End;
go



CREATE PROCEDURE SP_InsertProductEntry
    @ProductId INT,
    @Quantity INT
AS
BEGIN
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
    INSERT INTO ProductEntries (ProductId, Quantity)
    VALUES (@ProductId, @Quantity);
END;

