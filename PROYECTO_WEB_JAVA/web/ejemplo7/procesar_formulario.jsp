<%-- 
    Document   : procesar_formulario
    Created on : 11 sept 2024, 15:28:08
    Author     : RYZEN
--%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Arrays"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String url = "jdbc:mysql://localhost:3306/bdregistro";
    String usuario = "root";
    String clave = "12345678";
    Class.forName("com.mysql.cj.jdbc.Driver"); //SOLAMENTE PARA WEB
    Connection conexion = DriverManager.getConnection(url, usuario, clave);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>INFORMACION RECIBIDA DEL FORMULARIO PARA REGISTRAR EN UNA BASE DE DATOS</h1>

        <%  
            String nombreApellido = request.getParameter("txtNombre");
            String[] mascotas = request.getParameterValues("lstMascota");
            String pais = request.getParameter("cboPais");
            String[] pasatiempos = request.getParameterValues("chbPasatiempo");
            String fechaHora = request.getParameter("txtFechaHora");
        %>

        <%=nombreApellido%><br>
        <%=Arrays.toString(mascotas)%><br>
        <%=pais%><br>
        <%=Arrays.toString(pasatiempos)%><br>
        <%=fechaHora%><br>
        
        <%
            try {
                 String query = "INSERT INTO cliente (idCliente,nombreApellido,mascota,pais,pasatiempos,fechaHora,correo,sexo,telefono,password_,autorizacion) "
                        + "VALUES (NULL,?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement ps = conexion.prepareStatement(query);
                ps.setString(1, nombreApellido);

                Gson gson = new Gson();
                String mascotasJSON = gson.toJson(mascotas);
                ps.setString(2, mascotasJSON);

                ps.setString(3, pais);

                String pasatiemposJSON = gson.toJson(pasatiempos);
                ps.setString(4, pasatiemposJSON);
                
                ps.setString(5, fechaHora);
                
                ps.setString(6, "");
                
                ps.setString(7, "");
                
                ps.setString(8, "");
                
                ps.setString(9, "");
                
                ps.setBoolean(10, false);

                ps.executeUpdate();
                out.println("OK: INSERT");
            } catch (Exception e) {
                out.println("ERROR: INSERT");
            }
        %>


    </body>
</html>
