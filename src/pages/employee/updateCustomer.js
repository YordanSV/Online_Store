

document.getElementById("customerUpdatebtn").addEventListener("click", function (event) {
    event.preventDefault(); // Detener la acción predeterminada del formulario

    var selectElement = document.getElementById('valores');
    var selectedValue = selectElement.value;
    var userID = document.getElementById("updateUserID").value;
    var newValue = document.getElementById("updateNewValue").value;

    // event.preventDefault(); // Prevent form submission
    const updateCustomer = {
        column: selectedValue,
        userID: userID,
        newValue: newValue
    };


    fetch('/customer/update', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(updateCustomer)
    })
        .then(response => {
            if (response.ok) {
                return response.json(); // Convertir la respuesta a JSON
            }
            throw new Error('Network response was not ok.');
        })
        .then(data => {
            document.getElementById("customerMessageUpdate").textContent = data.message;;
            document.getElementById("customerMessageUpdate").style.display = 'inline';
            document.getElementById("customerMessageUpdate").style.color = 'green';
            console.log('Customer update successfully');
        })
        .catch(error => {
            document.getElementById("customerMessageUpdate").textContent = error.message;
            document.getElementById("customerMessageUpdate").style.display = 'inline';
            console.error('Failed update:', error);
        });
});
