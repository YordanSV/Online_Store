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


-- Creaci?n de la tabla Ids
CREATE TABLE Ids (
    Identification INT PRIMARY KEY,
    Identification_Desc VARCHAR(20)
);

-- Creaci?n de la tabla Users
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY (1, 1),
    Email VARCHAR(50) NOT NULL,
    Pass_word VARCHAR(25) NOT NULL,
    Position VARCHAR(50) NOT NULL
);

-- Creaci?n de la tabla Costumers
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

-- Creaci?n de la tabla Employees
CREATE TABLE Employees (
    ID INT FOREIGN KEY REFERENCES Ids(Identification),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
	Em_status VARCHAR(20) NOT NULL
);

-- Creaci?n de la tabla Categories
CREATE TABLE Categories (
    CategoryId INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
);

-- Creaci?n de la tabla Products
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


-- Creaci?n de la tabla PurchaseDetails
CREATE TABLE Factura (
    FacturaID INT PRIMARY KEY IDENTITY(1,1),
    ProductId INT FOREIGN KEY REFERENCES Products(ProductId),
	ProductName VARCHAR(100),
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    TotalPrice DECIMAL(10, 2),
    TotalCompra DECIMAL(10, 2),
    TotalImpuesto DECIMAL(10, 2),
    TotalEnvio DECIMAL(10, 2),
    TotalPagar DECIMAL(10, 2)
    --Quantity INT NOT NULL,
    --UnitPrice DECIMAL(10, 2) NOT NULL,
    --TotalPrice DECIMAL(10, 2) NOT NULL,
    --Purchase_ID INT FOREIGN KEY REFERENCES Purchases(PurchaseId)
);

-- Creaci?n de la tabla Purchases
CREATE TABLE Purchases (
    PurchaseID INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT FOREIGN KEY REFERENCES Ids(Identification),
    Purchasedate DATETIME NOT NULL,
    Totalpurchase DECIMAL(10, 2) NOT NULL,
    Shippingcost DECIMAL(10, 2) NOT NULL
);

-- Creaci?n de la tabla ProductEntries
INSERT INTO ProductEntries (EntryId, ProductId, Quantity)
VALUES
    (1, 1,  20),
    (2, 2,  30),
    (3, 3,  25),
    (4, 4,  15),
    (5, 5, 35);


-- Creaci?n de la tabla ContactMessages
CREATE TABLE ContactMessages (
    MessageId int IDENTITY(1,1),
    Message_text VARCHAR(250) NOT NULL
);


	Create table History(
	UserID int references Users(UserId),
	FacturaID INT PRIMARY KEY IDENTITY(1,1),
	);


		Create table ProductsXFactura(
	 ProductId INT FOREIGN KEY REFERENCES Products(ProductId) ,
		FacturaID INT FOREIGN KEY REFERENCES Factura(FacturaId)
	);


/*#######################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
#########################################################################################################
*/ 

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

-- Inserci?n de datos en la tabla Users
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

-- Inserci?n de datos en la tabla Costumers
INSERT INTO Costumers (ID, UserID, FirstName, LastName, BirthDate, Province, District, Canton, NeighBorhood, Place_address, Phone, CardNumber, CardType, Cs_status) VALUES
(1, 1, 'Juan', 'P?rez', '1990-05-15', 'San Jos?', 'Escaz?', 'Escaz?', 'Los Laureles', 'Calle Principal #123', '1234567890', '1234567890123456', 'Visa', 'Active'),
(2, 2, 'Mar?a', 'Gonz?lez', '1988-08-20', 'Heredia', 'Heredia', 'Heredia', 'San Francisco', 'Avenida Central #456', '2345678901', '9876543210987654', 'MasterCard', 'Active'),
(3, 3, 'Pedro', 'Rodr?guez', '1995-03-10', 'Alajuela', 'Alajuela', 'Alajuela', 'El Coyol', 'Calle 2 #789', '3456789012', '4567890123456789', 'Visa', 'Active'),
(4, 4, 'Ana', 'L?pez', '1986-11-25', 'Puntarenas', 'Puntarenas', 'Puntarenas', 'El Roble', 'Avenida Sur #987', '4567890123', '7890123456789012', 'MasterCard', 'Active'),
(5, 5, 'Luis', 'Hern?ndez', '1992-09-08', 'Guanacaste', 'Liberia', 'Liberia', 'Barrio Amon?', 'Calle Norte #654', '5678901234', '9012345678901234', 'Visa', 'Active');

-- Inserci?n de datos en la tabla Employees
INSERT INTO Employees (ID, FirstName, LastName, Em_Status) VALUES
(6, 'Carlos', 'Mart?nez', 'Active'),
(7, 'Sof?a', 'D?az', 'Active'),
(8, 'Javier', 'G?mez', 'Active'),
(9, 'Laura', 'P?rez', 'Active'),
(10, 'Diego', 'S?nchez', 'Inactive');

-- Inserci?n de datos en la tabla Categories
INSERT INTO Categories (CategoryId, CategoryName) VALUES
(1, 'Electr?nica'),
(2, 'Ropa y Accesorios'),
(3, 'Hogar y Jard?n'),
(4, 'Salud y Belleza'),
(5, 'Deportes y Actividades al Aire Libre');

-- Inserci?n de datos en la tabla Products
INSERT INTO Products (ProductId, ProductName, Presentation, Size, Pr_weight, Price, MinInventoryQuantity, MaxWareHouseQuantity, CategoryID) VALUES
(1, 'Adidas Essentials 3-Stripes Fleece Hoodie', 'Piece', 'M', 0.8, 49.99, 20, 200, 2),
(2, 'Aloe Shampoo', 'Bottle', '250 ml', 0.3, 5.99, 30, 300, 4),
(3, 'Android 154', 'Piece', 'One Size', 0.2, 299.99, 10, 100, 1),
(4, 'Char-Broil Performance 4-Burner Gas Grill', 'Piece', 'Large', 50, 499.99, 5, 50, 3),
(5, 'Dove Men+Care Antiperspirant Deodorant Stick', 'Piece', '50 g', 0.1, 3.49, 50, 500, 4),
(6, 'Fiskars Steel Bypass Pruning Shears', 'Piece', 'One Size', 0.3, 12.99, 20, 200, 3),
(7, 'Fitbit Charge 5 Fitness and Activity Tracker', 'Piece', 'One Size', 0.1, 149.99, 15, 150, 1),
(8, 'Garden Hose', 'Roll', '100 ft', 3.0, 49.99, 10, 100, 3),
(9, 'Levis Jeans', 'Piece', 'M', 0.8, 59.99, 20, 200, 2),
(10, 'Nike Air Force 1 Low', 'Piece', '9', 1.0, 89.99, 10, 100, 2),
(11, 'Olay Regenerist Micro-Sculpting Cream', 'Jar', '50 ml', 0.2, 24.99, 25, 250, 4),
(12, 'Samsung 65-Inch QLED 4K Smart TV', 'Box', '65 inches', 20.0, 1499.99, 5, 50, 1),
(13, 'Sony WH-1000XM4 Wireless Noise Cancelling Headphones', 'Piece', 'One Size', 0.3, 279.99, 10, 100, 1),
(14, 'Samsung Galaxy ZFlip', 'Box', '6.7 inches', 0.2, 999.99, 10, 100, 1),
(15, 'Spalding NBA Street Basketball', 'Piece', 'Official Size', 1.0, 14.99, 30, 300, 5),
(16, 'Under Armour Shoes', 'Pair', '9', 1.2, 79.99, 15, 150, 2),
(17, 'Yoga Mat', 'Piece', 'Standard', 1.5, 19.99, 15, 150, 5);
-- Inserci?n de datos en la tabla Purchases
-- Insertar datos de factura de ejemplo
INSERT INTO Factura (ProductId, ProductName, Quantity, UnitPrice, TotalPrice, TotalCompra, TotalImpuesto, TotalEnvio, TotalPagar)
VALUES
    (1, 'Producto A', 2, 10.99, 21.98, 21.98, 2.50, 5.00, 29.48),
    (2, 'Producto B', 1, 15.99, 15.99, 15.99, 1.60, 3.00, 20.59),
    (3, 'Producto C', 3, 20.99, 62.97, 62.97, 6.30, 8.00, 77.27),
    (4, 'Producto D', 1, 25.99, 25.99, 25.99, 2.60, 4.00, 32.59),
    (5, 'Producto E', 4, 5.99, 23.96, 23.96, 2.40, 6.00, 32.36);


-- Inserci?n de datos en la tabla ProductEntries
INSERT INTO ProductEntries (EntryId, ProductId, Quantity) VALUES
(1, 1, 10),
(2, 2, 20),
(3, 3, 5),
(4, 4, 30),
(5, 5, 15);
