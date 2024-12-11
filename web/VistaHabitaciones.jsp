<%@page import="java.util.List"%>
<%@page import="presentacion.ModeloHotel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>@import "CSS/reserva.css";</style>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container mt-5">
            <h1 class="text-center">Lista de Habitaciones</h1>
            <% ModeloHotel modelo = (ModeloHotel) session.getAttribute("modelo"); %>
            <% List<Object[]> lis = modelo.getLis(); %>
            <table class="table">
                <tr>
                    <th class="text-center titulos">CodHab</th>
                    <th class="text-center titulos">Tipo</th>
                    <th class="text-center titulos">Precio/Dia</th>
                    <th class="text-center titulos">FeE</th>
                    <th class="text-center titulos">FeS</th>
                    <th class="text-center titulos">Accion</th>
                </tr>
                <% for (int i = 0; i < lis.size(); i++) { %>
                <% Object[] f = (Object[]) lis.get(i);%>
                <tr>
                    <form action="ControlReserva" method="Post">
                        <td align="center"><input type="text" name="cod" class="dato" size="5" value='<%= f[0]%>'/></td>
                        <td align="center"><input type="text" name="tip" class="dato" size="10" value='<%= f[1]%>'/></td>
                        <td align="center"><input type="text" name="pre" class="dato" size="5" value='<%= f[2]%>'/></td>
                        <td align="center"><input type="date" name="feE" class="dato" size="5" value=""></td> 
                        <td align="center"><input type="date" name="feS" class="dato" size="5" value=""></td>   
                        <td><input type="submit" name="acc" class="btn" value="Seleccionar"/></td>
                    </form>
                </tr>
                <% }%>
            </table>
            <div class="text-center contenedorbtn">
                <form action="ControlReserva" method="Post" class="d-inline">
                    <input type="submit" name="acc" class="btn" value="Volver"/>
                </form>
            </div>
        </div>
    </body>
</html>
