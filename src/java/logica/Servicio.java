
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.*;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Luifran
 */
@Entity
public class Servicio implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String codigo_servicio;
    @Basic
    @Temporal(TemporalType.DATE)
    private Date fecha_servicio;
    private String nombre_servicio;
    private String descripcion;
    private String destino;
    private double costo_servicio;

    public Servicio(String codigo_servicio, Date fecha_servicio, String nombre_servicio, String descripcion,String destino, double costo_servicio) {
        this.codigo_servicio = codigo_servicio;
        this.fecha_servicio = fecha_servicio;
        this.nombre_servicio = nombre_servicio;
        this.descripcion = descripcion;
        this.costo_servicio = costo_servicio;
        this.destino = destino;
    }

    public Servicio() {
    }

    public String getCodigo_servicio() {
        return codigo_servicio;
    }

    public void setCodigo_servicio(String codigo_servicio) {
        this.codigo_servicio = codigo_servicio;
    }

    public Date getFecha_servicio() {
        return fecha_servicio;
    }

    public void setFecha_servicio(Date fecha_servicio) {
        this.fecha_servicio = fecha_servicio;
    }

    public String getNombre_servicio() {
        return nombre_servicio;
    }

    public void setNombre_servicio(String nombre_servicio) {
        this.nombre_servicio = nombre_servicio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getCosto_servicio() {
        return costo_servicio;
    }

    public void setCosto_servicio(double costo_servicio) {
        this.costo_servicio = costo_servicio;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }
    
    
}
