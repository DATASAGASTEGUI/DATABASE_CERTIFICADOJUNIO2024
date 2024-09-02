package ejemplo5;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionMysqlBDESCUELA {

    public static Connection obtenerConexion() {
        String url = "jdbc:mysql://localhost:3307/bdescuela";
        String usuario = "root";
        String clave = "12345678";
        Connection conexion = null;
        try {
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (SQLException e) {
            conexion = null;
        }
        return conexion;
    }
}
