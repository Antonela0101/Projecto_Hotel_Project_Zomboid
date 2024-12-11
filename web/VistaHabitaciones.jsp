<%@page import="java.util.List"%>
<%@page import="presentacion.ModeloHotel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <h1 class="text-center">Lista de Habitaciones</h1>
            <% ModeloHotel modelo = (ModeloHotel) session.getAttribute("modelo"); %>
            <% List<Object[]> lis = modelo.getLis(); %>
            <table class="table table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>CodHab</th>
                        <th>Tipo</th>
                        <th>Precio/Dia</th>
                        <th>FeE</th>
                        <th>FeS</th>
                        <th>Accion</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (int i = 0; i < lis.size(); i++) { %>
                    <% Object[] f = (Object[]) lis.get(i);%>
                    <tr>
                        <form action="ControlReserva" method="Post">
                            <td align="center"><input type="text" name="cod" size="5" value='<%= f[0]%>'/></td>
                            <td align="center"><input type="text" name="tip" size="10" value='<%= f[1]%>'/></td>
                            <td align="center"><input type="text" name="pre" size="5" value='<%= f[2]%>'/></td>
                            <td align="center"><input type="date" name="feE" size="5" value=""></td> 
                            <td align="center"><input type="date" name="feS" size="5" value=""></td>   
                            <td><input type="submit" name="acc" class="btn btn-primary" value="Seleccionar"/></td>
                        </form>
                    </tr>
                </tbody>
                <% }%>
            </table>
            <div class="text-center">
                <form action="ControlReserva" method="Post" class="d-inline">
                    <input type="submit" name="acc" class="btn btn-info" value="Volver"/>
                </form>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
