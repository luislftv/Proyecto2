/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package services;

import java.util.List;
import model.Mesa;
import repository.JPAMesa;

/**
 *
 * @author lftv9
 */
public class ServiceMesa {
    
    private final JPAMesa jpaMesa;
    
    
    public ServiceMesa(JPAMesa jpaMesa) {
        super();
        this.jpaMesa = jpaMesa;
    }
    
   
   /** public boolean crearMesa (Mesa mesa){
        try{jpaMesa.persistMesa(mesa);}
        catch(Exception e){return false;}
        return true;
    }
    
    
    public boolean actualizarMesa(Mesa mesa){
        try{jpaMesa.mergeMesa(mesa);}
        catch(Exception e){return false;}
        return true;
        }
    
    
    public boolean eliminarMesa(Mesa mesa){
        try{jpaMesa.removeMesa(mesa);}
        catch(Exception e){return false;}
        return true;
        }
    
    public Mesa buscarMesaId(Mesa mesa){
        Mesa mesar = null;
        try{mesar = jpaMesa.searchMesa(mesa);}
        catch(Exception e){return null;}
        return mesar;
        }
    
        /**
         *Metodo que lista todas las mesas
         * @return
         */
        public List<Mesa> listarTodasLasMesas(){
            List<Mesa> mesas = null;
            try{
                mesas = jpaMesa.listarMesas();
            }
            catch (Exception e){
                System.out.println("No hay nada");
            }
            return mesas;
        }

    
    
}
