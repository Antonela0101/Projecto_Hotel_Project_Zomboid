<%@page import="java.lang.String"%>
<%@page import="presentacion.ModeloHotel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>@import "CSS/reserva.css";</style>
        <title>DOCUMENTO</title>
    </head>
    <body>
        <% ModeloHotel modelo = (ModeloHotel) session.getAttribute("modelo"); %>
        <% Object[] r = modelo.getFilR(); %>
        <% Object[] c = modelo.getFila(); %>
        <% String fecha = (String) request.getAttribute("fecha"); %>
        <% String n = (String) request.getAttribute("num"); %>
        
        
        <div class="container-doc">
            <!-- Título -->
            <h1 class="text-center">DOCUMENTO</h1>
            <form action="ControlReserva" method="post">
                <!-- Código Reserva y Fecha Reserva -->
                <div class="contendedor-datos">
                    <div class="row-info">
                        <div class="contenedor-t">
                            <label for="cod" class="titulo-info">Código Reserva:</label>
                        </div>
                        <div class="contenedor-i">
                            <input type="text" name="cod" class="info" 
                                   value="<%= n != null ? n : "" %>" readonly />
                        </div>
                    </div>
                    <div class="row-info">
                        <div class="contenedor-t">
                            <label for="fec" class="titulo-info">Fecha Reserva:</label>
                        </div>
                        <div class="contenedor-i">
                            <input type="text" name="fec" class="info" 
                                   value="<%= fecha != null ? fecha : "" %>" readonly />
                        </div>
                    </div>
                </div>

                <!-- Subtítulo: Datos del Cliente -->
                <h3 class="text-center">Datos del Cliente</h3>
                <div class="contendedor-datos">
                    <div class="row-info">
                        <div class="contenedor-t">
                            <label for="nombre" class="titulo-info">Nombre:</label>
                        </div>
                        <div class="contenedor-i">
                            <input type="text" name="nom" class="info" 
                                   value="<%= c[0] %>" readonly />
                        </div>
                    </div>
                    <div class="row-info">
                        <div class="contenedor-t">
                            <label for="apellido" class="titulo-info">Apellido:</label>
                        </div>
                        <div class="contenedor-i">
                            <input type="text" name="ape" class="info" 
                                   value="<%= c[1] %>" readonly />
                        </div>
                    </div>
                    <div class="row-info">
                        <div class="contenedor-t">
                            <label for="tdocumento" class="titulo-info">Tipo de Documento:</label>
                        </div>
                        <div class="contenedor-i">
                            <input type="text" name="tdoc" class="info" 
                                   value="<%= c[2] %>" readonly />
                        </div>
                    </div>
                    <div class="row-info">
                        <div class="contenedor-t">
                            <label for="dni" class="titulo-info">Numero de Documento:</label>
                        </div>
                        <div class="contenedor-i">
                            <input type="text" name="numdoc" class="info" 
                                   value="<%= c[3] %>" readonly />
                        </div>
                    </div>
                    <div class="row-info">
                        <div class="contenedor-t">
                            <label for="telefono" class="titulo-info">Teléfono:</label>
                        </div>
                        <div class="contenedor-i">
                            <input type="text" name="tel" class="info" 
                                   value="<%= c[4] %>" readonly />
                        </div>
                    </div>
                    <div class="row-info">
                        <div class="contenedor-t">
                            <label for="correo" class="titulo-info">Correo:</label>
                        </div>
                        <div class="contenedor-i">
                            <input type="text" name="cor" class="info" 
                                   value="<%= c[5] %>" readonly />
                        </div>
                    </div>
                </div>

                <!-- Subtítulo: Datos de la Reserva -->
                <h3 class="text-center">Datos de la Reserva</h3>
                <div class="contenedor-datos">
                    <div class="contenedor-t">
                        <label for="codHab" class="titulo-info">Codigo Habitacion:</label>
                    </div>
                    <div class="contenedor-i">
                        <input type="text" name="codHab" class="info" 
                               value="<%= r[0] %>" readonly />
                    </div>   


                    <div class="contenedor-t">
                        <label for="codHab" class="titulo-info">Tipo:</label>
                    </div>
                    <div class="contenedor-i">
                        <input type="text" name="" class="info" 
                               value="<%= r[1] %>" readonly />
                    </div> 


                    <div class="contenedor-t">
                        <label for="pre" class="titulo-info">Precio:</label>
                    </div>
                    <div class="contenedor-i">
                        <input type="text" name="" class="info" 
                               value="<%= r[2] %>" readonly />
                    </div> 


                    <div class="contenedor-t">
                        <label for="dias" class="titulo-info">Dia:</label>
                    </div>
                    <div class="contenedor-i">
                        <input type="text" name="dias" class="info" 
                               value="<%= r[3] %>" readonly />
                    </div> 

                    <div class="contenedor-t">
                        <label for="feE" class="titulo-info">Fecha Entrada:</label>
                    </div>
                    <div class="contenedor-i">
                        <input type="text" name="feE" class="info" 
                               value="<%= r[4] %>" readonly />
                    </div> 

                    <div class="contenedor-t">
                        <label for="feS" class="titulo-info">Fecha Salida:</label>
                    </div>
                    <div class="contenedor-i">
                        <input type="text" name="feS" class="info" 
                               value="<%= r[5] %>" readonly />
                    </div> 


                    <div class="contenedor-t">
                        <label for="tot" class="titulo-info">Total:</label>
                    </div>
                    <div class="contenedor-i">
                        <input type="text" name="tot" class="info" 
                               value="<%= r[6] %>" readonly/>
                    </div> 
                    <div class="text-center">
                            <input type="submit" name="acc" class="btn" value="Guardar"/>
                    </div>
                </div>
            </form>
            <div class="text-center contenedorbtn">
                <form action="ControlReserva" method="Post" class="d-inline">
                    <input type="submit" name="acc" class="btn" value="Volver"/>
                </form>
            </div>
        </div>
    </body>
</html>
