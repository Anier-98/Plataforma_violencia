<?php

$db = new PDO('mysql:host=127.0.0.1;dbname=violencia','root','');
$db->setAttribute (PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
//$filas = $db->query('SELECT * FROM area;');
/*
foreach($filas as $fila){
    print_r($fila);
}
*/
?>