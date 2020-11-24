Create database noticias;
Use noticias;

Create Table usuario(
	idUsuario			int auto_increment not null,
    nombreUsuario		varchar(30) not null,
    nombre				varchar(30),
    apellido			varchar(30),
    correo				varchar(30) unique not null,
    contrasenia			varchar(100) not null,
    socialMedia			varchar(30),
    biografia			text,
    noticias			int,
    constraint PK_idUsuario primary key(idUsuario)    
);
alter table usuario drop column foto;
alter table usuario add foto varchar(255) default('assets/UserIcon/usuario.png');
alter table usuario alter column nombreUsuario unique
alter table usuario add foto varchar(255);
alter table usuario drop column tipoUsuario;
alter table usuario add rol Int not null;
alter table usuario add constraint FK_rolUsuario foreign key(rol) references tipoUsuario(idTipo);

create table tipoUsuario(
	idTipo			int auto_increment not null,
    Tipo			varchar(30),
    constraint PK_tipoUsuario primary key(idTipo)
);

alter table noticia add constraint FK_categoria foreign key(categoria) references categorias(idCategoria);
drop table categorias;
create table categorias(
	idCategoria			int auto_increment not null,
    categoria				varchar(30),
    constraint PK_categoria primary key(idCategoria)
);

Create Table noticia(
	idNoticia			Int auto_increment not null,
    titulo				varchar(40) not null,
    descripcion			text,
    contenido			text,
    categoria			Int,
    recursosIMG			Int,
    recursosVID			Int,
    autor				Int,
    constraint PK_Noticia primary key(idNoticia)
	#constraint FK_recurso_img foreign key(recursosIMG) references recursosNoticia(idRecurso),
    #constraint FK_recurso_vid foreign key(recursosVID) references recursosNoticia(idRecurso)
);

alter table recursosNoticia add constraint FK_noticia foreign key(noticia) references noticia(idNoticia);
alter table noticia add autor int not null;
alter table noticia add constraint FK_autor foreign key(autor) references usuario(idUsuario);
alter table noticia add estado bit default(1);
alter table noticia add fechaPublicacion Date default(curdate());
alter table noticia add aprovacion bit default(0);

Create Table recursosNoticia(
	idRecurso			Int auto_increment not null,
    imagen				varchar(255),
    video				varchar(255),
    noticia				Int,
    constraint PK_recurso primary key(idRecurso)
    #constraint FK_noticia foreign key(noticia) references noticia(idNoticia)
);

create table comentario(
	idComentario			int auto_increment not null,
    titulo					varchar(20),
    contenido				text,
    usuario					int not null,
    noticia					int not null,
    constraint PK_comentario primary key(idComentario),
    constraint FK_usuario foreign key(usuario) references usuario(idUsuario),
	constraint FK_noticia_comentario foreign key(noticia) references noticia(idNoticia)
);

alter table comentario add estado bit default(1);
alter table comentario add fechaPublicacion Date default(curdate());
alter table comentario add puntacion tinyint default(0);

 call sp_registrarUsuario ('melanie@gmail.com', 'mels', 'Mels', 'melanie', '64melanie', 'facebook/melanieMoreno', null, 'Registrado');
  call sp_registrarUsuario ('anonimo@anonimo', 'Anonimo', 'anonimo',  'anonimo', 'noContrasenia', null, null, 'Anonimo');
 call sp_iniciarSesion ('Miguel', 'contrasenia');
 call sp_editar_biografia ('miguel', 'hola, soy miguel y estoy editando mi biografia');
 call sp_editar_nombre ('Mels','Melanie michaelle', 'moreno martinez');
 call sp_insertar_noticia ('gatos con pulgares?', 'Los gatos consiguen pulgares opuestos', 'los gatos logran tener pulgares opuetos, declaran ya no necesitar de los humanos para poder abrir sus latas de atun, es asi como declaran su indepenencia gatuna', 'juegos', 'miguel');
 call sp_insertar_comentario ('Muy buena noticia', 'la noticia es muy informativa y super completa', 'Mels', 1);
 call sp_insertar_comentario ('Mala noticia', 'No me gusto para nada, esta mal redactada', 0, 1);
 call sp_evaluar_noticia (1, 1);
 call sp_eliminar_comentario(2,0);
 call eliminar_noticia(1,1);
 call sp_insertar_recursos('video.mp4', 1, 'no');
 call sp_editar_imagenPerfil(5,'assets/UserIcon/letra-r.png');
 call sp_mostrar_noticia ('miguel', 1,1);
 call sp_buscar_noticia('miguel','Primera noticia');
call sp_buscar_usuario ('miguel');

delete from categorias where idCategoria = 6;
delete from noticia where idNoticia =15;
select*from usuario;
select*from noticia;
select*from categorias;
select*from tipoUsuario;
select*from recursosNoticia;
select*from comentario;

create view vNoticia as
select*from vNoticia;

select*from vprevnoticia;
call sp_mostrar_prevNoticia ('miguel');

delete from recursosNoticia where idRecurso = 13;
delete from noticia where aprovacion = 0;
update usuario set rol = 2 where idUsuario = 6;

select categoria from categorias;

create view vNoticiaCompleta as
select noticia.idNoticia, noticia.titulo ,noticia.descripcion, noticia.contenido, categorias.categoria, usuario.nombreUsuario, recursosNoticia.imagen, recursosNoticia.video ,noticia.fechaPublicacion
	from noticia 	inner join categorias on categorias.idCategoria = noticia.categoria
					inner join usuario on usuario.idUsuario = noticia.autor
					inner join recursosNoticia on recursosNoticia.noticia = noticia.idNoticia
                    where noticia.estado = 1;
                    
select*from vNoticiaCompleta where nombreUsuario = 'miguel';
call sp_mostrar_noticia(16, 'miguel',1);