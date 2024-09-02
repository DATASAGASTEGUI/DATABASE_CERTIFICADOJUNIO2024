<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>MOSTRAR USUARIOS</h1>
        <%
            List<String> usuarios_al = (ArrayList) request.getAttribute("usuarios1_al");
            if (usuarios_al != null) {
                for (String usuario : usuarios_al) {
                    out.println(usuario + "<br>");
                }
            }
        %>
    </body>
</html>
