
package persistencia;

public class LoginDAO {
    public static Object[] Validar(String Userr, String pass){
        String sql="SELECT*FROM EMPLEADO WHERE USERR='"+Userr+"' AND PASS='"+pass+"' ";
        return Acceso.buscar(sql);
    }
}
