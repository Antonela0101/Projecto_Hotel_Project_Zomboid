package persistencia;

import java.util.List;

public class DaoHabitacion {
    public static List listar(){
        return Acceso.listar("select * from habitacion");
    }
}
