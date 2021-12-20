/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Paquete;
import logica.Servicio;

/**
 *
 * @author Luifran
 */
@WebServlet(name = "SvPaqueteModificar", urlPatterns = {"/SvPaqueteModificar"})
public class SvPaqueteModificar extends HttpServlet {

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
        
        Controladora control = new Controladora();
        
        List<Servicio>listaServicios = new ArrayList<>();
        String idPaquete = request.getParameter("idPaquete");
        int cantidadServicios= Integer.parseInt(request.getParameter("cantServicios"));
        String servicio;
        
        for(int i=0;i<cantidadServicios;i++){
            String nombreParametro= "servicios"+i;
            servicio = request.getParameter(nombreParametro);
            
                listaServicios.add(control.consultarServicio(servicio));
            
        }
        double costo=0;
        for(Servicio serv:listaServicios){
            costo= (costo+serv.getCosto_servicio());
        }
        costo = costo-costo*0.1;
        Paquete paquete = control.consultarPaquete(idPaquete);
        paquete.setCosto_paquete(costo);
        paquete.setServicios(listaServicios);
        control.actualizarPaquete(paquete);
        response.sendRedirect("FormPaqueteGestionar.jsp");
        
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
        Controladora control = new Controladora();
        
        String idPaquete= request.getParameter("paquete");
        
        Paquete miPaquete = control.consultarPaquete(idPaquete);
        
        HttpSession misession = request.getSession();
        misession.setAttribute("paquete",miPaquete);
        
        response.sendRedirect("FormPaqueteActualizar.jsp");
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
