/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package services;

import java.util.List;
import model.Partido;
import repository.JPAPartido;

/**
 *
 * @author lftv9
 */
public class ServicePartido {
    
    private final JPAPartido jpaPartido;
    
    public ServicePartido(JPAPartido jpaPartido) {
        super();
        this.jpaPartido = jpaPartido;    
    }
    
    public boolean crearPartido (Partido partido){
        try{jpaPartido.persistPartido(partido);}
        catch(Exception e){return false;}
        return true;
    }
    
    
    public boolean actualizarPartido(Partido partido){
        try{jpaPartido.mergePartido(partido);}
        catch(Exception e){return false;}
        return true;
        }
    
    
    public boolean eliminarPartido(Partido partido){
        try{jpaPartido.removePartido(partido);}
        catch(Exception e){return false;}
        return true;
        }
    
    
    public List<Partido> listarTodosLosPartidos(){
        List<Partido> partidos = null;
        try{
            partidos = jpaPartido.listarPartidos();
        }
        catch (Exception e){
            System.out.println("No hay nada");
        }
        return partidos;
    }

    public List<Partido> listarPorId(Integer mesa, Integer par1, Integer par2) {
        List<Partido> partidos = null;
        try{
            partidos = jpaPartido.listarPartidosPorId(mesa,par1,par2);
        }
        catch (Exception e){
            System.out.println("No hay nada");
        }
        return partidos;
    }
    
    
    
    
}
