import app from './app'
//import '../../backend/database/conexionBD'

app.listen(app.get('port'))

console.log("server on port:", app.get('port'))