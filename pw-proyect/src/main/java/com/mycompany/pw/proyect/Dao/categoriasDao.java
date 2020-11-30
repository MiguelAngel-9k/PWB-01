/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.pw.proyect.Dao;

import com.mycompany.pw.proyect.Modelos.categoriasModelo;
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
public class categoriasDao {
    
    public static List<categoriasModelo> getCategorias(){
        List<categoriasModelo> categorias = new ArrayList<>();
        
         try {
            Connection con = conexionDB.getConnection();
            CallableStatement statement = con.prepareCall("call sp_mostrar_categorias()");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String categoria = resultSet.getString("categoria");
                int idCategoria = resultSet.getInt("idCategoria");
                
                categorias.add(new categoriasModelo(idCategoria, categoria));                
            }
            
            return categorias;

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }
    
}
