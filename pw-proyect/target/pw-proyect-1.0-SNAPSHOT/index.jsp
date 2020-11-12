<%-- 
    Document   : index
    Created on : 10 nov 2020, 23:29:53
    Author     : mike_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="assets/boostrap-4/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/Registro-style.css" />
    <link rel="Icon" href="favicons/log_in_icon.ico" />
    <title>| Registrarse</title>
  </head>

  <body>
    <nav class="barr-menu">
      <a href="Inicio.html">
        <div class="nav-logo">
          <h1>The NavBar</h1>
        </div>
      </a>
      <ul class="nav-list">
        <li><a href="Inicio.html">Home</a></li>
        <li><a href="#">News</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
      <div class="burger corss">
        <div class="line-1"></div>
        <div class="line-2"></div>
        <div class="line-3"></div>
      </div>
    </nav>

    <div class="login-box" id="login-box">
      <img class="avatar" src="UserIcon/letra-r.png" alt="avatar" id="avatar" />
      <h1>Registrarse</h1>
      <form id="register-box" enctype="multipart/form-data" name="register-box" action="./registrarseControlador" method="POST">
        <label for="Name">Ingrese su Nombre</label>
        <input
          type="text"
          name="Name"
          id="Name"
          placeholder="Nombre"
          required
        /><br />
        <label for="Last-Name">Ingrese sus Apellidos</label>
        <input
          type="text"
          name="Last-Name"
          id="last-name"
          placeholder="Apellidos"
          required
        /><br />
        <label for="Email">Ingrese su coreo</label>
        <input
          type="email"
          id="email"
          name="Email"
          placeholder="correo"
          required
        /><br />
        <label for="UserName">Nombre de usuario</label>
        <input
          type="text"
          name="userName"
          id="user-name"
          placeholder="Nombre de usuario"
          minlength="3"
          required
        />
        <label for="Password">Ingrese su Contraseña</label>
        <input
          type="password"
          id="password"
          name="Password"
          placeholder="Contraseña"
          required
        /><br />
        <label for="imagen">Eliga una foto de perfil</label>
        <input type="file" name="imagen" id="imagen">
        <input type="submit" value="Guardar" id="submitInfo" />
      </form>
      <a href="#">Iniciar sesion</a>
      <a href="#">Olvidaste la contraseña?</a>
    </div>

    <div class="images" id="images">
      <h2 style="color: white">Imagen de perfil</h2>
      <div class="image-picker" id="image-picker">
        <img id="image-1" src="UserIcon/Icons/png/001-scientist.png" />
        <button id="scientist" value="Choose" class="btn btn-danger">
          Choose
        </button>
      </div>
      <div class="image-picker" id="image-picker">
        <img id="image-2" src="UserIcon/Icons/png/002-werewolf.png" />
        <button id="werewolf" value="Choose" class="btn btn-danger">
          Choose
        </button>
      </div>
      <div class="image-picker" id="image-picker">
        <img id="image-3" src="UserIcon/Icons/png/003-pumpkin.png" />
        <button id="pumpik" value="Choose" class="btn btn-danger">
          Choose
        </button>
      </div>
      <label for="social-media">Red social precerida</label>
      <input
        type="text"
        name="social-media"
        id="social-media"
        placeholder="Red social preferida"
      /><br />
      <a href="Inicio.html" class="btn btn-danger">Done!</a>
     <!--  <input type="submit" value="Done!" id="finish" class="btn btn-danger" /> -->
    </div>

    <div id="login" class="login">
      <h3>
        Login site
      </h3>
      <label for="login-user">Nombre de usuario</label>
      <input type="text" name="login-user" id="login-user" placeholder="Usuario">
      <label for="login-password">Contraseña</label>
      <input type="password" name="login-password" id="login-password" placeholder="Constraseña"><br>
      <input type="submit" id="login-button" class="btn btn-danger" value="Login">
    </div>

    <script src="js/script.js"></script>
    <!-- <script src="js/register.js"></script> -->
    <script src="js/registerTest.js"></script>
  </body>

  <!-- <nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">
      <li class="page-item disabled">
        <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
      </li>
      <li class="page-item"><a class="page-link" href="#">1</a></li>
      <li class="page-item"><a class="page-link" href="#">2</a></li>
      <li class="page-item"><a class="page-link" href="#">3</a></li>
      <li class="page-item">
        <a class="page-link" href="#">Next</a>
      </li>
    </ul>
  </nav> -->
  <!-- Iconos diseñados por <a href="https://www.flaticon.es/autores/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.es/" title="Flaticon"> www.flaticon.es</a> -->
</html>
