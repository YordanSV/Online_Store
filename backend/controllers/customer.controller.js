import { VarChar } from "mssql";
import { getConnection, sql } from "../database/conexionBD"

export const getProducts = async (req, res) => {
    try {
        const pool = await getConnection();
        const result = await pool.request().query('select * from products');
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



// customerUpdate
export const customerUpdate = async (req, res) => {
    console.log("Paso controller")

    const { column, userID, newValue } = req.body;

    try {
        const pool = await getConnection();
        const request = pool.request()
        request.input("UserID", sql.Int, userID);
        request.input(column, sql.VarChar(50), newValue);
        const result = await request.execute('SP_Customer_Update');


    } catch (error) {
        console.error('Error al actualizar:', error);
        if (error && error.message) {
            // Aquí puedes usar el mensaje de error en tu respuesta al cliente
            res.status(400).json({ error: error.message });
        } else {
            res.status(400).json({ error: 'Error al actualizar' });
        }
    }
}

export const historial = async (req, res) => {
    const { identification } = req.body;
    try {
        const pool = await getConnection();
        const request = pool.request()
        request.input("Identification", sql.Int, identification);
        const result = await request.execute('ObtenerFacturas');
        console.log(result)
        res.json(result.recordset)

    } catch (error) {
        console.error('Error:', error);
        if (error && error.message) {
            // Aquí puedes usar el mensaje de error en tu respuesta al cliente
            res.status(400).json({ error: error.message });
        } else {
            res.status(400).json({ error: 'Error' });
        }
    }
    
}


export const selectProductInventory = async (req, res) => {
    try {
        const pool = await getConnection();
        const request = pool.request()
        const result = await request.execute('SP_SelectProductInventory');
        res.json(result.recordset)
    } catch (error) {
        console.error('Error:', error);
        if (error && error.message) {
            // Aquí puedes usar el mensaje de error en tu respuesta al cliente
            res.status(400).json({ error: error.message });
        } else {
            res.status(400).json({ error: 'Error' });
        }
    }
}

export const addInventory = async (req, res) => {
    const { productId,  quantity} = req.body;
    console.log(productId+" "+ quantity)
    try {
        const pool = await getConnection();
        const request = pool.request()
        request.input("ProductId", sql.Int, productId);
        request.input("Quantity", sql.Int, quantity);
        const result = await request.execute('addInventory');

    } catch (error) {
        console.error('Error:', error);
        if (error && error.message) {
            // Aquí puedes usar el mensaje de error en tu respuesta al cliente
            res.status(400).json({ error: error.message });
        } else {
            res.status(400).json({ error: 'Error' });
        }
    }
}