<?php
require_once __DIR__ . '/connection.php';
require_once __DIR__ . '/query.php';

class usuarioDAO
{
    function add($ci, $nombre, $apellido, $correo, $telefono, $direccion, $password)
    {
        $sql = "INSERT INTO `cliente`(`ciCliente`, `nombre`, `apellido`, `email`, `telefono`, `direccion`, `password`) VALUES ('$ci','$nombre','$apellido','$correo','$telefono','$direccion','$password')";
        $connection = connection();
        try {
            $connection->query($sql);
            $query = new query(true, "Usuario agregado con exito", null);
        } catch (Exception $e) {
            $query = new query(false, "No se pudo agregar el usuario (ci ya existe)", null);
        }
        return $query;
    }

    public function logIn($email, $password)
    {
        $connection = connection();
        $sql = "SELECT * FROM `cliente` WHERE  email = '$email'";
        $answer = $connection->query($sql);
        $fila = $answer->fetch_assoc();
        if ($fila != null) {
            if (password_verify($password, $fila['password'])) {
                $token = base64_encode(json_encode(['email' => $fila['email'], 'exp' => time() + 60]));
                $signature = hash_hmac('sha256', $token, $password);
                $ultimoToken = $token . '.' . $signature;
                $_SESSION['sesion'] = ["ci" => $fila['ciCliente'], "token" => $ultimoToken];
                $query = new query(true, "Sesion iniciada", $_SESSION['sesion']);
            } else {
                $query = new query(false, "Contraseña incorrecta", null);
                $_SESSION['sesion'] = null;
            }
        } else {
            $query = new query(false, "Email incorrecto", null);
            $_SESSION['sesion'] = null;
        }

        return $query;
    }

    public function getSession()
    {
        if (isset($_SESSION['sesion'])) {
            $query = new query(true, "sesion obtenida ", $_SESSION['sesion']);
        } else {
            $query = new query(false, "no se encuentra una  sesion", null);
        }
        return $query;
    }

    public function logOut()
    {
        $_SESSION['sesion'] = null;
        $query = new query(true, "sesion cerrada", null);
        return $query;
    }
}
