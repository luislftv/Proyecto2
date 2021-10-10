package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Partido;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-10-09T08:14:39")
@StaticMetamodel(Mesa.class)
public class Mesa_ { 

    public static volatile SingularAttribute<Mesa, Integer> idMesa;
    public static volatile ListAttribute<Mesa, Partido> partidoList;
    public static volatile SingularAttribute<Mesa, String> localidad;
    public static volatile SingularAttribute<Mesa, String> nombreLugar;

}