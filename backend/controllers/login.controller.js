import { VarChar } from "mssql";
import { getConnection, sql } from "../database/conexionBD"

export const getUserDB = async (req, res) => {
    try {
        // const end = Date.now() + 2000;
        // while (Date.now() < end) continue;
        const { emailInput, passwordInput} = req.body;

        const pool = await getConnection();
        const request = pool.request();
        request.input('Email', sql.NVarChar(50), emailInput);
        request.input('Password', sql.NVarChar(50), passwordInput);

        const result = await request.execute('SP_Login');
        const userData = result.recordset[0];

        // Enviar una respuesta con los datos del usuario al cliente
        // res.status(200).json(userData);
        res.status(200).json(userData);


    } catch (error) {
        console.log(error)

        // const end = Date.now() + 20000;
        // while (Date.now() < end) continue;
        console.log('Error al hacer login en la DB:', error);
        if (error && error.message) {
            res.status(400).json({ error: error.message });
        } else {
            res.status(400).json({ error: 'hacer Login a la DB' });
        }
    }
}
