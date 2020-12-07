/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.pw.proyect.Dao;

import com.mycompany.pw.proyect.Modelos.modeloNoticia;
import com.mycompany.pw.proyect.Utils.conexionDB;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mike_
 */
public class noticiaDao {

    public static int insertarNoticia(modeloNoticia noticia) {
        try {
            Connection conn = conexionDB.getConnection();
            CallableStatement statement = conn.prepareCall("call sp_insertar_noticia(?,?,?,?,?)");
            statement.setString(1, noticia.getTitulo());
            statement.setString(2, noticia.getDecripcionCorta());
            statement.setString(3, noticia.getContenido());
            statement.setString(4, noticia.getCategoria());
            statement.setString(5, noticia.getAutor());

            int fila = statement.executeUpdate();
            conn.close();
            return fila;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {

        }
        return 0;
    }

    public static List<modeloNoticia> getPrevNoticia(String autorNoticia, int modo) {
        //modeloUsuario usuario = new modeloUsuario();
        List<modeloNoticia> listaNoticias = new ArrayList<>();
        try {
            Connection con = conexionDB.getConnection();
            CallableStatement statement;
            ResultSet resultSet = null;
            if (modo == 1) {
                statement = con.prepareCall("call sp_mostrar_prevNoticia(?)");
                statement.setString(1, autorNoticia);
                resultSet = statement.executeQuery();
            } else if (modo == 2) {
                statement = con.prepareCall("call sp_mostrar_todasNoticias_p()");
                resultSet = statement.executeQuery();
            }
            // Si el resultSet tiene resultados lo recorremos
            while (resultSet.next()) {
                // Obtenemos el valor del result set en base al nombre de la
                // columna
                int idNoticia = resultSet.getInt("idNoticia");
                String titulo = resultSet.getString("titulo");
                String descCorta = resultSet.getString("descripcion");
                int aprovacion = resultSet.getInt("aprovacion");
                String autor = resultSet.getString("nombreUsuario");
                // Agregamos el usuario a la lista
                //usuario.add(new modeloUsuario(, password, urlImage));     
                listaNoticias.add(new modeloNoticia(titulo, descCorta, autor, aprovacion, idNoticia));
//                noticia.setTitulo(titulo);
//                noticia.setNoticia(idNoticia);
//                noticia.setDecripcionCorta(descCorta);
//                noticia.setAprovacion(aprovacion);
//                noticia.setAutor(autor);
            }
            con.close();
            return listaNoticias;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return null;
        } finally {
            // return usuario;
        }
    }

    public static modeloNoticia getNoticia(String autor, int idNoticia) {
        modeloNoticia noticias = null;
        try {
            Connection con = conexionDB.getConnection();
            CallableStatement statement = con.prepareCall("call sp_mostrar_noticia(?,?,?)");
            statement.setInt(1, idNoticia);
            statement.setString(2, autor);
            statement.setInt(3, 1);
            ResultSet resultSet = statement.executeQuery();

            String[] imagenes = new String[3];
            int imgPos = 0;

            int _idNoticia = 0;
            String _titulo = "";
            String _desc = "";
            String _contenido = "";
            String _categoria = "";
            String _nombreUsuario = "";
            String _video = "";

            while (resultSet.next()) {
                _idNoticia = resultSet.getInt("idNoticia");
                _titulo = resultSet.getString("titulo");
                _desc = resultSet.getString("descripcion");
                _contenido = resultSet.getString("contenido");
                _categoria = resultSet.getString("categoria");
                _nombreUsuario = resultSet.getString("nombreUsuario");
                imagenes[imgPos] = resultSet.getString("imagen");
                if (imgPos >= 2) {
                    resultSet.next();
                    _video = resultSet.getString("video");
                    noticias = new modeloNoticia(_titulo, _desc, _contenido, _categoria, _nombreUsuario, _idNoticia, imagenes, _video);
                    con.close();
                    return noticias;
                }
                imgPos++;
            }

            if (imgPos > 0) {
                noticias = new modeloNoticia(_titulo, _desc, _contenido, _categoria, _nombreUsuario, _idNoticia, imagenes, _video);
                con.close();
                return noticias;
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return null;
        } finally {
            if (noticias != null) {
                return noticias;
            } else {
                return null;
            }
        }
    }

    public static boolean getIdNoticia(modeloNoticia noticia) {

        try {
            Connection con = conexionDB.getConnection();
            CallableStatement statement = con.prepareCall("call sp_buscar_noticia(?,?)");
            statement.setString(1, noticia.getAutor());
            statement.setString(2, noticia.getTitulo());
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int idNoticia = resultSet.getInt("idNoticia");
                noticia.setNoticia(idNoticia);
            }
            con.close();
            return true;

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return false;
        } finally {
            // return usuario;
        }
    }

    public static int setImagenes(modeloNoticia noticia, int posImagen) {

        int filas = 0;

        try {

            if (noticiaDao.getIdNoticia(noticia) == false) {
                return 0;
            }
            Connection conn = conexionDB.getConnection();
            CallableStatement statement = conn.prepareCall("call sp_insertar_recursos(?,?,?)");

            for (int i = 0; i <= 2; i++) {
                statement.setString(1, noticia.getImagen(i));
                statement.setInt(2, noticia.getNoticia());
                statement.setString(3, "IMG");
                filas = statement.executeUpdate();
            }
            conn.close();
            return filas;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {

        }
        return 0;
    }

    public static boolean setVideo(modeloNoticia noticia) {
        try {
            if (noticiaDao.getIdNoticia(noticia) == false) {
                return false;
            }

            Connection conn = conexionDB.getConnection();
            CallableStatement statement = conn.prepareCall("call sp_insertar_video(?,?)");

            statement.setInt(1, noticia.getNoticia());
            statement.setString(2, noticia.getVideo());

            statement.executeUpdate();
            conn.close();

            return true;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    public static boolean aprovarNoticia(int idNoticia, int aprovacion) {
        try {
            Connection conn = conexionDB.getConnection();
            CallableStatement statement = conn.prepareCall("call sp_evaluar_noticia(?,?)");
            statement.setInt(1, aprovacion);
            statement.setInt(2, idNoticia);
            statement.executeUpdate();
            conn.close();
            return true;

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    public static boolean eliminarNoticia(int idNoticia) {
        try {

            Connection con = conexionDB.getConnection();
            CallableStatement statement = con.prepareCall("call eliminar_noticia(?,?)");
            statement.setInt(1, 0);
            statement.setInt(2, idNoticia);
            statement.executeUpdate();
            con.close();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    public static boolean editarNoticia(modeloNoticia noticia, int opcion) {
        try {
            Connection conn = conexionDB.getConnection();
            CallableStatement statement = conn.prepareCall("call editar_noticia(?,?,?,?)");
            statement.setInt(1, noticia.getNoticia());
            statement.setInt(2, opcion);
            statement.setString(3, noticia.getTitulo());
            statement.setString(4, noticia.getDecripcionCorta());
            statement.setString(5, noticia.getContenido());

            statement.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    public static boolean editarTituloNoticia(int idNoticia, String titulo) {

        try {
            Connection conn = conexionDB.getConnection();
            CallableStatement statement = conn.prepareCall("call sp_editar_titulo(?,?)");
            statement.setInt(1, idNoticia);
            statement.setString(2, titulo);

            statement.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    public static boolean editarDescripcionNoticia(int idNoticia, String descripcion) {
        try {
            Connection conn = conexionDB.getConnection();
            CallableStatement statement = conn.prepareCall("call sp_editar_descripcion(?,?)");
            statement.setInt(1, idNoticia);
            statement.setString(2, descripcion);

            statement.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    public static boolean editarContenidoNoticia(int idNoticia, String contenido) {
        try {
            Connection conn = conexionDB.getConnection();
            CallableStatement statement = conn.prepareCall("call sp_editar_contenido(?,?)");
            statement.setInt(1, idNoticia);
            statement.setString(2, contenido);

            statement.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    public static boolean editarCategoriaNoticia(int idNoticia, String categoria) {
        try {
            Connection conn = conexionDB.getConnection();
            CallableStatement statement = conn.prepareCall("call sp_editar_categoria(?,?)");
            statement.setInt(1, idNoticia);
            statement.setString(2, categoria);

            statement.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    public static boolean editarImagenNoticia(int idNoticia, String nuevaImagen, String viejaImagen) {
        try {
            Connection conn = conexionDB.getConnection();
            CallableStatement statement = conn.prepareCall("call sp_editar_imagen(?,?,?)");
            statement.setInt(1, idNoticia);
            statement.setString(2, nuevaImagen);
            statement.setString(3, viejaImagen);

            statement.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    public static List<modeloNoticia> noticiasPrincipales() {
        List<modeloNoticia> noticias = new ArrayList<>();
        try {
            Connection conn = conexionDB.getConnection();
            CallableStatement statement = conn.prepareCall("call sp_noticias_principal()");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int idNoticia = resultSet.getInt("idNoticia");
                int aprovacion = resultSet.getInt("aprovacion");
                String titulo = resultSet.getString("titulo");
                String descripcion = resultSet.getString("descripcion");
                String autor = resultSet.getString("nombreUsuario");

                noticias.add(new modeloNoticia(titulo, descripcion, autor, aprovacion, idNoticia));
            }

            conn.close();
            return noticias;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }

    public static List<modeloNoticia> favoritos(String usuario) {
        List<modeloNoticia> favoritas = new ArrayList<>();
        try {
            Connection conn = conexionDB.getConnection();
            CallableStatement statement = conn.prepareCall("call sp_mostrar_favoritos(?)");
            statement.setString(1, usuario);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {

                int idNoticia = resultSet.getInt("idNoticia");
                String Titulo = resultSet.getString("Titulo");
                String Desc = resultSet.getString("Descripcion");
                String autor = resultSet.getString("Autor");

                favoritas.add(new modeloNoticia(Titulo, Desc, autor, idNoticia));
            }

            return favoritas;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }

    public static boolean insertarfavoritos(int idUsuario, int idNoticia) {
        try {
            Connection conn = conexionDB.getConnection();
            CallableStatement statement = conn.prepareCall("call sp_marcar_favorito(?,?)");
            statement.setInt(1, idNoticia);
            statement.setInt(2, idUsuario);
            
            statement.executeUpdate();
            conn.close();
            return true;

        } catch(SQLException ex) {
            System.out.println(ex.getMessage());
            return false;
        }

    }
}
