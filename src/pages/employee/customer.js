
// Update Customer

document.getElementById("customerUpdatebtn").addEventListener("click", function () {



    var customerID = document.getElementById("customerID").value;
    var newValue = document.getElementById("newValue").value;
    // event.preventDefault(); // Prevent form submission
    updateCustomer = {
        column: column,
        customerID: customerID,
        newValue: newValue
    };

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
