/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.pw.proyect.Controladores;

import com.mycompany.pw.proyect.Dao.categoriasDao;
import com.mycompany.pw.proyect.Dao.noticiaDao;
import com.mycompany.pw.proyect.Dao.usuarioDao;
import com.mycompany.pw.proyect.Modelos.categoriasModelo;
import com.mycompany.pw.proyect.Modelos.modeloNoticia;
import com.mycompany.pw.proyect.Modelos.modeloUsuario;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "editarNoticiaControlador", urlPatterns = {"/editarNoticiaControlador"})
public class editarNoticiaControlador extends HttpServlet {

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
//            out.println("<title>Servlet editarNoticiaControlador</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet editarNoticiaControlador at " + request.getContextPath() + "</h1>");
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

        int idNoticia = Integer.parseInt(request.getParameter("idNoticia"));
        String autor = request.getParameter("autor");

        modeloNoticia noticia = new modeloNoticia();
        noticia.setNoticia(idNoticia);
        noticia = noticiaDao.getNoticia(autor, idNoticia);
        if (noticia == null) {
            request.getRequestDispatcher("fail.jsp").forward(request, response);
        }

        modeloUsuario usuario = new modeloUsuario();
        usuario.setNombreUsuario(autor);
        if (usuarioDao.buscarUsuario(usuario) == null) {
            request.getRequestDispatcher("fail.jsp").forward(request, response);
        }

        List<categoriasModelo> categorias = categoriasDao.getCategorias();
        if (categorias == null) {
            request.getRequestDispatcher("fail.jsp").forward(request, response);
        }

        //request.setAttribute("categirias", categorias);
        request.setAttribute("noticia", noticia);
        request.setAttribute("usuario", usuario);
        request.getRequestDispatcher("editarNoticia.jsp").forward(request, response);        

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

        modeloNoticia noticia = new modeloNoticia();
        int idNoticia = Integer.parseInt(request.getParameter("idNoticiaTitulo"));
        String autor = request.getParameter("TituloAutor");
        noticia.setAutor(autor);
        String opcion = request.getParameter("opcion");
        String valor;

        switch (opcion) {
            case "Titulo":
                valor = request.getParameter("editTitulo");
                if (!noticiaDao.getIdNoticia(noticia)) {
                    return;
                }
                if (noticiaDao.getNoticia(noticia.getAutor(), idNoticia) == null) {
                    return;
                }
                noticiaDao.editarNoticia(noticia, 1);
                break;
            default:
                break;
        }

        modeloUsuario usuario = new modeloUsuario();
        usuario.setNombreUsuario(autor);

        if (usuarioDao.buscarUsuario(usuario) == null) {
            request.getRequestDispatcher("fail.jsp").forward(request, response);
        }

        request.setAttribute("usuario", usuario);
        request.setAttribute("noticias", noticia);
        request.getRequestDispatcher("noticiasPendientes.jsp").forward(request, response);

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
