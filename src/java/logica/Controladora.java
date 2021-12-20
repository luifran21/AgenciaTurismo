/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import persistencia.ControladoraPersistencia;

/**
 *
 * @author Luifran
 */
public class Controladora {
    
    //Controlador Cliente
    public void crearCliente(String nombre_cliente, String apellido_cliente, String direccion_cliente, String dni_cliente, Date fecha_nac_cliente, String nacionalidad_cliente, String celular_cliente, String email_cliente){
        Cliente cliente = new Cliente(null,nombre_cliente,apellido_cliente,direccion_cliente, dni_cliente, fecha_nac_cliente, nacionalidad_cliente, celular_cliente, email_cliente);
        
        ControladoraPersistencia control = new ControladoraPersistencia();
        control.crearCliente(cliente);
        
    }
    public List<Cliente> consultarClientes(){
        ControladoraPersistencia control = new ControladoraPersistencia();
        return control.consultarClientes();
    }
    public Cliente consultarCliente(String id){
        ControladoraPersistencia control = new ControladoraPersistencia();
        
        return control.consultarCliente(id);
    }
    public void actualizarCliente(Cliente cliente){
        ControladoraPersistencia control= new ControladoraPersistencia();
        control.updateCliente(cliente);
    }

    public void eliminarCliente(String id) {
        ControladoraPersistencia control = new ControladoraPersistencia();
        control.eliminarCliente(id);
    }
    
    //Empleado 
    
    Usuario user = new Usuario();
    Empleado empleado = new Empleado();
    
    public void crearEmpleado(String nombre_empleado, String apellido_empleado, String direccion_empleado, String dni_empleado, Date fecha_nac_empleado, String nacionalidad_empleado, String celular_empleado, String email_empleado, String cargo, double sueldo, String usuario, String clave) {
        
        empleado.setNombre_empleado(nombre_empleado);
        empleado.setApellido_empleado(apellido_empleado);
        empleado.setDireccion_empleado(direccion_empleado);
        empleado.setDni_empleado(dni_empleado);
        empleado.setFecha_nac_empleado(fecha_nac_empleado);

        empleado.setNacionalidad_empleado(nacionalidad_empleado);
        empleado.setCelular_empleado(celular_empleado);
        empleado.setEmail_empleado(email_empleado);
        empleado.setCargo(cargo);
        empleado.setSueldo(sueldo);
        
        user.setUsername(usuario);
        user.setClave(clave);
        
        empleado.setUsuario(user);
        
        ControladoraPersistencia control = new ControladoraPersistencia();
        control.crearEmpleado(empleado, user);
        
        
    }

    public List<Empleado> consultarEmpleados() {
        ControladoraPersistencia control = new ControladoraPersistencia();
        return control.consultarEmpleados();
    }
    public Empleado consultarEmpleado(int id){
        ControladoraPersistencia control = new ControladoraPersistencia();
        return control.consultarEmpleado(id);
    }
    
    //Usuario
    
    ControladoraPersistencia controlUsuario = new ControladoraPersistencia();
    public boolean verificarUsuario(String user, String pass) {
        boolean result = false;
        List<Usuario> listaUsuarios= new ArrayList<>();
        listaUsuarios= controlUsuario.consultarUsuarios();
        
        if(!(listaUsuarios.isEmpty())){
            for(Usuario us: listaUsuarios){
                if(us.getUsername().equals(user) && us.getClave().equals(pass))
                    result= true;
            }
        }else{
            result= false;
        }
        
        return result;
    }
    
    //Servicio
    
    public void crearServicio(Date fecha_servicio, String nombre_servicio, String descripcion,String destino, double costo_servicio){
        
        Servicio servicio = new Servicio(null,fecha_servicio, nombre_servicio, descripcion, destino, costo_servicio);
        ControladoraPersistencia control = new ControladoraPersistencia();
        control.crearServicio(servicio);
        
    }

    public void eliminarServicio(String id) {
        ControladoraPersistencia control = new ControladoraPersistencia();
        control.eliminarServicio(id);
    }

    public Servicio consultarServicio(String id) {
        ControladoraPersistencia control = new ControladoraPersistencia();
        return control.consultarServicio(id);
    }
    public List<Servicio> consultarServicios(){
        ControladoraPersistencia control = new ControladoraPersistencia();
        return control.consultarServicios();
    }
    public void actualizarServicio(Servicio servicio) {
        ControladoraPersistencia control = new ControladoraPersistencia();
        control.updateServicio(servicio);
    }
    
    //Paquete
    
    ControladoraPersistencia controlPaquete = new ControladoraPersistencia();
    
    public void crearPaquete(List<Servicio> listaServicios, double costo){
        Paquete paqueteTuristico = new Paquete(null, costo);
        paqueteTuristico.setServicios(listaServicios);
        
        controlPaquete.crearPaquete(paqueteTuristico);
    }
    
    public List<Paquete> consultarPaquetes(){
        return controlPaquete.consultarPaquetes();
    }

    public void eliminarPaquete(String id) {
        controlPaquete.eliminarPaquete(id);
    }

    public Paquete consultarPaquete(String idPaquete) {
        return controlPaquete.consultarPaquete(idPaquete);
    }

    public void actualizarPaquete(Paquete paquete) {
        controlPaquete.updatePaquete(paquete);
    }
    
    //Venta
    
    ControladoraPersistencia controlVenta = new ControladoraPersistencia();

    public void crearVenta(Date fecha, Cliente cliente, Servicio servicio, String pago, Empleado empleado, Paquete paquete) {
        Venta venta = new Venta();
        //venta.setNum_venta(0);
        venta.setCliente(cliente);
        venta.setEmpleado(empleado);
        venta.setFecha_venta(fecha);
        venta.setMedio_pago(pago);
        venta.setServicio(servicio);
        venta.setPaquete(paquete);
        controlVenta.crearVenta(venta);
    }
    public void crearVenta(Date fecha, Cliente cliente, Servicio servicio, String pago, Empleado empleado) {
        Venta venta = new Venta();
        //venta.setNum_venta(0);
        venta.setCliente(cliente);
        venta.setEmpleado(empleado);
        venta.setFecha_venta(fecha);
        venta.setMedio_pago(pago);
        venta.setServicio(servicio);
        venta.setPaquete(null);
        controlVenta.crearVenta(venta);
    }
    public void crearVenta(Date fecha, Cliente cliente, String pago, Empleado empleado, Paquete paquete) {
        Venta venta = new Venta();
        //venta.setNum_venta(0);
        venta.setCliente(cliente);
        venta.setEmpleado(empleado);
        venta.setFecha_venta(fecha);
        venta.setMedio_pago(pago);
        venta.setServicio(null);
        venta.setPaquete(paquete);
        controlVenta.crearVenta(venta);
    }
    public List<Venta> consultarVentas(){
        return controlVenta.consultarVentas();
    }
    public Venta consultarVenta(int id){
        return controlVenta.consultarVenta(id);
    }

    public void actualizarVenta(Venta venta) {
        try{
            controlVenta.updateVenta(venta);
        }catch (Exception ex) {
            
        }
    }

    public void eliminarVenta(int idVenta) {
        controlVenta.eliminarVenta(idVenta);
    }
}
