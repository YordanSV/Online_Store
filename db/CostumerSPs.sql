use Tienda_Online

DROP PROCEDURE IF EXISTS SP_Customer_Update;
DROP PROCEDURE IF EXISTS SP_Register_Clients;
DROP PROCEDURE IF EXISTS SP_Employee_to_Costumer_Update
DROP PROCEDURE IF EXISTS ObtenerFacturas


---cambiar nombre a GetInvoice
go
CREATE PROCEDURE ObtenerFacturas
    @Identification INT
AS
BEGIN
BEGIN TRANSACTION;
    SELECT 
        f.FacturaID AS 'ID de Factura',
        f.TotalBruto AS 'Total Bruto',
        f.TotalImpuesto AS 'Total Impuesto',
        f.TotalEnvio AS 'Total Envío',
        f.TotalPagar AS 'Total a Pagar',
        f.Fecha As 'Fecha de compra',
        p.ProductName AS 'Nombre del Producto',
        p.Price AS 'Precio Unitario',
        pf.Quantity AS 'Cantidad',
        (pf.Quantity * p.Price) AS 'Total por Producto'
    FROM 
        Factura f
    INNER JOIN 
        ProductsXFactura pf ON f.FacturaID = pf.FacturaID
    INNER JOIN 
        Products p ON pf.ProductId = p.ProductId
    WHERE 
        f.Identification = @Identification;
		COMMIT TRANSACTION;
END;
go
CREATE PROCEDURE SP_Customer_Update
    @UserID INT,
    @FirstName VARCHAR(50) = NULL,
    @LastName VARCHAR(50) = NULL,
    @BirthDate DATE = NULL,
    @Province VARCHAR(50) = NULL,
    @District VARCHAR(50) = NULL,
    @Canton VARCHAR(50) = NULL,
    @Neighborhood VARCHAR(50) = NULL,
    @Place_address VARCHAR(255) = NULL,
    @Phone VARCHAR(20) = NULL,
    @CardNumber VARCHAR(16) = NULL,
    @CardType VARCHAR(20) = NULL
AS
BEGIN
BEGIN TRANSACTION;
    DECLARE @ErrorMessage NVARCHAR(300);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    BEGIN TRY
        -- Verificar si el cliente existe
        IF NOT EXISTS (SELECT 1 FROM Costumers WHERE UserID = @UserID)
        BEGIN
            RAISERROR ('Error: El cliente no existe', 16, 1);
            RETURN;
        END;

        IF @FirstName IS NOT NULL
        BEGIN
            IF LEN(@FirstName) > 50
            BEGIN
                RAISERROR ('Error: La longitud del nombre no puede ser mayor a 50 caracteres', 16, 1);
                RETURN;
            END;
            
            UPDATE Costumers
            SET FirstName = @FirstName
            WHERE UserID = @UserID;
        END;

        IF @LastName IS NOT NULL
        BEGIN
            IF LEN(@LastName) > 50
            BEGIN
                RAISERROR ('Error: La longitud del apellido no puede ser mayor a 50 caracteres', 16, 1);
                RETURN;
            END;
            
            UPDATE Costumers
            SET LastName = @LastName
            WHERE UserID = @UserID;
        END;

        IF @BirthDate IS NOT NULL
        BEGIN
            UPDATE Costumers
            SET BirthDate = @BirthDate
            WHERE UserID = @UserID;
        END;

        IF @Province IS NOT NULL
        BEGIN
            UPDATE Costumers
            SET Province = @Province
            WHERE UserID = @UserID;
        END;

        IF @District IS NOT NULL
        BEGIN
            UPDATE Costumers
            SET District = @District
            WHERE UserID = @UserID;
        END;

        IF @Canton IS NOT NULL
        BEGIN
            UPDATE Costumers
            SET Canton = @Canton
            WHERE UserID = @UserID;
        END;

        IF @Neighborhood IS NOT NULL
        BEGIN
            UPDATE Costumers
            SET Neighborhood = @Neighborhood
            WHERE UserID = @UserID;
        END;

        IF @Place_address IS NOT NULL
        BEGIN
            UPDATE Costumers
            SET Place_address = @Place_address
            WHERE UserID = @UserID;
        END;

        IF @Phone IS NOT NULL
        BEGIN
            IF LEN(@Phone) > 20
            BEGIN
                RAISERROR ('Error: La longitud del número de teléfono no puede ser mayor a 20 caracteres', 16, 1);
                RETURN;
            END;
            
            UPDATE Costumers
            SET Phone = @Phone
            WHERE UserID = @UserID;
        END;

        IF @CardNumber IS NOT NULL
        BEGIN
            UPDATE Costumers
            SET CardNumber = @CardNumber
            WHERE UserID = @UserID;
        END;

        IF @CardType IS NOT NULL
        BEGIN
            UPDATE Costumers
            SET CardType = @CardType
            WHERE UserID = @UserID;
        END;
		COMMIT TRANSACTION;
    END TRY

    BEGIN CATCH
        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR ('Error: ', @ErrorMessage, @ErrorSeverity, @ErrorState);
		ROLLBACK TRANSACTION;
    END CATCH;
END;
go

---EXEC SP_Customer_Update @Answer = '1', @UserID = 98, @FirstName = 'Nancy';

--############################################
--############################################
--############################################
--#############################################
--###########################################
--#################################################
--#################################################


CREATE PROCEDURE SP_Register_Clients
@ID int,
@ID_Desc VARCHAR(50),
@Email VARCHAR(50),
@Pass_word VARCHAR(50),
@Position VARCHAR(50),
@FirstName VARCHAR(50),
@LastName VARCHAR(50),
@BirthDate date,
@Province VARCHAR(50),
@District VARCHAR(50),
@Canton VARCHAR(50),
@NeighBorhood varchar(50),
@Place_address varchar(255),
@Phone varchar (20),
@CardNumber varchar(16),
@CardType varchar(20)
AS
BEGIN
BEGIN TRANSACTION;
    BEGIN TRY
        IF LEN(@ID_Desc) > 49 OR LEN(@Email) > 49 OR LEN(@Pass_word) > 49 OR LEN(@Position) > 49 OR
           LEN(@FirstName) > 49 OR LEN(@LastName) > 49 OR LEN(@Province) > 49 OR LEN(@District) > 49 OR
           LEN(@Canton) > 49 OR LEN(@NeighBorhood) > 49 OR LEN(@Place_address) > 254 OR
           LEN(@Phone) > 19 OR LEN(@CardNumber) > 15 OR LEN(@CardType) > 19
        BEGIN
            RAISERROR ('La longitud de algún parámetro excede el límite permitido.', 16, 1);
            RETURN;
        END;

        IF DATEDIFF(YEAR, @BirthDate, GETDATE()) < 18
        BEGIN
            RAISERROR ('El cliente debe tener al menos 18 años para registrarse.', 16, 1);
            RETURN;
        END;

        DECLARE @UserID INT;

        -- Verifica si el correo electrónico ya existe en la tabla
        IF EXISTS (SELECT 1 FROM Costumers WHERE ID = @ID) OR EXISTS (SELECT 1 FROM Employees WHERE ID = @ID)
        BEGIN
            RAISERROR ('La identificación ya existe.', 16, 1);
            RETURN;
        END
        ELSE IF EXISTS (SELECT 1 FROM Users WHERE Email = @Email)
        BEGIN
            RAISERROR ('El correo electrónico ya existe.', 16, 1);
            RETURN;
        END
        ELSE
        BEGIN
            INSERT INTO Users (Email, Pass_word, Position)
            VALUES(@Email, @Pass_word, @Position);

            --Obtenemos el id del nuevo usuario
            SELECT @UserID = UserID
            FROM Users
            WHERE Email = @Email;

            INSERT INTO Ids(Identification, Identification_Desc)
            VALUES(@ID, @ID_Desc);

            IF @Position = 'Costumer'
            BEGIN
                INSERT INTO Costumers(ID, UserID, FirstName, LastName, BirthDate, Province, District,
                Canton, NeighBorhood, Place_address, Phone, CardNumber, CardType, Cs_status)
                VALUES (@ID, @UserID,
                @FirstName, @LastName, @BirthDate, @Province, @District, @Canton, @NeighBorhood, @Place_address, @Phone ,@CardNumber, @CardType, 'Active');
            END
            ELSE IF @Position = 'Employee'
            BEGIN
                INSERT INTO Employees (ID, UserID, FirstName, LastName) VALUES
                (@ID, @UserID, @FirstName, @LastName);
            END;
        END;
		COMMIT TRANSACTION;
    END TRY

    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
		ROLLBACK TRANSACTION;
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

CREATE PROCEDURE SP_Employee_to_Costumer_Update
    @UserID INT,
    @FirstName VARCHAR(50) = NULL,
    @LastName VARCHAR(50) = NULL,
    @BirthDate DATE = NULL,
    @Province VARCHAR(50) = NULL,
    @District VARCHAR(50) = NULL,
    @Canton VARCHAR(50) = NULL,
    @Neighborhood VARCHAR(50) = NULL,
    @Place_address VARCHAR(255) = NULL,
    @Phone VARCHAR(20) = NULL,
    @CardNumber VARCHAR(16) = NULL,
    @CardType VARCHAR(20) = NULL,
    @CS_Status VARCHAR(20) = NULL
AS
BEGIN
BEGIN TRANSACTION;
    BEGIN TRY
        IF EXISTS (SELECT 1 FROM Costumers WHERE UserID = @UserID)
        BEGIN
            IF @FirstName IS NOT NULL
            BEGIN
                UPDATE Costumers
                SET FirstName = @FirstName
                WHERE UserID = @UserID;
            END;
            
            IF @LastName IS NOT NULL
            BEGIN
                UPDATE Costumers
                SET LastName = @LastName
                WHERE UserID = @UserID;
            END;
            
            IF @BirthDate IS NOT NULL
            BEGIN
                UPDATE Costumers
                SET BirthDate = @BirthDate
                WHERE UserID = @UserID;
            END;
            
            IF @Province IS NOT NULL
            BEGIN
                UPDATE Costumers
                SET Province = @Province
                WHERE UserID = @UserID;
            END;
            
            IF @District IS NOT NULL
            BEGIN
                UPDATE Costumers
                SET District = @District
                WHERE UserID = @UserID;
            END;
            
            IF @Canton IS NOT NULL
            BEGIN
                UPDATE Costumers
                SET Canton = @Canton
                WHERE UserID = @UserID;
            END;
            
            IF @Neighborhood IS NOT NULL
            BEGIN
                UPDATE Costumers
                SET Neighborhood = @Neighborhood
                WHERE UserID = @UserID;
            END;
            
            IF @Place_address IS NOT NULL
            BEGIN
                UPDATE Costumers
                SET Place_address = @Place_address
                WHERE UserID = @UserID;
            END;
            
            IF @Phone IS NOT NULL AND ISNUMERIC(@Phone) = 1
            BEGIN
                IF NOT EXISTS (SELECT 1 FROM Costumers WHERE Phone = @Phone AND UserID != @UserID)
                BEGIN
                    UPDATE Costumers
                    SET Phone = @Phone
                    WHERE UserID = @UserID;
                END
                ELSE
                BEGIN
                    RAISERROR ('Error: El n�mero de tel�fono ya est� en uso por otro usuario', 16, 1);
                END;
            END;
            
            IF @CardNumber IS NOT NULL
            BEGIN
                UPDATE Costumers
                SET CardNumber = @CardNumber
                WHERE UserID = @UserID;
            END;
            
            IF @CardType IS NOT NULL
            BEGIN
                UPDATE Costumers
                SET CardType = @CardType
                WHERE UserID = @UserID;
            END;
            
            IF @CS_Status IS NOT NULL AND @CS_Status IN ('Active', 'Inactive')
            Begin
            RAISERROR ('Error: El estado del empleado debe ser "Active" o "Inactive"', 16, 1);
            End
            BEGIN
                UPDATE Costumers
                SET Cs_status = @CS_Status
                WHERE UserID = @UserID;
            END;
        END
        ELSE
        BEGIN
            RAISERROR ('Error: El usuario no existe', 16, 1);
        END;
		COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        SELECT @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
		ROLLBACK TRANSACTION;
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