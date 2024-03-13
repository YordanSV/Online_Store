let products = [];
function getURLParams() {
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    console.log(urlParams)
    return Object.fromEntries(urlParams.entries());
}


// Verificar si el usuario existe
document.addEventListener("DOMContentLoaded", function() {
        const params = getURLParams();
        console.log(params)
        document.getElementById('nameUser').textContent = 'Bienvenido '+params.firstName+' '+params.lastName;
})


// Function to retrieve all products
async function getCustomer(userID) {
    var customer = {}
    fetch('/getCustomer', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        }
        ,
        body: JSON.stringify({
            userID
        })
    })
        .then(response => {
            if (response.ok) {
                console.log('exito')
                response.json().then(data => {
                    console.log(data)

                    customer=data
                });
            } else {
                console.error('Error:', error);
            }
        })
        .catch(error => {
            console.error('Error:');
            // Handle error
        });
    return customer
}

// Function to retrieve all products
async function getProducts() {
    try {
        const response = await axios.get('http://localhost:3000/products');
        const result = response.data; // Here you have the products data as a JavaScript object
        products = result;
        // Here you can perform any additional actions with the products, such as displaying them in the user interface
    } catch (error) {
        console.error('Error retrieving products:', error);
    }
}

document.addEventListener('DOMContentLoaded', () => {
    getProducts().then(() => {
        renderFlightCards(products);
    });
    //   renderFlightCards(products); //Muestra los vuelos al cargar
})


function filterProducts(idCategory) {
    if (idCategory == 0) { // si marca mostrar todo
        getProducts().then(() => {
            renderFlightCards(products);
        });
    }
    const result = products.filter(filterCategory(idCategory));
    renderFlightCards(result);
}

function filterCategory(idCategory) {
    console.log(idCategory)
    return function (product) {
        return product.CategoryID === idCategory;
    }

}


function generateFlightCard(product) {


    const category = product.CategoryID == 1 ? "Electronica" :
        product.CategoryID == 2 ? "Ropa y Accesorios" :
            product.CategoryID == 3 ? "Hogar y Jardín" :
                product.CategoryID == 4 ? "Salud y Belleza" :
                    "Deportes y Actividades al Aire Libre";



    return `
    <div class="col-md-4 mb-4">
        <div class="card h-100" data-id=${product.CategoryID}>
            <img class="card-img-top" src="./img/${product.ProductName}.jpg" alt="Card image cap">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">${category}</h5>
                <h6 class="card-subtitle mb-2 text-muted">${product.ProductName}</h6>
                <p class="card-text">
                    <strong>Presentación:</strong> ${product.Presentation}<br>
                    <strong>Tamaño:</strong> ${product.Size}<br>
                    <strong class='price'>Precio por kilogramo:</strong> ${product.Pr_weight}<br>
                    <strong>Precio:</strong> $${product.Price}
                </p>
                <a href="#" class="mt-auto btn btn-primary agregar-carrito">Agregar al carrito</a>
            </div>
        </div>
    </div>

  `;
}

function renderFlightCards(products) {
    console.log(products)
    cleanHTML();
    // Obtener el contenedor de filas de tarjetas de vuelo
    const productCardRow = document.getElementById('productCardRow');

    // Generar las tarjetas de vuelo y agregarlas al contenedor en filas
    products.forEach(product => {
        const productCard = generateFlightCard(product);
        productCardRow.innerHTML += productCard;
    });
}

function cleanHTML() {
    const productCardRow = document.getElementById('productCardRow');
    while (productCardRow.firstChild) {
        productCardRow.removeChild(productCardRow.firstChild);
    }
}

