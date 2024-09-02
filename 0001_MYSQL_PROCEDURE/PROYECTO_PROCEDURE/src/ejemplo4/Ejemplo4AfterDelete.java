package ejemplo4;
import java.sql.*;
public class Ejemplo4AfterDelete {

    public static void main(String[] args) {
        Connection conexion = ConexionMysqlBDTRIGGER.obtenerConexion();
        if(conexion != null) {
           System.out.println("OK: CONEXION");
           String query = "DELETE FROM Usuario WHERE id_usuario = ?";
           try {
                PreparedStatement ps = conexion.prepareStatement(query);
                ps.setInt(1, 4);
                int n = ps.executeUpdate();//Insert, Update, Delete
                if(n > 0) {
                    System.out.println("ELIMINACION OK");
                }else {
                    System.out.println("NO EXISTE USUARIO");
                }
                
           }catch(SQLException e) {
               System.out.println("ERROR: QUERY");
           }
           
           
           
        }else {
           System.out.println("ERROR: CONEXION");
        }
    }
    
}
