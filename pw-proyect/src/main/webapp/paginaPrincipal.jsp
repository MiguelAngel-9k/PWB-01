<%-- 
    Document   : paginaPrincipal
    Created on : 30 nov 2020, 13:17:06
    Author     : mike_
--%>

<%@page import="com.mycompany.pw.proyect.Modelos.modeloUsuario"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.pw.proyect.Modelos.modeloNoticia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    List<modeloNoticia> noticias = (List<modeloNoticia>) request.getAttribute("noticias");
    List<modeloNoticia> destacadas = (List<modeloNoticia>) request.getAttribute("destacadas");
    modeloUsuario usuario = (modeloUsuario) request.getAttribute("usuario");

%>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="https://kit.fontawesome.com/d11ab77a4f.js" crossorigin="anonymous"></script>
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
            crossorigin="anonymous"
            />
        <title>Document</title>
    </head>
    <body class="bg-light">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <form action="./noticiasPrincipalControlador" method="GET"> 
                <%                    if (usuario != null) {
                %>
                <input type="hidden" name="usuario" value="<%= usuario.getNombreUsuario()%>">
                <%
                    }
                %>
                <input class="nav-brand" style="font-size: 35px; color: whitesmoke; border: none; background: none;" type="submit" value="The navbar" name="">                  
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
                        if (usuario != null) {
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
                    <%
                        }
                    %>
                    <%
                        if (usuario == null) {
                    %>
                    <li>
                        <a href="registroUsuarios.jsp" class="nav-link">
                            Registrarse
                        </a>
                    </li>
                    <%
                    } else {
                    %>
                </ul>
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
                    }
                %>
                <%
                } else if (usuario == null) {
                %>
                <li>
                    <a href="registroUsuarios.jsp" class="nav-link">
                        Registrarse
                    </a>
                </li>
                </ul>
                <div class="form-inline my-2 my-lg-0">
                    <h2 style="margin-right: 40px" id="nombreUsuarioSM">Anonimo</h2>
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
        <div class="container">
            <div class="row mt-lg-5">
                <div class="col">
                    <h3>Noticias</h3>
                </div>
            </div>
            <div class="row mt-lg-5">
                <div class="col">
                    <%
                        for (modeloNoticia noticia : noticias) {
                            if (noticia.getAprovacion() == 1) {
                    %>

                    <div class="card mt-lg-5">
                        <div class="card-header">
                            <h5><%= noticia.getTitulo()%></h5>
                            <form action="./verNoticia" method="GET" class="float-left">
                                <input type="hidden" name="autorNoticia" value="<%= noticia.getAutor()%>">
                                <input type="hidden" name="idNoticia" value="<%= noticia.getNoticia()%>">
                                <%
                                    if (usuario != null) {
                                %>
                                <input type="hidden" name="usuario" value="<%= usuario.getNombreUsuario()%>">                                    
                                <%
                                    }
                                %>
                                <input type="submit" name="ver" value="Ver" class="btn btn-primary">
                            </form>
                        </div>
                        <div class="card-body">
                            <p><%= noticia.getDecripcionCorta()%></p>
                        </div>
                    </div>
                    <!--<div class="card" style="width: 18rem">
                        <img class="card-img-top" src="" alt="Card image cap" />
                        <div class="card-body">
                            <h5 class="card-title"></h5>
                            <p class="card-text"></p>
                            <a href="#" class="btn btn-danger">Ver</a>
                        </div>
                    </div>-->
                    <%
                            }
                        };
                    %>
                </div>
            </div>
        </div>

        <script
            src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"
        ></script>
    </body>
</html>

