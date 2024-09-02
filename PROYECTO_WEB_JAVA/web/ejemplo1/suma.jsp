<%-- 
    Document   : suma
    Created on : 4 sept 2024, 12:55:32
    Author     : Walter Ismael Sagástegui Lescano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%-- COMPONENTE JAVA --%>
        <%
            //ENTRADA 
            String numero1 = "";
            String numero2 = "";
            //SALIDA
            String resultado = "";
            //ACCION
            if (request.getParameter("cmdSumar") != null) {
                numero1 = request.getParameter("txtNumero1");
                numero2 = request.getParameter("txtNumero2");
                try {
                    double suma = Double.parseDouble(numero1)
                            + Double.parseDouble(numero2);
                    resultado = suma + "";
                } catch (Exception e) {
                    numero1 = "";
                    numero2 = "";
                    resultado = "";
                }
            }

        %>


        <%-- COMPONENTE VISTA (HTML) --%>
        <form action="suma.jsp" method="post">
            <!-- ENTRADA -->
            Ingrese Número 1? <input type="text" name="txtNumero1" value="<%=numero1%>"/><br><br>
            Ingrese Número 2? <input type="text" name="txtNumero2" value="<%=numero2%>"/><br><br>
            <!-- SALIDA -->
            Resultado: <input type="text" name="txtResultado" value="<%=resultado%>" readonly/><br><br>
            <!-- ACCION(PROCESO) -->
            <input type="submit" value="SUMAR" name="cmdSumar" />
            <input type="submit" value="NUEVO" name="cmdNuevo" />
        </form>
    </body>
</html>
