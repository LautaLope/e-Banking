<?php
require_once __DIR__ . "/../model/usuarioDAO.php";

$funcion = isset($_GET['function']) ? $_GET['function'] : '';

switch ($funcion) {
    case 'add':
        add();
        break;
    case 'logIn':
        logIn();
        break;
    case 'getSession':
        getSession();
        break;
    case 'logOut':
        logOut();
        break;
}

function add()
{
    $ci = $_POST["ci"];
    $nombre = $_POST["nombre"];
    $apellido = $_POST["apellido"];
    $correo = $_POST["email"];
    $telefono = $_POST["telefono"];
    $direccion = $_POST["direccion"];
    $password = $_POST["password"];
    $hashedPassword = password_hash($password, PASSWORD_BCRYPT);

    $query = (new usuarioDAO)->add($ci, $nombre, $apellido, $correo, $telefono, $direccion, $hashedPassword);
    echo json_encode($query);
}

function logIn(){
    $correo = $_POST["email"];
    $password = $_POST["password"];

    $query = (new usuarioDAO)->logIn($correo, $password);
    echo json_encode($query);
}

function getSession(){
    $query = (new usuarioDAO)->getSession();
    echo json_encode($query);
}

function logOut(){
    $query = (new usuarioDAO)->logOut();
    echo json_encode($query);
}

