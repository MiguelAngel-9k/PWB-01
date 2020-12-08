/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.pw.proyect.Controladores;

import com.mycompany.pw.proyect.Dao.usuarioDao;
import com.mycompany.pw.proyect.Modelos.modeloUsuario;
import com.mycompany.pw.proyect.Utils.fileUtils;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
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
@WebServlet(name = "registrarseControlador", urlPatterns = {"/registrarseControlador"})
@MultipartConfig(maxFileSize = 10000 * 1000 * 5, maxRequestSize = 1000 * 1000 * 25, fileSizeThreshold = 1000 * 1000)
public class registrarseControlador extends HttpServlet {

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
        //obtengo el nombre y la contraeña del form
        String nombreUsuario = request.getParameter("INnombreUsuario");
        String contrasenia = request.getParameter("INcontrasenia");

        //instancio mi modelo usuario para enviarselo al DAO
        modeloUsuario usuario = new modeloUsuario();
        //le doy los valoes de mis parametros
        usuario.setNombreUsuario(nombreUsuario);
        usuario.setContrasenia(contrasenia);

        // Obtenemos los usuarios del DAO
        modeloUsuario logeado = usuarioDao.getUser(usuario);

        if (logeado != null && usuario.getIdUsuario() != 0) {
            // Lo agregamos como atributo al request
            request.setAttribute("usuario", usuario);
            // Enviamos el request a index.jsp con la informacion   
            //request.getRequestDispatcher("publicarContenido.jsp").forward(request, response);
            request.getRequestDispatcher("perfilUsuario.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("registroUsuarios.jsp").forward(request, response);
        }
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
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellido");
        String redSocial = request.getParameter("RedSocial");
        String rolUsuario = request.getParameter("rolUsuario");
        String email = request.getParameter("email");
        String contrasenia = request.getParameter("password");
        String nombreUsuario = request.getParameter("nombreUsuario");
        String path = "D:/VSproyects/PWB-01/pw-proyect/src/main/webapp/";
        File fileSaveDir = new File(path + fileUtils.RUTE_USER_IMAGE);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        Part file = request.getPart("imagen");
        if ("application/octet-stream".equals(file.getContentType())) {
            modeloUsuario usuario = new modeloUsuario(nombre, apellidos, email, contrasenia, nombreUsuario, "assets/UserIcon/usuario.png", rolUsuario, redSocial);
            if (usuarioDao.insertarUsuario(usuario) == 1) {
                request.setAttribute("usuario", usuario);
                // Enviamos el request a index.jsp con la informacion  
                usuarioDao.buscarUsuario(usuario);
                if (usuario != null) {
                    request.getRequestDispatcher("perfilUsuario.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("fail.jsp").forward(request, response);
                }

            } else {
                request.getRequestDispatcher("fail.jsp").forward(request, response);
            }
        } else {
            String contentType = file.getContentType();
            String nameImage = file.getName() + System.currentTimeMillis() + fileUtils.GetExtension(contentType);
            String fullPath = path + fileUtils.RUTE_USER_IMAGE + "/" + nameImage;
            file.write(fullPath);
            modeloUsuario usuario = new modeloUsuario(nombre, apellidos, email, contrasenia, nombreUsuario, fileUtils.RUTE_USER_IMAGE + "/" + nameImage, rolUsuario, redSocial);
            if (usuarioDao.insertarUsuario(usuario) == 1) {
                request.setAttribute("usuario", usuario);
                // Enviamos el request a index.jsp con la informacion  
                usuarioDao.buscarUsuario(usuario);
                if (usuario != null) {
                    request.getRequestDispatcher("perfilUsuario.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("fail.jsp").forward(request, response);
                }

            } else {
                request.getRequestDispatcher("fail.jsp").forward(request, response);
            }
        }
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
