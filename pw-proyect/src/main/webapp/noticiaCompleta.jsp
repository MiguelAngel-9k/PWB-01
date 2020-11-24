<%-- 
    Document   : noticiaCompleta
    Created on : 23 nov 2020, 10:37:42
    Author     : mike_
--%>

<%@page import="com.mycompany.pw.proyect.Modelos.modeloUsuario"%>
<%@page import="com.mycompany.pw.proyect.Modelos.modeloNoticia"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    modeloNoticia noticia = (modeloNoticia) request.getAttribute("noticia");
    modeloUsuario usuario = (modeloUsuario) request.getAttribute("usuario");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
            integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
            crossorigin="anonymous"
            />
        <title>Document</title>
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
                        <!--Mostrar todas las noticias por revisar-->
                        <<form action="" method="POST">
                            <input type="text" name="getName" value="<%=usuario.getNombreUsuario()%>" style="border: none; background: none; display: none;" class="nav-link" readonly>
                            <input class="nav-link" style="border: none; background: none;" type="submit" value="Crear noticia" name="">                  
                        </form>
                    </li>
                    <%
                        }
                    %>
                </ul>
                <div class="form-inline my-2 my-lg-0">
                    <h2 style="margin-right: 40px"><%= usuario.getNombreUsuario()%></h2>
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
            <div class="row mt-5">
                <div class="col-lg-5">
                    <img
                        width="300px"
                        height="200px"
                        src="<%= noticia.getImagen(0)%>"
                        alt=""
                        />
                </div>
                <div class="col-lg-6">
                    <h1><%= noticia.getTitulo()%></h1>
                    <p style="font-weight: bold"><%= noticia.getDecripcionCorta()%></p>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-lg-8">
                    <p class="text-align-justify"><%= noticia.getContenido()%> </p>
                </div>
                <div class="col-lg-3">
                    <img
                        width="300px"
                        height="200px"
                        src="<%= noticia.getImagen(1)%>"
                        alt=""
                        />
                </div>
            </div>           
            <div class="row mt-lg-4">
                <div class="col-lg-3">
                    <img
                        width="300px"
                        height="200px"
                        src="<%= noticia.getImagen(2)%>"
                        alt=""
                        />
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <span class="float-right">            
                        <small>IdNoticia</small>
                        <small>Autor</small>
                    </span>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="card mt-lg-5">
                        <div class="card-header">
                            <h2>Titulo del comentario</h2>
                            <form action="" class="form-inline">
                                <input type="submit" value="Me gusta" class="btn btn-success">
                                <input type="submit" value="No me gustsa" class="btn btn-warning">
                            </form>
                        </div>
                        <div class="card-body">
                            <p>
                                Texto del comentario
                            </p>
                        </div>
                    </div>
                </div>
            </div>    
            <div class="row">
                <div class="col mt-lg-5">
                    <form action="" method="post">
                        <label for="tituloComentario">Titulo del comentario</label><br/>
                        <input type="text" name="tituloComentario" id="">
                        <input type="text" style="border: none; background: none;" name="nombreUsuario" value="<%= usuario.getNombreUsuario()%>"><br/>
                        <label for="contenidoComentario">Comentario</label><br/>
                        <textarea name="contenidoComentario" id="" cols="50" rows="3"></textarea><br/>            
                        <input type="submit" name="publicarComentario" value="Publicar" class="btn btn-danger">
                        <%
                            //si es moderador le debe aparecer la opcion de borrar comentario
                            if (usuario.getIdTipoUsuario() == 1) {
                        %>
                        <input type="submit" name="eliminarComentario" value="Eliminar" class="btn btn-warning mt-lg-3">
                        <%
                            }
                        %>
                    </form>
                </div>
            </div>           
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

