package servicio;

import negocio.Cliente;
import persistencia.DaoCliente;

public class ServicioCliente {
    private Cliente cli;
    
    public void nuevoCliente(){
        cli = new Cliente();
    }
    
    //Cliente
      // Seleccionar cliente
    public Object enviarCliente(String nombre, String apellido, String tdocumento, String dni, String telefono, String correo) {
        cli.enviarCliente(nombre, apellido, tdocumento, dni, telefono, correo);
        return cli.getDcliente();
    }
    
    public String guardar(String numdoc,String nom,String ape,String tel,String cor,int tdoc) {
        cli.guardar(numdoc,nom,ape,tel,cor,tdoc);
        // Obtener los datos que se enviarán a la base de datos
        Object[] columnasC = (String[]) cli.getColumnasC(); 
        Object[] valoresC = (Object[]) cli.getDatosC();
        String resultado = DaoCliente.guardar((String[]) columnasC, valoresC);
        return resultado;
    }
}
