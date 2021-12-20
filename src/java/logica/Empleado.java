/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Luifran
 */
@Entity
public class Empleado implements Serializable{
    @Id @GeneratedValue(strategy=GenerationType.SEQUENCE)
    private int id_empleado;
    @Basic
    private String nombre_empleado;
    private String apellido_empleado;
    String direccion_empleado;
    private String dni_empleado;
    @Temporal(TemporalType.DATE)
    private Date fecha_nac_empleado;
    private String nacionalidad_empleado;
    private String celular_empleado;
    private String email_empleado;
    private String cargo;
    private double sueldo;
    @OneToOne
    private Usuario usuario;

    public Empleado(int id_empleado, String nombre_empleado, String apellido_empleado, String direccion_empleado, String dni_empleado, Date fecha_nac_empleado, String nacionalidad_empleado, String celular_empleado, String email_empleado, String cargo, double sueldo, Usuario usuario) {
        this.id_empleado = id_empleado;
        this.nombre_empleado = nombre_empleado;
        this.apellido_empleado = apellido_empleado;
        this.direccion_empleado = direccion_empleado;
        this.dni_empleado = dni_empleado;
        this.fecha_nac_empleado = fecha_nac_empleado;
        this.nacionalidad_empleado = nacionalidad_empleado;
        this.celular_empleado = celular_empleado;
        this.email_empleado = email_empleado;
        this.cargo = cargo;
        this.sueldo = sueldo;
        this.usuario = usuario;
    }

    public Empleado() {
    }

    
    
    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public String getNombre_empleado() {
        return nombre_empleado;
    }

    public void setNombre_empleado(String nombre_empleado) {
        this.nombre_empleado = nombre_empleado;
    }

    public String getApellido_empleado() {
        return apellido_empleado;
    }

    public void setApellido_empleado(String apellido_empleado) {
        this.apellido_empleado = apellido_empleado;
    }

    public String getDireccion_empleado() {
        return direccion_empleado;
    }

    public void setDireccion_empleado(String direccion_empleado) {
        this.direccion_empleado = direccion_empleado;
    }

    public String getDni_empleado() {
        return dni_empleado;
    }

    public void setDni_empleado(String dni_empleado) {
        this.dni_empleado = dni_empleado;
    }

    public Date getFecha_nac_empleado() {
        return fecha_nac_empleado;
    }

    public void setFecha_nac_empleado(Date fecha_nac_empleado) {
        this.fecha_nac_empleado = fecha_nac_empleado;
    }

    public String getNacionalidad_empleado() {
        return nacionalidad_empleado;
    }

    public void setNacionalidad_empleado(String nacionalidad_empleado) {
        this.nacionalidad_empleado = nacionalidad_empleado;
    }

    public String getCelular_empleado() {
        return celular_empleado;
    }

    public void setCelular_empleado(String celular_empleado) {
        this.celular_empleado = celular_empleado;
    }

    public String getEmail_empleado() {
        return email_empleado;
    }

    public void setEmail_empleado(String email_empleado) {
        this.email_empleado = email_empleado;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    
}
