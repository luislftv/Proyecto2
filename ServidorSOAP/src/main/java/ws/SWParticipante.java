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
import model.Participante;
import model.Partido;
import repository.JPAParticipante;
import services.ServiceParticipante;

/**
 *
 * @author lftv9
 */
@WebService(serviceName = "SWParticipante")
public class SWParticipante {

     private final ServiceParticipante sp;
    
    
    public SWParticipante() {
        super();
        JPAParticipante jpa = new JPAParticipante();
        sp = new ServiceParticipante(jpa);
    }

    @WebMethod
    public Integer crearParticipante(@WebParam(name = "arg0") Integer id, String apodo, Date fechaInscripcion, Date fechaCaducidad){
        /*String k = apodo.charAt(0)+"";
        
        if (k.equals("'")) {
            apodo = apodo.substring(1, apodo.length()-1);
        }*/
        
        try{
            System.out.println(id+" "+apodo+" "+fechaInscripcion+" "+fechaCaducidad);
            sp.crearParticipante(new Participante(id, apodo, fechaInscripcion, fechaCaducidad));
        }
        catch(Exception e){
            return 1;
        }
        return 0;
    }

    @WebMethod
    public Participante buscarParticipante(@WebParam(name = "arg0") Integer id){
        Participante temp = new Participante();
        temp.setId(id);
        
        try{
            temp = sp.buscarParticipanteId(temp);
        }
        catch(Exception e){
            return null;
        }
        return temp;
    }

    @WebMethod
    public Integer eliminarParticipante(@WebParam(name = "arg0") Integer id, String apodo, Date fechaInscripcion, Date fechaCaducidad){
        Participante e = new Participante(id, apodo, fechaInscripcion, fechaCaducidad);
        try{
            sp.eliminarParticipante(e);
        }
        catch(Exception ex){
            return 1;
        }
        return 0;
    }

    @WebMethod
    public Integer actualizarParticipante(@WebParam(name = "arg0") Integer id, String apodo, Date fechaInscripcion, Date fechaCaducidad){
        Participante e = new Participante(id, apodo, fechaInscripcion, fechaCaducidad);
        try{
            sp.actualizarParticipante(e);
        }
        catch(Exception ex){
            return 1;
        }
        return 0;
    }


    @WebMethod
    public List<Participante> listarParticipantes(){
        List<Participante> participantes = null;
        try{
            participantes = sp.listarTodosLosParticipantes();
        }catch (Exception e){
            //Manejo error
            return null;
        }
        return participantes;
    }

    @WebMethod
    public Integer[] Estadisticas(@WebParam(name = "arg0") int i){
        
             return sp.Estadisticas(i);
        
    }

    @WebMethod
    public List<Partido> listarPartidosDeUnParticipante(@WebParam(name = "arg0") int i){
        
        return sp.listarPartidosDeUnParticipante(i);
        
    }

    @WebMethod
    public List<Participante> filtrarParticipantePorApodo(@WebParam(name = "arg0") String apodo){
        Participante temp = new Participante();
        temp.setApodo(apodo);
        return sp.filtrarParticipantePorApodo(temp);
    
    }
    
    
    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }
}
