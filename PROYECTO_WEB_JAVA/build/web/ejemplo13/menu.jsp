<%-- 
    Document   : menu
    Created on : 10 oct 2024, 13:24:54
    Author     : RYZEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession session1 = request.getSession(false);
    String usuario = null;
    if (session != null) {
        usuario = (String) session1.getAttribute("usuario");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>MENU</h1>
        <div style="float: right;">
            <% if (usuario != null) { %>
                <p>Bienvenido, <%= usuario %></p>
                <a href="http://localhost:8081/WALTER/LogoutServlet">Cerrar sesión</a>
            <% } else { %>
                <p>No has iniciado sesión</p>
            <% } %>
        </div>        
        
        <a href='http://localhost:8081/WALTER/Servlet3?opcion=1'>MOSTRAR PROFESORES</a><br>
        <a href='http://localhost:8081/WALTER/Servlet3?opcion=2'>MOSTRAR ALUMNOS</a><br>
        <a href='http://localhost:8081/WALTER/Servlet3?opcion=3'>MOSTRAR ASIGNATURAS</a><br>
        <a href='http://localhost:8081/WALTER/Servlet3?opcion=4'>MOSTRAR GRUPOS</a><br>
    
    
    </body>
</html>
