<?php
require_once __DIR__ . '/connection.php';
require_once __DIR__ . '/query.php';

class transaccionDAO{
    function add($fecha, $monto, $concepto, $nroRemitente, $nroDestinatario){
        $sql = "INSERT INTO `transaccion`(`fecha`, `monto`, `concepto`, `nroCuentaRemitente`, `nroCuentaDestinatario`) VALUES ('$fecha','$monto','$concepto','$nroRemitente','$nroDestinatario')";
        $connection = connection();
        try{
            $connection->query($sql);
            $query = new query(true, "Transacción realizada con éxito", null);
        } catch (Exception $e){
            $query = new query(false, "Error al realizar la transaccion", null);
        }

        return $query;
    }
}

