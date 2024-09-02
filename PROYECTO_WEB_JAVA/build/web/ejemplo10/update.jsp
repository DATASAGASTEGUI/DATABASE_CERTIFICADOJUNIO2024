<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%
    String url = "jdbc:mysql://localhost:3307/bdregistro";
    String usuario = "root";
    String claveBD = "12345678";
    Connection conexion = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    boolean conexionOK = true;
    boolean queryOK = true;
    String query = "";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>ACTUALIZAR</h1>

        <%
            try {
                int idCliente = Integer.parseInt(request.getParameter("txtIdCliente"));
                String nombreApellido = request.getParameter("txtNombreApellido");

                Class.forName("com.mysql.cj.jdbc.Driver");
                conexion = DriverManager.getConnection(url, usuario, claveBD);

                query = "UPDATE cliente SET nombreApellido = ? WHERE idCliente = ?";
                ps = conexion.prepareStatement(query);
                ps.setString(1, nombreApellido);
                ps.setInt(2, idCliente);

                int n = ps.executeUpdate();
                if (n > 0) {
                    out.println("<input type=text value='UPDATE OK' />");
                } else {
                    out.println("<input type=text value='UPDATE ERROR' />");
                }
            } catch (SQLException e) {
                out.println("<input type=text value='ERROR CONEXION O QUERY' />");
            }

        %>


    </body>
</html>
