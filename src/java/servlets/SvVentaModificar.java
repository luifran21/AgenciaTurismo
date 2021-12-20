/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Cliente;
import logica.Controladora;
import logica.Empleado;
import logica.Paquete;
import logica.Servicio;
import logica.Venta;

/**
 *
 * @author Luifran
 */
@WebServlet(name = "SvVentaModificar", urlPatterns = {"/SvVentaModificar"})
public class SvVentaModificar extends HttpServlet {

    Controladora control = new Controladora();
    
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
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        
        int idVenta = Integer.parseInt(request.getParameter("idVenta"));
        String fechaVenta= request.getParameter("fecha");
        Date fecha= null;
        try{
            fecha = sf.parse(fechaVenta);
        }catch (Exception ex) {
            
        }
        String idcliente = request.getParameter("cliente");
        String idServicio = request.getParameter("servicio");
        String idPaquete = request.getParameter("paquete");
        String pago = request.getParameter("medio_pago");
        int idEmpleado = Integer.parseInt(request.getParameter("empleado"));
        
        Empleado empleado = control.consultarEmpleado(idEmpleado);
        Cliente cliente = control.consultarCliente(idcliente);
        Venta venta = control.consultarVenta(idVenta);
        venta.setCliente(cliente);
        venta.setEmpleado(empleado);
        venta.setFecha_venta(fecha);
        venta.setMedio_pago(pago);
        venta.setServicio(null);
        venta.setPaquete(null);
        
        if(idServicio!=null){
            Servicio servicio = control.consultarServicio(idServicio);
           venta.setServicio(servicio);
           control.actualizarVenta(venta);
            //response.sendRedirect("index.jsp?servicio");
        }else if(idPaquete!=null){
            Paquete paquete = control.consultarPaquete(idPaquete);
            venta.setPaquete(paquete);
            control.actualizarVenta(venta);
            //response.sendRedirect("index.jsp?paquete");
        }
        
        
        
        response.sendRedirect("FormVentaGestionar.jsp");
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
        int id =Integer.parseInt(request.getParameter("venta"));
        Venta venta = new Venta();
        venta = control.consultarVenta(id);
        
        HttpSession sessionVenta= request.getSession();
        sessionVenta.setAttribute("venta", venta);
        
        response.sendRedirect("FormVentaActualizar.jsp");
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
