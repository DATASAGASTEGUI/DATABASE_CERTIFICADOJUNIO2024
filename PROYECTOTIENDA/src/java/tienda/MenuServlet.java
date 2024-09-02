package tienda;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MenuServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("usuario") == null) {
                // Si no hay sesión o no está autenticado, redirigir al login
                //response.sendRedirect("index.jsp");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            }
            
            java.sql.Connection conexion = ConexionPostgresqlTienda.obtenerConexion();

            String opcion = request.getParameter("txtOpcion");

            switch (opcion) {
                case "1": 
                    List<Usuario> usuarios_al = MetodosCrud.obtenerListaObjetosUsuario(conexion);
                    request.setAttribute("usuarios_al", usuarios_al);
                    request.getRequestDispatcher("resultado1.jsp").forward(request, response);
                    break;
                case "2":
                    request.getRequestDispatcher("resultado2.jsp").forward(request, response);
                    break;
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

    private static class Connection {

        public Connection() {
        }
    }

}
