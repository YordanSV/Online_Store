const params = new URLSearchParams(window.location.search);
const cartItems = JSON.parse(params.get('cart'));

console.log(cartItems+' aja')

function renderProducts(data) {
    const productContainer = document.getElementById('productContainer');

    data.forEach(product => {
        const card = document.createElement('div');
        card.className = 'card';
        card.innerHTML = `
            <div class="card-body">
                <h5 class="card-title">${product.name}</h5>
                <p class="card-text">Precio: $${product.price.toFixed(2)}</p>
                <p class="card-text">Cantidad: ${product.amount}</p>
                <button class="btn btn-primary">Agregar al carrito</button>
            </div>
        `;
        productContainer.appendChild(card);
    });
}

// Llamada a la función para mostrar los productos
renderProducts(cartItems);