package servicio;

import negocio.Cliente;
import persistencia.DaoCliente;

public class ServicioCliente {
    private Cliente cli;
    
    public void nuevoCliente(){
        cli = new Cliente();
    }
    
    public String guardar(String numdoc,String nom,String ape,String tel,String cor,int tdoc) {
        cli.guardar(numdoc,nom,ape,tel,cor,tdoc);
        // Obtener los datos que se enviarán a la base de datos
        Object[] columnasC = (String[]) cli.getColumnasC(); 
        Object[] valoresC = (Object[]) cli.getDatosC();

        /*// Imprimir los datos en consola después de pasarlos por el servicio
        System.out.println("Datos enviados al DAO para guardar en la base de datos:");
        System.out.println("CLIENTE");
        for (int i = 0; i < valoresC.length; i++) {
            System.out.println("Columna: " + columnasC[i] + " - Valor: " + valoresC[i]);
        }*/
        // Guardar los datos usando el DAO
        String resultado = DaoCliente.guardar((String[]) columnasC, valoresC);
        return resultado;
    }
}
