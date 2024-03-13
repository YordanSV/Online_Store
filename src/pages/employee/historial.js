document.getElementById("historialbtn").addEventListener("click", function () {
    var userID = document.getElementById("historialIdentification").value;

    // Send data to server
    fetch('/customer/historial', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ identification: userID }) // Se envía el ID de usuario al servidor
    })
        .then(response => {
            if (response.ok) {
                return response.json(); // Convertir la respuesta a JSON
            } else {
                throw new Error('Error al obtener el historial del usuario');
            }
        })
        .then(data => {
            // Procesar los datos recibidos
            console.log(data); // Muestra los datos en la consola para verificar la estructura

            // Aquí puedes acceder a los datos de los productos y filtrarlos por el mismo ID de factura
            // Ejemplo:
            const productosMismoIDFactura = {};
            data.forEach(item => {
                const facturaID = item['ID de Factura'];
                if (!productosMismoIDFactura[facturaID]) {
                    // Inicializar el objeto de la factura si es la primera vez que se encuentra
                    productosMismoIDFactura[facturaID] = {
                        TotalBruto: item['Total Bruto'],
                        TotalEnvio: item['Total Envío'],
                        Total: item['Total a Pagar'],
                        Fecha: item['Fecha de compra'],
                        Impuestos: item['Total Impuesto'],
                        Productos: []
                    };
                }
                // Agregar producto a la factura
                productosMismoIDFactura[facturaID].Productos.push({
                    'Nombre del Producto': item['Nombre del Producto'],
                    'Precio Unitario': item['Precio Unitario'],
                    'Cantidad': item['Cantidad'],
                    'Total por Producto': item['Total por Producto']
                });
            });


            console.log(productosMismoIDFactura); // Muestra los productos con el mismo ID de factura agrupados
            mostrarFacturas(productosMismoIDFactura)
            // Aquí puedes trabajar con los datos filtrados según tus necesidades
        })
        .catch(error => {
            console.error('Error:', error);
            // Handle error
        });
});

function generarFacturaHTML(factura) {
    return `
        <div class="card mt-3">
        <div class="card-header">
            Factura ID: ${factura.facturaID}
        </div>
        <div class="card-body">
            <p>Fecha de compra: ${factura.Fecha}</p>
            <p>Total Bruto: ${factura.TotalBruto}</p>
            <p>Total Envío: ${factura.TotalEnvio}</p>
            <p>Total a Pagar: ${factura.Total}</p>
            <p>Impuestos: ${factura.Impuestos}</p>
            <h5>Productos:</h5>
            <ul class="list-group">
                ${factura.Productos.map(producto => `
                    <li class="list-group-item">
                        ${producto['Nombre del Producto']} - Cantidad: ${producto.Cantidad} - Precio Unitario: ${producto['Precio Unitario']} - Total por Producto: ${producto['Total por Producto']}
                    </li>
                `).join('')}
            </ul>
        </div>
    </div>
    `;
}

function mostrarFacturas(productosMismoIDFactura) {
    const facturasContainer = document.getElementById('facturasContainer');

    // Iterar sobre cada factura y generar su HTML
    Object.values(productosMismoIDFactura).forEach(factura => {
        const facturaHTML = generarFacturaHTML(factura);
        facturasContainer.innerHTML += facturaHTML;
    });
}
