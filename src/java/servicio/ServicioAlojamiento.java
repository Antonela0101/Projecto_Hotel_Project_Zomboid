
package servicio;
import negocio.Alojamiento;
import persistencia.DaoAlojamiento;
public class ServicioAlojamiento {
     private Alojamiento Alo;

    public void nuevoAlojamiento() {
        Alo = new Alojamiento();
    }

    public Object seleccionarReserva(String codRes, String codHab, String dias, String fecRes, String fecEnt, String fecSal, String total, String dni) {
        if (Alo == null) {
            nuevoAlojamiento();
        }
        Alo.seleccionar(codRes, codHab, dias, fecRes, fecEnt, fecSal, total, dni);
        return Alo.getDatos();
    }

    public Alojamiento getAlojamiento() {
        return Alo;
    }
    
    public String getNuevoCodAlo(){
        return DaoAlojamiento.getUltimoCodAlo();
    }
    
    public String guardar(String codAlo, String fecAlo, String codRes, String codEmp){
        return DaoAlojamiento.guardar(codAlo, fecAlo, codRes, codEmp);
    }
    
    
}
