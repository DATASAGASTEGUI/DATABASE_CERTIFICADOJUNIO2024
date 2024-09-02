package ejemplo1;

import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.SQLException;

public class Principal {

    public static void main(String[] args) {
        Connection conexion = ConexionMysql.obtenerConexion();
        if (conexion != null) {
            String query = "CALL sumar_dos_numeros_1(?,?,?)";
            try {
                CallableStatement cs = conexion.prepareCall(query);
                cs.setInt("n1_i", 5);
                cs.setInt("n2_i", 7);
                cs.registerOutParameter("suma_o", java.sql.Types.INTEGER);
                cs.execute();
                int suma = cs.getInt("suma_o");
                System.out.println("Suma: " + suma);
            } catch (SQLException e) {
                System.out.println("ERROR: QUERY " + e);
            }

        } else {
            System.out.println("ERROR: CONEXION");
        }

    }

}

//cs.registerOutParameter("cantidadregistros", java.sql.Types.INTEGER);