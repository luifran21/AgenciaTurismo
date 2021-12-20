/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;

/**
 *
 * @author Luifran
 */
@WebServlet(name = "SvEmpleado", urlPatterns = {"/SvEmpleado"})
public class SvEmpleado extends HttpServlet {
Controladora controlEmpleado =new Controladora();
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
        processRequest(request, response);
        SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
        
        String nombre= request.getParameter("nombre");
        String apellido= request.getParameter("apellido");
        String direccion= request.getParameter("direccion");
        String fecha = request.getParameter("fecha_nac");
        Date fechaNacimiento=null;
        try {
            fechaNacimiento = formatoFecha.parse(fecha);
        } catch (ParseException ex) {
           Logger.getLogger(SvEmpleado.class.getName()).log(Level.SEVERE, null, ex);
        }
        String dni= request.getParameter("dni");
        String nacionalidad= request.getParameter("nacionalidad");
        String celular= request.getParameter("celular");
        String email= request.getParameter("email");
        String cargo= request.getParameter("cargo");
        double sueldo= Double.parseDouble(request.getParameter("sueldo"));
        String usuario= request.getParameter("usuario");
        String clave= request.getParameter("clave");
        
    
        controlEmpleado.crearEmpleado(nombre, apellido, direccion, dni, fechaNacimiento, nacionalidad, celular, email, cargo, sueldo, usuario, clave);
        
    
        
        response.sendRedirect("index.jsp?si_entra");
       
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
