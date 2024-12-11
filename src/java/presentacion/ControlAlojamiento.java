
package presentacion;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servicio.*;
import servicio.ServicioReserva;

@WebServlet(name = "ControlAlojamiento", urlPatterns = {"/ControlAlojamiento"})
public class ControlAlojamiento extends HttpServlet {

    private ModeloAlojamiento modelo;
    private ServicioAlojamiento ServAlo;
    private String codEmp;
    private String fecAlo;
    private String codAlo;
    private String codRes;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acc = request.getParameter("acc");
        if (acc.equals("Nuevo Alojamiento")) {
            modelo = new ModeloAlojamiento();
            ServAlo = new ServicioAlojamiento();
            ServAlo.nuevoAlojamiento();

            //Recurar el codigo del empleado
            codEmp = "E001";

            //Se recupera la fecha actual
            LocalDate fechaActual = LocalDate.now();
            DateTimeFormatter formato = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            fecAlo = fechaActual.format(formato);

            //Se autogenera el codigo del alojamiento
            codAlo = ServAlo.getNuevoCodAlo();

            //Envian las variables a la vista con sus respectivos alias
            request.getSession().setAttribute("codEmp", codEmp);
            request.getSession().setAttribute("codAlo", codAlo);
            request.getSession().setAttribute("fecAlo", fecAlo);
            request.getSession().setAttribute("modelo", modelo);
            request.getSession().setAttribute("msg", "");
            response.sendRedirect("VistaAlojamiento.jsp");
        }
        if (acc.equals("Listar Reservas")) {
            modelo.setLis(ServicioReserva.listar());
            response.sendRedirect("VistaReservaAlo.jsp");
        }
        if (acc.equals("Seleccionar")) {
            codRes = request.getParameter("codRes");
            String codHab = request.getParameter("codHab");
            String dias = request.getParameter("dias");
            String fecRes = request.getParameter("fecRes");
            String fecEnt = request.getParameter("fecEnt");
            String fecSal = request.getParameter("fecSal");
            String total = request.getParameter("total");
            String numdoc = request.getParameter("numdoc");
            modelo.setFil((Object[]) ServAlo.seleccionarReserva(codRes, codHab, dias, fecRes, fecEnt, fecSal, total, numdoc));
            response.sendRedirect("VistaAlojamiento.jsp");
        }
        if (acc.equals("Grabar Alojamiento")) {
            String msg = ServAlo.guardar(codAlo, fecAlo, codRes, codEmp);

            if (msg == null) {
                msg = "exitoso";
            } else {
                msg = "error";
            }
            System.out.println("Mesaje: " + msg);
            request.getSession().setAttribute("msg", msg);
            response.sendRedirect("VistaAlojamiento.jsp");
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
