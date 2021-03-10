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
                $query = "SELECT * FROM usuarios WHERE N_carnet = :usuario AND contrasena = :password";  
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
                <label for="" style= "font-size: 24px;">Nombres y apellidos</label>
                <input type="text" name="nombres" class="form-control" style="width:100%;" placeholder="Nombres y apellidos" />  
                </div>
                <div class="form-group">
                <label for="" style= "font-size: 24px;">Numero de Cédula</label>
                <input type="text" name="cedula" class="form-control" placeholder="Cédula" />
               </div>
               <div class="form-group">
               <label for="Cedula" style= "font-size: 24px;">Número de teléfono</label>
               <input type="number" name="Celular" class="form-control" placeholder="Teléfono" />  
               </div>
               
                </div>


                <div style="display:inline-block;float:right;">
                <div class="form-group">
               <label for="" style= "font-size: 24px;">Edad</label>
               <input type="number" name="edad" class="form-control" placeholder="Edad" />  
			</div>
                <div class="form-group">
                    <label for="Étnia" style= "font-size: 24px;">Étnia</label>
                    <select name="etnia" id="etn" class="form-control">
                     <option value="Mayangna">Mayangna</option>
                     <option value="Miskito">Miskito</option>
                     <option value="Mestizo">Mestizo</option>
                     <option value="Creoles">Creoles</option>
                     <option value="O">Otro</option>
                </select>  
				</div>
                    <div class="form-group">
               <label for="Sexo" style= "font-size: 24px;">Sexo</label>

                <select name="sexo" id="set" class="form-control">
                     <option value="M">Masculino</option>
                     <option value="F">Femenino</option>
                     <option value="O">Otro</option>
                </select>


              <!-- <input type="text" name="Sexo" class="form-control" placeholder="Sexo" />  -->
				</div>
                </div>
  
                    <div class="form-group">
                         <label for="" id="lbf" ></label>
    <label for="Descripcion del caso"  style= "font-size: 24px;">Descripcion del caso</label>
    <textarea name="caso" style= "width: 100%; height: 130px" placeholder="Exprese su caso"></textarea>  
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
<script src="js/dt.js">

</script>
</body>
</html>