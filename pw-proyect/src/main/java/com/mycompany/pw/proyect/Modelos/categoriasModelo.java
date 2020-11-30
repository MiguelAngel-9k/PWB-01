/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.pw.proyect.Modelos;

/**
 *
 * @author mike_
 */
public class categoriasModelo {
    
    private int idCategoria;
    private String categoria;

    public categoriasModelo(int idCategoria, String categoria) {
        this.idCategoria = idCategoria;
        this.categoria = categoria;
    }

    public categoriasModelo() {
    }

    public categoriasModelo(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
    
    
    
}
