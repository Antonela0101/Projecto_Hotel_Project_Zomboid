<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>@import "CSS/reserva.css";</style>
        <title>Mensaje de Éxito</title>
    </head>
    <body>
        <div class="container">
            <!-- Mensaje de éxito con botón -->
            <div class="alerta" role="alert">
                <span>¡La reserva ha sido guardada exitosamente!</span>
                <form action="ControlReserva" method="Post" class="d-inline">
                    <input type="submit" name="acc" class="btn" value="Listo"/>
                </form>
            </div>
        </div>
    </body>
</html>
