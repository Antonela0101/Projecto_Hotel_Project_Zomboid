
package presentacion;
import java.util.ArrayList;
import java.util.List;
public class ModeloAlojamiento {
    private Object[] fil= {"","","","","","","","",""};
    private List lis=new ArrayList ();

    public ModeloAlojamiento() {
        lis.add(fil);
    }
    
    public Object[] getFil() {
        return fil;
    }

    public void setFil(Object[] fil) {
        this.fil = fil;
    }

    public List getLis() {
        return lis;
    }

    public void setLis(List lis) {
        this.lis = lis;
    }
    
}

