import express from 'express'
import config from './config'
import productsRotes from '../../backend/routes/products.routes'
//const cors = require('cors');
const path = require('path');


const app = express();
app.use(express.static(path.join(__dirname, '../../src')));

//app.use(cors());
// Define la ruta de inicio y sirve el archivo HTML
app.get('/', function(req, res) {
    res.sendFile(path.join(__dirname, '../../src', 'index.html'));
});

//let port = 6000 en lugar de poner el numero aca lo haremos enuna variable de entorno
//settings
app.set('port', config.port); // si no existe un valor en el port usa el 300 por defecto

//middlewars
app.use(express.json());
app.use(express.urlencoded({extended: false}));

app.use(productsRotes);
//app.use(express.static('public'));

export default app;

