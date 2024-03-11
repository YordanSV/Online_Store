var emailInput = document.getElementById("email");
var passwordInput = document.getElementById("password");


async function getUser() {
    // Realizar una solicitud GET para obtener la información del usuario
    fetch('/login',{
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            emailInput,
            passwordInput
        })
    })
    
        .then(response => {
            // Verificar si la respuesta es exitosa
            if (response.ok) {
                console.log('exitoso')
                // Convertir la respuesta a JSON
                return response.json();
            }
            console.log('error')
            // Si la respuesta no es exitosa, lanzar un error
            throw new Error('Error al obtener la información del usuario');
        })
        .then(usuario => {
            // Redirigir a otra página y pasar los datos del usuario como parámetros
            console.log('Paso')
            window.location.href = `../../index.html?nombre=${usuario.Email}&id=${usuario.Pass_word}`;
        })
        .catch(error => {
            // Manejar errores
            console.error('Error al obtener la información del usuario:', error);
        });

}


document.getElementById("submitButton").addEventListener('click', (event) => {
    // event.preventDefault();
    getUser()

    //   renderFlightCards(products); //Muestra los vuelos al cargar
})

