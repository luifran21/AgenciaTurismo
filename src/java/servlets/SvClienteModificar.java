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
import logica.Cliente;
import logica.Controladora;

/**
 *
 * @author Luifran
 */
@WebServlet(name = "SvModificarCliente", urlPatterns = {"/SvModificarCliente"})
public class SvClienteModificar extends HttpServlet {
    Controladora controlCliente = new Controladora();

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
        
        SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-dd-MM");
        String id= request.getParameter("id");
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
        
        Cliente cliente = controlCliente.consultarCliente(id);
        cliente.setApellido_cliente(apellido);
        cliente.setNombre_cliente(nombre);
        cliente.setDireccion_cliente(direccion);
        cliente.setFecha_nac_cliente(fechaNacimiento);
        cliente.setDni_cliente(dni);
        cliente.setNacionalidad_cliente(nacionalidad);
        cliente.setCelular_cliente(celular);
        cliente.setEmail_cliente(email);
        
        controlCliente.actualizarCliente(cliente);
        
    
        
        response.sendRedirect("FormClienteGestionar.jsp?si_actualiza");
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
        
        String idCliente= request.getParameter("cliente");
        //Controladora controlCliente = new Controladora();
        
        Cliente cliente = controlCliente.consultarCliente(idCliente);
        
        HttpSession misession = request.getSession();
        misession.setAttribute("cliente", cliente);
        response.sendRedirect("FormClienteActualizar.jsp");
        
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
