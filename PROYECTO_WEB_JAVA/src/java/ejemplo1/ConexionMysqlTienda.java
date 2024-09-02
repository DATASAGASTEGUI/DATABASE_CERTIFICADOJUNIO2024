package ejemplo1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionMysqlTienda {

    public static Connection obtenerConexion() throws ClassNotFoundException {
        String url = "jdbc:mysql://localhost:3306/tienda";
        String usuario = "root";
        String clave = "12345678";
        Connection conexion = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (SQLException e) {
            conexion = null;
        }
        return conexion;
    }
}
