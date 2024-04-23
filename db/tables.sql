-- use Tienda_Online
-- select * from Costumers
-- select * from IDs
-- select * from Users
-- select * from Employees
-- select UserID from Users
-- where Email = 'satdcov@outlook.com'

DROP TABLE IF EXISTS ProductEntries;
DROP TABLE IF EXISTS ContactMessages;
DROP TABLE IF EXISTS ProductsXFactura
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS History;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Costumers;
DROP TABLE IF EXISTS Factura;
DROP TABLE IF EXISTS Ids;
DROP TABLE IF EXISTS Users;

-- Creaci?n de la tabla Ids

CREATE TABLE Ids (
    Identification INT PRIMARY KEY,
    Identification_Desc VARCHAR(20)
);

---ocupa campo timestamp
-- Creaci?n de la tabla Users
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY (1, 1),
    Email VARCHAR(50) NOT NULL,
    Pass_word VARCHAR(25) NOT NULL,
    Position VARCHAR(50) NOT NULL
	 ---LastModUs TIMESTAMP DEFAULT CURRENT_TIMESTAMP
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

---ocupa timestamp
-- Creaci?n de la tabla Categories
CREATE TABLE Categories (
    CategoryId INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
	 ---LastModCat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

---ocupa timestamp
-- Creaci?n de la tabla Products
CREATE TABLE Products (
    ProductId INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Presentation VARCHAR(50) NOT NULL,
    Size VARCHAR(20) NOT NULL,
    Pr_weight DECIMAL(10, 2) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    MinInventoryQuantity INT NOT NULL,
	ActualInventoryInt INT NOT NULL,
    MaxWareHouseQuantity INT NOT NULL,
    CategoryID INT FOREIGN KEY REFERENCES Categories(CategoryID)
	---LastModProd TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

---ocupa timestamp
---cambiar nombres a inglés
-- Creaci?n de la tabla PurchaseDetails
---Cambiar nombre a Factura por Invoice y el id por invoiceid
CREATE TABLE Factura (
    FacturaID INT PRIMARY KEY IDENTITY(1,1),
	Identification INT FOREIGN KEY REFERENCES IDs(Identification),
    TotalBruto DECIMAL(10, 2) ,
    TotalImpuesto DECIMAL(10, 2),
    TotalEnvio DECIMAL(10, 2),
    TotalPagar DECIMAL(10, 2),
    Fecha DATETIME
	---LastModInvoice TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

---ocupa timestamp
-- Creaci?n de la tabla Purchases

---ocupa timestamp
-- Creaci?n de la tabla ProductEntries
CREATE TABLE ProductEntries (
    EntryId INT IDENTITY(1,1) PRIMARY KEY,
    ProductId INT FOREIGN KEY REFERENCES Products(ProductId),
    Quantity INT NOT NULL
	---LastModPE TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


---ocupa timestamp
-- Creaci?n de la tabla ContactMessages
CREATE TABLE ContactMessages (
    MessageId INT PRIMARY KEY,
    Message_text VARCHAR(250) NOT NULL
	---LastModMessage TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


	Create table History(
	UserID int references Users(UserId),
	FacturaID INT PRIMARY KEY IDENTITY(1,1),
	);

---ocupa timestamp
---cambiar nombre a ProductsxInvoice
		Create table ProductsXFactura(
	 ProductId INT FOREIGN KEY REFERENCES Products(ProductId) ,
		FacturaID INT FOREIGN KEY REFERENCES Factura(FacturaId), 
		Quantity int 
	---LastModPXI TIMESTAMP DEFAULT CURRENT_TIMESTAMP
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
/*
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
INSERT INTO Products (ProductId, ProductName, Presentation, Size, Pr_weight, Price, MinInventoryQuantity, ActualInventoryInt, MaxWareHouseQuantity, CategoryID) VALUES
(1, 'Adidas Essentials 3-Stripes Fleece Hoodie', 'Piece', 'M', 0.8, 49.99, 20, 30, 200, 2),
(2, 'Aloe Shampoo', 'Bottle', '250 ml', 0.3, 5.99, 30,  30, 300, 4),
(3, 'Android 154', 'Piece', 'One Size', 0.2, 299.99, 10,  30, 100, 1),
(4, 'Char-Broil Performance 4-Burner Gas Grill', 'Piece', 'Large', 50, 499.99, 5,  30, 50, 3),
(5, 'Dove Men+Care Antiperspirant Deodorant Stick', 'Piece', '50 g', 0.1, 3.49, 50,  30, 500, 4),
(6, 'Fiskars Steel Bypass Pruning Shears', 'Piece', 'One Size', 0.3, 12.99, 20,  30, 200, 3),
(7, 'Fitbit Charge 5 Fitness and Activity Tracker', 'Piece', 'One Size', 0.1, 149.99, 15,  30, 150, 1),
(8, 'Garden Hose', 'Roll', '100 ft', 3.0, 49.99, 10,  30, 100, 3),
(9, 'Levis Jeans', 'Piece', 'M', 0.8, 59.99, 20,  30, 200, 2),
(10, 'Nike Air Force 1 Low', 'Piece', '9', 1.0, 89.99, 10,  30, 100, 2),
(11, 'Olay Regenerist Micro-Sculpting Cream', 'Jar', '50 ml', 0.2, 24.99, 25,  30, 250, 4),
(12, 'Samsung 65-Inch QLED 4K Smart TV', 'Box', '65 inches', 20.0, 1499.99, 5,  30, 50, 1),
(13, 'Sony WH-1000XM4 Wireless Noise Cancelling Headphones', 'Piece', 'One Size', 0.3, 279.99, 10,  30, 100, 1),
(14, 'Samsung Galaxy ZFlip', 'Box', '6.7 inches', 0.2, 999.99, 10,  30, 100, 1),
(15, 'Spalding NBA Street Basketball', 'Piece', 'Official Size', 1.0, 14.99, 30,  30, 300, 5),
(16, 'Under Armour Shoes', 'Pair', '9', 1.2, 79.99, 15,  30, 150, 2),
(17, 'Yoga Mat', 'Piece', 'Standard', 1.5, 19.99, 15,  30, 150, 5);
-- Inserci?n de datos en la tabla Purchases
-- Insertar datos de factura de ejemplo

-- Inserci?n de datos en la tabla ProductEntries
INSERT INTO ProductEntries ( ProductId, Quantity) VALUES
( 1, 10),
( 2, 20),
( 3, 5),
( 4, 30),
( 5, 15),
( 6, 10),
(7, 20),
( 8, 5),
( 9, 30),
( 10, 15),
( 11, 10),
( 12, 20),
( 13, 5),
( 14, 30),
( 15, 15),
( 16, 30),
( 17, 15);
*/


-- Insertar datos en la tabla Ids
INSERT INTO Ids (Identification, Identification_Desc) 
VALUES 
(1, 'ID Tipo A'), 
(2, 'ID Tipo B'),
(3, 'ID Tipo C');

-- Insertar datos en la tabla Users
INSERT INTO Users (Email, Pass_word, Position) 
VALUES 
('usuario1@example.com', 'contraseña1', 'Puesto A'), 
('usuario2@example.com', 'contraseña2', 'Puesto B'),
('usuario3@example.com', 'contraseña3', 'Puesto C');

-- Insertar datos en la tabla Costumers
INSERT INTO Costumers (ID, UserID, FirstName, LastName, BirthDate, Province, District, Canton, NeighBorhood, Place_address, Phone, CardNumber, CardType, Cs_status) 
VALUES 
(1, 1, 'Juan', 'Pérez', '1990-05-15', 'San José', 'Central', 'San José', 'Barrio A', 'Dirección 123', '12345678', '1234567890123456', 'Visa', 'Activo'), 
(2, 2, 'María', 'González', '1985-09-20', 'Heredia', 'Heredia', '', 'Barrio B', 'Dirección 456', '98765432', '9876543210987654', 'Mastercard', 'Activo');

-- Insertar datos en la tabla Employees
INSERT INTO Employees (ID, UserID, FirstName, LastName, Em_status) 
VALUES 
(2, 3, 'Pedro', 'Martínez', 'Activo'), 
(3, 4, 'Ana', 'López', 'Activo');
select * from Users

-- Inserci?n de datos en la tabla Categories
INSERT INTO Categories (CategoryId, CategoryName) VALUES
(1, 'Electr?nica'),
(2, 'Ropa y Accesorios'),
(3, 'Hogar y Jard?n'),
(4, 'Salud y Belleza'),
(5, 'Deportes y Actividades al Aire Libre');

-- Inserci?n de datos en la tabla Products
INSERT INTO Products (ProductId, ProductName, Presentation, Size, Pr_weight, Price, MinInventoryQuantity, ActualInventoryInt, MaxWareHouseQuantity, CategoryID) VALUES
(1, 'Adidas Essentials 3-Stripes Fleece Hoodie', 'Piece', 'M', 0.8, 49.99, 20, 30, 200, 2),
(2, 'Aloe Shampoo', 'Bottle', '250 ml', 0.3, 5.99, 30,  30, 300, 4),
(3, 'Android 154', 'Piece', 'One Size', 0.2, 299.99, 10,  30, 100, 1),
(4, 'Char-Broil Performance 4-Burner Gas Grill', 'Piece', 'Large', 50, 499.99, 5,  30, 50, 3),
(5, 'Dove Men+Care Antiperspirant Deodorant Stick', 'Piece', '50 g', 0.1, 3.49, 50,  30, 500, 4),
(6, 'Fiskars Steel Bypass Pruning Shears', 'Piece', 'One Size', 0.3, 12.99, 20,  30, 200, 3),
(7, 'Fitbit Charge 5 Fitness and Activity Tracker', 'Piece', 'One Size', 0.1, 149.99, 15,  30, 150, 1),
(8, 'Garden Hose', 'Roll', '100 ft', 3.0, 49.99, 10,  30, 100, 3),
(9, 'Levis Jeans', 'Piece', 'M', 0.8, 59.99, 20,  30, 200, 2),
(10, 'Nike Air Force 1 Low', 'Piece', '9', 1.0, 89.99, 10,  30, 100, 2),
(11, 'Olay Regenerist Micro-Sculpting Cream', 'Jar', '50 ml', 0.2, 24.99, 25,  30, 250, 4),
(12, 'Samsung 65-Inch QLED 4K Smart TV', 'Box', '65 inches', 20.0, 1499.99, 5,  30, 50, 1),
(13, 'Sony WH-1000XM4 Wireless Noise Cancelling Headphones', 'Piece', 'One Size', 0.3, 279.99, 10,  30, 100, 1),
(14, 'Samsung Galaxy ZFlip', 'Box', '6.7 inches', 0.2, 999.99, 10,  30, 100, 1),
(15, 'Spalding NBA Street Basketball', 'Piece', 'Official Size', 1.0, 14.99, 30,  30, 300, 5),
(16, 'Under Armour Shoes', 'Pair', '9', 1.2, 79.99, 15,  30, 150, 2),
(17, 'Yoga Mat', 'Piece', 'Standard', 1.5, 19.99, 15,  30, 150, 5);
-- Inserci?n de datos en la tabla Purchases
-- Insertar datos de factura de ejemplo

-- Inserci?n de datos en la tabla ProductEntries
INSERT INTO ProductEntries ( ProductId, Quantity) VALUES
( 1, 10),
( 2, 20),
( 3, 5),
( 4, 30),
( 5, 15),
( 6, 10),
(7, 20),
( 8, 5),
( 9, 30),
( 10, 15),
( 11, 10),
( 12, 20),
( 13, 5),
( 14, 30),
( 15, 15),
( 16, 30),
( 17, 15);


-- Insertar datos en la tabla Factura
INSERT INTO Factura (Identification, TotalBruto, TotalImpuesto, TotalEnvio, TotalPagar, Fecha) 
VALUES 
(1, 100.00, 13.00, 5.00, 118.00, '2024-04-21 10:30:00'), 
(2, 50.00, 6.50, 3.00, 59.50, '2024-04-20 15:45:00');

-- Insertar datos en la tabla ProductEntries


-- Insertar datos en la tabla ContactMessages
INSERT INTO ContactMessages (Message_text) 
VALUES 
('Mensaje de contacto 1'), 
('Mensaje de contacto 2');

-- Insertar datos en la tabla History
INSERT INTO History (UserID) 
VALUES 
(1), 
(2);

-- Insertar datos en la tabla ProductsXFactura
INSERT INTO ProductsXFactura (ProductId, FacturaID, Quantity) 
VALUES 
(1, 1, 5), 
(2, 1, 10),
(1, 2, 3),
(2, 2, 5);
