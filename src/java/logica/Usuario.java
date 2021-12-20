/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.*;

/**
 *
 * @author Luifran
 */
@Entity
public class Usuario implements Serializable {
    @Id@GeneratedValue(strategy=GenerationType.SEQUENCE)
    private int id_usuario;
    @Basic
    private String username;
    private String clave;

    public Usuario(int id_usuario, String username, String clave) {
        this.id_usuario = id_usuario;
        this.username = username;
        this.clave = clave;
    }

    public Usuario() {
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }
    
    
}
