-- Creaci�n de la tabla Ids
CREATE TABLE Ids (
    Identification INT PRIMARY KEY,
    Identification_Desc VARCHAR(20)
);

-- Creaci�n de la tabla Users
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY (1, 1),
    Email VARCHAR(50) NOT NULL,
    Pass_word VARCHAR(25) NOT NULL,
    Position VARCHAR(50) NOT NULL
);

-- Creaci�n de la tabla Costumers
CREATE TABLE Costumers (
    ID INT FOREIGN KEY REFERENCES Ids(Identification),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    BirthDate DATE NOT NULL,
    Province VARCHAR(50) NOT NULL,
    District VARCHAR(50),
    Canton VARCHAR(50),
    NeighBorhood VARCHAR(50) NOT NULL,
    Place_address VARCHAR(255) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    CardNumber VARCHAR(16) NOT NULL,
    CardType VARCHAR(20) NOT NULL,
    Cs_status VARCHAR(20) NOT NULL
);

-- Creaci�n de la tabla Employees
CREATE TABLE Employees (
    ID INT FOREIGN KEY REFERENCES Ids(Identification),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL
);

-- Creaci�n de la tabla Categories
CREATE TABLE Categories (
    CategoryId INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
);

-- Creaci�n de la tabla Products
CREATE TABLE Products (
    ProductId INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Presentation VARCHAR(50) NOT NULL,
    Size VARCHAR(20) NOT NULL,
    Pr_weight DECIMAL(10, 2) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    MinInventoryQuantity INT NOT NULL,
    MaxWareHouseQuantity INT NOT NULL,
    CategoryID INT FOREIGN KEY REFERENCES Categories(CategoryID)
);

-- Creaci�n de la tabla Purchases
CREATE TABLE Purchases (
    PurchaseId INT PRIMARY KEY,
    UserId INT FOREIGN KEY REFERENCES Ids(Identification),
    Purchasedate DATETIME NOT NULL,
    Totalpurchase DECIMAL(10, 2) NOT NULL,
    Shippingcost DECIMAL(10, 2) NOT NULL
);

-- Creaci�n de la tabla PurchaseDetails
CREATE TABLE PurchaseDetails (
    PurchasedetailId INT PRIMARY KEY,
    PurchaseId INT FOREIGN KEY REFERENCES Purchases(PurchaseId),
    ProductId INT FOREIGN KEY REFERENCES Products(ProductId),
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    TotalPrice DECIMAL(10, 2) NOT NULL,
    Purchase_ID INT FOREIGN KEY REFERENCES Purchases(PurchaseId)
);

-- Creaci�n de la tabla ProductEntries
CREATE TABLE ProductEntries (
    EntryId INT PRIMARY KEY,
    ProductId INT FOREIGN KEY REFERENCES Products(ProductId),
    EntryDate DATETIME NOT NULL,
    Quantity INT NOT NULL
);

-- Creaci�n de la tabla ContactMessages
CREATE TABLE ContactMessages (
    MessageId INT PRIMARY KEY,
    Message_text VARCHAR(250) NOT NULL
);

-- Inserci�n de datos en la tabla Ids
INSERT INTO Ids (Identification, Identification_Desc) VALUES
(1, 'ID001'),
(2, 'ID002'),
(3, 'ID003'),
(4, 'ID004'),
(5, 'ID005'),
(6, 'ID001'),
(7, 'ID002'),
(8, 'ID003'),
(9, 'ID004'),
(10, 'ID005');

-- Inserci�n de datos en la tabla Users
INSERT INTO Users (Email, Pass_word, Position) VALUES
('user1@example.com', 'password1', 'Employee'),
('user2@example.com', 'password2', 'Costumer'),
('user3@example.com', 'password3', 'Employee'),
('user4@example.com', 'password4', 'Employee'),
('user5@example.com', 'password5', 'Costumer'),
('user6@example.com', 'password6', 'Employee'),
('user7@example.com', 'password7', 'Costumer'),
('user8@example.com', 'password8', 'Employee'),
('user9@example.com', 'password9', 'Employee'),
('user10@example.com', 'password10', 'Costumer');

-- Inserci�n de datos en la tabla Costumers
INSERT INTO Costumers (ID, UserID, FirstName, LastName, BirthDate, Province, District, Canton, NeighBorhood, Place_address, Phone, CardNumber, CardType, Cs_status) VALUES
(1, 1, 'Juan', 'P�rez', '1990-05-15', 'San Jos�', 'Escaz�', 'Escaz�', 'Los Laureles', 'Calle Principal #123', '1234567890', '1234567890123456', 'Visa', 'Active'),
(2, 2, 'Mar�a', 'Gonz�lez', '1988-08-20', 'Heredia', 'Heredia', 'Heredia', 'San Francisco', 'Avenida Central #456', '2345678901', '9876543210987654', 'MasterCard', 'Active'),
(3, 3, 'Pedro', 'Rodr�guez', '1995-03-10', 'Alajuela', 'Alajuela', 'Alajuela', 'El Coyol', 'Calle 2 #789', '3456789012', '4567890123456789', 'Visa', 'Active'),
(4, 4, 'Ana', 'L�pez', '1986-11-25', 'Puntarenas', 'Puntarenas', 'Puntarenas', 'El Roble', 'Avenida Sur #987', '4567890123', '7890123456789012', 'MasterCard', 'Active'),
(5, 5, 'Luis', 'Hern�ndez', '1992-09-08', 'Guanacaste', 'Liberia', 'Liberia', 'Barrio Amon�', 'Calle Norte #654', '5678901234', '9012345678901234', 'Visa', 'Active');

-- Inserci�n de datos en la tabla Employees
INSERT INTO Employees (ID, FirstName, LastName) VALUES
(6, 'Carlos', 'Mart�nez'),
(7, 'Sof�a', 'D�az'),
(8, 'Javier', 'G�mez'),
(9, 'Laura', 'P�rez'),
(10, 'Diego', 'S�nchez');

-- Inserci�n de datos en la tabla Categories
INSERT INTO Categories (CategoryId, CategoryName) VALUES
(1, 'Electr�nica'),
(2, 'Ropa y Accesorios'),
(3, 'Hogar y Jard�n'),
(4, 'Salud y Belleza'),
(5, 'Deportes y Actividades al Aire Libre');

-- Inserci�n de datos en la tabla Products
INSERT INTO Products (ProductId, ProductName, Presentation, Size, Pr_weight, Price, MinInventoryQuantity, MaxWareHouseQuantity, CategoryID) VALUES
(1, 'Smartphone', 'Box', '5.5 inches', 0.2, 699.99, 10, 100, 1),
(2, 'Jeans', 'Piece', 'M', 0.5, 39.99, 20, 200, 2),
(3, 'Garden Hose', 'Roll', '50 ft', 2.0, 29.99, 5, 50, 3),
(4, 'Shampoo', 'Bottle', '500 ml', 0.6, 9.99, 30, 300, 4),
(5, 'Yoga Mat', 'Piece', 'Standard', 1.5, 19.99, 15, 150, 5);

-- Inserci�n de datos en la tabla Purchases
INSERT INTO Purchases (PurchaseId, UserId, Purchasedate, Totalpurchase, Shippingcost) VALUES
(1, 1, '2024-02-11 10:00:00', 199.99, 10.00),
(2, 2, '2024-02-10 15:30:00', 149.99, 8.50),
(3, 3, '2024-02-09 12:45:00', 49.99, 5.00),
(4, 4, '2024-02-08 09:20:00', 29.99, 3.50),
(5, 5, '2024-02-07 16:00:00', 99.99, 7.00);

-- Inserci�n de datos en la tabla PurchaseDetails
INSERT INTO PurchaseDetails (PurchasedetailId, PurchaseId, ProductId, Quantity, UnitPrice, TotalPrice, Purchase_ID) VALUES
(1, 1, 1, 1, 699.99, 699.99, 1),
(2, 2, 2, 2, 39.99, 79.98, 2),
(3, 3, 3, 1, 29.99, 29.99, 3),
(4, 4, 4, 3, 9.99, 29.97, 4),
(5, 5, 5, 1, 19.99, 19.99, 5);

-- Inserci�n de datos en la tabla ProductEntries
INSERT INTO ProductEntries (EntryId, ProductId, EntryDate, Quantity) VALUES
(1, 1, '2024-02-11 10:00:00', 10),
(2, 2, '2024-02-10 15:30:00', 20),
(3, 3, '2024-02-09 12:45:00', 5),
(4, 4, '2024-02-08 09:20:00', 30),
(5, 5, '2024-02-07 16:00:00', 15);

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


/*Procedimientos almacenados 
--------------------------
----------------------------
-------------------------
--------------------------
---------------------------
----------------------------
--------------------------*/

Create Procedure SP_Costumer_Update
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

/*Si se escoge el numero 12, cambia el estado*/

Else if @Answer = '12'
Begin
SELECT UserID from costumers 
where @CS_status = CS_status;

UPDATE Costumers
    SET CS_status = @CS_status
    WHERE UserID = @UserID;

End;
/*Si se escoge el numero 13, elimina el cliente*/

Else if @Answer = '13'
Begin
SELECT UserID from costumers 
where UserID = @UserID;

delete from Costumers
where UserID = @UserID;
End;


Else
Begin
Print 'Opci�n inv�lida'

End;
End;




