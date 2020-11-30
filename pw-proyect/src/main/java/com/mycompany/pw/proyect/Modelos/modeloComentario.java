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
public class modeloComentario {

    private String contenido;
    private String usuario;
    private int idComentario;
    private int padre;
    private int noticia;
    private String imgUsuario;

    public modeloComentario() {
    }

    public modeloComentario(String contenido, String usuario, int idComentario, int padre, int noticia, String imgUsuario) {
        this.contenido = contenido;
        this.usuario = usuario;
        this.idComentario = idComentario;
        this.padre = padre;
        this.noticia = noticia;
        this.imgUsuario = imgUsuario;
    }        
    

    public modeloComentario(String contenido, String usuario, String foto,int noticia, int comentario) {
        this.contenido = contenido;
        this.usuario = usuario;
        this.noticia = noticia;
        this.idComentario = comentario;
        this.imgUsuario = foto;
    }

    public modeloComentario(String contenido, String usuario, int idComentario, int padre, int noticia) {
        this.contenido = contenido;
        this.usuario = usuario;
        this.idComentario = idComentario;
        this.padre = padre;
        this.noticia = noticia;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public int getIdComentario() {
        return idComentario;
    }

    public void setIdComentario(int idComentario) {
        this.idComentario = idComentario;
    }

    public int getPadre() {
        return padre;
    }

    public void setPadre(int padre) {
        this.padre = padre;
    }

    public int getNoticia() {
        return noticia;
    }

    public void setNoticia(int noticia) {
        this.noticia = noticia;
    }

    public String getImgUsuario() {
        return imgUsuario;
    }

    public void setImgUsuario(String imgUsuario) {
        this.imgUsuario = imgUsuario;
    }

}
