<?php
require_once __DIR__ . '/connection.php';
require_once __DIR__ . '/query.php';

class cuentaDAO{
    function get($ciCliente){
        $sql = "SELECT * FROM cuenta WHERE ciCliente = '$ciCliente'";
        $connection = connection();
        $result = $connection->query($sql);
        $cuentas = $result->fetch_all(MYSQLI_ASSOC);
        $query = new query(true, "Cuentas obtenidas", $cuentas);
        return $query;
    }

    function updateAumento($nroCuenta, $monto){
        $sql = "UPDATE `cuenta` SET `saldo`= saldo + '$monto' WHERE `nroCuenta`='$nroCuenta'";
        $connection = connection();
        try {
            $connection->query($sql);
            $query = new query(true, "Saldo modificado", null);
        } catch (Exception $e) {
            $query = new query(false, "No se pudo modificar el saldo (ci incorrecta)", null);
        }
        return $query;
    }

    function updateReduccion($nroCuenta, $monto){
        $sql = "UPDATE `cuenta` SET `saldo`= saldo - '$monto' WHERE `nroCuenta`='$nroCuenta'";
        $connection = connection();
        try {
            $connection->query($sql);
            $query = new query(true, "Saldo modificado", null);
        } catch (Exception $e) {
            $query = new query(false, "No se pudo modificar el saldo (ci incorrecta)", null);
        }
        return $query;
    }
}