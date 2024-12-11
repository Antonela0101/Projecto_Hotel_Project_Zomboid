package servicio;

import negocio.Reserva;
import persistencia.DaoHabitacion;
import persistencia.DaoReserva;

public class ServicioReserva {

    private Reserva res;
    public String verTotal;

    public void nuevaReserva() {
        res = new Reserva();
    }

    public Object seleccionar(String cod, String tip, String pre, String feE, String feS) {
        res.seleccionar(cod, tip, pre, feE, feS);
        return res.getLinea();
    }
    
    public Object enviarReserva(String codHab, String tip, String pre, String dia, String feE, String feS, String tot) {
        res.enviarReserva(codHab, tip, pre, dia, feE, feS, tot);
        return res.getDreserva();
    }
    
    public String verTotal() {
        if (res != null) {
            return String.valueOf(res.getTotal());
        }
        return "0";
    }
    
    public String guardar(String cod,String fec, String feE, String feS, String dias, String tot,String codHab, String numdoc) {
        res.guardar(cod,fec, feE, feS, dias, tot,codHab,numdoc);
        // Obtener los datos que se enviarán a la base de datos
        Object[] columnasR = (String[]) res.getColumnasR(); 
        Object[] valoresR = (Object[]) res.getDatosR();

        // Imprimir los datos en consola después de pasarlos por el servicio
        System.out.println("RESERVA");
        for (int i = 0; i < valoresR.length; i++) {
            System.out.println("Columna: " + columnasR[i] + " - Valor: " + valoresR[i]);
        }
        // Guardar los datos usando el DAO
        String resultado = DaoReserva.guardar((String[]) columnasR, valoresR);
        return resultado;
    }
    
    public String obtenerNum() {
        return DaoReserva.obtenerNum();
    }

    
    public String obtenerFecha(){
        String fecha = res.getFecha();
        return fecha;
    }
}
