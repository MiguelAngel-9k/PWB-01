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
import com.mycompany.pw.proyect.Utils.conexionDB;
import com.mycompany.pw.proyect.Utils.fileUtils;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author mike_
 */
@WebServlet(name = "publicarNoticiaControlador", urlPatterns = {"/publicarNoticiaControlador"})
@MultipartConfig(maxFileSize = 1000 * 1000 * 5, maxRequestSize = 1000 * 1000 * 25, fileSizeThreshold = 1000 * 1000)
public class publicarNoticiaControlador extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet publicarNoticiaControlador</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet publicarNoticiaControlador at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }

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
        //processRequest(request, response);

        List<modeloComentario> comentarios = new ArrayList<>();

        modeloUsuario autor = new modeloUsuario();

        int idNoticia = Integer.parseInt(request.getParameter("idNoticia"));
        autor.setNombreUsuario(request.getParameter("autorNoticia"));
        modeloNoticia noticia = noticiaDao.getNoticia(autor.getNombreUsuario(), idNoticia);
        if (noticia == null) {
            request.getRequestDispatcher("publicarContenido.jsp").forward(request, response);
        }

        if (usuarioDao.buscarUsuario(autor) == null) {
            return;
        }

        comentarios = comentarioDao.obtenerComentarios(idNoticia);
        if (comentarios == null) {
            request.getRequestDispatcher("fail.jsp").forward(request, response);
        }

        request.setAttribute("comentarios", comentarios);
        request.setAttribute("noticia", noticia);
        request.setAttribute("usuario", autor);
        request.getRequestDispatcher("noticiaCompleta.jsp").forward(request, response);
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
        //obtenemos la informacion del formulario de la noticiam, primero guardamos las imagenes
        modeloNoticia noticia = new modeloNoticia();
        noticia.setTitulo(request.getParameter("titulo"));
        noticia.setDecripcionCorta(request.getParameter("descripcionCorta"));
        noticia.setContenido(request.getParameter("Contenido"));
        noticia.setCategoria(request.getParameter("categoria"));
        noticia.setAutor(request.getParameter("autor"));

        if (noticiaDao.insertarNoticia(noticia) == 0) {
            request.getRequestDispatcher("fail.jsp").forward(request, response);
        }

        String[] imagenes = new String[3];
        String[] elementos = new String[3];
        elementos[0] = "imagenCabecera";
        elementos[1] = "imagenCentral";
        elementos[2] = "imagenFinal";
        String path = request.getServletContext().getRealPath("");
        File fileSaveDir = new File(path + fileUtils.RUTE_USER_IMAGE);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }

        for (int imgPos = 0; imgPos < 3; imgPos++) {
            Part file = request.getPart(elementos[imgPos]);
            String contentType = file.getContentType();
            String nameImage = file.getName() + System.currentTimeMillis() + fileUtils.GetExtension(contentType);
            String fullPath = path + fileUtils.RUTE_USER_IMAGE + "/" + nameImage;
            file.write(fullPath);
            imagenes[imgPos] = fileUtils.RUTE_USER_IMAGE + "/" + nameImage;
        }

        noticia.setImagenes(imagenes);

        //for(int i = 0; i<3; i++)
        if (noticiaDao.setImagenes(noticia, 0) == 0) {
            request.getRequestDispatcher("fail.jsp").forward(request, response);
        };

        request.setAttribute("prevNoticia", noticia);

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
