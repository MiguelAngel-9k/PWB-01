<%-- 
    Document   : publicarContenido
    Created on : 21 nov 2020, 9:44:28
    Author     : mike_
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.pw.proyect.Modelos.modeloNoticia"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.pw.proyect.Modelos.modeloUsuario"%>
<%
    modeloUsuario usuario = (modeloUsuario) request.getAttribute("usuario");
    List<modeloNoticia> noticias = (List<modeloNoticia>) request.getAttribute("noticias");
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
    </head>
    <body class="bg-light">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <form action="./noticiasPrincipalControlador" method="GET"> 
                <input type="hidden" name="usuario" value="<%= usuario.getNombreUsuario()%>">
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
                        <form action="./noticiasPrincipalControlador" method="GET"> 
                            <input type="hidden" name="usuario" value="<%= usuario.getNombreUsuario()%>">
                            <input class="nav-link active" style=" border: none; background: none;" type="submit" value="Inicio" name="">                  
                        </form>
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
                        <form action="./navCreadorContenidoControlador" method="GET">
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
                        <form action="./listaFavoritasControlador" method="GET">
                            <input type="text" name="getName" value="<%=usuario.getNombreUsuario()%>" style="border: none; background: none; display: none;" class="nav-link" readonly>                            
                            <input class="nav-link" style="border: none; background: none;" type="submit" value="Noticias Favoritas" name="">                  
                        </form>
                       <!-- <a class="nav-link" href="#">
                            Noticas marcadas<span class="sr-only">(current)</span>
                        </a>-->
                    </li>
                    <li>
                        <form action="./navNoticiaControlador" method="POST">
                            <input type="text" name="getName" value="<%=usuario.getNombreUsuario()%>" style="border: none; background: none; display: none;" class="nav-link" readonly>
                            <input class="nav-link" style="border: none; background: none;" type="submit" value="Noticias Pendientes" name="">                  
                        </form>
                    </li>
                    <li>
                        <form action="./CierreDeSesion" method="POST">                            
                            <input class="nav-link" style="border: none; background: none;" type="submit" value="Cerrar sesíon" name="">                  
                        </form>
                    </li>
                    <%
                        }
                    %>
                </ul>
                <div class="form-inline my-2 my-lg-0">
                    <<form action="./perfilUsuarioControlador" method="GET">
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
            </div>
        </nav>

        <!-- Formato de las noticias -->
        <div class="cotainer">
            <div class="row">
                <div class="col-lg-5">
                    <div
                        class="accordion"
                        style="width: 60%; transform: translate(25%); margin-top: 5%"
                        id="formatoAcordeon"
                        >
                        <div class="card">
                            <div class="card-header bg-dark" id="cabeceraAcordeon">
                                <h2 class="mb-0">
                                    <button
                                        class="btn btn-danger btn-block text-left"
                                        type="button"
                                        data-toggle="collapse"
                                        data-target="#collapseOne"
                                        aria-expanded="true"
                                        aria-controls="collapseOne"
                                        >
                                        Publicar contenido
                                    </button>
                                </h2>
                            </div>
                            <div
                                id="collapseOne"
                                class="collapse show"
                                aria-labelledby="cabeceraAcordeon"
                                data-parent="#formatoAcordeon"
                                >
                                <div class="card-body bg-white">
                                    <form action="./publicarNoticiaControlador" method="POST" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label for="titulo">Titulo del articulo</label>
                                            <input
                                                type="text"
                                                id="titulo"
                                                name="titulo"
                                                class="form-control"
                                                />
                                        </div>
                                        <div class="form-group">
                                            <label for="descripcionCorta">Descripción corta</label>
                                            <textarea
                                                class="form-control"
                                                id="descripcionCorta"
                                                name="descripcionCorta"
                                                rows="3"
                                                ></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="imagenCabecera">Imagen para el titulo</label>
                                            <input
                                                type="file"
                                                class="form-control-file btn btn-danger"
                                                id="imagenCabecera"
                                                name="imagenCabecera"
                                                />
                                        </div>
                                        <div class="form-group">
                                            <label for="Contenido">Contenido de la noticia</label>
                                            <textarea
                                                class="form-control"
                                                id="Contenido"
                                                rows="3"
                                                name="Contenido"
                                                ></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="categoria">Example select</label>
                                            <select class="form-control" id="categoria" name="categoria">
                                                <option>tarjetas graficas</option>
                                                <option>amd</option>
                                                <option>intel</option>
                                                <option>celulares</option>
                                                <option>juegos</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="imagenCentral">Imagen Central</label>
                                            <input
                                                type="file"
                                                class="form-control-file btn btn-danger"
                                                id="imagenCentral"
                                                name="imagenCentral"
                                                />
                                        </div>
                                        <div class="form-group">
                                            <label for="imagenFinal">Imagen Final</label>
                                            <input
                                                type="file"
                                                class="form-control-file btn btn-danger"
                                                id="imagenFinal"
                                                name="imagenFinal"
                                                />
                                        </div>
                                        <div>
                                            <label for="autor">Nombre del autor</label><br/>
                                            <input name="autor" class="mt-1 mb-2" type="text" readonly style="border: none; font-weight: bold;" value="<%= usuario.getNombreUsuario()%>"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="video">Video</label>
                                            <input
                                                type="file"    
                                                class="form-control btn btn-danger"
                                                name="video"
                                                />
                                        </div>
                                        <button id="enivarEditor" class="btn btn-danger">
                                            Enviar al editor
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>                                        
                    </div>
                </div>

                <div class="col-lg-6"> 
                    <form action="./editarNoticiaControlador" method="get"  enctype="multipart/form-data" name="editarNoticia">
                        <input type="hidden" name="autor" value="<%= usuario.getNombreUsuario()%>">
                        <label for="idNoticia">Introduzca el Registro para editar</label>
                        <input type="text" name="idNoticia">
                        <input type="submit" name="editar" value="Editar" class="btn btn-primary">
                    </form>
                    <table class="table mt-lg-5">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Registro noticia</th>
                                <th scope="col">Titulo noticia</th>
                                <th scope="col">Descripción</th>
                                <th scope="col">Autor</th>
                                <th scope="col">Estado</th>
                                <th scope="col">Ver</th>
                            </tr>
                        </thead>
                        <%
                            for (modeloNoticia noticia : noticias) {
                        %>
                        <tbody>
                            <tr>
                        <form action="./publicarNoticiaControlador" method="GET">
                            <th scope="row">
                                <input type="text" style="border: none; background: none;" readonly name="idNoticia" value="<%= noticia.getNoticia()%>"/>
                            </th>
                            <th scope="row"><%= noticia.getTitulo()%></th>
                            <th scope="row"><%= noticia.getDecripcionCorta()%></th>                            
                            <th scope="row">
                                <input type="text" style="border: none; background: none;" readonly name="autorNoticia" value="<%= noticia.getAutor()%>"/>                                
                            </th>
                            <th scope="row bg-warning"><%= noticia.getAprovacion()%></th>
                            <th scope="row">
                                <input type="submit" value="Ver" class="btn btn-primary">
                            </th>      
                            <!--<th>
                                <a href="/editarNoticiaControlador?idNoticia=<%= noticia.getNoticia()%>&autorNoticia=<%= noticia.getAutor()%>" class="btn btn-secondary">Editar</a>
                            </th>-->
                        </form>

                        </tr>
                        </tbody>  
                        <%
                            }
                        %>   
                    </table>
                    <!--<form action="./editarNoticiaControlador" method="GET">
                        <label for="noticia">Editar noticia</label>
                        <input type="text" name="idNoticia" class="form-group">
                        <% modeloNoticia noticia = noticias.get(1);%>
                        <input type="hidden" name="autor" value="<%= noticia.getAutor()%>">
                        <input type="submit" value="Ver" class="btn btn-primary">                        
                    </form>-->
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

