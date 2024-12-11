<%@page import="presentacion.ModeloHotel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>@import "CSS/reserva.css";</style>
        <title>Hotel Virtual</title>
    </head>
    <body>
        <div class="container">
            <h1 class="text-center">Hotel Virtual</h1>
            <% ModeloHotel modelo = (ModeloHotel) session.getAttribute("modelo"); %>
            <% Object[] f = modelo.getFil(); %>
            <% String tot = modelo.getTot(); %>
            <form action="ControlReserva" method="POST">
                <div>
                    <!-- Tabla de habitaciones -->
                    <h3>Datos de la habitación</h3>
                    <table class="table">
                        <tr>
                            <th class="text-center titulos">CodHab</th>
                            <th class="text-center titulos">Tipo</th>
                            <th class="text-center titulos">Precio</th>
                            <th class="text-center titulos">Día</th>
                            <th class="text-center titulos">Fecha Entrada</th>
                            <th class="text-center titulos">Fecha Salida</th>
                            <th class="text-center titulos">Total</th>
                        </tr>
                        <tr>
                            <td align="center"><input type="text" name="codHab" class="dato" size="5" value="<%= f[0] %>" readonly/></td>
                            <td align="center"><input type="text" name="tip" class="dato" size="10" value="<%= f[1] %>" readonly/></td>
                            <td align="center"><input type="text" name="pre" class="dato" size="5" value="<%= "S/" + f[2] %>" readonly/></td>
                            <td align="center"><input type="text" name="dia" class="dato" size="5" value="<%= f[3] %>" readonly/></td>
                            <td align="center"><input type="text" name="feE" class="dato" size="10" value="<%= f[4] %>" readonly/></td>
                            <td align="center"><input type="text" name="feS" class="dato" size="10" value="<%= f[5] %>" readonly/></td>
                            <td align="center"><input type="text" name="tot" class="dato" size="5" value="<%= tot %>" readonly/></td>
                        </tr>
                    </table>

                    <!-- Formulario de cliente -->
                    <h3>Datos del Cliente</h3>
                    <div class="contenedor-cliente">
                        <div class="row">
                            <div class="contenedor-cli">
                                <label for="nom" class="titulo-formulario">Nombre</label>
                                <input type="text" id="nom" name="nom" class="respuesta" placeholder="Ingrese su nombre">
                            </div>
                            <div class="contenedor-cli">
                                <label for="ape" class="titulo-formulario">Apellido</label>
                                <input type="text" id="ape" name="ape" class="respuesta" placeholder="Ingrese su apellido">
                            </div>
                            <div class="contenedor-cli">
                                <label for="tdoc" class="titulo-formulario">Tipo de Documento</label>
                                <select id="tdoc" name="tdoc" class="respuesta tipo">
                                    <option value="dni" <%= "dni".equals(modelo.getTdoc()) ? "selected" : "" %>>DNI</option>
                                    <option value="pasaporte" <%= "pasaporte".equals(modelo.getTdoc()) ? "selected" : "" %>>Pasaporte</option>
                                    <option value="carnet de extrajeria" <%= "carnet de extrajeria".equals(modelo.getTdoc()) ? "selected" : "" %>>Carnet de Extranjería</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="contenedor-cli">
                                <label for="numdoc" class="titulo-formulario">Número de Documento</label>
                                <input type="text" id="numdoc" name="numdoc" class="respuesta" placeholder="Ingrese el número de documento">
                            </div>
                            <div class="contenedor-cli">
                                <label for="tel" class="titulo-formulario">Teléfono</label>
                                <input type="text" id="tel" name="tel" class="respuesta" placeholder="Ingrese su teléfono">
                            </div>
                            <div class="contenedor-cli">
                                <label for="cor" class="titulo-formulario">Correo</label>
                                <input type="text" id="cor" name="cor" class="respuesta" placeholder="Ingrese su correo">
                            </div>
                        </div>
                    </div>
                    <div class="text-center">
                        <input type="submit" name="acc" class="btn" value="Seleccionar Datos"/>
                    </div>
                </div>
            </form>
            <!-- Botones de acciones -->
            <div class="contenedorbtn" style="margin: 15px;">
                <form action="ControlReserva" method="POST">
                    <input type="submit" name="acc" class="btn" value="Inicio"/>
                </form>
                <form action="ControlReserva" method="POST">
                    <input type="submit" name="acc" class="btn" value="Nueva Reserva"/>
                </form>
                <form action="ControlReserva" method="POST">
                    <input type="submit" name="acc" class="btn" value="Listar Habitaciones"/>
                </form>
            </div>
        </div>
        
    </body>
</html>
