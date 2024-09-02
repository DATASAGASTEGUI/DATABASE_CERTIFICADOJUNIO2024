<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        <style>
            .cabecera {
                text-align: center;
                color: white;
                background: black;
            }
            .cuerpo {
                text-align: center;
                color: blue;
            }
            div {
                text-align: center;
                color: red;
                font-family: Courier New;
                font-size: 16px;
            }
        </style>
    </head>
    <body>
        <div><h1>MOSTRAR BASE DE DATOS CLIENTES</h1></div>

        <table border="1" align="center">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>NOMBRE APELLIDO</th>
                    <th>MASCOTAS</th>
                    <th>PAIS</th>
                    <th>PASATIEMPOS</th>
                    <th>CORREO</th>
                    <th>SEXO</th>
                    <th>TELEFONO</th>
                    <th>FECHA Y HORA</th>
                    <th>CLAVE</th>
                    <th>AUTORIZACIÓN</th>
                    <th>BORRAR</th>
                    <th>ACTUALIZAR</th>
                </tr>
            </thead>
            <tbody>

                <%
                    String url = "jdbc:mysql://localhost:3307/bdregistro";
                    String usuario = "root";
                    String claveBD = "12345678";
                    Connection conexion = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conexion = DriverManager.getConnection(url, usuario, claveBD);

                        if (request.getParameter("accion") != null) {
                            String accion = request.getParameter("accion");
                            int idCliente = Integer.parseInt(request.getParameter("idCliente"));

                            if (accion.equals("borrar")) {
                                String sqlDelete = "DELETE FROM cliente WHERE idCliente = ?";
                                PreparedStatement psDelete = conexion.prepareStatement(sqlDelete);
                                psDelete.setInt(1, idCliente);
                                int result = psDelete.executeUpdate();
                                if (result > 0) {
                                    out.println("<script>alert('Cliente borrado exitosamente');</script>");
                                } else {
                                    out.println("<script>alert('Error al borrar el cliente');</script>");
                                }
                                psDelete.close();
                            } else if (accion.equals("actualizar")) {
                                
                                String nombre = request.getParameter("nombreApellido");
                                String mascota = request.getParameter("mascota");
                                String pais = request.getParameter("pais");
                                String pasatiempos = request.getParameter("pasatiempos");
                                String correo = request.getParameter("correo");
                                String sexo = request.getParameter("sexo");
                                String telefono = request.getParameter("telefono");
                                String fechaHora = request.getParameter("fechaHora");
                                String clave = request.getParameter("clave");
                                String autorizacion = request.getParameter("autorizacion");
                                boolean autorizacionBool = autorizacion != null && autorizacion.equals("on");

                                String sqlUpdate = "UPDATE cliente SET nombreApellido=?, mascota=?, pais=?, pasatiempos=?, correo=?, sexo=?, telefono=?, fechaHora=?, clave=?, autorizacion=? WHERE idCliente=?";
                                PreparedStatement psUpdate = conexion.prepareStatement(sqlUpdate);
                                psUpdate.setString(1, nombre);
                                psUpdate.setString(2, mascota);
                                psUpdate.setString(3, pais);
                                psUpdate.setString(4, pasatiempos);
                                psUpdate.setString(5, correo);
                                psUpdate.setString(6, sexo);
                                psUpdate.setString(7, telefono);
                                psUpdate.setString(8, fechaHora);
                                psUpdate.setString(9, clave);
                                psUpdate.setBoolean(10, autorizacionBool);
                                psUpdate.setInt(11, idCliente);

                                int result = psUpdate.executeUpdate();
                                if (result > 0) {
                                    out.println("<script>alert('Cliente actualizado exitosamente');</script>");
                                } else {
                                    out.println("<script>alert('Error al actualizar el cliente');</script>");
                                }
                                psUpdate.close();
                            }
                        }

                        String sql = "SELECT * FROM cliente";
                        PreparedStatement ps = conexion.prepareStatement(sql);
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("idCliente")%></td>
                    <td><%= rs.getString("nombreApellido")%></td>
                    <td><%= rs.getString("mascota")%></td>
                    <td><%= rs.getString("pais")%></td>
                    <td><%= rs.getString("pasatiempos")%></td>
                    <td><%= rs.getString("correo")%></td>
                    <td><%= rs.getString("sexo")%></td>
                    <td><%= rs.getString("telefono")%></td>
                    <td><%= rs.getString("fechaHora")%></td>
                    <td><%= rs.getString("clave")%></td>
                    <td><%= rs.getBoolean("autorizacion")%></td>
                    <td>
                        <form method="post">
                            <input type="hidden" name="idCliente" value="<%= rs.getInt("idCliente")%>">
                            <input type="hidden" name="accion" value="borrar">
                            <input type="submit" value="Borrar">
                        </form>
                    </td>
                    <td>
                        <form method="post">
                            <input type="hidden" name="idCliente" value="<%= rs.getInt("idCliente")%>" required>
                            <input type="text" name="nombreApellido" value="<%= rs.getString("nombreApellido")%>" required>
                            <input type="text" name="mascota" value="<%= rs.getString("mascota")%>" required>
                            <input type="text" name="pais" value="<%= rs.getString("pais")%>" required>
                            <input type="text" name="pasatiempos" value="<%= rs.getString("pasatiempos")%>" required>
                            <input type="text" name="correo" value="<%= rs.getString("correo")%>" required>
                            <input type="text" name="sexo" value="<%= rs.getString("sexo")%>" required>
                            <input type="text" name="telefono" value="<%= rs.getString("telefono")%>" required>
                            <input type="text" name="fechaHora" value="<%= rs.getString("fechaHora")%>" required>
                            <input type="text" name="clave" value="<%= rs.getString("clave")%>" required>
                            <input type="hidden" name="accion" value="actualizar">
                            <input type="submit" value="Actualizar">
                        </form>
                    </td>
                </tr>
                <%
                        }
                        rs.close();
                        ps.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } finally {
                        if (conexion != null) {
                            try {
                                conexion.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
