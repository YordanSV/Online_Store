let products = [];


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


    const category = product.CategoryID == 1 ? "Electronics" :
        product.CategoryID == 2 ? "Clothing and Accessories" :
            product.CategoryID == 3 ? "Home and Garden" :
                product.CategoryID == 4 ? "Health and Beauty" :
                    "Sports and Outdoor Activitie";



    return `
    <div class="col-md-4 mb-4">
        <div class="card h-100">
            <img class="card-img-top" src="./img/${product.ProductName}.jpg" alt="Card image cap">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">${category}</h5>
                <h6 class="card-subtitle mb-2 text-muted">${product.ProductName}</h6>
                <p class="card-text">
                    <strong>Presentation:</strong> ${product.Presentation}<br>
                    <strong>Size:</strong> ${product.Size}<br>
                    <strong>Price per kilogram:</strong> ${product.Pr_weight}<br>
                    <strong>Price:</strong> $${product.Price}
                </p>
                <a href="#" class="mt-auto btn btn-primary">Book Now</a>
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