package ejemploWalter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.SQLException;

public class Principal1 {

    public static void main(String[] args) {
        Connection conexion = ConexionMysql.obtenerConexion();
        if (conexion != null) {
            System.out.println("OK: CONEXION");
            if (crearTrigger(conexion)) {
                System.out.println("OK: CREAR TRIGGER");
                if (lanzarTrigger(conexion)) {
                    System.out.println("OK: LANZAR TRIGGER");
                } else {
                    System.out.println("ERROR: LANZAR TRIGGER");
                }
            } else {
                System.out.println("ERROR: CREAR TRIGGER");
            }

        } else {
            System.out.println("ERROR: CONEXION");
        }
    }

    public static boolean crearTrigger(Connection conexion) {
        boolean bandera = true;
        String dropTrigger = "DROP TRIGGER IF EXISTS before_insert_empleado;";
        String createTrigger = "CREATE TRIGGER before_insert_empleado\n"
                + "BEFORE INSERT ON Empleado\n"
                + "FOR EACH ROW\n"
                + "BEGIN\n"
                + "    IF NEW.salario < 0 THEN\n"
                + "        SET NEW.salario = 0;\n"
                + "    END IF;\n"
                + "END;";
        try {
            Statement statement = conexion.createStatement();
            // Primero se elimina el trigger existente
            statement.execute(dropTrigger);
            // Luego se crea el nuevo trigger
            statement.execute(createTrigger);

        } catch (SQLException e) {
            bandera = false;
            System.out.println(e);
        }
        return bandera;
    }

    public static boolean lanzarTrigger(Connection conexion) {
        boolean bandera = true;
        String nombre = "Ismael Alva";
        String puesto = "Diseñador";
        double salario = 2455.23;
        String fecha_contratacion = "2023-01-01";
        String query = "INSERT INTO Empleado (nombre, puesto, salario, fecha_contratacion) "
                + "VALUES (?, ?, ?, ?);";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, nombre);
            ps.setString(2, puesto);
            ps.setDouble(3, salario);
            ps.setString(4, fecha_contratacion);
            int filasAfectadas = ps.executeUpdate();
            if (filasAfectadas > 0) {
                System.out.println("OK: INSERT");
            } else {
                System.out.println("ERROR: INSERT");
            }
        } catch (SQLException e) {
            System.out.println(e);
            bandera = false;
        }
        return bandera;
    }

}
