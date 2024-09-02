<%@page import="com.mongodb.client.model.Filters"%>
<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Connection with MongoDB
    String databaseName = "campusfp";
    String serverName = "localhost";
    int puerto = 27017;

    // Create MongoDB client
    MongoClient mc = new MongoClient(serverName, puerto);
    MongoDatabase database = mc.getDatabase(databaseName);
    MongoCollection<Document> alumno = database.getCollection("alumno");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search student</title>
        <style>
            body {
                font-family: Courier New;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                background-color: #f4f4f4;
            }
            .body{
                outline: none;
                border: none;
            }
            .container {
                text-align: center;
                padding: 20px;
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                width: 400px;
                margin: 0 auto;
            }
            h1 {
                color: black;
                font-size: 16px;
                margin-bottom: 20px;
            }
            table {
                margin: 0 auto;
                font-family: Courier New;
                border-collapse: collapse;
                width: 100%; /* Ensures full width of the container */
                text-align: center; /* Center-align the text */
            }
            td {
                padding: 4px;
                font-size: 14px;
                text-align: right; /* Align both columns' content to the center */
            }
            td:first-child{
                width: 45%;
            }
            td:last-child{
                width: 55%;
            }
            input[type="text"] {
                border: none;
                background-color: transparent;
                font-size: 14px;
                text-align: left;
            }
            input[type="submit"] {
                background-color: grey;
                color: white;
                padding: 8px 16px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin-left: 10px;
            }
            .input-container {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 20px;
            }
            input[placeholder]{
                font-family: Courier New;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Search a Document in the Collection</h1>

            <form action="" method="post">
                <!-- Entry -->
                <div class="input-container">
                    Insert worker id: <input type="text" name="txtId" size="2" maxlength="5" placeholder="id" value="<%= request.getParameter("txtId") != null ? request.getParameter("txtId") : ""%>" />
                    <input type="submit" value="Search" name="btnSearch" />
                </div>

                <%
                    // Java Component: MongoDB Connection and Search Logic
                    String id = request.getParameter("txtId");
                    String nombre = "";
                    String edad = "";
                    String estatura = "";
                    boolean showResults = false;

                    if ("Search".equals(request.getParameter("btnSearch")) && id != null && !id.isEmpty()) {

                        // Search the Collection
                        Document query = new Document("idAlumno", id);
                        Document result = alumno.find(query).first();

                        if (result != null) {
                            nombre = result.getString("nombre") != null ? result.getString("nombre") : "No disponible";
                            edad = result.getInteger("edad") != null ? result.getInteger("edad").toString() : "No disponible";
                            estatura = result.getDouble("estatura") != null ? result.getDouble("estatura").toString() : "No disponible";
                            showResults = true;
                        }
                    }

                    if (request.getParameter("btnDelete") != null) {
                        String idAlumno = request.getParameter("txtId");
                        alumno.deleteOne(Filters.eq("idAlumno", idAlumno));
                        out.println("OK: ELIMINAR ALUMNO");
                    }
                %>

                <%-- Conditionally display output fields --%>
                <% if (showResults) { %>
                <table>
                    <% if (id != null && !id.isEmpty()) {%>
                    <tr>
                        <td><strong>Id:</strong></td>
                        <td><input type="text" name="txtIdOutput" readonly value="<%= id%>" /></td>
                    </tr>
                    <% } %>

                    <% if (nombre != null && !nombre.isEmpty() && !"No disponible".equals(nombre)) {%>
                    <tr>
                        <td><strong>Name:</strong></td>
                        <td><input type="text" name="txtName" readonly value="<%= nombre%>" /></td>
                    </tr>
                    <% } %>

                    <% if (edad != null && !edad.isEmpty() && !"No disponible".equals(estatura)) {%>
                    <tr>
                        <td><strong>Age:</strong></td>
                        <td><input type="text" name="txtAge" readonly value="<%= edad%>" /></td>
                    </tr>
                    <% } %>

                    <% if (estatura != null && !estatura.isEmpty() && !"No disponible".equals(estatura)) {%>
                    <tr>
                        <td><strong>Height:</strong></td>
                        <td><input type="text" name="txtEstatura" readonly value="<%= estatura%>" /></td>
                    </tr>
                    <% } %>
                </table>

                <input type="submit" value="Delete" name="btnDelete" />


            </form>
            <% }%>
        </div>
    </body>
</html>
