
document.addEventListener("DOMContentLoaded", function () {

    fetch('/inventory', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        }
    })
        .then(response => {
            if (response.ok) {
                return response.json(); // Convertir la respuesta a JSON
            } else {
                throw new Error('Error al obtener el historial del usuario');
            }
        })
        .then(data => {
            console.log(data)

            data.forEach(product => {
                const div = document.createElement('div');
                div.className = 'row mb-3 align-items-center';
        
                const imageCol = document.createElement('div');
                imageCol.className = 'col-auto';
                const img = document.createElement('img');
                img.src = `../../img/${product.ProductName}.jpg`; // Suponiendo que las imágenes están en la carpeta /images/
                img.alt = product.ProductName;
                img.style.maxWidth = '100px'; // Establecer el ancho máximo de la imagen
                imageCol.appendChild(img);
                div.appendChild(imageCol);

                const productName = document.createElement('div');
                productName.className = 'col';
                productName.textContent = product.ProductName;
                div.appendChild(productName);
        
                const minMax = document.createElement('div');
                minMax.className = 'col';
                minMax.textContent = `Mínimo: ${product.MinInventoryQuantity}, Máximo: ${product.MaxWareHouseQuantity}`;
                div.appendChild(minMax);
        
                const currentQuantity = document.createElement('div');
                currentQuantity.className = 'col';
                currentQuantity.textContent = `Cantidad Actual: ${product.Quantity}`;
                div.appendChild(currentQuantity);
        
                const inputCol = document.createElement('div');
                inputCol.className = 'col';
                const input = document.createElement('input');
                input.type = 'number';
                input.className = 'form-control';
                input.min = 0;
                input.max = product.MaxWareHouseQuantity - product.Quantity;
                inputCol.appendChild(input);
                div.appendChild(inputCol);
        
                const buttonCol = document.createElement('div');
                buttonCol.className = 'col';
                const button = document.createElement('button');
                button.textContent = 'Agregar';
                button.className = 'btn btn-primary';
                button.addEventListener('click', () => {
                    const quantity = parseInt(input.value);
                    console.log(product.ProductId+" "+ quantity)
                    if (quantity >= 0 && quantity <= input.max) {
                        addInventory(product.ProductId, quantity)
                        location.reload();
                    } else {
                        alert('La cantidad ingresada no es válida');
                    }
                });
                buttonCol.appendChild(button);
                div.appendChild(buttonCol);
        

                document.getElementById('productContainer').appendChild(div);
            });
        })
        .catch(error => {
            console.error('Error:');
            // Handle error
        });
})


function addInventory(productId, quantity){
    fetch('/addInventory', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ productId: productId, quantity: quantity }) 
    })
        .then(response => {
            if (response.ok) {
                console.log('Se agrego con exito')
            } else {
                throw new Error('Error al obtener el historial del usuario');
            }
        })
        .catch(error => {
            console.error('Error:');
            // Handle error
        });
}