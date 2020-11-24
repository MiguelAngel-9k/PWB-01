<%-- 
    Document   : noticiasPendientes
    Created on : 24 nov 2020, 8:20:46
    Author     : mike_
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.pw.proyect.Modelos.modeloNoticia"%>
<%@page import="com.mycompany.pw.proyect.Modelos.modeloUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    modeloUsuario usuario = (modeloUsuario) request.getAttribute("usuario");
    List<modeloNoticia> noticias = (List<modeloNoticia>) request.getAttribute("noticias");
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
                </ul>
                <div class="form-inline my-2 my-lg-0">
                    <h2 style="margin-right: 40px"><%=usuario.getNombreUsuario()%></h2>
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
        <!--Noticias pendientes por aprovar-->
        <div class="container">
            <div class="row">
                <div class="col">
                    <%
                        for (modeloNoticia noticia : noticias) {
                    %> 
                    <div class="card mt-lg-5">
                        <div class="card-header align-items-center">
                            <div class="row">
                                <div class="col-lg-5">
                                    <h1><%= noticia.getTitulo()%></h1>
                                </div>
                                <div class="col-7 float-right">
                                    <form
                                        action="./noticiasPendientesControlador"
                                        method="get"
                                        name="verNoticia"
                                        class="form-inline float-right"
                                        >
                                        <input
                                            type="submit"
                                            value="Ver"
                                            class="btn btn-primary mr-lg-3"
                                            name="Ver"
                                            />
                                        <input
                                            type="text"
                                            name="autor"
                                            id="autor"
                                            style="border: none; background: none"
                                            value="<%= noticia.getAutor()%>"
                                            />
                                        <input
                                            type="text"
                                            name="idNoticia"
                                            id="idNoticia"
                                            style="border: none; background: none"
                                            value="<%= noticia.getNoticia()%>"
                                            />
                                        <input
                                            type="text"
                                            name="usuario"
                                            id="usuario"
                                            style="display: none;"
                                            value="<%= usuario.getNombreUsuario()%>"
                                            />
                                    </form>
                                    <form action="./aporvarNoticiaControlador" method="POST" name="aprovacion" class="form-inline float-right">
                                        <input
                                            type="submit"
                                            value="Aprovar"
                                            class="btn btn-success"
                                            name="aprovacion"
                                            />
                                        <input
                                            type="text"
                                            name="idNoticiaAprovacion"
                                            id="idNoticiaAprovacion"
                                            style="display: none;"
                                            value="<%= noticia.getNoticia()%>"
                                            />
                                        <input
                                            type="text"
                                            name="usuarioAprovacion"
                                            id="usuarioAprovacion"
                                            style="display: none;"
                                            value="<%= usuario.getNombreUsuario()%>"
                                            />
                                    </form>
                                    <form action="./eliminarNoticiaControlador" method="GET" name="eliminar" class="form-inline float-right">
                                        <input
                                            type="submit"
                                            value="Eliminar"
                                            class="btn btn-danger mr-lg-3"
                                            name="eliminar"
                                            />
                                        <input
                                            type="text"
                                            name="idNoticiaEliminar"
                                            id="idNoticiaAprovacion"
                                            style="display: none;"
                                            value="<%= noticia.getNoticia()%>"
                                            />
                                        <input
                                            type="text"
                                            name="usuarioEliminar"
                                            id="usuarioAprovacion"
                                            style="display: none;"
                                            value="<%= usuario.getNombreUsuario()%>"
                                            />
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="card-body"><%= noticia.getDecripcionCorta()%></div>
                    </div>
                    <%
                        }
                    %>
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
