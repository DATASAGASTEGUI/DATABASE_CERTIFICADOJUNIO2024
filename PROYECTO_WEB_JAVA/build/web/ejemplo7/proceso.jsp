<%-- 
    Document   : proceso
    Created on : 10 sept 2024, 10:14:19
    Author     : Curso Mañana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PROCESO</title>
    </head>
    <body>
        <h1>INFORMACION RECIBIDA DEL FORMULARIO</h1>
        <%
            String nombre = "";
            String clave = "";
            String genero = "";
            String autorizacion = "";
            String[] pasatiempos = null;
            String pais = "";
            String[] mascotas = null;
            String correo = "";
            String telefono = "";
            String hora = "";
            String fechaHora = "";
            if (request.getParameter("cmdEnviar") != null) {
                nombre = request.getParameter("txtNombre");
                clave = request.getParameter("txtClave");
                genero = request.getParameter("radioGenero");
                autorizacion = request.getParameter("chbAceptar");
                pasatiempos = request.getParameterValues("chbPasatiempo");
                pais = request.getParameter("cboCodigoPais");
                mascotas = request.getParameterValues("lstMascota");
                correo = request.getParameter("micorreo");
                telefono = request.getParameter("mitelefono");
                hora = request.getParameter("txtHora");
                fechaHora = request.getParameter("fechaHora");
            }
        %>
        <input type="text" value="<%=nombre%>" />
        <input type="text" value="<%=clave%>" />
        <input type="text" value="<%=genero%>" />
        <input type="text" value="<%=autorizacion%>" />
        <br><br>
        <%
            if (pasatiempos != null) {
                for (int i = 0; i < pasatiempos.length; i++) {
                    out.println(pasatiempos[i] + "<br>");
                }
            }
        %>
        <br><br>
        <input type="text" value="<%=pais%>" />
        <br><br>
        <%
            if (mascotas
                    != null) {
                for (int i = 0; i < mascotas.length; i++) {
                    out.println(mascotas[i] + "<br>");
                }
            }
        %>

        <h2>
            PINTAR MASCOTAS EN UNA LISTA
            <%
                if (mascotas
                        != null) {
            %>        

            <select size="<%=mascotas.length%>">
                <%
                    for (int i = 0; i < mascotas.length; i++) {
                        out.println("<option>" + mascotas[i] + "</option>");
                    }
                %>
            </select>

            <%
                }
            %>
        </h2>

        <br><br>

        <h2>
            PINTAR MASCOTAS EN UNA LISTA
            <%
                if (mascotas
                        != null) {
                    out.println("<select size=" + mascotas.length + ">");
                    for (int i = 0; i < mascotas.length; i++) {
                        out.println("<option>" + mascotas[i] + "</option>");
                    }
                    out.println("</select>");
                }
            %>
        </h2>        
        
        <br><br>
        
        Correo: <%=correo%>
        
        <br><br>
        
        Teléfono: <%=telefono%>
        <br><br>
        Hora: <%=hora%>
        <br><br>
        Fecha Hora: <%=fechaHora%>

        <a href="otros_componentes.jsp">VOLVER AL FORMULARIO</a>
    </body>
</html>


CREATE DATABASE IF NOT EXISTS BDREGISTRO;
USE BDREGISTRO;
CREATE TABLE IF NOT EXISTS cliente (
    idCliente INT primary key auto_increment,
    nombre    VARCHAR(20),
    paterno   VARCHAR(30),
    materno   VARCHAR(30),
    clave     VARCHAR(10),
    genero    CHAR(1),
    autorizacion BOOLEAN,
	pasatiempos = null;
            String pais = "";
            String[] mascotas = null;
            String correo = "";
            String telefono = "";
            String hora = "";
            String fechaHora = "";


);

CREATE TABLE IF NOT EXISTS pasatiempo_por_cliente (
    idCliente    int,
    idPasatiempo int,
           primary key(idCliente,idPasatiempo)
);
