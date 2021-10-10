/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/WebService.java to edit this template
 */
package ws;

import java.util.Date;
import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import model.Partido;
import model.PartidoPK;
import repository.JPAPartido;
import services.ServicePartido;

/**
 *
 * @author lftv9
 */
@WebService(serviceName = "SWPartido")
public class SWPartido {

    private final ServicePartido sp;
    
    public SWPartido() {
        super();
        JPAPartido jpa = new JPAPartido();
        sp = new ServicePartido(jpa);
    }

    @WebMethod
    public Integer crearPartido(@WebParam(name = "arg0") int mesa, int par1, int par2, int ganador, int ronda, Date fechaProgramada, Date horaInicio, Date horaFin, String torneo){
        
        
        Partido p = new Partido(new PartidoPK(mesa,par1,par2), ganador, ronda, fechaProgramada, horaInicio, horaFin, torneo);
        
        try{
            sp.crearPartido(p);
        }
        catch (Exception e){
            return 1;
        }
        return 0;
    }

    @WebMethod
    public Integer eliminarPartido(@WebParam(name = "arg0") int mesa, int par1, int par2){
        
        Partido p = new Partido(new PartidoPK(mesa,par1,par2));
        
        
        try{
            sp.eliminarPartido(p);
        }
        catch (Exception e){
            return 1;
        }
        return 0;
    }

    @WebMethod
    public Integer actualizarPartido(@WebParam(name = "arg0") int mesa, int par1, int par2, int ganador, int ronda, Date fechaProgramada, Date horaInicio, Date horaFin, String torneo){
        
        Partido p = new Partido(new PartidoPK(mesa,par1,par2), ganador, ronda, fechaProgramada, horaInicio, horaFin, torneo);
        
        try{
            sp.actualizarPartido(p);
        }
        catch (Exception e){
            return 1;
        }
        return 0;
    }

    @WebMethod
    public List<Partido> listarTodosLosPartidos(){
        return sp.listarTodosLosPartidos();
    }
    
    @WebMethod
    public List<Partido> listarPorId(@WebParam(name = "arq0") Integer mesa, Integer par1, Integer par2){
        return sp.listarPorId(mesa,  par1,  par2);
    }
    
    
    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }
}
