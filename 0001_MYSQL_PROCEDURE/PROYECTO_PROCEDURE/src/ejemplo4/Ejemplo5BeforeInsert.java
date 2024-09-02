package ejemplo4;

import java.sql.*;

public class Ejemplo5BeforeInsert {

    public static void main(String[] args) {
        Connection conexion = ConexionMysqlBDTRIGGER.obtenerConexion();
        if (conexion != null) {
            System.out.println("OK: CONEXION");
            if (lanzarTriggerInsert(conexion)) {
                System.out.println("OK: TRIGGER");
            } else {
                System.out.println("ERROR: TRIGGER");
            }
        } else {
            System.out.println("ERROR: CONEXION");
        }
    }

    public static boolean lanzarTriggerInsert(Connection conexion) {
        boolean bandera = true;
        String nombre = "Ismael";
        String clave = "12345678DFASDF";
        String query = "INSERT INTO Usuario (nombre, clave) VALUES (?, ?)";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, nombre);
            ps.setString(2, clave);
            int filasAfectadas = ps.executeUpdate();
            if (filasAfectadas > 0) {
                System.out.println("OK: INSERT");
            } else {
                System.out.println("ERROR: NO SE INSERTO");
            }
        } catch (SQLException e) {
            System.out.println(e);
            bandera = false;
        }
        return bandera;
    }

}
