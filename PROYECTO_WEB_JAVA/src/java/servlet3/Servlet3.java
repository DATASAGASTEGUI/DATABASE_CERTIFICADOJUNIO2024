package servlet3;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.List;
import javax.servlet.http.HttpSession;

public class Servlet3 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("usuario") == null) {
                // Si no hay sesión o no está autenticado, redirigir al login
                response.sendRedirect("login.jsp");
                return;
            }

            String opcion = request.getParameter("opcion");

            Connection conexion = ConexionMysqlBDTRANSACCIONES.obtenerConexion();

            if (conexion != null) {
                if (opcion != null) {
                    switch (opcion) {
                        case "1":
                            List<String> usuarios1_al = Metodos1.showUsers(conexion);
                            request.setAttribute("usuarios1_al", usuarios1_al);
                            /*REDIRECCIONAR EL ARRAY AL JSP*/
                            request.getRequestDispatcher("/ejemplo13/resultado1.jsp").forward(request, response);
                            break;
                        case "2":
                            List<String> usuarios2_al = Metodos1.showUsers(conexion);
                            request.setAttribute("usuarios2_al", usuarios2_al);
                            /*REDIRECCIONAR EL ARRAY AL JSP*/
                            request.getRequestDispatcher("/ejemplo13/resultado2.jsp").forward(request, response);
                            break;
                        case "3":
                            List<String> usuarios3_al = Metodos1.showUsers(conexion);
                            request.setAttribute("usuarios3_al", usuarios3_al);
                            /*REDIRECCIONAR EL ARRAY AL JSP*/
                            request.getRequestDispatcher("/ejemplo13/resultado3.jsp").forward(request, response);
                            break;
                        case "4":
                            List<String> usuarios4_al = Metodos1.showUsers(conexion);
                            request.setAttribute("usuarios4_al", usuarios4_al);
                            /*REDIRECCIONAR EL ARRAY AL JSP*/
                            request.getRequestDispatcher("/ejemplo13/resultado4.jsp").forward(request, response);
                            break;
                    }

                }

                /*
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet Servlet3</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>OK: CONEXION</h1>");
                out.println("</body>");
                out.println("</html>");
                 */
            } else {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet Servlet3</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>ERROR: CONEXION</h1>");
                out.println("</body>");
                out.println("</html>");
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
