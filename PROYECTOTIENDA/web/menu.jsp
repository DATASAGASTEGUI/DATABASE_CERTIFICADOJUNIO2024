<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //HttpSession session1 = request.getSession(false);
    String usuario = null;
    if (session != null) {
        usuario = (String) session.getAttribute("usuario");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>MENU PRINCIPAL</h1>

        <% if (usuario != null) {%>
        <p>Bienvenido, <%= usuario%></p>
        <a href="http://localhost:8080/PROYECTOTIENDA/LogoutServlet">Cerrar sesión</a>
        <% } else { %>
        <p>No has iniciado sesión</p>
        <% }%>        

        <form action="http://localhost:8080/PROYECTOTIENDA/MenuServlet" method="post">
            <input type="hidden" name="txtOpcion" value="1">
            <button type="submit">MOSTRAR USUARIOS</button>
        </form>

        <form action="http://localhost:8080/PROYECTOTIENDA/MenuServlet" method="post">
            <input type="hidden" name="txtOpcion" value="2">
            <button type="submit">MOSTRAR PRODUCTOS</button>
        </form>
    </body>
</html>
