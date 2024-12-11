<%@page import="java.lang.String"%>
<%@page import="presentacion.ModeloHotel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DOCUMENTO</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        
    </head>
    <body>
        <% ModeloHotel modelo = (ModeloHotel) session.getAttribute("modelo"); %>
        <% Object[] r = modelo.getFilR(); %>
        <% Object[] c = modelo.getFila(); %>
        <% String fecha = (String) request.getAttribute("fecha"); %>
        <% String n = (String) request.getAttribute("num"); %>
        
        
        <div class="container mt-5">
            <!-- Título -->
            <h1 class="text-center">DOCUMENTO</h1>
            <form action="ControlReserva" method="post">
                <!-- Código Reserva y Fecha Reserva -->
                <div class="row mb-4">
                    <div class="col-md-6">
                        <label for="cod" class="font-weight-bold">Código Reserva:</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="cod" class="form-control" 
                               value="<%= n != null ? n : "" %>" readonly />
                    </div>
                </div>
                <div class="row mb-4">
                    <div class="col-md-6">
                        <label for="fec" class="font-weight-bold">Fecha Reserva:</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="fec" class="form-control" 
                               value="<%= fecha != null ? fecha : "" %>" readonly />
                    </div>
                </div>

                <!-- Subtítulo: Datos del Cliente -->
                <h3 class="text-center">Datos del Cliente</h3>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="nombre" class="font-weight-bold">Nombre:</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="nom" class="form-control" 
                               value="<%= c[0] %>" readonly />
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="apellido" class="font-weight-bold">Apellido:</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="ape" class="form-control" 
                               value="<%= c[1] %>" readonly />
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="tdocumento" class="font-weight-bold">Tipo de Documento:</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="tdoc" class="form-control" 
                               value="<%= c[2] %>" readonly />
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="dni" class="font-weight-bold">Numero de Documento:</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="numdoc" class="form-control" 
                               value="<%= c[3] %>" readonly />
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="telefono" class="font-weight-bold">Teléfono:</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="tel" class="form-control" 
                               value="<%= c[4] %>" readonly />
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="correo" class="font-weight-bold">Correo:</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="cor" class="form-control" 
                               value="<%= c[5] %>" readonly />
                    </div>
                </div>

                <!-- Subtítulo: Datos de la Reserva -->
                <h3 class="text-center">Datos de la Reserva</h3>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="codHab" class="font-weight-bold">Codigo Habitacion:</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="codHab" class="form-control" 
                               value="<%= r[0] %>" readonly />
                    </div>   


                    <div class="col-md-6">
                        <label for="codHab" class="font-weight-bold">Tipo:</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="" class="form-control" 
                               value="<%= r[1] %>" readonly />
                    </div> 


                    <div class="col-md-6">
                        <label for="pre" class="font-weight-bold">Precio:</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="" class="form-control" 
                               value="<%= r[2] %>" readonly />
                    </div> 


                    <div class="col-md-6">
                        <label for="dias" class="font-weight-bold">Dia:</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="dias" class="form-control" 
                               value="<%= r[3] %>" readonly />
                    </div> 

                    <div class="col-md-6">
                        <label for="feE" class="font-weight-bold">Fecha Entrada:</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="feE" class="form-control" 
                               value="<%= r[4] %>" readonly />
                    </div> 

                    <div class="col-md-6">
                        <label for="feS" class="font-weight-bold">Fecha Salida:</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="feS" class="form-control" 
                               value="<%= r[5] %>" readonly />
                    </div> 


                    <div class="col-md-6">
                        <label for="tot" class="font-weight-bold">Total:</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="tot" class="form-control" 
                               value="<%= r[6] %>" readonly/>
                    </div> 
                    <div class="text-center">
                            <input type="submit" name="acc" class="btn btn-info" value="Guardar"/>
                    </div>
                </div>
            </form>
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
