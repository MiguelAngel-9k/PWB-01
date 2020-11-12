<%-- 
    Document   : profile
    Created on : 2 nov 2020, 12:17:32
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
    <link rel="stylesheet" href="css/user-profile.css" />
    <title>Perfil</title>
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
        <li><a id="user-name-nav" href="#">Anonimo </a></li>
        <li id="User-icon">
          <a href="#"
            ><img
	     id="user-icon"
              src="UserIcon/usuario.png"
              alt=""
              style="height: 80px; width: 80px; border-radius: 15px"
          /></a>
        </li>
      </ul>
      <div class="burger corss">
        <div class="line-1"></div>
        <div class="line-2"></div>
        <div class="line-3"></div>
      </div>
    </nav>

    <!--  <div class="container">
      <div class="row">
        <div class="col">
          <img src="UserIcon/usuario.png" alt="user image" />
        </div>
        <div class="col">
          <div class="container">
            <div class="row">
              <h2>Anonimo</h2>
            </div>
            <div class="row">
              <h3>Correo Electronico</h3>
            </div>
          </div>
        </div>
      </div>
    </div> -->

    <div id="user-image" class="user-image">
      <img id="main-user-icon" src="UserIcon/usuario.png" alt="user image" />
      <div class="user-container" id="user-container">
	      <form action="" method="POST" id="edit-name-password">
		      <h2 id="user-name">User Name <input type="text" placeholder="User name" id="edit-userName" style="display:none;"></h2>
		      <h2 id="name">Anonimo <input style="display:none;" type="text" placeholder="Name" id="edit-name"></h2>
        <h3 id="email">Correo</h3>
	<h3 id="password"style="display:none;">Password <input type="password" id="edit-password" placeholder="password"></h3>

        <form action="" method="POST" enctype="multipart/form-data">
          <button id="modify-info" class="btn btn-danger">Edit</button>
          <input
            type="file"
            name="in-file"
            id="in-file"
            class="btn btn-danger"
          />
        </form>
         <div class="navegation">
      <h4>Navegation</h4>
      <ul>
        <li><a href="#">Favorites</a></li>
        <li><a href="#">Comments</a></li>
      </ul>
    </div>
      </div>
      <div class="biography">
        <h5>Biography</h5>
        <p id="biography" max="255">
          Silent Hill 2 (サイレントヒル 2 Sairento Hiru Tsū?) es un videojuego
        japonés de horror de supervivencia y acción-aventura, desarrollado por
        Team Silent y publicado por Konami. Fue lanzado para PlayStation 2 en
        los Estados Unidos el 24 de septiembre de 2001, tres días después, en
        Japón, y el 23 de noviembre del mismo año, en Europa. Más tarde el juego
        fue editado para Microsoft Windows y Xbox. Cronológicamente representa
        la segunda parte de la serie Silent Hill, aunque la historia de Silent
        Hill 2 casi no está relacionada con el juego original. Cincuenta
        personas trabajaron en el desarrollo del videojuego durante dos años.
        Una versión en alta definición remasterizada de Silent Hill 2,
        desarrollada por Hijinx Studios, fue publicada el 20 de marzo de 2012 en
        PlayStation 3 y Xbox 360. Silent Hill 2 ocurre en un universo ficticio
        que se asemeja parcialmente al mundo real, donde todos los días se cruza
        con otro mundo alternativo, los cuales están llenos de monstruos.
        </p>
      <div class="separtor"></div>
      <input style="display: none;" type="text" name="in-bio" id="in-bio" placeholder="Biography">
      <button id="edit-bio" class="btn btn-danger">Edit Biogaraphy
      </button>      
      </div>
    </div>
  <!--  <div class="navegation">
      <h4>Navegation</h4>
      <ul>
        <li><a href="#">Favorites</a></li>
        <li><a href="#">Comments</a></li>
      </ul>
    </div>-->
   <!-- <div class="biography">
      <h5>Biogaraphy</h5>
      <p id="Bio-content">
        Silent Hill 2 (サイレントヒル 2 Sairento Hiru Tsū?) es un videojuego
        japonés de horror de supervivencia y acción-aventura, desarrollado por
        Team Silent y publicado por Konami. Fue lanzado para PlayStation 2 en
        los Estados Unidos el 24 de septiembre de 2001, tres días después, en
        Japón, y el 23 de noviembre del mismo año, en Europa. Más tarde el juego
        fue editado para Microsoft Windows y Xbox. Cronológicamente representa
        la segunda parte de la serie Silent Hill, aunque la historia de Silent
        Hill 2 casi no está relacionada con el juego original. Cincuenta
        personas trabajaron en el desarrollo del videojuego durante dos años.
        Una versión en alta definición remasterizada de Silent Hill 2,
        desarrollada por Hijinx Studios, fue publicada el 20 de marzo de 2012 en
        PlayStation 3 y Xbox 360. Silent Hill 2 ocurre en un universo ficticio
        que se asemeja parcialmente al mundo real, donde todos los días se cruza
        con otro mundo alternativo, los cuales están llenos de monstruos. El
        protagonista es James Sunderland, quien recibe una carta de su esposa
        Mary, que murió algún tiempo antes de los eventos del juego. En la
        misiva, ella le pide que vaya a la ciudad turística de Silent Hill. Al
        llegar a su destino, James se encuentra con una misteriosa mujer llamada
        María, una copia casi exacta de su esposa. Al final, se da cuenta de que
        parte de sus memorias fue un autoengaño. La jugabilidad consiste en
      </p>
    </div>-->

    <script src="js/profile.js"></script>
  </body>
</html>