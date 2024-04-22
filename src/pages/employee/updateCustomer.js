

document.getElementById("customerUpdatebtn").addEventListener("click", function () {
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
    // Gather form data

    // Construct product object
    console.log(updateCustomer);

    // Send data to server
    fetch('/customer/update', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(updateCustomer)
    })
        .then(response => {
            if (response.ok) {
                document.getElementById("customerMessageUpdate").textContent = 'Se ha actualizado exitosamente';
                document.getElementById("customerMessageUpdate").style.display = 'inline';
                console.log('Customer update successfully');
                // Handle success
            } else {
                response.json().then(data => {
                    document.getElementById("customerMessageUpdate").textContent = data.error;
                    document.getElementById("customerMessageUpdate").style.display = 'inline';
                    console.error('Failed update:', data.error);
                    // Handle failure
                });
            }
        })
        .catch(error => {
            console.error('Error:', error);
            // Handle error
        });
});
