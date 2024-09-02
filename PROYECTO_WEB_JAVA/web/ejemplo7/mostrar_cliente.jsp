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

    String query = "SELECT * FROM cliente";
    PreparedStatement ps = conexion.prepareStatement(query);
    ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>MOSTRAR TODOS LOS REGISTROS TABLA CLIENTE</h1>

        <%
            Gson gson = new Gson();
            while(rs.next()) {
                 String[] pasatiempos = gson.fromJson(rs.getString("pasatiempos"), String[].class);

        %>
        
                <input type="text" value="<%=rs.getInt("idCliente")%>" size="10"/>
                <input type="text" value="<%=rs.getString("nombreApellido")%>" size="10"/>
                <input type="text" value="<%=rs.getString("pais")%>" size="10"/> 
                <input type="text" value="<%=Arrays.toString(pasatiempos)%>" size="15"/> 
                <input type="text" value="<%=rs.getString("fechaHora")%>" size="15"/> 
                <input type="submit" value="Delete">
                <input type="submit" value="Update"><br>
                
                <%--
                out.println(rs.getInt("idCliente"));
                out.println(rs.getString("nombreApellido"));
                out.println(rs.getString("pais"));
                out.println(rs.getString("pasatiempos"));
                out.println(rs.getString("fechaHora"));
                --%>
        <%
            }
        %>


    </body>
</html>
