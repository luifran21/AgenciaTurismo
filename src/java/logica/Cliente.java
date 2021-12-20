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
public class Cliente implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String id_cliente;
    @Basic
    private String nombre_cliente;
    private String apellido_cliente;
    String direccion_cliente;
    private String dni_cliente;
    @Temporal(TemporalType.DATE)
    private Date fecha_nac_cliente;
    private String nacionalidad_cliente;
    private String celular_cliente;
    private String email_cliente;

    public Cliente(String id_cliente, String nombre_cliente, String apellido_cliente, String direccion_cliente, String dni_cliente, Date fecha_nac_cliente, String nacionalidad_cliente, String celular_cliente, String email_cliente) {
        this.id_cliente = id_cliente;
        this.nombre_cliente = nombre_cliente;
        this.apellido_cliente = apellido_cliente;
        this.direccion_cliente = direccion_cliente;
        this.dni_cliente = dni_cliente;
        this.fecha_nac_cliente = fecha_nac_cliente;
        this.nacionalidad_cliente = nacionalidad_cliente;
        this.celular_cliente = celular_cliente;
        this.email_cliente = email_cliente;
    }

    public Cliente() {
    }
    
    public String getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(String id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getNombre_cliente() {
        return nombre_cliente;
    }

    public void setNombre_cliente(String nombre_cliente) {
        this.nombre_cliente = nombre_cliente;
    }

    public String getApellido_cliente() {
        return apellido_cliente;
    }

    public void setApellido_cliente(String apellido_cliente) {
        this.apellido_cliente = apellido_cliente;
    }

    public String getDireccion_cliente() {
        return direccion_cliente;
    }

    public void setDireccion_cliente(String direccion_cliente) {
        this.direccion_cliente = direccion_cliente;
    }

    public String getDni_cliente() {
        return dni_cliente;
    }

    public void setDni_cliente(String dni_cliente) {
        this.dni_cliente = dni_cliente;
    }

    public Date getFecha_nac_cliente() {
        return fecha_nac_cliente;
    }

    public void setFecha_nac_cliente(Date fecha_nac_cliente) {
        this.fecha_nac_cliente = fecha_nac_cliente;
    }

    public String getNacionalidad_cliente() {
        return nacionalidad_cliente;
    }

    public void setNacionalidad_cliente(String nacionalidad_cliente) {
        this.nacionalidad_cliente = nacionalidad_cliente;
    }

    public String getCelular_cliente() {
        return celular_cliente;
    }

    public void setCelular_cliente(String celular_cliente) {
        this.celular_cliente = celular_cliente;
    }

    public String getEmail_cliente() {
        return email_cliente;
    }

    public void setEmail_cliente(String email_cliente) {
        this.email_cliente = email_cliente;
    }
    
    
}
