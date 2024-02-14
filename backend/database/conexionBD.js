import sql from 'mssql'


const dbSettings = {
    user: 'yordan',
    password: '1234',
    server: 'localhost', // Puede ser 'localhost\\nombre_instancia' para SQL Server local
    database: 'Tienda_Online',
    options: {
        encrypt: true,
        trustServerCertificate: true
    }
};

async function getConnection(){
    try {
        const pool = await sql.connect(dbSettings);
        return pool
        // const result = await pool.request().query("select * from Products"); // Espera a que la consulta se resuelva
        // console.log(result.recordset); // Imprime el resultado de la consulta
    } catch (error) {
        console.error('Error al conectar o consultar la base de datos:', error);
    }
} 
getConnection();
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
