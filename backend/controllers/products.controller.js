import { VarChar } from "mssql";
import { getConnection, sql } from "../database/conexionBD"

export const getProducts = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query('select * from products');

    console.log(result);
    //res.json(result.recordset);
}

export const createNewProduct = async (req, res) => {
    const {name} = req.body

    const pool = await getConnection()
    //await pool.request().input("name", sql.VarChar, "NewProduct")
    console.log(name)

}