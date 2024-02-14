import sql from 'mssql'
import { dbSettings } from './database_config';



export async function getConnection(){
    try {
        const pool = await sql.connect(dbSettings);
        //console.log(pool)
        return pool
        // const result = await pool.request().query("select * from Products"); // Espera a que la consulta se resuelva
        // console.log(result.recordset); // Imprime el resultado de la consulta
    } catch (error) {
        console.error('Error al conectar o consultar la base de datos:', error);
    }
} 
export {sql}
// async function ejecutarConsulta(consulta) {
//     try {
//         await sql.connect(config);
//         const resultado = await sql.query(consulta);
//         return resultado.recordset;
//     } catch (error) {
//         console.error('Error al ejecutar consulta en la base de datos:', error);
//         throw error;
//     } finally {
//         sql.close();
//     }
// }

// module.exports = { ejecutarConsulta };
