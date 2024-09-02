<%-- 
    Document   : buscar_mongodb
    Created on : 4 sept 2024, 14:36:43
    Author     : Curso Mañana
--%>

<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>BUSCAR UN DOCUMENTO EN UNA COLECCION</h1>
        <%-- COMPONENTE JAVA --%>
        <%
            // CONEXION CON MONGODB
            String databaseName = "campusfp";
            String serverName = "localhost";//127.0.0.1
            int puerto = 27017;

            // Crear la conexión al servidor de MongoDB
            MongoClient mc = new MongoClient(serverName, puerto);

            // Obtener la base de datos
            MongoDatabase database = mc.getDatabase(databaseName);
            MongoCollection<Document> alumno = database.getCollection("alumno");

            out.print("OK: CONEXION" + "<br><br>");
        %>
        <%  
            // ENTRADA
            String idTrabajador = "";
            // SALIDA
            String nombre = "";
            String edad = "";
            String estatura = "";
            // ACCION
            if (request.getParameter("cmdBuscar") != null) {
                idTrabajador = request.getParameter("txtId");
            }


        %>
        <%-- COMPONENTE VISTA (HTML) --%>
        <form action="buscar_mongodb.jsp" method="post">
            <!-- ENTRADA -->
            Ingresar IdTrabajador? <input type="text" name="txtId" value="<%=idTrabajador%>"/>
            <!-- ACCION -->
            <input type="submit" value="BUSCAR" name="cmdBuscar" />
            <!-- SALIDA -->
            Nombre: <input type="text" name="txtNombre" readonly value="<%=nombre%>"/>
            Edad: <input type="text" name="txtEdad" readonly value="<%=edad%>" />
            Estatura: <input type="text" name="txtEstatura" readonly value="<%=estatura%>"/>
        </form>









    </body>
</html>
