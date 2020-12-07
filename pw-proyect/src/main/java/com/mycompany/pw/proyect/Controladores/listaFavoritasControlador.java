/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.pw.proyect.Controladores;

import com.mycompany.pw.proyect.Dao.comentarioDao;
import com.mycompany.pw.proyect.Dao.noticiaDao;
import com.mycompany.pw.proyect.Dao.usuarioDao;
import com.mycompany.pw.proyect.Modelos.modeloComentario;
import com.mycompany.pw.proyect.Modelos.modeloNoticia;
import com.mycompany.pw.proyect.Modelos.modeloUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mike_
 */
@WebServlet(name = "listaFavoritasControlador", urlPatterns = {"/listaFavoritasControlador"})
public class listaFavoritasControlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet listaFavoritasControlador</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet listaFavoritasControlador at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String _usuario = request.getParameter("getName");

        List<modeloNoticia> favs = noticiaDao.favoritos(_usuario);
        modeloUsuario usuario = new modeloUsuario();
        usuario.setNombreUsuario(_usuario);

        if (favs == null) {
            request.getRequestDispatcher("fail.jsp").forward(request, response);
        }

        usuarioDao.buscarUsuario(usuario);
        if (usuario == null) {
            request.getRequestDispatcher("fail.jsp").forward(request, response);
        }

        request.setAttribute("usuario", usuario);
        request.setAttribute("noticias", favs);
        request.getRequestDispatcher("favoritas.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        modeloUsuario usuarioActial = new modeloUsuario();
        modeloNoticia noticiaActual = null;
        List<modeloComentario> comentarios = null;

        String idUsuario = request.getParameter("idUsuario");
        String idNoticia = request.getParameter("idNoticia");
        String nombreUsuario = request.getParameter("nombreUsuario");

        int _idNoticia = 0;
        int _idUsuario = 0;

        if (idUsuario != null) {
            _idUsuario = Integer.parseInt(idUsuario);
        } else {
            return;
        }

        if (idNoticia != null) {
            _idNoticia = Integer.parseInt(idNoticia);
        } else {
            return;
        }

        if (!noticiaDao.insertarfavoritos(_idUsuario, _idNoticia)) {
            request.getRequestDispatcher("fail.jsp").forward(request, response);
        }

        usuarioActial.setNombreUsuario(nombreUsuario);
        usuarioDao.buscarUsuario(usuarioActial);
        if (nombreUsuario == null) {
            request.getRequestDispatcher("fail.jsp").forward(request, response);
        }

        noticiaActual = noticiaDao.getNoticia(nombreUsuario, _idNoticia);
        if (noticiaActual == null) {
            request.getRequestDispatcher("fail.jsp").forward(request, response);
        }

        comentarios = comentarioDao.obtenerComentarios(_idNoticia);
        if (comentarios == null) {
            request.getRequestDispatcher("fail.jsp").forward(request, response);
        }

        request.setAttribute("noticia", noticiaActual);
        request.setAttribute("usuario", usuarioActial);
        request.setAttribute("comentarios", comentarios);
        
        request.getRequestDispatcher("noticiaCompleta.jsp").forward(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
