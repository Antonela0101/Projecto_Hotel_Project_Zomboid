package Control;

import servicio.ServicioCliente;
import servicio.ServicioHabitacion;
import servicio.ServicioReserva;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import presentacion.ModeloHotel;

@WebServlet(name = "ControlReserva", urlPatterns = {"/ControlReserva"})
public class ControlReserva extends HttpServlet {
    private ModeloHotel modelo;
    private ServicioReserva servRes;
    private ServicioCliente servCli;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acc = request.getParameter("acc");
        if (acc.equals("Reserva")) {
            modelo = new ModeloHotel();
            servRes = new ServicioReserva();
            servCli = new ServicioCliente();
            servCli.nuevoCliente();
            servRes.nuevaReserva();
            modelo.setTot(servRes.verTotal);
            request.getSession().setAttribute("modelo", modelo);
            response.sendRedirect("VistaReserva.jsp");
        }
        if (acc.equals("Listar Habitaciones")) {
            modelo.setLis(ServicioHabitacion.listar());
            response.sendRedirect("VistaHabitaciones.jsp");
        }
        if (acc.equals("Seleccionar")) {
            String cod = request.getParameter("cod");
            String tip = request.getParameter("tip");
            String pre = request.getParameter("pre");
            String feE = request.getParameter("feE");
            String feS = request.getParameter("feS");
            modelo.setFil((Object[]) servRes.seleccionar(cod, tip, pre, feE, feS));
            modelo.setTot(servRes.verTotal());
            response.sendRedirect("VistaReserva.jsp");
        }
        //Para el cliente datos
        if (acc.equals("Seleccionar Datos")) {
            String nom = request.getParameter("nom");
            String ape = request.getParameter("ape");
            String tdoc = request.getParameter("tdoc");
            System.out.println("Tipo de Documento: " + tdoc); 
            String dni = request.getParameter("numdoc");
            String tel = request.getParameter("tel");
            String cor = request.getParameter("cor");
            
            modelo.setFila((Object[]) servCli.enviarCliente(nom, ape, tdoc, dni, tel, cor));
           
            String codHab = request.getParameter("codHab");
            String tip = request.getParameter("tip");
            String pre = request.getParameter("pre");
            String dia = request.getParameter("dia");
            String feE = request.getParameter("feE");
            String feS = request.getParameter("feS");
            String tot = request.getParameter("tot");
            modelo.setFilR((Object[]) servRes.enviarReserva(codHab, tip, pre, dia, feE, feS, tot));
            
            String numRes = servRes.obtenerNum();
            System.out.println("num: "+numRes);
            request.setAttribute("num", numRes);

            String fecha = servRes.obtenerFecha();
            System.out.println("fecha: "+fecha);
            request.setAttribute("fecha", fecha);
            
            request.getRequestDispatcher("VistaDocumentoReserva.jsp").forward(request, response);
        }

        
      if (acc.equals("Guardar")) {
            //Datos del Cliente
            String numdoc = request.getParameter("numdoc");
            String nom = request.getParameter("nom");
            String ape = request.getParameter("ape");
            String tel = request.getParameter("tel");
            String cor = request.getParameter("cor");
            //obteniendo el tipo de documento
            String ndoc = request.getParameter("tdoc");
            int tdoc=0;
            switch(ndoc){
                case "dni":{
                    tdoc = 1;
                    break;
                }
                case "carnet de extrajeria":{
                    tdoc = 2;
                    break;
                }
                case "pasaporte":{
                    tdoc = 3;
                    break;
                }
            }
            
            //Datos de la Reserva
            String cod = request.getParameter("cod");
            String fec = request.getParameter("fec");
            String codHab = request.getParameter("codHab");
            String dias = request.getParameter("dias");
            String feE = request.getParameter("feE");
            String feS = request.getParameter("feS");
            String tot = request.getParameter("tot");
            
            
            // Imprimir los datos en la consola para depuración
            System.out.println("Datos recibidos de la vista res: ");
            System.out.println("Cod: " + cod);
            System.out.println("Fecha: " + fec);
            System.out.println("CodHab: " + codHab);
            System.out.println("Días: " + dias);
            System.out.println("Fecha Entrada: " + feE);
            System.out.println("Fecha Salida: " + feS);
            System.out.println("Total: " + tot);


            String resultadoC = servCli.guardar(numdoc,nom,ape,tel,cor,tdoc);
            if (resultadoC == null) {
                String resultadoR = servRes.guardar(cod,fec, feE, feS,dias, tot,codHab,numdoc);
                if(resultadoR == null){
                    // Guardado exitoso
                    response.sendRedirect("MensajeExitoso.jsp");
                }else{
                    request.setAttribute("msgR", "Error al guardar: " + resultadoR);
                    request.getRequestDispatcher("Mensaje.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("msgC", "Error al guardar: " + resultadoC);
                request.getRequestDispatcher("Mensaje.jsp").forward(request, response);
            }
            
            
        }
        
        
        if (acc.equals("Volver")) {
            response.sendRedirect("VistaReserva.jsp");
        }

        if (acc.equals("Inicio")) {
            response.sendRedirect("index.jsp");
        }
        
        if (acc.equals("Listo")) {
            response.sendRedirect("index.jsp");
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
