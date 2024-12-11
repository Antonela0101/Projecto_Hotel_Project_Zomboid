
package negocio;

public class Alojamiento {
    Object[] linea = new Object[9];

    public void seleccionar(String codRes, String codHab, String dias, String fecRes, String fecEnt, String fecSal, String total, String dni) {;
        linea[0] = codRes;
        linea[1] = codHab;
        linea[2] = dias;
        linea[3] = fecRes;
        linea[4] = fecEnt;
        linea[5] = fecSal;
        linea[6] = total;
        linea[7] = dni;
    }

     public Object getDatos(){
         return linea;
     }
}

