use Tienda_Online

DROP TRIGGER IF EXISTS Trg_Login_log ON Users;

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