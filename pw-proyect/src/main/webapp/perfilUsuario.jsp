<%-- Document : perfilUsuario Created on : 20 nov 2020, 14:37:16 Author : mike_
--%> <%@page import="com.mycompany.pw.proyect.Modelos.modeloUsuario"%> 
<%
    modeloUsuario usuario = (modeloUsuario) request.getAttribute("usuario");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
            integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
            crossorigin="anonymous"
            />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script>
            $(document).ready(function () {
                $("#editarUsuario").click(function () {
                    $("#editNombreUsuario").show();
                    $("#editNombre").show();
                    $("#editApellido").show();
                    $("#editContacto").show();
                    $("#guardar").show();
                    $("#editarUsuario").hide();
                });

                $("#editarBio").click(function () {
                    $("#editarBio").hide();
                    $("#guardarBio").show();
                    var bio = $("#textBiografia");
                    bio.show();
                });
            });
        </script>
    </head>
    <body class="bg-light">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" style="font-size: 34px" href="index.html"
               >The NavBar</a
            >
            <button
                class="navbar-toggler"
                type="button"
                data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
                >
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"
                           >Inicio <span class="sr-only">(current)</span></a
                        >
                    </li>
                    <!--             <li class="nav-item">
                          <a class="nav-link" href="#">Link</a>
                        </li> -->
                    <li class="nav-item dropdown">
                        <a
                            class="nav-link dropdown-toggle"
                            href="#"
                            id="navbarDropdown"
                            role="button"
                            data-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false"
                            >
                            Categorias
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                    <%
                        //String rol = "Creador de contenido";
                        if (usuario.getIdTipoUsuario() == 3) {
                    %>
                    <li>
                        <!--Crear noticias-->
                        <form action="./navNoticiaControlador" method="POST">
                            <input type="text" name="getName" value="<%=usuario.getNombreUsuario()%>" style="border: none; background: none; display: none;" class="nav-link" readonly>
                            <input class="nav-link" style="border: none; background: none;" type="submit" value="Crear noticia" name="">                  
                        </form>
                    </li>
                    <li>
                        <a class="nav-link" href="#">
                            Noticas marcadas<span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <!--Moderador-->
                    <% } else if (usuario.getIdTipoUsuario() == 1) {%>
                    <li>
                        <a class="nav-link" href="#">
                            Noticas marcadas<span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <!--Editor-->
                    <%} else if (usuario.getIdTipoUsuario() == 2) {%>
                    <li>
                        <form action="./navNoticiaControlador" method="POST">
                            <input type="text" name="getName" value="<%=usuario.getNombreUsuario()%>" style="border: none; background: none; display: none;" class="nav-link" readonly>
                            <input class="nav-link" style="border: none; background: none;" type="submit" value="Crear noticia" name="">                  
                        </form>
                    </li>
                    <li>
                        <a class="nav-link" href="#">
                            Noticas marcadas<span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="#">
                            Noticias pendientes<span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <% } else{%>
                    <%}%>
                </ul>
                <div class="form-inline my-2 my-lg-0">
                    <h2 style="margin-right: 40px" id="nombreUsuarioSM"><%=usuario.getNombreUsuario()%></h2>
                    <img
                        class="mr-5"
                        style="border-radius: 30px"
                        height="80px"
                        width="80px"
                        src="<%= usuario.getUrlImage()%>"
                        alt=""
                        id="imagenUsuarioSM"
                        />
                </div>
            </div>
        </nav>

        <div class="container">
            <div class="row mt-lg-5">
                <div class="col-lg-5">
                    <div class="row">
                        <img
                            height="150px"
                            width="150px"
                            style="border-radius: 50px"
                            src="<%= usuario.getUrlImage()%>"
                            alt="imagen del usuario"
                            id="iamgenUsuarioBG"
                            />
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <form action="" method="POST">
                                <div class="bg-danger" style="height: 5px; width: 100%"></div>
                                <p style="font-size: 30px" id="nombreUsuario">
                                    <%=usuario.getNombreUsuario()%>
                                </p>
                                <input
                                    style="display: none"
                                    type="text"
                                    name="editNombreUsuario"
                                    id="editNombreUsuario"
                                    placeholder="Nombre Usuario"
                                    />
                                <p style="font-size: 30px" id="nombre">
                                    <%=usuario.getNombre() + " " + usuario.getApellido()%>
                                </p>
                                <input
                                    style="display: none"
                                    type="text"
                                    name="editNombre"
                                    id="editNombre"
                                    placeholder="Nombre"
                                    />
                                <input
                                    style="display: none"
                                    type="text"
                                    name="editApellido"
                                    id="editApellido"
                                    placeholder="Apellido"
                                    />
                                <p style="font-size: 30px" id="correo">
                                    <%=usuario.getCorreo()%>
                                </p>
                                <p style="font-size: 30px" id="contacto">
                                    <%=usuario.getrSocial()%>
                                </p>
                                <input
                                    style="display: none"
                                    type="text"
                                    name="editContacto"
                                    id="editContacto"
                                    placeholder="Url de contacto"
                                    />
                                <label for="cambiarFoto">Cambiar foto</label>
                                <input
                                    type="file"
                                    class="btn btn-danger btn-block"
                                    id="cambiarFoto"
                                    name="cambiarFoto"
                                    />
                                <a id="editarUsuario" href="#" class="btn btn-danger mt-lg-3"
                                   >Editar</a
                                >
                                <button
                                    style="display: none"
                                    type="submit"
                                    class="btn btn-danger"
                                    id="guardar"
                                    >
                                    Guardar
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7">
                    <h1>Biografia</h1>
                    <form action="" method="POST">
                        <div class="bg-danger" style="height: 5px; width: 100%"></div>
                        <p id="biografia"><%=usuario.getBiografia()%></p>
                        <div class="bg-danger" style="height: 5px; width: 100%"></div>
                        <a id="editarBio" href="#" class="btn btn-danger mt-lg-3"
                           >Editar Biografia</a
                        >
                        <div style="display: none" class="form-group" id="textBiografia">
                            <label for="exampleFormControlTextarea1">Example textarea</label>
                            <textarea
                                class="form-control"
                                id="editBiografia"
                                rows="3"
                                ></textarea>
                        </div>
                        <button
                            type="submit"
                            class="btn btn-danger"
                            style="display: none"
                            id="guardarBio"
                            >
                            Guardar
                        </button>
                    </form>
                </div>
            </div>
            <!-- <div class="row mt-lg-5">
              <div class="col-lg-3">
                <img
                  height="150px"
                  width="150px"
                  style="border-radius: 50px"
                  src="https://simpleicon.com/wp-content/uploads/user1.png"
                  alt="imagen del usuario"
                  id="iamgenUsuarioBG"
                />
                <div class="row mt-lg-3">
                  <h3>Navegacion</h3>
                  <div class="bg-danger" style="height: 5px; width: 100%"></div>
                  <ul class="nav flex-column">
                      <li class="nav-item">
                          <a class="nav-link disabled" style="font-size: 18px;" href="#">Favoritos</a>
                      </li>
                  </ul>
                </div>
              </div>
              <div class="col-lg-4">
                  <p style="font-size: 30px;">Nombre de usuario</p>
                  <p style="font-size: 30px;">Nombre</p>
                  <p style="font-size: 30px;">Correo</p>
                  <p style="font-size: 30px;">Contacto</p>
              </div>
              <div class="col-lg-5">
                  <h4 style="font-size: 40px; font-weight: bold;">Biografia</h4>
                  <div class="bg-danger" style="height: 5px; width: 100%"></div>
                  <p id="Biografia">
                      Esta es la biografia temporal
                  </p>
              </div>
            </div> -->
        </div>

        <script
            src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
