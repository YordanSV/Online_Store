

document.getElementById("customerUpdatebtn").addEventListener("click", function () {
    var selectedValue = selectElement.value;
    var userID = document.getElementById("updateUserID").value;
    var newValue = document.getElementById("updateNewValue").value;
    // event.preventDefault(); // Prevent form submission
    updateCustomer = {
        column: selectedValue,
        userID: customerID,
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
                console.log('Customer update successfully');
                // Handle success
            } else {
                console.error('Failed to update customer');
                // Handle failure
            }
        })
        .catch(error => {
            console.error('Error:', error);
            // Handle error
        });

});
