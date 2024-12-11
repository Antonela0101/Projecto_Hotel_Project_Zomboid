<%@page import="java.util.List"%>
<%@page import="presentacion.ModeloAlojamiento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>@import"Emp.css"</style>
    </head>
    <body>
        <div class="container">
            <h1>Ficha Alojamiento</h1>

            <%
                ModeloAlojamiento modelo = (ModeloAlojamiento) session.getAttribute("modelo");
                String codEmp = String.valueOf(session.getAttribute("codEmp"));
                String codAlo = String.valueOf(session.getAttribute("codAlo"));
                String fecAlo = String.valueOf(session.getAttribute("fecAlo"));
                String res = String.valueOf(session.getAttribute("msg"));
            %> 


            <% Object[] reserva = modelo.getFil();%>
            <form action="ControlAlojamiento" method="Post">

                <!-- Alojamiento -->
                <div class="inputContainer">
                    <label>Codigo del Alojamiento: </label>
                    <input class="containerBig" type="text" name="fecAlo" size="5" value='<%=codAlo%>'/>
                </div>
                <div class="inputContainer">
                    <label>Fecha Alojamiento: </label>
                    <input class="containerBig" type="text" name="fecAlo" size="5" value='<%=fecAlo%>'/>
                </div>
                <div class="inputContainer">
                    <label>Codigo Empleado: </label>
                    <input class="containerBig" type="text" name="fecAlo" size="5" value='<%=codEmp%>'/>
                </div>

                <hr>
                <div class="inputContainer">
                    <label>Codigo de Reserva </label>
                    <input class="containerBig" type="text" name="codRes" size="5" value='<%=reserva[0]%>'/>
                </div>
                <div class="inputContainer">
                    <label>Codigo de habitacion: </label>
                    <input class="containerBig" type="text" name="codHab" size="5" value='<%=reserva[1]%>'/>
                </div>
                <div class="inputContainer">
                    <label>Fecha Reserva: </label>
                    <input class="containerBig" type="text" name="pre" size="5" value='<%=reserva[3]%>'/>
                </div>
                <div class="inputContainer">
                    <label>Fecha de Entrada: </label>
                    <input class="containerBig" type="text" name="fecEnt" size="5" value='<%=reserva[4]%>'/>
                </div>
                <div class="inputContainer">
                    <label>Fecha de Salida: </label>
                    <input class="containerBig" type="text" name="fecSal" size="5" value='<%=reserva[5]%>'/>
                </div>
                <div class="inputContainer">
                    <label>Numero de Identificacion Cliente: </label>
                    <input class="containerBig" type="text" name="dni" size="5" value='<%=reserva[7]%>'/>
                </div>
                <div class="inputContainer" style="text-align: right">
                    <label>Total (S/.): </label>
                    <input class="containerBig" type="text" name="total" size="5" value='<%=reserva[6]%>'/>
                </div>
            </form>

            <hr>    

            <div class="inputContainer" style="text-align: center">
                <form action="ControlAlojamiento" method="Post">
                    <input type="submit" name="acc" value="Grabar Alojamiento"/>
                </form>
            </div>
            <!-- Reserva -->
            <div class="inputContainer" style="text-align: center">
                <form action="ControlAlojamiento" method="Post">
                    <input type="submit" name="acc" value="Listar Reservas"/>                  
                </form>                    
            </div>

            <%
                // Mostrar el mensaje de resultado de la operación
                if (res != null) {
                    if (res.equals("exitoso")) {
            %>
            <div class="inputContainer" style="color: white; text-align: center; background-color: green;">Alojamiento registrado con éxito :)</div>
            <%
            } else if (res.equals("error")) {
            %>
            <div class="inputContainer" style="color: white; text-align: center; background-color: red;">Error al guardar alojamiento :(</div>
            <%
                    }
                }
            %>
            
            <div class="inputContainer" style="text-align: center">
                <form action="ControlAlojamiento" method="Post">
                    <input type="submit" name="acc" value="Nuevo Alojamiento"/>
                </form>
            </div>
            <div class="inputContainer" style="text-align: center">
                <form>
                    <a href="VistaMenu.jsp">Volver Al Menu</a>
                </form>
            </div>
            
        </div>
    </body>
</html>