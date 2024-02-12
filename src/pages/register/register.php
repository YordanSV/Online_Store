<?php
// Conexión a la base de datos
require_once('../pages/database_config.php');

$conn = sqlsrv_connect($serverName, $connectionOptions);

// Manejo de la solicitud del formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recibe los datos del formulario
    $name = $_POST["name"];
    $identification = $_POST["identification"];
    $surname = $_POST["surname"];
    $birthdate = $_POST["birthdate"];
    $email = $_POST["email"];
    $password = $_POST["password"];
    $province = $_POST["province"];
    $canton = $_POST["canton"];
    $district = $_POST["district"];

    // Query SQL para insertar los datos en la base de datos
    $sql = "INSERT INTO tu_tabla (name, identification, surname, birthdate, email, password, province, canton, district) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $params = array($name, $identification, $surname, $birthdate, $email, $password, $province, $canton, $district);
    $stmt = sqlsrv_query($conn, $sql, $params);
    if ($stmt === false) {
        echo "Error al ejecutar la consulta: " . print_r(sqlsrv_errors(), true);
    } else {
        echo "Registro exitoso!";
    }
}
?>
