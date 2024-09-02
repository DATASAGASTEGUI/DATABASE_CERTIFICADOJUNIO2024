<%-- 
    Document   : index
    Created on : 17 oct 2024, 9:36:36
    Author     : Curso Mañana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>INICIAR SESION</h1>

        <form action="http://localhost:8080/PROYECTOTIENDA/LoginServlet" method="post">
            <label for="idUserName">Usuario:</label>
            <input type="text" id="idUserName" name="txtUserName" required><br>

            <label for="idPassword">Contraseña:</label>
            <input type="password" id="idPassword" name="txtPassword" required><br>

            <input type="submit" value="Iniciar Sesión">
        </form>
        <% if (request.getAttribute("errorMessage") != null) {%>
        <p style="color:red;"><%= request.getAttribute("errorMessage")%></p>
        <% }%>
    </body>
</html>
