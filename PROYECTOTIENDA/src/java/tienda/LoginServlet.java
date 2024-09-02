package tienda;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            Connection conexion = ConexionPostgresqlTienda.obtenerConexion();
            if (conexion != null) {
                out.println("OK: CONEXION");

                String username = request.getParameter("txtUserName");
                String password = request.getParameter("txtPassword");

                if (MetodosCrud.verificarUsuario(conexion, username, password)) {
                    out.println("OK: USUARIO");
                    // Si la autenticación es correcta, creamos una sesión
                    HttpSession session = request.getSession();
                    session.setAttribute("usuario", username);
                    // Redirigir al menú
                    //response.sendRedirect("menu.jsp");
                    request.getRequestDispatcher("menu.jsp").forward(request, response);
                } else {
                    out.println("ERROR: USUARIO");
                    // Si falló, enviar un mensaje de error
                    request.setAttribute("errorMessage", "Usuario o contraseña incorrectos");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            } else {
                out.println("ERROR: CONEXION");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
