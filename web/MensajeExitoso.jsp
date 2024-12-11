<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mensaje de Éxito</title>
    </head>
    <body>
        <div class="container mt-5">
            <!-- Mensaje de éxito con botón -->
            <div class="alert alert-success d-flex justify-content-between align-items-center" role="alert">
                <span>¡La reserva ha sido guardada exitosamente!</span>
                <form action="ControlReserva" method="Post" class="d-inline">
                    <input type="submit" name="acc" class="btn btn-light" value="Listo"/>
                </form>
            </div>
        </div>
    </body>
</html>
