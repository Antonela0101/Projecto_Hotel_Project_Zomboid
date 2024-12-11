
package persistencia;

public class DaoAlojamiento {
    public static String guardar(String codAlo, String fecAlo, String codRes, String codEmp) {
        String sql = "INSERT INTO alojamiento (codAlo, fecAlo, codRes, codEmp) VALUES (?, ?, ?, ?)";
        Object[] params = {codAlo, fecAlo, codRes, codEmp}; 
        return Acceso.guardarAlo(sql, params);
    }
    
    public static String getUltimoCodAlo(){
        String sql = "SELECT MAX(CODALO) AS ultimoCODALO FROM alojamiento";
        return Acceso.getNumAlo(sql);
    }
}

