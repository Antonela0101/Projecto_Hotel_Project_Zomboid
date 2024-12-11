<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>@import "CSS/reserva.css";</style>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <h1 class="text-center">Mensaje</h1>
            <% String c = (String) request.getAttribute("msgC"); %>
            <% String r = (String) request.getAttribute("msgR"); %>
            <table class="table">
                <tbody>
                    <tr>
                        <td align="center">Msg Cliente==> <input type="text" name="" class="text-center" size="100" value="<%= c != null ? c : "" %>"></td>
                    </tr>
                    <tr>
                        <td align="center">Msg Reserva==> <input type="text" name="" class="text-center" size="100" value="<%= r != null ? r : "" %>"></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
