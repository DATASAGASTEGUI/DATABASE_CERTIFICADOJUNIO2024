package ejemplo6;

import java.sql.*;

public class PrincipalCommit {

    public static void main(String[] args) {
        Connection conexion = ConexionMysqlBDTRANSACCIONES.obtenerConexion();
        PreparedStatement ps = null;
        if (conexion != null) {
            System.out.println("OK: CONEXION");
            //TRANSACCIONES INSERT
            String query1 = "INSERT INTO Cliente (nombre, email) VALUES ('Arturo','arturo@gmail.com')";
            String query2 = "INSERT INTO Cliente (nombre, email) VALUES ('Carmen','Carmen@gmail.com')";
            try {
                conexion.setAutoCommit(false);//START TRANSACTION

                ps = conexion.prepareStatement(query1);
                int filaAfectada1 = ps.executeUpdate();
                if (filaAfectada1 > 0) {
                    System.out.println("OK: INSERT 1");
                } else {
                    System.out.println("ERROR: INSERT 1");
                }

                ps = conexion.prepareStatement(query2);
                int filaAfectada2 = ps.executeUpdate();
                if (filaAfectada2 > 0) {
                    System.out.println("OK: INSERT 2");
                } else {
                    System.out.println("ERROR: INSERT 2");
                }

                conexion.commit();//CONFIRMAR CAMBIOS
                System.out.println("CAMBIOS CONFIRMADOS: COMMIT");

            } catch (SQLException e) {
                System.out.println("ERROR: TRANSACCION ");
            }

        } else {
            System.out.println("ERROR: CONEXION");
        }
    }
}
