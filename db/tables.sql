use Tienda_Online
select * from Costumers
select * from IDs
select * from Users
select * from Employees
select UserID from Users
where Email = 'satdcov@outlook.com'

select * from Users

DROP TABLE IF EXISTS PurchaseDetails;
DROP TABLE IF EXISTS Purchases;
DROP TABLE IF EXISTS ProductEntries;
DROP TABLE IF EXISTS ContactMessages;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Costumers;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Ids;
DROP TABLE IF EXISTS Facturas;

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
    --Purchase_ID INT FOREIGN KEY REFERENCES Purchases(PurchaseId)
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
    MessageId int IDENTITY(1,1),
    Message_text VARCHAR(250) NOT NULL
);

CREATE TABLE Facturas (
    FacturaID INT PRIMARY KEY IDENTITY(1,1),
    PurchaseID INT,
    ProductName VARCHAR(100),
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    TotalPrice DECIMAL(10, 2),
    TotalCompra DECIMAL(10, 2),
    TotalImpuesto DECIMAL(10, 2),
    TotalEnvio DECIMAL(10, 2),
    TotalPagar DECIMAL(10, 2)
);

-- Inserci�n de datos en la tabla Ids
INSERT INTO Ids (Identification, Identification_Desc) VALUES
(1, 'Jurídica'),
(2, 'Pasaporte'),
(3, 'Dimex'),
(4, 'Jurídica'),
(5, 'Dimex'),
(6, 'Pasaporte'),
(7, 'Jurídica'),
(8, 'Dimex'),
(9, 'Jurídica'),
(10, 'Jurídica');

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
(1, 'Samsung Galaxy ZFlip', 'Box', '5.5 inches', 0.2, 699.99, 10, 100, 1),
(2, 'Jeans Fashion', 'Piece', 'M', 0.5, 39.99, 20, 200, 2),
(3, 'Garden Hose', 'Roll', '50 ft', 2.0, 29.99, 5, 50, 3),
(4, 'Shampoo Dove', 'Bottle', '500 ml', 0.6, 9.99, 30, 300, 4),
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
