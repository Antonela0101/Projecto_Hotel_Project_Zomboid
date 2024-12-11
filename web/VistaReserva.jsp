<%@page import="presentacion.ModeloHotel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel Virtual</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <h1 class="text-center">Hotel Virtual</h1>
            <% ModeloHotel modelo = (ModeloHotel) session.getAttribute("modelo"); %>
            <% Object[] f = modelo.getFil(); %>
            <% String tot = modelo.getTot(); %>
            <form action="ControlReserva" method="POST">
                <div>
                    <!-- Tabla de habitaciones -->
                    <h3>Datos de la habitación</h3>
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th class="text-center">CodHab</th>
                                <th class="text-center">Tipo</th>
                                <th class="text-center">Precio</th>
                                <th class="text-center">Día</th>
                                <th class="text-center">Fecha Entrada</th>
                                <th class="text-center">Fecha Salida</th>
                                <th class="text-center">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td align="center"><input type="text" name="codHab" class="form-control" size="5" value="<%= f[0] %>" readonly/></td>
                                <td align="center"><input type="text" name="tip" class="form-control" size="10" value="<%= f[1] %>" readonly/></td>
                                <td align="center"><input type="text" name="pre" class="form-control" size="5" value="<%= "S/" + f[2] %>" readonly/></td>
                                <td align="center"><input type="text" name="dia" class="form-control" size="5" value="<%= f[3] %>" readonly/></td>
                                <td align="center"><input type="text" name="feE" class="form-control" size="10" value="<%= f[4] %>" readonly/></td>
                                <td align="center"><input type="text" name="feS" class="form-control" size="10" value="<%= f[5] %>" readonly/></td>
                                <td align="center"><input type="text" name="tot" class="form-control" size="5" value="<%= tot %>" readonly/></td>
                            </tr>
                        </tbody>
                    </table>

                    <!-- Formulario de cliente -->
                    <h3>Datos del Cliente</h3>
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <label for="nom" class="form-label">Nombre</label>
                            <input type="text" id="nom" name="nom" class="form-control" placeholder="Ingrese su nombre">
                        </div>
                        <div class="col-md-4">
                            <label for="ape" class="form-label">Apellido</label>
                            <input type="text" id="ape" name="ape" class="form-control" placeholder="Ingrese su apellido">
                        </div>
                        <div class="col-md-4">
                            <label for="tdoc" class="form-label">Tipo de Documento</label>
                            <select id="tdoc" name="tdoc" class="form-control">
                                <option value="dni" <%= "dni".equals(modelo.getTdoc()) ? "selected" : "" %>>DNI</option>
                                <option value="pasaporte" <%= "pasaporte".equals(modelo.getTdoc()) ? "selected" : "" %>>Pasaporte</option>
                                <option value="carnet de extrajeria" <%= "carnet de extrajeria".equals(modelo.getTdoc()) ? "selected" : "" %>>Carnet de Extranjería</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <label for="numdoc" class="form-label">Número de Documento</label>
                            <input type="text" id="numdoc" name="numdoc" class="form-control" placeholder="Ingrese el número de documento">
                        </div>
                        <div class="col-md-4">
                            <label for="tel" class="form-label">Teléfono</label>
                            <input type="text" id="tel" name="tel" class="form-control" placeholder="Ingrese su teléfono">
                        </div>
                        <div class="col-md-4">
                            <label for="cor" class="form-label">Correo</label>
                            <input type="cor" id="correo" name="cor" class="form-control" placeholder="Ingrese su correo">
                        </div>
                    </div>
                    <div class="text-center">
                        <input type="submit" name="acc" class="btn btn-success" value="Seleccionar Datos"/>
                    </div>
                </div>
            </form>
            <!-- Botones de acciones -->
            <div class="text-center container" style="margin: 15px;">
                <form action="ControlReserva" method="POST" class="d-inline">
                    <input type="submit" name="acc" class="btn btn-info" value="Inicio"/>
                </form>
                <form action="ControlReserva" method="POST" class="d-inline">
                    <input type="submit" name="acc" class="btn btn-info" value="Nueva Reserva"/>
                </form>
                <form action="ControlReserva" method="POST" class="d-inline">
                    <input type="submit" name="acc" class="btn btn-info" value="Listar Habitaciones"/>
                </form>
            </div>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
