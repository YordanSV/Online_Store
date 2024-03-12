DROP PROCEDURE IF EXISTS SP_Login;
DROP PROCEDURE IF EXISTS SP_Employee_Registration;
DROP PROCEDURE IF EXISTS SP_Employee_Update;
DROP PROCEDURE IF EXISTS SP_Employee_Registration;
go

create procedure SP_Login
    @Email VARCHAR(50),
    @Password VARCHAR(50)
AS
BEGIN
    BEGIN TRY
        DECLARE @UserID INT;

        -- Verifica si el correo electr�nico y la contrase�a coinciden en la tabla de Usuarios
        IF LEN(@Email) > 50 OR LEN(@Password) > 50
        BEGIN
            RAISERROR ('El tama�o del correo electr�nico o la contrase�a excede el m�ximo permitido.', 16, 1);
        END
        ELSE IF EXISTS (SELECT 1 FROM Users WHERE Email = @Email AND Pass_word = @Password)
        BEGIN
            SELECT @UserID = UserID
            FROM Users
            WHERE Email = @Email AND Pass_word = @Password;

            -- Env�a un mensaje de �xito junto con el UserID
            SELECT 'Login exitoso.' AS Message, @UserID AS UserID;
        END
        ELSE
        BEGIN
            RAISERROR ('Correo electr�nico o contrase�a incorrectos.', 16, 1);
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
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


CREATE PROCEDURE SP_Employee_Registration
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Em_Status VARCHAR(20) = 'Active' -- Establece 'Active' como valor predeterminado
AS
BEGIN
    BEGIN TRY
        IF LEN(@FirstName) < 2 OR LEN(@FirstName) > 50
        BEGIN
            RAISERROR ('Error: La longitud del nombre debe estar entre 2 y 50 caracteres', 16, 1);
        END
        ELSE IF LEN(@LastName) < 2 OR LEN(@LastName) > 50
        BEGIN
            RAISERROR ('Error: La longitud del apellido debe estar entre 2 y 50 caracteres', 16, 1);
        END
        ELSE
        BEGIN
            INSERT INTO Employees (FirstName, LastName, Em_Status)
            VALUES (@FirstName, @LastName, @Em_Status);
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        SELECT @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1); -- Mensaje de error personalizado
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

CREATE PROCEDURE SP_Employee_Update
    @UserID INT,
    @FirstName VARCHAR(50) = NULL,
    @LastName VARCHAR(50) = NULL,
    @Em_Status VARCHAR(20) = NULL
AS
BEGIN
    BEGIN TRY
        IF @FirstName IS NOT NULL
        BEGIN
            IF LEN(@FirstName) < 2 OR LEN(@FirstName) > 50
            BEGIN
                RAISERROR ('Error: La longitud del nombre debe estar entre 2 y 50 caracteres', 16, 1);
            END
            ELSE
            BEGIN
                UPDATE Employees
                SET FirstName = @FirstName
                WHERE UserID = @UserID;
            END
        END;

        IF @LastName IS NOT NULL
        BEGIN
            IF LEN(@LastName) < 2 OR LEN(@LastName) > 50
            BEGIN
                RAISERROR ('Error: La longitud del apellido debe estar entre 2 y 50 caracteres', 16, 1);
            END
            ELSE
            BEGIN
                UPDATE Employees
                SET LastName = @LastName
                WHERE UserID = @UserID;
            END
        END;

        IF @Em_Status IS NOT NULL
        BEGIN
            IF @Em_Status NOT IN ('Active', 'Inactive')
            BEGIN
                RAISERROR ('Error: El estado del empleado debe ser "Active" o "Inactive"', 16, 1);
            END
            ELSE
            BEGIN
                UPDATE Employees
                SET Em_Status = @Em_Status
                WHERE UserID = @UserID;
            END
        END;

        IF @FirstName IS NULL AND @LastName IS NULL AND @Em_Status IS NULL
        BEGIN
            RAISERROR ('Error: No se proporcionaron datos para actualizar', 16, 1);
        END;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        SELECT @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1); -- Mensaje de error personalizado
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