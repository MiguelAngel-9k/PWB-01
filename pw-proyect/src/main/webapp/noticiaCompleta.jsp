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
    List<modeloComentario> comentarios = (List<modeloComentario>) request.getAttribute("comentarios");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="https://kit.fontawesome.com/d11ab77a4f.js" crossorigin="anonymous"></script>
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
            <form action="./noticiasPrincipalControlador" method="GET"> 
                <%
                    if (usuario != null) {
                %>
                <input type="hidden" name="usuario" value="<%= usuario.getNombreUsuario()%>">
                <%
                    }
                %>
                <input class="nav-brand" style=" font-size: 35px; color: whitesmoke;  border: none; background: none;" type="submit" value="The navbar" name="">                  
            </form>
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
                        <%
                            if (usuario != null) {
                        %>
                        <form action="./noticiasPrincipalControlador" method="GET">                             
                            <input type="hidden" name="usuario" value="<%= usuario.getNombreUsuario()%>">
                            <input class="nav-link active" style=" border: none; background: none;" type="submit" value="Inicio" name="">                  
                        </form>
                        <%
                        } else {
                        %>
                        <a class="nav-link active" href="paginaPrincipal.jsp">Inicio</a>                        
                        <%
                            }
                        %>
                    </li>
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
                        if (usuario != null) {
                            //String rol = "Creador de contenido";
                            if (usuario.getIdTipoUsuario() == 3) {
                    %>
                    <li>
                        <!--Crear noticias-->
                        <form action="./navCreadorContenidoControlador" method="POST">
                            <input type="text" name="getName" value="<%=usuario.getNombreUsuario()%>" style="border: none; background: none; display: none;" class="nav-link" readonly>
                            <input class="nav-link" style="border: none; background: none;" type="submit" value="Crear noticia" name="">                  
                        </form>
                    </li>
                    <li>
                        <form action="./listaFavoritasControlador" method="GET">
                            <input type="text" name="getName" value="<%=usuario.getNombreUsuario()%>" style="border: none; background: none; display: none;" class="nav-link" readonly>                            
                            <input class="nav-link" style="border: none; background: none;" type="submit" value="Noticias Favoritas" name="">                  
                        </form>
                    </li>
                    <li>
                        <form action="./CierreDeSesion" method="POST">                            
                            <input class="nav-link" style="border: none; background: none;" type="submit" value="Cerrar sesíon" name="">                  
                        </form>
                    </li>
                    <!--Moderador-->
                    <% } else if (usuario.getIdTipoUsuario() == 1) {%>
                    <li>
                        <form action="./listaFavoritasControlador" method="GET">
                            <input type="text" name="getName" value="<%=usuario.getNombreUsuario()%>" style="border: none; background: none; display: none;" class="nav-link" readonly>                            
                            <input class="nav-link" style="border: none; background: none;" type="submit" value="Noticias Favoritas" name="">                  
                        </form>
                    <li>
                        <form action="./CierreDeSesion" method="POST">                            
                            <input class="nav-link" style="border: none; background: none;" type="submit" value="Cerrar sesíon" name="">                  
                        </form>
                    </li>
                    <!--Editor-->
                    <%} else if (usuario.getIdTipoUsuario() == 2) {%>
                    <li>
                        <form action="./navCreadorContenidoControlador" method="POST">
                            <input type="text" name="getName" value="<%=usuario.getNombreUsuario()%>" style="border: none; background: none; display: none;" class="nav-link" readonly>
                            <input class="nav-link" style="border: none; background: none;" type="submit" value="Crear noticia" name="">                  
                        </form>
                    </li>
                    <li>
                        <form action="./listaFavoritasControlador" method="GET">
                            <input type="text" name="getName" value="<%=usuario.getNombreUsuario()%>" style="border: none; background: none; display: none;" class="nav-link" readonly>                            
                            <input class="nav-link" style="border: none; background: none;" type="submit" value="Noticias Favoritas" name="">                  
                        </form>
                    </li>
                    <li>
                        <!--Mostrar todas las noticias por revisar-->
                        <form action="./navCreadorContenidoControlador" method="GET">
                            <input type="text" name="getName" value="<%=usuario.getNombreUsuario()%>" style="border: none; background: none; display: none;" class="nav-link" readonly>
                            <input class="nav-link" style="border: none; background: none;" type="submit" value="Crear noticia" name="">                  
                        </form>
                    </li>
                    <li>
                        <form action="./CierreDeSesion" method="POST">                            
                            <input class="nav-link" style="border: none; background: none;" type="submit" value="Cerrar sesíon" name="">                  
                        </form>
                    </li>
                    <%
                    } else if (usuario.getIdTipoUsuario() == 5) {
                    %>
                    <li>
                        <form action="./listaFavoritasControlador" method="GET">
                            <input type="text" name="getName" value="<%=usuario.getNombreUsuario()%>" style="border: none; background: none; display: none;" class="nav-link" readonly>                            
                            <input class="nav-link" style="border: none; background: none;" type="submit" value="Noticias Favoritas" name="">                  
                        </form>
                    </li>
                    <li>
                        <form action="./CierreDeSesion" method="POST">                            
                            <input class="nav-link" style="border: none; background: none;" type="submit" value="Cerrar sesíon" name="">                  
                        </form>
                    </li>
                </ul>
                <%
                    }
                %>
                </ul
                <div class="form-inline my-2 my-lg-0">
                    <form action="./perfilUsuarioControlador" method="GET">
                        <input type="hidden" name="usuario" value="<%= usuario.getNombreUsuario()%>">
                        <input type="submit" style=" border: none; background: none; font-size: 20px; color: whitesmoke;" name="perfil" value="<%= usuario.getNombreUsuario()%>" >
                    </form>
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
                <%
                } else if (usuario == null) {
                %>
                <li>
                    <a class="nav-link" href="registroUsuarios.jsp">
                        Registrase<span class="sr-only">(current)</span>
                    </a>
                </li>
                </ul>
                <div class="form-inline my-2 my-lg-0">
                    <h2 style="margin-right: 40px">Anonimo</h2>
                    <img
                        class="mr-5"
                        style="border-radius: 30px"
                        height="80px"
                        width="80px"
                        src="assets/UserIcon/usuario.png"
                        alt=""
                        id="imagenUsuarioSM"
                        />
                </div>
                <%
                    }
                %>
            </div>
        </nav>

        <!--La noticia-->
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
                <div class="col-lg-1">      
                    <% if (usuario != null) {%>
                    <form action="./listaFavoritasControlador" method="POST">
                        <input type="hidden"  name="idNoticia" value="<%= noticia.getNoticia()%>"/>                        
                        <input type="hidden"  name="idUsuario" value="<%= usuario.getIdUsuario()%>"/>                        
                        <input type="hidden"  name="nombreUsuario" value="<%= usuario.getNombreUsuario()%>"/>                        
                        <input type="hidden"  name="nombreAutor" value="<%= noticia.getAutor()%>"/>                        
                        <button style="border: 2px solid red ; border-radius: 50px;  background: none;" ><i class="far fa-heart"></i></button>    
                    </form>
                    <%
                        }
                    %>
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
                    <embed width="1080px" height="720px" src="<%= noticia.getVideo()%>">
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
            <!--Comentarios-->
            <div class="row">
                <div class="col mt-lg-5">
                    <!-- <form action="" method="post">
                         <label for="tituloComentario">Titulo del comentario</label><br/>
                         <input type="text" name="tituloComentario" id="">
                         <input type="text" style="border: none; background: none;" name="nombreUsuario" value=""><br/>
                         <label for="contenidoComentario">Comentario</label><br/>
                         <textarea name="contenidoComentario" id="" cols="50" rows="3"></textarea><br/>            
                         <input type="submit" name="publicarComentario" value="Publicar" class="btn btn-danger">
                    <%
                        if (usuario != null) {
                            //si es moderador le debe aparecer la opcion de borrar comentario
                            if (usuario.getIdTipoUsuario() == 1) {
                    %>
                    <input type="submit" name="eliminarComentario" value="Eliminar" class="btn btn-warning mt-lg-3">
                    <%
                            }
                        }
                    %>
                </form>-->
                    <%
                        if (comentarios != null) {
                            for (modeloComentario comentario : comentarios) {
                                if (comentario.getPadre() == 0) {
                    %>
                    <div class="media">
                        <img style="max-height: 64px; max-height: 64px" src="<%= comentario.getImgUsuario()%>" class="mr-3" alt="Foto de perfil del usuario">
                        <div class="media-body">
                            <h5 class="mt-0"><%= comentario.getUsuario()%>
                                <%
                                    if (usuario != null) {
                                        if (usuario.getIdTipoUsuario() == 1) {
                                %>
                                <span>
                                    <form action="./eliminarComentarioControlador" method="POST">
                                        <input type="hidden" name="idComentario" value="<%= comentario.getIdComentario() %>">
                                        <input type="hidden" name="idNoticia" value="<%= noticia.getNoticia() %>">
                                        <input type="hidden" name="autorNoticia" value="<%= noticia.getAutor() %>">
                                        <input type="hidden" name="usuario" value="<%= usuario.getNombreUsuario() %>">
                                        <input class="float-right" type="submit" value=" Eliminar" class="btn btn-danger" >
                                    </form>
                                </span>
                                <%
                                        }
                                    }
                                %>
                            </h5>
                            <%= comentario.getContenido()%>
                            <%
                                for (modeloComentario respuesta : comentarios) {
                                    if (respuesta.getPadre() == comentario.getIdComentario()) {
                            %>
                            <div class="media mt-3">
                                <a class="mr-3" href="#">
                                    <img style="max-height: 64px; max-height: 64px" src="<%= respuesta.getImgUsuario()%>" class="mr-3" alt="Imagen de perfil del usuario">
                                </a>
                                <div class="media-body">
                                    <h5 class="mt-0"><%= respuesta.getUsuario()%></h5>
                                    <%= respuesta.getContenido()%>
                                </div> 
                            </div>
                            <%
                                    }
                                }
                            %>
                            <div class="card">
                                <div class="card-header text-align-center bg-cian">
                                    <h5>Agregar comentario</h5>
                                </div>
                                <div class="card-body">
                                    <form action="./respuestaComentarioControlador" method="POST" name="agregarRespueta">
                                        <%
                                            if (usuario != null) {
                                        %>
                                        <input type="hidden" name="usuario" value="<%= usuario.getNombreUsuario()%>">
                                        <%
                                        } else {
                                        %>
                                        <input type="hidden" name="usuario" value="anonimo">
                                        <%
                                            }
                                        %>   
                                        <input type="hidden" name="padre" value="<%= comentario.getIdComentario()%>">                                        
                                        <input type="hidden" name="autor" value="<%= noticia.getAutor()%>">
                                        <input type="hidden" name="noticia" value="<%= noticia.getNoticia()%>">
                                        <textarea name="comentario" class="col"></textarea>
                                        <input type="submit" name="Comentar" value="Enviar" class="btn btn-primary">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                                }
                            }
                        }
                        ;
                    %>
                </div>
            </div>     
            <div class="row mt-lg-4">
                <div class="col">
                    <div class="card">
                        <div class="card-header text-align-center bg-cian">
                            <h5>Responder comentario</h5>
                        </div>
                        <div class="card-body">
                            <form action="./comentarControlador" method="POST" name="agregarComentario">
                                <%
                                    if (usuario

                                    
                                        != null) {
                                %>
                                <input type="hidden" name="usuario" value="<%= usuario.getNombreUsuario()%>">
                                <input type="hidden" name="noticia" value="<%= noticia.getNoticia()%>">  
                                <%
                                    }

                                    
                                        else {
                                %>
                                <input type="hidden" name="usuario" value="anonimo">
                                <input type="hidden" name="noticia" value="<%= noticia.getNoticia()%>">  
                                <%
                                    }
                                %>             
                                <input type="hidden" name="autor" value="<%= noticia.getAutor()%>">
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

