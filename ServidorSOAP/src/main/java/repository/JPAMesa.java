/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import model.Mesa;

/**
 *
 * @author lftv9
 */
public class JPAMesa {
    
    private final EntityManager em;
    public JPAMesa() {
        final EntityManagerFactory emf = Persistence.createEntityManagerFactory("db");
        em = emf.createEntityManager();
       //con = new Connect();
    }
       // private EntityManager getEntitymanager(){
        //return Connect.getConexion().getFactory().createEntityManager();
    //}
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

    public Mesa persistMesa(Mesa mesa) {
        em.persist(mesa);
        commitTransaction();
        return mesa;
    }

    public Mesa mergeMesa(Mesa mesa) {
        Mesa entity = null;
        entity = em.merge(mesa);
        commitTransaction();
        return entity;
    }

    public void removeMesa(Mesa mesa) {
        mesa = em.find(Mesa.class, mesa.getIdMesa());
        em.remove(mesa);
        commitTransaction();
    }
    
    public Mesa searchMesa(Mesa mesa){
        Mesa mesab = em.find(Mesa.class, mesa.getIdMesa());
        return mesab;
        }
    
    
    public List<Mesa> listarMesas(){
       List<Mesa> rest = null;
        //EntityManager em = getEntitymanager();
       // Query consulta = em.createQuery("SELECT p FROM Producto p WHERE p.nombre LIKE '%"+nombre+"%' ");
        Query query = em.createQuery("SELECT m FROM Mesa m");
        rest=query.getResultList();
       /*try {
            String cad = "SELECT * FROM Mesa";
            ResultSet res;
            ArrayList<Mesa> mesas = new ArrayList<Mesa>();

            int id;
            String localidad;
            String nombrelugar;

            res = con.executeQueryStatement(cad);
            while(res.next()){

                id = Integer.parseInt(res.getString(1));
                localidad = res.getString(2);
                nombrelugar = res.getString(3);
                
                mesas.add(new Mesa(id, localidad, nombrelugar));
            }
            return mesas;
            
        } catch (SQLException ex) {
             System.out.println("======================================");    
             System.out.println("Error procedimiento, Detalles:");
             System.out.println(ex.getMessage());
             System.out.println("======================================");
             throw new RuntimeException("Error al extraer datos en MySQL");
        }
      */
        return rest;
    }

}
