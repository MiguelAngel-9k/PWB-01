/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.pw.proyect.Dao;

import com.mycompany.pw.proyect.Modelos.modeloUsuario;
import com.mycompany.pw.proyect.Utils.conexionDB;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 *
 * @author mike_
 */
public class usuarioDao {
    
    public static int insertarUsuario(modeloUsuario usuario){
        try{
            Connection conn = conexionDB.getConnection();
            CallableStatement statement = conn.prepareCall("call sp_registrarUsuario(?,?,?,?,?,?,?,?)");
            statement.setString(1,usuario.getCorreo());
            statement.setString(2,usuario.getContrasenia());
            statement.setString(3,usuario.getNombreUsuario());
            statement.setString(4,usuario.getNombre());
            statement.setString(5,usuario.getApellido());
            statement.setString(6,usuario.getUrlImage());
            statement.setString(7,usuario.getrSocial());
            statement.setString(8,usuario.getRol());
            
            return statement.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        finally{
            
        }
        return 0;
    }
    
    public static modeloUsuario getUser(modeloUsuario usuario) {
       //modeloUsuario usuario = new modeloUsuario();
        try {
            Connection con = conexionDB.getConnection();
            CallableStatement statement = con.prepareCall("call sp_iniciarSesion(?,?)");
            statement.setString(1,usuario.getNombreUsuario());
             statement.setString(2,usuario.getContrasenia());
            ResultSet resultSet = statement.executeQuery();
            // Si el resultSet tiene resultados lo recorremos
            while (resultSet.next()) {
                // Obtenemos el valor del result set en base al nombre de la
                // columna
                String nombreUsuario = resultSet.getString("nombreUsuario");
                String nombre = resultSet.getString("nombre");
                String apellido = resultSet.getString("apellido");
                String correo = resultSet.getString("correo");
                String socialMedia = resultSet.getString("socialMedia");
                String urlImage = resultSet.getString("foto");
                String biografia = resultSet.getString("biografia");
                String rolUsuario = resultSet.getString("Tipo");
                int idRolUsuario = resultSet.getInt("idTipo");
                int idUsuario = resultSet.getInt("idUsuario");
                // Agregamos el usuario a la lista
                //usuario.add(new modeloUsuario(, password, urlImage));                
                usuario.setNombreUsuario(nombreUsuario);
                usuario.setNombre(nombre);
                usuario.setApellido(apellido);
                usuario.setCorreo(correo);
                usuario.setrSocial(socialMedia);
                usuario.setUrlImage(urlImage);
                usuario.setBiografia(biografia);
                usuario.setRol(rolUsuario);
                usuario.setIdTipoUsuario(idRolUsuario);
                usuario.setIdUsuario(idUsuario);                     
            }
            
            return usuario;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return null;
        } finally {
           // return usuario;
        }
    }
    
    public static modeloUsuario buscarUsuario(modeloUsuario usuario){
        try {
            Connection con = conexionDB.getConnection();
            CallableStatement statement = con.prepareCall("call sp_buscar_usuario(?)");
            statement.setString(1,usuario.getNombreUsuario());
            ResultSet resultSet = statement.executeQuery();
            // Si el resultSet tiene resultados lo recorremos
            while (resultSet.next()) {
                // Obtenemos el valor del result set en base al nombre de la
                // columna
                String nombreUsuario = resultSet.getString("nombreUsuario");
                String nombre = resultSet.getString("nombre");
                String apellido = resultSet.getString("apellido");
                String correo = resultSet.getString("correo");
                String socialMedia = resultSet.getString("socialMedia");
                String urlImage = resultSet.getString("foto");
                String biografia = resultSet.getString("biografia");
                String rolUsuario = resultSet.getString("Tipo");
                int idRolUsuario = resultSet.getInt("idTipo");
                int idUsuario = resultSet.getInt("idUsuario");
                // Agregamos el usuario a la lista
                //usuario.add(new modeloUsuario(, password, urlImage));                
                usuario.setNombreUsuario(nombreUsuario);
                usuario.setNombre(nombre);
                usuario.setApellido(apellido);
                usuario.setCorreo(correo);
                usuario.setrSocial(socialMedia);
                usuario.setUrlImage(urlImage);
                usuario.setBiografia(biografia);
                usuario.setRol(rolUsuario);
                usuario.setIdTipoUsuario(idRolUsuario);
                usuario.setIdUsuario(idUsuario);                     
            }
            con.close();
            return usuario;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return null;
        } finally {
           // return usuario;
        }
    }
}
