package negocio;

public class Cliente {
    private Object[] datosC = new Object[6];
    private String[] columnasC = {"numdoc", "nom", "ape", "tel", "cor", "idtipodoc"};
    // Método para guardar el cliente, recibiendo los parámetros como String
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
