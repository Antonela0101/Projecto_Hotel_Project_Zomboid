<%@page import="java.lang.String"%>
<%@page import="presentacion.ModeloAlojamiento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Documento Alojamiento</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <% 
           
            ModeloAlojamiento modelo = (ModeloAlojamiento) session.getAttribute("modelo"); 
            Object[] alojamiento = modelo.getFil();
            Object[] reserva = modelo.getFil();
            String codAlo = (String) session.getAttribute("codAlo");
            String fecAlo = (String) session.getAttribute("fecAlo");
        %>
        
        <div class="container mt-5">
            <!-- Título -->
            <h1 class="text-center">Documento Alojamiento</h1>
            
            <form action="ControlAlojamiento" method="post">
                <!-- Código de Alojamiento y Fecha de Alojamiento -->
                <div class="row mb-4">
                    <div class="col-md-6">
                        <label for="codAlo" class="font-weight-bold">Código Alojamiento:</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="codAlo" class="form-control" 
                               value="<%= codAlo != null ? codAlo : "" %>" readonly />
                    </div>
                </div>
                <div class="row mb-4">
                    <div class="col-md-6">
                        <label for="fecAlo" class="font-weight-bold">Fecha Alojamiento:</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="fecAlo" class="form-control" 
                               value="<%= fecAlo != null ? fecAlo : "" %>" readonly />
                    </div>
                </div>

                <!-- Subtítulo: Datos del Alojamiento -->
                <h3 class="text-center">Datos del Alojamiento</h3>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="codRes" class="font-weight-bold">Código de Reserva:</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="codRes" class="form-control" 
                               value="<%= reserva[0] %>" readonly />
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="codHab" class="font-weight-bold">Código de Habitación:</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="codHab" class="form-control" 
                               value="<%= reserva[1] %>" readonly />
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="precio" class="font-weight-bold">Precio:</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="precio" class="form-control" 
                               value="<%= reserva[2] %>" readonly />
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="fechaEntrada" class="font-weight-bold">Fecha Entrada:</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="fechaEntrada" class="form-control" 
                               value="<%= reserva[4] %>" readonly />
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="fechaSalida" class="font-weight-bold">Fecha Salida:</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="fechaSalida" class="form-control" 
                               value="<%= reserva[5] %>" readonly />
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="dniCliente" class="font-weight-bold">DNI Cliente:</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="dniCliente" class="form-control" 
                               value="<%= reserva[7] %>" readonly />
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="total" class="font-weight-bold">Total (S/.):</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="total" class="form-control" 
                               value="<%= reserva[6] %>" readonly />
                    </div>
                </div>

                <div class="text-center">
                    <input type="submit" name="acc" class="btn btn-info" value="Guardar"/>
                </div>
            </form>

            <div class="text-center mt-4">
                <form action="ControlAlojamiento" method="Post" class="d-inline">
                    <input type="submit" name="acc" class="btn btn-info" value="Volver"/>
                </form>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
