package persistencia;

public class DaoReserva {
    public static String guardar(String[] columnas,Object[] datos) {
        return Acceso.guardar("reserva", columnas,datos);
    }
   
    public static String obtenerNum() {
        String sql = "SELECT cod FROM reserva ORDER BY cod DESC FETCH FIRST ROW ONLY";
        String num = Acceso.getNum(sql,"R");
        System.out.println("Número recuperado por Acceso.getNum: " + num);
        return num;
    }
}
