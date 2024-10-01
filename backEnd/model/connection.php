<?php
function connection()
{
    try {
        mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
       
        $host = "localhost"; 
        $user = "root";   
        $pass = ""; 
        $bd = "ebanking"; 
        $port = 3306;       

        $mysqli = new mysqli($host, $user, $pass, $bd, $port);
       
        return $mysqli;
    } catch (Exception $e) {
        echo 'Captured Exception: ', $e->getMessage();
    }
}
?>