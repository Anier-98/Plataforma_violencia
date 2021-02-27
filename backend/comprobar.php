<?php
require ("ConexionBD.php");

$nombre = $_POST['user'];
$password = $_POST['pass'];

$filas = $db->query('SELECT * FROM area;');

foreach($filas as $fila){
    print_r($fila);
}

/*		require_once 'conexion.php';
  $conn = dbConnect();
 

$consulta = mysqli_query ($conn, "SELECT * FROM sesion WHERE user = '$nombre' AND pass = '$password'");  

if(!$consulta){ 
 echo "Usuario no existe " . $nombre . " " . $password. " o hubo un error " . mysqli_error($mysqli);
} 
else{ 
print "Bienvenido"; 
} 
*/


?>