<%@page import="java.util.TreeSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String url = "jdbc:mysql://localhost:3306/bdregistro";
    String usuario = "root";
    String clave = "12345678";
    Class.forName("com.mysql.cj.jdbc.Driver"); //SOLAMENTE PARA WEB
    Connection conexion = DriverManager.getConnection(url, usuario, clave);

    String query = "SELECT * FROM mascota";

    PreparedStatement ps = conexion.prepareStatement(query);
    ResultSet rs = ps.executeQuery();

    Set<String> mascotas_ts = new TreeSet();

    while (rs.next()) {
        mascotas_ts.add(rs.getString(2));
    }


%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>REGISTRAR FORMULARIO</h1>

        <form action='procesar_formulario.jsp'>

            1. Nombre Apellido Cliente: <input type='text' name='txtNombre' />

            2. Lista de selección multiple mascota:
            <select name="lstMascota" multiple="true" size="3">
                <%                for (String descripcion : mascotas_ts) {
                        out.println("<option value=" + descripcion + ">" + descripcion + "</option>");
                    }
                %>
            </select>

            <%
                String query1 = "SELECT idPais, descripcion FROM pais ORDER BY descripcion";
                ps = conexion.prepareStatement(query1);
                rs = ps.executeQuery();
            %>

            <br><br>

            3. Lista de selección simple pais:
            <br><br>
            <select name="cboPais" size="1">
                <%
                    while (rs.next()) {
                        out.println("<option value=" + rs.getString(1) + ">" + rs.getString(2) + "</option>");
                    }
                %>
            </select> 

            <br><br>

            <%
                String query2 = "SELECT descripcion FROM pasatiempo ORDER BY descripcion";
                ps = conexion.prepareStatement(query2);
                rs = ps.executeQuery();
            %>

            <br><br>

            4. Checkbox selección multiple pasatiempo:

            <%
                while (rs.next()) {
                    out.println("<input type='checkbox' name='chbPasatiempo' value='" + rs.getString(1) + "' />" + rs.getString(1));
                }
            %>

            <br><br>

            <p>
                <label for="lblFechaHora">5. Elija una fecha, hora y minutos para su cita:</label>
                <input type="datetime-local" id="txtFechaHora" name="txtFechaHora">
            </p>
            
            <p>
                6. Campo de texto encriptado <input type="password" name="txtClave" />
            </p>            

            <input type='submit' name='cmdRegistrar' value='REGISTRAR' />

        </form>

    </body>
</html>
