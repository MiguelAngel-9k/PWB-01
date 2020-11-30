<%-- 
    Document   : noticiaCompleta
    Created on : 23 nov 2020, 10:37:42
    Author     : mike_
--%>

<%@page import="com.mycompany.pw.proyect.Modelos.modeloComentario"%>
<%@page import="com.mycompany.pw.proyect.Modelos.modeloUsuario"%>
<%@page import="com.mycompany.pw.proyect.Modelos.modeloNoticia"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    modeloNoticia noticia = (modeloNoticia) request.getAttribute("noticia");
    modeloUsuario usuario = (modeloUsuario) request.getAttribute("usuario");    
    List <modeloComentario> comentarios = (List<modeloComentario>) request.getAttribute("comentarios");
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
            <!--<div class="row">
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
            </div>    -->
            <div class="row">
                <div class="col mt-lg-5">
                    <!-- <form action="" method="post">
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
                </form>-->
                    <%
                        for(modeloComentario comentario : comentarios){
                    %>
                    <div class="media">
                        <img style="max-height: 64px; max-height: 64px" src="<%= comentario.getImgUsuario() %>" class="mr-3" alt="Foto de perfil del usuario">
                        <div class="media-body">
                            <h5 class="mt-0"><%= comentario.getUsuario() %></h5>
                            <%= comentario.getContenido() %>
                            <div class="media mt-3">
                                <a class="mr-3" href="#">
                                    <img style="max-height: 64px; max-height: 64px" src="data:image/png;base64,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" class="mr-3" alt="...">
                                </a>
                                <div class="media-body">
                                    <h5 class="mt-0">Media heading</h5>
                                    cuerpo del media body para el comentario
                                </div>                                
                            </div>
                        </div>
                    </div>
                    <%
                        };
                    %>
                </div>
            </div>     
            <div class="row mt-lg-4">
                <div class="col">
                    <div class="card">
                        <div class="card-header text-align-center bg-cian">
                            <h5>Agregar comentario</h5>
                        </div>
                        <div class="card-body">
                            <form action="./comentarControlador" method="POST" name="agregarComentario">
                                <input type="hidden" name="usuario" value="<%= usuario.getNombreUsuario() %>">
                                <input type="hidden" name="noticia" value="<%= noticia.getNoticia()%>">                                
                                <textarea name="comentario" class="col"></textarea>
                                <input type="submit" name="Comentar" value="Enviar" class="btn btn-primary">
                            </form>
                        </div>
                    </div>
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

