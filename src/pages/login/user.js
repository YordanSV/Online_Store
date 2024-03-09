let selectUser = null
var emailInput = document.getElementById("email");
var passwordInput = document.getElementById("password");


async function getUser() {
    try {
        const response = await axios.get('http://localhost:3000/login');
        const users = response.data;

        users.forEach(user => {
            if (emailInput.value === user.Email && passwordInput.value === user.Pass_word) {
                selectUser = user;
                // console.log('El usuario existe:', user);
                // Almacenar el usuario en el LocalStorage
                localStorage.setItem('user', JSON.stringify(selectUser));
                // Redireccionar a otra página
                window.location.href = "../../index.html";
            }
        });

        if (!selectUser) {
            console.log('El usuario no existe o la clave es incorrecta');
        }
    } catch (error) {
        console.error('Error retrieving products:', error);
    }
}


document.getElementById("submitButton").addEventListener('click', (event) => {
    event.preventDefault();
    getUser().then(() => {
        console.log(selectUser)
    });
    //   renderFlightCards(products); //Muestra los vuelos al cargar
})
// app.post('/login', async (req, res) => {
//     const email = req.body.email;
//     const password = req.body.password;
    
//     // Luego puedes utilizar email y password para realizar la validación del inicio de sesión
//     // Por ejemplo, ejecutar la consulta SQL para verificar si el usuario y la contraseña son válidos
//     // Nota: Asegúrate de realizar la validación de forma segura para evitar la inyección de SQL
    
//     // Supongamos que aquí validamos el inicio de sesión y obtenemos el usuario de manera asíncrona
//     const pool = await getConnection();
//     const result = await pool.request().query(`select u.Email, u.Pass_word from Costumers c join Users u on c.UserID = u.UserID where u.email = '${email}' and u.Pass_word = '${password}'`);
//     console.log('Linea 20')
//     if (result.recordset.length > 0) {
//         // Si el inicio de sesión es exitoso, puedes guardar el usuario en la sesión como lo hiciste antes
//         const user = { id: 1, email: email };
//         req.session.user = user;
//         res.send('Inicio de sesión exitoso');
//     } else {
//         // Si la validación del inicio de sesión falla, puedes enviar una respuesta de error al cliente
//         res.status(401).send('Credenciales inválidas');
//     }
// });

// async function getUser() {
//     try {
//         console.log("linea 4")
//         const response = await axios.get('http://localhost:3000/login');
//         console.log("linea 6")
//         const result = response.data; // Here you have the products data as a JavaScript object

//         user = result;
//         console.log(result.recordset)
//         // Here you can perform any additional actions with the products, such as displaying them in the user interface
//     } catch (error) {
//         console.error('Error retrieving products:', error);
//     }
// }


