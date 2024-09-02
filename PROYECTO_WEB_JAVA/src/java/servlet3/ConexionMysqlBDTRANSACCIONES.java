package servlet3;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConexionMysqlBDTRANSACCIONES {
        public static Connection obtenerConexion() {
        String url = "jdbc:mysql://localhost:3307/bdtransacciones";
        String usuario = "root";
        String clave = "12345678";
        Connection conexion = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (SQLException | ClassNotFoundException e) {
            conexion = null;
        }
        return conexion;
    }
}
