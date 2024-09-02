package ejemplo14;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

public class ServerPostgresql extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            Connection conexion = ConexionPostgresqlTienda.obtenerConexion();
            if (conexion != null) {
                out.println("OK: CONEXION");
                String query = "SELECT * FROM Empleado";
                try {
                    PreparedStatement ps = conexion.prepareStatement(query);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        int idEmpleado = rs.getInt(1);
                        String nombre = rs.getString(2);
                        int edad = rs.getInt(3);
                        double estatura = rs.getDouble(4);
                        boolean casado = rs.getBoolean(5);
                        String sexo = rs.getString(6);
                        Date nacimiento = rs.getDate(7);
                        out.println(idEmpleado + " " +
                                    nombre + " " +
                                    edad + " " +
                                    estatura + " " +
                                    casado + " " +
                                    sexo + " " +
                                    nacimiento.toString() + "<br>");
                    }

                } catch (SQLException e) {
                    out.println("ERROR: QUERY");
                }

            } else {
                out.println("ERROR: CONEXION");
            }

            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServerPostgresql</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServerPostgresql at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
