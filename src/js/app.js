import express from 'express'
import config from './config'
import productsRotes from '../../backend/routes/products.routes'
import loginRotes from '../../backend/routes/login.routes'
import cors from 'cors'; // Importa el middleware CORS
import path from 'path';
//const cors = require('cors');
//const path = require('path');
const session = require('express-session');
const app = express();


app.use(session({
    secret: 'holamundo', // Cambia esto por tu propia clave secreta
    resave: false,
    saveUninitialized: false
}));

app.use(express.static(path.join(__dirname, '../../src')));

//app.use(cors());
// Define la ruta de inicio y sirve el archivo HTML
app.get('/', function(req, res) {
});
//let port = 6000 en lugar de poner el numero aca lo haremos enuna variable de entorno
//settings
app.set('port', config.port); // si no existe un valor en el port usa el 300 por defecto

//middlewars
app.use(express.json());
app.use(express.urlencoded({extended: false}));


app.use(cors());

app.use(productsRotes);
app.use(loginRotes);

//app.use(express.static('public'));

export default app;

