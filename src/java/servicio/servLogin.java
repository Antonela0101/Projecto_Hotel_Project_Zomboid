package servicio;

import persistencia.LoginDAO;

public class servLogin {
    
    public static Object[]Validar(String use, String pass) {
        return LoginDAO.Validar(use, pass);
        
    }
    
}
