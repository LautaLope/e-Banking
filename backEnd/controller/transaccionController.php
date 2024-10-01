<?php
require_once __DIR__ . '/../model/transaccionDAO.php';

$funcion = isset($_GET['function']) ? $_GET['function'] : '';

switch ($funcion){
    case 'add':
        add();
        break;
}

function add(){
    $fecha = $_POST['fecha'];
    $monto = $_POST['monto'];
    $concepto = $_POST['concepto'];
    $remitente = $_POST['remitente'];
    $destinatario = $_POST['destinatario'];

    $query = (new transaccionDAO)->add($fecha, $monto, $concepto, $remitente, $destinatario);
    echo json_encode($query);
}

