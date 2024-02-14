import express from 'express'
import config from './config'
const app = express()

//let port = 6000 en lugar de poner el numero aca lo haremos enuna variable de entorno
//settings
app.set('port', config.port) // si no existe un valor en el port usa el 300 por defecto


export default app