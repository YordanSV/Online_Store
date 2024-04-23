document.addEventListener("DOMContentLoaded", function () {
    console.log('Paso1')
    document.getElementById("productForm").addEventListener("submit", function (event) {
        event.preventDefault(); // Prevent form submission
        console.log('Paso2')


        // Gather form data
        const productName = document.getElementById("productName").value;
        const presentation = document.getElementById("presentation").value;
        const size = document.getElementById("size").value;
        const weight = document.getElementById("weight").value;
        const price = document.getElementById("price").value;
        const minInventoryQuantity = document.getElementById("minInventoryQuantity").value;
        const maxWarehouseQuantity = document.getElementById("maxWarehouseQuantity").value;
        const categoryID = document.getElementById("categoryID").value;

        // Construct product object
        const productData = {
            productName: productName,
            presentation: presentation,
            size: size,
            weight: weight,
            price: price,
            minInventoryQuantity: minInventoryQuantity,
            maxWarehouseQuantity: maxWarehouseQuantity,
            categoryID: categoryID
        };

        // Send data to server
        fetch('/products', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(productData)
        })
            .then(response => {
                if (response.ok) {
                    console.log('Product created successfully');
                    // Handle success
                } else {
                    console.error('Failed to create product');
                    // Handle failure
                }
            })
            .catch(error => {
                console.error('Error:', error);
                // Handle error
            });
    });
});
