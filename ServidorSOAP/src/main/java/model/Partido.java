/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author lftv9
 */
@Entity
@Table(name = "partido")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Partido.findAll", query = "SELECT p FROM Partido p"),
    @NamedQuery(name = "Partido.findByMesaId", query = "SELECT p FROM Partido p WHERE p.partidoPK.mesaId = :mesaId"),
    @NamedQuery(name = "Partido.findByParcipante1", query = "SELECT p FROM Partido p WHERE p.partidoPK.parcipante1 = :parcipante1"),
    @NamedQuery(name = "Partido.findByParcipante2", query = "SELECT p FROM Partido p WHERE p.partidoPK.parcipante2 = :parcipante2"),
    @NamedQuery(name = "Partido.findByGanador", query = "SELECT p FROM Partido p WHERE p.ganador = :ganador"),
    @NamedQuery(name = "Partido.findByRonda", query = "SELECT p FROM Partido p WHERE p.ronda = :ronda"),
    @NamedQuery(name = "Partido.findByFechaProgramada", query = "SELECT p FROM Partido p WHERE p.fechaProgramada = :fechaProgramada"),
    @NamedQuery(name = "Partido.findByHoraInicio", query = "SELECT p FROM Partido p WHERE p.horaInicio = :horaInicio"),
    @NamedQuery(name = "Partido.findByHoraFin", query = "SELECT p FROM Partido p WHERE p.horaFin = :horaFin"),
    @NamedQuery(name = "Partido.findByTorneo", query = "SELECT p FROM Partido p WHERE p.torneo = :torneo")})
public class Partido implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected PartidoPK partidoPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ganador")
    private int ganador;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ronda")
    private int ronda;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecha_programada")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaProgramada;
    @Basic(optional = false)
    @NotNull
    @Column(name = "hora_inicio")
    @Temporal(TemporalType.TIMESTAMP)
    private Date horaInicio;
    @Basic(optional = false)
    @NotNull
    @Column(name = "hora_fin")
    @Temporal(TemporalType.TIMESTAMP)
    private Date horaFin;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "torneo")
    private String torneo;
    @JoinColumn(name = "mesa_id", referencedColumnName = "id_mesa", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Mesa mesa;
    @JoinColumns({
        @JoinColumn(name = "parcipante_1", referencedColumnName = "id", insertable = false, updatable = false),
        @JoinColumn(name = "parcipante_1", referencedColumnName = "id", insertable = false, updatable = false)})
    @ManyToOne(optional = false)
    private Participante participante;
    @JoinColumns({
        @JoinColumn(name = "parcipante_2", referencedColumnName = "id", insertable = false, updatable = false),
        @JoinColumn(name = "parcipante_2", referencedColumnName = "id", insertable = false, updatable = false)})
    @ManyToOne(optional = false)
    private Participante participante1;

    public Partido() {
    }

    public Partido(PartidoPK partidoPK) {
        this.partidoPK = partidoPK;
    }

    public Partido(PartidoPK partidoPK, int ganador, int ronda, Date fechaProgramada, Date horaInicio, Date horaFin, String torneo) {
        this.partidoPK = partidoPK;
        this.ganador = ganador;
        this.ronda = ronda;
        this.fechaProgramada = fechaProgramada;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.torneo = torneo;
    }

    public Partido(int mesaId, int parcipante1, int parcipante2) {
        this.partidoPK = new PartidoPK(mesaId, parcipante1, parcipante2);
    }

    public PartidoPK getPartidoPK() {
        return partidoPK;
    }

    public void setPartidoPK(PartidoPK partidoPK) {
        this.partidoPK = partidoPK;
    }

    public int getGanador() {
        return ganador;
    }

    public void setGanador(int ganador) {
        this.ganador = ganador;
    }

    public int getRonda() {
        return ronda;
    }

    public void setRonda(int ronda) {
        this.ronda = ronda;
    }

    public Date getFechaProgramada() {
        return fechaProgramada;
    }

    public void setFechaProgramada(Date fechaProgramada) {
        this.fechaProgramada = fechaProgramada;
    }

    public Date getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(Date horaInicio) {
        this.horaInicio = horaInicio;
    }

    public Date getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(Date horaFin) {
        this.horaFin = horaFin;
    }

    public String getTorneo() {
        return torneo;
    }

    public void setTorneo(String torneo) {
        this.torneo = torneo;
    }

    public Mesa getMesa() {
        return mesa;
    }

    public void setMesa(Mesa mesa) {
        this.mesa = mesa;
    }

    public Participante getParticipante() {
        return participante;
    }

    public void setParticipante(Participante participante) {
        this.participante = participante;
    }

    public Participante getParticipante1() {
        return participante1;
    }

    public void setParticipante1(Participante participante1) {
        this.participante1 = participante1;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (partidoPK != null ? partidoPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Partido)) {
            return false;
        }
        Partido other = (Partido) object;
        if ((this.partidoPK == null && other.partidoPK != null) || (this.partidoPK != null && !this.partidoPK.equals(other.partidoPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Partido[ partidoPK=" + partidoPK + " ]";
    }
    
}
