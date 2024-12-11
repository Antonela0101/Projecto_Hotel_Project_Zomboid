<%@page import="java.util.List"%>
<%@page import="presentacion.ModeloAlojamiento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>@import "Emp.css"</style>
    </head>
    <body>
    <div class="container">
        <h1>Lista de Reservas</h1>
        <% ModeloAlojamiento modelo=(ModeloAlojamiento)session.getAttribute("modelo");%>
        <% List<Object[]> lis = modelo.getLis();%>
        <table>
            <tr>
                <td>Cod Res</td>
                <td>Fec. Res</td>
                <td>Fec. Ent</td>
                <td>Fec. Sal</td>
                <td>Dias</td>
                <td>Total</td>
                <td>Cod Hab</td>
                <td>Numdoc</td>
                <td>Accion</td>
            </tr>
             <% for (int i=0; i<lis.size();i++) { %>
            <% Object[]f=(Object[])lis.get(i);%>
            <tr>
                 <form action="ControlAlojamiento" method="Post">
                 <td><input class="container" type="text" name="codRes" size="3" value='<%=f[0] %>'/></td>
                 <td><input class="container" type="text" name="fecRes" size="5" value='<%=f[1] %>'/></td>
                 <td><input class="container" type="text" name="fecEnt" size="2" value='<%=f[2] %>'/></td>
                 <td><input class="container" type="text" name="fecSal" size="7" value='<%=f[3] %>'/></td>
                 <td><input class="container" type="text" name="dias" size="7" value='<%=f[4] %>'/></td>
                 <td><input class="container" type="text" name="total" size="7" value='<%=f[5] %>'/></td>
                 <td><input class="container" type="text" name="codHab" size="5" value='<%=f[6] %>'/></td>
                 <td><input class="container" type="text" name="numdoc" size="7" value='<%=f[7] %>'/></td>
                 <td><input class="container" type="submit" name="acc" value="Seleccionar"/></td>
                 </form> 
            </tr>
             <% } %>
        </table>
       
       </div>
    </body>
</html>