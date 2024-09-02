package ejemplo5;

import java.sql.*;

public class Principal {

    public static void main(String[] args) {
        Connection conexion = ConexionMysqlBDESCUELA.obtenerConexion();
        if (conexion != null) {
            System.out.println("OK: CONEXION");
            if (crearQueryTrigger(conexion)) {
                System.out.println("OK: CREAR TRIGGER");
            } else {
                System.out.println("ERROR: CREAR TRIGGER");
            }
        } else {
            System.out.println("ERROR: CONEXION");
        }
    }

    public static boolean crearQueryTrigger(Connection conexion) {
        boolean bandera = true;
        PreparedStatement ps = null;

        String queryEliminarTrigger = "DROP TRIGGER IF EXISTS trigger_auditoria_usuario;";
        String queryCrearTrigger = MetodosArchivo.leerQueryTrigger();

        try {
            ps = conexion.prepareStatement(queryEliminarTrigger);
            ps.execute();

            ps = conexion.prepareStatement(queryCrearTrigger);
            ps.execute();

        } catch (SQLException e) {
            bandera = false;
            //e.printStackTrace();
        }
        return bandera;
    }

}
