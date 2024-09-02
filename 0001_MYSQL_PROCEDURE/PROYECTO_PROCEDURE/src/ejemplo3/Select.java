package ejemplo3;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Select {

    public static void main(String[] args) {
        Connection conexion = ConexionMysqlBDENCRIPTAR.obtenerConexion();
        if (conexion != null) {

            //String query = "SELECT nombre, CAST(login AS CHAR) AS LOGIN1, clave FROM Usuario";

            String query = "SELECT nombre, login, CAST(AES_DECRYPT(clave, CONCAT(obtener_palabra_secreta(), '%')) AS CHAR) AS NOMBRECOLUMNA FROM Usuario\n" +
"WHERE idUsuario = 2;";
            try {
                PreparedStatement ps = conexion.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while(rs.next()) {
                    String nombre = rs.getString("nombre");
                    String login = rs.getString("login");
                    String clave = rs.getString("NOMBRECOLUMNA");
                    //System.out.format("%-15s %-15s %-255s\n", nombre,login,clave);
                    System.out.println(nombre + "    " + login + "   " + clave);
                }
                System.out.println("OK: SELECT");

            } catch (SQLException e) {
                System.out.println("ERROR: QUERY INSERT " + e);
            }

            System.out.println("OK: CONEXION");
        } else {
            System.out.println("ERROR: CONEXION");
        }
    }

}
