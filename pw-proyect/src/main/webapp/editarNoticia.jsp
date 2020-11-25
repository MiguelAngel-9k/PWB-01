<%-- 
    Document   : editarNoticia
    Created on : 25 nov 2020, 10:12:05
    Author     : mike_
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.pw.proyect.Modelos.modeloNoticia"%>
<%@page import="com.mycompany.pw.proyect.Modelos.modeloUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    modeloUsuario usuario = (modeloUsuario) request.getAttribute("usuario");
   // List<modeloNoticia> noticias = (List<modeloNoticia>) request.getAttribute("noticias");
   modeloNoticia noticia = (modeloNoticia)request.getAttribute("noticia");
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

        <div class="cotainer m-0">
            <div class="row">
                <div class="col">
                    <div
                        class="accordion"
                        style="width: 60%; transform: translate(25%); margin-top: 5%"
                        id="editNoticia"
                        >
                        <div class="card">
                            <div class="card-header bg-dark" id="editNoticiaAcordion">
                                <h2 class="mb-0">
                                    <button
                                        class="btn btn-danger btn-block text-left"
                                        type="button"
                                        data-toggle="collapse"
                                        data-target="#collapseTwo"
                                        aria-expanded="true"
                                        aria-controls="collapseTwo"
                                        >
                                        Editar contenido
                                    </button>
                                </h2>
                            </div>
                            <div
                                id="collapseTwo"
                                class="collapse show"
                                aria-labelledby="editNoticiaAcordion"
                                data-parent="#editNoticia"
                                >
                                <div class="card-body bg-white">
                                    <form action="./editarNoticiaControlador" method="POST">
                                        <div class="form-group">
                                            <label for="article-header">Editar titulo</label>
                                            <input
                                                type="text"
                                                name="editTitulo"
                                                class="form-control"
                                                value="<%= noticia.getTitulo() %>"
                                                />
                                             <input
                                                type="hiden"
                                                name="opcion"
                                                value="Titulo"
                                                class="form-control"
                                                />
                                              <input
                                                type="hiden"
                                                name="TituloAutor"
                                                value="<%= noticia.getAutor() %>"
                                                class="form-control"
                                                />
                                            <input
                                                type="submit"
                                                name="idNoticiaTitulo"
                                                value="<%= noticia.getNoticia() %>"
                                                class="btn btn-primary mt-lg-3"
                                                />
                                        </div>
                                    </form>
                                    <form method="POST" action="">
                                        <div class="form-group">
                                            <label for="descripcionCorta">Editar Descripción</label>
                                            <textarea
                                                class="form-control"
                                                id="descripcionCortaEditar"
                                                name="descripcionCortaEditar"
                                                ></textarea>
                                            <input
                                                type="submit"
                                                name="editarNombre"
                                                value="Editar"
                                                class="btn btn-primary mt-lg-3"
                                                />
                                        </div>
                                    </form>
                                    <form method="POST">
                                        <div class="form-group">
                                            <label for="CambiarimagenCabecera"
                                                   >Cambiar Imagen para el titulo</label
                                            >
                                            <input
                                                type="file"
                                                class="form-control-file btn btn-danger"
                                                id="CambiarimagenCabecera"
                                                name="CambiarimagenCabecera"
                                                />
                                            <input
                                                type="submit"
                                                name="editarNombre"
                                                value="Editar"
                                                class="btn btn-primary mt-lg-3"
                                                />
                                        </div>
                                    </form>
                                    <form action="" method="POST">
                                        <div class="form-group">
                                            <label for="EditarContenido"
                                                   >Editar contenido de la noticia</label
                                            >
                                            <textarea
                                                class="form-control"
                                                name="EditarContenido"
                                                id="ConteEditarContenidonido"
                                                ></textarea>
                                        </div>
                                        <input
                                            type="submit"
                                            name="editarNombre"
                                            value="Editar"
                                            class="btn btn-primary mt-lg-3"
                                            />
                                    </form>
                                    <form action="" method="POST">
                                        <div class="form-group">
                                            <label for="EditarCategoria">Cambiar categoria</label>
                                            <select
                                                class="form-control"
                                                id="EditarCategoria"
                                                name="EditarCategoria"
                                                >
                                                <option>Gamess</option>
                                                <option>Hardware</option>
                                                <option>Software</option>
                                                <option>Consoles</option>
                                                <option>Brands</option>
                                            </select>
                                        </div>
                                        <input
                                            type="submit"
                                            name="editarNombre"
                                            value="Editar"
                                            class="btn btn-primary mt-lg-3"
                                            />
                                    </form>
                                    <form action="" method="POST">
                                        <div class="form-group">
                                            <label for="EditarimagenCentral"
                                                   >Cambiar imagen Central</label
                                            >
                                            <input
                                                type="file"
                                                class="form-control-file btn btn-danger"
                                                id="EditarimagenCentral"
                                                name="EditarimagenCentral"
                                                />
                                        </div>
                                        <input
                                            type="submit"
                                            name="editarNombre"
                                            value="Editar"
                                            class="btn btn-primary mt-lg-3"
                                            />
                                    </form>
                                    <form action="" method="POST">
                                        <div class="form-group">
                                            <label for="CambiarImagenFinal">Imagen Final</label>
                                            <input
                                                type="file"
                                                class="form-control-file btn btn-danger"
                                                id="CambiarImagenFinal"
                                                name="CambiarImagenFinal"
                                                />
                                            <input
                                                type="submit"
                                                name="editarNombre"
                                                value="Editar"
                                                class="btn btn-primary mt-lg-3"
                                                />
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
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
</html>
