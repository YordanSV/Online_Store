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
        console.log(userData)
        // Enviar una respuesta con los datos del usuario al cliente
        // res.status(200).json(userData);
        res.json(userData);


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

export const getCustomer = async (req, res) => {
    const { userID } = req.body;
    console.log(userID)
    try {
        const pool = await getConnection();
        await pool.request()
            .input("ID", int, userID)
            .query("select * from Costumers c where @ID = c.ID");

            if (result.recordset.length === 0) {
            res.status(404).json({ error: "No se encontraron productos" });
        } else {
            res.json(result.recordset);
        }
    } catch (error) {
        console.error("Error al obtener productos:", error);
        res.status(503).json({ error: "Error interno del servidor" });
    }
}