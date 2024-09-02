package tienda;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class MetodosCrud {
    
    public static boolean verificarUsuario(Connection conexion, String username, String password) {
        boolean bandera = false;
        String query = "SELECT * FROM Usuario WHERE username = ? AND password = ?";
        try {
             PreparedStatement ps = conexion.prepareStatement(query);
             ps.setString(1, username);
             ps.setString(2, password);
             ResultSet rs = ps.executeQuery();
             if(rs.next()) {
                return true; 
             }else {
                return false;
             }
        }catch(SQLException e) {
             bandera = false;
        }
        
        return bandera;
    }
    
    public static List<Usuario> obtenerListaObjetosUsuario(Connection conexion) {
        List<Usuario> usuarios_al = new ArrayList<>();
        String query = "SELECT * FROM Usuario";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ResultSet rs = ps.executeQuery(query);
            while(rs.next()) {
                Usuario usuario = new Usuario(rs.getInt(1),
                                              rs.getString(2),
                                              rs.getString(3),
                                              rs.getString(4),
                                              rs.getString(5),
                                              rs.getDate(6));
                usuarios_al.add(usuario);
            }
        }catch(SQLException e) {
            usuarios_al = null;
        }
        return usuarios_al;
    }
}
