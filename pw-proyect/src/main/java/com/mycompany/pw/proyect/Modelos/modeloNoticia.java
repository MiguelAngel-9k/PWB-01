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
public class modeloNoticia {
    private String titulo;
    private String decripcionCorta;
    private String contenido;
    private String categoria;
    private String autor;
    private int aprovacion;
    private int noticia;
    private String imagenes[];
    private String video;

    public modeloNoticia() {
    }

    public modeloNoticia(String autor) {
        this.autor = autor;        
    }

    public modeloNoticia(String titulo, String decripcionCorta, String contenido, String categoria, String autor, int noticia, String[] imagenes, String video) {
        this.titulo = titulo;
        this.decripcionCorta = decripcionCorta;
        this.contenido = contenido;
        this.categoria = categoria;
        this.autor = autor;
        this.noticia = noticia;
        this.imagenes = imagenes;
        this.video = video;
    }
    

    public modeloNoticia(String titulo, String decripcionCorta, String contenido, String categoria, String autor, int aprovacion, int noticia, String[] imagenes, String video) {
        this.titulo = titulo;
        this.decripcionCorta = decripcionCorta;
        this.contenido = contenido;
        this.categoria = categoria;
        this.autor = autor;
        this.aprovacion = aprovacion;
        this.noticia = noticia;
        this.imagenes = imagenes;
        this.video = video;
    }

    
    
    public modeloNoticia(String titulo, String decripcionCorta, String contenido, String categoria, String autor) {
        this.titulo = titulo;
        this.decripcionCorta = decripcionCorta;
        this.contenido = contenido;
        this.categoria = categoria;
        this.autor = autor;
        this.imagenes = new String[3];
    }

    public modeloNoticia(String titulo, String decripcionCorta, String autor, int aprovacion, int noticia) {
        this.titulo = titulo;
        this.decripcionCorta = decripcionCorta;
        this.autor = autor;
        this.aprovacion = aprovacion;
        this.noticia = noticia;
    }

    

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDecripcionCorta() {
        return decripcionCorta;
    }

    public void setDecripcionCorta(String decripcionCorta) {
        this.decripcionCorta = decripcionCorta;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public int getAprovacion() {
        return aprovacion;
    }

    public void setAprovacion(int aprovacion) {
        this.aprovacion = aprovacion;
    }

    public int getNoticia() {
        return noticia;
    }

    public void setNoticia(int noticia) {
        this.noticia = noticia;
    }

    public String[] getImagenes() {
        return imagenes;
    }

    public void setImagenes(String[] imagenes) {
        this.imagenes = imagenes;
    }
    
    public String getImagen(int pos){
       return this.imagenes[pos];
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }
    
}
