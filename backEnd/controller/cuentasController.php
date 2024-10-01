<?php
require_once __DIR__ . '/../model/cuentaDAO.php';

$funcion = isset($_GET['function']) ? $_GET['function'] : '';

switch ($funcion) {
    case 'get':
        get();
        break;
    case 'aumentarSaldo':
        updateAumento();
        break;
    case 'reducirSaldo':
        updateReduccion();
        break;
}

function get()
{
    $ciCliente = $_POST['ci'];

    $query = (new cuentaDAO)->get($ciCliente);
    echo json_encode($query);
}

function updateAumento()
{
    $nroCuenta = $_POST['nroCuenta'];
    $saldo = $_POST['monto'];

    $query = (new cuentaDAO)->updateAumento($nroCuenta, $saldo);
    echo json_encode($query);
}

function updateReduccion()
{
    $nroCuenta = $_POST['nroCuenta'];
    $saldo = $_POST['monto'];

    $query = (new cuentaDAO)->updateReduccion($nroCuenta, $saldo);
    echo json_encode($query);
}