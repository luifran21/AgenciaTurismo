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
import logica.Servicio;
import logica.Controladora;

/**
 *
 * @author Luifran
 */
@WebServlet(name = "SvPaquete", urlPatterns = {"/SvPaquete"})
public class SvPaquete extends HttpServlet {

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
        //PaqueteController controlPaquete = new PaqueteController();
        Controladora control = new Controladora();
        List<Servicio>listaServicios = new ArrayList<>();
        String servicio= request.getParameter("servicios");
        int cantidadServicios= Integer.parseInt(request.getParameter("cantServicios"));
        listaServicios.add(control.consultarServicio(servicio));
        
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
        control.crearPaquete(listaServicios, costo);
        response.sendRedirect("FormPaqueteGestionar.jsp");
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
