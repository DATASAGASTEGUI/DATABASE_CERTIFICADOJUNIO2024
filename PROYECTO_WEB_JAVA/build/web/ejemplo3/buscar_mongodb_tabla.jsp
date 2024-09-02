<%-- 
    Document   : tablaAlumno
    Created on : 6 sept 2024, 13:31:34
    Author     : Jorge
--%>

<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="com.mongodb.client.model.Filters"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //CONEXION CON MONGODB
    String databaseName = "campusfp";
    String serverName = "localhost";//127.0.0.1
    int puerto = 27017;

    // Crear la conexión al servidor de MongoDB
    MongoClient mc = new MongoClient(serverName, puerto);

    // Obtener la base de datos
    MongoDatabase database = mc.getDatabase(databaseName);
    MongoCollection<Document> alumno = database.getCollection("alumno");

    //out.println("OK CONEXION" + "<br><br>");
%>    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .cabecera {
                border:none;
                text-align:center;
                outline: none;
                color: white;
                background-color: black;
                width: 12%;
                font-size: 12px;
            }

            .cuerpo {
                border:none;
                text-align:center;
                color: blue;
                width: 12%;
                outline: none;
                font-size: 12px;
            }

            div {
                text-align: center;
            }

            h1 {
                color: red;
                font-family: Courier New;
                font-size: 16px;
            }

        </style>    
    </head>
    <body>
        <div>
            <h1>BUSCAR UN DOCUMENTO EN UNA COLECCION</h1>
            <%-- COMPONENTE JAVA --%>
            
            
            
            <%-- COMPONENTE VISTA (HTML) --%>
            <form>
                <!-- ENTRADA -->
                <input type="text" name="txtId" />
                <!-- ACCION -->
                <input type="submit" value="BUSCAR" name="cmdBuscar" />
            </form>
            
            
            
            <input type="text" value="IDALUMNO" class="cabecera" readonly />
            <input type="text" value="NOMBRE" class="cabecera" readonly/>
            <input type="text" value="EDAD" class="cabecera" readonly/>
            <input type="text" value="ESTATURA" class="cabecera" readonly/><br>
            <%
                String idAlumno = "";
                String nombre = "";
                int edad = 0;
                double estatura = 0.0;
                try (MongoCursor<Document> cursor = alumno.find().iterator()) {
                    while (cursor.hasNext()) {
                        Document doc = cursor.next();
                        //out.println(doc.toJson()+"<br>");
                        //out.println("ID: " + doc.getString("alumno"));
                        idAlumno = doc.getString("idAlumno");
                        nombre = doc.getString("nombre");
                        edad = doc.getInteger("edad");
                        estatura = doc.getDouble("estatura");
            %>
            <input type="text" value="<%=idAlumno%>" class="cuerpo" readonly />
            <input type="text" value="<%=nombre%>" class="cuerpo" readonly />
            <input type="text" value="<%=edad%>" class="cuerpo" readonly />
            <input type="text" value="<%=String.format("%.2f", estatura)%>" class="cuerpo" readonly /><br>
            <%
                    }
                }
            %>
        </div>
    </body>
</html>

