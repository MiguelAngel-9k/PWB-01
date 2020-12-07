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
import com.mycompany.pw.proyect.Utils.fileUtils;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "editarImagenNoticiaControlador", urlPatterns = {"/editarImagenNoticiaControlador"})
@MultipartConfig(maxFileSize = 1000 * 1000 * 5, maxRequestSize = 1000 * 1000 * 25, fileSizeThreshold = 1000 * 1000)
public class editarImagenNoticiaControlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet editarImagenNoticiaControlador</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet editarImagenNoticiaControlador at " + request.getContextPath() + "</h1>");
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

        String id = request.getParameter("idNoticiaImagen");
        int _idNoticia = 0;
        if (id != null) {
            _idNoticia = Integer.parseInt(id);
        }

        // int idNoticia = Integer.parseInt(request.getParameter("idNoticiaImagen"));
        String autor = request.getParameter("autor");

        //imagenes nuevas
        String[] imagenesNuevas = new String[3];
        imagenesNuevas[0] = "Cabecera";
        imagenesNuevas[1] = "Central";
        imagenesNuevas[2] = "Final";
        //image/jpeg
        //imagenes existentes
        //application/octet-stream
        String[] imagenesViejas = new String[3];
        imagenesViejas[0] = request.getParameter("imagenCabecera");
        imagenesViejas[1] = request.getParameter("imagenCentral");
        imagenesViejas[2] = request.getParameter("imagenFinal");

        //obtener la direccion del fichero para las imagenes
        String path = "D:/VSproyects/PWB-01/pw-proyect/src/main/webapp/";
        File fileSaveDir = new File(path + fileUtils.RUTE_USER_IMAGE);

//        if (!fileSaveDir.exists()) {
//            fileSaveDir.mkdir();
//        }
        for (int imgPos = 0; imgPos < 3; imgPos++) {
            Part file = request.getPart(imagenesNuevas[imgPos]);
            String contentType = file.getContentType();
            if ( !"application/octet-stream".equals(file.getContentType())) {
                String nameImage = file.getName() + System.currentTimeMillis() + fileUtils.GetExtension(contentType);
                String fullPath = path + fileUtils.RUTE_USER_IMAGE + "/" + nameImage;
                file.write(fullPath);
                imagenesNuevas[imgPos] = fileUtils.RUTE_USER_IMAGE + "/" + nameImage;
                noticiaDao.editarImagenNoticia(_idNoticia, imagenesNuevas[imgPos], imagenesViejas[imgPos]);
            }
        }

        modeloUsuario usuario = new modeloUsuario();
        usuario.setNombreUsuario(autor);
        usuario = usuarioDao.buscarUsuario(usuario);        
        modeloNoticia noticia = noticiaDao.getNoticia(autor, _idNoticia);
        if(usuario != null && noticia != null){
            request.setAttribute("usuario", usuario);
            request.setAttribute("noticia", noticia);
            request.getRequestDispatcher("editarNoticia.jsp").forward(request, response);
        }
        
//        if (cabecera != null) {
//
//            Part file = request.getPart("Cabecera");
//            String contentType = file.getContentType();
//            String nameImage = file.getName() + System.currentTimeMillis() + fileUtils.GetExtension(contentType);
//            String fullPath = path + fileUtils.RUTE_USER_IMAGE + "/" + nameImage;
//            file.write(fullPath);
//            
//            noticiaDao.editarImagenNoticia(0, fileUtils.RUTE_USER_IMAGE + "/" + nameImage, imagenCabecera);
//        }
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
