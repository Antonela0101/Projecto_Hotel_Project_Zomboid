package servicio;

import persistencia.DaoHabitacion;
import java.util.List;

public class ServicioHabitacion {
    public static List listar(){
        return DaoHabitacion.listar();
    }
}
