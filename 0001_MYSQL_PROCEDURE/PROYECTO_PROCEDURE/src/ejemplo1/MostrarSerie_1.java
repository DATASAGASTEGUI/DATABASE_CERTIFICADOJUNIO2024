package ejemplo1;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MostrarSerie_1 {

    public static void main(String[] args) {
        // Obtener la conexión
        Connection conexion = ConexionMysql.obtenerConexion();
        // Consulta para ejecutar el procedimiento
        String query = "CALL mostrar_serie_1(?, ?, ?)";

        try {
            // Preparar la llamada al procedimiento almacenado
            CallableStatement cs = conexion.prepareCall(query);

            // Establecer el parámetro de entrada (n)
            cs.setInt(1, 10);  // 'n' es el número de elementos en la serie

            // Registrar el parámetro de salida (sumaSerie)
            cs.registerOutParameter(2, java.sql.Types.INTEGER);

            // Registrar el parámetro de salida para la serie generada (salida)
            cs.registerOutParameter(3, java.sql.Types.VARCHAR);

            // Ejecutar el procedimiento
            boolean hasResultSet = cs.execute();

            // Obtener y mostrar la suma de la serie
            int sumaSerie = cs.getInt(2);
            System.out.println("Suma de la serie: " + sumaSerie);

            // Obtener y mostrar la serie generada
            String salida = cs.getString(3);
            System.out.println("Serie generada: " + salida);

            //RECUPERAR LO DEL SELECT
            if (hasResultSet) {
                ResultSet rs = cs.getResultSet();
                while (rs.next()) {
                    int idAlumno = rs.getInt(1);
                    String nombre = rs.getString(2);

                    System.out.format("%5d %-20s\n", idAlumno, nombre);
                }
                System.out.println("SI HAY RESULTADOS");
            } else {
                System.out.println("NO HAY RESULTADOS");
            }

        } catch (SQLException e) {
            System.out.println("ERROR DE QUERY: " + e.getMessage());
        } finally {
            try {
                // Cerrar la conexión
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
