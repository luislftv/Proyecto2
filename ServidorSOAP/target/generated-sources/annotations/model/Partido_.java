package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Mesa;
import model.Participante;
import model.PartidoPK;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-10-21T14:06:04")
@StaticMetamodel(Partido.class)
public class Partido_ { 

    public static volatile SingularAttribute<Partido, Date> horaFin;
    public static volatile SingularAttribute<Partido, Participante> participante1;
    public static volatile SingularAttribute<Partido, String> torneo;
    public static volatile SingularAttribute<Partido, Integer> ronda;
    public static volatile SingularAttribute<Partido, Mesa> mesa;
    public static volatile SingularAttribute<Partido, Integer> ganador;
    public static volatile SingularAttribute<Partido, Date> fechaProgramada;
    public static volatile SingularAttribute<Partido, PartidoPK> partidoPK;
    public static volatile SingularAttribute<Partido, Participante> participante;
    public static volatile SingularAttribute<Partido, Date> horaInicio;

}