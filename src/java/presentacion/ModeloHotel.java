package presentacion;

import java.util.ArrayList;
import java.util.List;

public class ModeloHotel {

    private String tot = "";
    private Object[] fil = {"", "", "", "", "",""};
    private Object[] fila = {"", "", "", "", "",""};
    private Object[] filR = {"", "", "", "", "","",""};
    private List lis = new ArrayList();
    private List lisa = new ArrayList();
    private String tdoc = "dni";

    public String getTot() {
        return tot;
    }

    public void setTot(String tot) {
        this.tot = tot;
    }

    public Object[] getFil() {
        return fil;
    }
    public void setFil(Object[] fil) {
        this.fil = fil;
    }
    
     public List getLis() {
        if (this.lis == null) {
            this.lis = new ArrayList<>(); // Inicializa la lista si es null
        }
        return lis;
    }

    public void setLis(List lis) {
        this.lis = lis;
    }
    
    
    //constructo fila para cliente
    public Object[] getFila() {
        return fila;
    }

    public void setFila(Object[] fila) {
        this.fila = fila;
    }
    
    public List getLisa() {
        if (this.lisa == null) {
            this.lisa = new ArrayList<>(); // Inicializa la lista si es null
        }
        return lis;
    }

    public void setLisa(List lisa) {
        this.lis = lisa;
    }

    public Object[] getFilR() {
        return filR;
    }

    public void setFilR(Object[] filR) {
        this.filR = filR;
    }

    // Métodos para tdoc
    public String getTdoc() {
        return tdoc;
    }

    public void setTdoc(String tdoc) {
        this.tdoc = tdoc;
    }
   
}

   
