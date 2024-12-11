package persistencia;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class Acceso {
    
    public static Connection getConexion(){
        Connection cn;
        try{
          Class.forName("org.apache.derby.jdbc.ClientDriver");  
          cn=DriverManager.getConnection("jdbc:derby://localhost:1527/Hotel_Project_Tracer","Kaiser","guten");
        }catch(ClassNotFoundException e){
            cn=null;
        }catch(SQLException e){
            cn=null;
        }
        return cn;
    }
    public static String ejecutar(String sql){
        String msg=null;       
        try{
            Connection cn= getConexion();
            if(cn==null){
                msg="No hay Conexion con la Base de Datos";
            }else{
                Statement st=cn.createStatement();
                st.executeUpdate(sql);
                cn.close();
            }          
        }catch(SQLException e){
            msg=e.getMessage();
        }
        return msg;
    }
    public static List listar(String sql){
        List lista=new ArrayList();
        try{
            Connection cn=getConexion();
            if(cn==null){
                lista=null;
            }else{
                Statement st=cn.createStatement();
                ResultSet rs=st.executeQuery(sql);
                ResultSetMetaData rm=rs.getMetaData();
                int numCol=rm.getColumnCount();
                while(rs.next()){
                    Object[]fila=new Object[numCol];
                    for(int i=0;i<numCol;i++)
                        fila[i]=rs.getObject(i+1);
                    lista.add(fila);
                }
                cn.close();
            }
        }catch(SQLException e){
            lista=null;
        }
        return lista;
    }
    public static Object[] buscar(String sql){
        Object[]fila=null;
        List lista=listar(sql);
        if(lista!=null){
            for(int i=0;i<lista.size();i++){
                fila=(Object[])lista.get(i);
            }
        }
        return fila;
    }
    public static String getNum(String sql, String defaultPrefix) {
        String numGen;
        String numObt = null;
        try {
            Connection cn = getConexion();
            if (cn == null) {
                numGen = null;
                System.out.println("Conexión a la base de datos fallida.");
            } else {
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    numObt = rs.getString(1); // Obtiene el código actual
                    System.out.println("Valor obtenido del ResultSet: " + numObt);
                } else {
                    System.out.println("El ResultSet no tiene filas.");
                }

                if (numObt != null) {
                    String parInt = numObt.substring(defaultPrefix.length());
                    String parStr = numObt.substring(0, defaultPrefix.length()); 
                    if (!parStr.equals(defaultPrefix)) {
                        throw new IllegalArgumentException("El prefijo del código no coincide con el prefijo esperado.");
                    }
                    String nueParInt = String.valueOf(Integer.parseInt(parInt) + 1); 
                    while (nueParInt.length() < 3) {
                        nueParInt = "0" + nueParInt;
                    }
                    numGen = parStr + nueParInt;
                } else {
                    System.out.println("numObt es nulo después de la consulta.");
                    numGen = defaultPrefix + "001";
                }
            }
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace(); 
            numGen = defaultPrefix + "001"; 
        }
        return numGen;
    }
    
    public static String guardar(String tabla, String[] columnas, Object[] valores) {
        String msg = null;
        try {
            Connection cn = getConexion();
            if (cn == null) {
                msg = "No hay conexión con la Base de Datos";
            } else {
                // Construir el comando SQL dinámico especificando columnas
                StringBuilder sql = new StringBuilder("INSERT INTO ").append(tabla).append(" (");
                for (int i = 0; i < columnas.length; i++) {
                    sql.append(columnas[i]);
                    if (i < columnas.length - 1) {
                        sql.append(", ");
                    }
                }
                sql.append(") VALUES (");
                for (int i = 0; i < valores.length; i++) {
                    sql.append("?");
                    if (i < valores.length - 1) {
                        sql.append(", ");
                    }
                }
                sql.append(")");

                // Preparar el statement
                PreparedStatement ps = cn.prepareStatement(sql.toString());
                for (int i = 0; i < valores.length; i++) {
                    ps.setObject(i + 1, valores[i]);
                }

                // Ejecutar el comando SQL
                ps.executeUpdate();
                cn.close();
            }
        } catch (SQLException e) {
            msg = e.getMessage();
        }
        return msg;
    }
}
    