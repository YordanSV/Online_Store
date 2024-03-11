import { VarChar } from "mssql";
import { getConnection, sql } from "../database/conexionBD"

export const getUserDB = async (req, res) => {
    try {
        console.log('entra')

        const { emailInput, passwordInput} = req.body;
        
        const pool = await getConnection();
        const request = pool.request();
        
        request.input('Email', sql.NVarChar(50), emailInput);
        request.input('Password', sql.NVarChar(50), passwordInput);
        const result = await request.execute('SP_Register_Clients');
        console.log('aja1')
        const userData = result.recordset[0];
        console.log('aja2')


        // Enviar una respuesta con los datos del usuario al cliente
        res.status(200).json(userData);
        
    } catch (error) {
        console.error('Error al hacer login en la DB:', error);
        if (error && error.message) {
            res.status(400).json({ error: error.message });
        } else {
            res.status(400).json({ error: 'Error al insertar registro' });
        }
    }
}
