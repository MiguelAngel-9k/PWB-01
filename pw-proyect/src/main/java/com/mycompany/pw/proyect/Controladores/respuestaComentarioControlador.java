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
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mike_
 */
@WebServlet(name = "respuestaComentarioControlador", urlPatterns = {"/respuestaComentarioControlador"})
public class respuestaComentarioControlador extends HttpServlet {

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
//            out.println("<title>Servlet respuestaComentarioControlador</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet respuestaComentarioControlador at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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

        List<modeloComentario> comentarios = new ArrayList<>();

        modeloComentario _comentario = new modeloComentario();
        modeloUsuario _usuario = new modeloUsuario();
        modeloNoticia _noticia = new modeloNoticia();

        String usuario = request.getParameter("usuario");
        String noticia = request.getParameter("noticia");
        String contenido = request.getParameter("comentario");
        String padre = request.getParameter("padre");
        String autor = request.getParameter("autor");

        int idNoticia = 0;
        int idPadre = 0;

        if (padre != null) {
            idPadre = Integer.parseInt(padre);
        }

        if (noticia != null) {
            idNoticia = Integer.parseInt(noticia);
        }

        _comentario.setUsuario(usuario);
        _usuario.setNombreUsuario(usuario);
        _comentario.setNoticia(idNoticia);
        _noticia.setNoticia(idNoticia);
        _comentario.setContenido(contenido);
        _comentario.setPadre(idPadre);

        if (!comentarioDao.insertarRespuesta(_comentario)) {
            request.getRequestDispatcher("fail.jsp").forward(request, response);
        }

        _noticia = noticiaDao.getNoticia(autor, idNoticia);

        if (_noticia == null) {
            request.getRequestDispatcher("fail.jsp").forward(request, response);
        }

        if (!"anonimo".equals(usuario)) {
            if (usuarioDao.buscarUsuario(_usuario) == null) {
               _usuario = null;
            }
        } else {
            _usuario = null;
        }

        comentarios = comentarioDao.obtenerComentarios(idNoticia);
        if (comentarios == null) {
            request.getRequestDispatcher("fail.jsp").forward(request, response);
        }

        //  request.setAttribute("comentarios",)
        request.setAttribute("comentarios", comentarios);
        request.setAttribute("noticia", _noticia);
        request.setAttribute("usuario", _usuario);
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
