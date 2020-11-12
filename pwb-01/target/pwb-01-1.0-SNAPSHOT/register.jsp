<%-- 
    Document   : register
    Created on : 28 oct 2020, 11:43:35
    Author     : mike_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="boostrap-4/css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/Registro-style.css" />
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
        <li><a href="#">${useName}</a></li>
        <li>
          <a href="user-profile.html"
            ><img
              src="UserIcon/usuario.png"
              alt="User icon"
              id="user-icon"
              style="width: 80px; height: 80px; border-radius: 15px"
          /></a>
        </li>
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
      <form id="register-box" name="register-box" action="User" method="POST">
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
          id="Email"
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
        <input type="submit" value="Save" name="save" id="submitInfo" />
      </form>
      <a href="#" class="justify-content-center">Iniciar sesion</a>
      <!--<a href="#">Olvidaste la contraseña?</a>-->
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
      <form method="POST" action="User">
        <label for="login-user">Nombre de usuario</label>
        <input type="text" name="login-user" id="login-user" placeholder="Usuario">
        <label for="login-password">Contraseña</label>
        <input type="password" name="login-password" id="login-password" placeholder="Constraseña"><br>
        <!--<a href="User" class="btn btn-danger" id="login-button">Login</a>-->
        <input type="submit" id="login-button" class="btn btn-danger" name="sign-in" value="Login">
      </form>
    </div>

    <!--<script src="js/script.js"></script>
    <!-- <script src="js/register.js"></script>
    <script src="js/registerTest.js"></script>-->
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
