import { VarChar } from "mssql";
import { getConnection, sql } from "../database/conexionBD"

export const insertRegister = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query(`EXEC SP_Register_Clients 
    @UserID = '2',
    @ID_Desc = 'hola',
    @FirstName = ${req.body.firtName},
    @LastName = ${req.body.firtName},
    @BirthDate = ${firtName},
    @Province = ${firtName},
    @District = ${firtName},
    @Canton = ${firtName},
    @NeighBorhood = ${firtName},
    @Place_address = ${firtName},
    @Phone = ${firtName},
    @CardNumber = ${firtName},
    @CardType = 'Visa';
`);
    //return result;
    res.json(result.recordset);
}




// export const createNewProduct = async (req, res) => {
//     const {name} = req.body

//     const pool = await getConnection()
//     //await pool.request().input("name", sql.VarChar, "NewProduct")
//     console.log(name)

// }