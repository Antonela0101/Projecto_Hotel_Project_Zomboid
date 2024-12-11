package negocio;

public class Cliente {
    private Object[] dcliente = new Object[6];
    private Object[] datosC = new Object[6];
    private String[] columnasC = {"numdoc", "nom", "ape", "tel", "cor", "idtipodoc"};
    
    public void enviarCliente(String nom, String ape, String tdoc, String numdoc, String tel, String cor) {
        dcliente[0] = nom;
        dcliente[1] = ape;
        dcliente[2] = tdoc;
        dcliente[3] = numdoc;
        dcliente[4] = tel;
        dcliente[5] = cor;
    }
    
    public Object[] getDcliente() {
        return dcliente;
    }
    
    public void guardar(String numdoc,String nom,String ape,String tel,String cor,int tdoc) {
        // Guardar los valores en el arreglo 'datosC'
        datosC[0] = numdoc;
        datosC[1] = nom;
        datosC[2] = ape;
        datosC[3] = tel;
        datosC[4] = cor;
        datosC[5] = tdoc;
    }
    public Object[] getDatosC() {
        return datosC; //
    }
    public String[] getColumnasC() {
        return columnasC;
    }
}
