/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Cliente;
import logica.Empleado;
import logica.Paquete;
import logica.Servicio;
import logica.Usuario;
import logica.Venta;

/**
 *
 * @author Luifran
 */
public class ControladoraPersistencia {
    
    //CODIGO PARA EL CRUD DE EMPLEADO
    EmpleadoJpaController controlEmpleado = new EmpleadoJpaController();
    UsuarioJpaController controlUsuario = new UsuarioJpaController();
    public void crearEmpleado(Empleado empleado, Usuario usuario){
        try{
            controlUsuario.create(usuario);
            controlEmpleado.create(empleado);
        }catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }    
    
    }
    public List<Empleado> consultarEmpleados() {
        return controlEmpleado.findEmpleadoEntities();
    }
    public Empleado consultarEmpleado(int id) {
        return controlEmpleado.findEmpleado(id);
    }
//-----------------------------------------------
    
    //CODIGO PARA EL  CRUD DE CLIENTE
    ClienteJpaController controlCliente = new ClienteJpaController();
    
    public void crearCliente(Cliente cliente){
        try{
            controlCliente.create(cliente);
        }catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public List<Cliente> consultarClientes(){
        return controlCliente.findClienteEntities();
    }
    public Cliente consultarCliente(String id){
        return controlCliente.findCliente(id);
    }
    public void eliminarCliente(String id){
        try{
            controlCliente.destroy(id);
        }catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void updateCliente(Cliente cliente){
        try{
            controlCliente.edit(cliente);
        }catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//----------------------------------------
    
    //CODIGO PARA EL CRUD DE SERVICIO
    ServicioJpaController controlServicio = new ServicioJpaController();
    public void crearServicio(Servicio servicio) {
        try{
            controlServicio.create(servicio);
        }catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public List<Servicio> consultarServicios(){
        return controlServicio.findServicioEntities(); 
    }
    public Servicio consultarServicio(String id){
        return controlServicio.findServicio(id);
    }
    public void updateServicio(Servicio servicio){
        try{
            controlServicio.edit(servicio);
        }catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void eliminarServicio(String id){
        try{
            controlServicio.destroy(id);
        }catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    //-----------------------------------------
    //CODIGO PARA EL CRUD DE PAQUETE
    PaqueteJpaController controlPaquete = new PaqueteJpaController();
    public void crearPaquete(Paquete paqueteTuristico) {
        try{
            controlPaquete.create(paqueteTuristico);
        }catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public List<Paquete> consultarPaquetes() {
        return controlPaquete.findPaqueteEntities();
    }
    public void eliminarPaquete(String id) {
        try{
            controlPaquete.destroy(id);
        }catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public Paquete consultarPaquete(String id) {
        return controlPaquete.findPaquete(id);
    }
    public void updatePaquete(Paquete paquete) {
        try{
            controlPaquete.edit(paquete);
        }catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    //-------------------------------------------
    
//CODIGO PARA EL CRUD DE VENTA
    VentaJpaController controlVenta = new VentaJpaController();
    public void crearVenta(Venta venta) {
        try{
            controlVenta.create(venta);
        }catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public List<Venta> consultarVentas() {
        return controlVenta.findVentaEntities();
    }
    public Venta consultarVenta(int id){
        return controlVenta.findVenta(id);
    }
    public void updateVenta(Venta venta) {
        try{
            controlVenta.edit(venta);
        }catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void eliminarVenta(int idVenta) {
        try{
            controlVenta.destroy(idVenta);
        }catch(Exception ex){
        Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    //CODIGO PARA EL CONTROL DE USUARIOS (CONTROL DE SESIONES DE USUARIOS)
    
    public List<Usuario> consultarUsuarios() {
        return controlUsuario.findUsuarioEntities();
    }

    

    

    

    

    

    

    

    

    

    



    
    
}
