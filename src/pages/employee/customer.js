
// Update Customer


var column = ''

var updateCustomer = {
    column: '',
    customerID: '',
    newValue: ''
};
function customerUpdate(event) {
    event.preventDefault();
    column = event.target.textContent;
    return
}


// document.getElementById("customerUpdatebtn").addEventListener("click", function () {
//     if(column == ''){
//         return
//     }
//     var customerID = document.getElementById("updateUserID").value;
//     var newValue = document.getElementById("updateNewValue").value;
//     console.log(customerID)
//     console.log(newValue)

//     // event.preventDefault(); // Prevent form submission
//     updateCustomer = {
//         column: column,
//         customerID: customerID,
//         newValue: newValue
//     };
//     // Gather form data

//     // Construct product object
//     console.log(updateCustomer);

//     // Send data to server
//     fetch('/customer/update', {
//         method: 'POST',
//         headers: {
//             'Content-Type': 'application/json'
//         },
//         body: JSON.stringify(updateCustomer)
//     })
//         .then(response => {
//             if (response.ok) {
//                 console.log('Customer update successfully');
//                 // Handle success
//             } else {
//                 console.error('Failed to update customer');
//                 // Handle failure
//             }
//         })
//         .catch(error => {
//             console.error('Error:', error);
//             // Handle error
//         });

// });
