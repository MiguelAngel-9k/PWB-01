<%-- 
    Document   : editarNoticia
    Created on : 25 nov 2020, 10:12:05
    Author     : mike_
--%>

<%@page import="com.mycompany.pw.proyect.Modelos.categoriasModelo"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.pw.proyect.Modelos.modeloNoticia"%>
<%@page import="com.mycompany.pw.proyect.Modelos.modeloUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    modeloUsuario usuario = (modeloUsuario) request.getAttribute("usuario");
    // List<modeloNoticia> noticias = (List<modeloNoticia>) request.getAttribute("noticias");
    modeloNoticia noticia = (modeloNoticia) request.getAttribute("noticia");
    //List<categoriasModelo> categorias = (List<categoriasModelo>) request.getAttribute("categorias");
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
        <title>Editar Noticia</title>
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
                <div class="col-lg-6">
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
                                    <form action="./editarTiutuloControlador" method="POST">
                                        <div class="form-group">
                                            <label for="article-header">Editar titulo</label>
                                            <input
                                                type="text"
                                                name="Titulo"
                                                class="form-control"
                                                value="<%= noticia.getTitulo()%>"
                                                />
                                            <input
                                                type="hidden"
                                                name="autor"
                                                value="<%= noticia.getAutor()%>"
                                                class="form-control"
                                                />
                                            <input
                                                type="hidden"
                                                name="idNoticiaTitulo"
                                                value="<%= noticia.getNoticia()%>"                                                
                                                />
                                            <input
                                                type="submit"
                                                name="editarTitulo"
                                                value="Editar"
                                                class="btn btn-primary mt-lg-3"
                                                />

                                        </div>
                                    </form>
                                    <form method="POST" action="./editarDescControlador">
                                        <div class="form-group">
                                            <label for="descripcionCorta">Editar Descripción</label>
                                            <textarea
                                                class="form-control"
                                                id="descripcionCortaEditar"
                                                name="Descripcion"                          
                                                ><%= noticia.getDecripcionCorta()%></textarea>
                                            <input
                                                type="hidden"
                                                name="autor"
                                                value="<%= noticia.getAutor()%>"
                                                class="form-control"
                                                />
                                            <input
                                                type="hidden"
                                                name="idNoticiaDescripcion"
                                                value="<%= noticia.getNoticia()%>"                                                
                                                />
                                            <input
                                                type="submit"
                                                name="editarDescripcion"
                                                value="Editar"
                                                class="btn btn-primary mt-lg-3"
                                                />
                                        </div>
                                    </form>                                   
                                    <form action="./editarContenidoControlador" method="POST">
                                        <div class="form-group">
                                            <label for="EditarContenido"
                                                   >Editar contenido de la noticia</label
                                            >
                                            <textarea
                                                class="form-control"
                                                name="Contenido"
                                                id="ConteEditarContenidonido"
                                                ><%= noticia.getContenido()%></textarea>
                                        </div>
                                        <input
                                            type="hidden"
                                            name="autor"
                                            value="<%= noticia.getAutor()%>"
                                            class="form-control"
                                            />
                                        <input
                                            type="hidden"
                                            name="idNoticiaContenido"
                                            value="<%= noticia.getNoticia()%>"                                                
                                            />
                                        <input
                                            type="submit"
                                            name="editarNombre"
                                            value="Editar"
                                            class="btn btn-primary mt-lg-3"
                                            />
                                    </form>
                                    <form action="./editarCategoriaControlador" method="POST">
                                        <div class="form-group">
                                            <label for="Categoria">Cambiar categoria</label>
                                            <select
                                                class="form-control"
                                                id="Categoria"
                                                name="Categoria"
                                                >
                                                <option value="juegos">juegos</option>
                                                <option value="tarjetas graficas">tarjetas graficas</option>
                                                <option value="amd">amd</option>
                                                <option value="intel">intel</option>
                                                <option value="celulares">celulares</option>
                                            </select>
                                            <input
                                                type="hidden"
                                                name="autor"
                                                value="<%= noticia.getAutor()%>"
                                                class="form-control"
                                                />
                                            <input
                                                type="hidden"
                                                name="idNoticiaCategoria"
                                                value="<%= noticia.getNoticia()%>"                                                
                                                />
                                        </div>
                                        <input
                                            type="submit"
                                            name="editarNombre"
                                            value="Editar"
                                            class="btn btn-primary mt-lg-3"
                                            />
                                    </form>
                                    <form action="./editarImagenNoticiaControlador" method="POST" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <input
                                                type="text"
                                                name="idNoticiaImagen"
                                                value="<%= noticia.getNoticia()%>"                                                
                                                />
                                            <label for="Cebcera"
                                                   >Cambiar Imagen para el titulo</label
                                            >
                                            <input
                                                type="hidden"
                                                name="imagenCabecera"
                                                value="<%= noticia.getImagen(0)%>"
                                                >
                                            <input
                                                type="file"
                                                class="form-control-file btn btn-danger"
                                                id="CambiarimagenCabecera"
                                                name="Cabecera"
                                                />
                                            <label for="Central"
                                                   >Cambiar imagen Central</label
                                            >
                                            <input
                                                type="hidden"
                                                name="imagenCentral"
                                                value="<%= noticia.getImagen(1)%>"
                                                >
                                            <input
                                                type="file"
                                                class="form-control-file btn btn-danger"
                                                id="EditarimagenCentral"
                                                name="Central"
                                                />
                                            <label for="Final">Imagen Final</label>
                                            <input
                                                type="hidden"
                                                name="imagenFinal"
                                                value="<%= noticia.getImagen(2)%>"
                                                >
                                            <input
                                                type="file"
                                                class="form-control-file btn btn-danger"
                                                id="CambiarImagenFinal"
                                                name="Final"
                                                />
                                        </div>
                                        <input
                                            type="submit"
                                            name="editarImagen"
                                            value="Editar"
                                            class="btn btn-primary mt-lg-3"
                                            />
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> 
                <div class="col-lg-6">
                    <h3>Editar imagenes</h3>
                    <form action="./editarImagenNoticiaControlador" method="POST" enctype="multipart/form-data">
                        <input type="hidden" name="idNoticiaImagen" value="<%= noticia.getNoticia()%>">                        
                        <input type="hidden" name="autor" value="<%= noticia.getAutor()%>">                        
                        <div class="form-group pr-lg-5">
                            <p>Imagen de cabecera</p>
                            <img height="100px" width="100px" src="<%= noticia.getImagen(0)%>" alt="Imagen Cabecera">
                            <input type="hidden" name="imagenCabecera" value="<%= noticia.getImagen(0)%>">
                            <input type="file" name="Cabecera" class="form-control-file btn btn-danger">                        
                        </div>
                        <div class="form-group pr-lg-5">
                            <p>Imagen de Central</p>
                            <img height="100px" width="100px" src="<%= noticia.getImagen(1)%>" alt="Imagen Central">
                            <input type="hidden" name="imagenCentral" value="<%= noticia.getImagen(1)%>">                       
                            <input type="file" name="Central" class="form-control-file btn btn-danger">                        
                        </div>
                        <div class="form-group pr-lg-5">
                            <p>Imgagen Final</p>
                            <img height="100px" width="100px" src="<%= noticia.getImagen(2)%>" alt="Imagen Central">
                            <input type="hidden" name="imagenFinal" value="<%= noticia.getImagen(2)%>">                       
                            <input type="file" name="Final" class="form-control-file btn btn-danger">                        

                        </div>                            
                        <input type="submit" class="btn btn-danger" value="Guardar">
                    </form>
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
