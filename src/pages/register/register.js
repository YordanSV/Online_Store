// import registerController from '../../../backend/controllers/register.controller'

const firtName = document.getElementById("name").value;
const identification = document.getElementById("identification").value;
const surname = document.getElementById("surname").value;
const birthdate = document.getElementById("birthdate").value;
const email = document.getElementById("email").value;
const password = document.getElementById("password").value;
const province = document.getElementById("province").value;
const canton = document.getElementById("canton").value;
const district = document.getElementById("district").value;


const cantonsByProvince = {
    "San José": ["San José", "Escazú", "Desamparados", "Alajuelita", "Montes de Oca"],
    "Alajuela": ["Alajuela", "San Ramón", "Grecia", "Atenas", "Palmares"],
    "Heredia": ["Heredia", "San Pablo", "Barva", "Santa Bárbara", "Santo Domingo"],
    "Cartago": ["Cartago", "Paraíso", "La Unión", "Alvarado", "Oreamuno"],
    "Guanacaste": ["Liberia", "Nicoya", "Santa Cruz", "Bagaces", "Carrillo"],
};

const districtsByCanton = {
    "San José": {
        "San José": ["Carmen", "Merced", "Hospital", "Catedral", "Zapote"],
        "Escazú": ["Escazú Centro", "San Antonio", "San Rafael", "San Miguel", "San Antonio"],
        "Desamparados": ["Desamparados Centro", "San Miguel", "San Juan", "San Rafael", "Patiño"],
        "Alajuelita": ["Alajuelita Centro", "San Josecito", "San Antonio", "Concepción", "San Felipe"],
        "Montes de Oca": ["San Pedro", "Sabanilla", "Mercedes", "San Rafael", "San Antonio"]
    },
    "Alajuela": {
        "Alajuela": ["Alajuela Centro", "San Rafael", "San Antonio", "Garita", "San Isidro"],
        "San Ramón": ["San Ramón Centro", "San Rafael", "Piedades", "Alfaro", "Ángeles"],
        "Grecia": ["Grecia Centro", "San Isidro", "San Roque", "Tacares", "Rincón"],
        "Atenas": ["Atenas Centro", "Jesús", "Mercedes", "San Isidro", "Concepción"],
        "Palmares": ["Palmares Centro", "Zaragoza", "Buenos Aires", "Candelaria", "Esquipulas"]
    },
    "Heredia": {
        "Heredia": ["Heredia Centro", "Mercedes", "Ulloa", "Varablanca", "San Francisco"],
        "San Pablo": ["San Pablo Centro", "Rincón", "Puente Salas", "Santa Rosa", "San Rafael"],
        "Barva": ["Barva Centro", "San Pedro", "San Pablo", "San Roque", "Santa Lucía"],
        "Santa Bárbara": ["Santa Bárbara Centro", "San Pedro", "San Juan", "Jesús", "Santo Domingo"],
        "Santo Domingo": ["Santo Domingo Centro", "San Vicente", "San Miguel", "Paracito", "Santo Tomás"]
    },
    "Cartago": {
        "Cartago": ["Cartago Centro", "Oriental", "Occidental", "Carmen", "San Nicolás"],
        "Paraíso": ["Paraíso Centro", "Santiago", "Orosi", "Cachí", "Llanos de Santa Lucía"],
        "La Unión": ["Tres Ríos", "San Diego", "San Juan", "San Rafael", "Concepción"],
        "Alvarado": ["Pacayas", "Cervantes", "Capellades", "San Rafael", "San Isidro"],
        "Oreamuno": ["San Rafael", "Cot", "Potrero Cerrado", "Santa Rosa", "Llano Grande"]
    },
    "Guanacaste": {
        "Liberia": ["Liberia Centro", "Cañas Dulces", "Mayorga", "Nacascolo", "Curubandé"],
        "Nicoya": ["Nicoya Centro", "Mansión", "San Antonio", "Quebrada Honda", "Sámara"],
        "Santa Cruz": ["Santa Cruz Centro", "Bolsón", "Veintisiete de Abril", "Tempate", "Cartagena"],
        "Bagaces": ["Bagaces Centro", "Filo de Bagaces", "La Fortuna", "Mogote", "Río Naranjo"],
        "Carrillo": ["Filadelfia", "Palmira", "Sardinal", "Belén", "Santa Rosa"]
    },
};


function updateCantons() {
    const selectedProvince = document.getElementById("province").value;
    const cantons = cantonsByProvince[selectedProvince];
    const cantonDropdown = document.getElementById("canton");
    cantonDropdown.innerHTML = "";
    cantons.forEach(canton => {
        const option = document.createElement("option");
        option.text = canton;
        cantonDropdown.add(option);
    });

    updateDistricts();
}

function updateDistricts() {
    const selectedProvince = document.getElementById("province").value;
    const selectedCanton = document.getElementById("canton").value;
    const districts = districtsByCanton[selectedProvince][selectedCanton];
    const districtDropdown = document.getElementById("district");
    districtDropdown.innerHTML = "";
    districts.forEach(district => {
        const option = document.createElement("option");
        option.text = district;
        districtDropdown.add(option);
    });
}

updateCantons();

// Handle form submit event
document.getElementById("registerButton").addEventListener("click", function (event) {
    event.preventDefault(); // Prevent the form from being submitted by default
    // Here you can access the values of form fields and do whatever you need, for example:
    const name = document.getElementById("name").value;
    const identification = document.getElementById("identification").value;
    const surname = document.getElementById("surname").value;
    const birthdate = document.getElementById("birthdate").value;
    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;
    const position = document.getElementById("position").value;
    const province = document.getElementById("province").value;
    const canton = document.getElementById("canton").value;
    const district = document.getElementById("district").value;
    const neighborhood = document.getElementById("neighborhood").value;
    const address = document.getElementById("address").value;
    const phone = document.getElementById("phone").value;
    const cardNumber = document.getElementById("cardNumber").value;
    const cardType = document.getElementById("cardType").value;
    const idDesc = document.getElementById("idDesc").value;



    // Send data to server
    fetch('/register/customer', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        }
        ,
        body: JSON.stringify({
            name,
            identification,
            surname,
            birthdate,
            email,
            password,
            province,
            canton,
            district,
            position,
            neighborhood,
            address,
            phone,
            cardNumber,
            cardType,
            idDesc
        })
    })
        .then(response => {
            if (response.ok) {
                document.getElementById("mensajeError").textContent = 'Se ha registrado exitosamente';
                document.getElementById("mensajeError").style.display = 'inline';
                console.log('Se ha registrado exitosamente');
                // Handle success
            } else {
                // If response status is not okay, parse the error message from the response body
                response.json().then(data => {
                    document.getElementById("mensajeError").textContent = data.error;
                    document.getElementById("mensajeError").style.display = 'block';
                    console.error('Failed registerasd:', data.error);
                    // Handle failure
                });
            }
        })
        .catch(error => {
            console.error('Error:', error);
            // Handle error
        });

    // if (errorOccurred != '') {

    // }
});


// app.js
// Obtener los valores de los campos de entrada

// Crear un objeto JSON con los valores
document.addEventListener("DOMContentLoaded", function () {
    // Obtener una referencia al botón "Register"
    const registerButton = document.getElementById("registerButton");

});



// Agregar evento onclick al botón
const obtenerProductosBtn = document.getElementById('registerButton');
//obtenerProductosBtn.onclick = getProducts;
