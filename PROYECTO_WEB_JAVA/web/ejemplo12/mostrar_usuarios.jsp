<%@page import="java.util.List"%>
<%@page import="ejemplo12.Crud"%>
<%@page import="ejemplo12.ConexionMysqlBDENCRIPTAR"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            h1 {
                text-align: center;
                color: #333;
                margin-bottom: 20px;
            }

            table {
                width: 80%;
                border-collapse: collapse;
                margin: 0 auto;
                background-color: #fff;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            table, th, td {
                border: 1px solid #ddd;
            }

            th, td {
                padding: 10px;
                text-align: center;
            }

            th {
                background-color: #4CAF50;
                color: white;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #ddd;
            }
        </style>    
    </head>
    <body>
        <div>
            <h1>MOSTRAR USUARIOS</h1>

            <table>
                <thead>
                    <tr>
                        <th>IDUSUARIO</th>
                        <th>NOMBRE</th>
                        <th>LOGIN</th>
                        <th>CLAVE</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection conexion = ConexionMysqlBDENCRIPTAR.obtenerConexion();
                        List<String[]> usuarios_al = Crud.obtenerTodosUsuarios(conexion);

                        for (String[] vector : usuarios_al) {
                    %>        

                    <tr>
                        <td><%=vector[0]%></td>
                        <td><%=vector[1]%></td>
                        <td><%=vector[2]%></td>
                        <td><%=vector[3]%></td>
                    </tr>

                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
