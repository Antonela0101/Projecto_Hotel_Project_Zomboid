package negocio;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Date;

public class Reserva {
    private Object[] linea = new Object[6];
    private Object[] dreserva = new Object[7];
    private Object[] datosR = new Object[8];
    private String[] columnasR = {"cod","fec","fei", "fes", "dias", "tot","codhab","numdoc"};
    
    private LocalDate feE; 
    private LocalDate feS;
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    
    public void seleccionar(String cod, String tip, String pre, String feE, String feS) {
        this.feE = LocalDate.parse(feE, formatter);
        this.feS = LocalDate.parse(feS, formatter);
        linea[0] = cod;
        linea[1] = tip;
        linea[2] = Double.parseDouble(pre);
        linea[3] = getDias();
        linea[4] = feE;
        linea[5] = feS;
    }
    
    public void enviarReserva(String codHab, String tip, String pre, String dia, String feE, String feS, String tot) {
        dreserva[0] = codHab;
        dreserva[1] = tip;
        dreserva[2] = pre;
        dreserva[3] = dia;
        dreserva[4] = feE;
        dreserva[5] = feS;
        dreserva[6] = tot;
    }
    
    public int getDias() {
        long dias = ChronoUnit.DAYS.between(feE, feS);
        return (int) dias;
    }
    
    public String getTotal() {
        double pre = (double) linea[2]; 
        double tot = pre * getDias();
        return String.valueOf(tot); 
    }
    
    // Método para guardar la reserva, recibiendo los parámetros como String
    public void guardar(String cod, String fec, String feE, String feS,String diasStr, String totStr,String codHab, String numdoc) {
        //deburacion antes de conversion de datos
        System.out.println("Método guardar invocado con valores iniciales.");
        System.out.println("Valores recibidos: ");
        System.out.println("cod: " + cod);
        System.out.println("fec: " + fec);
        System.out.println("codHab: " + codHab);
        System.out.println("diasStr: " + diasStr);
        System.out.println("feE: " + feE);
        System.out.println("feS: " + feS);
        System.out.println("totStr: " + totStr);
        System.out.println("numdocStr: " + numdoc);
        //formateo de datos
        int dias = Integer.parseInt(diasStr);  
        double total = Double.parseDouble(totStr);

        java.sql.Date fecha = java.sql.Date.valueOf(fec); 
        java.sql.Date fechaEntrada = java.sql.Date.valueOf(feE); 
        java.sql.Date fechaSalida = java.sql.Date.valueOf(feS); 

        datosR[0] = cod;  
        datosR[1] = fecha;  
        datosR[2] = fechaEntrada; 
        datosR[3] = fechaSalida; 
        datosR[4] = dias; 
        datosR[5] = total; 
        datosR[6] = codHab; 
        datosR[7] = numdoc; 

        // Imprimir los datos en la consola para depuración
        System.out.println("Datos guardados en el objeto res: ");
        System.out.println("COD: " + datosR[0]);
        System.out.println("FEC: " + datosR[1]);
        System.out.println("FEE: " + datosR[2]);
        System.out.println("FES: " + datosR[3]);
        System.out.println("DIAS: " + datosR[4]);
        System.out.println("TOTAL: " + datosR[5]);
        System.out.println("CODHAB: " + datosR[6]);
        System.out.println("NUMDOC: " + datosR[7]);
    }

    
    public static String getFecha() {
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // Cambiar a este formato
        return sdf.format(d);
    }

    // Corregir el retorno de los métodos para que devuelvan arreglos
    public Object[] getLinea() {
        return linea; 
    }
    
    public Object[] getDreserva(){
        return dreserva;
    }
    public Object[] getDatosR() {
        return datosR; 
    }
    
    public String[] getColumnasR() {
        return columnasR;
    }
}
