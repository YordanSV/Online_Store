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

<<<<<<< HEAD
export const customerUpdate = async (req, res) => {
    console.log("Paso controller")

    const { column, customerID, newValue } = req.body;

    const answer = column == "FirstName" ? "1" :
        column == "LastName" ? "2" :
            column == "BirthDate" ? "3" :
                column == "Province" ? "4" :
                    column == "District" ? "5" :
                        column == "Canton" ? "6" :
                            column == "NeighBorhood" ? "7" :
                                column == "Place_address" ? "8" :
                                    column == "Phone" ? "9" :
                                        column == "CardNumber" ? "10" :
                                            "11";

    try {
        const pool = await getConnection();
        await pool.request()
            .input("answer", sql.VarChar(50), answer)
            .input("customerID", sql.Int, customerID)
            .input("newValue", sql.VarChar(50), newValue)
            .input("column", sql.VarChar(50), column)
            .query("EXEC SP_Costumer_Update @Answer = @" + answer + ", @UserID = @" + customerID.toString() + ", @@" + column + " = @" + newValue);
        res.json({ column, customerID, newValue });
    } catch (error) {
        console.error("Error al actualizar customer:", error);
        res.status(500).json({ error: "Error interno del servidor al crear un nuevo producto." });
    }
}


export const registerCustomer = async (req, res) => {
    console.log("Paso registerCustomer")

    const { name, identification, surname, birthdate, email, password, province, canton, district } = req.body;



    try {
        const pool = await getConnection();
        await pool.request()
            .input("UserID", sql.Int, identification) // Assuming you have a userId available
            .input("FirstName", sql.VarChar(50), name)
            .input("LastName", sql.VarChar(50), surname)
            .input("BirthDate", sql.Date, new Date(birthdate))
            .input("Province", sql.VarChar(50), province)
            .input("District", sql.VarChar(50), district)
            .input("Canton", sql.VarChar(50), canton)
            .input("NeighBorhood", sql.VarChar(50), neighborhood)
            .input("Place_address", sql.VarChar(100), place_address)
            .input("Phone", sql.VarChar(15), phone)
            .input("CardNumber", sql.VarChar(16), cardNumber)
            .input("CardType", sql.VarChar(50), cardType)
            .query("INSERT INTO Costumers (UserID, FirstName, LastName, BirthDate, Province, District, Canton, NeighBorhood, Place_address, Phone, CardNumber, CardType) VALUES (@UserID, @FirstName, @LastName, @BirthDate, @Province, @District, @Canton, @NeighBorhood, @Place_address, @Phone, @CardNumber, @CardType)");
        res.status(200).json({ message: "Customer inserted successfully" });
    } catch (error) {
        console.error("Error al insertar customer:", error);
        res.status(500).json({ error: "Error interno del servidor al insertar un nuevo cliente." });
    }
}
=======


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
>>>>>>> b2b1316817677c9c8487cb30224c42461b5c123d
