/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author lftv9
 */
@Embeddable
public class PartidoPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "mesa_id")
    private int mesaId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "parcipante_1")
    private int parcipante1;
    @Basic(optional = false)
    @NotNull
    @Column(name = "parcipante_2")
    private int parcipante2;

    public PartidoPK() {
    }

    public PartidoPK(int mesaId, int parcipante1, int parcipante2) {
        this.mesaId = mesaId;
        this.parcipante1 = parcipante1;
        this.parcipante2 = parcipante2;
    }

    public int getMesaId() {
        return mesaId;
    }

    public void setMesaId(int mesaId) {
        this.mesaId = mesaId;
    }

    public int getParcipante1() {
        return parcipante1;
    }

    public void setParcipante1(int parcipante1) {
        this.parcipante1 = parcipante1;
    }

    public int getParcipante2() {
        return parcipante2;
    }

    public void setParcipante2(int parcipante2) {
        this.parcipante2 = parcipante2;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) mesaId;
        hash += (int) parcipante1;
        hash += (int) parcipante2;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PartidoPK)) {
            return false;
        }
        PartidoPK other = (PartidoPK) object;
        if (this.mesaId != other.mesaId) {
            return false;
        }
        if (this.parcipante1 != other.parcipante1) {
            return false;
        }
        if (this.parcipante2 != other.parcipante2) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.PartidoPK[ mesaId=" + mesaId + ", parcipante1=" + parcipante1 + ", parcipante2=" + parcipante2 + " ]";
    }
    
}
