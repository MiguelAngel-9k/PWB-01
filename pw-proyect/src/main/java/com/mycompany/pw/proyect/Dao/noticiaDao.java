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

            return statement.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {

        }
        return 0;
    }

    public static List<modeloNoticia> getPrevNoticia(String autorNoticia) {
        //modeloUsuario usuario = new modeloUsuario();
        List<modeloNoticia> listaNoticias = new ArrayList<>();
        try {
            Connection con = conexionDB.getConnection();
            CallableStatement statement = con.prepareCall("call sp_mostrar_prevNoticia(?)");
            statement.setString(1, autorNoticia);
            ResultSet resultSet = statement.executeQuery();
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

            return listaNoticias;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return null;
        } finally {
            // return usuario;
        }
    }

    public static boolean getIdNoticia(modeloNoticia noticia) {

        try {
            Connection con = conexionDB.getConnection();
            CallableStatement statement = con.prepareCall("call sp_buscar_noticia(?,?)");
            statement.setString(1, noticia.getAutor());
            statement.setString(2, noticia.getTitulo());
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                int idNoticia = resultSet.getInt("idNoticia");
                noticia.setNoticia(idNoticia);
            }
            return true;

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return false;
        } finally {
            // return usuario;
        }
    }

    public static int setImagenes(modeloNoticia noticia, int posImagen) {
        
        
        try {
            
            
            if(noticiaDao.getIdNoticia(noticia)==false){
                return 0;        
            }
            Connection conn = conexionDB.getConnection();
            CallableStatement statement = conn.prepareCall("call sp_insertar_recursos(?,?,?)");

            for (int i = 0; i < 3; i++) {
                statement.setString(1, noticia.getImagen(i));
                statement.setInt(2, noticia.getNoticia());
                statement.setString(3, "IMG");
                statement.executeUpdate();
            }
            return statement.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {

        }
        return 0;
    }
}
