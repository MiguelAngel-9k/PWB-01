<%-- Document : registroUsuarios Created on : 20 nov 2020, 9:58:11 Author :
mike_ --%>

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
        <title>Iniciar sesiï¿½n</title>
    </head>
    <body class="bg-light">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <form action="./noticiasPrincipalControlador" method="GET">                
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
                        <form action="./noticiasPrincipalControlador" method="GET">                
                            <input class="nav-link active" style="color: whitesmoke; border: none; background: none;" type="submit" value="Inicio" name="">                  
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
                    <li class="nav-item">
                        <a
                            class="nav-link disabled"
                            href="registroUsuarios.jsp"
                            tabindex="-1"
                            aria-disabled="true"
                            >Registrarse</a
                        >
                    </li>
                </ul>
                <!--Iniciar sesï¿½on a la pagina-->
                <form action="./registrarseControlador" method="GET" class="form-inline my-2 my-lg-0">
                    <input
                        class="form-control mr-sm-2"
                        type="text"
                        placeholder="Nombre de usuario"
                        id="INnombreUsuario"
                        name="INnombreUsuario"
                        />
                    <input
                        class="form-control mr-sm-2"
                        type="password"
                        placeholder="Contraseña"
                        id="INcontrasenia"
                        name="INcontrasenia"
                        />
                    <button class="btn btn-danger my-2 my-sm-0" type="submit">
                        Iniciar sesión
                    </button>
                </form>
                <!-- <form class="form-inline my-2 my-lg-0" method="POST" action="">
                    <input
                      class="form-control mr-sm-2"
                      type="search"
                      placeholder="Search"
                      aria-label="Search"
                    />
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
                      Search
                    </button>
                  </form> -->
            </div>
        </nav>

        <!--Registrarse para la pagina-->
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1
                        class="text-center"
                        style="margin-top: 30px; margin-bottom: 60px; padding: 0px"
                        >
                        Registrarse
                    </h1>
                </div>
            </div>
            <!--agregar lo de la imagen-->
            <form
                id="registro"
                name="registro"
                action="./registrarseControlador"
                method="POST"
                enctype="multipart/form-data"
                >
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input
                                type="text"
                                class="form-control"
                                id="nombre"
                                name="nombre"
                                required
                                minlength="3"
                                />
                        </div>
                        <div class="form-group">
                            <label for="apellido">Apellido</label>
                            <input
                                type="text"
                                class="form-control"
                                id="apellido"
                                name="apellido"
                                minlength="3"
                                />
                        </div>
                        <div class="form-group">
                            <label for="RedSocial">Red social de contacto </label>
                            <input type="text" class="form-control" id="RedSocial" name="RedSocial" />
                        </div>
                        <div class="form-group">
                            <select class="form-control" id="rolUsuario" name="rolUsuario" required>
                                <option>Creador de contenido</option>
                                <option>Moderador</option>
                                <option>Registrado</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="email">Correo</label>
                            <input
                                type="email"
                                class="form-control"
                                id="email"
                                name="email"
                                aria-describedby="emailHelp"
                                required
                                />
                            <small id="emailHelp" class="form-text text-muted"
                                   >No se compartira esta informaciï¿½n con nadie mas.</small
                            >
                        </div>
                        <div class="form-group">
                            <label for="password">Contraseña</label>
                            <input
                                type="password"
                                class="form-control"
                                id="password"
                                name="password"
                                required
                                minlength="8"
                                />
                        </div>
                        <div class="form-group">
                            <label for="nombreUsuario">Nombre de usuario</label>
                            <input
                                type="text"
                                class="form-control"
                                id="nombreUsuario"
                                name="nombreUsuario"
                                required
                                minlength="3"
                                />
                        </div>
                        <div class="form-group">
                            <label for="foroUsuario">Agregar una foto de usuario</label><br />
                            <input
                                type="file"
                                class="btn btn-primary"
                                id="imagen"
                                name="imagen"
                                />
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
            <!--  <form action="" method="POST" class="form-group">
              <div class="row align-items-end">
                <div class="col-lg-6">
                  <label for="nombre">Nombre</label>
                  <input type="text" name="nombre" id="nombre" />
                </div>
                <div class="col-lg-6">
                  <label for="apellido">apellido</label>
                  <input type="text" name="apellido" id="apellido" />
                </div>
              </div>
            </form> -->
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
