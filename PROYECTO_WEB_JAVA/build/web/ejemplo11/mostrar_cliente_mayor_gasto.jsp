<%@page import="ejemplo1.ConexionMysqlTienda"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--  comentario --%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>MOSTRAR CLIENTE MAYOR GASTO</h1>
        
        <%
            Connection conexion = ConexionMysqlTienda.obtenerConexion();
            String query = "CALL mostrar_cliente_mayor_gasto_total()";
            try {
            // Preparar la llamada al procedimiento almacenado
            CallableStatement cs = conexion.prepareCall(query);

            // Ejecutar el procedimiento
            boolean hasResultSet = cs.execute();

            //RECUPERAR LO DEL SELECT
            if (hasResultSet) {
                ResultSet rs = cs.getResultSet();
                while (rs.next()) {
                    String nombre = rs.getString(1);
                    int cantidad = rs.getInt(2);

                    out.print(nombre);
                    out.print(cantidad);
                }
                System.out.println("SI HAY RESULTADOS");
            } else {
                System.out.println("NO HAY RESULTADOS");
            }

        } catch (SQLException e) {
            System.out.println("ERROR DE QUERY: " + e.getMessage());
        } finally {
            try {
                // Cerrar la conexión
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }


        %>
        
        
        
        
    </body>
</html>
