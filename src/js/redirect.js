function redirectLogin() {
    window.location.href="pages/login/index.html"
}

document.addEventListener('DOMContentLoaded', () => {
    var button = document.getElementById("redirectLoginButton")
    button.addEventListener('click', function(event) {
        redirectLogin();
        event.preventDefault(); // Evitar el comportamiento predeterminado del formulario
    });
});



function redirectRegister() {
    window.location.href="pages/register/index.html"
}
document.addEventListener('DOMContentLoaded', () => {
    var button = document.getElementById("redirectRegisterButton")
    button.addEventListener('click', function(event) {
        redirectRegister();
        event.preventDefault(); // Evitar el comportamiento predeterminado del formulario
    });
});


function redirectBuy() {
    window.location.href="pages/register/index.html"
}
document.addEventListener('DOMContentLoaded', () => {
    var button = document.getElementById("redirectBuyButton")
    button.addEventListener('click', function(event) {
        redirectBuy();
        event.preventDefault(); // Evitar el comportamiento predeterminado del formulario
    });
});

// function redirectLoginEmployee() {
//     window.location.href="../employee/index.html"
// }
// document.addEventListener('DOMContentLoaded', () => {
//     var button = document.getElementById("redirectEmployeeButton")
//     button.addEventListener('click', function(event) {
//         redirectLoginEmployee();
//         event.preventDefault(); // Evitar el comportamiento predeterminado del formulario
//     });
// });