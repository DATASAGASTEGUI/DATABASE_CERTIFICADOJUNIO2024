<%-- 
    Document   : resultado1
    Created on : 17 oct 2024, 11:57:47
    Author     : Curso Mañana
--%>

<%@page import="java.util.List"%>
<%@page import="tienda.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>MOSTRAR USUARIOS</h1>
        <table>

            <%
                List<Usuario> usuarios_al = (List<Usuario>) request.getAttribute("usuarios_al");
                for (Usuario usuario : usuarios_al) {
                out.println(usuario.getIdUsuario());
            %>       
            <tr>
                <td><%= usuario.getIdUsuario()%></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>   

        <%
            }
        %>


    </body>
</html>
