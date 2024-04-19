USE Tienda_Online;
-- Creaci�n de usuarios gen�ricos en la base de datos
CREATE USER USUARIO_GENERICO1 FOR LOGIN USUARIO_GENERICO1;
CREATE USER USUARIO_GENERICO2 FOR LOGIN USUARIO_GENERICO2;
CREATE USER USUARIO_GENERICO3 FOR LOGIN USUARIO_GENERICO3;
CREATE USER USUARIO_GENERICO4 FOR LOGIN USUARIO_GENERICO4;

-- Creaci�n de administradores generales en la base de datos
USE Tienda_Online;

CREATE USER ADMINISTRADOR_GENERAL01 FOR LOGIN ADMINISTRADOR_GENERAL01;
CREATE USER ADMINISTRADOR_GENERAL02 FOR LOGIN ADMINISTRADOR_GENERAL02;
CREATE USER ADMINISTRADOR_GENERAL03 FOR LOGIN ADMINISTRADOR_GENERAL03;
CREATE USER ADMINISTRADOR_GENERAL04 FOR LOGIN ADMINISTRADOR_GENERAL04;

-- Creaci�n de funcionarios en la base de datos
USE Tienda_Online;
CREATE USER FUNCIONARIO01 FOR LOGIN FUNCIONARIO01;
CREATE USER FUNCIONARIO02 FOR LOGIN FUNCIONARIO02;
CREATE USER FUNCIONARIO03 FOR LOGIN FUNCIONARIO03;
CREATE USER FUNCIONARIO04 FOR LOGIN FUNCIONARIO04;

-- Creaci�n de usuarios clientes en la base de datos
USE Tienda_Online;
CREATE USER CLIENTE01 FOR LOGIN CLIENTE01;
CREATE USER CLIENTE02 FOR LOGIN CLIENTE02;
CREATE USER CLIENTE03 FOR LOGIN CLIENTE03;
CREATE USER CLIENTE04 FOR LOGIN CLIENTE04;

--------------------------Roles y permisos de admins
-- Crear roles de base de datos
CREATE ROLE Rol_AdministradorGeneral;

-- Otorgar permisos al rol de Administrador General en las tablas
GRANT SELECT, INSERT, UPDATE, DELETE ON Users TO Rol_AdministradorGeneral;
GRANT SELECT, INSERT, UPDATE, DELETE ON Costumers TO Rol_AdministradorGeneral;
GRANT SELECT, INSERT, UPDATE, DELETE ON Employees TO Rol_AdministradorGeneral;
GRANT SELECT, INSERT, UPDATE, DELETE ON Categories TO Rol_AdministradorGeneral;
GRANT SELECT, INSERT, UPDATE, DELETE ON Products TO Rol_AdministradorGeneral;
GRANT SELECT, INSERT, UPDATE, DELETE ON Factura TO Rol_AdministradorGeneral;
GRANT SELECT, INSERT, UPDATE, DELETE ON Purchases TO Rol_AdministradorGeneral;
GRANT SELECT, INSERT, UPDATE, DELETE ON ProductEntries TO Rol_AdministradorGeneral;
GRANT SELECT, INSERT, UPDATE, DELETE ON ContactMessages TO Rol_AdministradorGeneral;
GRANT SELECT, INSERT, UPDATE, DELETE ON History TO Rol_AdministradorGeneral;
GRANT SELECT, INSERT, UPDATE, DELETE ON ProductsXFactura TO Rol_AdministradorGeneral;

-- Asignar usuarios a roles
ALTER ROLE Rol_AdministradorGeneral ADD MEMBER ADMINISTRADOR_GENERAL01;
ALTER ROLE Rol_AdministradorGeneral ADD MEMBER ADMINISTRADOR_GENERAL02;
ALTER ROLE Rol_AdministradorGeneral ADD MEMBER ADMINISTRADOR_GENERAL03;
ALTER ROLE Rol_AdministradorGeneral ADD MEMBER ADMINISTRADOR_GENERAL04;


-------
USE Tienda_Online;

-- Crear el rol para los funcionarios
CREATE ROLE Rol_Funcionario;

-- Otorgar permisos al rol de funcionario en las tablas relevantes
GRANT SELECT, INSERT, UPDATE, DELETE ON Users TO Rol_Funcionario;
GRANT SELECT, INSERT, UPDATE, DELETE ON Products TO Rol_Funcionario;
GRANT SELECT, INSERT, UPDATE, DELETE ON Costumers TO Rol_Funcionario;
GRANT SELECT, INSERT, UPDATE, DELETE ON ProductEntries TO Rol_Funcionario;
GRANT SELECT, INSERT, UPDATE, DELETE ON Factura TO Rol_Funcionario;
GRANT SELECT, INSERT, UPDATE, DELETE ON Categories TO Rol_Funcionario;
GRANT SELECT, INSERT, UPDATE, DELETE ON Purchases TO Rol_Funcionario;

-- Asignar usuarios al rol de funcionario
ALTER ROLE Rol_Funcionario ADD MEMBER FUNCIONARIO01;
ALTER ROLE Rol_Funcionario ADD MEMBER FUNCIONARIO02;
ALTER ROLE Rol_Funcionario ADD MEMBER FUNCIONARIO03;
ALTER ROLE Rol_Funcionario ADD MEMBER FUNCIONARIO04;

--------------------------------

-- Crear el rol para los clientes
CREATE ROLE Rol_Cliente;

-- Otorgar permisos al rol de cliente en las tablas relevantes
GRANT SELECT, INSERT, UPDATE, DELETE ON Users TO Rol_Cliente;
GRANT SELECT ON Categories TO Rol_Cliente;
GRANT SELECT ON Products TO Rol_Cliente;
GRANT SELECT, INSERT, UPDATE, DELETE ON Costumers TO Rol_Cliente;
GRANT SELECT ON Factura TO Rol_Cliente;
GRANT SELECT ON Purchases TO Rol_Cliente;
GRANT SELECT, INSERT ON ContactMessages TO Rol_Cliente;
GRANT SELECT ON ProductsXFactura TO Rol_Cliente;
GRANT SELECT ON History TO Rol_Cliente;


-- Asignar usuarios al rol de cliente
ALTER ROLE Rol_Cliente ADD MEMBER CLIENTE01;
ALTER ROLE Rol_Cliente ADD MEMBER CLIENTE02;
ALTER ROLE Rol_Cliente ADD MEMBER CLIENTE03;
ALTER ROLE Rol_Cliente ADD MEMBER CLIENTE04;
------------------------

Create role Rol_Generico;

GRANT SELECT ON Products TO Rol_Generico;
GRANT SELECT ON Categories TO Rol_Generico;
GRANT SELECT, INSERT ON ContactMessages TO Rol_Generico;

ALTER ROLE Rol_Generico ADD MEMBER USUARIO_GENERICO1;
ALTER ROLE Rol_Generico ADD MEMBER USUARIO_GENERICO2;
ALTER ROLE Rol_Generico ADD MEMBER USUARIO_GENERICO3;
ALTER ROLE Rol_Generico ADD MEMBER USUARIO_GENERICO4;