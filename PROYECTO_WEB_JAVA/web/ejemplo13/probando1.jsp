<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession session1 = request.getSession(false);
    String usuario = null;
    if (session != null) {
        usuario = (String) session1.getAttribute("usuario");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                margin: 0;
                padding: 20px;
            }

            h1 {
                text-align: center;
                color: #333;
            }

            .menu-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                margin-top: 20px;
            }

            .menu-item {
                background-color: #ffffff;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                margin: 10px;
                padding: 20px;
                text-align: center;
                width: 200px;
                transition: transform 0.2s;
            }

            .menu-item:hover {
                transform: scale(1.05);
            }

            .menu-item button {
                background-color: #007bff;
                border: none;
                border-radius: 5px;
                color: white;
                cursor: pointer;
                padding: 10px 15px;
                font-size: 16px;
                transition: background-color 0.2s;
            }

            .menu-item button:hover {
                background-color: #0056b3;
            }

            .welcome-message {
                text-align: right;
                margin: 0 20px;
                color: #555;
            }
        </style>
    </head>
    <body>
        <h1>MENU</h1>

        <div class="welcome-message">
            <% if (usuario != null) {%>
            Bienvenido, <%= usuario%> <a href="LogoutServlet" style="color: #007bff;">(Cerrar sesión)</a>
            <% } else { %>
            No has iniciado sesión
            <% }%>
        </div>

        <div class="menu-container">
            <div class="menu-item">
                <form action="Servlet3" method="post">
                    <input type="hidden" name="opcion" value="1">
                    <button type="submit">MOSTRAR PROFESORES</button>
                </form>
            </div>

            <div class="menu-item">
                <form action="Servlet3" method="post">
                    <input type="hidden" name="opcion" value="2">
                    <button type="submit">MOSTRAR ALUMNOS</button>
                </form>
            </div>

            <div class="menu-item">
                <form action="Servlet3" method="post">
                    <input type="hidden" name="opcion" value="3">
                    <button type="submit">MOSTRAR ASIGNATURAS</button>
                </form>
            </div>

            <div class="menu-item">
                <form action="Servlet3" method="post">
                    <input type="hidden" name="opcion" value="4">
                    <button type="submit">MOSTRAR GRUPOS</button>
                </form>
            </div>
        </div>
    </body>
</html>
