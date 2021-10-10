/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

import javax.persistence.Persistence;
import javax.persistence.Query;
import model.Participante;
import model.Partido;

/**
 *
 * @author lftv9
 */

public class JPAParticipante implements Serializable {

    private final EntityManager em;

    public JPAParticipante() {
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

    public Participante persistParticipante(Participante participante) {
        em.persist(participante);
        commitTransaction();
        return participante;
    }

    public Participante mergeParticipante(Participante participante) {
        Participante entity = null;
        entity = em.merge(participante);
        commitTransaction();
        return entity;
    }

    public void removeParticipante(Participante participante) {
        participante = em.find(Participante.class, participante.getId());
        em.remove(participante);
        commitTransaction();
    }
    
    public Participante searchParticipante(Participante participante){
        System.out.println(participante.getId());
        Participante participanteb = em.find(Participante.class, participante.getId());
        return participanteb;
        }
    
    
    public Integer[] EstadisticasNegrasYBlancas(int i){
        
        Integer[] res = new Integer[2]; 
        Query query1 = em.createQuery("Select u  from Partido u where u.partidoPK.parcipante1 ="+i);
        res [0] = (Integer) query1.getResultList().size();
        Query query2 = em.createQuery("Select u from Partido u where u.partidoPK.parcipante2 ="+i);
        res [1] = (Integer) query2.getResultList().size();
        
        return res;
    }
    
    public List<Partido> listarPartidosDeUnParticipante(int i){
        
        Query query = em.createQuery("SELECT a FROM Partido a where a.partidoPK.parcipante1 = "+ i +"");
        Query query2 = em.createQuery("SELECT a FROM Partido a where a.partidoPK.parcipante2 = "+ i +"");
        
        List<Partido> res1 = query.getResultList();
        List<Partido> res2 = query.getResultList();
        
        
        ArrayList<Partido> res = new ArrayList<Partido>();
        
        for (Partido p : res1) {
            res.add(p);
        }
        
        for (Partido p : res2) {
            res.add(p);
        }
        
        return res;  
    }
    
    
    public List<Participante> filtrarParticipantePorApodo(Participante participante){
        
        Query query = em.createQuery("SELECT a FROM Participante a where a.apodo LIKE '%"+participante.getApodo()+"%' ");
        return query.getResultList();
    }
    
    public List<Participante> listarParticipantes(){
        List<Participante> listaParticipantes= null;
     
        Query query = em.createQuery("SELECT p FROM Participante p");
        listaParticipantes  = query.getResultList();
        
        return listaParticipantes;
        
    }
    
}
