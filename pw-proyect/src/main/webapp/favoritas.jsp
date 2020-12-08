<%-- 
    Document   : favoritas
    Created on : 7 dic 2020, 11:03:10
    Author     : mike_
--%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.pw.proyect.Modelos.modeloNoticia"%>
<%@page import="com.mycompany.pw.proyect.Modelos.modeloUsuario"%>
<%
    modeloUsuario usuario = (modeloUsuario) request.getAttribute("usuario");
    List<modeloNoticia> noticias = (List<modeloNoticia>) request.getAttribute("noticias");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
            integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
            crossorigin="anonymous"
            />
        <title>Favoritos</title>
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
                    <li>
                        <form action="./CierreDeSesion" method="POST">                            
                            <input class="nav-link" style="border: none; background: none;" type="submit" value="Cerrar sesíon" name="">                  
                        </form>
                    </li>
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

        <div class="container">
            <div class="row">
                <div class="col">
                    <table class="table mt-lg-5">
                        <thead  class="thead-dark">
                            <tr>
                                <th scope="col">Autor</th>
                                <th scope="col">Titulo</th>
                                <th scope="col">Descripción</th>
                                <th scope="col">Ver</th>
                                <th scope="col">Quitar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (modeloNoticia noticia : noticias) {
                            %>
                            <tr>          
                        <form action="./verNoticia" method="GET">
                            <th scope="row">
                                <input type="text" style="border:none; background: none;" readonly name="autorNoticia" value="<%= noticia.getAutor()%>"/>
                            </th>
                            <input type="hidden" value="<%= noticia.getNoticia()%>" name="idNoticia">
                            <input type="hidden" value="<%= usuario.getNombreUsuario()%>" name="usuario" />
                            <th scope="row"><%= noticia.getTitulo()%></th>
                            <th scope="row"><%= noticia.getDecripcionCorta()%></th>
                            <th scope="row">
                                <input type="submit" value="Ver" class="btn btn-primary">
                            </th>
                        </form>
                        <form action="./quitarFavoritoControlador" method="POST" >                            
                            <input type="hidden" value="<%= noticia.getNoticia()%>" name="idNoticia">
                            <input type="hidden" value="<%= usuario.getNombreUsuario()%>" name="usuario" />
                            <th scope="row"><input type="submit" value="Quitar" class="btn btn-danger"></th>
                        </form>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
