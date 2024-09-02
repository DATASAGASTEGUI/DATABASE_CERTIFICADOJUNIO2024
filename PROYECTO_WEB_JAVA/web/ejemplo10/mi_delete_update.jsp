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
        <h1>ELIMNAR/ACTUALIZAR</h1>

        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conexion = DriverManager.getConnection(url, usuario, claveBD);
            } catch (SQLException e) {
                conexionOK = false;
            }
        %>

        <%
            if (conexionOK == true) {
                out.println("<input type=text value='CONEXION OK' />");
        %>        


        <%
            // ACCION DEL BOTON DELETE
            if (request.getParameter("delete") != null) {
                int idCliente = Integer.parseInt(request.getParameter("txtIdClienteOculto"));

                query = "DELETE FROM cliente WHERE idCliente = ?";
                ps = conexion.prepareStatement(query);
                ps.setInt(1, idCliente);
                int n = ps.executeUpdate();
                if (n > 0) {
                    out.println("<input type=text value='ELIMINAR OK' />");
                } else {
                    out.println("<input type=text value='ELIMINAR ERROR' />");
                }
            }
        %>

        <%            try {
                query = "SELECT idCliente, nombreApellido FROM cliente";
                ps = conexion.prepareStatement(query);
                rs = ps.executeQuery();
            } catch (SQLException e) {
                queryOK = false;
            }

            if (queryOK == true) {
                out.println("<input type=text value='QUERY OK' />");
                while (rs.next()) {
        %>  


        <br><br>
    <tr>
        <td><%= rs.getInt("idCliente")%></td>
        <td><%= rs.getString("nombreApellido")%></td>
        <td>
            <form action="mi_delete_update.jsp">
                <input type="hidden" name="txtIdClienteOculto" value="<%=rs.getInt("idCliente")%>" />
                <input type="submit" name="delete" value="DELETE" />
            </form>
            <form>
                <input type="hidden" name="txtIdClienteOculto" value="<%=rs.getInt("idCliente")%>" />
                <input type="submit" name="update" value="UPDATE" />
            </form>
        </td>
    </tr>

    <%
        }
    %>

    <%
        // ACCION DEL BOTON UPDATE
        if (request.getParameter("update") != null) {
            int idCliente = Integer.parseInt(request.getParameter("txtIdClienteOculto"));

            query = "SELECT * FROM cliente WHERE idCliente = ?";
            ps = conexion.prepareStatement(query);
            ps.setInt(1, idCliente);
            ResultSet rs1 = ps.executeQuery();
            if (rs1.next()) {
                out.println("<form action='update.jsp'>");
                out.println("<input type='text' name='txtIdCliente' value='" + rs1.getInt("idCliente") + "' readonly />");
                out.println("<input type='text' name='txtNombreApellido' value='" + rs1.getString("nombreApellido") + "' />");
                out.println("<input type=submit name=actualizar value=UPDATE />");
                out.println("</form>");
            }
        }
    %>

    <%
            } else {
                out.println("<input type=text value='QUERY ERROR' />");
            }

        } else {
            out.println("<input type=text value='CONEXION ERROR' />");
        }
    %>


</body>
</html>
