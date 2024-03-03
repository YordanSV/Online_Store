use Tienda_Online;

DROP PROCEDURE IF EXISTS SP_Costumer_Update;
DROP PROCEDURE IF EXISTS SP_Category_Maintenance;
DROP PROCEDURE IF EXISTS SP_Product_Maintenance;
DROP PROCEDURE IF EXISTS SP_Employee_to_Costumer_Update;
DROP PROCEDURE IF EXISTS SP_Register_Clients;
/*Procedimientos almacenados 
--------------------------
----------------------------
-------------------------
--------------------------
---------------------------
----------------------------
--------------------------*/
go
Create Procedure SP_Costumer_Update
@Answer varchar(50),
@UserID int,
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
Begin

/*Si se escoge el numero 1, cambia el nombre*/

If @Answer = '1'

Begin

SELECT UserID from costumers 
where @FirstName = FirstName;

UPDATE Costumers
    SET FirstName = @FirstName
    WHERE UserID = @UserID;

End;
/*Si se escoge el numero 2, cambia el apellido*/

Else if @Answer = '2'
Begin

SELECT UserID from costumers 
where @LastName = LastName;

UPDATE Costumers
    SET FirstName = @FirstName
    WHERE UserID = @UserID;

End;
/*Si se escoge el numero 3, cambia la fecha de nacimiento*/

Else if @Answer = '3'
Begin

SELECT UserID from costumers 
where @BirthDate = BirthDate;

UPDATE Costumers
    SET BirthDate = @BirthDate
    WHERE UserID = @UserID;

End;
/*Si se escoge el numero 4, cambia la provincia*/
Else if @Answer = '4'
Begin

SELECT UserID from costumers 
where @Province = Province;

UPDATE Costumers
    SET @Province = Province
    WHERE UserID = @UserID;
End;
/*Si se escoge el numero 5, cambia el distrito*/
Else if @Answer = '5'
Begin

SELECT UserID from costumers 
where @District = District;

UPDATE Costumers
    SET @District = District
    WHERE UserID = @UserID;

End;
/*Si se escoge el numero 6, cambia el canton*/
Else if @Answer = '6'
Begin

SELECT UserID from costumers 
where @Canton = Canton;

UPDATE Costumers
    SET @Canton = Canton
    WHERE UserID = @UserID;


End;

/*Si se escoge el numero 7, cambia el barrio*/

Else if @Answer = '7'
Begin
SELECT UserID from costumers 
where @Neighborhood = NeighBorhood;

UPDATE Costumers
    SET @NeighBorhood = NeighBorhood
    WHERE UserID = @UserID;

End;

/*Si se escoge el numero 8, cambia la direccion*/

Else if @Answer = '8'
Begin
SELECT UserID from costumers 
where @Place_address = Place_address;

UPDATE Costumers
    SET @Place_address = Place_address
    WHERE UserID = @UserID;

	End;

/*Si se escoge el numero 9, cambia el telefono*/
Else if @Answer = '9'
Begin

SELECT UserID from costumers 
where @Phone = Phone;

UPDATE Costumers
    SET Phone = @Phone
    WHERE UserID = @UserID;

End;

/*Si se escoge el numero 10, cambia el numero de tarjeta*/

Else if @Answer = '10'
Begin
SELECT UserID from costumers 
where @CardNumber = CardNumber;

UPDATE Costumers
    SET @CardNumber = Place_address
    WHERE UserID = @UserID;

End;

/*Si se escoge el numero 11, cambia la el tipo de tarjeta*/
Else if @Answer = '11'
Begin

SELECT UserID from costumers 
where @CardType = CardType;

UPDATE Costumers
    SET @CardType = CardType
    WHERE UserID = @UserID;

End;

/*Si se escoge el numero 12, elimina el cliente*/

Else if @Answer = '12'
Begin
SELECT UserID from costumers 
where UserID = @UserID;

delete from Costumers
where UserID = @UserID;
End;


Else
Begin
Print 'Opción inválida'

End;
End;
GO
/*----------------------
----------------------
------------------------
-----------------------
--------------------------
------------------------*/

Create procedure SP_Register_Clients
@UserID int,
@ID_Desc varchar(20),
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

INSERT INTO Ids(Identification, Identification_Desc)
values(@UserID, @ID_Desc)

INSERT INTO Costumers(UserID, FirstName, LastName, BirthDate, Province, District,
Canton, NeighBorhood, Place_address, Phone, CardNumber, CardType)

values (@UserID ,
@FirstName, @LastName, @BirthDate, @Province, @District, @Canton, @NeighBorhood, @Place_address, @Phone ,@CardNumber, @CardType);

END;

GO
/*----------------------------
-----------------------------
----------------------------
----------------------------
-----------------------------*/

Create Procedure SP_Employee_to_Costumer_Update
@Answer varchar,
@UserID int,
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
@CardType varchar(20),
@Cs_status varchar(20)
AS
Begin

/*Si se escoge el numero 1, cambia el nombre*/

If @Answer = '1'

Begin

SELECT UserID from costumers 
where @FirstName = FirstName;

UPDATE Costumers
    SET FirstName = @FirstName
    WHERE UserID = @UserID;

End;
/*Si se escoge el numero 2, cambia el apellido*/

Else if @Answer = '2'
Begin

SELECT UserID from costumers 
where @LastName = LastName;

UPDATE Costumers
    SET FirstName = @FirstName
    WHERE UserID = @UserID;

End;
/*Si se escoge el numero 3, cambia la fecha de nacimiento*/

Else if @Answer = '3'
Begin

SELECT UserID from costumers 
where @BirthDate = BirthDate;

UPDATE Costumers
    SET BirthDate = @BirthDate
    WHERE UserID = @UserID;

End;
/*Si se escoge el numero 4, cambia la provincia*/
Else if @Answer = '4'
Begin

SELECT UserID from costumers 
where @Province = Province;

UPDATE Costumers
    SET @Province = Province
    WHERE UserID = @UserID;
End;
/*Si se escoge el numero 5, cambia el distrito*/
Else if @Answer = '5'
Begin

SELECT UserID from costumers 
where @District = District;

UPDATE Costumers
    SET @District = District
    WHERE UserID = @UserID;

End;
/*Si se escoge el numero 6, cambia el canton*/
Else if @Answer = '6'
Begin

SELECT UserID from costumers 
where @Canton = Canton;

UPDATE Costumers
    SET @Canton = Canton
    WHERE UserID = @UserID;


End;

/*Si se escoge el numero 7, cambia el barrio*/

Else if @Answer = '7'
Begin
SELECT UserID from costumers 
where @Neighborhood = NeighBorhood;

UPDATE Costumers
    SET @NeighBorhood = NeighBorhood
    WHERE UserID = @UserID;

End;

/*Si se escoge el numero 8, cambia la direccion*/

Else if @Answer = '8'
Begin
SELECT UserID from costumers 
where @Place_address = Place_address;

UPDATE Costumers
    SET @Place_address = Place_address
    WHERE UserID = @UserID;

	End;

/*Si se escoge el numero 9, cambia el telefono*/
Else if @Answer = '9'
Begin

SELECT UserID from costumers 
where @Phone = Phone;

UPDATE Costumers
    SET Phone = @Phone
    WHERE UserID = @UserID;

End;

/*Si se escoge el numero 10, cambia el numero de tarjeta*/

Else if @Answer = '10'
Begin
SELECT UserID from costumers 
where @CardNumber = CardNumber;

UPDATE Costumers
    SET @CardNumber = Place_address
    WHERE UserID = @UserID;

End;

/*Si se escoge el numero 11, cambia la el tipo de tarjeta*/
Else if @Answer = '11'
Begin

SELECT UserID from costumers 
where @CardType = CardType;

UPDATE Costumers
    SET @CardType = CardType
    WHERE UserID = @UserID;

End;

/*Si se escoge el numero 12, elimina el cliente*/

Else if @Answer = '12'
Begin
SELECT UserID from costumers 
where UserID = @UserID;

UPDATE Costumers
    SET @Cs_status = cs_status
    WHERE UserID = @UserID;

	End;


Else
Begin
Print 'Opción inválida'

End;
End;
GO
/**/
Create procedure SP_Category_Maintenance

@Answer varchar(2),
@CategoryId int,
@CategoryName varchar(50)
As

----si la respuesta es 1, cambia el id
if @Answer = '1'
Begin

SELECT CategoryID from Categories 
where @CategoryId = CategoryId;

UPDATE Categories
    SET @CategoryId = CategoryId
    WHERE CategoryId = @CategoryId;

	End;


	---- si la respuesta es 2, cambia el nombre
	Else if @Answer = '2'

	BEgin
	SELECT CategoryID from Categories 
where @CategoryId = CategoryId;

UPDATE Categories
    SET @CategoryName = CategoryName
    WHERE CategoryId = @CategoryId;
	End;
GO


/*-------------------------
----------------------
---------------------------
----------------------------
----------------------
-------------------*/
Create procedure SP_Product_Maintenance

@Answer varchar(2),
@ProductId int,
@ProductName varchar(100),
@Presentation varchar(50),
@Size varchar(20),
@Pr_weight decimal(10, 2),
@Price decimal(10,2),
@MinInventoryQuantity int,
@MaxWareHouseQuantity int,
@CategoryID int
As

----si la respuesta es 1, cambia el id
if @Answer = '1'
Begin

SELECT ProductID from Products 
where @ProductId = ProductId;

UPDATE Products
    SET @ProductId = ProductID
    WHERE ProductID = @ProductId;

	End;


	---- si la respuesta es 2, cambia el nombre
	Else if @Answer = '2'

	Begin

SELECT ProductID from Products 
where @ProductId = ProductId;

UPDATE Products
    SET @ProductName = ProductName
    WHERE ProductID = @ProductId;

	End;

	Else if @Answer = '3'

	Begin

SELECT ProductID from Products 
where @ProductId = ProductId;

UPDATE Products
    SET @Presentation = Presentation
    WHERE ProductID = @ProductId;

	End;

	Else if @Answer = '4'

	Begin

SELECT ProductID from Products 
where @ProductId = ProductId;

UPDATE Products
    SET @Size = Size
    WHERE ProductID = @ProductId;

	End;

	Else if @Answer = '5'

	Begin

SELECT ProductID from Products 
where @ProductId = ProductId;

UPDATE Products
    SET @Pr_weight = Pr_weight
    WHERE ProductID = @ProductId;

	End;


		Else if @Answer = '6'

	Begin

SELECT ProductID from Products 
where @ProductId = ProductId;

UPDATE Products
    SET @Price = Price
    WHERE ProductID = @ProductId;

	End;


Else if @Answer = '7'

	Begin

SELECT ProductID from Products 
where @ProductId = ProductId;

UPDATE Products
    SET @MinInventoryQuantity = MinInventoryQuantity
    WHERE ProductID = @ProductId;

	End;

Else if @Answer = '8'

	Begin

SELECT ProductID from Products 
where @ProductId = ProductId;

UPDATE Products
    SET @MaxWareHouseQuantity = MaxWareHouseQuantity
    WHERE ProductID = @ProductId;

	End;


Else if @Answer = '9'

	Begin

SELECT ProductID from Products 
where @ProductId = ProductId;

UPDATE Products
    SET @CategoryID = CategoryID
    WHERE ProductID = @ProductId;

	End;

go

	Create procedure Message_Users
    @Message_text VARCHAR(250)


	as
	begin
    Insert into ContactMessages(Message_text) values
	(@Message_text)
end



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


GO

Create procedure GenerarCalculoyFactura 
@PurchaseID INT

AS
BEGIN

--Declara variables

--Total de la compra
Declare @TotalCompra Decimal(10,2)
---Calculo del impuest
Declare @TotalImpuesto Decimal(10,2)
--Total envio
Declare @TotalEnvio Decimal(10,2)
--Total a pagar del cliente
Declare @TotalPagar Decimal(10,2)

--Calculo total de la compra
-- Variable guarda la suma del resultado la cantidad de producto solicitado por el precio
Select @TotalCompra = SUM(PD.Quantity * P.Price)
FROM PurchaseDetails PD
---Join de Purchase details con los productos
INNER JOIN  Products P ON PD.ProductId = P.ProductId
WHERE PD.ProductId = @PurchaseID

----Cálculo del impuesto, donde el total del impuesto es el del total de la compra por el 0.13
Set @TotalImpuesto = @TotalCompra * 0.13

---Calculo del peso total del productos
Declare @PesoTotal Decimal(10,2)
---Variable peso total guarda la suma de la multiplicación de la cantidad por el pedo del producto
Select @PesoTotal = Sum(PD.Quantity * P.Pr_weight)
From PurchaseDetails PD
---Join de Purchase details con los productos
Inner Join Products P ON PD.ProductId = P.ProductId
Where PD.Purchase_ID = @PurchaseID

---El total del envio se declara como el peso total * 500
SET @TotalEnvio = @PesoTotal * 500


---Calculo del total a pagar que es el total de la compra, el impuesto y el total del envío
SET @TotalPagar = @TotalCompra + @TotalImpuesto + @TotalEnvio


--Inserta datos en la tabla de facturas
INSERT INTO Facturas (PurchaseID, ProductName, Quantity, UnitPrice, TotalPrice, TotalCompra, TotalImpuesto, TotalEnvio, TotalPagar)
    SELECT @PurchaseID, P.ProductName, PD.Quantity, P.Price, (PD.Quantity * P.Price) AS TotalPrice, @TotalCompra, @TotalImpuesto, @TotalEnvio, @TotalPagar
    FROM PurchaseDetails PD
    INNER JOIN Products p ON PD.ProductId = P.ProductId
    WHERE PD.PurchaseId = @PurchaseID

    -- Mostrar datos de la tabla de facturas
    SELECT * FROM Facturas WHERE PurchaseID = @PurchaseID
	
	
END