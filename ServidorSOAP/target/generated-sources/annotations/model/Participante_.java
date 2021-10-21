package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Partido;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-10-21T14:06:04")
@StaticMetamodel(Participante.class)
public class Participante_ { 

    public static volatile SingularAttribute<Participante, String> apodo;
    public static volatile SingularAttribute<Participante, Date> fechaCaducidad;
    public static volatile ListAttribute<Participante, Partido> partidoList;
    public static volatile ListAttribute<Participante, Partido> partidoList1;
    public static volatile SingularAttribute<Participante, Integer> id;
    public static volatile SingularAttribute<Participante, Date> fechaInscripcion;

}