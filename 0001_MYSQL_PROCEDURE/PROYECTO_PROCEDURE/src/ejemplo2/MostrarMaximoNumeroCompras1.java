package ejemplo2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MostrarMaximoNumeroCompras1 {

    public static void main(String[] args) {
        Connection conexion = ejemplo1.ConexionMysqlTienda.obtenerConexion();
        if (conexion != null) {
            String query = "SELECT obtener_maximo_numero_compras()";
            try {
                PreparedStatement ps = conexion.prepareStatement(query);
                ResultSet rs = ps.executeQuery(query);
                if (rs.next()) {
                    int cantidad = rs.getInt(1);
                    System.out.println("Cantidad: " + cantidad);
                }
            } catch (SQLException e) {
                System.out.println("ERROR: QUERY");
            }
        } else {
            System.out.println("ERROR: CONEXION");
        }
    }
}
