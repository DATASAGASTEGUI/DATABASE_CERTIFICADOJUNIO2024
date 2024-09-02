<%-- 
    Document   : tabla2
    Created on : 6 sept 2024, 11:10:07
    Author     : RYZEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            h1 {
                color: red;
                font-family: Courier New;
                font-size: 16px;
            }
            div {
                text-align: center;
            }
            input[type=text] {
                font-family: Courier New;
                font-size: 13px;
                border-radius: 5px;
                text-align: center;
                color: blue;
            }
            
            .salida {
                font-family: Courier New;
                font-size: 13px;
                border-radius: 5px;
                text-align: center;
                color: blue;
                width: 25px;
            }
        </style>
    </head>
    <body>
        <div>
            <h1>SELECCIONE LA TABLA DE MULTIPLICAR</h1>
            <%-- COMPONENTE JAVA --%>
            <%
                // ENTRADA
                String n = "";
                boolean bandera = false;
                // ACCION
                if (request.getParameter("cmdAceptar") != null) {
                    try {
                        int num = Integer.parseInt(request.getParameter("txtN"));
                        if (num >= 2 && num <= 12) {
                            n = num + "";
                            bandera = true;
                        }
                    } catch (Exception e) {

                    }
                }
            %>

            <%-- COMPONENTE VISTA (HTML) --%>
            <form>
                <!-- ENTRADA -->
                <input type="text" name="txtN" value="<%=n%>" placeholder="ESCRIBIR NUMERO" />
                <!-- ACCION -->
                <input type="submit" value="ACEPTAR" name="cmdAceptar" />
            </form><br>
            <%
                if (bandera == true) {
                    for (int j = 1; j <= 12; j++) {
            %>
            <%--
            <%=n%> x <%=j%> = <%=Integer.parseInt(n) * j%><br>
            --%>

            <input class="salida" type="text" value="<%=n%>" />
            <input class="salida" type="text" value="*" />
            <input class="salida" type="text" value="<%=j%>" />
            <input class="salida" type="text" value="=" />
            <input class="salida" type="text" value="<%=Integer.parseInt(n) * j%>" /><br>

            <%
                    }
                }
            %>
        </div>
    </body>
</html>
