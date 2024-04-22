import { VarChar } from "mssql";
import { getConnection, sql } from "../database/conexionBD"
export const insertRegister = async (req, res) => {
    try {
        const { name, identification, surname, birthdate, email, password, province, canton, district, position, neighborhood, address, phone, cardNumber, cardType, idDesc } = req.body;
        console.log(idDesc)

        const pool = await getConnection();
        const request = pool.request();
        request.input('ID', sql.Int, identification); // Ajusta el valor del ID según tu lógica de generación de ID
        request.input('ID_Desc', sql.NVarChar(50), idDesc); // Ajusta el valor del ID según tu lógica de generación de ID
        request.input('Email', sql.NVarChar(50), email);
        request.input('Pass_word', sql.NVarChar(50), password);
        request.input('Position', sql.NVarChar(50), position);
        request.input('FirstName', sql.NVarChar(50), name);
        request.input('LastName', sql.NVarChar(50), surname);
        request.input('BirthDate', sql.Date, birthdate);
        request.input('Province', sql.NVarChar(50), province);
        request.input('District', sql.NVarChar(50), district);
        request.input('Canton', sql.NVarChar(50), canton);
        request.input('NeighBorhood', sql.VarChar(50), neighborhood);
        request.input('Place_address', sql.VarChar(255), address);
        request.input('Phone', sql.VarChar(20), phone);
        request.input('CardNumber', sql.VarChar(16), cardNumber);
        request.input('CardType', sql.VarChar(20), cardType);
<<<<<<< HEAD
        
        const result = await request.execute('SP_Register_Clients');

        const returnValue = result.returnValue;
        if (returnValue === 2) {
            res.status(400).json({ error: 'La identificación ya existe' });
        }else if (returnValue === 1) {
            res.status(400).json({ error: 'El correo electrónico ya existe' });
        } else{
            res.json(result.recordset);
        }
    } catch (error) {
        console.error('Error al insertar registro:', error);
        res.status(500).json({ error: 'Error al insertar registro' });
=======
        const result = await request.execute('SP_Register_Clients');
        
    } catch (error) {

        console.error('Error al insertar registro:', error);
        if (error && error.message) {
            // Aquí puedes usar el mensaje de error en tu respuesta al cliente
            res.status(400).json({ error: error.message });
        } else {
            res.status(400).json({ error: 'Error al insertar registro' });
        }
>>>>>>> b2b1316817677c9c8487cb30224c42461b5c123d
    }
}




// export const createNewProduct = async (req, res) => {
//     const {name} = req.body

//     const pool = await getConnection()
//     //await pool.request().input("name", sql.VarChar, "NewProduct")
//     console.log(name)

// }