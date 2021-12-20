/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.*;
import javax.persistence.ManyToMany;

/**
 *
 * @author Luifran
 */
@Entity
public class Paquete implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String codigo_paquete;
    @Basic
    private double costo_paquete;
    @ManyToMany
    List<Servicio>servicios= new ArrayList<>();

    public Paquete(String codigo_paquete, double costo_paquete) {
        this.codigo_paquete = codigo_paquete;
        this.costo_paquete = costo_paquete;
    }
    

    public Paquete() {
    }

    public String getCodigo_paquete() {
        return codigo_paquete;
    }

    public void setCodigo_paquete(String codigo_paquete) {
        this.codigo_paquete = codigo_paquete;
    }

    public double getCosto_paquete() {
        return costo_paquete;
    }

    public void setCosto_paquete(double costo_paquete) {
        this.costo_paquete = costo_paquete;
    }

    public List<Servicio> getServicios() {
        return servicios;
    }

    public void setServicios(List<Servicio> servicios) {
        this.servicios = servicios;
    }
    
    
    
}
