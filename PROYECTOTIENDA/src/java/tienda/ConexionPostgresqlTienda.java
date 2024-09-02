package tienda;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionPostgresqlTienda {

    public static Connection obtenerConexion() {
        String url = "jdbc:postgresql://localhost:5432/tienda";
        String usuario = "postgres";
        String clave = "12345678";
        Connection conexion = null;
        try {
            Class.forName("org.postgresql.Driver");
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (SQLException | ClassNotFoundException e) {
            conexion = null;
        }
        return conexion;
    }
}
