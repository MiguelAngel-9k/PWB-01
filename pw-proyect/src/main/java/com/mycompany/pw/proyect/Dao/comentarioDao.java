/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.pw.proyect.Dao;

import com.mycompany.pw.proyect.Modelos.modeloComentario;
import com.mycompany.pw.proyect.Utils.conexionDB;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import static java.time.Clock.system;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mike_
 */
public class comentarioDao {
    
    public static boolean insertarComentario(modeloComentario comentario){
        try {
            Connection conn = conexionDB.getConnection();
            CallableStatement statement = conn.prepareCall("call sp_insertar_comentario(?,?,?)");
            statement.setString(1,comentario.getContenido());
            statement.setString(2,comentario.getUsuario());
            statement.setInt(3, comentario.getNoticia());
            
            statement.executeQuery();
            conn.close();                        
            return true;
            
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }
    
    public static List<modeloComentario> obtenerComentarios(int noticia){
        List <modeloComentario> comentarios = new ArrayList<>();
        
        try {
            Connection conn = conexionDB.getConnection();
            CallableStatement statement = conn.prepareCall("call sp_mostrar_comentarios(?)");
            statement.setInt(1,noticia);
            
              ResultSet resultSet = statement.executeQuery();
            
            while(resultSet.next()){
                
                int idComentario = resultSet.getInt("idComentario");
                String contenido = resultSet.getString("contenido");
                int idNoticia = resultSet.getInt("noticia");
                String usuario = resultSet.getString("nombreUsuario");
                String imgUsuario = resultSet.getString("foto");
                
                comentarios.add(new modeloComentario(contenido, usuario, imgUsuario,idNoticia, idComentario));
            }
            conn.close();                        
            return comentarios;
            
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }
    
}
