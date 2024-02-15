let products = [];


// Function to retrieve all products
async function getProducts() {
    try {
        const response = await axios.get('http://localhost:3000/products');
        const result = response.data; // Here you have the products data as a JavaScript object
        console.log(result)
        products = result;
        // Here you can perform any additional actions with the products, such as displaying them in the user interface
    } catch (error) {
        console.error('Error retrieving products:', error);
    }
}

document.addEventListener('DOMContentLoaded', () => {
  renderFlightCards(products); //Muestra los vuelos al cargar
})


function filterProducts(idCategory) {
    getProducts();
    console.log(products)
    const result = products.filter( filterCategory(idCategory) )
    console.log(result)
    renderFlightCards(result);
}

function filterCategory(idCategory) {
    return function(product){
        //const {origin} = searchFlight;
        //if(origin){
          return idCategory === product.CategoryID;
        //}
        //return product;
    }

}


function generateFlightCard(product) {
  return `
      <div class="col-md-4 mb-4">
          <div class="card" style="width: 18rem;">
              <img class="card-img-top" src="${product.productName}" alt="Card image cap">
              <div class="card-body">
                  <h5 class="card-title">${product.productName} - ${product.productName}</h5>
                  <p class="card-text">
                      <strong>Date:</strong> ${product.productName}<br>
                      <strong>Departure Time:</strong> ${product.productName}<br>
                      <strong>Arrival Time:</strong> ${product.productName}<br>
                      <strong>Price:</strong> $${product.productName}
                  </p>
                  <a href="#" class="btn btn-primary">Book Now</a>
              </div>
          </div>
      </div>
  `;
}

function renderFlightCards(flights) {
  cleanHTML();
  // Obtener el contenedor de filas de tarjetas de vuelo
  const flightCardRow = document.getElementById('flightCardRow');

  // Generar las tarjetas de vuelo y agregarlas al contenedor en filas
  products.forEach(product => {
    const flightCard = generateFlightCard(product);
    flightCardRow.innerHTML += flightCard;
  });
}

function cleanHTML() {
  const flightCardRow = document.getElementById('flightCardRow');
  while (flightCardRow.firstChild) {
    flightCardRow.removeChild(flightCardRow.firstChild);
  }
}