package ejemplo1;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MostrarClientesMaximoCompra {

    public static void main(String[] args) {
        // Obtener la conexión
        Connection conexion = ConexionMysqlTienda.obtenerConexion();
        // Consulta para ejecutar el procedimiento
        String query = "CALL mostrar_todos_clientes_maximo_compras()";

        try {
            // Preparar la llamada al procedimiento almacenado
            CallableStatement cs = conexion.prepareCall(query);

            // Ejecutar el procedimiento
            boolean hasResultSet = cs.execute();

            //RECUPERAR LO DEL SELECT
            if (hasResultSet) {
                ResultSet rs = cs.getResultSet();
                while (rs.next()) {
                    String nombre = rs.getString(1);
                    int cantidad = rs.getInt(2);

                    System.out.format("%-20s %5d\n",nombre, cantidad);
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
