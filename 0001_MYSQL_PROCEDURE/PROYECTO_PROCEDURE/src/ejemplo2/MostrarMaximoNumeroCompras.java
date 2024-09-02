package ejemplo2;

import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.SQLException;

public class MostrarMaximoNumeroCompras {

    public static void main(String[] args) {
        Connection conexion = ejemplo1.ConexionMysqlTienda.obtenerConexion();
        if(conexion != null) {
           String query = "{ ? = CALL obtener_maximo_numero_compras() }"; 
           
           try {
              CallableStatement cs = conexion.prepareCall(query);
              cs.registerOutParameter(1, java.sql.Types.INTEGER);
              cs.execute();
              int cantidad = cs.getInt(1);
              System.out.println("Cantidad: " + cantidad);
              
           }catch(SQLException e) {
               System.out.println("ERROR: QUERY");
           }
        }else {
            System.out.println("ERROR: CONEXION");
        }
    }
}
