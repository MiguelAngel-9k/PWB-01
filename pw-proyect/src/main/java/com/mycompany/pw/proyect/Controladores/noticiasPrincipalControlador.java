/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.pw.proyect.Controladores;

import com.mycompany.pw.proyect.Dao.noticiaDao;
import com.mycompany.pw.proyect.Dao.usuarioDao;
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
@WebServlet(name = "noticiasPrincipalControlador", urlPatterns = {"/noticiasPrincipalControlador"})
public class noticiasPrincipalControlador extends HttpServlet {

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

        List<modeloNoticia> noticias = noticiaDao.getPrevNoticia("", 2);

        if (noticias == null) {
            request.getRequestDispatcher("fail.jsp").forward(request, response);
        }

        request.setAttribute("noticias", noticias);
        request.getRequestDispatcher("paginaPrincipal.jsp").forward(request, response);

//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet noticiasPrincipalControlador</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet noticiasPrincipalControlador at " + request.getContextPath() + "</h1>");
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

        List<modeloNoticia> noticias = noticiaDao.getPrevNoticia("", 2);
        List<modeloNoticia> noticiasDestacadas = new ArrayList<>();
        modeloUsuario usuario = null;

        String nombreUsuario = request.getParameter("usuario");

        if (nombreUsuario != null) {
            usuario = new modeloUsuario();
            usuario.setNombreUsuario(nombreUsuario);
            usuarioDao.buscarUsuario(usuario);
        }

        if (noticias == null) {
            request.getRequestDispatcher("fail.jsp").forward(request, response);
        }        

        for (int i = 0; i < 3; i++) {
            String autor = noticias.get(i).getAutor();
            int idNoticia = noticias.get(i).getNoticia();
            modeloNoticia temp = noticiaDao.getNoticia(autor, idNoticia);
            noticiasDestacadas.add(temp);
        }

        request.setAttribute("usuario", usuario);
        request.setAttribute("destacadas", noticiasDestacadas);
        request.setAttribute("noticias", noticias);
        request.getRequestDispatcher("paginaPrincipal.jsp").forward(request, response);

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
        processRequest(request, response);
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
