use Tienda_Online

DROP PROCEDURE IF EXISTS SP_Product_Maintenance;
DROP PROCEDURE IF EXISTS SP_Category_Maintenance;
DROP PROCEDURE IF EXISTS Product_Entries;


go

CREATE PROCEDURE SP_Category_Maintenance
    @CategoryId INT = NULL,
    @CategoryName VARCHAR(50) = NULL
AS
BEGIN
    BEGIN TRY
        IF @CategoryId IS NOT NULL
        BEGIN
            UPDATE Categories
            SET CategoryId = @CategoryId
            WHERE CategoryId = @CategoryId;
        END;
        ELSE IF @CategoryName IS NOT NULL
        BEGIN
            IF LEN(@CategoryName) < 2 OR LEN(@CategoryName) > 50
            BEGIN
                RAISERROR('Error: La longitud del nombre debe estar entre 2 y 50 caracteres', 16, 1);
            END
            ELSE
            BEGIN
                UPDATE Categories
                SET CategoryName = @CategoryName
                WHERE CategoryId = @CategoryId;
            END;
        END;
        ELSE
        BEGIN
            RAISERROR('Error: Respuesta no válida', 16, 1);
        END;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(300);
        SELECT @ErrorMessage = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH;
END;

go


--############################################
--############################################
--############################################
--#############################################
--###########################################
--#################################################
--#################################################


CREATE PROCEDURE SP_Product_Maintenance
    @ProductId INT = NULL,
    @ProductName VARCHAR(100) = NULL,
    @Presentation VARCHAR(50) = NULL,
    @Size VARCHAR(20) = NULL,
    @Pr_weight DECIMAL(10, 2) = NULL,
    @Price DECIMAL(10, 2) = NULL,
    @MinInventoryQuantity INT = NULL,
    @MaxWareHouseQuantity INT = NULL,
    @CategoryID INT = NULL
AS
BEGIN
    BEGIN TRY
       If @ProductId IS NOT NULL
        BEGIN
            UPDATE Products
            SET ProductId = @ProductId
            WHERE ProductID = @ProductId;
        END;
        ELSE IF @ProductName IS NOT NULL
        BEGIN
            IF LEN(@ProductName) < 1 OR LEN(@ProductName) > 100
            BEGIN
                RAISERROR('La longitud del nombre del producto debe estar entre 1 y 100 caracteres', 16, 1);
            END
            ELSE
            BEGIN
                UPDATE Products
                SET ProductName = @ProductName
                WHERE ProductID = @ProductId;
            END;
        END;
        ELSE IF  @Presentation IS NOT NULL
        BEGIN
            IF LEN(@Presentation) < 1 OR LEN(@Presentation) > 50
            BEGIN
                RAISERROR('La longitud de la presentación debe estar entre 1 y 50 caracteres', 16, 1);
            END
            ELSE
            BEGIN
                UPDATE Products
                SET Presentation = @Presentation
                WHERE ProductID = @ProductId;
            END;
        END;
        ELSE IF @Size IS NOT NULL
        BEGIN
            IF LEN(@Size) < 1 OR LEN(@Size) > 20
            BEGIN
                RAISERROR('La longitud del tamaño debe estar entre 1 y 20 caracteres', 16, 1);
            END
            ELSE
            BEGIN
                UPDATE Products
                SET Size = @Size
                WHERE ProductID = @ProductId;
            END;
        END;
        ELSE IF @Pr_weight IS NOT NULL
        BEGIN
            UPDATE Products
            SET Pr_weight = @Pr_weight
            WHERE ProductID = @ProductId;
        END;
        ELSE IF @Price IS NOT NULL
        BEGIN
            UPDATE Products
            SET Price = @Price
            WHERE ProductID = @ProductId;
        END;
        ELSE if @MinInventoryQuantity IS NOT NULL
        BEGIN
            UPDATE Products
            SET MinInventoryQuantity = @MinInventoryQuantity
            WHERE ProductID = @ProductId;
        END;
        ELSE IF @MaxWareHouseQuantity IS NOT NULL
        BEGIN
            UPDATE Products
            SET MaxWareHouseQuantity = @MaxWareHouseQuantity
            WHERE ProductID = @ProductId;
        END;
        ELSE IF @CategoryID IS NOT NULL
        BEGIN
            UPDATE Products
            SET CategoryID = @CategoryID
            WHERE ProductID = @ProductId;
        END;
        ELSE
        BEGIN
            RAISERROR('Error: Respuesta no válida o falta de datos', 16, 1);
        END;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        SELECT @ErrorMessage = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH;
END;

--############################################
--############################################
--############################################
--#############################################
--###########################################
--#################################################
--#################################################


go
    CREATE PROCEDURE Product_Entries
	@Answer char (2),
	@ProductId int,
	@ProductName varchar(100),
	@Presentation varchar(100),
	@Size varchar(20), 
	@Pr_weight decimal(10, 2),
	@Price decimal (10, 2),
	@MinInventoryQuantity int,
	@MaxWareHouseQuantity int,
	@CategoryID int,
	@EntryId int,
	@EntryDate DATETIME,
	@Quantity int
AS
BEGIN

	----Select muestra los datos de los productos que entraron
	IF @Answer = '1'
	BEGIN
		SELECT
			PR.ProductID AS ProductID,
			PR.ProductName AS productName,
			PR.Presentation AS Presentation,
			PR.Size AS Size,
			PR.Pr_weight AS Pr_weight,
			PR.Price AS Price,
			PR.MinInventoryQuantity AS MinInventoryQuantity,
			PR.MaxWareHouseQuantity AS MaxWareHouseQuantity,
			PR.CategoryID AS CategoryID,
			PE.EntryId AS EntryId,
			PE.ProductId AS ProductId,
			PE.EntryDate AS EntryDate,
			PE.Quantity AS Quantity
		FROM
			ProductEntries PE
		INNER JOIN
			Products PR ON PE.ProductId = PR.ProductId
	END
	ELSE IF @Answer = '2'
	BEGIN
		INSERT INTO Products (ProductId, ProductName, Presentation, Size, Pr_weight, Price, MinInventoryQuantity, MaxWareHouseQuantity, CategoryID)
		VALUES (@ProductId, @ProductName, @Presentation, @Size, @Pr_weight, @Price, @MinInventoryQuantity, @MaxWareHouseQuantity, @CategoryID);

		INSERT INTO ProductEntries (EntryId, ProductId, EntryDate, Quantity)
		VALUES (@EntryId, @ProductId, @EntryDate, @Quantity);
	END
	ELSE
	BEGIN
		PRINT 'Opción inválida';
	END
END;

--############################################
--############################################
--############################################
--#############################################
--###########################################
--#################################################
--#################################################

