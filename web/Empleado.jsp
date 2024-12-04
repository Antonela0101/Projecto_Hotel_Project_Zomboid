<%-- 
    Document   : Empleado
    Created on : 03-dic-2024, 19:03:45
    Author     : arian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>@import "CSS/Emp.css";</style>
    </head>
    <body>
        <%@include file="Header.jsp"%>
        
        <section>
            <article class="Portal">
                
                    <div class="PZ">
                        <span>Bienvenido</span>
                    </div>
                
            </article>
            <article class="mod" >
                
                <div class="log" >
                    <h2>Hotel</h2>
                    <p>
                        Inicie sesion con su usuario y contraseña asignadas
                    </p>
                    <form action="CSE" method="POST">
                        <p>
                            <input type="Text" name="Userr" placeholder="Usuario">
                            <input type="Text" name="Pass" placeholder="Contraseña">
                        <p>
                        <input type="submit" name="TW" value="Iniciar Sesion" >
                    </form>
                </div>
                
                <div class="pp">
                    <h3>Problemas al momento de acceder?</h3>
                    <p>Contacta a soporte tecnico al email: soporte@soporteHotel.com</p>
                    <p>o comunicate por telefono al: 999 999 999</p>
                    <br>
                    
                    <h3>Noticias Internas</h3>
                    
                    <p>Mantenimiento programado del sistema: 5 de diciembre.</p>
                    <p>Nueva política de horarios disponibles en recursos humanos.</p><br>
                    <br><br><br><br><br><br>
                    <p>Mantenimiento programado del sistema: 5 de diciembre.</p>
                    <p>Nueva política de horarios disponibles en recursos humanos.</p><br>
                    
                </div>
            </article>
            
                     

            
        </section>
        
        
    </body>
    <%@include file="Footer.jsp" %>
</html>
