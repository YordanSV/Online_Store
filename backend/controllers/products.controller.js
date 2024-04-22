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

export const createNewProduct = async (req, res) => {
    const { productName, presentation, size, weight, price, minInventoryQuantity, maxWarehouseQuantity, categoryID} = req.body;

    // Validación de datos de entrada
    if (!productName || !presentation || !size || !weight || !price || !minInventoryQuantity || !maxWarehouseQuantity || !categoryID) {
        return res.status(400).json({ error: "Faltan datos obligatorios para crear un nuevo producto." });
    }

    try {
        const pool = await getConnection();
        await pool.request()
            .input("ProductName", sql.VarChar(100), productName)
            .input("Presentation", sql.VarChar(50), presentation)
            .input("Size", sql.VarChar(20), size)
            .input("Pr_weight", sql.Decimal(10, 2), weight)
            .input("Price", sql.Decimal(10, 2), price)
            .input("MinInventoryQuantity", sql.Int, minInventoryQuantity)
            .input("MaxWareHouseQuantity", sql.Int, maxWarehouseQuantity)
            .input("CategoryID", sql.Int, categoryID)
            .query("INSERT INTO Products (ProductName, Presentation, Size, Pr_weight, Price, MinInventoryQuantity, MaxWareHouseQuantity, CategoryID) VALUES (@ProductName, @Presentation, @Size, @Pr_weight, @Price, @MinInventoryQuantity, @MaxWareHouseQuantity, @CategoryID)");

        res.json({ productName, presentation, size, weight, price, minInventoryQuantity, maxWarehouseQuantity, categoryID });
    } catch (error) {
        console.error("Error al crear un nuevo producto:", error);
        res.status(500).json({ error: "Error interno del servidor al crear un nuevo producto." });
    }
}
