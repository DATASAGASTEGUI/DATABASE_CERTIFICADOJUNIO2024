package ejemplo1;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Date;

public class InsertarAlumno {

    public static void main(String[] args) {
        String[][] registros = {
            {"Lucho", "Rodriguez Alva", "daw", "1999-01-10"},  //0: 0 1 2 3
            {"Arturo", "Roncal Alva", "daw", "1998-11-12"},    //1: 0 1 2 3
            {"Jesús", "Zuñiga Contreras", "dam", "1997-11-14"} //2: 0 1 2 3
        };

        Connection conexion = ConexionMysql.obtenerConexion();
        if (conexion != null) {
            String query = "CALL insertar_alumno(?,?,?,?)";
            try {

                for (int i = 0; i < registros.length; i++) {
                    CallableStatement cs = conexion.prepareCall(query);
                    cs.setString("nombre_i", registros[i][0]);
                    cs.setString("apellidos_i", registros[i][1]);
                    cs.setString("grupo_i", registros[i][2]);
                    cs.setDate("fecha_nacimiento_i", Date.valueOf(registros[i][3]));
                    cs.execute();
                }

            } catch (SQLException e) {
                System.out.println("ERROR: QUERY " + e);
            }

        } else {
            System.out.println("ERROR: CONEXION");
        }
    }

}
