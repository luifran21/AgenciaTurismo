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
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Servicio;

/**
 *
 * @author Luifran
 */
@WebServlet(name = "SvServicioModificar", urlPatterns = {"/SvServicioModificar"})
public class SvServicioModificar extends HttpServlet {
Controladora controlServicio = new Controladora();
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
        
        SimpleDateFormat sf= new SimpleDateFormat("yyyy-MM-dd");
        String id= request.getParameter("id_servicio");
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String f= request.getParameter("fecha");
        Date fecha = null;
    try {
        fecha = sf.parse(f);
    } catch (ParseException ex) {
        Logger.getLogger(SvServicio.class.getName()).log(Level.SEVERE, null, ex);
    }
        double costo = Double.parseDouble(request.getParameter("costo"));
        
        Servicio servicio= controlServicio.consultarServicio(id);
        servicio.setNombre_servicio(nombre);
        servicio.setDescripcion(descripcion);
        servicio.setFecha_servicio(fecha);
        servicio.setCosto_servicio(costo);
        controlServicio.actualizarServicio(servicio);
        
        response.sendRedirect("FormServicioGestionar.jsp");
        
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
        String id= request.getParameter("servicio");
        Servicio serv = controlServicio.consultarServicio(id);
        
        response.sendRedirect("FormServicioActualizar.jsp");
        
        HttpSession misession = request.getSession();
        misession.setAttribute("servicio", serv);
        
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
