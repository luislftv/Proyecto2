/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/WebService.java to edit this template
 */
package ws;

import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import model.Mesa;
import repository.JPAMesa;
import services.ServiceMesa;

/**
 *
 * @author lftv9
 */
@WebService(serviceName = "SWmesa")
public class SWmesa {

    private final ServiceMesa sm;
    
    
    public SWmesa() {
        super();
        JPAMesa jsjm = new JPAMesa();    
        sm = new ServiceMesa(jsjm);
    }

   /* @WebMethod
    public Integer crearMesa(@WebParam(name = "arg0") Mesa mesa){
        try{
            sm.crearMesa(mesa);
        }catch(Exception e){
            return 1;
        }
        return 0;
    }

    @WebMethod
    public Integer actualizarMesa(@WebParam(name = "arg0") Mesa mesa){
        try{
            sm.actualizarMesa(mesa);
        }catch (Exception e){
            //Manejo error
            return 1;
        }
        return 0;
    }

    @WebMethod
    public Integer eliminarMesa(@WebParam(name = "arg0") Mesa mesa){
        try{
            sm.eliminarMesa(mesa);
        }catch (Exception e){
            //Manejo error
            return 0;
        }
        return 1;
    }

    @WebMethod
    public Mesa buscarMesa (@WebParam(name = "arg0") Mesa mesa){
        try{
            mesa = sm.buscarMesaId(mesa);
        }catch (Exception e){
            //Manejo error
        }
        return mesa;
    }
*/
    @WebMethod
    public List<Mesa> listarMesas(){
        List<Mesa> mesas = null;
        try{
            mesas = sm.listarTodasLasMesas();
        }catch (Exception e){
            //Manejo error
        }
        return mesas;
    }
}
