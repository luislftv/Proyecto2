/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import model.Partido;
import model.PartidoPK;

/**
 *
 * @author lftv9
 */
public class JPAPartido {
    
    private final EntityManager em;

    public JPAPartido() {
        final EntityManagerFactory emf = Persistence.createEntityManagerFactory("db");
        em = emf.createEntityManager();
    }

    /**
     * All changes that have been made to the managed entities in the
     * persistence context are applied to the database and committed.
     */
    public void commitTransaction() {
        final EntityTransaction entityTransaction = em.getTransaction();
        if (!entityTransaction.isActive()) {
            entityTransaction.begin();
        }
        entityTransaction.commit();
    }

    public Object queryByRange(String jpqlStmt, int firstResult, int maxResults) {
        Query query = em.createQuery(jpqlStmt);
        if (firstResult > 0) {
            query = query.setFirstResult(firstResult);
        }
        if (maxResults > 0) {
            query = query.setMaxResults(maxResults);
        }
        return query.getResultList();
    }

    public <T> T persistEntity(T entity) {
        em.persist(entity);
        commitTransaction();
        return entity;
    }

    public <T> T mergeEntity(T entity) {
        entity = em.merge(entity);
        commitTransaction();
        return entity;
    }

    public Partido persistPartido(Partido partido) {
        em.persist(partido);
        commitTransaction();
        return partido;
    }

    public Partido mergePartido(Partido partido) {
        Partido entity = null;
        entity = em.merge(partido);
        commitTransaction();
        return entity;
    }

    public void removePartido(Partido partido) {
        partido =
            em.find(Partido.class,partido.getPartidoPK());
                    
                                  
        em.remove(partido);
        commitTransaction();
    }

    public List<Partido> listarPartidos() {
        List<Partido> listaPartidos= null;
        
        Query query = em.createQuery("SELECT p FROM Partido p");
        listaPartidos  = query.getResultList();
        
        return listaPartidos;
    }

    public List<Partido> listarPartidosPorId(Integer mesa, Integer par1, Integer par2) {
        List<Partido> listaPartidos= null;
        
        Query query = em.createQuery("SELECT p FROM Partido p where p.partidoPK.mesaId = "+mesa+
                " And p.partidoPK.parcipante1 = "+ par1+
                " And p.partidoPK.parcipante2 = "+ par2);
        listaPartidos  = query.getResultList();
        
       // PartidoPK llave = new PartidoPK(mesa, par1, par2);
        
       // em.find(Partido.class, llave);
        
       
        
        return listaPartidos;
        
    }
    
}
