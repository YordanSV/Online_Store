function redirectLogin() {
    window.location.href="src/pages/login/index.html"
}

document.addEventListener('DOMContentLoaded', () => {
    var button = document.getElementById("redirectLoginButton")
    button.addEventListener('click', function(event) {
        redirectLogin();
        event.preventDefault(); // Evitar el comportamiento predeterminado del formulario
    });
});



function redirectRegister() {
    window.location.href="src/pages/register/index.html"
}
document.addEventListener('DOMContentLoaded', () => {
    var button = document.getElementById("redirectRegisterButton")
    button.addEventListener('click', function(event) {
        redirectRegister();
        event.preventDefault(); // Evitar el comportamiento predeterminado del formulario
    });
});