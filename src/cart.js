const cart = document.querySelector('#carrito')
const cartContainer = document.querySelector('#lista-carrito tbody')
const cleanCartBtn = document.querySelector('#vaciar-carrito')
const listProducts = document.querySelector('#productCardsContainer')
let cartItems = []


loadEventListener()

function loadEventListener() {
    listProducts.addEventListener('click', addProduct)

    cart.addEventListener('click', removeProduct)
    
    cleanCartBtn.addEventListener('click',() => {
        cartItems = []

        cleanCart()
    })

}


document.getElementById('redirectBuyButton').addEventListener('click', () => {
    console.log(cartItems)
    // window.location.href = `/pages/buy/index.html?cart=${JSON.stringify(cartItems)}`;
})


function removeProduct(e) {
    console.log(e.target.classList)
    if(e.target.classList.contains('borrar-curso')){
        const productID = e.target.getAttribute('data-id')
        cartItems = cartItems.filter(product => product.id !== productID)
        cartHTML()
    }
}

function addProduct(e) {
    e.preventDefault();

    if (e.target.classList.contains('agregar-carrito')) {
        const selectProduct = e.target.parentElement.parentElement
        readProductData(selectProduct)

    }
}

function readProductData(product) {
    console.log(product)

    const infoProduct = {
        img: "./img/"+product.querySelector('.card-subtitle').textContent+".jpg",
        name: product.querySelector('.card-subtitle').textContent,
        price: product.querySelector('.price').textContent,
        amount: 1,
        id: product.getAttribute('data-id')
    }
    //Revisa si ya existe
    const exist = cartItems.some( product => product.id === infoProduct.id)
    if(exist){
        const products = cartItems.map( product => {
            if( product.id === infoProduct.id ){
                product.amount++;
                return product
            }else{
                return product
            }
        })
        cartItems = [...products]
    }else{
        cartItems = [...cartItems, infoProduct]
    }
    // Agregar elemento al carrito
    console.log("Paso")
    console.log(infoProduct)
    cartHTML()
}


function cartHTML() {
    // limpiar html
    cleanCart()


    // agregar el html
    cartItems.forEach(product => {
        const row = document.createElement('tr')
        row.innerHTML = `
        <td><img src="${product.img}" width=100 class="producto-imagen"></td>
        <td id='name' >${product.name}</td>
        <td id='id' >${product.price}</td>
        <td id='amount'>${product.amount}</td>
        <td>
            <a href="#" class="borrar-curso" data-id="${product.id}">X</a>
        </td>

    `;
        cartContainer.appendChild(row)
    })
}

function cleanCart() {
    // forma lenta
    // cartContainer.innerHTML = ''

    while (cartContainer.firstChild) {
        cartContainer.removeChild(cartContainer.firstChild)
    }
}