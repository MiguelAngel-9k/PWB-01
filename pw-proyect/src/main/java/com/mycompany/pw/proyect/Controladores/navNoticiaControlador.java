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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author mike_
 */
public class navNoticiaControlador extends HttpServlet {

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
//            out.println("<title>Servlet navNoticiaControlador</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet navNoticiaControlador at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }

           String[] nombreUsuario = request.getParameterValues("getName");
           //Part  IMGusuario = request.getPart("imagenUsuarioSM");

           modeloUsuario usuario = new modeloUsuario();
           usuario.setNombreUsuario(nombreUsuario[0]);
           //validar si lo encontro
          List <modeloNoticia> noticias = noticiaDao.getPrevNoticia(usuario.getNombreUsuario());
           if(noticias==null){               
               return;
           }                                
           if(usuarioDao.buscarUsuario(usuario)==null){
               return;
           }
           
           request.setAttribute("usuario",usuario);
           request.setAttribute("noticias", noticias);
           request.getRequestDispatcher("publicarContenido.jsp").forward(request, response);   
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
        //vamos a obtener la noticia completa
        //hay que casteralo a int
       
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
        String[] nombreUsuario = request.getParameterValues("getName");
           //Part  IMGusuario = request.getPart("imagenUsuarioSM");

           modeloUsuario usuario = new modeloUsuario();
           usuario.setNombreUsuario(nombreUsuario[0]);
           //validar si lo encontro
          List <modeloNoticia> noticias = noticiaDao.getPrevNoticia(usuario.getNombreUsuario());
           if(noticias==null){               
               return;
           }                                
           if(usuarioDao.buscarUsuario(usuario)==null){
               return;
           }
           
           request.setAttribute("usuario",usuario);
           request.setAttribute("noticias", noticias);
           request.getRequestDispatcher("publicarContenido.jsp").forward(request, response);   
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
