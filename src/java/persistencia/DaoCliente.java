
package persistencia;

public class DaoCliente {
    public static String guardar(String[] columnasC,Object[] datosC) {
        return Acceso.guardar("cliente", columnasC,datosC);
    }
}
