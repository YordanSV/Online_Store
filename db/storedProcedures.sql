use Tienda_Online

DROP PROCEDURE IF EXISTS SP_Costumer_Update;

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




