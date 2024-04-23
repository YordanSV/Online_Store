
async function getUser() {
    var emailInput = document.getElementById("email").value;
    var passwordInput = document.getElementById("password").value;
    fetch('/login', {
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
        // console.log(response)
        if (response.ok) {
            return response.json();
        } else {
            response.json().then(data => {
                document.getElementById("mensajeError").textContent = data.error;
                document.getElementById("mensajeError").style.display = 'block';
                console.error('Failed login:', data.error);
                // Handle failure
            });
        }
    })
    .then(user => {
        // console.log(user);
        if (user && user.UserID) {
            
            if(user.Puesto == 'Costumer'){
                window.location.href = `../../index.html?userID=${user.UserID}&position=${user.Puesto}&lastName=${user.LastName}$firstName=${user.FirstName}`;
            }else if(user.Puesto == 'Employee'){
                window.location.href = `../employee/index.html?userID=${user.UserID}&position=${user.Puesto}&lastName=${user.LastName}$firstName=${user.FirstName}`;
            }
        } else {
            throw new Error('Formato de respuesta inválido');
        }
    })
    .catch(error => {
        console.log('Error al obtener la información del usuario:', error);
    });
    
}


document.getElementById("submitButton").addEventListener('click', (event) => {
    event.preventDefault();
    getUser()

    //   renderFlightCards(products); //Muestra los vuelos al cargar
})

