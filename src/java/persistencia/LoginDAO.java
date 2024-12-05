
package persistencia;

public class LoginDAO {
    
    public static Object[]Validar(String use, String pass){
        String sql="SELECT * FROM EMPLEADOS WHERE USUAR='"+use+"' AND PASSW='"+pass+"'";
        return Acceso.buscar(sql);
    }
}
