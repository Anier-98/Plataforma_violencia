<?php  
 session_start();  
include("conexion.php");
 try  
 {   
      $connect = new PDO("mysql:host=$hostBD; dbname=$dataBD", $userBD, $passBD);  
      $connect->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);  
      if(isset($_POST["login"]))  
      {  
           if(empty($_POST["usuario"]) || empty($_POST["password"]))  
           {  
                $message = '<label>Todos los campos son requeridos; </label>';  
           }  
           else  
           {  
                $query = "SELECT * FROM usuarios WHERE Nombre = :usuario AND contrasena = :password";  
                $statement = $connect->prepare($query);  
                $statement->execute(  
                     array(  
                          'usuario'     =>     $_POST["usuario"],  
                          'password'     =>     $_POST["password"]  
                     )  
                );  
                $count = $statement->rowCount();  
                if($count > 0)  
                {  
                     $_SESSION["usuario"] = $_POST["usuario"];  
                  
                     header("location:index.php");  
                }  
                else  
                {  
                     $message = '<label>Datos incorrectos</label>';  
                }  
           }  
      }  
 }  
 catch(PDOException $error)  
 {  
      $message = $error->getMessage();  
 }  
 ?>  
<!doctype html>
<html lang="es">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
<title>Inicio De Sesion</title>

<!-- Bootstrap core CSS -->
<link href="dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="assets/sticky-footer-navbar.css" rel="stylesheet">
</head>

<body style= "background-image:url(images/No-modificado.png);background-size:cover;background-repeat:none;">
<header> 

</header>

<!-- Begin page content -->
<div class="container">

<div class="container">
<h3 style= "text-align:center;">Universidad De Las Regiones Autonomas De La Costa Caribe Nicaraguense URACCAN </h3>
  <hr>
  <div class="row">
    <div class="col-12 col-md-6"> 
      <!-- Contenido -->
       
           <br />  
                <?php  
                if(isset($message))  
                {  
                     echo '<label class="text-danger">'.$message.'</label>';  
                }  
                ?>  
             
                <form method="post">  
                <h3>Formato de recepcion del caso</h3>

                <div style="display:inline-block;float:left;"> 
                <div class="form-group">
                <label for="Nombre Y Apellido" style= "font-size: 24px;">Nombre Y Apellido</label>
                <input type="text" name="nombres" class="form-control" placeholder="Nombres y apellidos" />  
                </div>
                <div class="form-group">
                <label for="Edad" style= "font-size: 24px;">Edad</label>
                <input type="text" name="Edad" class="form-control" placeholder="Ingrese su edad" />
               </div>
               <div class="form-group">
               <label for="Cedula" style= "font-size: 24px;">Cédula</label>
               <input type="text" name="Cedula" class="form-control" placeholder="Ingrese el numero de su cedula" />  
               </div>
               
                </div>


                <div style="display:inline-block;float:right;">
                <div class="form-group">
               <label for="Numero de celular" style= "font-size: 24px;">Numero de celular</label>
               <input type="text" name="Numero de celular" class="form-control" placeholder="Ingrese el numero de su celular" />  
			</div>
                <div class="form-group">
                    <label for="Étnia" style= "font-size: 24px;">Étnia</label>
                    <input type="text" name="Etnia" class="form-control" placeholder="A que étnia pertenece" />  
				</div>
                    <div class="form-group">
               <label for="Sexo" style= "font-size: 24px;">Sexo</label>
               <input type="text" name="Sexo" class="form-control" placeholder="Identidad Sexual" />  
				</div>
                </div>
  
                    <div class="form-group">

    <label for="Descripcion del caso" style= "font-size: 24px;">Descripcion del caso</label>
    <textarea style= "width: 100%; height: 130px"></textarea>  
			</div>
               <div class="form-group">
    <label for="Usuario" style= "font-size: 24px;">Usuario</label>
    <input type="text" name="usuario" class="form-control" placeholder="Ingrese usuario" />  
			</div>
  
               <div class="form-group">
    <label for="Contraseña" style= "font-size: 24px; color: black;"> Contraseña</label>
     <input type="password" name="password" class="form-control" placeholder="Ingrese Contraseña" />  
			</div>
                      
               <br />  
               <input type="submit" style="background-color: blue; font-size: 22px;" name="login" class="btn btn-info" value="Enviar Denuncia" />  
               </form>  
            
      <!-- Fin Contenido --> 
    </div>
   
  </div>
  <!-- Fin row --> 
  
</div>
</div>
<!-- Fin container -->
<script src="assets/jquery-1.12.4-jquery.min.js"></script> 
<script src="assets/jquery.validate.min.js"></script> 
<script src="assets/ValidarRegistro.js"></script> 
<!-- Bootstrap core JavaScript
    ================================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 

<script>window.jQuery || document.write('<script src="assets/js/vendor/jquery-slim.min.js"><\/script>')</script> 
<script src="assets/js/vendor/popper.min.js"></script> 
<script src="dist/js/bootstrap.min.js"></script>
</body>
</html>